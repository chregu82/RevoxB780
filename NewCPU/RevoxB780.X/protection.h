/* 
 * File:   protection.h
 * Author: lehne
 *
 * Created on 10. März 2024, 19:11
 */

#ifndef PROTECTION_H
#define	PROTECTION_H

#include "ports.h"
#include "timer.h"


#ifdef	__cplusplus
extern "C" {
#endif

void HandleProtection(InputsType* pInput, unsigned char* pProtOk, unsigned short* pTmr);

#ifdef	__cplusplus
}
#endif

#endif	/* PROTECTION_H */

