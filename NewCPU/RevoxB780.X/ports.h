/* 
 * File:   ports.h
 * Author: lehne
 *
 * Created on 26. Februar 2024, 20:51
 */

#ifndef PORTS_H
#define	PORTS_H

#ifdef	__cplusplus
extern "C" {
#endif

#define F_CPU 8000000
#include <util/delay.h>
#include <avr/io.h>

// Port A
#define OUT_PA0_A PA0
#define OUT_PA1_B PA1
#define OUT_PA2_C PA2
#define IN_PA3_Mul7 PA3
#define OUT_PA4_NF5 PA4
#define OUT_PA5_NF6 PA5
#define OUT_PA6_NF7 PA6
#define OUT_PA7_NF8 PA7
    
//Port B
#define OUT_PB0_ST PB0
#define OUT_PB1_DON PB1
#define OUT_PB2_STROBE PB2
#define OUT_PB3_DLEN5 PB3
#define OUT_PB4_DLEN4_OUTMUL PB4
#define OUT_PB5_DLEN3_TUNER PB5
#define OUT_PB6_DLEN2_DISP_RIGHT PB6
#define OUT_PB7_DLEN1_DISP_LEFT PB7
    
//Port C
#define IN_PC6_Mul8 PC6
#define IN_PC7_Mul9 PC7
    
//Port D
#define OUT_PD0_NF1 PD0
#define OUT_PD1_NF2 PD1
#define OUT_PD2_NF3 PD2
#define OUT_PD3_NF4 PD3
#define OUT_PD4_DATA PD4
#define OUT_PD5_PONLR PD5
#define OUT_PD6_PH PD6
#define OUT_PD7_S PD7
    
//Port E
#define IN_PE4_Mul10 PE4
#define IN_PE5_Z PE5
#define IN_PE6_Mul6 PE6
    
// Keys
#define NBR_OF_PROG_KEYS 10
    
typedef struct InputsType
{
    unsigned char H;    // Overtemperature      -> done
    unsigned char DDE;  // Dolby Deemphasis     -> obsolete
    unsigned char HIBL; // High blend           
    unsigned char STME; // Store Memory
    unsigned char KS8;  // Key 8
    unsigned char RECOFF;   // Record output off
    unsigned char NR;   // Noise reduction
    unsigned char P;    // Pilot Present
    unsigned char CHTM; // Change Tuning Mode
    unsigned char KS7;  // Key 7
    unsigned char RECSET;   // Set record output
    unsigned char NOD;  // No Dolby Insert
    unsigned char MONO; // FM Mono
    unsigned char LSNE; // New entry (Star key)
    unsigned char KS6;  // Key 6
    unsigned char TA2;  // Tape 2 (5)
    unsigned char FL;   //Frequency Low
    unsigned char MOFF; // Muting off
    unsigned char DOWN; // Down key
    unsigned char KS5;  // Key 5
    unsigned char TA1;  // Tape 1 (4)
    unsigned char FH;   // Frequency High
    unsigned char THSTA;    // Threshold Station
    unsigned char UP;   // Up key
    unsigned char KS4;  // Key 4
    unsigned char AUX;  // Aux (3)
    unsigned char TSPB; // Speaker B
    unsigned char STLY; // Stereo only
    unsigned char D75us;    // Deemphasis 75us
    unsigned char KS3;  // Key 3
    unsigned char PHO;  // Phono (2)
    unsigned char TSPA; // Speaker A
    unsigned char THSTE;    // Threshold Stereo
    unsigned char KS0;  // Key 0
    unsigned char KS2;  // Key 2
    unsigned char TU;   // Tuner (1)
    unsigned char DC;   // DC at Amp
    unsigned char LOC;  // Synthesizer locked in
    unsigned char KS9;  // Key 9
    unsigned char KS1;  // Key 1
    unsigned char Z;    // Antenna
} InputsType;

typedef struct DisplayTuningRecordPlayType
{
    unsigned char LowerUpper;
    unsigned char TuningMode;
    unsigned char DolbyLed;
    unsigned char Record;
    unsigned char StereoLed;
    unsigned char Play;
    unsigned char Refresh;
} DisplayTuningRecordPlayType;
    
typedef enum MultiplexOutEnum
{
    Mul_Out_STFI,
    Mul_Out_MC,
    Mul_Out_25us,
    Mul_Out_75us,
    Mul_Out_WW,
    Mul_Out_SPB,
    Mul_Out_SPA,
    Mul_Out_MUT
} MultiplexOutEnum;

// Frequency low value
// Logic is inverse
static const unsigned char FreqLow[31] = {
    0b01010000, // 0
    0b11111001, // 1
    0b00110010, // 2
    0b10110000, // 3
    0b10011001, // 4
    0b10010100, // 5
    0b00000100, // 6
    0b11110001, // 7
    0b00010000, // 8
    0b10010000, // 9
    0b00010001, // A
    0b00011100, // B
    0b01010110, // C
    0b00111000, // d
    0b00010110, // E
    0b00010111, // F
    0b10010000, // G
    0b00011001, // H
    0b11111001, // I
    0b11111000, // J
    0b11111111, // K
    0b01011110, // L
    0b11111111, // M
    0b11111111, // N
    0b01010000, // O
    0b00010011, // P
    0b11111111, // Q
    0b11111111, // R
    0b10010100, // S
    0b00011110, // T
    0b01011000, // U
};

// Frequency high value
// Logic is inverse
static const unsigned char FreqHigh[31] = {
    0b00010000, // 0
    0b01010111, // 1
    0b01001000, // 2
    0b01000010, // 3
    0b00000111, // 4
    0b00100010, // 5
    0b00100000, // 6
    0b01010011, // 7
    0b00000000, // 8
    0b00000010, // 9
    0b00000001, // A
    0b00100100, // B
    0b00111000, // C
    0b01000100, // d
    0b00101000, // E
    0b00101001, // F
    0b00000010, // G
    0b00000101, // H
    0b01010111, // I
    0b01010110, // J
    0b11111111, // K
    0b00111100, // L
    0b11111111, // M
    0b11111111, // N
    0b00010000, // O
    0b00001001, // P
    0b11111111, // Q
    0b11111111, // R
    0b00100010, // S
    0b00101100, // T
    0b00010100, // U
};

// Tuning mode (memory slot)
// Logic is inverse
static const unsigned char TuningModeDisp[12] = {
    0b01111111, // off
    0b00111011, // 1
    0b00000110, // 2
    0b00100010, // 3
    0b00101001, // 4
    0b01100000, // 5
    0b01000000, // 6
    0b00110011, // 7
    0b00000000, // 8
    0b00100001, // 9
    0b00000001, // A
    0b01000101, // F
};

// Record Display
// Logic is inverse
static const unsigned char RecordPlayDisp[7] = {
    0b01111111, // off
    0b01110011, // 1
    0b00001010, // 2
    0b00010010, // 3
    0b01110000, // 4
    0b00010100, // 5
    0b11011111, // _
};

void LoadOutputMultiplexer(MultiplexOutEnum outputNbr, unsigned char value);
void WriteToSAA(unsigned char pin, unsigned short data, unsigned char loadbit);
void DisplayFreq(unsigned char On, unsigned char dig1, unsigned char dig2, unsigned char dig3, unsigned char dig4, unsigned char dig5);
void DisplayTuningRecordPlay(DisplayTuningRecordPlayType* p);

void ReadInputs(InputsType* Inputs);
void ReadInputsWithCheck(InputsType* Inputs1, InputsType* Inputs2);

unsigned char DetectKS_Keys(InputsType* pIn, unsigned char* pOld, unsigned char* pEdge);

#ifdef	__cplusplus
}
#endif

#endif	/* PORTS_H */

