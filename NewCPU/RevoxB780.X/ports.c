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

void DisplayFreq(unsigned char On, unsigned char dig1, unsigned char dig2, unsigned char dig3, unsigned char dig4, unsigned char dig5)
{
    // Display off
    if (On == 0)
    {
        WriteToDisplay(OUT_PB7_DLEN1, 0xFFFF, 0);
        WriteToDisplay(OUT_PB7_DLEN1, 0xFFFF, 1);
        return;
    }
    
    // Display on
    unsigned short dataA = 0;
    unsigned short dataB = 0;

    if (dig2 > 9) dig2 = dig2 +10 - 'A';
    if (dig3 > 9) dig3 = dig3 +10 - 'A';
    if (dig4 > 9) dig4 = dig4 +10 - 'A';
    if (dig5 > 9) dig5 = dig5 +10 - 'A';

    dataA |= (FreqLow[dig4] << 8);
    dataA |= FreqHigh[dig2];
    if (dig1) bitclr(dataA, 7);   // 1
    else bitset(dataA, 7);
    WriteToDisplay(OUT_PB7_DLEN1, dataA, 0);

    dataB |= (FreqLow[dig5] << 8);
    dataB |= FreqHigh[dig3];
    if (dig3) bitclr(dataB, 12);   // Dot
    else bitset(dataB, 12);
    WriteToDisplay(OUT_PB7_DLEN1, dataB, 1);
}

void DisplayTuningRecordPlay(unsigned char Upper, unsigned char Mode, unsigned char Dolby, unsigned char Record, unsigned char Stereo, unsigned char Input)
{
    unsigned short dataA = 0;
    unsigned short dataB = 0;
    
    // Upper/Lower
    if (Upper == 'F')
    {
        dataA |= 0b01000101;
    }
    else
    {
        dataA |= 0b01110110;
        if ((Upper == 0) || (Upper == 1))       // off or lower bar
          bitset(dataA, 3); // clear upper bar
        if ((Upper == 0) || (Upper == 2))       // off or upper bar
          bitset(dataA, 0); // clear lower bar
    }
    // Dolby
    if (Dolby == 0) bitset(dataA, 7);
    // Record
    dataA |= (RecordPlayDisp[Record] << 8);
    // Stereo
    if (Stereo == 0) bitset(dataA, 15);
    // Record
    WriteToDisplay(OUT_PB6_DLEN2, dataA, 0);
    
    // Tuning Mode (Memory)
    dataB |= TuningModeDisp[Mode];
    // Dolby
    if (Dolby == 0) bitset(dataB, 7);
    // Play
    dataB |= (RecordPlayDisp[Input] << 8);
    // Stereo
    if (Stereo == 0) bitset(dataB, 15);
    WriteToDisplay(OUT_PB6_DLEN2, dataB, 1);
}
