#ifndef Queue_H
#define Queue_H

// Public Function Prototypes
bool isQueueEmpty(uint8_t queueNumber);
bool isQueueFull(uint8_t queueNumber);
void enqueue(uint8_t queueNumber, uint8_t data);
uint8_t dequeue(uint8_t queueNumber);
void clearQueue(uint8_t queueNumber);
void printDebugQueue(uint8_t queueNumber);

#endif /*Queue_H */
