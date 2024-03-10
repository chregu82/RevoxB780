/*
 * File:   b780_main.c
 * Author: Christian Lehner
 *
 * Created on 4. Januar 2024, 21:59
 */

#include "fuses.h"
#include "bitop.h"
#include "ports.h"
#include "remmem.h"
#include "recplay.h"

#define TICK_TIME_US    128
#define TICK_128_US TCNT1     // 128us Tick (8MHz / 1024)

#define TICKS_500ms (unsigned short)(500000/TICK_TIME_US)   // 3906

// Declarations
InputsType Inputs[2];   // Digital inputs (keys, etc.) Array of 2 for data debounce
RecPlayEnum PlaySource; // Source to play
RecPlayEnum RecordSource; // Source for recording
unsigned char RecSetActive;     // Waiting for record input set
unsigned short RecordBlinkTmr;   // Timer for blinking the record display
unsigned char RecTimeoutCnt;     // Counter for record set timeout 20s (40*0.5s)
RecPlayEnum RecPlayKey; // Pressed key for Play or Record
unsigned char RecPlayLocked = 0;        // Lock other rec/play key pressed while another key is pressed

// Input Edges
unsigned char oldRECSET, RECSETpress;

int main(void)
{
    // Set up a timer with 1/1024 system clock
    TCCR1A = 0;
    TCCR1B = (1<<CS10) | (1<<CS12);
    
    // Ports configuration (IN/OUT)
    DDRA = (1<<OUT_PA0_A) | (1<<OUT_PA1_B) | (1<<OUT_PA2_C) | (1<<OUT_PA4_NF5) | (1<<OUT_PA5_NF6) | (1<<OUT_PA6_NF7) | (1<<OUT_PA7_NF8);
    DDRB = 0xFF - (1<<OUT_PB1_DON);     // DON is either 0 or floating, has pull-up and therefore is high if configured as output
    DDRC = 0;     // inputs only
    DDRD = 0xFF;  // outputs only
    DDRE = 0;     // inputs only
    
    // init stereo signal
    PORTB = (1<<OUT_PB0_ST) | (1<<OUT_PB2_STROBE);
    // DON is already high with pull-up
    PORTD = (1<<OUT_PD0_NF1) | (1<<OUT_PD1_NF2)  | (1<<OUT_PD2_NF3) | (1<<OUT_PD3_NF4) | (1<<OUT_PD7_S);     // NF1-4 are high, S is high
    PORTA = (1<<OUT_PA4_NF5) | (1<<OUT_PA5_NF6) | (1<<OUT_PA6_NF7) | (1<<OUT_PA7_NF8);      // NF5-8 are high
    
    // Clear Display
    DisplayFreq(0, 0, 0, 0, 0, 0);
    DisplayTuningRecordPlay(0, 0, 0, 0, 0, 0);
    
    // Init output multiplexer (set everything to 0)
    for (char i=0; i<=7; i++)
    {
        LoadOutputMultiplexer(i, 0);
    }
    
    // Load Play Source from Eeprom or initialize
    PlaySource = EEPROM_read(EepromPlay);
    if ((PlaySource == RecPlayUndef) || (PlaySource > RecPlayTape2))
    {
        PlaySource = RecPlayAux;
    }
    SetPlay(PlaySource);
    EEPROM_write(EepromPlay, PlaySource);
    
    // Load Record Source from Eeprom or initialize
    RecordSource = EEPROM_read(EepromRecord);
    if (RecordSource > RecPlayTape2)
    {
        RecordSource = RecPlayUndef;
    }
    SetRecord(RecordSource);
    EEPROM_write(EepromRecord, RecordSource);
    
    DisplayTuningRecordPlay(0, 0, 0, RecordSource, 0, PlaySource);
    
    unsigned char nbrTrue;
    unsigned char* data = (unsigned char*)&Inputs[0];

    while (1)
    {
        // first read all inputs
        ReadInputsWithCheck(&Inputs[0], &Inputs[1]);
        
        // Play / Record key pressed?
        RecPlayKey = RecPlayKeyPressed(&Inputs[0], &RecPlayLocked);
        
        // RECSET pressed?
        RECSETpress = ((Inputs[0].RECSET == 0) && (oldRECSET == 1));
        oldRECSET = Inputs[0].RECSET;
        if (RECSETpress)
        {
            RecSetActive = 1;
            RecordBlinkTmr = TICK_128_US;   // Set start time
            RecTimeoutCnt = 0;
            if (RecordSource == RecPlayUndef) DisplayTuningRecordPlay(0, 0, 0, 6, 0, PlaySource);   // Dash char for record
        }
        
        if (RecSetActive)
        {
            if (RecPlayKey)
            {
                // Waiting for key press (Record set)
                RecordSource = RecPlayKey;
                SetRecord(RecordSource);
                EEPROM_write(EepromRecord, RecordSource);
                DisplayTuningRecordPlay(0, 0, 0, RecordSource, 0, PlaySource);
                RecSetActive = 0;
            }
            else
            {
                // Blink display 500ms, timeout 20s
                if ((TICK_128_US - RecordBlinkTmr) > TICKS_500ms)
                {
                    RecordBlinkTmr += TICKS_500ms;
                    RecTimeoutCnt++;
                    if (RecTimeoutCnt & 0x01)
                    {
                        DisplayTuningRecordPlay(0, 0, 0, 0, 0, PlaySource);   // Dash char for record
                    }
                    else
                    {
                        if (RecordSource == RecPlayUndef) DisplayTuningRecordPlay(0, 0, 0, 6, 0, PlaySource);   // Dash char for record
                        else DisplayTuningRecordPlay(0, 0, 0, RecordSource, 0, PlaySource);
                    }
                    // Timeout
                    if (RecTimeoutCnt >= 40) RecSetActive = 0;
                }
                // off
                if (Inputs[0].RECOFF == 0)
                {
                    RecordSource = RecPlayUndef;
                    SetRecord(RecordSource);
                    EEPROM_write(EepromRecord, RecordSource);
                    DisplayTuningRecordPlay(0, 0, 0, RecordSource, 0, PlaySource);
                    RecSetActive = 0;
                }
            }
        }
        // Select play source
        else if (RecPlayKey)
        {
            PlaySource = RecPlayKey;
            SetPlay(PlaySource);
            EEPROM_write(EepromPlay, PlaySource);
            DisplayTuningRecordPlay(0, 0, 0, RecordSource, 0, PlaySource);
        }
        
        nbrTrue = 0;
        for (unsigned char k=0; k<sizeof(Inputs[0]);k++)
        {
            if (data[k] != 0) nbrTrue++;
        }
        
        DisplayFreq(1, 0,nbrTrue/10,nbrTrue%10,PlaySource/16,PlaySource%16);
    }
}
