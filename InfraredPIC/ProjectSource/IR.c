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

#include "Queue.h"      // required for SPI functionality - kcao


/*----------------------------- Module Defines ----------------------------*/
//#define PERIOD1 1500  //assume we are robot A Team A
//#define PERIOD2 3500

// #define PERIOD1 2500
// #define PERIOD2 5500
//#define TEST
#define TOLERENCE 10

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
void initPostingTimer(void);
static void InitSPI();
static void SendLeader(uint8_t message);
static void RobotState(uint16_t message);
// Wrappers
static void StartTransmitFront(uint16_t period);
static void StartTransmitRear(uint16_t period);
static void StopTransmitFront();
static void StopTransmitRear();
static void StartReceiveFront();
static void StartReceiveRear();
static void StopReceiveFront();
static void StopReceiveRear();

static volatile ES_Event_t OldEvent;  
static volatile ES_Event_t ThatEvent;

/*---------------------------- Module Variables ---------------------------*/
// everybody needs a state variable, you may need others as well.
// type of state variable should match htat of enum in header file
static IRState_t CurrentState;
static uint8_t MyPriority;

static uint16_t PERIOD1 = 0;
static uint16_t PERIOD2 = 0;
static uint8_t leftdetected = 0;
static volatile uint8_t rightdetected = 0;

static volatile Timer myTimer2;
static volatile Timer myTimer3;

static volatile uint8_t TxNum = 1; 
static volatile uint8_t postTxNum = 0;
static volatile uint8_t lastTxNum = 54;
static volatile uint8_t lastlastTxNum = 99;
static volatile uint8_t firstFallRear = 0;
static volatile uint32_t periodRear = 0;
static volatile uint32_t lastFallRear = 0;
static volatile uint8_t currentTxNum = 0;

static volatile uint8_t edgeNum = 0;

static uint8_t firstRiseFrontLeft = 0;
static uint32_t periodFrontLeft = 0;
static uint32_t lastRiseFrontLeft = 0;
static volatile uint8_t lastleftdetect = 0;

static volatile uint8_t firstRiseFrontRight = 0;
static volatile uint32_t periodFrontRight = 0;
static volatile uint32_t lastRiseFrontRight = 0;
static volatile uint8_t lastrightdetect = 0;

static bool isBlueTeam;
static bool isRobotA;
static bool isRobotB;
static bool isRobotC;
static volatile uint16_t loadNum;

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
        /* Initialize Timer 2 and 3 */
        _initTimer2();
        _initTimer3();

        /* Clear Timers */
        myTimer2.RealTime.rolloverCount = 0;
        myTimer2.RealTime.buffRead = 0;
        myTimer2.realTime = 0;
        myTimer3.RealTime.rolloverCount = 0;
        myTimer3.RealTime.buffRead = 0;
        myTimer3.realTime = 0;

        InitSPI();
        CurrentState = InitPState2;
      }
    }
    break;

    case InitPState2:        
    {
      if (ThisEvent.EventType == ES_RECEIVE)    
      {
        // Further init based on leader SPI 
        RobotState(ThisEvent.EventParam); 
        if (isRobotA){
          StartReceiveFront();
          CurrentState = FollowingPath;
        } 
        else {
          StartTransmitRear(PERIOD1);
          StartReceiveRear();
          CurrentState = Waiting2RxBaton;
        }
      }
    }
    break;

    case Waiting2RxBaton:        
    {
      switch (ThisEvent.EventType)
        {  
          case ES_RX_BATON:
          {
            printf("TxNum: %u\n", TxNum);
            StartTransmitRear(PERIOD2);
            StopReceiveRear();
            SendLeader(100);
            ES_Timer_InitTimer(0, 1000); //todo
            CurrentState = Leaving;
          }
          break;

          case ES_RECEIVE:
          {
            if (ThisEvent.EventParam == 66)
            {
              CurrentState = Termination;
            }
          }
          break;

          default:
          {}
          break;
        }
    }
    break;

    case Leaving:        
    {
      switch (ThisEvent.EventType)
        {  
          case ES_TIMEOUT:
          {
            StopTransmitRear();
            StartReceiveFront();
            CurrentState = FollowingPath;
          }
          break;

          case ES_RECEIVE:
          {
            if (ThisEvent.EventParam == 66)
            {
              CurrentState = Termination;
            }
          }
          break;

          default:
          {}
          break;
        }
    }
    break;

    case FollowingPath:        
    {
      switch (ThisEvent.EventType)
        {  
          case ES_BOTH_DETECT:
          {
            SendLeader(150);
            printf("BOTH DETECT\n");
            CurrentState = Aligning;
          }
          break;

          case ES_RECEIVE:
          {
            if (ThisEvent.EventParam == 66)
            {
              CurrentState = Termination;
            }
          }
          break;

          default:
          {}
          break;
        }
    }
    break;

    case Aligning:        
    {
      //printDebugQueue(1);
      switch (ThisEvent.EventType)
        {  
          case ES_RECEIVE:
          {
            // ES_TX_BATON
            if (ThisEvent.EventParam == 12)
            {
              StopReceiveFront();
              StartTransmitFront(PERIOD1);
              CurrentState = SendingLaps;
            }
            // ES_TERMINATE
            if (ThisEvent.EventParam == 66)
            {
              CurrentState = Termination;
            }
          }
          break;
#ifdef TEST
          case ES_TX_BATON:
          {
            // ES_TX_BATON
            
              //printf("hi");
              StopReceiveFront();
              StartTransmitFront(PERIOD1);
              CurrentState = SendingLaps;
          }
          break;
#endif

          case ES_BOTH_DETECT:
          {
            SendLeader(150);
            printf("both\n");
          }
          break;

          case ES_LEFTDETECT:
          {
            SendLeader(125);
            printf("left\n");
          }
          break;

          case ES_RIGHTDETECT:
          {
            SendLeader(200);
            printf("right\n");
          }
          break;

          case ES_NO_DETECT:
          {
            SendLeader(250);
            printf("no detect\n");
          }
          break;

          default:
          {}
          break;
        }
    }
    break;

    case SendingLaps:        
    {
      switch (ThisEvent.EventType)
        {  
          case ES_FREQ_CHANGE:
          {
            StopReceiveFront();
            StopTransmitFront();
            StartTransmitRear(PERIOD1);
            StartReceiveRear();
            SendLeader(175);
            printf("freq change\n");
            CurrentState = Waiting2RxBaton;
          }
          break;

          case ES_RECEIVE:
          {
            if (ThisEvent.EventParam == 66)
            {
              CurrentState = Termination;
            }
          }
          break;

          default:
          {}
          break;
        }
    }
    break;

    case Termination:
    {
      // Termination - Stop everything
        StopTransmitFront();
        StopTransmitRear();
        StopReceiveRear();
        StopReceiveFront();
    }
    break;

    default:
    {}
    break;

    }                                  
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
    /* Configure IC4 to Simple Capture Event mode, every falling edge */
    IC4CONbits.ICM = 0b010;
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
    
    /* Reset variable values within ISR: */
    firstFallRear = 0;
    periodRear = 0;
    lastFallRear = 0;
    postTxNum = 0;
    lastlastTxNum = 99;
    currentTxNum = 0;
    lastTxNum = 54;
    TxNum = 1;
    
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
    
    /* Update ISR val */
    firstRiseFrontRight = 0;
    periodFrontRight = 0;
    lastRiseFrontRight = 0;
    lastrightdetect = 0;
    
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
    IC2CONbits.ICM = 0b011;
    /* Enable local IC2 interrupts */
    IEC0SET = _IEC0_IC2IE_MASK;
    /* Configure to interrupt on every capture event */
    IC2CONbits.ICI = 0b00;
    /* Set IC2 Priority: */
    IPC2bits.IC2IP = 7;
    IPC2bits.IC2IS = 0;
    
    /* While buffer is not empty*/
    if (IC2CONbits.ICBNE == 1){
        /* Set local variable to read input capture buffer IC1BUF */
        trashReading = IC2BUF;
    }
    
    /* Clear ISR values */
    firstRiseFrontLeft = 0;
    periodFrontLeft = 0;
    lastRiseFrontLeft = 0;
    lastleftdetect = 0;
    
    /* Turn on input capture */
    IC2CONbits.ON = 1;
}

//For counting number of blinks for transfering communication. 
//Posts ES_RX_BATON once lap count has been double-checked
void __ISR(_INPUT_CAPTURE_4_VECTOR,IPL7SOFT)_ICRearISR(void){

    static volatile ES_Event_t ThisEvent;
    myTimer2.RealTime.buffRead = IC4BUF ;   //Read the Variable
    
    /* If T2IF (Timer Overflow flag) is pending, and captured time is after rollover */
    if (IFS0bits.T2IF == 1 ){
        if ( myTimer2.RealTime.buffRead <= 0x8000 ){
            /* Clear the Timer2 rollover interrupt */
            IFS0CLR = _IFS0_T2IF_MASK ;
            /* Increment rolloverCount */
            myTimer2.RealTime.rolloverCount ++;
        }
    }
    
    if (firstFallRear != 0){
        
        /* Calculate Period */
        periodRear = myTimer2.RealTime.buffRead - lastFallRear;
        if ( periodRear >= 0xFFFF0000 ){
            periodRear =0xFFFF - lastFallRear + myTimer2.RealTime.buffRead;
        }
        
        //printf("%u\n", periodRear);
        if ((periodRear <= (PERIOD1 + 2*TOLERENCE)) && (periodRear >= (PERIOD1 - 2*TOLERENCE))){
            /* Count number of transfers */
             currentTxNum++;
        }
        else if ((periodRear >= (5*PERIOD1)) && (periodRear <= (6*PERIOD1))){ //one cycle of blinking complete. should be 6*period.
            currentTxNum++;  //count last rise
            //referenceTxNum = currentTxNum;
            //printf("%u ", TxNum);
            if ((postTxNum == 0) && (lastTxNum == currentTxNum) && (lastlastTxNum == lastTxNum)) {   //only post one time 
                //printf("%u\n", referenceTxNum);
                /* PostEvent ES_RX_BATON with param currentTxNum */
                ThisEvent.EventType = ES_RX_BATON;
                ThisEvent.EventParam = currentTxNum;
                PostIR(ThisEvent);
                
                /* Store new transfer number into local variable TxNum */
                TxNum = currentTxNum; 
                
                /*Update*/
                postTxNum = 1;
                lastTxNum = 54;
                lastlastTxNum = 99;
            }
            
                
            /* Reset currentTxNum & referenceTxNum */
            lastlastTxNum = lastTxNum;
            lastTxNum = currentTxNum;
            currentTxNum = 0;

            
        }
    } 

  /* Update lastRiseRear */
  lastFallRear = myTimer2.RealTime.buffRead;
  firstFallRear = 1;

  /* Clear the input capture interrupt flag */
  IFS0CLR = _IFS0_IC4IF_MASK;
}

//Uses IC2, timer2 for navigating and also recognizing when front robot uses freq2
void __ISR (_INPUT_CAPTURE_2_VECTOR, IPL7SOFT ) IC_Front_Left_ISR ( void ){
    
    static ES_Event_t ThisEvent;

    myTimer2.RealTime.buffRead = IC2BUF ;   //Read the Variable

    if (firstRiseFrontLeft != 0){
        /* Calculate Period */
        periodFrontLeft = myTimer2.RealTime.buffRead - lastRiseFrontLeft;
        if ((periodFrontLeft <= (PERIOD1 + TOLERENCE)) && (periodFrontLeft >= (PERIOD1 - TOLERENCE))){
            leftdetected = 1;
        }
        else if ((periodFrontLeft <= (PERIOD2 + TOLERENCE)) && (periodFrontLeft >= (PERIOD2 - TOLERENCE))){
            leftdetected = 2;
        }
    } 
    //printf("hi");
    /* Update lastRiseFrontLeft */
    lastRiseFrontLeft = myTimer2.RealTime.buffRead;
    firstRiseFrontLeft = 1;
    lastleftdetect = leftdetected;
    
    /* Clear the input capture interrupt flag */
    IFS0CLR = _IFS0_IC2IF_MASK;
}

//Uses IC1, timer2 for navigating and also recognizing when front robot uses freq2
void __ISR (_INPUT_CAPTURE_1_VECTOR, IPL7SOFT ) IC_Front_Right_ISR ( void ){

    static volatile ES_Event_t ThisEvent;
    //printf("hi");
    myTimer2.RealTime.buffRead = IC1BUF ;   //Read the Variable

    if (firstRiseFrontRight != 0){
        /* Calculate Period */
        periodFrontRight = myTimer2.RealTime.buffRead - lastRiseFrontRight;
        //printf("%u\n", periodFrontRight);
        if ((periodFrontRight <= (PERIOD1 + TOLERENCE)) && (periodFrontRight >= (PERIOD1 - TOLERENCE))){
            rightdetected = 1;
            //printf("rd\n");
        }
        else if ((periodFrontRight <= (PERIOD2 + TOLERENCE)) && (periodFrontRight >= (PERIOD2 - TOLERENCE))){
           rightdetected = 2;
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
void initPostingTimer(void){
    T4CONbits.ON = 0;               // disable timer
    T4CONbits.TCS = 0;              // select internal PBCLK source
    T4CONbits.TCKPS = 0b110;        // select 1:64 prescale
    TMR4 = 0;                       // clear timer 2 register
    PR4 = 0xFFFF;                   // set period register as 0.1sec
    IPC4bits.T4IP = 7;              // set interrupt priority to 7
    IFS0CLR = _IFS0_T4IF_MASK;    // clear any pending interrupt
    IEC0SET = _IEC0_T4IE_MASK;    // local enable
    __builtin_enable_interrupts();  // global enable
    T4CONbits.ON = 1;               // enable timer
}
  
// triggers every 0.1s and posts ES_DETECT 1,2,3 or ES_FREQ_2 events
void __ISR(_TIMER_4_VECTOR, IPL7SOFT) IC_PostingISR(void){
    OldEvent.EventType = ES_NO_DETECT;
    static volatile uint8_t var;
    static volatile uint8_t var1;
    //printf("l: %u", leftdetected);
    //printf("  r: %u\n", rightdetected);
    if ((leftdetected == 1) && (rightdetected == 1)){
        //printf("hi");
        ThatEvent.EventType = ES_BOTH_DETECT;
        ThatEvent.EventParam = 1;
        var = 4;
        
    }
    else if ((leftdetected == 2) && (rightdetected == 2)){
        ThatEvent.EventType = ES_FREQ_CHANGE;
        var = 5;
        //printf("%u\n", var);
    }
    else if ((leftdetected == 1) && (rightdetected == 0)){
        ThatEvent.EventType = ES_LEFTDETECT;
        ThatEvent.EventParam = 1;
        var = 3;
    }
    
    else if ((leftdetected == 0) && (rightdetected == 1)){
        ThatEvent.EventType = ES_RIGHTDETECT;
        ThatEvent.EventParam = 1;
        var = 2;
    }
    
    else if ((leftdetected == 0) && (rightdetected == 0)){
        ThatEvent.EventType = ES_NO_DETECT;
        var = 1;
    }
    
    
    if (var1 != var){
        PostIR(ThatEvent);
        //printf("%u\n", var);
    }
     
     leftdetected =0;
     rightdetected =0;
     var1 = var;
     
     IFS0CLR = _IFS0_T4IF_MASK;    // clear interrupt
}

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
    OC2RS = 50*period/100;      // set OC1RS duty cycle ~50%
    OC2R = 50*period/100;       // set OC1R duty cycle ~50%

    T3CONbits.ON = 1;           // enable timer
    OC2CONbits.ON = 1;          // enable output compare
}

void __ISR(_OUTPUT_COMPARE_1_VECTOR, IPL7SOFT) OC1_FrontPWMISR (void){
    /* Increment Edge count */
    edgeNum ++;
    //printf("%u\n", TxNum);
    /* If still blinking # of transfers, load OC1R normally */
    if (edgeNum < (TxNum*2)){
        loadNum += (PERIOD1/2);
    }
    /* If done blinking one cycle of transfers, load OC1R with 5 times more */
    else {
        loadNum += (10*(PERIOD1/2));
        edgeNum = 0; 
    }

    OC1R = loadNum;

    IFS0CLR = _IFS0_OC1IF_MASK;  // Clear the OC1 interrupt 
}


/***************************************************************************
 SPI System
 ***************************************************************************/

/* Init Functions */
// SPI (Infrared): MOSI (RB5), MISO (RB8), CLK-IN (RB14), SS1 (RB4)
static void InitSPI(){
  ANSELBbits.ANSB14 = 0;          // Disable analog inputs on RB14
  TRISBbits.TRISB5 = 1;           // MOSI as input
  TRISBbits.TRISB14 = 1;          // CLK as input
  TRISBbits.TRISB4 = 1;           // SS1 as input
  TRISBbits.TRISB8 = 0;           // MISO as output
  LATBbits.LATB8 = 1;             // Pull MISO as high
  SDI1R = 0b0001;                 // Set SDI1 to RB5
  SS1R = 0b0010;                  // Set SS1 to RB4
  RPB8R = 0b0011;                 // Set RB8 as SDO01
  IEC1CLR = _IEC1_SPI1RXIE_MASK;  // Local interrupt disable for SPI Rx
  SPI1CONbits.ON = 0;             // Turn off SPI1
  IFS1CLR = _IFS1_SPI1RXIF_MASK;  // Clear interrupt flag for SPI Rx
  IPC7bits.SPI1IP = 7;            // Set SPI interrupt priority to 7
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

/* Helper Functions */
static void SendLeader(uint8_t message){
  if(message != 0){
      enqueue(1, message);
  }
  
}

/* Interrupts */
// SPI Receipt ISR
void __ISR(_SPI_1_VECTOR, IPL7SOFT) _SPI1ISR(){
    // Declare static uint8_t var bufRead to store buffer reading
    uint8_t bufRead = SPI1BUF;
    IFS1CLR = _IFS1_SPI1RXIF_MASK;
    if ((bufRead != 0) && (bufRead != 255)){
      ES_Event_t ReceiveEvent;
      ReceiveEvent.EventType = ES_RECEIVE;
      ReceiveEvent.EventParam = bufRead;
      PostIR(ReceiveEvent);
    }
    // Send the next message in the queue if present 
    if(!isQueueEmpty(1)){
      uint8_t message = dequeue(1);
      //printf("%u ", message);
      if((message != 0) && (message != 255)){
          SPI1BUF = message;
      }
    } else {
      SPI1BUF = 0;                    // Empty byte if no information to send 
    }
}

/***************************************************************************
 Helper Functions
 ***************************************************************************/

 static void RobotState(uint16_t message){
  // Update robot and team state
  if(message == 20){
    isRobotA = true;
    isRobotB = false;
    isRobotC = false;
    isBlueTeam = false;
  } else if (message == 30){
    isRobotA = true;
    isRobotB = false;
    isRobotC = false;
    isBlueTeam = true;
  } else if (message == 40){
    isRobotA = false;
    isRobotB = true;
    isRobotC = false;
    isBlueTeam = false;
  } else if (message == 50){
    isRobotA = false;
    isRobotB = true;
    isRobotC = false;
    isBlueTeam = true;
  } else if (message == 60){
    isRobotA = false;
    isRobotB = false;
    isRobotC = true;
    isBlueTeam = false;
  } else if (message == 70){
    isRobotA = false;
    isRobotB = false;
    isRobotC = true;
    isBlueTeam = true;
  }
  // Update period 1/period 2 values 
  if (isBlueTeam){
    PERIOD1 = 2500;
    PERIOD2 = 5500;
  } else {
    PERIOD1 = 1500;
    PERIOD2 = 3500;
  }
  loadNum = PERIOD1/2;
 }

/***************************************************************************
 Wrapper Functions (for Code Readability)
 ***************************************************************************/

// Transmit Wrappers
// Note transmit front is transmit laps
static void StartTransmitFront(uint16_t period){
  Init_FrontPWM(period);
}

static void StartTransmitRear(uint16_t period){
  Init_RearPWM(period);
}

static void StopTransmitFront(){
  IEC0CLR = _IEC0_OC1IE_MASK;
  OC1CONbits.ON = 0; 
}

static void StopTransmitRear(){
  OC2CONbits.ON = 0;
}

// Receive Wrappers
static void StartReceiveFront(){
  _initIC_FrontRight();
  _initIC_FrontLeft();
  initPostingTimer();
}

static void StartReceiveRear(){
 _initIC_Rear();
}

static void StopReceiveFront(){
  IEC0CLR = _IEC0_IC1IE_MASK;
  IEC0CLR = _IEC0_IC2IE_MASK;
  IEC0CLR = _IEC0_T4IE_MASK;
  IC1CONbits.ON = 0;
  IC2CONbits.ON = 0;
  T4CONbits.ON = 0;
}

static void StopReceiveRear(){
  IEC0CLR = _IEC0_IC4IE_MASK;
  IC4CONbits.ON = 0;
}

