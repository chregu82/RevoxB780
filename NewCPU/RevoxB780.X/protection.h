/* 
 * File:   protection.h
 * Author: lehne
 *
 * Created on 10. März 2024, 19:11
 */

#ifndef PROTECTION_H
#define	PROTECTION_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include "ports.h"
#include "timer.h"
    
typedef enum ProtStateEnum
{
    PrStProtection,
    PrStActivateAmp,
    PrStActivateSpeaker
} ProtStateEnum;

void HandleProtection(InputsType* pInput, ProtStateEnum* pProtState, unsigned short* pTmr, unsigned char* pSpkOn);

#ifdef	__cplusplus
}
#endif

#endif	/* PROTECTION_H */

