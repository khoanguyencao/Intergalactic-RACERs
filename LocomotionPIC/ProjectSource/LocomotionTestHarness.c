/****************************************************************************
 Module
   LocomotionTestHarness.c

 Revision
   1.0.1

 Description
   This is the first service for the Test Harness under the
   Gen2 Events and Services Framework.

 Notes

 History
 When           Who     What/Why
 -------------- ---     --------

****************************************************************************/
/*----------------------------- Include Files -----------------------------*/
// This module
#include "../ProjectHeaders/LocomotionTestHarness.h"
#include "Locomotion.h"

// debugging printf()
//#include "dbprintf.h"

// Hardware
#include <xc.h>
#include <proc/p32mx170f256b.h>
#include <sys/attribs.h> // for ISR macors

// Event & Services Framework
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "ES_DeferRecall.h"
#include "ES_ShortTimer.h"
#include "ES_Port.h"

/*----------------------------- Module Defines ----------------------------*/
/*---------------------------- Module Functions ---------------------------*/
/* prototypes for private functions for this service.They should be functions
   relevant to the behavior of this service
*/
/*---------------------------- Module Variables ---------------------------*/
// with the introduction of Gen2, we need a module level Priority variable
static uint8_t MyPriority;
// add a deferral queue for up to 3 pending deferrals +1 to allow for overhead
static ES_Event_t DeferralQueue[3 + 1];


 
/*------------------------------ Module Code ------------------------------*/
/****************************************************************************
 Function
     InitTestHarnessService0

 Parameters
     uint8_t : the priorty of this service

 Returns
     bool, false if error in initialization, true otherwise

 Description
     Saves away the priority, and does any
     other required initialization for this service
 Notes

 Author
     J. Edward Carryer, 01/16/12, 10:00
****************************************************************************/
bool InitLocomotionTestHarness(uint8_t Priority)
{
  ES_Event_t ThisEvent;

  MyPriority = Priority;
  /********************************************
   in here you write your initialization code
   *******************************************/
  // initialize deferral queue for testing Deferal function
  ES_InitDeferralQueueWith(DeferralQueue, ARRAY_SIZE(DeferralQueue));
  // initialize LED drive for testing/debug output

  // initialize the Short timer system for channel A
  //ES_ShortTimerInit(MyPriority, SHORT_TIMER_UNUSED);
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
     PostTestHarnessService0

 Parameters
     EF_Event ThisEvent ,the event to post to the queue

 Returns
     bool false if the Enqueue operation failed, true otherwise

 Description
     Posts an event to this state machine's queue
 Notes

 Author
     J. Edward Carryer, 10/23/11, 19:25
****************************************************************************/
bool PostLocomotionTestHarness(ES_Event_t ThisEvent)
{
  return ES_PostToService(MyPriority, ThisEvent);
}

/****************************************************************************
 Function
    RunTestHarnessService0

 Parameters
   ES_Event : the event to process

 Returns
   ES_Event, ES_NO_EVENT if no error ES_ERROR otherwise

 Description
   add your description here
 Notes

 Author
   J. Edward Carryer, 01/15/12, 15:23
****************************************************************************/
ES_Event_t RunLocomotionTestHarness(ES_Event_t ThisEvent)
{
  ES_Event_t ReturnEvent;
  ReturnEvent.EventType = ES_NO_EVENT; // assume no errors
  static char DeferredChar = '1';

  switch (ThisEvent.EventType)
  {
    case ES_INIT:
    {
        printf("key shifter \r\n");
    }
    break;

    break;
    case ES_NEW_KEY:   // announce
    {
        // init as racer a
        if ('a' == ThisEvent.EventParam)
      {
            printf("racer_a\r\n");
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = RACER_A;
          PostLocomotion(ThisEvent);
      }
        // init as racer b
        if ('b' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = RACER_B;
          PostLocomotion(ThisEvent);
      }
        // init as racer c
      if ('c' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = RACER_C;
          PostLocomotion(ThisEvent);
      }
      // both detected
      if ('2' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = BOTH_DETECTED;
          PostLocomotion(ThisEvent);
      }
      // detect only on the left
      if ('l' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = LEFT_DETECTED;
          PostLocomotion(ThisEvent);
      }
      
      // detect only on the right
      if ('r' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = RIGHT_DETECTED;
          PostLocomotion(ThisEvent);
      }
      
      // transmit baton detect
      if ('t' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = TRANSMIT_BATON;
          PostLocomotion(ThisEvent);
      }
      
      // receive baton detected
      if ('y' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = RECEIVE_BATON;
          PostLocomotion(ThisEvent);
      }
        
        // start waiting timer timeout
      if ('w' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_TIMEOUT;
          ThisEvent.EventParam = START_WAIT_TIMER;
          PostLocomotion(ThisEvent);
      }
        
        // inching timer timeout
      if ('i' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_TIMEOUT;
          ThisEvent.EventParam = INCH_TIMER;
          PostLocomotion(ThisEvent);
      }
        // receive baton detected
      if ('f' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = FREQ_CHANGE;
          PostLocomotion(ThisEvent);
      }
        
        // end of game received
      if ('e' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_RECEIVE;
          ThisEvent.EventParam = GAME_END;
          PostLocomotion(ThisEvent);
      }
        
        
      
    }
    break;
    default:
    {}
     break;
  }

  return ReturnEvent;
}