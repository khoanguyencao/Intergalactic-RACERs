/****************************************************************************
 Module
   IRTestHarness.c

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
#include "IRTestHarness.h"
#include "IR.h"

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
#include "ES_Events.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>




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
bool InitIRTestHarness(uint8_t Priority)
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
bool PostIRTestHarness(ES_Event_t ThisEvent)
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
ES_Event_t RunIRTestHarness(ES_Event_t ThisEvent)
{
  ES_Event_t ReturnEvent;
  ReturnEvent.EventType = ES_NO_EVENT; // assume no errors
  static char DeferredChar = '1';

  switch (ThisEvent.EventType)
  {
    case ES_INIT:
    {
        printf("key shifter \n");
    }
    break;

    break;
    case ES_NEW_KEY:   // announce
    {
        // emit frequency 1
      if ('q' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_FREQ1;
          PostIR(ThisEvent);
      }
      // emit frequency 2
      if ('w' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_FREQ2;
          PostIR(ThisEvent);
      }
      // emit frequency 3
      if ('e' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_FREQ3;
          PostIR(ThisEvent);
      }
      
      // emit frequency 4
      if ('r' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_FREQ4;
          PostIR(ThisEvent);
      }
      
      // blink 1 time
      if ('1' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_BLINK;
          ThisEvent.EventParam = 1;
          PostIR(ThisEvent);
      }
      // blink 2 times
      if ('2' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_BLINK;
          ThisEvent.EventParam = 2;
          PostIR(ThisEvent);
      }
      
      // blink 3 times
      if ('3' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_BLINK;
          ThisEvent.EventParam = 3;
          PostIR(ThisEvent);
      }
      // blink 5 times
      if ('5' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_BLINK;
          ThisEvent.EventParam = 5;
          PostIR(ThisEvent);
      }
      // blink 9 times
      if ('9' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_BLINK;
          ThisEvent.EventParam = 9;
          PostIR(ThisEvent);
      }
      // blink 20 times
      if ('0' == ThisEvent.EventParam)
      {
          ThisEvent.EventType = ES_BLINK;
          ThisEvent.EventParam = 20;
          PostIR(ThisEvent);
      }
      
    }
    break;
    default:
    {}
     break;
  }

  return ReturnEvent;
}