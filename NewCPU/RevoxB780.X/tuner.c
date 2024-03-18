#include "tuner.h"
#include "ports.h"

// Set deemphasis according to push button
// 50us if not pressed, else 75us
// dolby module obsolete, enabled 25us if key pressed
void SetDeemphasis(unsigned char key, unsigned char* oldValue)
{
    if (*oldValue != key)
    {
        LoadOutputMultiplexer(Mul_Out_75us, key);
    }
    *oldValue = key;
}

// Set STFI according to HIBL
// The original behaviour is quite strange
// Output at LS259 is high if button is NOT pressed
// But the output is only changed if a stereo channel is received
// The output stays at the last level until a stereo channel is received
// I'm going to change it always
void SetStereoFilter(unsigned char key, unsigned char* oldValue)
{
    if (*oldValue != key)
    {
        LoadOutputMultiplexer(Mul_Out_STFI, key);
    }
    *oldValue = key;
}

/* The Tuning is quite strange, or maybe it's not and I just don't understand how it works. 
   The smallest possible frequency change is 25 kHz, you have to tell the SAA1056, how many times
   25 kHz it should tune to. But there's a 11 MHz offset. */
void TuneToFreq(unsigned long Freq)
{
    Freq = (Freq + FREQ_OFFSET) / FREQ_DIV;
    Freq |= 0x8000;     // Set highest bit, set divider ratio (alwys 1 on B780)
    WriteToSAA(OUT_PB5_DLEN3_TUNER, Freq, 0); 
}