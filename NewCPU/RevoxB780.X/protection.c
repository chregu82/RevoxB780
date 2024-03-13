
#include "protection.h"
#include "bitop.h"

void HandleProtection(InputsType* pInput, ProtStateEnum* pProtState, unsigned short* pTmr, unsigned char* pSpkOn)
{
    unsigned char SpeakerKey[2];
    
    while(1)    // Blocking while protection mode active
    {
        // Check protection inputs DC / H
        if ((pInput->H) || (pInput->DC)) // oh, oh...
        {
            *pProtState = PrStProtection;   // Set to protection
            *pTmr = TICK_128_US;    // Set timer start value
            bitclr(PORTD, OUT_PD5_PONLR);   // Switch amp off
            bitset(PORTD, OUT_PD6_PH);   // Switch PH on
            // Reset Speaker relays
            LoadOutputMultiplexer(Mul_Out_SPA, 0);
            pSpkOn[0] = 0;
            LoadOutputMultiplexer(Mul_Out_SPB, 0);
            pSpkOn[1] = 0;
        }
        switch (*pProtState)
        {
            case PrStProtection:
                // Was good since 1 second
                if ((TICK_128_US - *pTmr) >= TICKS_1s)
                {
                    *pTmr = TICK_128_US;    // Reset timer
                    *pProtState = PrStActivateAmp;
                    bitset(PORTD, OUT_PD5_PONLR);   // Switch amp on
                }
                break;

            case PrStActivateAmp:
                // Was good since 2 seconds
                if ((TICK_128_US - *pTmr) >= TICKS_2s)
                {
                    *pProtState = PrStActivateSpeaker;
                    bitclr(PORTD, OUT_PD6_PH);   // Switch PH on
                }
                break;

            case PrStActivateSpeaker:
                // Activate speaker if corresponding key is pressed
                SpeakerKey[0] = pInput->TSPA;
                SpeakerKey[1] = pInput->TSPB;
                
                for (unsigned char i=0; i<2; i++)
                {
                    if (pSpkOn[i] == SpeakerKey[i])
                    {
                        LoadOutputMultiplexer(Mul_Out_SPA-i, !SpeakerKey[i]);
                        pSpkOn[i] = (SpeakerKey[i] == 0);
                    }
                }
                return;
        }
        // Read inputs again
        ReadInputsWithCheck(&pInput[0], &pInput[1]);
    }
}
