/*
 * nvm.h - Nichtfluechtige Daten fuer die B780-Ersatz-CPU (ATmega324PB)
 *
 * EEPROM-Aufteilung (816 von 1024 Bytes belegt):
 *   Bytes   0 -  53 : 18 Stationen zu je 3 Bytes (eigene Pruefsumme pro Station)
 *   Bytes  54 - 815 : Ringpuffer, 127 Slots zu je 6 Bytes (Wear Leveling)
 *
 * Frequenz-/Antennenwort (16 Bit):
 *   Bit  0-12 : Frequenz als PLL-Teiler N = (f + 11,0 MHz) / 25 kHz
 *   Bit 13-15 : Antennensteuerung (0-7)
 *
 * Auswahl-Byte:
 *   Bit  0-2  : Play   (0-7)
 *   Bit  3    : frei
 *   Bit  4-6  : Record (0-7)
 *   Bit  7    : Bank   (0-1)
 */
#ifndef NVM_H
#define NVM_H

#include <stdint.h>
#include <stdbool.h>

#define NUMBER_OF_STATIONS  18

/* Felder im Frequenz-/Antennenwort */
#define FREQUENCY_SHIFT  0
#define FREQUENCY_MASK   0x1FFF
#define ANTENNA_SHIFT    13
#define ANTENNA_MASK     0x07

/* Felder im Auswahl-Byte */
#define PLAY_SHIFT       0
#define PLAY_MASK        0x07
#define RECORD_SHIFT     4
#define RECORD_MASK      0x07
#define BANK_SHIFT       7
#define BANK_MASK        0x01

/* Standardwerte bei leerem EEPROM */
#define DEFAULT_FREQUENCY          3940   /* PLL-Teiler fuer 87,50 MHz */
#define DEFAULT_ANTENNA            0
#define DEFAULT_PLAY               3
#define DEFAULT_RECORD             0
#define DEFAULT_BANK               0
#define DEFAULT_SELECTED_STATION   1

/* Zuletzt gewaehlte Station innerhalb der Bank */
#define FIRST_SELECTABLE_STATION   1
#define LAST_SELECTABLE_STATION    9

/* Stationen (selten geschrieben, direkt beim Speichern) */
bool nvm_load_station(uint8_t station_index, uint16_t *frequency, uint8_t *antenna); /* false: leer/ungueltig */
void nvm_save_station(uint8_t station_index, uint16_t frequency, uint8_t antenna);

/* Letzter Geraetezustand: einmal beim Start laden */
bool nvm_load_state(void);  /* false: Standardwerte wurden gesetzt */

/* Lesen des aktuellen Zustands */
uint16_t nvm_get_frequency(void);          /* PLL-Teiler N */
uint8_t  nvm_get_antenna(void);            /* 0-7 */
uint8_t  nvm_get_play(void);               /* 0-7 */
uint8_t  nvm_get_record(void);             /* 0-7 */
uint8_t  nvm_get_bank(void);               /* 0-1 */
uint8_t  nvm_get_selected_station(void);   /* 1-9 */

/* Aendern des aktuellen Zustands; gespeichert wird nach 3 s ohne Aenderung */
void nvm_set_frequency(uint16_t frequency);
void nvm_set_antenna(uint8_t antenna);
void nvm_set_play(uint8_t play);
void nvm_set_record(uint8_t record);
void nvm_set_bank(uint8_t bank);
void nvm_set_selected_station(uint8_t station);  /* 1-9, andere Werte werden ignoriert */

/* Alle 10 ms aufrufen */
void nvm_tick_10ms(void);

#endif
