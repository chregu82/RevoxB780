#include "recplay.h"
#include "ports.h"
#include "bitop.h"

// Pressed key to Input / Record Number
unsigned char RecPlayKeyPressed(InputsType* pInputs, unsigned char *pLocked)
{
    unsigned char ret = RecPlayUndef;
    if (pInputs->TU == 0) ret = RecPlayTuner;
    if (pInputs->PHO == 0) ret = RecPlayPhono;
    if (pInputs->AUX == 0) ret = RecPlayAux;
    if (pInputs->TA1 == 0) ret = RecPlayTape1;
    if (pInputs->TA2 == 0) ret = RecPlayTape2;
    
    if ((ret > RecPlayUndef) && (*pLocked == 0))
    {
        *pLocked = 1;
        return ret;
    }
    else if (ret == RecPlayUndef)
    {
        *pLocked = 0;
        return ret;
    }
    return RecPlayUndef;
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
        
        default:    // PHONO
            break;
    }
}

void SetRecord(RecPlayEnum Record)   // NF1..NF4
{
    PORTD |= 0x0F;    // Set outputs NF1..NF4 to 1
    switch (Record)
    {
        case RecPlayUndef:  // OFF
            bitclr(PORTD, OUT_PD0_NF1);
            bitclr(PORTD, OUT_PD1_NF2);
            break;
            
        case RecPlayPhono:
            bitclr(PORTD, OUT_PD3_NF4);
            break;
      
        case RecPlayAux:
            bitclr(PORTD, OUT_PD2_NF3);
            break;
      
        case RecPlayTape1:
            bitclr(PORTD, OUT_PD0_NF1);
            break;
        
        case RecPlayTape2:
            bitclr(PORTD, OUT_PD1_NF2);
            break;
        
        default:    // Tuner
            break;
    }
}