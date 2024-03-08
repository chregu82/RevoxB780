/* 
 * File:   recplay.h
 * Author: lehne
 *
 * Created on 8. März 2024, 15:11
 */

#ifndef RECPLAY_H
#define	RECPLAY_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include "ports.h"
    
typedef enum RecPlayEnum
{
    RecPlayUndef,
    RecPlayTuner,
    RecPlayPhono,
    RecPlayAux,
    RecPlayTape1,
    RecPlayTape2,
} RecPlayEnum;

unsigned char RecPlayKeyPressed(InputsType* pInputs);
void SetPlay(RecPlayEnum Play);


#ifdef	__cplusplus
}
#endif

#endif	/* RECPLAY_H */

