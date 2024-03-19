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
    EepromRecord,
    EepromLowerUpper,
    EepromLastMemory,
      
    EepromLastFreq = 40,    // unsigned long
    EepromFreqMem = 44,     // unsigned long
} EepromLayoutEnum;

unsigned char EEPROM_read(unsigned short addr);
unsigned long EEPROM_read_long(unsigned short addr);
void EEPROM_write(unsigned short addr, unsigned char data);
void EEPROM_write_long(unsigned short addr, unsigned long data);

#ifdef	__cplusplus
}
#endif

#endif	/* REMMEM_H */

