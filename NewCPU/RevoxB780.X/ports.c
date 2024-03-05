#include "ports.h"
#include "bitop.h"

void DoClock()
{
    // max 50 kHz
    _delay_us(16);
    bitclr(PORTB, OUT_PB2_STROBE); // set strobe to low
    _delay_us(5);
    bitset(PORTB, OUT_PB2_STROBE); // set strobe to high -> latch
    _delay_us(2);
}

void LoadOutputMultiplexer(MultiplexOutEnum outputNbr, unsigned char value)
{
    // Set address an port A, bits 0..2
    PORTA &= 0xF8;    // reset first 3 bits
    PORTA |= outputNbr; // set output nbr
    // Set value to DATA pin
    if (value) bitset(PORTD, OUT_PD4_DATA);
    else bitclr (PORTD, OUT_PD4_DATA);
    // toggle enable of IC4 (LS259) DLEN4
    bitset(PORTB, OUT_PB4_DLEN4);
    bitclr(PORTB, OUT_PB4_DLEN4);
    bitset(PORTB, OUT_PB4_DLEN4);
}

void WriteToDisplay(unsigned char pin, unsigned short data, unsigned char loadbit)
{
    // strobe is always high, if set to low, duration is about 5us
    // data is latched on positive edge of strobe pin
    // strobe is inverted with 3 NAND gates in series
    PORTA |= 0b00000111;  // set A, B, C to high -> enable clock
    bitset(PORTD, OUT_PD7_S); // set S to high too
    bitset(PORTB, OUT_PB2_STROBE); // set strobe to high
    PORTB &= 0b00000111;  // clear all DLEN and STROBE
    bitset(PORTB, OUT_PB4_DLEN4);     // disable output multiplexer enable
    bitclr(PORTD, OUT_PD4_DATA);      // set startbit (0)
    bitset(PORTB, pin);       // enable SAA1060
    DoClock();
    for (char i=0; i<16; i++)
    {
        // write data
        if (data & 0x01) bitset(PORTD, OUT_PD4_DATA);
        else bitclr(PORTD, OUT_PD4_DATA);
        DoClock();
        data = data >> 1; // next bit
    }
    // loadbit
    if (loadbit) bitset(PORTD, OUT_PD4_DATA);
    else bitclr(PORTD, OUT_PD4_DATA);
    DoClock();
    // load pulse
    _delay_us(2);
    PORTB &= 0b00000111;  // clear all DLEN
    bitclr(PORTD, OUT_PD4_DATA);      // reset data pin
    DoClock();
    // cleanup
    PORTA &= 0b1111000;  // set A, B, C to low
    bitclr(PORTD, OUT_PD7_S); // set S to low too
}