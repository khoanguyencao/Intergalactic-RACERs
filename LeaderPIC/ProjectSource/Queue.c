/****************************************************************************
 Module
   Queue.c

 Revision
   1.0.0

 Description
   Queue is a rapid implementation of a ring buffer queue in C for the SPI 
   communication in the leader. Can be used in follower SPIs if required.
   Adapted to two queues for two SPI systems for leader.

 Notes
    Adapted from https://www.tutorialspoint.com/data_structures_algorithms/queue_program_in_c.htm
    with improvements for function naming + readability + addit. functionality
    (error checking and print debugging).

 History
 When           Who     What/Why
 -------------- ---     --------
 02/22/21       kcao    Creation of file
****************************************************************************/
#include <stdio.h>
#include <stdbool.h>
// Define static variables for module 
#define QUEUE_SIZE 10
static uint8_t queue1[QUEUE_SIZE];
static uint8_t queue2[QUEUE_SIZE];
static uint8_t front1 = 0;
static uint8_t front2 = 0;
static uint8_t back1 = 0;
static uint8_t back2 = 0;
static uint8_t count1 = 0;
static uint8_t count2 = 0;

// Returns whether queue is empty
// Returns error if wrong queue number and false
bool isQueueEmpty(uint8_t queueNumber){
    if (queueNumber == 1){
        return (count1 == 0);
    } else if (queueNumber == 2){
        return (count2 == 0);
    } else {
        printf("Error: Wrong Queue Number\n");
        return 0;
    }
}

// Returns whether queue is full
// Returns error if wrong queue number and false
bool isQueueFull(uint8_t queueNumber){
    if (queueNumber == 1){
        return (count1 == QUEUE_SIZE);
    } else if (queueNumber == 2){
        return (count2 == QUEUE_SIZE);
    } else {
        printf("Error: Wrong Queue Number\n");
        return 0;
    }
}

// Enqueues data, accepts only a uint8_t
// ** Requires you to check whether queue is NOT full first! **
// ** Will print an error if queue is full **
void enqueue(uint8_t queueNumber, uint8_t data){
    if(!isQueueFull(queueNumber)){
        if (queueNumber == 1){
            if(back1 == QUEUE_SIZE){
                back1 = 0;
            }
            queue1[back1] = data;
            back1++;
            count1++;
        } else if (queueNumber == 2){
            if(back2 == QUEUE_SIZE){
                back2 = 0;
            }
            queue2[back2] = data;
            back2++;
            count2++;
        }
    } else {
        printf("Error: Queue %u Full!\n", queueNumber);
    }
}

// Dequeues data, returns only a uint8_t
// ** Requires you to check whether queue is NOT empty first! **
// ** Will print an error if queue is empty, and return 0 **
uint8_t dequeue(uint8_t queueNumber){
    if(!isQueueEmpty(queueNumber)){
        if(queueNumber == 1){
            uint8_t data = queue1[front1];
            front1++;
            if(front1 == QUEUE_SIZE){
                front1 = 0;
            }
            count1--;
            return data;
        } else if (queueNumber == 2){
            uint8_t data = queue2[front2];
            front2++;
            if(front2 == QUEUE_SIZE){
                front2 = 0;
            }
            count2--;
            return data;
        } else {
            printf("Error: Wrong Queue Number\n");
            return 0;
        }
    } else {
        printf("Error: Queue %u Empty!\n", queueNumber);
        return 0;
    }
}

// Allows clearing of the queue
void clearQueue(uint8_t queueNumber){
    if(queueNumber == 1){
        front1 = 0;
        back1 = 0;
        count1 = 0;
    } else if (queueNumber == 2) {
        front2 = 0;
        back2 = 0;
        count2 = 0;
    } else {
        printf("Error: Wrong Queue Number\n");
    }
}

// Function to print out the queue from front to back 
void printDebugQueue(uint8_t queueNumber){
    if (queueNumber == 1){
        printf("Queue 1 (Front to Back): ");
        for(int i = 0; i < count1; i++){
            printf("%u ", queue1[(front1 + i) % 10]);
        }
        printf("\n");
    } else if (queueNumber == 2){
        printf("Queue 2 (Front to Back): ");
        for(int i = 0; i < count2; i++){
            printf("%u ", queue2[(front2 + i) % 10]);
        }
        printf("\n");
    } else {
        printf("Error: Wrong Queue Number\n");
    }
}