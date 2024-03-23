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

#define TICKS_10ms (unsigned short)(10000/TICK_TIME_US)   // 78
#define TICKS_100ms (unsigned short)(100000/TICK_TIME_US)   // 781
#define TICKS_250ms (unsigned short)(250000/TICK_TIME_US)   // 1953
#define TICKS_500ms (unsigned short)(500000/TICK_TIME_US)   // 3906
#define TICKS_1s (unsigned short)(1000000/TICK_TIME_US)   // 7812
#define TICKS_2s (unsigned short)(1000000/TICK_TIME_US)   // 15625

// On delay    
typedef struct TON_Type
{
    unsigned char In;
    unsigned short Delay;
    unsigned short Tmr;
    unsigned char Q;
    unsigned char oldIn;
} TON_Type;

void TON(TON_Type* inst);


#ifdef	__cplusplus
}
#endif

#endif	/* TIMER_H */

