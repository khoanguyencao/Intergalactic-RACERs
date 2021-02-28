/****************************************************************************
 Module
   GameplayService.c

 Revision
   1.0.0

 Description
   GameplayService is a service that manages the game state, baton status, 
   and SPI communication between the follower PICs.

 Notes

 History
 When           Who     What/Why
 -------------- ---     --------
 02/21/21       kcao    Creation of file
****************************************************************************/
/*----------------------------- Include Files -----------------------------*/
/* include header files for this state machine as well as any machines at the
   next lower level in the hierarchy that are sub-machines to this machine
*/
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "GameplayService.h"
#include <xc.h>
#include <sys/attribs.h>
#include "Queue.h"

/*----------------------------- Module Defines ----------------------------*/

/*---------------------------- Module Functions ---------------------------*/
/* prototypes for private functions for this machine.They should be functions
   relevant to the behavior of this state machine
*/
static void InitInputs();
static void InitOutputs();
static void InitTimers();
static void InitSPIs();
static void ReadSwitches();
static void TurnOnLEDs();
static void TurnOffLEDs();
static void RaiseBaton();
static void LowerBaton();
static void SendLocomotion(uint8_t message);
static void SendInfrared(uint8_t message);
static void processMessage(uint16_t message);
static void ActivateFollowers();

/*---------------------------- Module Variables ---------------------------*/
// everybody needs a state variable, you may need others as well.
// type of state variable should match htat of enum in header file
static TemplateState_t CurrentState;
static bool isBlueTeam; 
static bool isRobotA;
static bool isRobotB;
static bool isRobotC;
static uint8_t GameplayTimerOverflow;

// with the introduction of Gen2, we need a module level Priority var as well
static uint8_t MyPriority;

/*------------------------------ Module Code ------------------------------*/
/****************************************************************************
 Function
     InitGameplayService

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
bool InitGameplayService(uint8_t Priority)
{
  ES_Event_t ThisEvent;
  MyPriority = Priority;
  CurrentState = InitPState;
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
     PostGameplayService

 Parameters
     EF_Event_t ThisEvent , the event to post to the queue

 Returns
     boolean False if the Enqueue operation failed, True otherwise

 Description
     Posts an event to this state machine's queue
 Notes

 Author
     J. Edward Carryer, 10/23/11, 19:25
****************************************************************************/
bool PostGameplayService(ES_Event_t ThisEvent)
{
  return ES_PostToService(MyPriority, ThisEvent);
}

/****************************************************************************
 Function
    RunGameplayService

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
ES_Event_t RunGameplayService(ES_Event_t ThisEvent)
{
  ES_Event_t ReturnEvent;
  ReturnEvent.EventType = ES_NO_EVENT; // assume no errors

  switch (CurrentState)
  {
    case InitPState:
    {
      if (ThisEvent.EventType == ES_INIT)    
      {
        InitInputs();
        InitOutputs();
        InitTimers();
        InitSPIs();
        ReadSwitches();
        TurnOnLEDs();
        if(isRobotA){
          CurrentState = YesBaton;
          RaiseBaton();
        } else {
          CurrentState = NoBaton;
          LowerBaton();
        }
        ActivateFollowers();
      }
    }
    break;

    case YesBaton:        
    {
        if ( ThisEvent.EventType != ES_NO_EVENT ) 
        {
            switch (ThisEvent.EventType)
            {
              case ES_TX_BATON:
              {
                LowerBaton();
                SendInfrared(ThisEvent.EventParam);
                SendLocomotion(ThisEvent.EventParam);
                CurrentState = NoBaton;
              }
              break;

              case ES_INFRARED_MSG:
              {
                processMessage(ThisEvent.EventParam);
              }
              break;

              case ES_TERMINATE:
              {
                TurnOffLEDs();
                LowerBaton();
                SendInfrared(ThisEvent.EventParam);
                SendLocomotion(ThisEvent.EventParam);
                CurrentState = Stopped;
              }
              break;

              default:
              {}
              break;
            }
        }
    }
    break;

    case NoBaton:        
    {
        if ( ThisEvent.EventType != ES_NO_EVENT ) 
        {
            switch (ThisEvent.EventType)
            {  
              case ES_RX_BATON:
              {
                RaiseBaton();
                SendLocomotion(ThisEvent.EventParam);
                CurrentState = YesBaton;
                // Activate Hall Effect Sensors
                IFS0CLR = _IFS0_IC1IF_MASK;
                IEC0SET = _IEC0_IC1IE_MASK;
              }
              break;

              case ES_INFRARED_MSG:
              {
                processMessage(ThisEvent.EventParam);
              }
              break;

              case ES_TERMINATE:
              {
                TurnOffLEDs();
                SendInfrared(ThisEvent.EventParam);
                SendLocomotion(ThisEvent.EventParam);
                CurrentState = Stopped;
              }
              break;

              default:
              {}
              break;
            }
        }
    }
    break;
    
    case Stopped:        
    {
      // Game Stopped - no Events
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
     QueryGameplayService

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
TemplateState_t QueryGameplayService(void)
{
  return CurrentState;
}

/***************************************************************************
 private functions
 ***************************************************************************/

/* Init Functions */
// Switches: Team (RA2), Robot A (RA3), Robot C (RA4), Robot B (RB4)
// Hall Effect (RB13)
static void InitInputs(){
  // All inputs are analog
  ANSELA = 0;
  ANSELB = 0;

  // Init all required input pins
  TRISAbits.TRISA2 = 1;
  TRISAbits.TRISA3 = 1;
  TRISAbits.TRISA4 = 1;
  TRISBbits.TRISB4 = 1;
  TRISBbits.TRISB13 = 1;

  // Init Input Capture 1 for Hall Effect
  // Note hall effect sensor is active low
  IC1R = 0b0011;                  // Input Capture 1 to RPB13
  IC1CONbits.ON = 0;              // Turn off IC1
  IC1CONbits.C32 = 0;             // 16-bit timer resource capture
  IC1CONbits.SIDL = 0;            // Continue to operate in idle mode 
  IC1CONbits.ICI = 0;             // Interrupt on every capture event 
  IC1CONbits.ICM = 0b010;         // Capture every falling edge only

  // Input Capture Interrupt
  IPC1bits.IC1IP = 7;             // Set priority of interrupt to 7
  IEC0SET = _IEC0_IC1IE_MASK;     // Interrupt local enable
  IFS0CLR = _IFS0_IC1IF_MASK;     // Clear interrupt flag 

  IC1CONbits.ON = 1;              // Turn on IC1
}

// Servo (RB10)
// Red LED (RB8), Blue LED (RB9), Green LED (RB12)
static void InitOutputs(){
  // Init all required output pins
  TRISBbits.TRISB8 = 0;           // Blue LED for team
  TRISBbits.TRISB9 = 0;           // Red LED for team
  TRISBbits.TRISB10 = 0;          // Servo for baton
  TRISBbits.TRISB12 = 0;          // Green LED for game status
  TRISAbits.TRISA0 = 0;           // debug
  LATAbits.LATA0 = 0;             // debug

  // Init Output Compare 3 for Servo
  RPB10R = 0b0101;                // Output Capture 3 to RPB10
  OC3CONbits.ON = 0;              // Turn off OC3
  OC3CONbits.SIDL = 0;            // Continue to operate in idle mode 
  OC3CONbits.OC32 = 0;            // 16-bit OC mode   
  OC3CONbits.OCTSEL = 1;          // Select timer 3
  OC3CONbits.OCM = 0b110;         // PWM mode, fault pin disabled
  PR3 = 50000;                    // 20ms as required for RC servos
  OC3RS = 0;                      // Set initial PWM as 0
  OC3R = 0;                       // Set initial PWM as 0
  OC3CONbits.ON = 1;              // Turn on OC3
}

// Timer 1: Gameplay Timer (2"18')
// Timer 2: SPI Regular Update Timer (every 5ms)
// Timer 3: Servo PWM Timer (3-12% DC at 20ms period)
static void InitTimers(){
  // Gameplay Timer
  T1CONbits.ON = 0;               // Turn off timer 1
  T1CONbits.TCS = 0;              // Internal clock
  T1CONbits.TGATE = 0;            // Disable gated time accumulation
  T1CONbits.TCKPS = 0b11;         // Prescaler of 256 to maximise length of time captured
  TMR1 = 0;                       // Clear timer 
  PR1 = 0xFFFF;                   // Set period register to max value 
  GameplayTimerOverflow = 0;      // Clear Gameplay Timer overflow value 
  
  // SPI Regular Update Timer
  T2CONbits.ON = 0;               // Turn off timer 2
  T2CONbits.TCS = 0;              // Internal clock
  T2CONbits.TCKPS = 0b001;        // Prescaler of 2 for 5ms
  TMR2 = 0;                       // Clear timer 
  PR2 = 50000;                    // Set period register to max value 

  // Servo PWM Timer 
  T3CONbits.ON = 0;               // Turn off timer 3
  T3CONbits.TCS = 0;              // Internal clock
  T3CONbits.TCKPS = 0b011;        // Prescaler of 8 for PWM
  TMR3 = 0;                       // Clear timer 
  
  // Global Interrupt Enable
  INTCONbits.MVEC = 1;            // Enable MVEC
  __builtin_enable_interrupts();  // Interrupt global enable 

  // Gameplay Timer Interrupt
  IPC1bits.T1IP = 7;              // Set priority of interrupt to 7
  IEC0SET = _IEC0_T1IE_MASK;      // Interrupt local enable
  IFS0CLR = _IFS0_T1IF_MASK;      // Clear interrupt flag

  // SPI Timer Interrupt
  IPC2bits.T2IP = 7;              // Set priority of interrupt to 7
  IEC0SET = _IEC0_T2IE_MASK;      // Interrupt local enable
  IFS0CLR = _IFS0_T2IF_MASK;      // Clear interrupt flag

  // Turn on timers
  T1CONbits.ON = 1;               // Turn on timer 1
  T2CONbits.ON = 1;               // Turn on timer 2
  T3CONbits.ON = 1;               // Turn on timer 3
   
}

// SPI1 (Locomotion): MOSI (RB5), CLK (RB14)
// SPI2 (Infrared): MOSI (RA1), MISO (RB6), CLK (RB15)
static void InitSPIs(){
  // SPI1 Init (Locomotion)
  TRISBbits.TRISB5 = 0;           // MOSI as output
  TRISBbits.TRISB14 = 0;          // CLK as output
  LATBbits.LATB5 = 1;             // Pull MOSI to high
  LATBbits.LATB14 = 1;            // Pull CLK to high
  RPB5R = 0b0011;                 // Set RB5 to SDO1
  SPI1CONbits.ON = 0;             // Turn off SPI1
  uint8_t clearVar = SPI1BUF;     // Clear SPI1BUF
  SPI1CONbits.ENHBUF = 0;         // Turn off enhanced buffer
  SPI1BRG = 99;                   // Set baud rate
  SPI1STATbits.SPIROV = 0;        // Clear overflow bit
  SPI1CONbits.MSTEN = 1;          // Master mode
  SPI1CONbits.CKE = 0;            // 2nd clock edge is active
  SPI1CONbits.CKP = 1;            // Clock idle is high
  SPI1CONbits.MSSEN = 0;          // slave select is manual
  SPI1CONbits.FRMPOL = 0;         // SS is active low
  SPI1CONbits.MODE16 = 0;         // 8-bit mode
  SPI1CONbits.MODE32 = 0;         // 8-bit mode
  SPI1CONbits.MCLKSEL = 0;        // Use PBCLK
  SPI1CONbits.SSEN = 0;           // SS pin not used for slave mode 
  SPI1CONbits.ON = 1;             // Turn on SPI1

  // SPI2 Init (Infrared)
  TRISAbits.TRISA1 = 0;           // MOSI as output
  TRISBbits.TRISB6 = 1;           // MISO as input
  TRISBbits.TRISB15 = 0;          // CLK as output
  LATBbits.LATB6 = 1;             // Pull MOSI to high
  LATBbits.LATB15 = 1;            // Pull CLK to high
  RPA1R = 0b0100;                 // Set RA1 to SDO2
  SDI2R = 0b0001;                 // Set RB6 as SDI2
  SPI2CONbits.ON = 0;             // Turn off SPI2
  clearVar = SPI2BUF;             // Clear SPI2BUF
  SPI2CONbits.ENHBUF = 0;         // Turn off enhanced buffer
  SPI2BRG = 99;                   // Set baud rate
  SPI2STATbits.SPIROV = 0;        // Clear overflow bit
  SPI2CONbits.MSTEN = 1;          // Master mode
  SPI2CONbits.CKE = 0;            // 2nd clock edge is active
  SPI2CONbits.CKP = 1;            // Clock idle is high
  SPI2CONbits.MSSEN = 0;          // slave select is manual
  SPI2CONbits.FRMPOL = 0;         // SS is active low
  SPI2CONbits.MODE16 = 0;         // 8-bit mode
  SPI2CONbits.MODE32 = 0;         // 8-bit mode
  SPI2CONbits.MCLKSEL = 0;        // Use PBCLK
  SPI2CONbits.SSEN = 0;           // SS pin not used for slave mode 
  SPI2CONbits.ON = 1;             // Turn on SPI2
}

static void ReadSwitches(){
  isBlueTeam = PORTAbits.RA2;
  isRobotA = PORTAbits.RA3;
  isRobotB = PORTBbits.RB4;
  isRobotC = PORTAbits.RA4;
}

static void TurnOnLEDs(){
  if (isBlueTeam){
    LATBbits.LATB8 = 1;
    LATBbits.LATB9 = 0;
  } else {
    LATBbits.LATB8 = 0;
    LATBbits.LATB9 = 1;
  }
  LATBbits.LATB12 = 1;              // Turn on Green LED
}

static void TurnOffLEDs(){
  LATBbits.LATB8 = 0;
  LATBbits.LATB9 = 0;
  LATBbits.LATB12 = 0;
}

/* Helper Functions */
static void RaiseBaton(){
  OC3RS = 6000;                     // Baton raised at 12% DC
}

static void LowerBaton(){    
  OC3RS = 1500;                     // Baton lowered at 3% DC
}

static void SendLocomotion(uint8_t message){
  // First queue is for locomotion (follower 1)
  enqueue(1, message);
}

static void SendInfrared(uint8_t message){
  // Second queue is for infrared (follower 2)
  enqueue(2, message);
}

static void processMessage(uint16_t message){
  if (message == 100){
    // Receive Baton Event
    ES_Event_t ReceiveBatonEvent;
    ReceiveBatonEvent.EventType = ES_RX_BATON;
    PostGameplayService(ReceiveBatonEvent);
  } else if ((message == 125) || (message == 150) || (message == 175) || (message == 225)){
    // Locomotion Events
    SendLocomotion(message);
    printf("Received: %u\n", message);
  } else {
    //printf("SPI Error: %u\n", message);
  }
}

static void ActivateFollowers(){
  uint8_t message;
  if(isRobotA){
    message = 20;
  } else if (isRobotB){
    message = 40;
  } else if (isRobotC){
    message = 60;
  }
  SendLocomotion(message);
  if (isBlueTeam){
    message = message + 10;
  }
  SendInfrared(message);
}

/* Interrupts */
// Gameplay Timer ISR

void __ISR(_TIMER_1_VECTOR, IPL7SOFT) GameplayTimerISR(){
  IFS0CLR = _IFS0_T1IF_MASK;
  GameplayTimerOverflow++;
  // If last full timer cycle, change PR1 value
  if(GameplayTimerOverflow == 164){
    PR1 = 33346;
  }
  // If time over, post a termination event.
  if(GameplayTimerOverflow == 165){
    __builtin_disable_interrupts();             // note logic may cause bugs 
    ES_Event_t TerminationEvent;
    TerminationEvent.EventType = ES_TERMINATE;
    TerminationEvent.EventParam = 66;
    PostGameplayService(TerminationEvent);
  }
}

// Hall Effect Input Capture ISR
void __ISR(_INPUT_CAPTURE_1_VECTOR, IPL7SOFT) HallEffectISR(){
  IFS0CLR = _IFS0_IC1IF_MASK;
  IEC0CLR = _IEC0_IC1IE_MASK;
  ES_Event_t HallEffectEvent;
  HallEffectEvent.EventType = ES_TX_BATON;
  HallEffectEvent.EventParam = 12;
  PostGameplayService(HallEffectEvent);
}

// SPI Regular Update ISR
void __ISR(_TIMER_2_VECTOR, IPL7SOFT) SPIUpdateISR(){
  //LATAbits.LATA0 = 1;               // time measurement
  IFS0CLR = _IFS0_T2IF_MASK;
  // SPI1 (Locomotion)
  // Send the next message in the queue if present
  if(!isQueueEmpty(1)){
    uint8_t message = dequeue(1);
    SPI1BUF = message;
  }
  // SPI2 (Infrared)
  // Read the buffer and send the appropriate event to self
  uint8_t receivedMessage = SPI2BUF;
  if ((receivedMessage != 0) || (receivedMessage != 255)){
    ES_Event_t ReceivedMessageEvent;
    ReceivedMessageEvent.EventParam = receivedMessage;
    ReceivedMessageEvent.EventType = ES_INFRARED_MSG;
    PostGameplayService(ReceivedMessageEvent);
  }
  // Send the next message in the queue if present 
  if(!isQueueEmpty(2)){
    uint8_t message = dequeue(2);
    SPI2BUF = message;
  } else {
    SPI2BUF = 0;                    // Pumping byte 
  }
  //LATAbits.LATA0 = 0;               // time measurement 
}
