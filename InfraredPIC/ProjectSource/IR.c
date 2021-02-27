/****************************************************************************
 Module
   IR.c

 Revision
   1.0.1

 Description
   This is a template file for implementing flat state machines under the
   Gen2 Events and Services Framework.

 Notes

 History
 When           Who     What/Why
 -------------- ---     --------
 01/15/12 11:12 jec      revisions for Gen2 framework
 11/07/11 11:26 jec      made the queue static
 10/30/11 17:59 jec      fixed references to CurrentEvent in RunTemplateSM()
 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
****************************************************************************/
/*----------------------------- Include Files -----------------------------*/
/* include header files for this state machine as well as any machines at the
   next lower level in the hierarchy that are sub-machines to this machine
*/
#include <xc.h>
#include <proc/p32mx170f256b.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/attribs.h>

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "ES_Events.h"
#include "IR.h"
#include "IRTestHarness.h"

#include "EventCheckers.h"
#include "ES_Port.h"


/*----------------------------- Module Defines ----------------------------*/
//#define PERIOD1 1500  //assume we are robot A Team A
//#define PERIOD2 3500

// #define PERIOD1 2500
// #define PERIOD2 5500
#define TOLERENCE 5

//#define TEST_DETECT
//#define TEST_BLINK


/*---------------------------- Module Functions ---------------------------*/
/* prototypes for private functions for this machine.They should be functions
   relevant to the behavior of this state machine
*/
void Init_FrontPWM(uint16_t period);
void Init_RearPWM(uint16_t period);
void _initIC_FrontLeft();
void _initIC_FrontRight();
void _initIC_Rear();
void _initTimer3();
void _initTimer2();

/*---------------------------- Module Variables ---------------------------*/
// everybody needs a state variable, you may need others as well.
// type of state variable should match htat of enum in header file
static IRState_t CurrentState;
static volatile IRState_t PretendState;
// with the introduction of Gen2, we need a module level Priority var as well
static uint8_t MyPriority;
static uint16_t PERIOD1 = 1500;
static uint16_t PERIOD2 = 3500;
static uint8_t leftdetected = 0;
static volatile uint8_t rightdetected = 0;
static volatile Timer myTimer2;
static volatile Timer myTimer3;
static volatile uint8_t TxNum;    
static volatile uint8_t edgeNum = 0;
    
/*------------------------------ Module Code ------------------------------*/
/****************************************************************************
 Function
     InitIR

 Parameters
     uint8_t : the priorty of this service

 Returns
     bool, false if error in initialization, true otherwise

 Description
     Saves away the priority, sets up the initial transition and does any
     other required initialization for this state machine
 Notes

 Author
     J. Edward Carryer, 10/23/11, 18:55
****************************************************************************/
bool InitIR(uint8_t Priority)
{
  ES_Event_t ThisEvent;

  MyPriority = Priority;
  // put us into the Initial PseudoState
  CurrentState = InitPState;
  // post the initial transition event
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
     PostIR

 Parameters
     ES_Event_t ThisEvent , the event to post to the queue

 Returns
     boolean False if the Enqueue operation failed, True otherwise

 Description
     Posts an event to this state machine's queue
 Notes

 Author
     J. Edward Carryer, 10/23/11, 19:25
****************************************************************************/
bool PostIR(ES_Event_t ThisEvent)
{
  return ES_PostToService(MyPriority, ThisEvent);
}

/****************************************************************************
 Function
    RunIR

 Parameters
   ES_Event_t : the event to process

 Returns
   ES_Event_t, ES_NO_EVENT if no error ES_ERROR otherwise

 Description
   add your description here
 Notes
   uses nested switch/case to implement the machine.
 Author
   J. Edward Carryer, 01/15/12, 15:23
****************************************************************************/
ES_Event_t RunIR(ES_Event_t ThisEvent)
{
  ES_Event_t ReturnEvent;
  ReturnEvent.EventType = ES_NO_EVENT; // assume no errors

  switch (CurrentState)
  {
    case InitPState:        // If current state is initial Psedudo State
    {
      if (ThisEvent.EventType == ES_INIT)    // only respond to ES_Init
      {
        /* Responds to ES_ROBOT_TYPE from reading the SPI */
        // TODO

        /* Initialize Timer 2 and 3 */
        _initTimer2();
        _initTimer3();
        
//        #ifdef TEST_DETECT
//            _initIC_FrontRight();
//        #endif
//        
//        #ifdef TEST_BLINK
//            _initIC_Rear();
//        #endif

        /* Clear Timers */
        myTimer2.RealTime.rolloverCount = 0;
        myTimer2.RealTime.buffRead = 0;
        myTimer2.realTime = 0;
        myTimer3.RealTime.rolloverCount = 0;
        myTimer3.RealTime.buffRead = 0;
        myTimer3.realTime = 0;

        // Assume Robot A  TODO
        CurrentState = Running;
      }
    }
    break;

    case Running:       
    {
      if (ThisEvent.EventType == ES_FREQ1)
      {
          PERIOD1 = 1500;
          Init_RearPWM(1500);   // start emitting frequency 1
          _initIC_FrontRight();
//          _stopIC_Rear();
//          _startIC_Front(PERIOD1);

      }
      if (ThisEvent.EventType == ES_FREQ2)
      {
          PERIOD2 = 3500;
          Init_RearPWM(3500);
          _initIC_FrontRight();
//          _stopIC_Rear();
//          _startIC_Front(PERIOD2);

      }
      if (ThisEvent.EventType == ES_FREQ3)
      {
          PERIOD1 = 2500;
          Init_RearPWM(2500);
          _initIC_FrontRight();
//          _stopIC_Rear();
//          _startIC_Front(PERIOD1);
      }
      if (ThisEvent.EventType == ES_FREQ4)
      {
          PERIOD2 = 5500;
          Init_RearPWM(5500);
          _initIC_FrontRight();
//          _stopIC_Rear();
//          _startIC_Front(PERIOD2);
      }
      if (ThisEvent.EventType == ES_BLINK)
      {
          TxNum = ThisEvent.EventParam;    
          Init_FrontPWM(PERIOD1);
          _initIC_Rear();
//          _stopIC_Front();
//          _startIC_Rear(PERIOD1);
      }
      if (ThisEvent.EventType == ES_RX_BATON)
      {
          printf("Num of Transfer: %u\n ",TxNum);
      }
      if (ThisEvent.EventType == ES_LEFTDETECT)
      {
          printf("Left detected f %u\n ",ThisEvent.EventParam);
      }
      if (ThisEvent.EventType == ES_RIGHTDETECT)
      {
          printf("Right detected f %u\n ",ThisEvent.EventParam);
      }
    }
    break;

    // TODO repeat state pattern as required for other states
    default:
    {}
    break;

    }                                  // end switch on Current State
  return ReturnEvent;
}

/****************************************************************************
 Function
     QueryIR

 Parameters
     None

 Returns
     TemplateState_t The current state of the Template state machine

 Description
     returns the current state of the Template state machine
 Notes

 Author
     J. Edward Carryer, 10/23/11, 19:21
****************************************************************************/
IRState_t QueryIR(void)
{
  return CurrentState;
}

/***************************************************************************
 private functions
 ***************************************************************************/
// A function that initializes timer2 
void _initTimer2(){
      T2CONbits.ON = 0;               // disable timer
      T2CONbits.TCS = 0;              // select internal PBCLK source
      T2CONbits.TCKPS = 0b010;        // select 1:4 prescale
      TMR2 = 0;                       // clear timer 2 register
      PR2 = 0xFFFF;                   // set period register
      IPC2bits.T2IP = 6;              // set interrupt priority to 6
      IFS0CLR = _IFS0_T2IF_MASK;    // clear any pending interrupt
      IEC0SET = _IEC0_T2IE_MASK;    // local enable
      __builtin_enable_interrupts();  // global enable
      T2CONbits.ON = 1;               // enable timer

}

void __ISR ( _TIMER_2_VECTOR , IPL6SOFT ) _Timer2OverflowISR(){
  IFS0CLR = _IFS0_T2IF_MASK;    // clear interrupt
  myTimer2.RealTime.rolloverCount++;        // increment rollover counter   
}

//A function to initialize timer3 for output compare
void _initTimer3(){
  /* Clear the ON control bit to disable the timer */
  T3CONbits . ON = 0 ;
  /* Clear the TCS control bit to select the internal PBCLK source */
  T3CONbits . TCS = 0 ;
  /* Choose a 1:4 pre-scale */
  T3CONbits . TCKPS = 0b010 ;
  /* Load the period register PR3 with 1 less than the timer ticks achieving max duty cycle */
  PR3 = 0xFFFF; //( 0xFFFF / 4 - 1 ); //16220;
  /* Clear the timer 3 register TMR3 */
  TMR3 = 0 ;
  /* Configure interrupt priority to 6 and sub-priority to 0 in PICx register */
  IPC3bits . T3IP = 6 ;
  IPC3bits . T3IS = 0 ;
  /* Global enable interrupt */
  __builtin_enable_interrupts ();
  /* Clear the T2IF interrupt flag in the IFSx register using CLR */
  IFS0CLR = _IFS0_T3IF_MASK ;
  /* Set the T2IE interrupt enable bit in the IECx register */
  IEC0SET = _IEC0_T3IE_MASK ;
  /* Set the ON control bit to enable the timer */
  T3CONbits . ON = 1 ;
}

//A function to respond to overflow interrupts generated by Timer3:
void __ISR ( _TIMER_3_VECTOR , IPL6SOFT ) _Timer3OverflowISR ( void ){

    /* Clear the roll-over interrupt, T3IF */
    IFS0CLR = _IFS0_T3IF_MASK ;
    /* Increment rolloverCount */
    myTimer3. RealTime. rolloverCount++;

//    if (PretendState == SendingNumLaps ) { //TODO
//        numBlink ++; 
//        if (numBlink == TxNum) {
//            OC1RS = 0; // Write 0% Duty cycle for a long pulse
//        }
//        else if (numBlink == (TxNum+5)) {
//            OC1RS = PERIOD1 / 2; // Rewrite 50% duty cycle to OCxRS after a pulse
//            numBlink = 0; // Clear numBlinks
//        }
//    }
}

//A function to initialize Input Capture 4 using timer2 
void _initIC_Rear(void){
    
    uint16_t trashReading;
    
    /* Turn off input capture */
    IC4CONbits.ON = 0;
    /* Set RB15 pin to Digital Input Read*/
    ANSELB = 0 ;
    TRISBbits.TRISB15 = 1 ;
    /* Map RB15 pin to input capture */
    IC4R = 0b0011;   
    /* Make Timer2 the source of Input Capture */
    IC4CONbits.ICTMR = 1;
    /* Set to 16-bit mode*/
    IC4CONbits.C32 = 0;
    /* Configure IC4 to Simple Capture Event mode, every rising edge */
    IC1CONbits.ICM = 0b011;
    /* Enable local IC4 interrupts */
    IEC0SET = _IEC0_IC4IE_MASK;
    /* Configure to interrupt on every capture event */
    IC4CONbits.ICI = 0b00;
    /* Set IC4 Priority: */
    IPC4bits.IC4IP = 7;
    IPC4bits.IC4IS = 0;
    
    /* While buffer is not empty*/
    if (IC4CONbits.ICBNE == 1){
        /* Set local variable to read input capture buffer IC4BUF */
        trashReading = IC4BUF;
    }
    
    /* Turn on input capture */
    IC4CONbits.ON = 1;
}

//A function to initialize Input Capture 1 using timer2 
void _initIC_FrontRight(){
    
    uint16_t trashReading;
    
    /* Turn off input capture */
    IC1CONbits.ON = 0;
    /* Set RB13 pin to Digital Input Read*/
    ANSELB = 0 ;
    TRISBbits.TRISB13 = 1 ;
    /* Map RB13 pin to input capture */
    IC1R = 0b0011;   

    /* Make Timer2 the source of Input Capture */
    IC1CONbits.ICTMR = 1;
    /* Set to 16-bit mode*/
    IC1CONbits.C32 = 0;
    /* Configure IC1 to Simple Capture Event mode, every rising edge */
    IC1CONbits.ICM = 0b011;
    /* Enable local IC1 interrupts */
    IEC0SET = _IEC0_IC1IE_MASK;
    /* Configure to interrupt on every capture event */
    IC1CONbits.ICI = 0b00;
    /* Set IC1 Priority: */
    IPC1bits.IC1IP = 7;
    IPC1bits.IC1IS = 0;
    
    /* While buffer is not empty*/
    if (IC1CONbits.ICBNE == 1){
        /* Set local variable to read input capture buffer IC1BUF */
        trashReading = IC1BUF;
    }
    
    /* Turn on input capture */
    IC1CONbits.ON = 1;
}

//A function to initialize Input Capture 2 using timer2 
void _initIC_FrontLeft(){
    
    uint16_t trashReading;
    
    /* Turn off input capture */
    IC2CONbits.ON = 0;
    /* Set RB9 pin to Digital Input Read*/
    ANSELB = 0 ;
    TRISBbits.TRISB9 = 1 ;
    /* Map RB9 pin to input capture */
    IC2R = 0b0100;   
    /* Make Timer2 the source of Input Capture */
    IC2CONbits.ICTMR = 1;
    /* Set to 16-bit mode*/
    IC2CONbits.C32 = 0;
    /* Configure IC2 to Simple Capture Event mode, every rising edge */
    IC1CONbits.ICM = 0b011;
    /* Enable local IC2 interrupts */
    IEC0SET = _IEC0_IC2IE_MASK;
    /* Configure to interrupt on every capture event */
    IC2CONbits.ICI = 0b00;
    /* Set IC2 Priority: */
    IPC2bits.IC2IP = 7;
    IPC2bits.IC2IS = 0;
    
    /* While buffer is not empty*/
    if (IC1CONbits.ICBNE == 1){
        /* Set local variable to read input capture buffer IC1BUF */
        trashReading = IC1BUF;
    }
    
    /* Turn on input capture */
    IC1CONbits.ON = 1;
}


//For counting number of blinks for transfering communication. 
//Posts ES_RX_BATON once lap count has been double-checked
void __ISR(_INPUT_CAPTURE_4_VECTOR,IPL7SOFT)_ICRearISR(void){

    static volatile ES_Event_t ThisEvent;
    static volatile uint8_t firstRiseRear = 0;
    static volatile uint32_t periodRear = 0;
    static volatile uint32_t lastRiseRear = 0;
    static volatile uint8_t referenceTxNum = 99;
    static volatile uint8_t currentTxNum = 0;

  myTimer2.RealTime.buffRead = IC4BUF ;   //Read the Variable

  if (firstRiseRear != 0){
    /* Calculate Period */
    periodRear = myTimer2.RealTime.buffRead - lastRiseRear;
    if ((periodRear <= PERIOD1 + TOLERENCE) && (periodRear >= PERIOD1 - TOLERENCE)){
      /* Count number of transfers */
       currentTxNum++;
    }
    else if ((periodRear >= 5*PERIOD1) && (periodRear <= 7*PERIOD1)){ //one cycle of blinking complete. should be 6*period.
      currentTxNum++;  //count last rise
      referenceTxNum = currentTxNum;
    }

    if(currentTxNum == referenceTxNum){  // double checking we read correct # of transfers
    /* PostEvent ES_RX_BATON with param currentTxNum */
      ThisEvent.EventType = ES_RX_BATON;
      ThisEvent.EventParam = currentTxNum;
      PostIR(ThisEvent);
      /* Store new transfer number into local variable TxNum */
      TxNum = currentTxNum; 
    /* Reset currentTxNum & referenceTxNum */
      currentTxNum = 0;
      referenceTxNum = 99;
    }
  } 

  /* Update lastRiseRear */
  lastRiseRear = myTimer2.RealTime.buffRead;
  firstRiseRear = 1;

  /* Clear the input capture interrupt flag */
  IFS0CLR = _IFS0_IC4IF_MASK;
}

//Uses IC2, timer2 for navigating and also recognizing when front robot uses freq2
void __ISR (_INPUT_CAPTURE_2_VECTOR, IPL7SOFT ) IC_Front_Left_ISR ( void ){

  static ES_Event_t ThisEvent;
  static uint8_t firstRiseFrontLeft = 0;
  static uint32_t periodFrontLeft = 0;
  static uint32_t lastRiseFrontLeft = 0;

  myTimer2.RealTime.buffRead = IC2BUF ;   //Read the Variable

  if (firstRiseFrontLeft != 0){
    /* Calculate Period */
    periodFrontLeft = myTimer2.RealTime.buffRead - lastRiseFrontLeft;
    if ((periodFrontLeft <= PERIOD1 + TOLERENCE) && (periodFrontLeft >= PERIOD1 - TOLERENCE)){
       leftdetected = 1;
       ThisEvent.EventType = ES_LEFTDETECT;
       ThisEvent.EventParam = leftdetected;
    }
    else if ((periodFrontLeft <= PERIOD2 + TOLERENCE) && (periodFrontLeft >= PERIOD2 - TOLERENCE)){
       leftdetected = 2;
       ThisEvent.EventType = ES_LEFTDETECT;
       ThisEvent.EventParam = leftdetected;
    }
  } 

  /* Update lastRiseFrontLeft */
  lastRiseFrontLeft = myTimer2.RealTime.buffRead;
  firstRiseFrontLeft = 1;

  /* Clear the input capture interrupt flag */
  IFS0CLR = _IFS0_IC2IF_MASK;
}

//Uses IC1, timer2 for navigating and also recognizing when front robot uses freq2
void __ISR (_INPUT_CAPTURE_1_VECTOR, IPL7SOFT ) IC_Front_Right_ISR ( void ){

    static volatile ES_Event_t ThisEvent;
    static volatile uint8_t firstRiseFrontRight = 0;
    static volatile uint32_t periodFrontRight = 0;
    static volatile uint32_t lastRiseFrontRight = 0;
    static volatile uint8_t lastrightdetect = 0;

    myTimer2.RealTime.buffRead = IC1BUF ;   //Read the Variable

    if (firstRiseFrontRight != 0){
        /* Calculate Period */
        periodFrontRight = myTimer2.RealTime.buffRead - lastRiseFrontRight;
        if ((periodFrontRight <= (PERIOD1 + TOLERENCE)) && (periodFrontRight >= (PERIOD1 - TOLERENCE))){
            rightdetected = 1;
            if (lastrightdetect!= rightdetected){
                ThisEvent.EventType = ES_RIGHTDETECT;
                ThisEvent.EventParam = rightdetected;
                PostIR(ThisEvent);
            }
           
        }
        else if ((periodFrontRight <= (PERIOD2 + TOLERENCE)) && (periodFrontRight >= (PERIOD2 - TOLERENCE))){
           rightdetected = 2;
           if (lastrightdetect!= rightdetected){
                ThisEvent.EventType = ES_RIGHTDETECT;
                ThisEvent.EventParam = rightdetected;
                PostIR(ThisEvent);
            }
        }
    } 

    /* Update lastRiseFrontRight */
    lastRiseFrontRight = myTimer2.RealTime.buffRead;
    firstRiseFrontRight = 1;
    lastrightdetect = rightdetected;
    /* Clear the input capture interrupt flag */
    IFS0CLR = _IFS0_IC1IF_MASK;
}

// initialization of Timer 4 needed for the Detection Posting ISR
//void initPostingTimer(void){
//    T4CONbits.ON = 0;               // disable timer
//    T4CONbits.TCS = 0;              // select internal PBCLK source
//    T4CONbits.TCKPS = 0b110;        // select 1:64 prescale
//    TMR4 = 0;                       // clear timer 2 register
//    PR4 = 31249;                   // set period register as 0.1sec
//    IPC4bits.T4IP = 7;              // set interrupt priority to 7
//    IFS0CLR = _IFS0_T4IF_MASK;    // clear any pending interrupt
//    IEC0SET = _IEC0_T4IE_MASK;    // local enable
//    __builtin_enable_interrupts();  // global enable
//    T4CONbits.ON = 1;               // enable timer
//}
//

  
// triggers every 0.1s and posts ES_DETECT 1,2,3 or ES_FREQ_2 events
//void __ISR(_TIMER_4_VECTOR, IPL7SOFT) IC_PostingISR(void){
//  static ES_Event_t OldEvent = ES_NO_DETECT;  
//  static ES_Event_t ThisEvent;
//    
//    IFS0CLR = _IFS0_T4IF_MASK;    // clear interrupt
//  
//  if ((leftdetected == 1) && (rightdetected == 1)){
//    ThisEvent.EventType = ES_BOTH_DETECT;
//        leftdetected = 0;
//        rightdetected = 0;
//  }
//    
//    else if ((leftdetected == 1) && (rightdetected == 0)){
//        ThisEvent.EventType = ES_LEFT_DETECT;
//        leftdetected = 0;
//        rightdetected = 0;
//    }
//    
//    else if ((leftdetected == 0) && (rightdetected == 1)){
//        ThisEvent.EventType = ES_RIGHT_DETECT;
//        leftdetected = 0;
//        rightdetected = 0;
//    }
//    
//    else if ((leftdetected == 0) && (rightdetected == 0)){
//        ThisEvent.EventType = ES_NO_DETECT;
//    }
//    
//    else if ((leftdetected == 2) || (rightdetected == 2)){
//        ThisEvent.EventType = ES_FREQ_CHANGE;
//        leftdetected = 0;
//        rightdetected = 0;
//    }
//    
//    if (OldEvent != ThisEvent){
//        PosttoIRService(ThisEvent);
//    }
//    
//    OldEvent = ThisEvent;
//}
//

// sets up OC1 to generate PWM using Timer 3, 
void Init_FrontPWM(uint16_t period){
    IFS0CLR = _IFS0_OC1IF_MASK;  // Clear the OC1 interrupt flag
    OC1CONbits.ON = 0;          // disable output compare
    T3CONbits.ON = 0;           // disable timer
    
    IEC0CLR = _IEC0_OC1IE_MASK;  // Disable OC1 interrupts
    TRISBbits.TRISB7 = 0;       // set RB7 as output pin
    //LATBbits.LATB7 = 0;
    RPB7R = 0b0101;             // set RB7 to OC1

    T3CONbits.TCS = 0;          // select internal PBCLK source
    T3CONbits.TCKPS = 0b010;    // select 1:4 prescale
    PR3 = 0xFFFF;            // set period register
    TMR3 = 0;                   // clear timer 3 register
    edgeNum = 0; 
    //cycleNum = 0;
//    IFS0CLR = _IFS0_T3IF_MASK;  // Clear the timer3 interrupt 
//    IEC0CLR = _IEC0_T3IE_MASK;  // Disable Timer 3 interrupts
//    IEC0SET = _IEC0_T3IE_MASK; 
        
    OC1CONbits.SIDL = 0;        // disable idle mode
    OC1CONbits.OC32 = 0;        // use 16 bit timer source
    OC1CONbits.OCTSEL = 1;      // use Timer 3 as clock source
    OC1CONbits.OCM = 0b011;     // use Single compare toggle mode
    OC1R = (period/2);       // set OC1R to ~50%
    
    IPC1bits.OC1IP = 7; // Set OC1 interrupt priority to 7
    IPC1bits.OC1IS = 0; // Set Sub-priority to 0
    
    T3CONbits.ON = 1;           // enable timer
    OC1CONbits.ON = 1;          // enable output compare
    IEC0SET = _IEC0_OC1IE_MASK; // Enable OC1 interrupt
}


// sets up OC2 to generate PWM using Timer 3. also used to change frequency.
void Init_RearPWM(uint16_t period){

    OC2CONbits.ON = 0;          // disable output compare
    T3CONbits.ON = 0;           // disable timer
    
    TRISBbits.TRISB11 = 0;       // set RB11 as output pin
    RPB11R = 0b0101;             // set RB11 to OC1
    
    T3CONbits.TCS = 0;          // select internal PBCLK source
    T3CONbits.TCKPS = 0b010;    // select 1:4 prescale
    TMR3 = 0;                   // clear timer 3 register
    PR3 = period -1;            // set period register
    IFS0CLR = _IFS0_T3IF_MASK;  // Clear the timer3 interrupt 
    IEC0CLR = _IEC0_T3IE_MASK;  // Disable Timer 3 interrupts

    OC2CONbits.SIDL = 0;        // disable idle mode
    OC2CONbits.OC32 = 0;        // use 16 bit timer source
    OC2CONbits.OCTSEL = 1;      // use Timer 3 as clock source
    OC2CONbits.OCM = 0b110;     // use PWM mode with faults disabled
    OC2RS = 25*period/100;      // set OC1RS duty cycle ~50%
    OC2R = 25*period/100;       // set OC1R duty cycle ~50%

    T3CONbits.ON = 1;           // enable timer
    OC2CONbits.ON = 1;          // enable output compare
}

void __ISR(_OUTPUT_COMPARE_1_VECTOR, IPL7SOFT) OC1_FrontPWMISR (void){
    static volatile uint16_t loadNum = 750; //TODO
    /* Increment Edge count */
    edgeNum ++;

    /* If still blinking # of transfers, load OC1R normally */
    if (edgeNum < (TxNum*2)){
        loadNum += (PERIOD1/2);
    }
    /* If done blinking one cycle of transfers, load OC1R with 5 times more */
    else {
        loadNum += (11*(PERIOD1/2));
        edgeNum = 0; 
    }

    OC1R = loadNum;

    IFS0CLR = _IFS0_OC1IF_MASK;  // Clear the OC1 interrupt 
}

