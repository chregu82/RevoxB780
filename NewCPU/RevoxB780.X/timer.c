#include "timer.h"

void InitTimer()
{
    // Set up a timer with 1/1024 system clock
    TCCR1A = 0;
    TCCR1B = (1<<CS10) | (1<<CS12);
}

void TON(TON_Type* inst)
{
  if (!inst->In) inst->Q = 0;
  else if (inst->In && !inst->oldIn) inst->Tmr = TICK_128_US;
  else if ((inst->Q == 0) && (TICK_128_US - inst->Tmr >= inst->Delay)) inst->Q = 1;
  
  inst->oldIn = inst->In;
}
