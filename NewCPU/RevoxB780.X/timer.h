/* 
 * File:   timer.h
 * Author: lehne
 *
 * Created on March 10, 2024, 7:21 PM
 */

#ifndef TIMER_H
#define	TIMER_H

#ifdef	__cplusplus
extern "C"
{
#endif
    
#include <avr/io.h>

#define TICK_TIME_US    128
#define TICK_128_US TCNT1     // 128us Tick (8MHz / 1024)

#define TICKS_10ms (unsigned int)(10000/TICK_TIME_US)   // 78
#define TICKS_25ms (unsigned int)(25000/TICK_TIME_US)   // 195
#define TICKS_50ms (unsigned int)(50000/TICK_TIME_US)   // 390
#define TICKS_100ms (unsigned int)(100000/TICK_TIME_US)   // 781
#define TICKS_125ms (unsigned int)(125000/TICK_TIME_US)   // 976
#define TICKS_200ms (unsigned int)(200000/TICK_TIME_US)   // 1562
#define TICKS_250ms (unsigned int)(250000/TICK_TIME_US)   // 1953
#define TICKS_500ms (unsigned int)(500000/TICK_TIME_US)   // 3906
#define TICKS_1s (unsigned int)(1000000/TICK_TIME_US)   // 7812
#define TICKS_2s (unsigned int)(2000000/TICK_TIME_US)   // 15625
#define TICKS_3s (unsigned int)(3000000/TICK_TIME_US)   // 23437

// On delay    
typedef struct TON_Type
{
    unsigned char In;
    unsigned int Delay;
    unsigned int Tmr;
    unsigned char Q;
    unsigned char oldIn;
} TON_Type;

void InitTimer();

void TON(TON_Type* inst);


#ifdef	__cplusplus
}
#endif

#endif	/* TIMER_H */

