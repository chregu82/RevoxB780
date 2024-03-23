/* 
 * File:   tuner.h
 * Author: lehne
 *
 * Created on 14. März 2024, 17:51
 */

#ifndef TUNER_H
#define	TUNER_H

#ifdef	__cplusplus
extern "C"
{
#endif
    
#define STATION_MEM_SIZE    18  // 2*9 stations
    
#define FREQ_DIV    25      // Frequency interval in kHz
#define FREQ_OFFSET 11000   // Frequency offset 11MHz
    
#define LOWEST_FREQ      87500       // 87.5 MHz
#define HIGHEST_FREQ    108000       // 107.95 MHz
#define AUTOTUNING_STEP    100     // 100 KHz
    
#define TUNING_DISP_A   10
#define TUNING_DISP_F   11

typedef enum TuningModeEnum
{
    TuningModeAutoMem,
    TuningModeManual
} TuningModeEnum;

typedef enum AutoTuneEnum
{
    AutoTuneHold,
    AutoTuneUp,
    AutoTuneDown
} AutoTuneEnum;

void SetDeemphasis(unsigned char key, unsigned char* oldValue);
void SetStereoFilter(unsigned char key, unsigned char* oldValue);
void TuneToFreq(unsigned long Freq);
void RefreshTuningDisplay(unsigned long Freq);


#ifdef	__cplusplus
}
#endif

#endif	/* TUNER_H */

