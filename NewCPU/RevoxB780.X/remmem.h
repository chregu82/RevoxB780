/* 
 * File:   remmem.h
 * Author: lehne
 *
 * Created on 7. März 2024, 21:46
 */

#ifndef REMMEM_H
#define	REMMEM_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include <avr/io.h>
    
typedef enum EepromLayoutEnum
{
    EepromPlay,
} EepromLayoutEnum;

unsigned char EEPROM_read(unsigned short addr);
void EEPROM_write(unsigned short addr, unsigned char data);

#ifdef	__cplusplus
}
#endif

#endif	/* REMMEM_H */

