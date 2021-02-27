/****************************************************************************

  Header file for MorseAverage:
 * Declares the union ?MyTimer? to contain a uint32_t struct, 
 * which contains a uint16_t that stores rollover count, 
 * and a uint16_t that reads from the input capture buffer

 ****************************************************************************/

#ifndef IR_H
#define IR_H

 #include <stdint.h>
 #include <stdbool.h>
 #include <stdio.h> 
 #include <string.h>
#include <xc.h>
#include <sys/attribs.h>

#include "ES_Events.h"
#include "ES_Port.h"                // needed for definition of REENTRANT

//State Def
typedef enum
{
	InitPState, Running, SendingNumLaps, Off
    //InitPState, Waiting2InchForward, SendingNumTxs, Waiting2RxBaton, BlinkFreq2, FollowPath, Aligning
} IRState_t;

// Type Def:
typedef union {
    struct Mystructure 
    {
        uint16_t buffRead; //lower 16 bits
        uint16_t rolloverCount; //higher 16 bits

    } RealTime;
    uint32_t realTime;
} Timer; 

// Public Function Prototypes
void _initTimer2();
void _initIC4();
bool InitIR(uint8_t Priority);
bool PostIR(ES_Event_t ThisEvent);
ES_Event_t RunIR(ES_Event_t ThisEvent);
IRState_t QueryIR(void);

#endif /* IR_H */

