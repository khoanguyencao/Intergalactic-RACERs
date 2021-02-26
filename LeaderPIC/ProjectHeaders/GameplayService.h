/****************************************************************************

  Header file for template Flat Sate Machine
  based on the Gen2 Events and Services Framework

 ****************************************************************************/

#ifndef GameplayService_H
#define GameplayService_H

// Event Definitions
#include "ES_Configure.h" /* gets us event definitions */
#include "ES_Types.h"     /* gets bool type for returns */

// typedefs for the states
// State definitions for use with the query function
typedef enum
{
  InitPState, YesBaton, NoBaton, Stopped
}TemplateState_t;

// Public Function Prototypes

bool InitGameplayService(uint8_t Priority);
bool PostGameplayService(ES_Event_t ThisEvent);
ES_Event_t RunGameplayService(ES_Event_t ThisEvent);
TemplateState_t QueryGameplayService(void);

#endif /* GameplayService_H */

