/****************************************************************************

  Header file for IR Test Harness
  based on the Gen 2 Events and Services Framework

 ****************************************************************************/

#ifndef IRTestHarness_H
#define IRTestHarness_H

#include <stdint.h>
#include <stdbool.h>
 #include <stdio.h> 
 #include <string.h>
#include <xc.h>
#include <sys/attribs.h>

#include "ES_Events.h"
#include "ES_Port.h"                // needed for definition of REENTRANT
// Public Function Prototypes

bool InitIRTestHarness(uint8_t Priority);
bool PostIRTestHarness(ES_Event_t ThisEvent);
ES_Event_t RunIRTestHarness(ES_Event_t ThisEvent);

#endif /* IRTestHarness_H */
