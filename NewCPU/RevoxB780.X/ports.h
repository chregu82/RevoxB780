/* 
 * File:   ports.h
 * Author: lehne
 *
 * Created on 26. Februar 2024, 20:51
 */

#ifndef PORTS_H
#define	PORTS_H

#ifdef	__cplusplus
extern "C" {
#endif

#define F_CPU 8000000
#include <util/delay.h>
#include <avr/io.h>

// Port A
#define OUT_PA0_A PA0
#define OUT_PA1_B PA1
#define OUT_PA2_C PA2
#define IN_PA3_Mul7 PA3
#define OUT_PA4_NF5 PA4
#define OUT_PA5_NF6 PA5
#define OUT_PA6_NF7 PA6
#define OUT_PA7_NF8 PA7
    
//Port B
#define OUT_PB0_ST PB0
#define OUT_PB1_DON PB1
#define OUT_PB2_STROBE PB2
#define OUT_PB3_DLEN5 PB3
#define OUT_PB4_DLEN4 PB4
#define OUT_PB5_DLEN3 PB5
#define OUT_PB6_DLEN2 PB6
#define OUT_PB7_DLEN1 PB7
    
//Port C
#define IN_PC6_Mul8 PC6
#define IN_PC7_Mul9 PC7
    
//Port D
#define OUT_PD0_NF1 PD0
#define OUT_PD1_NF2 PD1
#define OUT_PD2_NF3 PD2
#define OUT_PD3_NF4 PD3
#define OUT_PD4_DATA PD4
#define OUT_PD5_PONLR PD5
#define OUT_PD6_PH PD6
#define OUT_PD7_S PD7
    
//Port E
#define IN_PE4_Mul10 PE4
#define IN_PE5_Z PE5
#define IN_PE6_Mul6 PE6
    
typedef enum MultiplexOutEnum
{
    Mul_Out_STFI,
    Mul_Out_MC,
    Mul_Out_25us,
    Mul_Out_75us,
    Mul_Out_WW,
    Mul_Out_SPB,
    Mul_Out_SPA,
    Mul_Out_MUT
} MultiplexOutEnum;

void LoadOutputMultiplexer(MultiplexOutEnum outputNbr, unsigned char value);
void WriteToDisplay(unsigned char pin, unsigned short data, unsigned char loadbit);


#ifdef	__cplusplus
}
#endif

#endif	/* PORTS_H */

