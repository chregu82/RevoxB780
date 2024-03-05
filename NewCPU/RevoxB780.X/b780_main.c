/*
 * File:   b780_main.c
 * Author: Christian Lehner
 *
 * Created on 4. Januar 2024, 21:59
 */

#include "fuses.h"
#include "bitop.h"
#include "ports.h"

int main(void)
{
    // Ports configuration (IN/OUT)
    DDRA = (1<<OUT_PA0_A) | (1<<OUT_PA1_B) | (1<<OUT_PA2_C) | (1<<OUT_PA4_NF5) | (1<<OUT_PA5_NF6) | (1<<OUT_PA6_NF7) | (1<<OUT_PA7_NF8);
    DDRB = 0xFF - (1<<OUT_PB1_DON);     // DON is either 0 or floating, has pull-up and therefore is high if configured as output
    DDRC = 0;     // inputs only
    DDRD = 0xFF;  // outputs only
    DDRE = 0;     // inputs only
    
    // init stereo signal
    PORTB = (1<<OUT_PB0_ST) | (1<<OUT_PB2_STROBE);
    // DON is already high with pull-up
    PORTD = (1<<OUT_PD0_NF1) | (1<<OUT_PD1_NF2)  | (1<<OUT_PD2_NF3) | (1<<OUT_PD3_NF4) | (1<<OUT_PD7_S);     // NF1-4 are high, S is high
    PORTA = (1<<OUT_PA4_NF5) | (1<<OUT_PA5_NF6) | (1<<OUT_PA6_NF7) | (1<<OUT_PA7_NF8);      // NF5-8 are high
    
    // Init output multiplexer (set everything to 0)
    for (char i=0; i<=7; i++)
    {
        LoadOutputMultiplexer(i, 0);
    }
      
    unsigned char dig3 = 0;
    unsigned char dig4 = 0;
    unsigned char dig5 = 1;
    unsigned char Upper = 0;
    unsigned char Mode = 0;
    unsigned char Record = 0;
    unsigned char Play = 1;

    while (1)
    {
        _delay_ms (1000);
        //DisplayFreq(dig3,dig4,dig5,dig4,dig5);
        DisplayFreq(1, 0,'S','T','E','F');
        DisplayTuningRecordPlay('F', 1, dig3, Record, dig3, Play);
        dig4++;
        dig4 %= 31;
        dig5++;
        dig5 %= 31;
        dig3 = !dig3;
        Upper++;
        Upper %= 3;
        Mode++;
        Mode %= 13;
        Record++;
        Record %= 6;
        Play++;
        Play %= 6;
    }
}
