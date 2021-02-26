/* 
 * File:   Locomotion.h
 * Author: meiha
 *
 * Created on February 21, 2021, 11:16 PM
 */

#ifndef LOCOMOTION_H
#define	LOCOMOTION_H

#include <stdint.h>
#include <stdbool.h>

#include "ES_Events.h"
#include "ES_Configure.h"

bool InitLocomotion(uint8_t Priority);
bool PostLocomotion(ES_Event_t ThisEvent);
ES_Event_t RunLocomotion(ES_Event_t ThisEvent);

typedef enum
{
  InitPState=0, Running
}LocoState_t;

// set up union for combining overflow with IC time
typedef union{
    struct{
        uint16_t low;
        uint16_t high;
    }byBytes;
    uint32_t asTime;
}CombTime_t;

#endif	/* LOCOMOTION_H */

