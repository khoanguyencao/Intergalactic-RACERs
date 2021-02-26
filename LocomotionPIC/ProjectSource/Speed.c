/*----------------------------- Include Files -----------------------------*/
// This module
#include "../ProjectHeaders/Speed.h"

// Hardware
#include <xc.h>
#include <proc/p32mx170f256b.h>
#include <sys/attribs.h> // for ISR macros

// Event & Services Framework
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "ES_DeferRecall.h"
#include "ES_Port.h"
#include "ES_Events.h"

#include <stdbool.h>

/*----------------------------- Module Defines ----------------------------*/
// these times assume a 10.000mS/tick timing
#define PERIOD 1250
#define RPM_SCALE 5208
#define PI_PERIOD 12500
#define MAX_RPM 70

#define LEFT 0
#define RIGHT 1
#define FORWARD 2
#define BACKWARD 3
#define FWD_SPEED 96// speed for going straight forward(in duty cycles)
#define BKWD_SPEED 50// speed for going straight backward
#define TURN_SPEED_1 50// speed for turning the racer on one wheel 
#define TURN_SPEED_2 96// speed for turning racer on other wheel 
#define CIRC_L_SPEED 82// speed for left wheel when following the path
#define CIRC_R_SPEED 96// speed for right wheel when following the path
#define STOP_SPEED 5// speed for stopping the racer
#define PWM_PERIOD 1355 // from 1/time constant
#define ENCODER_TO_RPM 333333.33  // converts encoder period to RPM
#define DC_TO_RPM 9.6
#define KP 0.2	// integral term
#define KI 1.2	// gain term

/*---------------------------- Module Variables ---------------------------*/
static uint8_t MyPriority;
static volatile uint16_t rolloverL; // number of timer rollover since last IC
static volatile uint16_t rolloverR;
static volatile uint16_t capTimeL;  // captured IC time
static volatile uint16_t capTimeR;
static volatile uint16_t lastTimeL = 0; // last IC time
static volatile uint16_t lastTimeR = 0;
static volatile uint16_t currTimeL; // actual time with rollover accounted for
static volatile uint16_t currTimeR;

static volatile float targetDC_L;   // from SetSpeed(), used in control law
static volatile float targetDC_R;   // from SetSpeed(), used in control law
static volatile float period_L;     // from encoder IC, used in control law
static volatile float period_R;     // from encoder IC, used in control law

static volatile CombTime_t combTimeL; // combined IC time with rollover counted
static volatile CombTime_t combTimeR;

static LocoState_t CurrentState;

// private function declarations
void FollowCircle(void);
void TurnLeft(void);
void TurnRight(void);
void DriveForward(void);
void DriveBackward(void);
void Stop(void);
void SetSpeed(uint8_t wheel, uint8_t drive, uint8_t dutycycle);
void InitLeftPWM(void);
void InitRightPWM(void);
void InitTimer2();
void InitTimer3(void);
void InitTimer5(void);
void InitInputCapture4(void);
void InitInputCapture5(void);
static void InitSPI();

/*------------------------------ Module Code ------------------------------*/
/****************************************************************************
 Function
     InitLocomotion

 Parameters
     uint8_t : the priority of this service

 Returns
     bool, false if error in initialization, true otherwise

 Description
     Saves away the priority, and does any other required initialization for 
     this service. Initializes Timer2, Timer3, Timer5, IC4, IC5, OC1, OC4.
****************************************************************************/
bool InitLocomotion(uint8_t Priority){
    // Initialize the MyPriority variable with the passed in parameter.
    MyPriority = Priority;
    // initialize rollover counters
    rolloverL = 0;
    rolloverR = 0;
    CurrentState = InitPState;
    
    // disable analog select
    ANSELA = 0;
    ANSELB = 0;
    
    // enable interrupts globally
    __builtin_enable_interrupts();
    // set up for multiple interrupt vectors
//    INTCONbits.MVEC = 1;
    
    InitTimer2();     // initialize Timer2 for rollover counting, IC4 and IC5
    InitTimer3();     // initialize Timer3 for OC1 and OC4
    InitTimer5();     // initialize Timer5 for PID control
    
    InitLeftPWM();    // initialize OC1 for left wheel PWM
    InitRightPWM();   // initialize OC4 for right wheel PWM
    
    InitInputCapture4();
    //InitInputCapture5();

    InitSPI();        // initialize SPI system
    
    // Post Event ES_Init to TimeCapture queue (this service)
    ES_Event_t ThisEvent;
    ThisEvent.EventType = ES_INIT;
    
    
    if (ES_PostToService(MyPriority, ThisEvent) == true)
    {
      return true;
    }
    else
    {
      return false;
    }
}



/****************************************************************************
 Function
     PostMotorService

 Parameters
     ES_Event ThisEvent, the event to post to the queue

 Returns
     bool false if the Enqueue operation failed, true otherwise

 Description
     Posts an event to this state machine's queue
****************************************************************************/
bool PostLocomotion(ES_Event_t ThisEvent)
{
    return ES_PostToService(MyPriority, ThisEvent);
}



/****************************************************************************
 Function
    RunLocomotion

 Parameters
   ES_Event : the event to process. Event type should be ES_TIMEOUT

 Returns
   ES_Event, ES_NO_EVENT if no error, ES_ERROR otherwise
 
 Description
 Run the motor at different states depending on key presses
****************************************************************************/
ES_Event_t RunLocomotion(ES_Event_t ThisEvent)
{
  ES_Event_t ReturnEvent;
  ReturnEvent.EventType = ES_NO_EVENT; // assume no errors

  switch (CurrentState)
  {
    case InitPState:        // If current state is initial Pseudo State
    {
        if (ThisEvent.EventType == ES_INIT){
            puts("Locomotion Service:");
            printf("\rES_INIT received in Service %d\r\n", MyPriority);
            // go to running state
            CurrentState = Running;
        }
    }
    break;

    case Running:       
    {
      if (ThisEvent.EventType == ES_PRINT)
      {
          printf("L %u\r\n", combTimeL.byBytes.high);
          printf("R %u\r\n", combTimeR.byBytes.high);
      }
      if (ThisEvent.EventType == ES_GOFORWARD)
      {
          DriveForward();
      }
      if (ThisEvent.EventType == ES_GOBACKWARD)
      {
          DriveBackward();
      }
      if (ThisEvent.EventType == ES_TURNLEFT)
      {
          TurnLeft();
      }
      if (ThisEvent.EventType == ES_TURNRIGHT)
      {
          TurnRight();
      }
      if (ThisEvent.EventType == ES_STOP)
      {
          Stop();
      }
      if (ThisEvent.EventType == ES_FOLLOWCIRCLE)
      {
          FollowCircle();
      }
    }
    break;
    
    default:
    {}
    break;
  }                                   // end switch on Current State
  return ReturnEvent;
}



/*--------------------------- Private Functions ---------------------------*/
// robot drives in a circle of radius 1m
void FollowCircle(void){
//  LATAbits.LATA2 = 1;     // set AIN1 high
//  LATAbits.LATA3 = 0;     // set AIN2 low
//  OC1RS = ((CIRC_L_SPEED*PWM_PERIOD)/100) - 1;   // set new speed
//
//  LATBbits.LATB10 = 1;    // set BIN1 high
//  LATBbits.LATB11 = 0;    // set BIN2 low
//  OC4RS = ((CIRC_L_SPEED*PWM_PERIOD)/100) - 1;   // set new speed
    
    SetSpeed(LEFT, FORWARD, CIRC_L_SPEED);
    SetSpeed(RIGHT, FORWARD, CIRC_R_SPEED);
}

// robot turns left
void TurnLeft(void){
  LATAbits.LATA2 = 1;     // set AIN1 high
  LATAbits.LATA3 = 0;     // set AIN2 low
  OC1RS = ((TURN_SPEED_1*PWM_PERIOD)/100) - 1;   // set new speed

  LATBbits.LATB10 = 1;    // set BIN1 high
  LATBbits.LATB11 = 0;    // set BIN2 low
  OC4RS = ((TURN_SPEED_2*PWM_PERIOD)/100) - 1;   // set new speed
    
//    SetSpeed(LEFT, FORWARD, TURN_SPEED_1);
//    SetSpeed(RIGHT, FORWARD, TURN_SPEED_2);
}

// robot turns right
void TurnRight(void){
  LATAbits.LATA2 = 1;     // set AIN1 high
  LATAbits.LATA3 = 0;     // set AIN2 low
  OC1RS = ((TURN_SPEED_2*PWM_PERIOD)/100) - 1;   // set new speed

  LATBbits.LATB10 = 1;    // set BIN1 high
  LATBbits.LATB11 = 0;    // set BIN2 low
  OC4RS = ((TURN_SPEED_1*PWM_PERIOD)/100) - 1;   // set new speed
    
//    SetSpeed(LEFT, FORWARD, TURN_SPEED_2);
//    SetSpeed(RIGHT, FORWARD, TURN_SPEED_1);
}

// robot drives forward
void DriveForward(void){
//  LATAbits.LATA2 = 1;     // set AIN1 high
//  LATAbits.LATA3 = 0;     // set AIN2 low
//  OC1RS = ((FWD_SPEED*PWM_PERIOD)/100) - 1;   // set new speed
//
//  LATBbits.LATB10 = 1;    // set BIN1 high
//  LATBbits.LATB11 = 0;    // set BIN2 low
//  OC4RS = ((FWD_SPEED*PWM_PERIOD)/100) - 1;   // set new speed
    
    SetSpeed(LEFT, FORWARD, FWD_SPEED);
    SetSpeed(RIGHT, FORWARD, FWD_SPEED);
}

// robot drives backwards
void DriveBackward(void){
    LATAbits.LATA2 = 0;     // set AIN1 low
    LATAbits.LATA3 = 1;     // set AIN2 high
    OC1RS = ((BKWD_SPEED*PWM_PERIOD)/100) - 1;   // set new speed
    LATBbits.LATB10 = 0;    // set BIN1 low
    LATBbits.LATB11 = 1;    // set BIN2 high
    OC4RS = ((BKWD_SPEED*PWM_PERIOD)/100) - 1;   // set new speed
    
//    SetSpeed(LEFT, BACKWARD, BKWD_SPEED);
//    SetSpeed(RIGHT, BACKWARD, BKWD_SPEED);
}

// robot stops
void Stop(void){
    OC1RS = 0;   // set new speed
    OC4RS = 0;   // set new speed
    
//    SetSpeed(LEFT, FORWARD, STOP_SPEED);
//    SetSpeed(RIGHT, FORWARD, STOP_SPEED);
}

// sets the left or right motor to a specified speed
void SetSpeed(uint8_t wheel, uint8_t drive, uint8_t dutycycle){
    //**************************** Left Wheel Speed **************************//
    if (wheel == LEFT){
        if (drive == FORWARD){
            LATAbits.LATA2 = 1;     // set AIN1 high
            LATAbits.LATA3 = 0;     // set AIN2 low
            targetDC_L = ((dutycycle*PWM_PERIOD)/100) - 1;   // set new speed
        }
        
        if (drive == BACKWARD){
            LATAbits.LATA2 = 0;     // set AIN1 low
            LATAbits.LATA3 = 1;     // set AIN2 high
            targetDC_L = ((dutycycle*PWM_PERIOD)/100) - 1;   // set new speed
        }
        
    }
    //*************************** Right Wheel Speed **************************//
    if (wheel == RIGHT){
        if (drive == FORWARD){
            LATBbits.LATB10 = 1;    // set BIN1 high
            LATBbits.LATB11 = 0;    // set BIN2 low
            targetDC_R = ((dutycycle*PWM_PERIOD)/100) - 1;   // set new speed
        }
        
        if (drive == BACKWARD){
            LATBbits.LATB10 = 0;    // set BIN1 low
            LATBbits.LATB11 = 1;    // set BIN2 high
            targetDC_R = ((dutycycle*PWM_PERIOD)/100) - 1;   // set new speed
        }  
    }
}

// updates left and right PWM control every 5ms
void __ISR(_TIMER_5_VECTOR, IPL6SOFT) Timer5ControlLawISR(void){
    static float targetRPM_L;       // stores target left motor RPM 
    static float targetRPM_R;       // stores target right motor RPM 
    static float RPM_L = 0;         // stores actual left motor RPM
    static float RPM_R = 0;         // stores actual right motor RPM
    static float RPMerror_L = 0;    // stores left RPM error amount
    static float RPMerror_R = 0;    // stores right RPM error amount
    static float sumerror_L = 0;    // stores left sum of RPMerror
    static float sumerror_R = 0;    // stores right sum of RPMerror
    static float requestedduty_L;   // stores control law left motor DC 
    static float requestedduty_R;   // stores control law right motor DC
    
    IFS0CLR = _IFS0_T5IF_MASK;      // clear interrupt
    
    // cast IC time from encoder to float for calculations
    period_L = (float)combTimeL.asTime;
    period_R = (float)combTimeR.asTime;
    
    // don't run control law until we have a valid period
    if ((period_L == 0) || (period_R == 0)){
        return;
    }
    
    // Left Wheel Control
    targetRPM_L = (targetDC_L * DC_TO_RPM);     // calculate target RPM
    RPM_L = (float)(ENCODER_TO_RPM / period_L); // calculate actual RPM
    RPMerror_L = targetRPM_L - RPM_L;           // set RPMerror = targetRPM - RPM
	sumerror_L += RPMerror_L;                   // update sum of error
	requestedduty_L = (KP*((RPMerror_L) + (KI*sumerror_L))); // calculate new DC
    
    // if we need duty cycle to be higher
    if (requestedduty_L > 100){
        requestedduty_L = 100;          // set requested DC to 100
        sumerror_L -= RPMerror_L;       // anti-windup
    }
    // else if we need duty cycle to be lower
    else if (requestedduty_L < 0){
        requestedduty_L = 0;            // set requested DC to 0
        sumerror_L -= RPMerror_L;       // anti-windup
    }
    // write duty cycle
    OC1RS = (uint16_t)((requestedduty_L * PWM_PERIOD)/100);  
    
    // Right Wheel Control
    targetRPM_R = (targetDC_R * DC_TO_RPM);     // calculate target RPM
    RPM_R = (float)(ENCODER_TO_RPM / period_R); // calculate actual RPM
    RPMerror_R = targetRPM_R - RPM_R;           // set RPMerror = targetRPM - RPM
	sumerror_R += RPMerror_R;                   // update sum of error
	requestedduty_R = (KP*((RPMerror_R) + (KI*sumerror_R))); // calculate new DC

    // if we need duty cycle to be higher
    if (requestedduty_R > 100){
        requestedduty_R = 100;          // set requested DC to 100
        sumerror_R -= RPMerror_R;       // anti-windup
    }
    // else if we need duty cycle to be lower
    else if (requestedduty_R < 0){
        requestedduty_R = 0;            // set requested DC to 0
        sumerror_R -= RPMerror_R;       // anti-windup
    }
    // write duty cycle
    OC4RS = (uint16_t)((requestedduty_R * PWM_PERIOD)/100); 
}



// initializes RB7 to output PWM for the left motor
void InitLeftPWM(void){
    TRISBbits.TRISB7 = 0;           // set RB7 as left wheel PWM output
    RPB7R = 0b0101;                 // set RB7 to OC1
    TRISAbits.TRISA2 = 0;          // set RA2 as left wheel AIN1 
    TRISAbits.TRISA3 = 0;           // set RA3 as left wheel AIN2
    
    OC1CONbits.ON = 0;              // turn off output compare
    OC1CONbits.SIDL = 0;            // disable idle mode
   	OC1CONbits.OC32 = 0;            // use 16 bit timer source
    OC1CONbits.OCTSEL = 1;          // use Timer 3 as clock source
    OC1CONbits.OCM = 0b110;         // use PWM mode with faults disabled
    OC1RS = (PWM_PERIOD / 2) -1;    // set OC1RS duty cycle ~50%
    OC1R = (PWM_PERIOD / 2) -1;     // set OC1R duty cycle ~50%
    OC1CONbits.ON = 1;              // turn on output compare
}

// initializes RB6 to output PWM for the right motor
void InitRightPWM(void){
    TRISBbits.TRISB6 = 0;           // set RB6 as right wheel PWM output
    RPB6R = 0b0101;                 // set RB6 to OC1
    TRISBbits.TRISB10 = 0;          // set RB10 as right wheel BIN1
    TRISBbits.TRISB11 = 0;            // set RB12 as right wheel BIN2
	
    OC4CONbits.ON = 0;              // turn off output compare
    OC4CONbits.SIDL = 0;            // disable idle mode
    OC4CONbits.OC32 = 0;            // use 16 bit timer source
    OC4CONbits.OCTSEL = 1;          // use Timer 3 as clock source
    OC4CONbits.OCM = 0b110;         // use PWM mode with faults disabled
    OC4RS = (PWM_PERIOD / 2) - 1;   // set OC1RS duty cycle ~50%
    OC4R = (PWM_PERIOD / 2) -1;     // set OC1R duty cycle ~50%
    OC4CONbits.ON = 1;              // turn on output compare
}


 //function to set up Timer 2 for IC4, IC5
void InitTimer2(void){
    T2CONbits.ON = 0;               // disable timer
    T2CONbits.TCS = 0;              // select internal PBCLK source
    //T2CONbits.TCKPS = 0b111;        // select 1:256 prescale
    
    T2CONbits.TCKPS = 0b010;        // select 1:4 prescale
    
    T2CONbits.TGATE = 0;            // Disable timer 5 TGATE
    TMR2 = 0;                       // clear timer 2 register
    PR2 = 0xFFFF;                   // set period register to max period
    IPC2bits.T2IP = 6;              // set interrupt priority to 6
    IFS0CLR = _IFS0_T2IF_MASK;		// clear any pending interrupt
    IEC0SET = _IEC0_T2IE_MASK;		// local enable
    T2CONbits.ON = 1;               // enable timer
}

// interrupt response routine for Timer 2 overflows
void __ISR(_TIMER_2_VECTOR, IPL6SOFT) Timer2OverflowISR(void){
    IFS0CLR = _IFS0_T2IF_MASK;		// clear interrupt
    rolloverL++;
    rolloverR++;
    
    //combTimeL.byBytes.high++;       // increment rollover counter
    //combTimeR.byBytes.high++;       // increment rollover counter
}


// function to set up Timer 3 for Output Compare 1 and 4
void InitTimer3(void){
    T3CONbits.ON = 0;               // disable timer
    T3CONbits.TCS = 0;              // select internal PBCLK source
    T3CONbits.TCKPS = 0b010;        // select 1:4 prescale
    TMR3 = 0;                       // clear timer 3 register
    PR3 = PWM_PERIOD;               // set period register
    T3CONbits.ON = 1;               // enable timer
}

// function to set up Timer 5 for control law
void InitTimer5(void){
    T5CONbits.ON = 0;               // disable timer
    T5CONbits.TCS = 0;              // select internal PBCLK source
    T5CONbits.TCKPS = 0b111;        // select 1:256 prescale
    T5CONbits.TGATE = 0;            // Disable timer 5 TGATE
    TMR5 = 0;                       // clear timer 5 register
    PR5 = 390;                      // set period register to 5ms (390 ticks))
    IPC5bits.T5IP = 4;              // set interrupt priority to 6
    IFS0CLR = _IFS0_T5IF_MASK;		// clear any pending interrupt
    IEC0SET = _IEC0_T5IE_MASK;		// local enable
    T5CONbits.ON = 1;               // enable timer
}


// initializes Input Capture 4 to measure rising edges of left encoder
void InitInputCapture4(void){
    uint16_t buffertrash;           // throwaway variable for clearing buffer
   
    IC4CONbits.ON = 0;              // turn off IC4
    ANSELBbits.ANSB15 = 0;          // disable RB15 analog mode
    TRISBbits.TRISB15 = 1;          // set RB15 as input pin
    IC4R = 0b0011;                  // map RB15 pin to IC4
	IC4CONbits.ICTMR = 1;           // make Timer2 the counter source
	IC4CONbits.C32 = 0;             // set input capture to 16 bit mode
    IPC4bits.IC4IP = 7;             // set priority to 7
	IC4CONbits.FEDGE = 1;           // capture rising edge for the first capture
	IC4CONbits.ICM = 0b011;         // capture every rising edge
	IC4CONbits.ICI = 00;            // interrupt on every capture event
	
    // while IC4 buffer is not empty
    while (IC4CONbits.ICBNE == 1){  
        buffertrash = IC4BUF;       // clear the buffer
    }
    
    IFS0CLR = _IFS0_IC4IF_MASK;     // clear interrupt flag
    IEC0SET = _IEC0_IC4IE_MASK;     // enable interrupts
    IC4CONbits.ON = 1;              // turn on IC4
}

// initializes Input Capture 5 to measure rising edges of right encoder
void InitInputCapture5(void){
    uint16_t buffertrash;           // throwaway variable for clearing buffer
   
    IC5CONbits.ON = 0;              // turn off IC5
    ANSELBbits.ANSB13 = 0;          // disable RB15 analog mode
    TRISBbits.TRISB13 = 1;          // set RB13 as input pin
    IC5R = 0b0011;                  // map RB13 pin to IC5
	IC5CONbits.ICTMR = 1;           // make Timer2 the counter source
	IC5CONbits.C32 = 0;             // set input capture to 16 bit mode
    IPC5bits.IC5IP = 7;             // set priority to 7
	IC5CONbits.FEDGE = 1;           // capture rising edge for the first capture
	IC5CONbits.ICM = 0b011;         // capture every rising edge
	IC5CONbits.ICI = 00;            // interrupt on every capture event
	
    // while IC5 buffer is not empty
    while (IC5CONbits.ICBNE == 1){  
        buffertrash = IC5BUF;       // clear the buffer
    }
    
    IFS0CLR = _IFS0_IC5IF_MASK;     // clear interrupt flag
    IEC0SET = _IEC0_IC5IE_MASK;     // enable interrupts
    IC5CONbits.ON = 1;              // turn on IC5
}

/* Init Functions */
// SPI1 (Locomotion): MOSI (RB5), CLK-IN (RB14)
static void InitSPI(){
  ANSELBbits.ANSB14 = 0;          // Disable analog inputs on RB14
  TRISBbits.TRISB5 = 1;           // MOSI as input
  TRISBbits.TRISB14 = 1;          // CLK as input
  TRISBbits.TRISB4 = 1;           // SS1 as input
  SDI1R = 0b0001;                 // Set SDI1 to RB5
  SS1R = 0b0010;                  // Set SS1 to RB4
  IEC1CLR = _IEC1_SPI1RXIE_MASK;  // Local interrupt disable for SPI Rx
  SPI1CONbits.ON = 0;             // Turn off SPI1
  IFS1CLR = _IFS1_SPI1RXIF_MASK;  // Clear interrupt flag for SPI Rx
  IPC7bits.SPI1IP = 6;            // Set SPI interrupt priority to 6
  uint8_t clearVar = SPI1BUF;     // Clear SPI1BUF
  SPI1CONbits.ENHBUF = 0;         // Turn off enhanced buffer
  SPI1STATbits.SPIROV = 0;        // Clear overflow bit
  SPI1CONbits.MSTEN = 0;          // Slave mode
  SPI1CONbits.MSSEN = 0;          // Slave select is manual
  SPI1CONbits.SSEN = 1;           // SS pin used for slave mode 
  SPI1CONbits.FRMEN = 0;          // Disable framed SPI support
  SPI1CONbits.CKE = 0;            // 2nd clock edge is active
  SPI1CONbits.CKP = 1;            // Clock idle is high
  SPI1CONbits.FRMPOL = 0;         // SS is active low
  SPI1CONbits.MODE16 = 0;         // 8-bit mode
  SPI1CONbits.MODE32 = 0;         // 8-bit mode
  SPI1CONbits.MCLKSEL = 0;        // Use PBCLK
  SPI1CONbits.SRXISEL = 0b01;     // Interrupts when Rx buffer is not empty
  IEC1SET = _IEC1_SPI1RXIE_MASK;  // Local interrupt enable for SPI Rx
  __builtin_enable_interrupts;    // Global interrupt enable 
  INTCONbits.MVEC = 1;            // Enable multi-vector mode 
  SPI1CONbits.ON = 1;             // Turn on SPI1
}

/*
void __ISR(_INPUT_CAPTURE_4_VECTOR, IPL7SOFT) LeftEncoder_ISR(void){
    static uint16_t capTime;
    static uint16_t currTime;
    static uint16_t lastTime;
    // initialize current time and event to post
    ES_Event_t ThisEvent;
    
    // read time captured from buffer
    capTime = (uint16_t)IC4BUF;
    currTime = capTime - lastTime;
    // clear interrupt flag
    IFS0CLR = _IFS0_IC4IF_MASK;
    
    // If T2IF is pending and captured time is after rollover
    if (IFS0bits.T4IF && capTime < 0x8000){
        // increment rollover counter
        combTimeL.byBytes.high++;
        // clear rollover interrupt flag
        IFS0CLR = _IFS0_T4IF_MASK;
    }
    
//    // factor in rollover -> high byte
//    combTimeL.byBytes.high = rollover;
//    combTimeL.byBytes.low = currTime;
//    // update last time
//    lastTime = capTime;
//    // clear rollover count
//    rollover = 0;
    
    return;
}
*/

void __ISR(_INPUT_CAPTURE_4_VECTOR, IPL7SOFT) LeftEncoder_ISR(void){
    // initialize current time and event to post
    ES_Event_t ThisEvent;
    
    // read time captured from buffer
    capTimeL = (uint16_t)IC4BUF;
    currTimeL = capTimeL - lastTimeL;
    // clear interrupt flag
    IFS0CLR = _IFS0_IC4IF_MASK;
    
    // If T2IF is pending and captured time is after rollover
    if (IFS0bits.T2IF && capTimeL < 0x8000){
        // increment rollover counter
        ++rolloverL;
        ++rolloverR;
        // clear rollover interrupt flag
        IFS0CLR = _IFS0_T2IF_MASK;
    }
    
    // factor in rollover -> high byte
    combTimeL.byBytes.high = rolloverL;
    combTimeL.byBytes.low = currTimeL;
    // update last time
    lastTimeL = capTimeL;
    // clear rollover count
    rolloverL = 0;
    
    return;
}

void __ISR(_INPUT_CAPTURE_5_VECTOR, IPL7SOFT) RightEncoder_ISR(void){
    // initialize current time and event to post
    ES_Event_t ThisEvent;
    
    // read time captured from buffer
    capTimeR = (uint16_t)IC5BUF;
    currTimeR = capTimeR - lastTimeR;
    // clear interrupt flag
    IFS0CLR = _IFS0_IC5IF_MASK;
    
    // If T2IF is pending and captured time is after rollover
    if (IFS0bits.T2IF && capTimeR < 0x8000){
        // increment rollover counter
        ++rolloverL;
        ++rolloverR;
        // clear rollover interrupt flag
        IFS0CLR = _IFS0_T2IF_MASK;
    }
    
    // factor in rollover -> high byte
    combTimeR.byBytes.high = rolloverR;
    combTimeR.byBytes.low = currTimeR;
    // update last time
    lastTimeR = capTimeR;
    // clear rollover count
    rolloverR = 0;
    
    return;
}

// SPI Receipt ISR
void __ISR(_SPI_1_VECTOR, IPL6SOFT) _SPI1ISR(){
    // Declare static uint8_t var bufRead to store buffer reading
    static volatile uint8_t bufRead;
    // Read the byte and then clear the Rx interrupt
    bufRead = SPI1BUF;
    IFS1CLR = _IFS1_SPI1RXIF_MASK;
    if (bufRead != 0){
      ES_Event_t ReceiveEvent;
      ReceiveEvent.EventType = ES_RECEIVE;
      ReceiveEvent.EventParam = bufRead;
      PostLocomotion(ReceiveEvent);
    }
}