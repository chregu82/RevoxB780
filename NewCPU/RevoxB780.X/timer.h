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

#define TICK_TIME_US    128
#define TICK_128_US TCNT1     // 128us Tick (8MHz / 1024)

#define TICKS_500ms (unsigned short)(500000/TICK_TIME_US)   // 3906


#ifdef	__cplusplus
}
#endif

#endif	/* TIMER_H */

