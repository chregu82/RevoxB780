/*
 * nvm.c - Nichtfluechtige Daten fuer die B780-Ersatz-CPU (ATmega324PB)
 *
 * Fuse: BODLEVEL = 4,3 V, damit bei sinkender Spannung nicht
 * unkontrolliert ins EEPROM geschrieben wird.
 */
#include <avr/eeprom.h>
#include <util/crc16.h>
#include "nvm.h"

#define STATE_RING_SLOTS   127   /* max. 127 wegen 8-Bit-Sequenznummer */
#define SAVE_DELAY_TICKS   300   /* 3 s Ruhe (in 10-ms-Ticks) vor dem Speichern */

typedef struct __attribute__((packed)) {
    uint16_t frequency_antenna;  /* Frequenz + Antenne */
    uint8_t  checksum;           /* CRC-8 ueber frequency_antenna */
} station_record_t;              /* 3 Bytes */

typedef struct __attribute__((packed)) {
    uint8_t  sequence_number;    /* laufende Nummer zum Finden des neuesten Eintrags */
    uint16_t frequency_antenna;  /* letzte Frequenz + Antenne */
    uint8_t  selection_flags;    /* Play, Record, Bank */
    uint8_t  selected_station;   /* zuletzt gewaehlte Station 1-9 */
    uint8_t  checksum;           /* CRC-8 ueber alle Bytes davor, zuletzt geschrieben */
} state_record_t;                /* 6 Bytes */

#define STATION_CHECKSUM_LENGTH  (sizeof(station_record_t) - 1)
#define STATE_CHECKSUM_LENGTH    (sizeof(state_record_t) - 1)

typedef struct __attribute__((packed)) {
    station_record_t stations[NUMBER_OF_STATIONS];  /* Bytes 0-53   */
    state_record_t   state_ring[STATE_RING_SLOTS];  /* Bytes 54-815 */
} eeprom_layout_t;

static eeprom_layout_t EEMEM eeprom_layout;  /* eine Struktur: feste Reihenfolge im EEPROM */

#define DEFAULT_FREQUENCY_ANTENNA \
    ((uint16_t)(((uint16_t)DEFAULT_FREQUENCY << FREQUENCY_SHIFT) | \
                ((uint16_t)DEFAULT_ANTENNA   << ANTENNA_SHIFT)))
#define DEFAULT_SELECTION_FLAGS \
    ((uint8_t)((DEFAULT_PLAY   << PLAY_SHIFT)   | \
               (DEFAULT_RECORD << RECORD_SHIFT) | \
               (DEFAULT_BANK   << BANK_SHIFT)))

static state_record_t last_saved_state;      /* zuletzt gespeicherter Datensatz */
static uint8_t        current_slot_index;    /* Index des neuesten Slots */
static uint16_t       current_frequency_antenna = DEFAULT_FREQUENCY_ANTENNA;
static uint8_t        current_selection_flags   = DEFAULT_SELECTION_FLAGS;
static uint8_t        current_selected_station  = DEFAULT_SELECTED_STATION;
static uint16_t       save_delay_ticks;      /* 0 = nichts ausstehend */

/* ---------------- Hilfsfunktionen ---------------- */

static uint8_t calculate_checksum(const void *data, uint8_t length)
{
    uint8_t checksum = 0;
    const uint8_t *byte_pointer = data;
    while (length--)
        checksum = _crc8_ccitt_update(checksum, *byte_pointer++);
    return checksum;  /* geloeschtes EEPROM (0xFF) ergibt nie eine gueltige Pruefsumme */
}

static uint16_t get_field_16(uint16_t word, uint8_t shift, uint16_t mask)
{
    return (word >> shift) & mask;
}

static uint16_t set_field_16(uint16_t word, uint8_t shift, uint16_t mask, uint16_t value)
{
    return (word & ~(uint16_t)(mask << shift)) | (uint16_t)((value & mask) << shift);
}

static uint8_t get_field_8(uint8_t byte, uint8_t shift, uint8_t mask)
{
    return (byte >> shift) & mask;
}

static uint8_t set_field_8(uint8_t byte, uint8_t shift, uint8_t mask, uint8_t value)
{
    return (byte & ~(uint8_t)(mask << shift)) | (uint8_t)((value & mask) << shift);
}

static void restart_save_delay(void)
{
    save_delay_ticks = SAVE_DELAY_TICKS;  /* bei jeder Aenderung neu starten */
}

/* ---------------- Stationen ---------------- */

bool nvm_load_station(uint8_t station_index, uint16_t *frequency, uint8_t *antenna)
{
    station_record_t station;
    if (station_index >= NUMBER_OF_STATIONS)
        return false;
    eeprom_read_block(&station, &eeprom_layout.stations[station_index], sizeof station);
    if (station.checksum != calculate_checksum(&station, STATION_CHECKSUM_LENGTH))
        return false;
    *frequency = get_field_16(station.frequency_antenna, FREQUENCY_SHIFT, FREQUENCY_MASK);
    *antenna   = (uint8_t)get_field_16(station.frequency_antenna, ANTENNA_SHIFT, ANTENNA_MASK);
    return true;
}

void nvm_save_station(uint8_t station_index, uint16_t frequency, uint8_t antenna)
{
    station_record_t station;
    if (station_index >= NUMBER_OF_STATIONS)
        return;
    station.frequency_antenna = set_field_16(0, FREQUENCY_SHIFT, FREQUENCY_MASK, frequency);
    station.frequency_antenna = set_field_16(station.frequency_antenna,
                                             ANTENNA_SHIFT, ANTENNA_MASK, antenna);
    station.checksum = calculate_checksum(&station, STATION_CHECKSUM_LENGTH);
    eeprom_update_block(&station, &eeprom_layout.stations[station_index], sizeof station);
}

/* ---------------- Ringpuffer ---------------- */

bool nvm_load_state(void)
{
    bool valid_record_found = false;
    state_record_t record;

    for (uint8_t slot_index = 0; slot_index < STATE_RING_SLOTS; slot_index++) {
        eeprom_read_block(&record, &eeprom_layout.state_ring[slot_index], sizeof record);
        if (record.checksum != calculate_checksum(&record, STATE_CHECKSUM_LENGTH))
            continue;  /* leer oder beim Schreiben unterbrochen */
        if (!valid_record_found ||
            (uint8_t)(record.sequence_number - last_saved_state.sequence_number) < 128) {
            last_saved_state   = record;  /* neuer als bisher (auch ueber 255 -> 0) */
            current_slot_index = slot_index;
            valid_record_found = true;
        }
    }

    if (!valid_record_found) {
        last_saved_state.sequence_number   = 0;
        last_saved_state.frequency_antenna = DEFAULT_FREQUENCY_ANTENNA;
        last_saved_state.selection_flags   = DEFAULT_SELECTION_FLAGS;
        last_saved_state.selected_station  = DEFAULT_SELECTED_STATION;
        current_slot_index = STATE_RING_SLOTS - 1;  /* erster Eintrag landet in Slot 0 */
    }
    current_frequency_antenna = last_saved_state.frequency_antenna;
    current_selection_flags   = last_saved_state.selection_flags;
    current_selected_station  = last_saved_state.selected_station;
    if (current_selected_station < FIRST_SELECTABLE_STATION ||
        current_selected_station > LAST_SELECTABLE_STATION)
        current_selected_station = DEFAULT_SELECTED_STATION;  /* Absicherung */
    save_delay_ticks = 0;
    return valid_record_found;
}

static void save_state_to_ring(void)
{
    if (current_frequency_antenna == last_saved_state.frequency_antenna &&
        current_selection_flags   == last_saved_state.selection_flags &&
        current_selected_station  == last_saved_state.selected_station)
        return;  /* z. B. Wert geaendert und wieder zurueckgestellt */

    state_record_t record = {
        .sequence_number   = last_saved_state.sequence_number + 1,
        .frequency_antenna = current_frequency_antenna,
        .selection_flags   = current_selection_flags,
        .selected_station  = current_selected_station,
    };
    record.checksum = calculate_checksum(&record, STATE_CHECKSUM_LENGTH);
    current_slot_index = (current_slot_index + 1) % STATE_RING_SLOTS;
    eeprom_update_block(&record, &eeprom_layout.state_ring[current_slot_index], sizeof record);
    last_saved_state = record;
}

void nvm_tick_10ms(void)
{
    if (save_delay_ticks && --save_delay_ticks == 0)
        save_state_to_ring();
}

/* ---------------- Zustand lesen ---------------- */

uint16_t nvm_get_frequency(void)
{
    return get_field_16(current_frequency_antenna, FREQUENCY_SHIFT, FREQUENCY_MASK);
}

uint8_t nvm_get_antenna(void)
{
    return (uint8_t)get_field_16(current_frequency_antenna, ANTENNA_SHIFT, ANTENNA_MASK);
}

uint8_t nvm_get_play(void)   { return get_field_8(current_selection_flags, PLAY_SHIFT,   PLAY_MASK);   }
uint8_t nvm_get_record(void) { return get_field_8(current_selection_flags, RECORD_SHIFT, RECORD_MASK); }
uint8_t nvm_get_bank(void)   { return get_field_8(current_selection_flags, BANK_SHIFT,   BANK_MASK);   }
uint8_t nvm_get_selected_station(void) { return current_selected_station; }

/* ---------------- Zustand aendern ---------------- */

static void update_frequency_antenna(uint8_t shift, uint16_t mask, uint16_t value)
{
    uint16_t new_frequency_antenna = set_field_16(current_frequency_antenna, shift, mask, value);
    if (new_frequency_antenna == current_frequency_antenna)
        return;
    current_frequency_antenna = new_frequency_antenna;
    restart_save_delay();
}

static void update_selection_flags(uint8_t shift, uint8_t mask, uint8_t value)
{
    uint8_t new_selection_flags = set_field_8(current_selection_flags, shift, mask, value);
    if (new_selection_flags == current_selection_flags)
        return;
    current_selection_flags = new_selection_flags;
    restart_save_delay();
}

void nvm_set_frequency(uint16_t frequency) { update_frequency_antenna(FREQUENCY_SHIFT, FREQUENCY_MASK, frequency); }
void nvm_set_antenna(uint8_t antenna)      { update_frequency_antenna(ANTENNA_SHIFT,   ANTENNA_MASK,   antenna);   }
void nvm_set_play(uint8_t play)            { update_selection_flags(PLAY_SHIFT,   PLAY_MASK,   play);   }
void nvm_set_record(uint8_t record)        { update_selection_flags(RECORD_SHIFT, RECORD_MASK, record); }
void nvm_set_bank(uint8_t bank)            { update_selection_flags(BANK_SHIFT,   BANK_MASK,   bank);   }

void nvm_set_selected_station(uint8_t station)
{
    if (station < FIRST_SELECTABLE_STATION || station > LAST_SELECTABLE_STATION)
        return;
    if (station == current_selected_station)
        return;
    current_selected_station = station;
    restart_save_delay();
}
