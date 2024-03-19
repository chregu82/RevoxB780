#include "remmem.h"

unsigned char EEPROM_read(unsigned short addr)
{
    /* Wait for completion of previous write */
    while(EECR & (1<<EEPE));
    /* Set up address register */
    EEAR = addr;
    /* Start eeprom read by writing EERE */
    EECR |= (1<<EERE);
    /* Return data from Data Register */
    return EEDR;
}

void EEPROM_write(unsigned short addr, unsigned char data)
{
    /* Wait for completion of previous write */
    while(EECR & (1<<EEPE));
    /* Set up address and Data Registers */
    EEAR = addr;
    EEDR = data;
    /* Write logical one to EEMPE */
    EECR |= (1<<EEMPE);
    /* Start eeprom write by setting EEPE */
    EECR |= (1<<EEPE);
}

unsigned long EEPROM_read_long(unsigned short addr)
{
    unsigned long value;
    unsigned char* pVal = (unsigned char*)&value;
    for (unsigned char i=0; i<4; i++)
    {
        pVal[i] = EEPROM_read(addr+i);
    }
    return value;
}

void EEPROM_write_long(unsigned short addr, unsigned long data)
{
    unsigned char* pVal = (unsigned char*)&data;
    for (unsigned char i=0; i<4; i++)
    {
        EEPROM_write(addr+i, pVal[i]);
    }
}