/*
 * File:   b780_main.c
 * Author: lehne
 *
 * Created on 4. Januar 2024, 21:59
 */


#include <avr/io.h>
#include "fuses.h"

int main(void)
{
  DDRA = 0xFF;
  DDRB = 0xFF;
  unsigned char test = 0;
  /* Replace with your application code */
  while (1)
  {
    PORTA = test;
    PORTB = test++;
  }
}
