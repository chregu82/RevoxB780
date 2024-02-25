/* 
 * File:   fuses.h
 * Author: lehne
 *
 * Created on 23. Februar 2024, 23:10
 */

#ifndef FUSES_H
#define	FUSES_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include <avr/io.h>

FUSES = {
	.low = 0xC2, // LOW {SUT_CKSEL=INTRCOSC_8MHZ_6CK_14CK_0MS, CKOUT=CLEAR, CKDIV8=CLEAR}
	.high = 0x3F, // HIGH {BOOTRST=CLEAR, BOOTSZ=256W_3F00, EESAVE=CLEAR, WDTON=CLEAR, SPIEN=CLEAR, JTAGEN=SET, OCDEN=SET}
	.extended = 0xFF, // EXTENDED {BODLEVEL=DISABLED, CFD=CFD_ENABLED}
};

LOCKBITS = 0xFF; // {LB=NO_LOCK, BLB0=NO_LOCK, BLB1=NO_LOCK}


#ifdef	__cplusplus
}
#endif

#endif	/* FUSES_H */

