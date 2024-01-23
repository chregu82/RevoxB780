// constants
// The ROM size to be dumped. Adjust according to the MK3870 variant being dumped.
#ifndef ROM_BYTES
#define ROM_BYTES 4032
#endif

#ifndef LOG_CLOCK_TIMING
#define LOG_CLOCK_TIMING 0
#endif

#ifndef INTEL_HEX_FORMAT
#define INTEL_HEX_FORMAT 1
#endif

#define HEX_CHARS_PER_LINE 16

#define CLOCK_DELAY_US 1

const uint8_t PORT4_PINS[] =  {22, 23, 24, 25, 26, 27, 28, 29};   // Port A
const uint8_t PORT5_PINS[] =  /*{30, 31, 32, 33, 34, 35, 36, 37};*/   {37, 36, 35, 34, 33, 32, 31, 30};   // Port C

const uint8_t XTAL2_PIN = 41;
const uint8_t RESET_PIN = 40;
const uint8_t STROBE_PIN = 38;

const uint8_t ACTIVATE_TEST_7V_PIN = 49;
const uint8_t ACTIVATE_TEST_3p5V_PIN = 48;
const uint8_t MK3870_POWER_PIN = 39;

const uint8_t BITS[8] = {1,2,4,8,16,32,64,128};

void powerOff();
void powerOn(void);
uint8_t readFromPort4(void);
void writeToPort5(uint8_t value);
void setupPins();
void setTestVoltageOff();
void setTestVoltage7();
void setTestVoltage3p5();
void reset(void);
void tickClockHigh(void);
void tickClockLow(void);
void tickExternalClock(void);
void tickInternalClock(void);
void prepareForDump(void);
void writeBytecodeAndTick(uint8_t bytecode, uint8_t internal_ticks);
bool dumpROM(uint16_t rom_bytes, uint8_t* data_ptr);
bool logClockCycles(int num_cycles);
void initMK();
void printByteValue(uint8_t value);
void printAddress(uint16_t addr);

// globals
uint8_t *data_ptr = nullptr;

void printByteValue(uint8_t value) {
  if (value <0x0010) {
    Serial.print(F("0"));
  }
  Serial.print(value, HEX);
}

void printAddress(uint16_t addr) {
  if (addr <0x1000) {
    Serial.print(F("0"));
  }
  if (addr <0x0100) {
    Serial.print(F("0"));
  }
  if (addr <0x0010) {
    Serial.print(F("0"));
  }
  Serial.print(addr, HEX);
}

bool logClockCycles(int num_cycles) {

    uint8_t* data = (uint8_t*)malloc(num_cycles*8);

    if (data == nullptr) {
        Serial.println(F("\n\nERROR - could not allocate data buffer"));
        return false;
    }
    powerOn();
    prepareForDump();
    setTestVoltage3p5();

    Serial.print(F("Starting Dump : db = $"));
    Serial.print(readFromPort4(),HEX);
    Serial.print(F("\n"));

    // must clock as quickly as possible as the MK3870 gets tripped up with a slow clock.
    // collected data first, then print out later.
    int idx = 0;
    for (int i = 0; i < num_cycles; i++) {
        digitalWrite(XTAL2_PIN, LOW);
        data[idx++] = readFromPort4();
        data[idx++] = digitalRead(STROBE_PIN);
        digitalWrite(XTAL2_PIN, HIGH);
        data[idx++] = readFromPort4();
        data[idx++] = digitalRead(STROBE_PIN);
        digitalWrite(XTAL2_PIN, LOW);
        data[idx++] = readFromPort4();
        data[idx++] = digitalRead(STROBE_PIN);
        digitalWrite(XTAL2_PIN, HIGH);
        data[idx++] = readFromPort4();
        data[idx++] = digitalRead(STROBE_PIN);
    }
    setTestVoltageOff();
    powerOff();

    idx = 0;
    for (int i = 0; i < num_cycles; i++) {
        Serial.print(F("Clock cycle #"));
        Serial.print(i);
        Serial.print(F("\n"));

        Serial.print(F("  step 0, clock LOW : db = $"));
        Serial.print(data[idx++],HEX);
        Serial.print(F(", strobe = "));
        Serial.print(data[idx++]);
        Serial.print(F("\n"));

        Serial.print(F("  step 1, clock HIGH : db = $"));
        Serial.print(data[idx++],HEX);
        Serial.print(F(", strobe = "));
        Serial.print(data[idx++]);
        Serial.print(F("\n"));


        Serial.print(F("  step 2, clock LOW : db = $"));
        Serial.print(data[idx++],HEX);
        Serial.print(F(", strobe = "));
        Serial.print(data[idx++]);
        Serial.print(F("\n"));

        Serial.print(F("  step 3, clock HIGH : db = $"));
        Serial.print(data[idx++],HEX);
        Serial.print(F(", strobe = "));
        Serial.print(data[idx++]);
        Serial.print(F("\n"));

    }

    free(data);
    return true;
}

bool dumpROM(uint16_t rom_bytes, uint8_t* data_ptr) {
    powerOn();
    delay(1);
    prepareForDump();
    setTestVoltage7();
    writeToPort5(0);

    // first, load DCI instructions $2A
    tickInternalClock();
    writeBytecodeAndTick(0x2A, 3);
    // load MSB of address $0000
    writeBytecodeAndTick(0, 9);
    // load LSB of address $0000
    writeBytecodeAndTick(0, 9);


    for (uint16_t addr = 0; addr < rom_bytes; addr++) {
        writeToPort5(0);
        setTestVoltage7();
        // write LM instruction $16
        writeBytecodeAndTick(0x16, 3);

        // now read value
        setTestVoltage3p5();
        tickExternalClock();
        //data_ptr[addr] = readFromPort4();
        tickExternalClock();
        //data_ptr[addr] = readFromPort4();


        // tick 5 internal clock more times
        tickInternalClock();
        data_ptr[addr] = readFromPort4();
        tickInternalClock();
        tickInternalClock();
        tickInternalClock();
        tickInternalClock();
    }

    // done, reset the MK3870
    setTestVoltageOff();
    powerOff();

    return true;
}

void writeBytecodeAndTick(uint8_t bytecode, uint8_t internal_ticks)
{
    // the byte code should be on the data bus after 1/2 internal clock cycle
    // and then the data bus restored to 0 halfway through the last internal
    // clock cycle.
    //
    // the internal_ticks argument represent the number of internal clock cycles
    // that follows the initial clock cycle that clocked in the byte code onto
    // the data bus.
    tickExternalClock();
    writeToPort5(bytecode);
    tickExternalClock();
    for (uint8_t i = 0; i < internal_ticks-1; i++) {
        tickInternalClock();
    }
    tickExternalClock();
    writeToPort5(0);
    tickExternalClock();
}

void prepareForDump(void)
{
    Serial.println(F("  preparing for dump"));
    writeToPort5(0);
    setTestVoltage3p5();
    reset();

    // wait for strobe = LOW after reset
    // need to drive clock "manually" here to detect when strobe
    // resets. When it does reset, ensure the external clock is aligned to
    // internal clock (2 to 1 ratio)
    bool strobe_not_found = true;
    bool half_off = false;
    while (strobe_not_found) {
        tickClockLow();
        if (digitalRead(STROBE_PIN) == LOW) {
            strobe_not_found = false;
        }

        tickClockHigh();
        if (digitalRead(STROBE_PIN) == LOW) {
            strobe_not_found = false;
        }

        tickClockLow();
        if (digitalRead(STROBE_PIN) == LOW) {
            if (strobe_not_found) {
                half_off = true;
            }
            strobe_not_found = false;
        }

        tickClockHigh();
        if (digitalRead(STROBE_PIN) == LOW) {
            if (strobe_not_found) {
                half_off = true;
            }
            strobe_not_found = false;
        }
    }
    if (half_off) {
        // if we are here, the strobe is 1/2 a clock off. tick it again
        tickExternalClock();
    }
}

uint8_t readFromPort4(void)
{
    return PINA;
}

void powerOn(void)
{
    digitalWrite(XTAL2_PIN, HIGH);
    digitalWrite(RESET_PIN, HIGH);
    writeToPort5(0);
    digitalWrite(MK3870_POWER_PIN, LOW);
    delayMicroseconds(CLOCK_DELAY_US);
}

void tickClockHigh(void) {
  digitalWrite(XTAL2_PIN, HIGH);
  delayMicroseconds(CLOCK_DELAY_US);
}

void tickClockLow(void) {
  digitalWrite(XTAL2_PIN, LOW);
  delayMicroseconds(CLOCK_DELAY_US);
}
void tickExternalClock(void)
{
  tickClockLow();
  tickClockHigh();
}

void tickInternalClock(void)
{
  tickExternalClock();
  tickExternalClock();
}

void reset(void)
{
  Serial.println(F("  reseting MK3870"));
  digitalWrite(RESET_PIN, LOW);
  setTestVoltage7();
  writeToPort5(0x55);//(0xA3);
  if (readFromPort4() == 0x55)//0xA3)
  {
    Serial.println("Mostek detected");
  }
  else
  {
    Serial.println("Mostek NOT detected");
  }
  writeToPort5(0);
  for (int i = 0; i < 8; i++){
    tickInternalClock();
  }
  digitalWrite(RESET_PIN, HIGH);
}

void setTestVoltageOff()
{
  digitalWrite(ACTIVATE_TEST_7V_PIN, LOW);
  digitalWrite(ACTIVATE_TEST_3p5V_PIN, LOW);
}

void setTestVoltage7()
{
  digitalWrite(ACTIVATE_TEST_3p5V_PIN, LOW);
  digitalWrite(ACTIVATE_TEST_7V_PIN, HIGH);
}

void setTestVoltage3p5()
{
  digitalWrite(ACTIVATE_TEST_7V_PIN, LOW);
  digitalWrite(ACTIVATE_TEST_3p5V_PIN, HIGH);
}

void powerOff()
{
    digitalWrite(MK3870_POWER_PIN, HIGH);
    // set all lines low so no power enters MK3870
    digitalWrite(XTAL2_PIN, LOW);
    digitalWrite(RESET_PIN, LOW);
    writeToPort5(0xFF);
}

void writeToPort5(uint8_t value)
{
  // invert the value since port is active low
  uint8_t inverted_value = ~value;
  for (uint8_t i = 0; i < 8; i++)
  {
    uint8_t bit_value = LOW;
    if (inverted_value&BITS[i])
    {
      bit_value = HIGH;
    }
    digitalWrite(PORT5_PINS[i],bit_value);
  }
}

void setupPins()
{
  for (char i=0;i<8;i++)
  {
    pinMode(PORT4_PINS[i], INPUT);
    pinMode(PORT5_PINS[i], OUTPUT);
    digitalWrite(PORT5_PINS[i], HIGH);
  }

  // mk3870 control pins
  pinMode(XTAL2_PIN, OUTPUT);
  digitalWrite(XTAL2_PIN, HIGH);
  pinMode(RESET_PIN, OUTPUT);
  digitalWrite(RESET_PIN, HIGH);
  pinMode(STROBE_PIN, INPUT);
  // test pin voltage control
  pinMode(ACTIVATE_TEST_7V_PIN, OUTPUT);
  pinMode(ACTIVATE_TEST_3p5V_PIN, OUTPUT);
  pinMode(MK3870_POWER_PIN, OUTPUT);
  powerOff();
  setTestVoltageOff();
}

void initMK()
{
  setupPins();
  setTestVoltageOff();
  writeToPort5(0);
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(57600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB
  }
  Serial.println(F("\n\nMOSTEK 3870 ROM DUMPER\n\n"));

  // create device interface
  initMK();

  // create buffer
  data_ptr = (uint8_t *)malloc(ROM_BYTES);

  if (data_ptr == nullptr) {
    Serial.println(F("ERROR - could not allocate data buffer"));
  }

  //////
  /*powerOn();
  delay(1);
  Serial.println(F("  reseting MK3870"));
  digitalWrite(RESET_PIN, LOW);
  setTestVoltage7();
  writeToPort5(0xF0);
  if (readFromPort4() == 0xF0)
  {
    Serial.println("Mostek detected");
  }
  else
  {
    Serial.println("Mostek NOT detected");
  }*/
}

void loop() {
  while (Serial.available()) {
    Serial.read();
  }
  Serial.print(F("Press any key to start ROM dump > "));
  while (Serial.available() == 0) {
    ;
  }
  while (Serial.available()) {
    Serial.read();
  }
#if LOG_CLOCK_TIMING
  // Call the code that does only a dump of the MK3870 data bus
  // as it runs through the code on the EEPROM. Useful for
  // figuring out the instruction timing requirements.
  logClockCycles(200);
#else
  Serial.println(F("\nStarting ROM dump ..."));
  if (dumpROM(ROM_BYTES, data_ptr)) {
    Serial.println(F("\n\nROM dump"));
    Serial.println(F("================"));
    // print hex data
#if INTEL_HEX_FORMAT
    int line_char_count = 0;
    int line_checksum = 0;
    for (uint16_t i = 0; i < ROM_BYTES; i++) {
      if (line_char_count == 0) {
        Serial.print(F(":"));
        // byte count
        printByteValue(HEX_CHARS_PER_LINE);
        // address
        printAddress(i);
        // record type
        printByteValue(0);

        // checksume should be adding individual bytes, but recrd type is 0
        line_checksum = HEX_CHARS_PER_LINE + ((i>>8)&0xFF) + (i&0xFF);
      }
      printByteValue(data_ptr[i]);
      line_checksum += data_ptr[i];
      line_char_count++;
      if (line_char_count >= HEX_CHARS_PER_LINE) {
        // gets 2's complement of LSB of checksum
        int checksum_value = (~(line_checksum&0xFF))+1;
        printByteValue(checksum_value);
        Serial.println(F(""));
        line_char_count = 0;
      }
    }
#else
    int line_char_count = 0;
    for (uint16_t i = 0; i < ROM_BYTES; i++) {
      if (line_char_count == 0) {
        printAddress(i);
        Serial.print(F(":  "));
      }
      else if (line_char_count == 8 ) {
        Serial.print(F(" "));
      }
      printByteValue(data_ptr[i]);
      Serial.print(F(" "));
      line_char_count++;
      if (line_char_count >= HEX_CHARS_PER_LINE) {
        Serial.println(F(""));
        line_char_count = 0;
      }
    }
#endif
    Serial.println(F("================\n\n"));
  }
#endif
}
