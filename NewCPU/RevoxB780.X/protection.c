
#include "protection.h"

void HandleProtection(InputsType* pInput, unsigned char* pProtOk, unsigned short* pTmr)
{
    // Check protection inputs DC / H
    if ((pInput.H) || (pInput->DC)) // oh, oh...
    {
        *pProtOk = 0;
        
    }
}
