/****************************************************************************

  Header file for Locomotion Test Harness 
  based on the Gen 2 Events and Services Framework

 ****************************************************************************/

#ifndef LocomotionTestHarness_H
#define LocomotionTestHarness_H

#include <stdint.h>
#include <stdbool.h>

#include "ES_Events.h"
#include "ES_Port.h"                // needed for definition of REENTRANT
// Public Function Prototypes

bool InitLocomotionTestHarness(uint8_t Priority);
bool PostLocomotionTestHarness(ES_Event_t ThisEvent);
ES_Event_t RunLocomotionTestHarness(ES_Event_t ThisEvent);

#endif /* LocomotionTestHarness_H */
