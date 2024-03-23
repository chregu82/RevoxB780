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
#include "protection.h"
#include "tuner.h"
#include <string.h>

//////////////////
// Declarations //
//////////////////

// Record / Play
InputsType Inputs[2];   // Digital inputs (keys, etc.) Array of 2 for data debounce
RecPlayEnum PlaySource; // Source to play
RecPlayEnum RecordSource; // Source for recording
unsigned char RecSetActive;     // Waiting for record input set
unsigned short RecordBlinkTmr;   // Timer for blinking the record display
unsigned char RecTimeoutCnt;     // Counter for record set timeout 20s (40*0.5s)
RecPlayEnum RecPlayKey; // Pressed key for Play or Record
unsigned char RecPlayLocked = 0;        // Lock other rec/play key pressed while another key is pressed

// Protection
ProtStateEnum ProtectionState = PrStProtection;
unsigned short ProtTmr;
unsigned char SpkOn[2] = {0, 0};

// Display
DisplayTuningRecordPlayType DispTunRecPlay;

// Tuner
unsigned char oldDeemphasis = 1;    // Input high if not pressed
unsigned char oldHighBlend = 0;    // do nothing if already pressed
unsigned char oldTuningModeKey = 1; // for edge detection
unsigned char TuningModePressed;    // Negative Edge
unsigned char LowerUpper;       // Lower / upper memory
unsigned char LastMemory;       // Last used memory slot (1..9)
unsigned long LastFrequency;    // Last tuned station on autotune
unsigned long ActPlayingFreq;   // Actual Frequency
TuningModeEnum TuningMode = TuningModeAutoMem;  // Always start with last memory
unsigned long StationMemory[STATION_MEM_SIZE];    // Station memory (lower / upper -> 2*9)
unsigned char oldProgKey[NBR_OF_PROG_KEYS] = {1,1,1,1,1,1,1,1,1,1};     // Flags for edge detection
unsigned char KS_pressed[NBR_OF_PROG_KEYS];  // Key presses KS0..KS9
unsigned char PressedKS_Key;    // Key number that has been pressed KS0..KS9
unsigned char oldUpKey = 1, oldDownKey = 1;     // Edge detection up/down
unsigned char UpPressed, DownPressed;       // Key up or down pressed (neg edge)
AutoTuneEnum AutoTune = AutoTuneHold;       // AutoTune State
unsigned short TuningTimer = 0;         // Timer for AutoTuning interval
TON_Type TuningFastDelay;           // Delay fast Autotuning
unsigned char InitTuner = 1;        // Initialize tuner after boot


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
    PORTB = (1<<OUT_PB0_ST) | (1<<OUT_PB2_STROBE) | (1<<OUT_PB4_DLEN4_OUTMUL);
    // DON is already high with pull-up
    PORTD = (1<<OUT_PD0_NF1) | (1<<OUT_PD1_NF2)  | (1<<OUT_PD2_NF3) | (1<<OUT_PD3_NF4) | (1<<OUT_PD5_PONLR) | (1<<OUT_PD6_PH) | (1<<OUT_PD7_S);     // NF1-4 are high, PON is enabled (1), PH is disabled (1), S is high
    PORTA = (1<<OUT_PA4_NF5) | (1<<OUT_PA5_NF6) | (1<<OUT_PA6_NF7) | (1<<OUT_PA7_NF8);      // NF5-8 are high
    
    // Clear Display
    DisplayFreq(0, 0, 0, 0, 0, 0);
    memset(&DispTunRecPlay, 0, sizeof(DispTunRecPlay));
    DispTunRecPlay.Refresh = 1;
    DisplayTuningRecordPlay(&DispTunRecPlay);
    
    // Init output multiplexer
    LoadOutputMultiplexer(Mul_Out_STFI, 0);
    LoadOutputMultiplexer(Mul_Out_MC, 0);
    LoadOutputMultiplexer(Mul_Out_25us, 1);     // Needs to be low after SN7406
    LoadOutputMultiplexer(Mul_Out_75us, 1);     // Needs to be low after SN7406
    LoadOutputMultiplexer(Mul_Out_WW, 0);
    LoadOutputMultiplexer(Mul_Out_SPB, 0);
    LoadOutputMultiplexer(Mul_Out_SPA, 0);
    LoadOutputMultiplexer(Mul_Out_MUT, 1);
    
    // Load play source from eeprom or initialize
    PlaySource = EEPROM_read(EepromPlay);
    if ((PlaySource == RecPlayUndef) || (PlaySource > RecPlayTape2))
    {
        PlaySource = RecPlayAux;
    }
    SetPlay(PlaySource);
    EEPROM_write(EepromPlay, PlaySource);
    
    // Load record source from eeprom or initialize
    RecordSource = EEPROM_read(EepromRecord);
    if (RecordSource > RecPlayTape2)
    {
        RecordSource = RecPlayUndef;
    }
    SetRecord(RecordSource);
    EEPROM_write(EepromRecord, RecordSource);
    
    // Load lower / upper from eeprom or initialize
    LowerUpper = EEPROM_read(EepromLowerUpper);
    if (LowerUpper > 1)
    {
        LowerUpper = 0;
    }
    EEPROM_write(EepromLowerUpper, LowerUpper);
    
    // Load last memory slot from eeprom or initialize
    LastMemory = EEPROM_read(EepromLastMemory);
    if ((LastMemory < 1) || (LastMemory > 9))
    {
        LastMemory = 1;
    }
    EEPROM_write(EepromLastMemory, LastMemory);
    
    // Restore last frequency
    LastFrequency = EEPROM_read_long(EepromLastFreq);
    
    // Restore station memory
    for (unsigned char i=0; i<STATION_MEM_SIZE; i++)
    {
        StationMemory[i] = EEPROM_read_long(EepromFreqMem+4*i);
    }
    
    // Set last played frequency
    ActPlayingFreq = StationMemory[LastMemory-1*9*LowerUpper];
    // Init fast tuning delay
    TuningFastDelay.Delay = TICKS_250ms;
    
    // Init right display
    DispTunRecPlay.Refresh = 1;
    DispTunRecPlay.LowerUpper = LowerUpper+1;
    DispTunRecPlay.TuningMode = LastMemory;
    DispTunRecPlay.Record = RecordSource;
    DispTunRecPlay.Play = PlaySource;
    DisplayTuningRecordPlay(&DispTunRecPlay);
    
    unsigned char nbrTrue;
    unsigned char* data = (unsigned char*)&Inputs[0];

    while (1)
    {
        // first read all inputs
        ReadInputsWithCheck(&Inputs[0], &Inputs[1]);
        
        // Play / Record key pressed?
        RecPlayKey = RecPlayKeyPressed(&Inputs[0], &RecPlayLocked);
        
        if (RecSetActive)
        {
            if ((RecPlayKey) || (Inputs[0].RECOFF == 0))
            {
                // Waiting for key press (Record set) or Record off key
                RecordSource = RecPlayKey;
                SetRecord(RecordSource);
                EEPROM_write(EepromRecord, RecordSource);
                DispTunRecPlay.Record = RecordSource;
                DispTunRecPlay.Refresh = 1;
                RecSetActive = 0;
            }
            else
            {
                // Blink display 500ms, timeout 20s
                if ((TICK_128_US - RecordBlinkTmr) > TICKS_500ms)
                {
                    RecordBlinkTmr += TICKS_500ms;
                    RecTimeoutCnt++;
                    if (RecTimeoutCnt & 0x01)   // odd 0.5s counts
                    {
                        DispTunRecPlay.Record = 0;  // blank
                        DispTunRecPlay.Refresh = 1;
                    }
                    else    // even 0.5s counts
                    {
                        if (RecordSource == RecPlayUndef) DispTunRecPlay.Record = 6;   // Dash char for record
                        else DispTunRecPlay.Record = RecordSource;
                        DispTunRecPlay.Refresh = 1;
                    }
                    // Timeout
                    if (RecTimeoutCnt >= 40)
                    {
                        RecSetActive = 0;
                        DispTunRecPlay.Record = RecordSource;
                        DispTunRecPlay.Refresh = 1;
                    }
                }
            }
        }
        // Select play source
        else if (RecPlayKey)
        {
            PlaySource = RecPlayKey;
            SetPlay(PlaySource);
            EEPROM_write(EepromPlay, PlaySource);
            DispTunRecPlay.Play = PlaySource;
            DispTunRecPlay.Refresh = 1;
        }
        // RECSET pressed?
        else if (Inputs[0].RECSET == 0)
        {
            RecSetActive = 1;
            RecordBlinkTmr = TICK_128_US;   // Set start time
            RecTimeoutCnt = 0;  // init counter
            if (RecordSource == RecPlayUndef)
            {
                DispTunRecPlay.Record = 6;  // Dash char for record
                DispTunRecPlay.Refresh = 1;
            }
        }
        
        // Speaker Protection
        HandleProtection(&Inputs[0], &ProtectionState, &ProtTmr, SpkOn);
        
        ///////////
        // Tuner //
        ///////////
        SetDeemphasis(Inputs[0].D75us, &oldDeemphasis);
        SetStereoFilter(Inputs[0].HIBL, &oldHighBlend);
        
        // Check change tuning mode key
        TuningModePressed = ((Inputs[0].CHTM == 0) && (oldTuningModeKey == 1));
        oldTuningModeKey = Inputs[0].CHTM;
        
        // Check KS keys
        PressedKS_Key = DetectKS_Keys(&Inputs[0], oldProgKey, KS_pressed);
        
        // Check up / down key
        UpPressed = ((Inputs[0].UP == 0) && (oldUpKey == 1));
        oldUpKey = Inputs[0].UP;
        DownPressed = ((Inputs[0].DOWN == 0) && (oldDownKey == 1));
        oldDownKey = Inputs[0].DOWN;
        
        if (InitTuner)
        {
            InitTuner = 0;
            TuneToFreq(ActPlayingFreq);
            RefreshTuningDisplay(ActPlayingFreq);
        }
        
        switch (TuningMode)
        {
            case TuningModeAutoMem:
                if (KS_pressed[0])
                {
                    LowerUpper ^= 1;    // Invertieren von bit 0;
                    DispTunRecPlay.LowerUpper = LowerUpper+1;
                    DispTunRecPlay.Refresh = 1;
                }
                if (PressedKS_Key > 0)  // KS1..9
                {
                    DispTunRecPlay.TuningMode = PressedKS_Key;
                    DispTunRecPlay.Refresh = 1;
                }
                
                // AutoTune
                switch (AutoTune)
                {
                  case AutoTuneHold:
                    if (UpPressed)
                    {
                        AutoTune = AutoTuneUp;
                        if ((ActPlayingFreq < LOWEST_FREQ) || (ActPlayingFreq > HIGHEST_FREQ)) ActPlayingFreq = LOWEST_FREQ - AUTOTUNING_STEP;
                    }
                    else if (DownPressed)
                    {
                        AutoTune = AutoTuneDown;
                        if ((ActPlayingFreq < LOWEST_FREQ) || (ActPlayingFreq > HIGHEST_FREQ)) ActPlayingFreq = HIGHEST_FREQ + AUTOTUNING_STEP;
                    }
                    // leaving this state
                    if (AutoTune != AutoTuneHold)
                    {
                        TuningTimer = TICK_128_US - TICKS_250ms;    // Starts tuning immediately
                        DispTunRecPlay.TuningMode = TUNING_DISP_A;
                        DispTunRecPlay.Refresh = 1;
                    }
                    break;
                    
                  case AutoTuneUp:
                    TuningFastDelay.In = ((Inputs[0].UP == 0) && (Inputs[0].DOWN == 1));  // Up pressed
                    TON(&TuningFastDelay);
                    if ((TICK_128_US - TuningTimer) >= TICKS_250ms)
                      {
                        TuningTimer = TICK_128_US;
                        ActPlayingFreq += AUTOTUNING_STEP;
                        if (ActPlayingFreq >= HIGHEST_FREQ) ActPlayingFreq = LOWEST_FREQ;
                        RefreshTuningDisplay(ActPlayingFreq);
                        TuneToFreq(ActPlayingFreq);
                      }
                    else if ((Inputs[0].UP == 1) && (Inputs[0].DOWN == 0))  // down pressed
                      {
                        TuningTimer = TICK_128_US;
                        AutoTune = AutoTuneDown;
                      }
                    else if ((Inputs[0].LOC) && (Inputs[0].THSTA) && (Inputs[0].UP == 1))
                    {
                        AutoTune = AutoTuneHold;
                    }
                    else if (TuningFastDelay.Q)     // Delayed fast tuning
                      {
                        // go fast
                        if ((TICK_128_US - TuningTimer) >= TICKS_100ms)
                          {
                            TuningTimer = TICK_128_US;
                            ActPlayingFreq += AUTOTUNING_STEP;
                            if (ActPlayingFreq >= HIGHEST_FREQ) ActPlayingFreq = LOWEST_FREQ;
                            RefreshTuningDisplay(ActPlayingFreq);
                          }
                      }
                    break;
                    
                  case AutoTuneDown:
                    TuningFastDelay.In = ((Inputs[0].UP == 1) && (Inputs[0].DOWN == 0));  // Down pressed
                    TON(&TuningFastDelay);
                    if ((TICK_128_US - TuningTimer) >= TICKS_250ms)
                      {
                        TuningTimer = TICK_128_US;
                        ActPlayingFreq -= AUTOTUNING_STEP;
                        if (ActPlayingFreq <= LOWEST_FREQ) ActPlayingFreq = HIGHEST_FREQ;
                        RefreshTuningDisplay(ActPlayingFreq);
                        TuneToFreq(ActPlayingFreq);
                      }
                    else if ((Inputs[0].UP == 0) && (Inputs[0].DOWN == 1))  // Up pressed
                      {
                        TuningTimer = TICK_128_US;
                        AutoTune = AutoTuneUp;
                      }
                    else if ((Inputs[0].LOC) && (Inputs[0].THSTA) && (Inputs[0].DOWN == 1))
                    {
                        AutoTune = AutoTuneHold;
                    }
                    else if (TuningFastDelay.Q)     // Delayed fast tuning
                      {
                        // go fast
                        if ((TICK_128_US - TuningTimer) >= TICKS_100ms)
                          {
                            TuningTimer = TICK_128_US;
                            ActPlayingFreq -= AUTOTUNING_STEP;
                            if (ActPlayingFreq <= LOWEST_FREQ) ActPlayingFreq = HIGHEST_FREQ;
                            RefreshTuningDisplay(ActPlayingFreq);
                          }
                      }
                    break;
                }
                  
                break;
            
            case TuningModeManual:
                break;
        }
        
        nbrTrue = 0;
        for (unsigned char k=0; k<sizeof(Inputs[0]);k++)
        {
            if (data[k] != 0) nbrTrue++;
        }
        
        // Update Display
        DisplayTuningRecordPlay(&DispTunRecPlay);
        //DisplayFreq(1,0,nbrTrue/10,nbrTrue%10,PlaySource/16,PlaySource%16);
    }
}
