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

// leader to loco parameters
#define RACER_A 20
#define RACER_B 40
#define RACER_C 60
#define GAME_END 66
#define TRANSMIT_BATON 12
// IR to loco parameters
#define LEFT_DETECTED 125
#define RIGHT_DETECTED 225
#define BOTH_DETECTED 150
#define RECEIVE_BATON 100
#define FREQ_CHANGE 175
#define NO_DETECT 250

bool InitLocomotion(uint8_t Priority);
bool PostLocomotion(ES_Event_t ThisEvent);
ES_Event_t RunLocomotion(ES_Event_t ThisEvent);

typedef enum
{
  InitState=0, WaitingState, FollowPathState, KeepPathState, TurnLeftState, TurnRightState, StraightState, StoppedState, InchingState
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

