#include "recplay.h"
#include "ports.h"
#include "bitop.h"

// Pressed key to Input / Record Number
unsigned char RecPlayKeyPressed(InputsType* pInputs)
{
    if (pInputs->TU == 0) return RecPlayTuner;
    if (pInputs->PHO == 0) return RecPlayPhono;
    if (pInputs->AUX == 0) return RecPlayAux;
    if (pInputs->TA1 == 0) return RecPlayTape1;
    if (pInputs->TA2 == 0) return RecPlayTape2;
    return RecPlayUndef; // no key
}

void SetPlay(RecPlayEnum Play)   // NF5..NF8
{
    PORTA |= 0xF0;    // Set outputs NF5..NF8 to 1
    switch (Play)
    {
        case RecPlayTuner:
            bitclr(PORTA, OUT_PA4_NF5);
            break;
      
        case RecPlayAux:
            bitclr(PORTA, OUT_PA7_NF8);
            break;
      
        case RecPlayTape1:
            bitclr(PORTA, OUT_PA6_NF7);
            break;
        
        case RecPlayTape2:
            bitclr(PORTA, OUT_PA5_NF6);
            break;
        
        default:
            break;
    }
}