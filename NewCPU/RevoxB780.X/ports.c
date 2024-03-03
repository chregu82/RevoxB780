#include "ports.h"
#include "bitop.h"

void LoadOutputMultiplexer(MultiplexOutEnum outputNbr, unsigned char value)
{
    // Set address an port A, bits 0..2
    PORTA &= (0xF8 + outputNbr);    // reset first 3 bits, add output nbr
    // Set value to DATA pin
    if (value) bitset(PORTD, OUT_PD4_DATA);
    else bitclr (PORTD, OUT_PD4_DATA);
    // toggle enable of IC4 (LS259) DLEN4
    bitset(PORTB, OUT_PB4_DLEN4);
    bitclr(PORTB, OUT_PB4_DLEN4);
    bitset(PORTB, OUT_PB4_DLEN4);
}
