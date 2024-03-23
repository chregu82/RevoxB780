#include "ports.h"
#include "bitop.h"
#include <string.h>

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
    bitset(PORTB, OUT_PB4_DLEN4_OUTMUL);
    bitclr(PORTB, OUT_PB4_DLEN4_OUTMUL);
    bitset(PORTB, OUT_PB4_DLEN4_OUTMUL);
}

void WriteToSAA(unsigned char pin, unsigned short data, unsigned char loadbit)
{
    // strobe is always high, if set to low, duration is about 5us
    // data is latched on positive edge of strobe pin
    // strobe is inverted with 3 NAND gates in series
    PORTA |= 0b00000111;  // set A, B, C to high -> enable clock
    bitset(PORTD, OUT_PD7_S); // set S to high too
    bitset(PORTB, OUT_PB2_STROBE); // set strobe to high
    PORTB &= 0b00010111;  // clear all DLEN and STROBE
    bitclr(PORTD, OUT_PD4_DATA);      // set startbit (0)
    bitset(PORTB, pin);       // enable SAA
    DoClock();
    for (char i=0; i<16; i++)
    {
        // write data
        if (pin == OUT_PB5_DLEN3_TUNER)
        {
            if (data & 0x8000) bitset(PORTD, OUT_PD4_DATA);
            else bitclr(PORTD, OUT_PD4_DATA);
            data = data << 1; // next bit
        }
        else
        {
            if (data & 0x01) bitset(PORTD, OUT_PD4_DATA);
            else bitclr(PORTD, OUT_PD4_DATA);
            data = data >> 1; // next bit
        }
        DoClock();
    }
    // loadbit (SAA1060 display only)
    if ((pin == OUT_PB7_DLEN1_DISP_LEFT) || (pin == OUT_PB6_DLEN2_DISP_RIGHT))
    {
        if (loadbit) bitset(PORTD, OUT_PD4_DATA);
        else bitclr(PORTD, OUT_PD4_DATA);
        DoClock();
    }
    // load pulse
    _delay_us(2);
    PORTB &= 0b00010111;  // clear all DLEN
    bitclr(PORTD, OUT_PD4_DATA);      // reset data pin
    DoClock();
    // cleanup
    PORTA &= 0b11111000;  // set A, B, C to low
    bitclr(PORTD, OUT_PD7_S); // set S to low too
}

void DisplayFreq(unsigned char On, unsigned char dig1, unsigned char dig2, unsigned char dig3, unsigned char dig4, unsigned char dig5)
{
    // Display off
    if (On == 0)
    {
        WriteToSAA(OUT_PB7_DLEN1_DISP_LEFT, 0xFFFF, 0);
        WriteToSAA(OUT_PB7_DLEN1_DISP_LEFT, 0xFFFF, 1);
        return;
    }
    
    // Display on
    unsigned short dataA = 0;
    unsigned short dataB = 0;

    if (dig2 > 0xF) dig2 = 5;
    if (dig3 > 0xF) dig3 = 29;
    if (dig4 > 0xF) dig4 = 0xE;
    if (dig5 > 0xF) dig5 = 0xF;

    dataA |= (FreqLow[dig4] << 8);
    dataA |= FreqHigh[dig2];
    if (dig1) bitclr(dataA, 7);   // 1
    else bitset(dataA, 7);
    WriteToSAA(OUT_PB7_DLEN1_DISP_LEFT, dataA, 0);

    dataB |= (FreqLow[dig5] << 8);
    dataB |= FreqHigh[dig3];
    bitclr(dataB, 12);   // Dot
    //if (dig3) bitclr(dataB, 12);   // Dot
    //else bitset(dataB, 12);
    WriteToSAA(OUT_PB7_DLEN1_DISP_LEFT, dataB, 1);
}

void DisplayTuningRecordPlay(DisplayTuningRecordPlayType* p)
{
    unsigned short dataA = 0;
    unsigned short dataB = 0;
    
    if (p->Refresh == 0) return;
    p->Refresh = 0;
    
    // Upper/Lower
    if (p->LowerUpper == 'F')
    {
        dataA |= 0b01000101;
    }
    else
    {
        dataA |= 0b01110110;
        if ((p->LowerUpper == 0) || (p->LowerUpper == 1))       // off or lower bar
          bitset(dataA, 3); // clear upper bar
        if ((p->LowerUpper == 0) || (p->LowerUpper == 2))       // off or upper bar
          bitset(dataA, 0); // clear lower bar
    }
    // Dolby
    if (p->DolbyLed == 0) bitset(dataA, 7);
    // Record
    dataA |= (RecordPlayDisp[p->Record] << 8);
    // Stereo
    if (p->StereoLed == 0) bitset(dataA, 15);
    // Record
    WriteToSAA(OUT_PB6_DLEN2_DISP_RIGHT, dataA, 0);
    
    // Tuning Mode (Memory)
    dataB |= TuningModeDisp[p->TuningMode];
    // Dolby
    if (p->DolbyLed == 0) bitset(dataB, 7);
    // Play
    dataB |= (RecordPlayDisp[p->Play] << 8);
    // Stereo
    if (p->StereoLed == 0) bitset(dataB, 15);
    WriteToSAA(OUT_PB6_DLEN2_DISP_RIGHT, dataB, 1);
}

void ReadInputs(InputsType* Inputs)
{
    unsigned char* data = (unsigned char*) Inputs;
    for (unsigned char i=0; i<8; i++)
    {
        PORTA &= 0b11111000;    // clear A,B,C
        PORTA |= i;             // Set select lines
        // now we have to wait for the data to be stable
        _delay_us(2);
        data[0] = (bitchk(PINE, IN_PE6_Mul6) != 0);
        data[1] = (bitchk(PINA, IN_PA3_Mul7) != 0);
        data[2] = (bitchk(PINC, IN_PC6_Mul8) != 0);
        data[3] = (bitchk(PINC, IN_PC7_Mul9) != 0);
        data[4] = (bitchk(PINE, IN_PE4_Mul10) != 0);
        data += 5;
        _delay_us(1);
    }
    Inputs->Z = bitchk(PINE, IN_PE5_Z);
}

void ReadInputsWithCheck(InputsType* Inputs1, InputsType* Inputs2)
{
    do {
        ReadInputs(Inputs1);
        _delay_ms(1);
        ReadInputs(Inputs2);
    } while (memcmp(Inputs1, Inputs2, sizeof(InputsType)) != 0);
}

unsigned char DetectKS_Keys(InputsType* pIn, unsigned char* pOld, unsigned char* pEdge)
{
    unsigned char ret = 0;
    unsigned char key[NBR_OF_PROG_KEYS];
    key[0] = pIn->KS0;
    key[1] = pIn->KS1;
    key[2] = pIn->KS2;
    key[3] = pIn->KS3;
    key[4] = pIn->KS4;
    key[5] = pIn->KS5;
    key[6] = pIn->KS6;
    key[7] = pIn->KS7;
    key[8] = pIn->KS8;
    key[9] = pIn->KS9;
    
    for (unsigned char i=0; i<NBR_OF_PROG_KEYS; i++)
    {
        pEdge[i] = ((key[i] == 0) && (pOld[i] == 1));
        if (pEdge[i]) ret = i;
        pOld[i] = key[i];
    }
    return ret;
}