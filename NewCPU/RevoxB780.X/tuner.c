#include "tuner.h"
#include "ports.h"

// Set deemphasis according to push button
// 50us if not pressed, else 75us
// dolby module obsolete, enabled 25us if key pressed
void SetDeemphasis(unsigned char key, unsigned char* oldValue)
{
    if (*oldValue != key)
    {
        LoadOutputMultiplexer(Mul_Out_75us, key);
    }
    *oldValue = key;
}
