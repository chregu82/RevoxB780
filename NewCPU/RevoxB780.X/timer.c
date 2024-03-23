#include "timer.h"

void TON(TON_Type* inst)
{
  if (!inst->In) inst->Q = 0;
  else if (inst->In && !inst->oldIn) inst->Tmr = TICK_128_US;
  else if ((inst->Q == 0) && (TICK_128_US - inst->Tmr >= inst->Delay)) inst->Q = 1;
  
  inst->oldIn = inst->In;
}
