; Revox B780 Firmware
; CPU Mostek MK3875

; Schratchpad Dezimal (Oktal)
; 00 (00): Loopzähler im Init, 
; 01 (01)
; 02 (02)
; 03 (03); Zwischenspeicher
; 04 (04)
; 05 (05): wird mit 0 initialisiert
; 06 (06): wird mit 0 initialisiert
; 07 (07)
; 08 (10): Globaler Timer (wird im 25.6ms Takt dekrementiert)
; 09 (11): J Register
; 10 (12): HU Register: High order byte 0x0f -> für immer RAM Adresse mit NF
; 11 (13): HL Register: Low order byte 0xfc -> für immer RAM Adresse mit NF
; 12 (14): KU Register
; 13 (15): KL Register
; 14 (16): QU Register: Zwischenspeicher
; 15 (17): QL Register: Zwischenspeicher
; 16 (20): Daten Eingangmultiplexer an Port 5 mit C,B,A 000                     0: Outputs, 1:Output, 2:Z, 3:H (Amp Overtemp), 4:DDE (Dolby Deemphasis), 5:HBL, 6:STME (Store Memory), 7:KS8
; 17 (21): Daten Eingangmultiplexer an Port 5 mit C,B,A 001                     0: Outputs, 1:Output, 2:Z, 3:RECOFF, 4:NR, 5:P (Pilot Present), 6:CHTM (Change Tuning Mode), 7:KS7
; 18 (22): Daten Eingangmultiplexer an Port 5 mit C,B,A 010                     0: Outputs, 1:Output, 2:Z, 3:RECSET, 4:NOD (No Dolby Insert), 5:MONO, 6:LSNE (Stern), 7:KS6
; 19 (23): Daten Eingangmultiplexer an Port 5 mit C,B,A 011                     0: Outputs, 1:Output, 2:Z, 3:TA2, 4:FL (Frequency Low), 5:MOFF, 6:DOWN, 7:KS5
; 20 (24): Daten Eingangmultiplexer an Port 5 mit C,B,A 100                     0: Outputs, 1:Output, 2:Z, 3:TA1, 4:FH (Frequency High), 5:THSTA (Threshold Station), 6:UP, 7:KS4
; 21 (25): Daten Eingangmultiplexer an Port 5 mit C,B,A 101                     0: Outputs, 1:Output, 2:Z, 3:AUX, 4:TSPB, 5:STLY, 6:75us, 7:KS3
; 22 (26): Daten Eingangmultiplexer an Port 5 mit C,B,A 110                     0: Outputs, 1:Output, 2:Z, 3:PHO, 4:TSPA, 5:THSTE (Threshold Stereo), 6:KS0, 7:KS2
; 23 (27): Daten Eingangmultiplexer an Port 5 mit C,B,A 111                     0: Outputs, 1:Output, 2:Z, 3:TU, 4:DC (Amp DC), 5:LOC (Synthesizer locked in), 6:KS9, 7:KS1
; 24 (30): Daten Eingangmultiplexer an Port 5 mit C,B,A 000 (zweites Einlesen)
; 25 (31): Daten Eingangmultiplexer an Port 5 mit C,B,A 001 (zweites Einlesen)
; 26 (32): Daten Eingangmultiplexer an Port 5 mit C,B,A 010 (zweites Einlesen)
; 27 (33): Daten Eingangmultiplexer an Port 5 mit C,B,A 011 (zweites Einlesen)
; 28 (34): Daten Eingangmultiplexer an Port 5 mit C,B,A 100 (zweites Einlesen)
; 29 (35): Daten Eingangmultiplexer an Port 5 mit C,B,A 101 (zweites Einlesen)
; 30 (36): Daten Eingangmultiplexer an Port 5 mit C,B,A 110 (zweites Einlesen)
; 31 (37): Daten Eingangmultiplexer an Port 5 mit C,B,A 111 (zweites Einlesen)
; 32 (40): bits 8..15 vom ersten SAA1060, loadbit = 0
; 33 (41): bits 0..7 vom ersten SAA1060, loadbit = 0
; 34 (42): Wird mit 0 initialisiert an 0x0259, später Datenbyte (nur bit 1..7) anhand Anwahl NF1..NF4 von 052d      bits 8..15 vom zweiten SAA1060, loadbit = 0
; 35 (43): Wird mit 0 initialisiert an 0x025a                                                                       bits 0..7 vom zweiten SAA1060, loadbit = 0
; 36 (44): Wird mit 0 initialisiert an 0x025b
; 37 (45)
; 38 (46): Wird mit 0 initialisiert an 0x025d, Bit0: Endstufe ok, Bit 1: Spk B ein, Bit 2: Spk A ein, Bit 6: Taste zur Anwahl Play/Rec gedrückt
; 39 (47): Wird mit 0xFF initialisiert an 0x025f, Bit0: Muting, Bit 1: Stereo Filter, Bit5: MC Meter Control
; 40 (50): bits 8..15 vom ersten SAA1060, loadbit = 1
; 41 (51): bits 0..7 vom ersten SAA1060, loadbit = 1
; 42 (52): Wird mit 0 initialisiert an 0x0257, später Datenbyte (nur bit 1..7) anhand Anwahl NF5..NF8 von 052e      bits 8..15 vom zweiten SAA1060, loadbit = 1
; 43 (53): Wird mit 0 initialisiert an 0x0256                                                                       bits 0..7 vom zweiten SAA1060, loadbit = 1
; 44 (54)
; 45 (55)
; 46 (56): Verwendet
; 47 (57): Verwendet (Antennensteuerung)
; 48 (60)
; 49 (61)
; 50 (62): Wird mit 0 initialisiert an 0x0253, später Datenbyte (nur bit 1..7) anhand Anwahl NF1..NF4 von 052d
; 51 (63): Wird mit 0 initialisiert an 0x0254
; 52 (64)
; 53 (65)
; 54 (66): Daten für Antennensteuerung zweite 8 bit
; 55 (67): Daten für Antennensteuerung erste 8 bit
; 56 (70)
; 57 (71)
; 58 (72): Wird mit 0 initialisiert an 0x0251, später Datenbyte (nur bit 1..7) anhand Anwahl NF5..NF8 von 052e
; 59 (73): Wird mit 0 initialisiert an 0x0250
; 60 (74)
; 61 (75)
; 62 (76)
; 63 (77)


; Port 0 (Output)
;;;;;;;;
; Bit 0: n/a
; Bit 1: n/a
; Bit 2: Ausgang ST (Stereo ein wenn 1 am Pin), STD Output (6K)
; Bit 3: Ausgang DON (Dolby NR ein wenn 1 am Pin), STD Output (6K)
; Bit 4: Anwahl NF1, STD Output (6K)
; Bit 5: Anwahl NF2, STD Output (6K)
; Bit 6: Anwahl NF3, STD Output (6K)
; Bit 7: Anwahl NF4, STD Output (6K)

; Port 1 (Output)
;;;;;;;;
; Bit 0: Multiplexer A, STD Output (6K)
; Bit 1: Multiplexer B, STD Output (6K)
; Bit 2: Multiplexer C, STD Output (6K)
; Bit 3: Ausgang S (nur für Tests -> Fernbedienung), STD Output (6K)
; Bit 4: Anwahl NF5, STD Output (6K)
; Bit 5: Anwahl NF6, STD Output (6K)
; Bit 6: Anwahl NF7, STD Output (6K)
; Bit 7: Anwahl NF8, STD Output (6K)

; Port 4 (Output)
;;;;;;;;;
; Bit 0: not connected
; Bit 1: not connected
; Bit 2: DLEN5, Direct Drive (1K)
; Bit 3: Enable (Low-Active) Multiplexer für 8 Outputs: IC3 (7406), STFI, MC, Direct Drive (1K)
; Bit 4: DLEN3, Direct Drive (1K)
; Bit 5: DLEN2, Direct Drive (1K)
; Bit 6: DLEN1, Direct Drive (1K)
; Bit 7: DATA, Direct Drive (1K)

; Port 5 (I/O)
;;;;;;;;;
; Bit 0: Ausgang PH, STD Output (6K)         -> Schaltet Preamp Relais und Kopfhörer
; Bit 1: Ausgang PONL/PONR, Direct Drive (1K)  -> schaltet Endstufen ein / aus
; Bit 2: Eingang Z, hat externen Pull-Up, von Antennensteuerung
; Bit 3: Eingang Multiplexer von IC6 
; Bit 4: Eingang Multiplexer von IC7
; Bit 5: Eingang Multiplexer von IC8
; Bit 6: Eingang Multiplexer von IC9
; Bit 7: Eingang Multiplexer von IC10

; Port 6 (Interrupt Control)
;;;;;;;;;
; Bit 0: Ext. Interrupt enable
; Bit 1: Timer Interrupt enable
; Bit 2: EXT INT Active level
; Bit 3: Start / Stop timer
; Bit 4: Pulse Width/Interval Timer
; Bit 5: /2 Prescale
; Bit 6: /5 Prescale
; Bit 7: /20 Prescale

; Output Multiplexer
; C,B,A -> Output Signal
; 000 -> STFI1/2 (Stereo Filter ON)
; 001 -> MC (Meter Control)
; 010 -> Deemphasis 25us
; 011 -> Deemphasis 75us
; 100 -> WW (Comparator Window Wide)
; 101 -> SPB (Speakers B ON)
; 110 -> SPA (Speakers A ON)
; 111 -> MUT (Muting ON)

CartridgeStart: equ $0800
CartridgeEntry: equ $0802

; Ports Reset auf Pull Up (Port 0 und 5), Interrupt aus
Reset:          NOP                      ; 0000 2b          ; NOP
                DI                       ; 0001 1a          ; Disable Interrupt
                LIS  $0                  ; 0002 70          ; Akku = 0
                OUT  $6                  ; 0003 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                OUT  $5                  ; 0005 27 05       ; Schreibe Akku (0) in Port 5 (I/O Port 5) -> 0xFF
                OUTS 0                   ; 0007 b0          ; Schreibe Akku (0) in Port 0 (I/O Port 0) -> 0xFF
                
; Initialisiere Loop für 8 Mal, um Ausgansmultiplexer zu initialisieren mit 8 mal Bit 0 -> Alle Ausgänge vom Multiplexer werden 0, nach Inverter sind sie 1
; Es wird begonnen mit bit 7, als letztes bit 0 des Multiplexers
                LIS  $8                  ; 0008 78          ; Akku = 0x08
                LR   $0                  ; 0009 50          ; Schreibe Akku (0x08) in Scratchpad 0
                LIS  $0                  ; 000a 70          ; Akku = 0
Ab:             OUTS 1                   ; 000b b1          ; Schreibe Akku (0) in Port 1 (I/O Port 1) -> 0xFF
                PI   $45b1               ; 000c 28 45 b1    ; PC1 = 0x00f, call subroutine 0x05b1 -> LoadLowToOutputMultiplexer
                INS  1                   ; 000f a1          ; Lade invertierten Port 1 (I/O) in Akku
                INC                      ; 0010 1f          ; Increment Akku
                DS   $0                  ; 0011 30          ; Dekrementiere Scratchpad Byte 0 um 1 -> Loopt 8 mal
                BF   $4                  ; 0012 94 f8       ; Branch wenn zero bit nicht gesetzt 8 bytes zurück, wenn loop noch nicht fertig -> 0x000b
                
; Initialisiere Scratchpad 10,11 mit 0xffc, Scratchpad 5,6 mit 0 und ISAR 73, springe weiter
                LIS  $0                  ; 0014 70          ; Akku = 0
                LR   $5                  ; 0015 55          ; Lade Scratchpad Byte 5 mit Akkumulator, also 0x00
                LR   $6                  ; 0016 56          ; Lade Scratchpad Byte 6 mit Akkumulator, also 0x00
                DCI  Affc                ; 0017 2a 0f fc    ; Lade DC0 mit 0xffc (RAM)
                LR   H,DC                ; 001a 11          ; Kopiere DC in Scratchpad Byte 10 und 11
                LISU 7                   ; 001b 67          ; Fülle oberes ISAR mit 7x
                LISL 3                   ; 001c 6b          ; Fülle unteres ISAR mit x3
                JMP  $424f               ; 001d 29 42 4f    ; Springe zu 0x024f
                
; Timer Interrupt Start
                LR   QU,A                ; 0020 06          ; Speichere Akku in Scratchpad 14
                LR   J,W                 ; 0021 1e          ; Speichere Statusregister in Scratchpad 9
                LR   A,IS                ; 0022 0a          ; Lade ISAR in Akku
                LR   QL,A                ; 0023 07          ; Speichere Akku in Scratchpad 15
                DS   $8                  ; 0024 38          ; Dekrementiere Scratchpad 8
                
; Subroutine (von 0x587 oder 0x98a oder 0xd29), Scratchpad 8 ist dann null
                LR   A,$8                ; 0025 48          ; Lade Akku ab Scratchpad 8
                SL   1                   ; 0026 13          ; Schiebe links um 1 (*2)
                BF   $4                  ; 0027 94 72       ; Branch wenn nicht null um +0x72 nach 0x09a
                DS   $4                  ; 0029 34          ; Dekrementiere Scratchpad 4
; hierher von 0x070
A2a:            LIS  $1                  ; 002a 71          ; Akku = 0x01
                NS   $4                  ; 002b f4          ; Akku &= Scratchpad 4
                BF   $4                  ; 002c 94 04       ; Branch wenn nicht null (bit 1 war gesetzt in Scratchpad 4) um +0x4 nach 0x031
                LISU 4                   ; 002e 64          ; Fülle oberes ISAR mit 4x
                BF   $0                  ; 002f 90 0c       ; Branch immer um +c nach 0x03c

A31:            LISU 6                   ; 0031 66          ; Fülle oberes ISAR mit 6x
                BF   $0                  ; 0032 90 09       ; Branch immer um +9 nach 0x03c

A34:            LIS  $1                  ; 0034 71          ; Akku = 0x01
                NS   $4                  ; 0035 f4          ; Akku &= Scratchpad 4
                BF   $4                  ; 0036 94 04       ; Branch wenn nicht null (bit 1 war gesetzt in Scratchpad 4) um +0x4 nach 0x03b
                LISU 5                   ; 0038 65          ; Fülle oberes ISAR mit 5x
                BF   $0                  ; 0039 90 02       ; Branch immer um +2 nach 0x03c

A3b:            LISU 7                   ; 003b 67          ; Fülle oberes ISAR mit 7x

A3c:            LR   A,$2                ; 003c 42          ; Lade Akku ab Scratchpad 2
                SL   1                   ; 003d 13          ; Schiebe links um 1 (*2)
                BT   1                   ; 003e 81 04       ; Branch wenn positiv (bit 7 nicht gesetzt) um +4 nach 0x043
                LISL 3                   ; 0040 6b          ; Fülle unteres ISAR mit x3
                BF   $0                  ; 0041 90 02       ; Branch immer um +2 nach 0x044

A43:            LISL 1                   ; 0043 69          ; Fülle unteres ISAR mit x1
A44:            JMP  $4173               ; 0044 29 41 73    ; Springe nach 0x173 -> WriteToSAAorAntenna

; Jump von 0x1cc (WriteToSAAorAntenna)
; Wenn Scratchpad 2 Bit 0 gesetzt gehe zu 0x055               
                LIS  $1                  ; 0047 71          ; Akku = 0x01
                NS   $2                  ; 0048 f2          ; UND Scratchpad 2
                BF   $4                  ; 0049 94 0b       ; Branch wenn nicht 0, also wenn bit 0 in Scratchpad 2 gesetzt, um +b -> 0x055
; Setze bit 0 in Scratchpad 2
                LR   A,$2                ; 004b 42          ; Lade Akku ab Scratchpad 2
                OI   $1                  ; 004c 22 01       ; Setze bit 0
                LR   $2                  ; 004e 52          ; Schreibe Akku () in Scratchpad 2
; Toggle bit 7 in Scratchpad 4, dann gehe nach 0x5c
                LR   A,$4                ; 004f 44          ; Kopiere Scratchpad 4 in Akku
                XI   $80                 ; 0050 23 80       ; Toggle bit 7 im Akku
                LR   $4                  ; 0052 54          ; Speichere Akku in Scratchpad 4
                BF   $0                  ; 0053 90 08       ; Branch immer um +8 nach 0x05c
; Lösche Bit 0 in Scratchpad 2 wieder, war ja vorher gesetzt                
A55:            DS   $2                  ; 0055 32          ; Dekrementiere Scratchpad 2
; Toggle bit 7 in Scratchpad 4, dann gehe nach 0x034
                LR   A,$4                ; 0056 44          ; Kopiere Scratchpad 4 in Akku
                XI   $80                 ; 0057 23 80       ; Toggle bit 7 im Akku
                LR   $4                  ; 0059 54          ; Speichere Akku in Scratchpad 4
                BF   $0                  ; 005a 90 d9       ; Branch immer um -39 bytes nach 0x034
; Wenn Scratchpad 6 bit 0 und 1 nicht beide gesetzt, gehe zu 0x07a
A5c:            LR   A,$6                ; 005c 46          ; Lade Akku ab Scratchpad 6
                NI   $3                  ; 005d 21 03       ; Akku &= 0x03, nur erste 2 bit
                CI   $3                  ; 005f 25 03       ; Akku = 0x03 - Akku
                BF   $4                  ; 0061 94 18       ; Branch wenn nicht null um +0x18 nach 0x07a
; Lösche bit 0 in Scratchoad 6
                LR   A,$6                ; 0063 46          ; Lade Akku ab Scratchpad 6
                SR   1                   ; 0064 12
                SL   1                   ; 0065 13          ; Lösche bit 0
; Wenn Bit 7 in Scratchpad 6 gesetzt, gehe zu 0x072
                BF   $1                  ; 0066 91 0b       ; Branch wenn negativ (bit 7 = 1) um +b nach 0x072 
; Scratchpad 2 XOR 0x60 (Toggle bit 6 und 5 in Scratchpad 2)
                LI   $60                 ; 0068 20 60       ; Akku = 0x60
                XS   $2                  ; 006a e2          ; Akku = Akku XOR Scratchpad 2
                LR   $2                  ; 006b 52          ; Schreibe Akku () in Scratchpad 2
; Setze bit 7 in Scratchpad 6 und springe nach 0x02a
                LR   A,$6                ; 006c 46          ; Lade Akku ab Scratchpad 6
                OI   $80                 ; 006d 22 80       ; Setze bit 7
                LR   $6                  ; 006f 56          ; Speichere Akku in Scratchpad 6
                BF   $0                  ; 0070 90 b9       ; Branch immer um -71 bytes nach 0x02a
; Scratchpad 2 XOR 0x60 (Toggle bit 6 und 5 in Scratchpad 2)
A72:            LI   $60                 ; 0072 20 60       ; Akku = 0x60
                XS   $2                  ; 0074 e2          ; Akku = Akku XOR Scratchpad 2
                LR   $2                  ; 0075 52          ; Schreibe Akku () in Scratchpad 2
; Lösche bit 7 in Scratchpad 6
                LR   A,$6                ; 0076 46          ; Lade Akku ab Scratchpad 6
                NI   $7f                 ; 0077 21 7f       ; Lösche bit 7
                LR   $6                  ; 0079 56          ; Speichere Akku in Scratchpad 6

A7a:            LR   A,$6                ; 007a 46          ; Lade Akku ab Scratchpad 6
                NI   $3                  ; 007b 21 03       ; Akku &= 0x03, nur erste 2 bit
                CI   $1                  ; 007d 25 01       ; rechne 0x01 - Akku
                BF   $4                  ; 007f 94 0b       ; Branch wenn nicht null um +b nach 0x08b
                
                LIS  $1                  ; 0081 71          ; Akku = 0x01
                NS   $4                  ; 0082 f4          ; Akku &= Scratchpad 4
                BT   4                   ; 0083 84 0d       ; Branch wenn 0, um +d -> 0x091
                LR   A,$4                ; 0085 44          ; Kopiere Scratchpad 4 in Akku
                AI   $2                  ; 0086 24 02       ; Akku um 2 inkrementieren
                LR   $4                  ; 0088 54          ; Speichere Akku in Scratchpad 4
                BF   $0                  ; 0089 90 07       ; Branch immer um +7 nach 0x091
                
A8b:            LR   A,$4                ; 008b 44          ; Kopiere Scratchpad 4 in Akku
                SL   1                   ; 008c 13          ; Schiebe 1 links
                CI   $2                  ; 008d 25 02       ; Rechne 0x02 - Akku
                BT   4                   ; 008f 84 10       ; Branch wenn 0, um +10 -> 0x0a0
A91:            LIS  $0                  ; 0091 70          ; Akku = 0
                OUT  $6                  ; 0092 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                OUT  $7                  ; 0094 27 07       ; Schreibe 0 in Timer register (-> Alle 256 Intervalle)
                LI   $ea                 ; 0096 20 ea       ; Akku = 0xea
                OUT  $6                  ; 0098 27 06       ; Schreibe Akku (0xea, 0b 1110 1010) in Port 6 (Interrupt Control Port) -> Starte interrupt timer mit prescale 200, bei 4Mhz / 2 / 200 -> Interval 0.1ms -> Interrupt alle 25.6ms
; Hierher von 0x027
A9a:            LR   A,QL                ; 009a 03          ; Lade Akku ab Scratchpad 15
                LR   IS,A                ; 009b 0b          ; Speichere Akku in ISAR
                LR   W,J                 ; 009c 1d          ; Kopiere Scratchpad 9 in Statusregister (Enable Interrupt?)
                LR   A,QU                ; 009d 02          ; Lade Akku ab Scratchpad 14
                EI                       ; 009e 1b          ; Enable Interrupt
                POP                      ; 009f 1c          ; Zurück aus Subroutine (kopiere PC1 in PC0)

Aa0:            LIS  $0                  ; 00a0 70          ; Akku = 0
                OUT  $6                  ; 00a1 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                LR   $4                  ; 00a3 54          ; Speichere Akku in Scratchpad 4
                LISU 4                   ; 00a4 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 00a5 6c          ; Fülle unteres ISAR mit x4
                LIS  $1                  ; 00a6 71          ; Akku = 0x01
                NS   (IS)                ; 00a7 fc          ; Akku &= Scratchpad 44
                BT   4                   ; 00a8 84 08
                LR   A,(IS)              ; 00aa 4c
                OI   $80                 ; 00ab 22 80
                LR   (IS),A              ; 00ad 5c
                PI   $4ed2               ; 00ae 28 4e d2    ; PC1 = 0x0b1, Call Subroutine 0xed2
Ab1:            LR   A,$2                ; 00b1 42          ; Lade Akku ab Scratchpad 2
                SL   1                   ; 00b2 13
                BT   1                   ; 00b3 81 0b
                LR   A,$5                ; 00b5 45
                SL   1                   ; 00b6 13
                BF   $1                  ; 00b7 91 04       ; Branch wenn negativ (bit 7 = 1) um +4 nach 0xbc
                JMP  $4641               ; 00b9 29 46 41
Abc:            JMP  $4860               ; 00bc 29 48 60
Abf:            LR   A,$5                ; 00bf 45
                NI   $bb                 ; 00c0 21 bb
                LR   $5                  ; 00c2 55
                SR   1                   ; 00c3 12
                SL   1                   ; 00c4 13
                BF   $1                  ; 00c5 91 04       ; Branch wenn negativ (bit 7 = 1) um +4 nach 0xca
                JMP  $4266               ; 00c7 29 42 66
Aca:            JMP  $4679               ; 00ca 29 46 79

;Subroutine LoadInputsWitchCheck
;Einlesen der Eingangsmultiplexer und Z von Antenne
;Wird einmal eingelesen in Scratchpads 27 .. 20 und nach 1024 Zyklen nochmal in Scratchpads 37 .. 30, ist vielleicht etwa 1ms später
;Die Daten werden verglichen, es wird solange wiederholt, bis die Daten bei beiden Durchgängen gleich sind.
                LR   K,P                 ; 00cd 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x8fa oder 0xb62 oder 0xb7f oder 0xdc9 oder 0xe2d)

Ace:            LIS  $4                  ; 00ce 74          ; Akku = 0x04
                LR   $1                  ; 00cf 51          ; Schreibe Akku (0x04) in Scratchpad 1
                BF   $0                  ; 00d0 90 02       ; Gehe direkt zu 0x0d3

;Subroutine LoadInputs
;Scratchpad 1 wurde mit 8 initialisiert wenn Einstieg hier
;Liest Daten vom Port 5 mit den Multiplexern ein in Scratchpad 27 .. 20 mit CBA Zustand 111 ... 000
;Wenn hier eingestiegen wird, wird kein zweites Mal gelesen, es wird also nicht auf gültige Daten geprüft, bzw. entprellt.
;Daten in Scratchpad Otkal 37..30 ungültig bzw nicht initialisiert
                LR   K,P                 ; 00d2 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x389), wird übersprungen wenn von oben her gekommen
Ad3:            LISU 2                   ; 00d3 62          ; Fülle oberes ISAR mit 2x

Ad4:            LISL 7                   ; 00d4 6f          ; Fülle unteres ISAR mit x7
                INS  1                   ; 00d5 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f0                 ; 00d6 21 f0       ; niedere 4 bits nullen
                OI   $7                  ; 00d8 22 07       ; Akku OR mit 0x07 (b 111)  -> A,B,C

Ada:            INC                      ; 00da 1f          ; Inkrementiere Akku
                OUTS 1                   ; 00db b1          ; Output Port 1 mit xxxx 1000 -> wird invertiert, also xxxx 0111         -> Setzt "Remote" bit auf 0
                LIS  $3                  ; 00dc 73          ; Akku = 0x03
                ; loop 3..0 -> warten auf gültige Daten
                LR   $0                  ; 00dd 50          ; Schreibe Akku (0x03) in Scratchpad 0
Ade:            DS   $0                  ; 00de 30          ; Dec Scratchpad 0, wird also 2
                BF   $4                  ; 00df 94 fe       ; Branch wenn nicht null um -2 bytes -> 0x0de
                
                IN   $5                  ; 00e1 26 05       ; Lese Daten von Port 5 in Akku ein (Port mit Eingangsmultiplexer)
                LR   (IS)-,A             ; 00e3 5e          ; Scheibe Daten in Scratchpad, das in ISAR steht (27) (dec ISAR)
                INS  1                   ; 00e4 a1          ; Lade invertierten Port 1 (I/O) in Akku
                BR7  Ada                 ; 00e5 8f f4       ; Branch wenn eines der unteren ISAR bits null ist (<7) (um -12) zu 0x0da
                
                NI   $f0                 ; 00e7 21 f0       ; niedere 4 bits nullen
                OUTS 1                   ; 00e9 b1          ; Schreibe Port 1 (xxxx 1111)                                              -> Setzt "Remote" bit auf 1
                LR   A,$1                ; 00ea 41          ; Lade Akku ab Scratchpad 1 (kann 4 oder 8 sein, nach zweitem Durchgang dann 0)
                SL   4                   ; 00eb 15          ; Schiebe links 4 bit (*16)
                BF   $1                  ; 00ec 91 18       ; Branch on negative (wenn bit 7 gesetzt) +24 byte -> 0x105     -> fertig, return
                SL   1                   ; 00ee 13          ; Schiebe links 1 bit (*2)
                BT   4                   ; 00ef 84 0c       ; Branch wenn 0, um +c -> 0xfc
                
                LIS  $0                  ; 00f1 70          ; Akku = 0
                LR   $0                  ; 00f2 50          ; Schreibe Akku (0x00) in Scratchpad 0
                ; warte 256 Zyklen, 4 mal -> 1024 Zyklen
Af3:            DS   $0                  ; 00f3 30          ; Dec Scratchpad 0, wird also 0xff
                BF   $4                  ; 00f4 94 fe       ; Branch wenn nicht null um -2, also zu 0xf3
                
                DS   $1                  ; 00f6 31          ; Dec Scratchpad 1  (4x)
                BF   $4                  ; 00f7 94 fb       ; Branch wenn nicht null um -5, also zu 0xf3
                LISU 3                   ; 00f9 63          ; Fülle oberes ISAR mit 3x
                BF   $0                  ; 00fa 90 d9       ; Branch immer um -39 bytes -> 0x0d4    -> lese alles nochmal ein, aber nun in Scratchpads 37 .. 30

Afc:            LISL 7                   ; 00fc 6f          ; Fülle unteres ISAR mit x7
; Compare
Afd:            LISU 2                   ; 00fd 62          ; Fülle oberes ISAR mit 2x
                LR   A,(IS)              ; 00fe 4c          ; Fülle Akku mit Scratchpad 27
                LISU 3                   ; 00ff 63          ; Fülle oberes ISAR mit 3x
                XS   (IS)-               ; 0100 ee          ; XOR mit Akku -> Res. im Akku (dec ISAR)
                BF   $4                  ; 0101 94 cc       ; Branch wenn nicht null um -52 bytes -> 0xce
                BR7  Afd                 ; 0103 8f f9       ; Branch wenn eines der unteren ISAR bits null (<7) ist (um -7) zu 0xfd
A105:           PK                       ; 0105 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (diverse Möglichkeiten woher gekommen)
                
;Subroutine HandleInputsKS (Inputhandling KS Tasten)   
; Schreibt Tastennummer in Scratchpad 3             
                LR   K,P                 ; 0106 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x62b oder 0x82d oder 0x903 oder 0xdcf)
                LISL 7                   ; 0107 6f          ; Fülle unteres ISAR mit x7
                LISU 2                   ; 0108 62          ; Fülle oberes ISAR mit 2x

A109:           LR   A,(IS)-             ; 0109 4e          ; Lade Akku mit Scratchpad (ISAR), dec ISAR
                SR   1                   ; 010a 12          
                SL   1                   ; 010b 13          ; bit 0 gelöscht
                BF   $1                  ; 010c 91 11       ; Branch wenn negativ (bit 7 = 1) um 0x11 -> 0x11e      (Tasten KS1-KS8)
                BR7  A109                ; 010e 8f fa       ; Zurück zu A109 bis ISAR 27
                LR   A,(IS)-             ; 0110 4e          ; Lade Akku mit Scratchpad (ISAR), dec ISAR
                SL   1                   ; 0111 13          ; Schiebe links um 1 bit
                BF   $1                  ; 0112 91 08       ; Branch wenn negativ (bit 7 = 1) um 0x08 -> 0x11b      (Taste KS9)
                LR   A,(IS)              ; 0114 4c          ; Lade Akku mit Scratchpad (ISAR)
                SL   1                   ; 0115 13          ; Schiebe links um 1 bit
                BT   1                   ; 0116 81 19       ; Branch wenn positiv (bit 7 = 0) um +0x19 -> 0x130     (Taste KS0) (Upper / Lower)
                LIS  $0                  ; 0118 70          ; Akku = 0
                BF   $0                  ; 0119 90 0b       ; Branch immer nach 0x125 
; KS9
A11b:           LIS  $9                  ; 011b 79          ; Akku = 0x09
                BF   $0                  ; 011c 90 08       ; Branch immer nach 0x125
; KS1..KS8
; Für KS1 ist ISAR hier 26, KS2 ist 25, etc, bis KS1 ist 27 da Überlauf
A11e:           LR   A,IS                ; 011e 0a          ; Lade Akku mit (ISAR) 26 ... 27
                COM                      ; 011f 18          ; Invertiere Akku
                NI   $7                  ; 0120 21 07       ; Akku &= 0x7 -> nur untere 3 bit
                                                            ; 26 (KS1) wird 1 bis 20 (KS8) wird 0, aber dann korrigiert auf 8
                BF   $4                  ; 0122 94 02       ; Branch wenn nicht null um +2 nach 0x125
                LIS  $8                  ; 0124 78          ; Akku = 0x08
; Im Akku steht die Nummer der gedrückten KS Taste (KS1 .. KS9) oder 0 wenn nichts gedrückt
A125:           LR   $3                  ; 0125 53          ; Speichere Akku in Scratchpad 3
                LR   A,$6                ; 0126 46          ; Lade Akku ab Scratchpad 6
                SL   1                   ; 0127 13          ; Schiebe links um 1
                BF   $1                  ; 0128 91 0b       ; Branch wenn negativ (bit 7 = 1) um +b nach 0x134 -> IncReturnAdrBy2AndReturn
                LR   A,$6                ; 012a 46          ; Lade Akku ab Scratchpad 6
                OI   $40                 ; 012b 22 40       ; Setze bit 6
                LR   $6                  ; 012d 56          ; Speichere Akku in Scratchpad 6
                DI                       ; 012e 1a          ; Disable interrupt
                PK                       ; 012f 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0x62b oder 0x82d oder 0x903 oder 0xdcf)
; Hier wenn KS0 (Upper / Lower)
; Lösche bit 6 in Scratchpad 6
A130:           LR   A,$6                ; 0130 46          ; Lade Akku ab Scratchpad 6
                NI   $bf                 ; 0131 21 bf       ; lösche bit 6
                LR   $6                  ; 0133 56          ; Speichere Akku in Scratchpad 6
; Inkrementiere Rücksprungadresse um 2 byte
; wenn Taste KS0 (Upper / Lower) gedrückt oder beim zweiten Drücken von KS1..9
; IncReturnAdrBy2AndReturn
A134:           LR   A,KL                ; 0134 01          ; Lade Akku mit Scratchpad 13
                AI   $2                  ; 0135 24 02       ; Akku um 2 inkrementieren
                LR   KL,A                ; 0137 05          ; Speichere Akku in Scratchpad 13 -> Rücksprungadresse wird um 2 inkrementiert
                LR   A,KU                ; 0138 00          ; Lade Akku mit Scratchpad 12
                LNK                      ; 0139 19          ; Inkrementiere wenn vorher Überlauf
                LR   KU,A                ; 013a 04          ; Speichere Akku in Scratchpad 12
                PK                       ; 013b 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0x62d oder 0x82f oder 0x905 oder 0xdd2)
                
; Subroutine CheckInOutSelectKeys
; Loopt über Tasten für die Wahl Eingang und Ausgang, Taste ist gedrückt wenn bit 0 ist
; Wenn eine Taste gedrückt wird, wird bit 6 in Scratchpad 46 gesetzt und zurückgesprungen
; Ist schon eine Taste gedrückt, wird Rücksprung 2 inkremetiert und zurückgesprungen
; Ist nichts mehr gedrückt wird bit 6 in Scratchpad 46 gelöscht und Rücksprung 2 inkremetiert und zurückgesprungen 
; In Scratchpad 3 steht welche Taste -> 1:TUNER1, 2:PHONO, 3:AUX, 4:TA1, 5:TA2
;
                LR   K,P                 ; 013c 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0xefc)
                LISU 2                   ; 013d 62          ; Fülle oberes ISAR mit 2x          -> Hier sind die Eingangsmutltiplexerwerte
                LISL 7                   ; 013e 6f          ; Fülle unteres ISAR mit x7
                LIS  $5                  ; 013f 75          ; Akku = 0x05                             -> Loope 5 mal über alle Scratchpad mit Eingangswerten
                LR   $3                  ; 0140 53          ; Speichere 5 in Scratchpad 3

A141:           LR   A,(IS)-             ; 0141 4e          ; Lade Akku ab ISAR Scratchpad (dec ISAR)
                SL   4                   ; 0142 15          ; Schiebe links um 4
                BT   1                   ; 0143 81 12       ; Branch wenn positiv (Taste TUNER), prüft schlussendlich auf bit 3, um +0x12 nach 0x156   -> Branch wenn Taste nicht gedrückt (Tuner, Phono etc.)
                LR   A,IS                ; 0145 0a          ; Lade Akku ab ISAR (26..22)
                COM                      ; 0146 18          ; Invertiere Akku (E9 bis ED)
                NI   $7                  ; 0147 21 07       ; nur bits 0,1,2 -> 001 bis 101 -> 1 bis 5
                LR   $3                  ; 0149 53          ; Speichere Wert in Scratchpad 3
                LISU 4                   ; 014a 64          ; Fülle oberes ISAR mit 4x
                LISL 6                   ; 014b 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 014c 4c          ; Lade Akku ab Scratchpad 46
                SL   1                   ; 014d 13          ; Schiebe links um 1 (*2)
                BF   $1                  ; 014e 91 e5       ; Branch wenn negativ um -27 nach 0x134 -> IncReturnAdrBy2AndReturn
                LR   A,(IS)              ; 0150 4c          ; Lade Akku ab Scratchpad 46
                OI   $40                 ; 0151 22 40       ; Setze bit 6
                LR   (IS),A              ; 0153 5c          ; Speichere Akku in Scratchpad 46
                DI                       ; 0154 1a          ; Disable interrupt
                PK                       ; 0155 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0xefc)

A156:           DS   $3                  ; 0156 33          ; Dekrementiere Scratchpad 3
                BF   $4                  ; 0157 94 e9       ; Branch wenn nicht null um -23 bytes nach 0x141    -> Nächste Taste Quellenwahl oder Ausganswahl
                LISU 4                   ; 0159 64          ; Fülle oberes ISAR mit 4x
                LISL 6                   ; 015a 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 015b 4c          ; Lade Akku ab Scratchpad 46
                NI   $bf                 ; 015c 21 bf       ; Lösche bit 6
                LR   (IS),A              ; 015e 5c          ; Speichere Akku in Scratchpad 46
                BF   $0                  ; 015f 90 d4       ; Branch immer um -44 bytes nach 0x134 -> IncReturnAdrBy2AndReturn
                
; Subroutine CheckForTunerElseIncPC
; Wenn RECORD (1 -> TUNER) oder PLAY (1 -> TUNER) zurück, sonst PC1 um 2 inkrementiere und zurück 
                LR   K,P                 ; 0161 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0xc2c oder 0xd06 oder 0xd2e)
                LR   DC,H                ; 0162 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 0163 16          ; Lade Akku ab RAM 0xffc
                NI   $7                  ; 0164 21 07       ; nur erste 3 bit
                CI   $1                  ; 0166 25 01       ; rechne 0x01 - Akku
                BT   4                   ; 0168 84 09       ; Branch wenn null, war der Wert 1, Springe +9 Byte -> 0x172
                LR   DC,H                ; 016a 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 016b 16          ; Lade Akku ab RAM 0xffc
                NI   $70                 ; 016c 21 70       ; Nur bits 4,5,6
                CI   $10                 ; 016e 25 10       ; rechne 0x10 - Akku
                BF   $4                  ; 0170 94 c3       ; Branch wenn Ergebnis nicht 0, um -61 bytes -> 0x134 -> IncReturnAdrBy2AndReturn
A172:           PK                       ; 0172 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0xc2c oder 0xd06 oder 0xd2e)
                
; Subroutine WriteToSAAorAntenna
; Schreibt Daten an einen der beiden SAA1060 (Display) oder an SAA1056 oder an Antennensteuerung
; SAA1056: 17 bits -> leading zero, REFI, 10bit divider (msb zuerst), 5bit swallow counter (msb zuerst)
; SAA1060: 18 bits -> leading zero, 16 bit data (lsb zuerst), load bit (1 latch a, 0 latch b)      
; In Scratchpad 2 steht die enable Situation für Port4 (d7: DLEN2 -> Display, e7: DLEN3 -> FM Synthesizer, b7: DLEN1 -> Display, f3: DLEN5 -> Antennensteuerung)
; Schreibe 2 Scratchpad Byte auf die Data Line beginnend mit MSB und mit dem höheren Byte   
; Wenn Scratchpad 4 ausser bit 7 etwas drin, PC1 nicht sichern und am Schluss nach 0x047 springen, sonst normale Subroutine    
; Scratchpad 8 ist loop Zähler 
                LR   A,$4                ; 0173 44          ; Kopiere Scratchpad 4 in Akku
                SL   1                   ; 0174 13          ; Schiebe 1 bit nach links
                BF   $4                  ; 0175 94 02       ; Wenn nicht 0, gehe +2 -> 0x0x178
                LR   K,P                 ; 0177 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (diverse Ursprünge)
; Enable SAA
A178:           INS  1                   ; 0178 a1          ; Lade invertierten Port 1 (I/O) in Akku                                                        -> debug
                NI   $f0                 ; 0179 21 f0       ; niedere 4 bits nullen                                                                         -> debug
                OUTS 1                   ; 017b b1          ; Auf Port 1 schreiben -> niedere 4 bits (A, B, C, S) auf high level, Rest unverändert          -> debug
                LI   $f7                 ; 017c 20 f7       ; Akku = 0xf7   (b 1111 0111)
                OUT  $4                  ; 017e 27 04       ; Schreibe auf Port 4, bit 3 high, Rest low -> Disable Multiplexer Output   -> nichts enabled
                NS   $2                  ; 0180 f2          ; Akku = Akku & Scratchpad 2
                NOP                      ; 0181 2b          ; NOP   nur nicht zu schnell
                OUT  $4                  ; 0182 27 04       ; Schreibe Akku in Port 4       -> Schreibe Enable und Startbit
                LIS  $9                  ; 0184 79          ; Akku = 0x09
                LR   $8                  ; 0185 58          ; Scratchpad 8 = 0x09

A186:           DS   $8                  ; 0186 38          ; Dekrementiere Scratchpad 8
                LR   A,$8                ; 0187 48          ; Lade Akku ab Scratchpad 8
                NI   $f                  ; 0188 21 0f       ; Akku = Akku & 0x0f
                CI   $8                  ; 018a 25 08       ; Akku = 0x08 - Akku
                BF   $4                  ; 018c 94 05       ; Branch wenn nicht 0, um +5 zu 0x192   -> Scratchpad 8 war nicht 8
                LR   A,(IS)              ; 018e 4c          ; Lade Akku ab Scratchpad (ISAR vor Aufruf initialisiert)
                LR   $0                  ; 018f 50          ; Schreibe Akku () in Scratchpad 0
                BF   $0                  ; 0190 90 07       ; Branch immer zu +7 -> 0x198
                
A192:           SL   1                   ; 0192 13          ; Schiebe links um 1 (*2)
                BT   4                   ; 0193 84 0b       ; Branch wenn 0, +b bytes -> 0x19f
                LR   A,$0                ; 0195 40          ; Lade Akku ab Scratchpad 0
                SL   1                   ; 0196 13          ; Schiebe links um 1 (*2)
                LR   $0                  ; 0197 50          ; Schreibe Akku () in Scratchpad 0
; WriteData
A198:           OI   $7f                 ; 0198 22 7f       ; Akku = Akku | 0x7f            -> Alles 1 setzen ausser Data bit
                NS   $2                  ; 019a f2          ; Akku = Akku & Scratchpad 2    -> Addiere enable bits
                OUT  $4                  ; 019b 27 04       ; Schreibe Akku auf Port 4          -> Daten für SAA
                BF   $0                  ; 019d 90 e8       ; Branch immer zu -24 byte -> 0x186

A19f:           LR   A,$8                ; 019f 48          ; Lade Akku ab Scratchpad 8
                SL   1                   ; 01a0 13          ; Schiebe links um 1 (*2)
                BF   $1                  ; 01a1 91 07       ; Branch wenn bit 7 gesetzt um +7 bytes -> 0x1a9
                LI   $49                 ; 01a3 20 49       ; Akku = 0x49
                LR   $8                  ; 01a5 58          ; Scratchpad 8 = 0x49
                LR   A,(IS)-             ; 01a6 4e          ; Lade Akku ab Scratchpad aus ISAR und dekrementiere ISAR
                BF   $0                  ; 01a7 90 de       ; Branch immer um -34 bytes -> 0x186
; SkipLoadbit
A1a9:           LR   A,$2                ; 01a9 42          ; Lade Akku ab Scratchpad 2
                NI   $10                 ; 01aa 21 10       ; Akku = Akku & 0x10    (nur bit 4, DLEN3, SAA1056)
                BT   4                   ; 01ac 84 09       ; Branch wenn 0 (bit 4), +9 bytes -> 0x1b6  -> fertig, Branch wenn DLEN3 (SAA1056)
; Loadbit für SAA1060                
                LR   A,IS                ; 01ae 0a          ; Lade Akku mit ISAR
                SL   4                   ; 01af 15          ; Schiebe 4 bits nach links
                COM                      ; 01b0 18          ; Invertiere Akku
                OI   $7f                 ; 01b1 22 7f       ; Akku = Akku | 0x7f
                NS   $2                  ; 01b3 f2          ; Akku = Akku & Scratchpad 2
                OUT  $4                  ; 01b4 27 04       ; Schreibe Akku in Port 4
; finish
A1b6:           INS  1                   ; 01b6 a1          ; Lade invertierten Port 1 (I/O) in Akku            -> debug
                INC                      ; 01b7 1f          ; Inkrementiere Akku                                -> debug
                OUTS 1                   ; 01b8 b1          ; Schreibe Port 1                                   -> debug
                LI   $f7                 ; 01b9 20 f7       ; Akku = 0xf7 1111 0111              
                OUT  $4                  ; 01bb 27 04       ; Schreibe Port 4   -> enable weg, strobe
                INS  1                   ; 01bd a1          ; Lade invertierten Port 1 (I/O) in Akku            -> debug
                INC                      ; 01be 1f          ; Inkrementiere Akku                                -> debug
                OUTS 1                   ; 01bf b1          ; Schreibe Port 1                                   -> debug
                LI   $f7                 ; 01c0 20 f7       ; Akku = 0xf7
                OUT  $4                  ; 01c2 27 04       ; Schreibe Port 4 -> enable weg, strobe       
                LIS  $c                  ; 01c4 7c          ; Akku = 0x0c
                LR   $8                  ; 01c5 58          ; Scratchpad 8 = 0x0c
                LISL 1                   ; 01c6 69          ; Fülle unteres ISAR mit x1
                LR   A,$4                ; 01c7 44          ; Kopiere Scratchpad 4 in Akku
                SL   1                   ; 01c8 13          ; Schiebe links um 1 bit
                BF   $4                  ; 01c9 94 02       ; Branch wenn nicht 0 um +2, also 0x1cc
                PK                       ; 01cb 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (diverse Ursprünge)

A1cc:           JMP  $4047               ; 01cc 29 40 47    ; Springe zu 0x047

; Subroutine
; if (Sratchpad 56 == 0x10)
; { Scratchpad 41 = 0xf7}
; else if (Sratchpad 56 == 0x09)
; { Scratchpad 41 = 0xbe}
; else
; { Scratchpad 41 = 0xfe}
A1cf:           LR   K,P                 ; 01cf 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x3b9 oder 0x80f)
                LISU 5                   ; 01d0 65          ; Fülle oberes ISAR mit 5x
                LISL 6                   ; 01d1 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 01d2 4c          ; Lade Akku ab Scratchpad 56
                LISU 4                   ; 01d3 64          ; Fülle oberes ISAR mit 4x
                LISL 1                   ; 01d4 69          ; Fülle unteres ISAR mit x1
                CI   $10                 ; 01d5 25 10       ; rechne 0x10 - Akku
                BF   $4                  ; 01d7 94 05       ; Branch wenn nicht null (war nicht 0x10) um +5 nach 0x1dd
                LI   $f7                 ; 01d9 20 f7       ; Akku = 0xf7
                BF   $0                  ; 01db 90 0b       ; Branch immer um +b nach 0x1e7

A1dd:           CI   $9                  ; 01dd 25 09       ; rechne 0x09 - Akku
                BF   $4                  ; 01df 94 05       ; Branch wenn nicht null (war nicht 0x09) um +5 nach 0x1e5
                LI   $be                 ; 01e1 20 be       ; Akku = 0xbe
                BF   $0                  ; 01e3 90 03       ; Branch immer um +3 nach 0x1e7

A1e5:           LI   $fe                 ; 01e5 20 fe       ; Akku = 0xfe

A1e7:           LR   (IS),A              ; 01e7 5c          ; Speichere Akku in Scratchpad 41 (Schratchpad 56 = 0x10 -> Scratchpad 41 = 0xf7; 56 = 0x09 -> 41 = 0xbe, sonst 41 = 0xfe)
; Hier ist Scratchpad 41 gesetzt anhand Zustand von Scratchpad 56
                LISU 5                   ; 01e8 65          ; Fülle oberes ISAR mit 5x
                LISL 5                   ; 01e9 6d          ; Fülle unteres ISAR mit x5
                LR   A,(IS)              ; 01ea 4c          ; Lade Akku ab Scratchpad 55
                NI   $f                  ; 01eb 21 0f       ; nur niedere 4 bits
                DCI  $4a99               ; 01ed 2a 4a 99    ; Schreibe 0x4a99 in DC0
                ADC                      ; 01f0 8e          ; Addiere Akku zu DC0
                LISU 4                   ; 01f1 64          ; Fülle oberes ISAR mit 4x
                LISL 0                   ; 01f2 68          ; Fülle unteres ISAR mit x0
                LM                       ; 01f3 16          ; Lade Akku ab DC0 Inhalt
                LR   (IS),A              ; 01f4 5c          ; Speichere Akku in Scratchpad 40
                LISU 5                   ; 01f5 65          ; Fülle oberes ISAR mit 5x
                LISL 5                   ; 01f6 6d          ; Fülle unteres ISAR mit x5
                LR   A,(IS)              ; 01f7 4c          ; Lade Akku ab Scratchpad 55
                SR   4                   ; 01f8 14          ; Schiebe 4 rechts
                DCI  $4a8f               ; 01f9 2a 4a 8f    ; Schreibe 0x4a8f in DC0
                ADC                      ; 01fc 8e          ; Addiere Akku zu DC0
                LISL 1                   ; 01fd 69          ; Fülle unteres ISAR mit x1
                LM                       ; 01fe 16          ; Lade Akku ab DC0 Inhalt
                LR   (IS),A              ; 01ff 5c          ; Speichere Akku in Scratchpad 51
                LISL 4                   ; 0200 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0201 4c          ; Lade Akku ab Scratchpad 54
                SR   4                   ; 0202 14          ; Schiebe 4 rechts
                DCI  $4aa3               ; 0203 2a 4a a3    ; Schreibe 0x4aa3 in DC0
                ADC                      ; 0206 8e          ; Addiere Akku zu DC0
                LISL 0                   ; 0207 68          ; Fülle unteres ISAR mit x0
                LM                       ; 0208 16          ; Lade Akku ab DC0 Inhalt
                LR   (IS)+,A             ; 0209 5d          ; Speichere Akku in Scratchpad 50 (Inc ISAR)
                LIS  $0                  ; 020a 70          ; Akku = 0
                LR   $4                  ; 020b 54          ; Scratchpad 4 = 0
                LI   $b7                 ; 020c 20 b7       ; Akku = 0xb7
                LR   $2                  ; 020e 52          ; Schreibe Akku (0xb7) in Scratchpad 2
                PK                       ; 020f 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0x3b9 oder 0x80f)
                
; Subroutine ChangeTuningMode
                LR   K,P                 ; 0210 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x6ad oder 0x872 oder 0x91c)
                LISU 2                   ; 0211 62          ; Fülle oberes ISAR mit 2x
                LISL 1                   ; 0212 69          ; Fülle unteres ISAR mit x1
                LR   A,(IS)              ; 0213 4c          ; Lade Akku ab Scratchpad 21
                SL   1                   ; 0214 13          ; Schiebe 1 links
                BT   1                   ; 0215 81 34       ; Branch wenn positiv (bit 7 = 0), CHTM = 0 (Taste gedrückt), um +34 nach 0x24a
                ; Taste nicht gedrückt
                LR   A,$6                ; 0217 46          ; Lade Akku ab Scratchpad 6
                SL   4                   ; 0218 15          ; Schiebe 4 links
                BF   $1                  ; 0219 91 34       ; Branch wenn negativ (bit 7 = 1), Schratchpad 6, bit 3 war 1, um +34 nach 0x24e
; Setze bit 3 in Scratchpad 6
                LR   A,$6                ; 021b 46          ; Lade Akku ab Scratchpad 6
                OI   $8                  ; 021c 22 08       ; Setze bit 3
                LR   $6                  ; 021e 56          ; Speichere Akku in Scratchpad 6
                LR   A,$5                ; 021f 45          ; Lade Akku ab Scratchpad 5
                SL   1                   ; 0220 13          ; Schiebe 1 links
                BF   $1                  ; 0221 91 16       ; Branch wenn negativ (bit 7 = 1, also bit 6 in Scratchpad 5) um +16 nach 0x238
                LR   A,$5                ; 0223 45          ; Lade Akku ab Scratchpad 5
                OI   $40                 ; 0224 22 40       ; Setze bit 6
                LR   $5                  ; 0226 55          ; Scratchpad 5 = Akku
                PI   $45cd               ; 0227 28 45 cd    ; PC1 = 0x22a, Call Subroutine 0x5cd
                LR   A,$6                ; 022a 46          ; Lade Akku ab Scratchpad 6
                NI   $10                 ; 022b 21 10       ; Lösche alles ausser bit 4
                BF   $4                  ; 022d 94 07       ; Branch wenn nicht null, also bit 4 gesetzt war um +7 nach 0x235
                PI   $458b               ; 022f 28 45 8b    ; PC1 = 0x232, Call Subroutine 0x58b
                JMP  $4df5               ; 0232 29 4d f5
A235:           JMP  $48bc               ; 0235 29 48 bc
A238:           DI                       ; 0238 1a          ; Disable Interrupt
                LIS  $0                  ; 0239 70          ; Akku = 0
                OUT  $6                  ; 023a 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                LR   A,$5                ; 023c 45
                NI   $bb                 ; 023d 21 bb
                LR   $5                  ; 023f 55
                SR   1                   ; 0240 12
                SL   1                   ; 0241 13
                BT   1                   ; 0242 81 04
                JMP  $4679               ; 0244 29 46 79
A247:           JMP  $4266               ; 0247 29 42 66
; Lösche bit 3 in Scratchpad 6
A24a:           LR   A,$6                ; 024a 46          ; Lade Akku ab Scratchpad 6
                NI   $f7                 ; 024b 21 f7       ; Lösche bit 3
                LR   $6                  ; 024d 56          ; Speichere Akku in Scratchpad 6
A24e:           PK                       ; 024e 0c

; Initialisiert Scratchpad Bytes mit 0
; (in ISAR steht 73) Scratchpad 10 und 11 enthalten 0xffc
; LR mit c: ISAR sagt Scratchpad, d: ISAR sagt Scratchpad, wird danach inkrementiert, e: ISAR sagt Scratchpad, wird danach dekrementiert
; Initialisiere Scratchpad 73, 72, 63, 62, 53, 52, 44, 43, 42, 46 mit 0; Scratchpad 47 mit 0xff
A24f:           LIS  $0                  ; 024f 70          ; Akku = 0
                LR   (IS)-,A             ; 0250 5e          ; Scratchpad O73 = 0
                LR   (IS),A              ; 0251 5c          ; Scratchpad O72 = 0
                LISU 6                   ; 0252 66          ; Fülle oberes ISAR mit 6x
                LR   (IS)+,A             ; 0253 5d          ; Scratchpad O62 = 0
                LR   (IS),A              ; 0254 5c          ; Scratchpad O63 = 0
                LISU 5                   ; 0255 65          ; Fülle oberes ISAR mit 5x
                LR   (IS)-,A             ; 0256 5e          ; Scratchpad O53 = 0
                LR   (IS),A              ; 0257 5c          ; Scratchpad O52 = 0
                LISU 4                   ; 0258 64          ; Fülle oberes ISAR mit 4x
                LR   (IS)+,A             ; 0259 5d          ; Scratchpad O42 = 0
                LR   (IS)+,A             ; 025a 5d          ; Scratchpad O43 = 0
                LR   (IS),A              ; 025b 5c          ; Scratchpad O44 = 0
                LISL 6                   ; 025c 6e          ; Fülle unteres ISAR mit x6
                LR   (IS)+,A             ; 025d 5d          ; Scratchpad O46 = 0
                COM                      ; 025e 18          ; Lade Akku mit dessen Zweierkomplement
                LR   (IS),A              ; 025f 5c          ; Scratchpad 047 = 0xFF
                
; Initialisiere NF Anwahl
                PI   $44f4               ; 0260 28 44 f4    ; PC1 = 0x263, Call Subroutine 0x4f4 -> InitNF5to8(PLAY)
                PI   $4538               ; 0263 28 45 38    ; PC1 = 0x266, Call Subroutine 0x538 -> InitNF1to4(RECORD)
                
; Lade Wert an 0xffd und prüfe auf obere 4 bits auf 1..9, falls ja, bekommt Scratchpad 3 den Wert, sonst Scratchpad 3 = 1
                DCI  Affd                ; 0266 2a 0f fd    ; Lade DC0 mit 0xffd (RAM)
                LM                       ; 0269 16          ; Lade Akku ab RAM 0xffd
                SR   4                   ; 026a 14          ; Schiebe rechts um 4 bit
                BT   4                   ; 026b 84 06       ; Branch wenn Wert im Akku 0 um +6 Bytes, also 0x0272
                LR   $3                  ; 026d 53          ; Lade Scratchpad 3 mit Akku
                AI   $f6                 ; 026e 24 f6       ; Addiere 0xF6
                BF   $2                  ; 0270 92 03       ; Branch wenn kein Überlauf, also wenn Wert <=9 -> +3 bytes -> 0x274
; Wenn 0xffd obere 4 bits 0
A272:           LIS  $1                  ; 0272 71          ; Akku = 0x01
                LR   $3                  ; 0273 53          ; Lade Scratchpad 3 mit Akku

; Wert Scratchpad 3 zwischen 1 und 9, initialisiert auf 1 wenn etwas anderes im RAM an 0xffd war
A274:           PI   $4295               ; 0274 28 42 95    ; PC1 = 0x277, Call Subroutine 0x295
; Scratchpad 2 = 0xb7, ISAR O51, Initialisiert Display
                PI   $4173               ; 0277 28 41 73    ; PC1 = 0x27a, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                LISU 4                   ; 027a 64          ; Fülle oberes ISAR mit 4x
; Scratchpad 2 = 0xb7, ISAR O41, Initialisiert Display
                PI   $4173               ; 027b 28 41 73    ; PC1 = 0x27e, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                PI   $45cd               ; 027e 28 45 cd    ; PC1 = 0x281, Call Subroutine 0x5cd
                LR   A,$6                ; 0281 46          ; Lade Akku ab Scratchpad 6
                NI   $10                 ; 0282 21 10       ; nur bit 4
                BT   4                   ; 0284 84 04       ; Branch wenn null (bit4) um +4 nach 0x289
                PI   $458b               ; 0286 28 45 8b    ; PC1 = 0x289, Call Subroutine 0x58b
A289:           LISU 4                   ; 0289 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 028a 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 028b 4c          ; Lade Akku ab Scratchpad 47
                SL   1                   ; 028c 13          ; Schiebe 1 links
                BF   $1                  ; 028d 91 04       ; Branch wenn negativ (bit 6 von Scratchpad 47 = 1) um +4 nach 0x292
                JMP  $4aad               ; 028f 29 4a ad
A292:           JMP  $4e1e               ; 0292 29 4e 1e    -> HandleProtection
                
; Subroutine
; Scratchpad 3 hat einen Wert zwischen 1..9
; 0xffc enthält RECORD und PLAY Anwahl
                LR   K,P                 ; 0295 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x277)
                LR   DC,H                ; 0296 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält noch immer 0xffc
                LM                       ; 0297 16          ; Lade Akku ab RAM 0xffc
                SR   1                   ; 0298 12          ; Schiebe rechts um 1
                SL   1                   ; 0299 13          ; Schiebe links um 1    -> bit 0 gelöscht
                BT   1                   ; 029a 81 06       ; Branch wenn Wert positiv (höchstes Bit 0) um +6 bytes -> 0x2A1
; wenn höchstes bit in 0xffc 1                
                DCI  Afd8                ; 029c 2a 0f d8    ; Lade DC0 mit 0xfd8 (RAM)
                BF   $0                  ; 029f 90 0a       ; Branch +10 bytes - 0x2aa
; wenn höchstes bit in 0xffc 0
A2a1:           DCI  $fbd                ; 02a1 2a 0f bd    ; Lade DC0 mit 0xfbd (ROM, enthält 0x07)
                BF   $0                  ; 02a4 90 05       ; Branch +5 bytes -> 0x2aa

; Subroutine
                LR   K,P                 ; 02a6 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x67e)
                DCI  Aff6                ; 02a7 2a 0f f6    ; Lade DC0 mit 0xff6 (RAM)

A2aa:           LISU 5                   ; 02aa 65          ; Fülle oberes ISAR mit 5x
                LISL 4                   ; 02ab 6c          ; Fülle unteres ISAR mit x4
                LR   A,$3                ; 02ac 43          ; Lade Akku mit Scratchpad 3, dort steht ein Wert zwischen 1 und 9 drin mit Ursprung von 0xffd
                SL   1                   ; 02ad 13          ; Wert verdoppeln
                AS   $3                  ; 02ae c3          ; Addiere Scratchpad 3 zu Akku  -> schliesslich *3, also Wert zwischen 3 und 27
                ADC                      ; 02af 8e          ; Addiere Akku zu DC0
                LM                       ; 02b0 16          ; Befülle Akku mit Wert an DC0 (inc DC0)
                LR   (IS)+,A             ; 02b1 5d          ; Schreibe Wert in Scratchpad 54 (inc Scratchpad)
                LM                       ; 02b2 16          ; Befülle Akku mit Wert an DC0 (inc DC0)
                LR   (IS)+,A             ; 02b3 5d          ; Schreibe Wert in Scratchpad 55 (inc Scratchpad)
                LM                       ; 02b4 16          ; Befülle Akku mit Wert an DC0 (inc DC0)
                LR   (IS)+,A             ; 02b5 5d          ; Schreibe Wert in Scratchpad 56 (inc Scratchpad)
                NI   $70                 ; 02b6 21 70       ; Akku nur noch bits 4,5,6
                LR   (IS)-,A             ; 02b8 5e          ; Schreibe Wert in Scratchpad 57 (dec Scratchpad)
                LR   A,(IS)              ; 02b9 4c          ; Lade Akku ab Scratchpad 56
                NI   $f                  ; 02ba 21 0f       ; lösche obere 4 bits
                LR   (IS),A              ; 02bc 5c          ; Schreibe Wert in Scratchpad 56
                BF   $4                  ; 02bd 94 08       ; Branch wenn nicht 0 im Akku +8 bytes (0x2c6)
                LI   $10                 ; 02bf 20 10       ; Akku = 0x10
                LR   (IS),A              ; 02c1 5c          ; Schreibe Wert in Scratchpad 56
                LI   $f7                 ; 02c2 20 f7       ; Akku = 0xef7
                BF   $0                  ; 02c4 90 0f       ; Branch immer nach 0x2d4
; gültiger Wert (>0)
A2c6:           CI   $8                  ; 02c6 25 08       ; rechne 0x08 - Akku
                BF   $4                  ; 02c8 94 05       ; Wenn Wert nicht 0x08 war, Branch +5Bytes nach 0x2ce
                LI   $fe                 ; 02ca 20 fe       ; Akku = 0xfe
                BF   $0                  ; 02cc 90 07       ; Branch immer nach 0x2d4
; Wert war nicht 0x08
A2ce:           CI   $9                  ; 02ce 25 09       ; rechne 0x09 - Akku
                BF   $4                  ; 02d0 94 77       ; Wenn Wert nicht 0x09 war, Branch +77Bytes nach 0x348
                LI   $be                 ; 02d2 20 be       ; Akku = 0xbe
; Wert war 0, wurde mit 0x10 initialisiert, Akku hat jetzt 0xF7
; oder Wert war 0x08, Akku hat jetzt 0xfe
; oder Wert war 0x09, Akku hat jetzt 0xbe
A2d4:           LISU 4                   ; 02d4 64          ; Fülle oberes ISAR mit 4x
                LISL 1                   ; 02d5 69          ; Fülle unteres ISAR mit x1
                LR   (IS),A              ; 02d6 5c          ; Schreibe Akku Wert in Scratchpad 41
                LISU 5                   ; 02d7 65          ; Fülle oberes ISAR mit 5x
                LISL 5                   ; 02d8 6d          ; Fülle unteres ISAR mit x5
                LR   A,(IS)              ; 02d9 4c          ; Lade Akku mit Inhalt von Scratchpad 55
                SR   4                   ; 02da 14          ; Schiebe rechts um 4 bit
                DCI  $4a8f               ; 02db 2a 4a 8f    ; Setze DC0 auf 0x4a8f
                ADC                      ; 02de 8e          ; Addiere Akku zu DC0
                AI   $f6                 ; 02df 24 f6       ; Addiere zu Akku 0xf6
                BT   2                   ; 02e1 82 66       ; Branch on carry (Überlauf), Wert war >9, +0x66bytes, also 0x348
                LM                       ; 02e3 16          ; Lade Wert an DC0 in Akku (inc DC0)
                LISL 1                   ; 02e4 69          ; Fülle unteres ISAR mit x1
                LR   (IS),A              ; 02e5 5c          ; Schreibe Akku Wert in Scratchpad 51
                LISL 6                   ; 02e6 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)-             ; 02e7 4e          ; Lade Akku ab Scratchpad 56, Dec ISAR
                SL   4                   ; 02e8 15          ; Schiebe Akku 4 bit nach links
                BT   4                   ; 02e9 84 0d       ; Branch wenn 0, +d bytes, also 0x2f7
                CI   $80                 ; 02eb 25 80       ; rechne 0x80 - Akku
                BF   $4                  ; 02ed 94 0f       ; Wenn Wert nicht 0x80 war, Branch +f Bytes nach 0x2fd
                LR   A,(IS)              ; 02ef 4c          ; Lade Akku ab Scratchpad 55
                SR   4                   ; 02f0 14          ; Schiebe 4 bits nach rechts
                AI   $f9                 ; 02f1 24 f9       ; Addiere 0xf9
                BT   2                   ; 02f3 82 09       ; Branch wenn Überlauf, also Wert >6, springe +9 nach 0x2fd
                BF   $0                  ; 02f5 90 52       ; Immer weiter +0x52 -> 0x348

A2f7:           LR   A,(IS)              ; 02f7 4c          ; Lade Akku ab Scratchpad 55
                SR   4                   ; 02f8 14          ; Schiebe 4 bits nach rechts
                AI   $f8                 ; 02f9 24 f8       ; Addiere 0xf8
                BT   2                   ; 02fb 82 4c       ; Branch wenn Überlauf, also Wert >7, springe +0x4c nach 0x348

A2fd:           LR   A,(IS)              ; 02fd 4c          ; Lade Akku ab Scratchpad 55
                NI   $f                  ; 02fe 21 0f       ; nur niedere 4 bit
                DCI  $4a99               ; 0300 2a 4a 99    ; Schreibe 0x4a99 in DC0
                ADC                      ; 0303 8e          ; Addiere Akku zu DC0
                AI   $f6                 ; 0304 24 f6       ; Addiere 0xf6
                BT   2                   ; 0306 82 41       ; Branch wenn Überlauf, also Wert >9, springe +0x41 nach 0x348
                LM                       ; 0308 16          ; Lade Wert an DC0 in Akku (inc DC0)
                LISU 4                   ; 0309 64          ; Fülle oberes ISAR mit 4x
                LISL 0                   ; 030a 68          ; Fülle unteres ISAR mit x0
                LR   (IS),A              ; 030b 5c          ; Schreibe Akku in Scratchpad 40
                LISU 5                   ; 030c 65          ; Fülle oberes ISAR mit 5x
                LISL 6                   ; 030d 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)-             ; 030e 4e          ; Lade Akku ab Scratchpad 56, dec ISAR
                SL   4                   ; 030f 15          ; Schiebe links um 4 bit
                CI   $80                 ; 0310 25 80       ; rechne 0x80 - Akku
                BF   $4                  ; 0312 94 0d       ; Wenn Wert nicht 0x80 war, Branch +d Bytes nach 0x320
                
                LR   A,(IS)              ; 0314 4c          ; Lade Akku ab Scratchpad 55
                SR   4                   ; 0315 14          ; Schiebe rechts um 4 bit
                CI   $7                  ; 0316 25 07       ; rechne 0x07 - Akku
                BF   $4                  ; 0318 94 07       ; Wenn Wert nicht 0x07 war, Branch +7 Bytes nach 0x320
                
                LR   A,(IS)              ; 031a 4c          ; Lade Akku ab Scratchpad 55
                SL   4                   ; 031b 15          ; Schiebe links um 4 bit
                AI   $b0                 ; 031c 24 b0       ; Addiere 0xb0
                BF   $2                  ; 031e 92 29       ; Branch wenn kein Überlauf, also Wert <= 0x4F, +0x29 -> 0x348

A320:           LISL 4                   ; 0320 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0321 4c          ; Lade Akku ab Scratchpad 54
                SR   4                   ; 0322 14          ; Schiebe rechts um 4 bit
                DCI  $4aa3               ; 0323 2a 4a a3    ; Schreibe 0x4aa3 in DC0
                ADC                      ; 0326 8e          ; Addiere Akku zu DC0
                AI   $f6                 ; 0327 24 f6       ; Addiere 0xf6 zu Akku
                BT   2                   ; 0329 82 1e       ; Branch wenn Überlauf, also Wert >9, springe +0x1e nach 0x348
                
                LR   A,(IS)              ; 032b 4c          ; Lade Akku ab Scratchpad 54
                SL   1                   ; 032c 13          ; Schiebe links um 1 bit                            ; Macht keinen Sinn
                SL   1                   ; 032d 13          ; Schiebe links um 1 bit                            ; Macht keinen Sinn
                LR   A,(IS)              ; 032e 4c          ; Lade Akku ab Scratchpad 54                  ; Macht keinen Sinn
                BF   $1                  ; 032f 91 05       ; Branch wenn bit 7 gesetzt + 5 byte -> 0x335
                
                NI   $f0                 ; 0331 21 f0       ; niedere 4 bit nullen
                BF   $0                  ; 0333 90 05       ; Immer weiter +0x05 -> 0x339

A335:           NI   $f0                 ; 0335 21 f0       ; niedere 4 bit nullen
                AI   $5                  ; 0337 24 05       ; Addiere 0x05 zu Akku

A339:           LR   (IS),A              ; 0339 5c          ; Speichere Akku in Scratchpad 54
                LM                       ; 033a 16          ; Lade Wert an DC0 in Akku (inc DC0)
                CI   $0                  ; 033b 25 00       ; rechne 0x00 - Akku
                BT   4                   ; 033d 84 0a       ; Wenn Wert 0 war, +0x0a bytes -> 0x348
                LISL 0                   ; 033f 68          ; Fülle unteres ISAR mit x0
                LR   (IS)+,A             ; 0340 5d          ; Speichere Akku in Scratchpad 50, inc ISAR
                LR   A,$6                ; 0341 46          ; Lade Akku ab Scratchpad 6
                NI   $ef                 ; 0342 21 ef       ; Lösche bit 4
                LR   $6                  ; 0344 56          ; Speichere Akku in Scratchpad 6
                LIS  $0                  ; 0345 70          ; Akku = 0
                BF   $0                  ; 0346 90 0d       ; Branch nach +d bytes -> 0x354

A348:           LR   A,$6                ; 0348 46          ; Lade Akku ab Scratchpad 6
                OI   $10                 ; 0349 22 10       ; Setze bit 4
                LR   $6                  ; 034b 56          ; Speichere Akku in Scratchpad 6
                LISU 4                   ; 034c 64          ; Fülle oberes ISAR mit 4x
                LISL 1                   ; 034d 69          ; Fülle unteres ISAR mit x1
                LIS  $0                  ; 034e 70          ; Akku = 0
                LR   (IS)-,A             ; 034f 5e          ; Schreibe Akku in Scratchpad 41 (0), dec ISAR
                LR   (IS),A              ; 0350 5c          ; Schreibe Akku in Scratchpad 40 (0)
                LISU 5                   ; 0351 65          ; Fülle oberes ISAR mit 5x
                LR   (IS)+,A             ; 0352 5d          ; Schreibe Akku in Scratchpad 50 (0), inc ISAR
                LR   (IS),A              ; 0353 5c          ; Schreibe Akku in Scratchpad 51 (0)

A354:           LR   $4                  ; 0354 54          ; Speichere Akku in Scratchpad 4
                LI   $b7                 ; 0355 20 b7       ; Akku = 0xb7
                LR   $2                  ; 0357 52          ; Schreibe Akku (0xb7) in Scratchpad 2
                PK                       ; 0358 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0x277)
                
; Jump hierher von 0x69e und 0x840
                DI                       ; 0359 1a          ; Disable Interrupt
                LIS  $0                  ; 035a 70          ; Akku = 0
                OUT  $6                  ; 035b 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                LISU 4                   ; 035d 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 035e 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 035f 4c          ; Lade Akku ab Scratchpad 44
                OI   $8                  ; 0360 22 08
                LR   (IS),A              ; 0362 5c
                PI   $4ed2               ; 0363 28 4e d2    ; PC1 = 0x336, Call Subroutine 0xed2
                LI   $38                 ; 0366 20 38       ; Akku = 0x38
                LR   $7                  ; 0368 57          ; Scratchpad 7 = 0x38
                LR   A,$5                ; 0369 45
                SL   1                   ; 036a 13
                BF   $1                  ; 036b 91 3a       ; Branch wenn negativ (bit 7 = 1) um +3a nach 0x3a6
A36d:           LR   A,$5                ; 036d 45
                OI   $2                  ; 036e 22 02
                LR   $5                  ; 0370 55
; Setze bit 4 in Scratchpad 6
                LR   A,$6                ; 0371 46          ; Lade Scratchpad 6 in Akku
                OI   $10                 ; 0372 22 10       ; Setze bit 4
                LR   $6                  ; 0374 56          ; Speichere Akku in Scratchpad 6
                JMP  $4aad               ; 0375 29 4a ad
; Lösche bit 4 in Scratchpad 6
                LR   A,$6                ; 0378 46          ; Lade Scratchpad 6 in Akku
                NI   $ef                 ; 0379 21 ef       ; Lösche bit 4
                LR   $6                  ; 037b 56          ; Speichere Akku in Scratchpad 6
                LR   A,$5                ; 037c 45
                NI   $fd                 ; 037d 21 fd
                LR   $5                  ; 037f 55
                BF   $0                  ; 0380 90 03
A382:           LIS  $3                  ; 0382 73          ; Akku = 0x03
                LR   $7                  ; 0383 57          ; Scratchpad 7 = 0x03
A384:           LIS  $8                  ; 0384 78          ; Akku = 0x08
                LR   $1                  ; 0385 51          ; Schreibe Akku (0x08) in Scratchpad 1
                PI   $40d2               ; 0386 28 40 d2    ; PC1 = 0x389, Call Subroutine 0x0d2 -> LoadInputs
                PI   $45a5               ; 0389 28 45 a5    ; PC1 = 0x38c, Call Subroutine 0x5a5 -> Delay10ms
                LIS  $1                  ; 038c 71          ; Akku = 0x01
                LISU 2                   ; 038d 62          ; Fülle oberes ISAR mit 2x
                NS   $5                  ; 038e f5          ; Akku &= Scratchpad 5
                BF   $4                  ; 038f 94 04       ; Branch wenn nicht null (bit 0 in Scratchpad 5) um +4 nach 0x394
                LISL 3                   ; 0391 6b          ; Fülle unteres ISAR mit x3
                BF   $0                  ; 0392 90 02       ; Branch immer um +2 nach 0x395
A394:           LISL 4                   ; 0394 6c          ; Fülle unteres ISAR mit x4
A395:           LR   A,(IS)              ; 0395 4c          ; Lade Akku ab Scratchpad 23 oder 24, 
                SL   1                   ; 0396 13          ; Schiebe 1 links (Signal DOWN oder UP)
                BF   $1                  ; 0397 91 0b       ; Branch wenn negativ (bit 7 = 1) um +b nach 0x3a3
                LR   A,$5                ; 0399 45
                SL   1                   ; 039a 13
                BF   $1                  ; 039b 91 04       ; Branch wenn negativ (bit 7 = 1) um +4 nach 0x3a0
                JMP  $4715               ; 039d 29 47 15
A3a0:           JMP  $4aad               ; 03a0 29 4a ad
A3a3:           DS   $7                  ; 03a3 37          ; Decrementiere Scratchpad 7
                BF   $4                  ; 03a4 94 df
A3a6:           LIS  $1                  ; 03a6 71          ; Akku = 0x01
                NS   $5                  ; 03a7 f5
                BF   $4                  ; 03a8 94 08
                PI   $43f7               ; 03aa 28 43 f7    ; PC1 = 0x3ad, Call Subroutine 0x3f7 
                NOP                      ; 03ad 2b          ; NOP
                NOP                      ; 03ae 2b          ; NOP
                BF   $0                  ; 03af 90 06
A3b1:           PI   $43c6               ; 03b1 28 43 c6    ; PC1 = 0x3b4, Call Subroutine 0x3c6
                NOP                      ; 03b4 2b          ; NOP
                NOP                      ; 03b5 2b          ; NOP
A3b6:           PI   $41cf               ; 03b6 28 41 cf    ; PC1 = 0x3b9, Call Subroutine 0x1cf 
                PI   $4173               ; 03b9 28 41 73    ; PC1 = 0x3bc, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LISU 4                   ; 03bc 64          ; Fülle oberes ISAR mit 4x
                PI   $4173               ; 03bd 28 41 73    ; PC1 = 0x3c0, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LR   A,$7                ; 03c0 47          ; Lade Akku ab Scratchpad 7
                SL   1                   ; 03c1 13
                BT   4                   ; 03c2 84 bf
                BF   $0                  ; 03c4 90 a8
                
; Subroutine
                LR   K,P                 ; 03c6 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0xfb6 / 0x7b6 / 0x78b / 0x72f / 0x3b4)
                LISL 6                   ; 03c7 6e          ; Fülle unteres ISAR mit x6
                LISU 7                   ; 03c8 67          ; Fülle oberes ISAR mit 7x
                LI   $10                 ; 03c9 20 10       ; Akku = 0x10
                LR   (IS)-,A             ; 03cb 5e          ; Scratchpad 76 = 0x10 (Dec ISAR)
                LI   $79                 ; 03cc 20 79       ; Akku = 0x79
                LR   (IS)-,A             ; 03ce 5e          ; Scratchpad 75 = 0x79 (Dec ISAR)
                LI   $75                 ; 03cf 20 75       ; Akku = 0x75
                LR   (IS),A              ; 03d1 5c          ; Scratchpad 74 = 0x75
A3d2:           LISU 5                   ; 03d2 65          ; Fülle oberes ISAR mit 5x
                BR7  A3de                ; 03d3 8f 0a       ; Branch wenn unteres ISAR <7 um +a nach 0x3de
                LISL 4                   ; 03d5 6c          ; Fülle unteres ISAR mit x4
                LIS  $0                  ; 03d6 70          ; Akku = 0
                LR   (IS)+,A             ; 03d7 5d          ; Scratchpad xx = 0, inc ISAR
                LI   $75                 ; 03d8 20 75       ; Akku = 0x75
                LR   (IS)+,A             ; 03da 5d          ; Scratchpad xx = 0x75, inc ISAR
                LIS  $8                  ; 03db 78          ; Akku = 0x08
                LR   (IS),A              ; 03dc 5c          ; Scratchpad xx = 0x08
                PK                       ; 03dd 0c          ; PC1 = PC0, return

A3de:           LR   A,(IS)              ; 03de 4c          ; Lade Akku ab Scratchpad 54
                LISU 7                   ; 03df 67          ; Fülle oberes ISAR mit 7x
                XS   (IS)+               ; 03e0 ed          ; Akku = Akku XOR Scratchpad 74, inc ISAR
                BT   4                   ; 03e1 84 f0       ; Branch wenn null um -16 bytes nach 0x3d2
                LISU 5                   ; 03e3 65          ; Fülle oberes ISAR mit 5x
                LISL 4                   ; 03e4 6c          ; Fülle unteres ISAR mit x4
                LI   $8b                 ; 03e5 20 8b       ; Akku = 0x8b
                ASD  (IS)                ; 03e7 dc          ; Akku += Scratchpad 54
                BF   $2                  ; 03e8 92 0a       ; Branch wenn kein Überlauf um +a nach 0x3f3
                LR   (IS)+,A             ; 03ea 5d          ; Speichere Akku in Scratchpad 54, inc ISAR
A3eb:           LI   $67                 ; 03eb 20 67       ; Akku = 0x67
                ASD  (IS)                ; 03ed dc          ; Akku += Scratchpad 54
                BF   $2                  ; 03ee 92 04       ; Branch wenn kein Überlauf um +4 nach 0x3f3
                LR   (IS)+,A             ; 03f0 5d          ; Speichere Akku in Scratchpad 54, inc ISAR
                BF   $0                  ; 03f1 90 f9       ; Branch immer um -7 nach 0x3eb

A3f3:           LR   (IS),A              ; 03f3 5c          ; Speichere Akku in Scratchpad ??
                JMP  $4134               ; 03f4 29 41 34 -> IncReturnAdrBy2AndReturn

; Subroutine
                LR   K,P                 ; 03f7 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0xfaf / 0x7af / 0x784 / 0x728 / 0x3ad)
                LISL 6                   ; 03f8 6e          ; Fülle unteres ISAR mit x6
                LISU 7                   ; 03f9 67          ; Fülle oberes ISAR mit 7x
                LIS  $8                  ; 03fa 78          ; Akku = 0x08
                LR   (IS)-,A             ; 03fb 5e          ; Scratchpad 76 = 0x08 (Dec ISAR)
                LI   $75                 ; 03fc 20 75       ; Akku = 0x75
                LR   (IS)-,A             ; 03fe 5e          ; Scratchpad 75 = 0x75 (Dec ISAR)
                LIS  $0                  ; 03ff 70          ; Akku = 0
                LR   (IS),A              ; 0400 5c          ; Scratchpad 74 = 0x00

A401:           LISU 5                   ; 0401 65          ; Fülle oberes ISAR mit 5x
                BR7  A417                ; 0402 8f 14       ; Branch wenn unteres ISAR <7 um +0x14 nach 0x417
                LR   A,$5                ; 0404 45          ; Lade Akku ab Scratchpad 5
                SL   1                   ; 0405 13          ; Schiebe 1 links (*2)
                LISL 4                   ; 0406 6c          ; Fülle unteres ISAR mit x4
                BF   $1                  ; 0407 91 05       ; Branch wenn negativ (bit 7 = 1) um +5 nach 0x40d
                LI   $50                 ; 0409 20 50       ; Akku = 0x50
                BF   $0                  ; 040b 90 03       ; Branch immer um +3 nach 0x40f
A40d:           LI   $75                 ; 040d 20 75       ; Akku = 0x75
A40f:           LR   (IS)+,A             ; 040f 5d          ; Speichere Akku in Scratchpad 54, inc ISAR
                LI   $79                 ; 0410 20 79       ; Akku = 0x79
                LR   (IS)+,A             ; 0412 5d          ; Speichere Akku in Scratchpad 54, inc ISAR
                LI   $10                 ; 0413 20 10       ; Akku = 0x10
                LR   (IS),A              ; 0415 5c          ; Speichere Akku in Scratchpad 54
                PK                       ; 0416 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0xfaf / 0x7af / 0x784 / 0x728 / 0x3ad)


A417:           LR   A,(IS)              ; 0417 4c          ; Lade Akku mit Scratchpad ??
                LISU 7                   ; 0418 67          ; Fülle oberes ISAR mit 7x
                XS   (IS)+               ; 0419 ed          ; XOR mit Akku, Inc ISAR
                BT   4                   ; 041a 84 e6       ; Branch wenn null um -26 bytes nach 0x401
                LISU 5                   ; 041c 65          ; Fülle oberes ISAR mit 5x
                LISL 4                   ; 041d 6c          ; Fülle unteres ISAR mit x4
                LIS  $1                  ; 041e 71          ; Akku = 0x01
                LR   $1                  ; 041f 51          ; Schreibe Akku (0x01) in Scratchpad 1
                LI   $da                 ; 0420 20 da       ; Akku = 0xda
                ASD  (IS)                ; 0422 dc          ; Addiere Scratchpad ??
                AI   $66                 ; 0423 24 66       ; Addiere 0x66
                ASD  $1                  ; 0425 d1          ; Addiere Scratchpad 1
                CI   $75                 ; 0426 25 75       ; Rechne 0x75 - Akku
                BF   $4                  ; 0428 94 ca       ; Branch wenn nicht null um -54 bytes nach 0x3f3
                LR   (IS)+,A             ; 042a 5d          ; Speichere Akku in Scratchpad ??, inc ISAR
A42b:           LI   $fe                 ; 042b 20 fe       ; Akku = 0xfe
                ASD  (IS)                ; 042d dc          ; Addiere Scratchpad ??
                AI   $66                 ; 042e 24 66       ; Addiere 0x66
                ASD  $1                  ; 0430 d1          ; Addiere Scratchpad 1
                CI   $99                 ; 0431 25 99       ; Rechne 0x99 - Akku
                BF   $4                  ; 0433 94 bf       ; Branch wenn nicht null um -65 bytes nach 0x3f3
                LR   (IS)+,A             ; 0435 5d          ; Speichere Akku in Scratchpad ??, inc ISAR
                BF   $0                  ; 0436 90 f4       ; Branch immer um -12 bytes nach 0x42b
                
; Jump hierher von 0x65e oder 0x86c
; LoadAntennaWith0x0101
                DI                       ; 0438 1a          ; Disable Interrupt
                LISU 6                   ; 0439 66          ; Fülle oberes ISAR mit 6x
                LISL 6                   ; 043a 6e          ; Fülle unteres ISAR mit x6
                LIS  $1                  ; 043b 71          ; Akku = 0x01
                LR   (IS)+,A             ; 043c 5d          ; Scratchpad 66 = 0x01 (inc ISAR)
                LR   (IS),A              ; 043d 5c          ; Scratchpad 67 = 0x01
                LIS  $0                  ; 043e 70          ; Akku = 0
                LR   $4                  ; 043f 54          ; Scratchpad 4 = 0;
                LI   $f3                 ; 0440 20 f3       ; Akku = 0xf3
                LR   $2                  ; 0442 52          ; Schreibe Akku (0xf3) in Scratchpad 2
                PI   $4173               ; 0443 28 41 73    ; PC1 = 0x446, Call Subroutine 0x173 -> WriteToSAAorAntenna (Antenne)

; Jump hierher von 0x661
                LISU 5                   ; 0446 65          ; Fülle oberes ISAR mit 5x
                LISL 3                   ; 0447 6b          ; Fülle unteres ISAR mit x3
                LR   A,(IS)              ; 0448 4c          ; Lade Akku ab Scratchpad 53
                NI   $1                  ; 0449 21 01       ; Nur bit 0
                LISU 7                   ; 044b 67          ; Fülle oberes ISAR mit 7x
                LR   (IS)+,A             ; 044c 5d          ; Lade Akku ab Scratchpad 73 (inc ISAR)
                LISU 4                   ; 044d 64          ; Fülle oberes ISAR mit 4x
                LR   A,(IS)              ; 044e 4c          ; Lade Akku ab Scratchpad 44
                OI   $40                 ; 044f 22 40
                LR   (IS),A              ; 0451 5c
                PI   $458b               ; 0452 28 45 8b    ; PC1 = 0x455, Call Subroutine 0x58b
                JMP  $4df5               ; 0455 29 4d f5
                LISU 2                   ; 0458 62          ; Fülle oberes ISAR mit 2x
                LISL 7                   ; 0459 6f          ; Fülle unteres ISAR mit x7
A45a:           LIS  $4                  ; 045a 74          ; Akku = 0x04
                NS   (IS)-               ; 045b fe          ; Akku &= Scratchpad 27, dec ISAR
                BF   $4                  ; 045c 94 03       ; Branch wenn nicht null (bit 2 = 1) Z-Signal = 1 um +3 nach 0x460
                BR7  A45a                ; 045e 8f fb       ; Branch wenn unteres ISAR < 7 um -5 nach 0x45a
A460:           LR   A,IS                ; 0460 0a          ; Lade Akku mit ISAR
                COM                      ; 0461 18          ; Invertiere Akku
                NI   $7                  ; 0462 21 07       ; Nur untere 3 bits (0 wird 7, 7 wird 0 etc.)
                SL   4                   ; 0464 15          ; Schiebe 4 links
                LISU 5                   ; 0465 65          ; Fülle oberes ISAR mit 5x
                LISL 7                   ; 0466 6f          ; Fülle unteres ISAR mit x7
                LR   (IS),A              ; 0467 5c          ; Speichere Akku in Scratchpad 57
                DCI  Affc                ; 0468 2a 0f fc    ; Lade DC0 mit 0xffc (RAM)
                LM                       ; 046b 16          ; Lade Akku ab RAM 0xffc
                SR   1                   ; 046c 12
                SL   1                   ; 046d 13          ; lösche bit 0
                BT   1                   ; 046e 81 06       ; Branch wenn positiv (bit 7 = 0) um +6 nach 0x475
                DCI  Afd8                ; 0470 2a 0f d8    ; Lade DC0 mit 0xfd8 (RAM)
                BF   $0                  ; 0473 90 04       ; Branch immer um +4 nach 0x478

A475:           DCI  $fbd                ; 0475 2a 0f bd    ; Lade DC0 mit 0xfbd (ROM, enthält 0x07)

A478:           LISU 5                   ; 0478 65          ; Fülle oberes ISAR mit 5x
                LISL 4                   ; 0479 6c          ; Fülle unteres ISAR mit x4
                LR   A,$3                ; 047a 43          ; Lade Akku ab Scratchpad 3
                SL   1                   ; 047b 13          ; Schiebe links um 1 bit (*2)
                AS   $3                  ; 047c c3          ; Addiere Scratchpad 3 -> Akku = 3 * Scratchpad 3
                ADC                      ; 047d 8e          ; Addiere Akku zu DC0
                LR   A,(IS)+             ; 047e 4d          ; Lade Akku ab Scratchpad 54
                ST                       ; 047f 17          ; Speichere in DC0 Adresse (inc DC0)
                LR   A,(IS)+             ; 0480 4d          ; Lade Akku ab Scratchpad 55
                ST                       ; 0481 17          ; Speichere in DC0 Adresse (inc DC0)
                LR   A,(IS)+             ; 0482 4d          ; Lade Akku ab Scratchpad 56
                NI   $f                  ; 0483 21 0f       ; lösche obere 4 bit
                AS   (IS)-               ; 0485 ce          ; Addiere Scratchpad 57
                ST                       ; 0486 17          ; Speichere in DC0 Adresse (inc DC0)
                LISU 4                   ; 0487 64          ; Fülle oberes ISAR mit 4x
                LR   A,(IS)              ; 0488 4c
                OI   $10                 ; 0489 22 10
                LR   (IS),A              ; 048b 5c
; Jump hierher von 0x625
                LISU 5                   ; 048c 65          ; Fülle oberes ISAR mit 5x
                LISL 7                   ; 048d 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 048e 4c          ; Lade Akku ab Scratchpad 57
                SR   4                   ; 048f 14          ; Schiebe 4 rechts
                DCI  $44ec               ; 0490 2a 44 ec    ; Schreibe 44ec in DC0
                ADC                      ; 0493 8e          ; Addiere Akku zu DC0 (kann 0..7 sein)
                LISU 6                   ; 0494 66          ; Fülle oberes ISAR mit 6x
                LR   A,$6                ; 0495 46          ; Lade Scratchpad 6 in Akku
                NI   $10                 ; 0496 21 10       ; Nur Bit 4
                BT   4                   ; 0498 84 06       ; Branch wenn 0 (Bit 4 in Scratchpad 6) um +6 nach 0x49f
                LIS  $0                  ; 049a 70          ; Akku = 0
                LR   (IS)-,A             ; 049b 5e          ; Scratchpad 67 = 0, dec ISAR
                LR   (IS)+,A             ; 049c 5d          ; Scratchpad 66 = 0, inc ISAR                               
                BF   $0                  ; 049d 90 05       ; Branch immer im +5 nach 0x4a3
A49f:           LM                       ; 049f 16          ; Lade Akku ab Inhalt bei DC0
                LR   (IS)-,A             ; 04a0 5e          ; Scratchpad 67 = Inhalt von DC0, dec ISAR
                LIS  $1                  ; 04a1 71          ; Akku = 0x01
                LR   (IS)+,A             ; 04a2 5d          ; Scratchpad 66 = 1, inc ISAR         
A4a3:           LIS  $0                  ; 04a3 70          ; Akku = 0
                LR   $4                  ; 04a4 54          ; Scratchpad 4 = 0
                LI   $f3                 ; 04a5 20 f3       ; Akku = 0xf3
                LR   $2                  ; 04a7 52          ; Schreibe Akku (0xf3) in Scratchpad 2
                PI   $4173               ; 04a8 28 41 73    ; PC1 = 0x4ab, Call Subroutine 0x173 -> WriteToSAAorAntenna (Antenne)
                DCI  Affd                ; 04ab 2a 0f fd    ; Lade DC0 mit 0xffd (RAM)
                LR   A,$3                ; 04ae 43          ; Lade Akku ab Scratchpad 3
                SL   4                   ; 04af 15          ; Schiebe 4 links
                ST                       ; 04b0 17          ; Speichere in 0xffd
; Jump hierher von 0x622
                LIS  $0                  ; 04b1 70          ; Akku = 0
                LR   $4                  ; 04b2 54          ; Scratchpad 4 = 0
                LR   A,$3                ; 04b3 43          ; Lade Akku ab Scratchpad 3
                LISU 7                   ; 04b4 67          ; Fülle oberes ISAR mit 7x
                LISL 3                   ; 04b5 6b          ; Fülle unteres ISAR mit x3
                DCI  $44e0               ; 04b6 2a 44 e0    ; Lade DC0 mit 0x44e0
                ADC                      ; 04b9 8e          ; Addiere Akku zu DC0
                LR   A,(IS)              ; 04ba 4c          ; Lade Akku ab Scratchpad 73
                NI   $1                  ; 04bb 21 01       ; Nur Bit 0
                OM                       ; 04bd 8b          ; Akku || mit Inhalt von DC0
                LR   (IS),A              ; 04be 5c          ; Speicher Akku in Scratchpad 73
                LISU 5                   ; 04bf 65          ; Fülle oberes ISAR mit 5x
                LI   $ff                 ; 04c0 20 ff       ; Akku = 0xff
                ADC                      ; 04c2 8e          ; Addiere Akku zu DC0
                LR   A,(IS)              ; 04c3 4c          ; Lade Akku ab Scratchpad 53
                NI   $1                  ; 04c4 21 01       ; Nur Bit 0
                OM                       ; 04c6 8b          ; Akku || mit Inhalt von DC0
                LR   (IS),A              ; 04c7 5c          ; Speicher Akku in Scratchpad 53
                LI   $d7                 ; 04c8 20 d7       ; Akku = 0xd7
                LR   $2                  ; 04ca 52          ; Schreibe Akku (0xd7) in Scratchpad 2
                PI   $4173               ; 04cb 28 41 73    ; PC1 = 0x4ce, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                LR   A,$5                ; 04ce 45          ; Lade Akku ab Scratchpad 5
                NI   $df                 ; 04cf 21 df       ; Lösche Bit 5
                LR   $5                  ; 04d1 55          ; Speicher Akku in Scratchpad 5
                LISU 4                   ; 04d2 64          ; Fülle oberes ISAR mit 4x
                LISL 6                   ; 04d3 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 04d4 4c          ; Lade Akku ab Scratchpad 46
                NI   $10                 ; 04d5 21 10       ; Nur Bit 4
                BF   $4                  ; 04d7 94 02       ; Branch wenn nicht null (bit 4 in Scratchpad 46) um +2 nach 0x4da
                LR   P0,Q                ; 04d9 0d          ; Lade PC0 ab Q Register (Scratchpad 14,15)
A4da:           LR   A,(IS)              ; 04da 4c          ; Lade Akku ab Scratchpad 46
                NI   $ef                 ; 04db 21 ef       ; Lösche Bit 4
                LR   (IS),A              ; 04dd 5c          ; Speicher Akku in Scratchpad 46
                JMP  $4647               ; 04de 29 46 47
; Daten?
                OI   $9e                 ; 04e1 22 9e
                OUTS 10                  ; 04e3 ba
                LISL 2                   ; 04e4 6a
                NS   $8                  ; 04e5 f8
                NS   (IS)                ; 04e6 fc
                DS   $2                  ; 04e7 32
                NS   (IS)-               ; 04e8 fe
                NS   $a                  ; 04e9 fa
                LIS  $e                  ; 04ea 7e
                LR   (IS),A              ; 04eb 5c
; Daten für Antennensteuerung
                db   $00                 ; 04ec 00  ; 0000 0000
                db   $80                 ; 04ed 80  ; 1000 0000
                db   $02                 ; 04ee 02  ; 0000 0010
                db   $40                 ; 04ef 40  ; 0100 0000
                db   $08                 ; 04f0 08  ; 0000 1000
                db   $04                 ; 04f1 04  ; 0000 0100
                db   $20                 ; 04f2 20  ; 0010 0000
                db   $10                 ; 04f3 10  ; 0001 0000

; Subroutine InitNF5to8(PLAY)
; Wenn niedere drei Bit an 0xffc 0 oder >5 sind, initialisiere Scratchpad 3 mit 1
; Wenn niedere drei Bit an 0xffc 1 .. 5 initialisiere Scratchpad 3 mit Wert 1 .. 5
                LR   K,P                 ; 04f4 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x263)
                LR   DC,H                ; 04f5 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 04f6 16          ; Kopiere Inhalt von 0xffc (RAM) in Akku
                NI   $7                  ; 04f7 21 07       ; Akku = Akku && 0x7 -> nur letzte drei Bits
                BT   4                   ; 04f9 84 06       ; Branch wenn Zero im Akku +6 bytes -> 0x500
                ; Wenn letzte drei bits nicht null
                LR   $3                  ; 04fb 53          ; Lade Scratchpad 3 mit Akkumulator
                AI   $fa                 ; 04fc 24 fa       ; Addiere 0xFA zu Akku
                BF   $2                  ; 04fe 92 06       ; Branch wenn kein Überlauf, also wenn Wert <=5 -> +6 bytes -> 0x505
; wenn letzte drei bits 0 oder Wert > 5
A500:           LIS  $1                  ; 0500 71          ; Lade Akku mit 1
                LR   $3                  ; 0501 53          ; Lade Scratchpad 3 mit Akkumulator
                BF   $0                  ; 0502 90 02       ; Geht direkt nach 0x505
; Subroutine SetPlay
                LR   K,P                 ; 0504 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13 (0xf55)
; nachdem Scratchpad 3 einen Wert zwischen 1 und 5 hat
; Zurückspeichern an 0xffc, ohne obere 4 bits zu verändern
A505:           LR   DC,H                ; 0505 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 0506 16          ; Kopiere Inhalt von 0xffc in Akku
                NI   $f0                 ; 0507 21 f0       ; Akku = Akku && 0xF0 -> höherwertiges Byte
                AS   $3                  ; 0509 c3          ; Addiere Scratchpad 3
                LR   DC,H                ; 050a 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                ST                       ; 050b 17          ; Speichere Akku in 0xffc
; Datenbyte auswählen und in Scratchpad 72 speichern
                LR   A,$3                ; 050c 43          ; Kopiere Scratchpad 3 in Akku
                LISU 7                   ; 050d 67          ; Fülle oberes ISAR mit 7x
                LISL 2                   ; 050e 6a          ; Lade unteres ISAR mit x2
                DCI  $452d               ; 050f 2a 45 2d    ; Schreibe 0x452d in DC0
                ADC                      ; 0512 8e          ; Addiere Akku zu DC0, kann 0x452e bis 0x4532 werden
                LR   Q,DC                ; 0513 0e          ; Kopiere DC0 in Scratchpad 14,15
; Ergänze Wert Scratchpad 72 mit ausgewähltem Datenbyte nur bits 1..7                
                LR   A,(IS)              ; 0514 4c          ; Lade Akku mit ISAR, also Scratchpad 72, wurde früher mit 0 initialisiert
                NI   $1                  ; 0515 21 01       ; Akku && 0x01, löscht obere 7 bit
                OM                       ; 0517 8b          ; Akku || mit Inhalt von DC0
                LR   (IS),A              ; 0518 5c          ; Speichere Akku in ISAR, also Scratchpad 72
; Ergänze Wert Scratchpad 52 mit ausgewähltem Datenbyte nur bits 1..7                
                LISU 5                   ; 0519 65          ; Lade oberes ISAR mit 5x
                LR   DC,Q                ; 051a 0f          ; Kopiere Scratchpad 14,15 in DC0
                LR   A,(IS)              ; 051b 4c          ; Lade Akku mit ISAR, also Scratchpad 52, wurde früher mit 0 initialisiert
                NI   $1                  ; 051c 21 01       ; Akku && 0x01, löscht obere 7 bit
                OM                       ; 051e 8b          ; Akku || mit Inhalt von DC0
                LR   (IS),A              ; 051f 5c          ; Speichere Akku in ISAR, also Scratchpad 52
; lade letzte drei bits von 0xffc
; diese drei bits wählen den Zustand der oberen 4 bits von Port 1, rest wird nicht verändert    
; Dies ist die Anwahl NF5 .. NF8            
                LR   DC,H                ; 0520 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LIS  $7                  ; 0521 77          ; Akku = 0x07
                NM                       ; 0522 8a          ; Akku = Akku & Inhalt von DC0, also 0xffc -> letzte drei bits
                DCI  $4532               ; 0523 2a 45 32    ; Schreibe 0x4532 in DC0
                ADC                      ; 0526 8e          ; Addiere Akku zu DC0
                INS  1                   ; 0527 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f                  ; 0528 21 0f       ; Akku && 0x0F -> untere vier bits
                OM                       ; 052a 8b          ; Akku || mit Inhalt von DC0
                OUTS 1                   ; 052b b1          ; Schreibe Akku auf Port 1
                PK                       ; 052c 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0x263)

;Data anhand bits 4,5,6 in 0xffc, Pointer auf Datenbyte gespeichert in Scratchpad 14,15
; Bits für Displayanzeige RECORD (PLAY)
;Bits 1..7 kommen in Scratchpad 62 und 42, Anhand Anwahl NF1..NF4
                db   $00                 ; 052d 00          ; 0000 0000                             -> kein Segment
;Data anhand letzter drei bits in 0xffc, Pointer auf Datenbyte gespeichert in Scratchpad 14,15
; Bits für Displayanzeige (PLAY)
;Bits 1..7 kommen in Scratchpad 72 und 52, Anhand Anwahl NF5..NF8
                db   $30                 ; 052e 30          ; 0011 0000                             -> 1 
                db   $ae                 ; 052f ae          ; 1010 1110                             -> 2           
                db   $b6                 ; 0530 b6          ; 1011 0110                             -> 3
                db   $f0                 ; 0531 f0          ; 1111 0000                             -> 4
                db   $d6                 ; 0532 d6          ; 1101 0110                             -> 5
;Data obere 4 bits für Port 1, Anwahl NF5 .. NF8 -> INPUT
                db   $10                 ; 0533 10          ; 0001 0000 NF5 -> TUNER
                db   $00                 ; 0534 00          ; 0000 0000 aus -> PHONO
                db   $80                 ; 0535 80          ; 1000 0000 NF8 -> AUX
                db   $40                 ; 0536 40          ; 0100 0000 NF7 -> TAPE1
                db   $20                 ; 0537 20          ; 0010 0000 NF6 -> TAPE2

; Subroutine InitNF1to4(RECORD)               
A538:           LR   K,P                 ; 0538 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13  (0x266)
                LR   DC,H                ; 0539 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 053a 16          ; Kopiere Inhalt von 0xffc in Akku
                NI   $70                 ; 053b 21 70       ; nur bits 4,5,6
                LR   $3                  ; 053d 53          ; Lade Scratchpad 3 mit Akkumulator
                AI   $a0                 ; 053e 24 a0       ; Addiere 0xA0 zu Akku
                BF   $2                  ; 0540 92 06       ; Branch wenn kein Überlauf, also wenn Wert der drei bits <=5 -> +6 bytes -> 0x547
; Initialisiere Scratchpad 3 mit 0 wenn Wert ungültig war
                LIS  $0                  ; 0542 70          ; Akku = 0
                LR   $3                  ; 0543 53          ; Lade Scratchpad 3 mit Akkumulator
                BF   $0                  ; 0544 90 02       ; Geht direkt nach 0x547

; Subroutine SetRecord
A546:           LR   K,P                 ; 0546 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13 -> (0xf50 / 0xf6e)

A547:           LR   DC,H                ; 0547 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 0548 16          ; Kopiere Inhalt von 0xffc in Akku
                NI   $8f                 ; 0549 21 8f       ; Lösche bits 4,5,6
                AS   $3                  ; 054b c3          ; Addiere Scratchpad 3
                LR   DC,H                ; 054c 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                ST                       ; 054d 17          ; Speichere Akku in 0xffc -> bits 4,5,6 sind jetzt im Bereich 0..5
                LR   A,$3                ; 054e 43          ; Kopiere Scratchpad 3 in Akku
                SR   4                   ; 054f 14          ; Shift right 4 bits -> 4,5,6 wird 0,1,2
                LISU 6                   ; 0550 66          ; Lade oberes ISAR mit 6x
                LISL 2                   ; 0551 6a          ; Lade unteres ISAR mit x2
                DCI  $452d               ; 0552 2a 45 2d    ; Schreibe 0x452d in DC0
                ADC                      ; 0555 8e          ; Addiere Akku zu DC0
                LR   Q,DC                ; 0556 0e          ; Kopiere DC0 in Scratchpad 14,15
; Ergänze Wert Scratchpad 62 mit ausgewähltem Datenbyte nur bits 1..7   
                LR   A,(IS)              ; 0557 4c          ; Lade Akku mit ISAR, also Scratchpad 62, wurde früher mit 0 initialisiert
                NI   $1                  ; 0558 21 01       ; Akku & 0x01
                OM                       ; 055a 8b          ; Akku || mit Inhalt von DC0
                LR   (IS),A              ; 055b 5c          ; Speichere Akku in ISAR, also Scratchpad 62
; Ergänze Wert Scratchpad 42 mit ausgewähltem Datenbyte nur bits 1..7
                LISU 4                   ; 055c 64          ; Lade oberes ISAR mit 4x
                LR   DC,Q                ; 055d 0f          ; Kopiere Scratchpad 14,15 in DC0
                LR   A,(IS)              ; 055e 4c          ; Lade Akku mit ISAR, also Scratchpad 42, wurde früher mit 0 initialisiert
                NI   $1                  ; 055f 21 01       ; Akku && 0x01
                OM                       ; 0561 8b          ; Akku || mit Inhalt von DC0
                LR   (IS),A              ; 0562 5c          ; Speichere Akku in ISAR, also Scratchpad 42
; lade bits 4,5,6 von 0xffc
; diese drei bits wählen den Zustand der oberen 4 bits von Port 0, rest wird nicht verändert    
; Dies ist die Anwahl NF1 .. NF4  
                LR   DC,H                ; 0563 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 0564 16          ; Kopiere Inhalt von 0xffc in Akku
                SR   4                   ; 0565 14          ; Shift right 4 bits -> 4,5,6,7 wird 0,1,2,3
                NI   $7                  ; 0566 21 07       ; nur erste drei bits
                DCI  $4572               ; 0568 2a 45 72    ; Schreibe 0x4572 in DC0
                ADC                      ; 056b 8e          ; Addiere Akku zu DC0
                INS  0                   ; 056c a0          ; Lade Port 0 in Akku
                NI   $f                  ; 056d 21 0f       ; lösche obere 4 bits
                OM                       ; 056f 8b          ; Akku || mit Inhalt von DC0
                OUTS 0                   ; 0570 b0          ; Schreibe Akku auf Port 0
                PK                       ; 0571 0c          ; Speichere PC0 (program counter) in PC1 (strack register) und springe zu Adresse in Scratchpad 12,13 (0x266)
                
;Data obere 4 bits für Port 0, Anwahl NF1 .. NF4 -> RECORD
                db   $30                 ; 0572 30          ; 0011 0000 NF1 + NF2   -> OFF
                db   $00                 ; 0573 00          ; 0000 0000 aus         -> TUNER
                db   $80                 ; 0574 80          ; 1000 0000 NF4         -> PHONO
                db   $40                 ; 0575 40          ; 0100 0000 NF3         -> AUX
                db   $10                 ; 0576 10          ; 0001 0000 NF1         -> TAPE1
                db   $20                 ; 0577 20          ; 0010 0000 NF2         -> TAPE2
                
                
A578:           DI                       ; 0578 1a          ; Disable Interrupt
                LIS  $0                  ; 0579 70          ; Akku = 0
                LR   $8                  ; 057a 58          ; Scratchpad 8 = 0x00
                LI   $3f                 ; 057b 20 3f       ; Akku = 0x3f
                LR   $4                  ; 057d 54          ; Scratchpad 4 = 0x3f
                LI   $d7                 ; 057e 20 d7       ; Akku = 0xd7
                LR   $2                  ; 0580 52          ; Scratchpad 2 = 0xd7
; Setze bit 1 und lösche bit 0 in Scratchpad 6
                LR   A,$6                ; 0581 46          ; Lade Scratchpad 6 in Akku
                OI   $2                  ; 0582 22 02       ; Setze bit 1
                NI   $fe                 ; 0584 21 fe       ; Lösche bit 0
                LR   $6                  ; 0586 56          ; Speichere Akku in Scratchpad 6
                PI   $4025               ; 0587 28 40 25    ; PC1 = 0x58a, Call Subroutine 0x025
                PK                       ; 058a 0c

                LR   K,P                 ; 058b 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13 (0xf3a / 0xef8 / 0xb76 / 0x653 / 0x455 / 0x289 / 0x232)
                LISU 4                   ; 058c 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 058d 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 058e 4c          ; Lade Akku ab Scratchpad 44
                SR   1                   ; 058f 12
                SL   1                   ; 0590 13          ; Lösche bit 0
                BT   1                   ; 0591 81 04       ; Branch wenn positiv (bit 7 = 0) um +4 nach 0x596
                JMP  $4641               ; 0593 29 46 41
A596:           SL   1                   ; 0596 13          ; Schiebe 1 links
                BF   $1                  ; 0597 91 e0       ; Branch wenn negativ (bit7 = 1) um -32 byte nach 0x578
                SL   1                   ; 0599 13          ; Schiebe 1 links
                BF   $1                  ; 059a 91 dd       ; Branch wenn negativ (bit 7 = 1) um -35 bytes nach 0x578 
; Lösche bit 0 und 1 in Scratchpad 6
                LR   A,$6                ; 059c 46          ; Lade Scratchpad 6 in Akku
                NI   $fc                 ; 059d 21 fc       ; Lösche bit 0 und 1
                LR   $6                  ; 059f 56          ; Speichere Akku in Scratchpad 6
                LIS  $0                  ; 05a0 70          ; Akku = 0
                OUT  $6                  ; 05a1 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                LR   $4                  ; 05a3 54          ; Scratchpad 4 = 0
                PK                       ; 05a4 0c          ; Speichere PC0 ind PC1 und springe zu Adresse in Scratchpad 12,13 (dort wo es herkam)

; Subroutine Delay10ms
; Verzögert um 4 x 256 Durchgänge
; 1 Cycle = 2ns bei 4MHz                                                                                                                                                    Cycles
; 8+(5*255+4.5)*4+3*5+4.5+4 = 8+1279.5*4+15+4.5+4 = 5'149.5 -> 10.299ms   
A5a5:           LR   K,P                 ; 05a5 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13 (0x38c oder 0xadb oder 0xb5d)                                4
                LIS  $4                  ; 05a6 74          ; Akku = 0x04                                                                                                   1
                LR   $1                  ; 05a7 51          ; Schreibe Akku (0x04) in Scratchpad 1                                                                          1
                LIS  $0                  ; 05a8 70          ; Akku = 0                                                                                                      1
                LR   $0                  ; 05a9 50          ; Schreibe Akku (0x00) in Scratchpad 0                                                                          1
A5aa:           DS   $0                  ; 05aa 30          ; Dec Scratchpad 0                                                                                              1.5
                BF   $4                  ; 05ab 94 fe       ; Branch wenn nicht null um -2 nach 0x5aa                                                                       3.5 wenn branch sonst 3
                DS   $1                  ; 05ad 31          ; Dec Scratchpad 1                                                                                              1.5
                BF   $4                  ; 05ae 94 fb       ; Branch wenn nicht null um -5 nach 0x5aa                                                                       3.5 wenn branch sonst 3
                PK                       ; 05b0 0c          ; Programm Counter (5be) wird in Stack geschrieben, zurück zu Herkunftsadresse (0x38c oder 0xadb oder 0xb5d)    4

; LoadLowToOutputMultiplexer
; Subroutine lädt ein Low Bit in den Multiplexer IC4
; Subroutine toggelt Bit 3 von Port 4 (IC4 LS259 8 Port Output Multiplexer Enable Pin 14 Low Active) 1-0-1
A5b1:           LR   K,P                 ; 05b1 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13 (viele Ursprünge)
                LI   $f7                 ; 05b2 20 f7       ; Akku = 0xf7 (1111 0111)
                OUT  $4                  ; 05b4 27 04       ; Schreibe Akku auf Port 4 (I/O)
                LI   $ff                 ; 05b6 20 ff       ; Akku = 0xff (1111 1111)
                OUT  $4                  ; 05b8 27 04       ; Schreibe Akku auf Port 4 (I/O)
                LI   $f7                 ; 05ba 20 f7       ; Akku = 0xf7 (1111 0111)
                OUT  $4                  ; 05bc 27 04       ; Schreibe Akku auf Port 4 (I/O)
                PK                       ; 05be 0c          ; Programm Counter (5be) wird in Stack geschrieben, zurück zu Herkunftsadresse 
                
; LoadHighToOutputMultiplexer
; Subroutine lädt ein High Bit in den Multiplexer IC4
; Subroutine toggelt Bit 3 von Port 4 (IC4 LS259 8 Port Output Multiplexer Enable Pin 14 Low Active) 1-0-1   
A5bf:           LR   K,P                 ; 05bf 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13 (viele Ursprünge)
                LI   $77                 ; 05c0 20 77       ; Akku = 0x77 (0111 0111)
                OUT  $4                  ; 05c2 27 04       ; Schreibe Akku auf Port 4 (I/O)
                LI   $7f                 ; 05c4 20 7f       ; Akku = 0x7f (0111 1111)
                OUT  $4                  ; 05c6 27 04       ; Schreibe Akku auf Port 4 (I/O)
                LI   $77                 ; 05c8 20 77       ; Akku = 0x77 (0111 0111)
                OUT  $4                  ; 05ca 27 04       ; Schreibe Akku auf Port 4 (I/O)
                PK                       ; 05cc 0c          ; Programm Counter (5cc) wird in Stack geschrieben, zurück zu Herkunftsadresse 
                
; Subroutine
                DI                       ; 05cd 1a          ; Disable Interrupt
                LR   K,P                 ; 05ce 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13 (viele Ursprünge)
                LR   A,KU                ; 05cf 00          ; Lade Akku mit Scratchpad 12
                LR   QU,A                ; 05d0 06          ; Speichere Akku in Scratchpad 14
                LR   A,KL                ; 05d1 01          ; Lade Akku mit Scratchpad 13
                LR   QL,A                ; 05d2 07          ; Speichere Akku in Scratchpad 15
                LIS  $0                  ; 05d3 70          ; Akku = 0
                OUT  $6                  ; 05d4 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                LR   $4                  ; 05d6 54          ; Scratchpad 4 = 0
                LISU 6                   ; 05d7 66          ; Fülle oberes ISAR mit 6x
                LISL 3                   ; 05d8 6b          ; Fülle unteres ISAR mit x3
                LR   DC,H                ; 05d9 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 05da 16          ; Kopiere Inhalt von 0xffc in Akku
                SR   1                   ; 05db 12          ; Schiebe 1 bit rechts
                SL   1                   ; 05dc 13          ; Schiebe 1 bit links
                LR   A,(IS)              ; 05dd 4c          ; Lade Akku mit Scratchpad von ISAR
                BF   $1                  ; 05de 91 0e       ; Branch wenn negativ (bit 7 = 1) um +e nach 0x5ed
                NI   $1                  ; 05e0 21 01
                OI   $80                 ; 05e2 22 80
                LR   (IS),A              ; 05e4 5c
                LISU 4                   ; 05e5 64          ; Fülle oberes ISAR mit 4x
                LR   A,(IS)              ; 05e6 4c
                NI   $1                  ; 05e7 21 01
                OI   $80                 ; 05e9 22 80
                BF   $0                  ; 05eb 90 0c
A5ed:           NI   $1                  ; 05ed 21 01
                OI   $10                 ; 05ef 22 10
                LR   (IS),A              ; 05f1 5c
                LISU 4                   ; 05f2 64          ; Fülle oberes ISAR mit 4x
                LR   A,(IS)              ; 05f3 4c
                NI   $1                  ; 05f4 21 01
                OI   $10                 ; 05f6 22 10
A5f8:           LR   (IS)+,A             ; 05f8 5d
                LR   A,(IS)              ; 05f9 4c
                NI   $bf                 ; 05fa 21 bf
                LR   (IS)-,A             ; 05fc 5e
                LI   $d7                 ; 05fd 20 d7       ; Akku = 0xd7
                LR   $2                  ; 05ff 52          ; Schreibe Akku (0xd7) in Scratchpad 2
                PI   $4173               ; 0600 28 41 73    ; PC1 = 0x603, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                LR   A,$5                ; 0603 45
                NI   $ef                 ; 0604 21 ef
                LR   $5                  ; 0606 55
                LR   A,$5                ; 0607 45
                SL   1                   ; 0608 13
                BT   1                   ; 0609 81 05       ; Branch wenn positiv (bit 7 = 0) um +5 nach 0x60f
                LIS  $b                  ; 060b 7b          ; Akku = 0x0b
                LR   $3                  ; 060c 53
                BF   $0                  ; 060d 90 08       ; Branch immer um +8 nach 0x616
A60f:           LR   A,$5                ; 060f 45
                SR   1                   ; 0610 12
                SL   1                   ; 0611 13
                BT   1                   ; 0612 81 12       ; Branch wenn positiv (bit 7 = 0) um +12 nach 0x625
                LIS  $a                  ; 0614 7a          ; Akku = 0x0a
                LR   $3                  ; 0615 53
; LoadAntennaWith0x0001                
A616:           LISU 6                   ; 0616 66          ; Fülle oberes ISAR mit 6x
                LISL 6                   ; 0617 6e          ; Fülle unteres ISAR mit x6
                LIS  $1                  ; 0618 71          ; Akku = 0x01
                LR   (IS)+,A             ; 0619 5d          ; Scratchpad 66 = 0x01, inc ISAR
                LIS  $0                  ; 061a 70          ; Akku = 0
                LR   (IS),A              ; 061b 5c          ; Scratchpad 67 = 0
                LI   $f3                 ; 061c 20 f3       ; Akku = 0xf3
                LR   $2                  ; 061e 52          ; Schreibe Akku (0xf3) in Scratchpad 2
                PI   $4173               ; 061f 28 41 73    ; PC1 = 0x622, Call Subroutine 0x173 -> WriteToSAAorAntenna (Antenne)
                JMP  $44b1               ; 0622 29 44 b1
A625:           JMP  $448c               ; 0625 29 44 8c

; Jump hierher von 0xe1b
                PI   $4106               ; 0628 28 41 06    ; PC1 = 0x62b, Call Subroutine 0x106 -> HandleInputsKS
                BF   $0                  ; 062b 90 38       ; Branch immer um +0x38 nach 0x664
                LISU 2                   ; 062d 62          ; Fülle oberes ISAR mit 2x
                LISL 0                   ; 062e 68          ; Fülle unteres ISAR mit x0
                LR   A,(IS)              ; 062f 4c          ; Lade Akku ab Scratchpad 20
                SL   1                   ; 0630 13          ; Schiebe 1 links
                BT   1                   ; 0631 81 34       ; Branch wenn positiv (bit 7 = 0), STME = 0, um +34 nach 0x666
                LR   A,$6                ; 0633 46          ; Lade Scratchpad 6 in Akku
                SL   1                   ; 0634 13          ; Schiebe 1 links
                SL   1                   ; 0635 13          ; Schiebe 1 links
                BF   $1                  ; 0636 91 76       ; Branch wenn negativ (bit 7 = 1) um +76 nach 0x6ad
; Setze bit 5 in Scratchpad 6
                LR   A,$6                ; 0638 46          ; Lade Scratchpad 6 in Akku
                OI   $20                 ; 0639 22 20       ; Setze bit 5
                LR   $6                  ; 063b 56          ; Speichere Akku in Scratchpad 6
                LR   A,$5                ; 063c 45
                SL   1                   ; 063d 13
                SL   1                   ; 063e 13
                BT   1                   ; 063f 81 16
                DCI  Affd                ; 0641 2a 0f fd    ; Lade DC0 mit 0xffd (RAM)
                LM                       ; 0644 16          ; Lade Akku ab RAM 0xffd
                SR   4                   ; 0645 14          ; Schiebe 4 rechts (nur obere 4 bit)
                LR   $3                  ; 0646 53          ; Speichere in Scratchpad 3

; Jump hierher von 0x4de und 0x865
                PI   $45cd               ; 0647 28 45 cd    ; PC1 = 0x64a, Call Subroutine 0x5cd
                LISU 4                   ; 064a 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 064b 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 064c 4c
                NI   $3f                 ; 064d 21 3f
                LR   (IS),A              ; 064f 5c
                PI   $458b               ; 0650 28 45 8b    ; PC1 = 0x653, Call Subroutine 0x58b
                JMP  $4df5               ; 0653 29 4d f5
A656:           LR   A,$5                ; 0656 45
                OI   $20                 ; 0657 22 20
                LR   $5                  ; 0659 55
                SR   1                   ; 065a 12
                SL   1                   ; 065b 13
                BT   1                   ; 065c 81 04
                JMP  $4438               ; 065e 29 44 38 -> LoadAntennaWith0x0101
A661:           JMP  $4446               ; 0661 29 44 46

A664:           BF   $0                  ; 0664 90 4b       ; Branch immer um +4b nach 0x6b0
; LSNE
A666:           LISU 2                   ; 0666 62          ; Fülle oberes ISAR mit 2x
                LISL 2                   ; 0667 6a          ; Lade unteres ISAR mit x2
                LR   A,(IS)              ; 0668 4c          ; Lade Akku ab Scratchpad 22
                SL   1                   ; 0669 13          ; Schiebe 1 links
                BT   1                   ; 066a 81 16       , Branch wenn positiv (bit 7 = 0), LSNE um +16 nach 0x681
                LIS  $4                  ; 066c 74          ; Akku = 0x04
                NS   $6                  ; 066d f6          ; Akku &= Scratchpad 6
                BF   $4                  ; 066e 94 3e       ; Branch wenn nicht null, bit 2 in Scratchpad 6 war 1, um +3e nach 0x6ad
; Setze bit 2 in Scratchpad 6
                LR   A,$6                ; 0670 46          ; Lade Scratchpad 6 in Akku
                OI   $4                  ; 0671 22 04       ; Setze bit 2
                LR   $6                  ; 0673 56          ; Speichere Akku in Scratchpad 6
                DI                       ; 0674 1a          ; Disable Interrupt
                LR   A,$5                ; 0675 45          ; Lade Akku ab Scratchoad 5
                OI   $80                 ; 0676 22 80       ; Setze bit 7
                LR   $5                  ; 0678 55          ; Speichere Scratchpad 5
; Hierher von 0x244 oder 0x0ca
                LIS  $0                  ; 0679 70          ; Akku = 0
                LR   $3                  ; 067a 53          ; Scratchpad 3 = 0
                PI   $42a6               ; 067b 28 42 a6    ; PC1 = 0x67e, call subroutine 0x2a6
                JMP  $4277               ; 067e 29 42 77
A681:           LISU 2                   ; 0681 62          ; Fülle oberes ISAR mit 2x
                LISL 3                   ; 0682 6b          ; Fülle unteres ISAR mit x3
                LR   A,(IS)+             ; 0683 4d          ; Lade Akku ab Scratchpad 23, inc ISAR
                SL   1                   ; 0684 13          ; Schiebe 1 links
                BT   1                   ; 0685 81 1b       ; Branch wenn positiv (bit 7 = 0), DOWN = 0 um +1b nach 0x6a1
                LR   A,$5                ; 0687 45          ; Lade Akku ab Scratchoad 5
                OI   $80                 ; 0688 22 80       ; Setze bit 7
                NI   $fe                 ; 068a 21 fe       ; Lösche bit 0
A68c:           LR   $5                  ; 068c 55          ; Speichere Scratchpad 5
                LISU 5                   ; 068d 65          ; Fülle oberes ISAR mit 5x
                LISL 1                   ; 068e 69          ; Fülle unteres ISAR mit x1
                LR   A,(IS)              ; 068f 4c          ; Lade Akku ab Scratchpad 51
                SL   1                   ; 0690 13          ; Schiebe 1 links
                BF   $4                  ; 0691 94 09       ; Branch wenn nicht null um +9 nach 0x69b
                LISL 6                   ; 0693 6e          ; Fülle unteres ISAR mit x6
                LIS  $8                  ; 0694 78          ; Akku = 0x08
                LR   (IS)-,A             ; 0695 5e          ; Scratchpad 56 = 0x08, dec ISAR
                LI   $75                 ; 0696 20 75       ; Akku = 0x75
                LR   (IS)-,A             ; 0698 5e          ; Scratchpad 55 = 0x75, dec ISAR
                LIS  $0                  ; 0699 70          ; Akku = 0
                LR   (IS),A              ; 069a 5c          ; Scratchpad 54 = 0
A69b:           PI   $45cd               ; 069b 28 45 cd    ; PC1 = 0x69e, Call Subroutine 0x5cd
                JMP  $4359               ; 069e 29 43 59
A6a1:           LR   A,(IS)              ; 06a1 4c          ; Lade Akku ab Scratchpad 24, inc ISAR (wurde inc bei 0x683)
                SL   1                   ; 06a2 13          ; Schiebe 1 links
                BT   1                   ; 06a3 81 06       ; Branch wenn positiv (bit 7 = 0), UP = 0 um +6 nach 0x6aa
                LR   A,$5                ; 06a5 45          ; Lade Akku ab Scratchoad 5
                OI   $81                 ; 06a6 22 81       ; Setze bit 7 und bit 0
                BF   $0                  ; 06a8 90 e3       ; Branch immer um -29 bytes nach 0x68c
A6aa:           PI   $4210               ; 06aa 28 42 10    ; PC1 = 0x6ad, Call Subroutine 0x210
A6ad:           JMP  $4dc6               ; 06ad 29 4d c6

A6b0:           LR   A,$3                ; 06b0 43          ; Lade Akku ab Scratchpad 3, steht gedrückte Taste drin (1..9 oder 0 wenn keine)
                SL   1                   ; 06b1 13          ; Schiebe 1 links (*2)
                BT   4                   ; 06b2 84 28       ; Branch wenn 0 (keine Taste) um +28 nach 0x6db
                LR   A,$5                ; 06b4 45
                NI   $10                 ; 06b5 21 10
                BT   4                   ; 06b7 84 07
                LR   DC,H                ; 06b9 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 06ba 16          ; Kopiere Inhalt von 0xffc in Akku
                XI   $80                 ; 06bb 23 80       ; Toggle bit 7 im Akku
                LR   DC,H                ; 06bd 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                ST                       ; 06be 17          ; Speichere zurück an 0xffc
A6bf:           LR   A,$5                ; 06bf 45
                SR   1                   ; 06c0 12
                SL   1                   ; 06c1 13
                BT   1                   ; 06c2 81 0b
                NI   $6f                 ; 06c4 21 6f
                LR   $5                  ; 06c6 55
                SL   1                   ; 06c7 13
                SL   1                   ; 06c8 13
                BT   1                   ; 06c9 81 0e
                JMP  $4458               ; 06cb 29 44 58
A6ce:           NI   $6f                 ; 06ce 21 6f
                LR   $5                  ; 06d0 55
                SL   1                   ; 06d1 13
                SL   1                   ; 06d2 13
                BT   1                   ; 06d3 81 04
                JMP  $4468               ; 06d5 29 44 68
A6d8:           JMP  $4274               ; 06d8 29 42 74

A6db:           LR   A,$5                ; 06db 45
                SR   1                   ; 06dc 12
                SL   1                   ; 06dd 13
                BT   1                   ; 06de 81 0f
                LISU 4                   ; 06e0 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 06e1 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 06e2 4c
                SL   4                   ; 06e3 15
                BT   1                   ; 06e4 81 06
                LISL 7                   ; 06e6 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 06e7 4c
                NI   $7f                 ; 06e8 21 7f
                LR   (IS),A              ; 06ea 5c
A6eb:           JMP  $4891               ; 06eb 29 48 91
A6ee:           NI   $10                 ; 06ee 21 10
                LR   A,$5                ; 06f0 45
                BT   4                   ; 06f1 84 07
                NI   $ef                 ; 06f3 21 ef
                LR   $5                  ; 06f5 55
                JMP  $489e               ; 06f6 29 48 9e
A6f9:           OI   $10                 ; 06f9 22 10
                LR   $5                  ; 06fb 55
                EI                       ; 06fc 1b
A6fd:           LIS  $1                  ; 06fd 71          ; Akku = 0x01
                NS   $4                  ; 06fe f4          ; Akku &= Scratchpad 4
                BF   $4                  ; 06ff 94 fd
                DI                       ; 0701 1a          ; Disable Interrupt
                LISU 4                   ; 0702 64          ; Fülle oberes ISAR mit 4x
                LISL 3                   ; 0703 6b          ; Fülle unteres ISAR mit x3
                LR   A,(IS)              ; 0704 4c
                XI   $90                 ; 0705 23 90
                LR   (IS),A              ; 0707 5c
                LISU 6                   ; 0708 66          ; Fülle oberes ISAR mit 6x
                LR   A,(IS)              ; 0709 4c
                NI   $1                  ; 070a 21 01
                LR   (IS)+,A             ; 070c 5d
                LISU 4                   ; 070d 64          ; Fülle oberes ISAR mit 4x
                LR   A,(IS)              ; 070e 4c
                OI   $40                 ; 070f 22 40
                LR   (IS),A              ; 0711 5c
                JMP  $4650               ; 0712 29 46 50
                INS  1                   ; 0715 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0716 21 f8       ; lösche erste 3 bit
                AI   $3                  ; 0718 24 03       ; Addiere 3, bit 0 und 1 = 1
                OUTS 1                   ; 071a b1          ; Schreibe Port 1 (xxxx x011), wird invertiert ausgegeben   -> WW (Comparator Window Wide)
                PI   $45b1               ; 071b 28 45 b1    ; PC1 = 0x71e, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LIS  $2                  ; 071e 72          ; Akku = 0x02
                LR   $0                  ; 071f 50          ; Schreibe Akku (0x02) in Scratchpad 0
A720:           DS   $0                  ; 0720 30
                LIS  $1                  ; 0721 71          ; Akku = 0x01
                NS   $5                  ; 0722 f5
                BF   $4                  ; 0723 94 08
                PI   $43f7               ; 0725 28 43 f7    ; PC1 = 0x728, Call Subroutine 0x3f7
                BF   $0                  ; 0728 90 14
                BF   $0                  ; 072a 90 06
A72c:           PI   $43c6               ; 072c 28 43 c6    ; PC1 = 0x72f, Call Subroutine 0x3c6
                BF   $0                  ; 072f 90 0d
A731:           LISU 5                   ; 0731 65          ; Fülle oberes ISAR mit 5x
                LISL 4                   ; 0732 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0733 4c
                SR   4                   ; 0734 14
                BF   $4                  ; 0735 94 ea
                DS   $0                  ; 0737 30
                BF   $4                  ; 0738 94 04
                JMP  $479d               ; 073a 29 47 9d
A73d:           PI   $4807               ; 073d 28 48 07    ; PC1 = 0x740, Call Subroutine 0x807
                LIS  $a                  ; 0740 7a          ; Akku = 0x0a
                LR   $7                  ; 0741 57          ; Scratchpad 7 = 0x0a
                LISU 4                   ; 0742 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0743 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 0744 4c          ; Lade Akku ab Scratchpad 47
                NI   $7f                 ; 0745 21 7f       ; Lösche bit 7
                LR   (IS),A              ; 0747 5c          ; Speichere Akku in Scratchpad 47
A748:           JMP  $4dc6               ; 0748 29 4d c6
; Einsprung von 0xddf
                DS   $7                  ; 074b 37          ; Decrementiere Scratchpad 7
                LR   A,$7                ; 074c 47          ; Lade Akku ab Scratchpad 7
                SL   1                   ; 074d 13          ; Schiebe 1 links
                BF   $4                  ; 074e 94 f9       ; Branch wenn nicht null um -7 nach 0x748
                DI                       ; 0750 1a          ; Disable Interrupt
                LISU 4                   ; 0751 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0752 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 0753 4c
                OI   $80                 ; 0754 22 80
                LR   (IS),A              ; 0756 5c
                LISU 2                   ; 0757 62          ; Fülle oberes ISAR mit 2x
                LISL 5                   ; 0758 6d          ; Fülle unteres ISAR mit x5
                LR   A,$7                ; 0759 47          ; Lade Akku ab Scratchpad 7
                SR   1                   ; 075a 12          ; Schiebe 1 rechts
                SL   1                   ; 075b 13          ; Schiebe 1 links
                BT   1                   ; 075c 81 04       ; Branch wenn positiv (bit 7 = 0) um +4 nach 0x761
                JMP  $47ca               ; 075e 29 47 ca
A761:           LR   A,(IS)+             ; 0761 4d          ; Lade Akku ab Scratchpad 25, inc ISAR
                SL   1                   ; 0762 13          ; Schiebe 1 links
                SL   1                   ; 0763 13          ; Schiebe 1 links
                BT   1                   ; 0764 81 06       ; Branch wenn positiv (bit 7 = 0, STLY stereo only = 0) um +6 nach 0x76b
                LR   A,(IS)              ; 0766 4c          ; Lade Akku ab Scratchpad 26
                SL   1                   ; 0767 13          ; Schiebe 1 links
                SL   1                   ; 0768 13          ; Schiebe 1 links
                BF   $1                  ; 0769 91 11       ; Branch wenn negativ (bit 7 = 1, THSTE = 1) um +11 nach 0x77b
A76b:           LISL 4                   ; 076b 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 076c 4c          ; Lade Akku ab Scratchpad 24
                SL   1                   ; 076d 13          ; Schiebe 1 links
                SL   1                   ; 076e 13          ; Schiebe 1 links
                BF   $1                  ; 076f 91 0b       ; Branch wenn negativ (bit 7 = 1, THSTA = 1) um +b nach 0x77b
                LR   A,(IS)-             ; 0771 4e          ; Lade Akku ab Scratchpad 24, dec ISAR
                NI   $10                 ; 0772 21 10       ; Nur bit 4 (FH)
                BT   4                   ; 0774 84 06       ; Branch wenn null, FH = 0 um +6 nach 0x77b
                LR   A,(IS)              ; 0776 4c          ; Lade Akku ab Scratchpad 23
                NI   $10                 ; 0777 21 10       ; Nur bit 4 (FL)
                BT   4                   ; 0779 84 18       ; Branch wenn null, FL = 0 um +18 nach 0x792
A77b:           LIS  $4                  ; 077b 74          ; Akku = 0x04
                LR   $0                  ; 077c 50          ; Schreibe Akku (0x04) in Scratchpad 0
A77d:           LIS  $1                  ; 077d 71          ; Akku = 0x01
                NS   $5                  ; 077e f5          ; Akku &= Scratchpad 5
                BF   $4                  ; 077f 94 08       ; Branch wenn nicht null um +8 nach 0x788
                PI   $43f7               ; 0781 28 43 f7    ; PC1 = 0x784, Call Subroutine 0x3f7
                BF   $0                  ; 0784 90 b8
                BF   $0                  ; 0786 90 06
A788:           PI   $43c6               ; 0788 28 43 c6    ; PC1 = 0x78b, Call Subroutine 0x3c6
                BF   $0                  ; 078b 90 b1
A78d:           DS   $0                  ; 078d 30
                BF   $4                  ; 078e 94 ee
A790:           BF   $0                  ; 0790 90 ac

A792:           INS  1                   ; 0792 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0793 21 f8       ; lösche erste 3 bit
                AI   $3                  ; 0795 24 03       ; addiere 3
                OUTS 1                   ; 0797 b1          ; Schreibe Port 1 (xxxx x011), wird invertiert ausgegeben   -> WW (Comparator Window Wide)
                PI   $45bf               ; 0798 28 45 bf    ; PC1 = 0x79b, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                BF   $0                  ; 079b 90 28       ; Branch immer nach 0x7c4
                
                INS  1                   ; 079d a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 079e 21 f8       ; lösche erste 3 bit
                AI   $3                  ; 07a0 24 03       ; addiere 3
                OUTS 1                   ; 07a2 b1          ; Schreibe Port 1 (xxxx x011), wird invertiert ausgegeben   -> WW (Comparator Window Wide)
                PI   $45bf               ; 07a3 28 45 bf    ; PC1 = 0x7a6, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
A7a6:           LIS  $2                  ; 07a6 72          ; Akku = 0x02
                LR   $0                  ; 07a7 50          ; Schreibe Akku (0x02) in Scratchpad 0
A7a8:           LIS  $1                  ; 07a8 71          ; Akku = 0x01
                NS   $5                  ; 07a9 f5
                BF   $4                  ; 07aa 94 08
                PI   $43f7               ; 07ac 28 43 f7    ; PC1 = 0x7af, Call Subroutine 0x3f7
                BF   $0                  ; 07af 90 e0
                BF   $0                  ; 07b1 90 06
A7b3:           PI   $43c6               ; 07b3 28 43 c6    ; PC1 = 0x7b6, Call Subroutine 0x3c6
                BF   $0                  ; 07b6 90 d9
A7b8:           DS   $0                  ; 07b8 30
                BF   $4                  ; 07b9 94 ee
                PI   $4807               ; 07bb 28 48 07    ; PC1 = 0x7be, Call Subroutine 0x807
                LISU 4                   ; 07be 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 07bf 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 07c0 4c
                OI   $10                 ; 07c1 22 10
                LR   (IS),A              ; 07c3 5c

A7c4:           LI   $8a                 ; 07c4 20 8a       ; Akku = 0x8a
                LR   $7                  ; 07c6 57          ; Scratchpad 7 = 0x8a
                JMP  $4742               ; 07c7 29 47 42
; Einsprung von 0x75e
                LR   A,(IS)              ; 07ca 4c
                SL   1                   ; 07cb 13
                SL   1                   ; 07cc 13
                BT   1                   ; 07cd 81 0d
                LISL 1                   ; 07cf 69          ; Fülle unteres ISAR mit x1
                LR   A,(IS)              ; 07d0 4c
                SL   1                   ; 07d1 13
                SL   1                   ; 07d2 13
                BF   $1                  ; 07d3 91 20       ; Branch wenn negativ (bit 7 = 1) um +20 nach 0x7f4
                LISL 6                   ; 07d5 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 07d6 4c
                SL   1                   ; 07d7 13
                SL   1                   ; 07d8 13
                BF   $1                  ; 07d9 91 1a       ; Branch wenn negativ (bit 7 = 1) um +1a nach 0x7f4 
A7db:           LISL 4                   ; 07db 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 07dc 4c
                SL   1                   ; 07dd 13
                SL   1                   ; 07de 13
                BF   $1                  ; 07df 91 14       ; Branch wenn negativ (bit 7 = 1) um +14 nach 0x7f4
                LR   A,(IS)-             ; 07e1 4e
                NI   $10                 ; 07e2 21 10
                BT   4                   ; 07e4 84 0f
                LR   A,(IS)              ; 07e6 4c
                NI   $10                 ; 07e7 21 10
                BF   $4                  ; 07e9 94 0a
                LISU 4                   ; 07eb 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 07ec 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 07ed 4c
                OI   $90                 ; 07ee 22 90
                LR   (IS),A              ; 07f0 5c
                JMP  $4dc6               ; 07f1 29 4d c6
A7f4:           LISU 4                   ; 07f4 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 07f5 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 07f6 4c
                NI   $10                 ; 07f7 21 10
                BT   4                   ; 07f9 84 ac
                INS  1                   ; 07fb a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 07fc 21 f8       ; lösche erste 3 bit
                AI   $3                  ; 07fe 24 03       ; addiere 3
CartridgeStart: OUTS 1                   ; 0800 b1          ; Schreibe Port 1 (xxxx x011), wird invertiert ausgegeben   -> WW (Comparator Window Wide)
                PI   $45b1               ; 0801 28 45 b1    ; PC1 = 0x804, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                JMP  $477b               ; 0804 29 47 7b
                LR   K,P                 ; 0807 08
                LR   A,KU                ; 0808 00          ; Lade Akku mit Scratchpad 12
                LR   QU,A                ; 0809 06          ; Speichere Akku in Scratchpad 14
                LR   A,KL                ; 080a 01          ; Lade Akku mit Scratchpad 13
                LR   QL,A                ; 080b 07          ; Speichere Akku in Scratchpad 15
                PI   $41cf               ; 080c 28 41 cf    ; PC1 = 0x80f, Call Subroutine 0x1cf
                PI   $4173               ; 080f 28 41 73    ; PC1 = 0x812, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LISU 4                   ; 0812 64          ; Fülle oberes ISAR mit 4x
                PI   $4173               ; 0813 28 41 73    ; PC1 = 0x816, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LISL 7                   ; 0816 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 0817 4c
                NI   $ef                 ; 0818 21 ef
                LR   (IS),A              ; 081a 5c
                JMP  $4aad               ; 081b 29 4a ad
                LISU 2                   ; 081e 62          ; Fülle oberes ISAR mit 2x
                LISL 2                   ; 081f 6a          ; Lade unteres ISAR mit x2
                LR   A,(IS)              ; 0820 4c          ; Lade Akku ab Scratchpad 22
                SL   1                   ; 0821 13          ; Schiebe 1 links
                BT   1                   ; 0822 81 07       ; Branch wenn positiv (bit 7 = 0), LSNE = 0, um +7 nach 0x82a
A824:           PI   $45cd               ; 0824 28 45 cd    ; PC1 = 0x827, Call Subroutine 0x5cd
                JMP  $48bc               ; 0827 29 48 bc
A82a:           PI   $4106               ; 082a 28 41 06    ; PC1 = 0x82d, Call Subroutine 0x106 -> HandleInputsKS
                BF   $0                  ; 082d 90 46       ; Taste 1..9 gedrückt, Branch immer um +0x46 nach 0x874
                LISL 3                   ; 082f 6b          ; Fülle unteres ISAR mit x3
                LR   A,(IS)+             ; 0830 4d
                SL   1                   ; 0831 13
                BT   1                   ; 0832 81 10
                LR   A,$5                ; 0834 45
                NI   $fe                 ; 0835 21 fe
A837:           LR   $5                  ; 0837 55
                LR   A,$6                ; 0838 46          ; Lade Scratchpad 6 in Akku
                NI   $10                 ; 0839 21 10
                BF   $4                  ; 083b 94 36
                PI   $45cd               ; 083d 28 45 cd    ; PC1 = 0x840, Call Subroutine 0x5cd
                JMP  $4359               ; 0840 29 43 59
A843:           LR   A,(IS)              ; 0843 4c
                SL   1                   ; 0844 13
                BT   1                   ; 0845 81 06
                LR   A,$5                ; 0847 45
                OI   $1                  ; 0848 22 01
                BF   $0                  ; 084a 90 ec
A84c:           LISU 2                   ; 084c 62          ; Fülle oberes ISAR mit 2x
                LISL 0                   ; 084d 68          ; Fülle unteres ISAR mit x0
                LR   A,(IS)              ; 084e 4c          ; Lade Akku ab Scratchpad 20
                SL   1                   ; 084f 13          ; Schiebe 1 links
                BT   1                   ; 0850 81 1e       ; Branch wenn positiv (bit 7 = 0, STME = 0) um +1e nach 0x86f
                LR   A,$6                ; 0852 46          ; Lade Scratchpad 6 in Akku
                SL   1                   ; 0853 13
                SL   1                   ; 0854 13
                BF   $1                  ; 0855 91 63       ; Branch wenn negativ (bit 7 = 1) um +63 nach 0x8b9 
; Setze bit 5 in Scratchpad 6
                LR   A,$6                ; 0857 46          ; Lade Scratchpad 6 in Akku
                OI   $20                 ; 0858 22 20       ; Setze bit 5
                LR   $6                  ; 085a 56          ; Speichere Akku in Scratchpad 6
                
                LR   A,$5                ; 085b 45
                SL   1                   ; 085c 13
                SL   1                   ; 085d 13
                BT   1                   ; 085e 81 09
                LR   A,$6                ; 0860 46          ; Lade Scratchpad 6 in Akku
                NI   $10                 ; 0861 21 10
                BF   $4                  ; 0863 94 c0
                JMP  $4647               ; 0865 29 46 47
A868:           LR   A,$5                ; 0868 45
                OI   $20                 ; 0869 22 20
                LR   $5                  ; 086b 55
                JMP  $4438               ; 086c 29 44 38 -> LoadAntennaWith0x0101
A86f:           PI   $4210               ; 086f 28 42 10    ; PC1 = 0x872, Call Subroutine 0x210
A872:           BF   $0                  ; 0872 90 46

A874:           LR   A,$3                ; 0874 43          ; Lade Scratchpad 3, steht gedrückte Taste drin 1..9 oder 0 wenn keine
                SL   1                   ; 0875 13          ; Schiebe 1 bit links, 
                BT   4                   ; 0876 84 1a       ; Branch wenn null um +1a nach 0x891, eigentlich nur wenn keine Taste gedrückt 
                LR   A,$5                ; 0878 45
                NI   $10                 ; 0879 21 10
                BT   4                   ; 087b 84 07
                LR   DC,H                ; 087d 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                LM                       ; 087e 16          ; Kopiere Inhalt von 0xffc in Akku
                XI   $80                 ; 087f 23 80       ; Toggle bit 7 im Akku
                LR   DC,H                ; 0881 10          ; Kopiere Scratchpad 10,11 nach DC0 Register, enthält 0xffc
                ST                       ; 0882 17          ; Speichere zurück an 0xffc
A883:           LR   A,$5                ; 0883 45
                NI   $2f                 ; 0884 21 2f
                LR   $5                  ; 0886 55
                SL   1                   ; 0887 13
                SL   1                   ; 0888 13
                BT   1                   ; 0889 81 04
                JMP  $4458               ; 088b 29 44 58
A88e:           JMP  $4274               ; 088e 29 42 74

A891:           LR   A,$5                ; 0891 45
                NI   $10                 ; 0892 21 10
                LR   A,$5                ; 0894 45
                BT   4                   ; 0895 84 05
                NI   $ef                 ; 0897 21 ef
                BF   $0                  ; 0899 90 03
A89b:           OI   $10                 ; 089b 22 10
A89d:           LR   $5                  ; 089d 55
                LISU 4                   ; 089e 64          ; Fülle oberes ISAR mit 4x
                LISL 3                   ; 089f 6b          ; Fülle unteres ISAR mit x3
                LR   A,(IS)              ; 08a0 4c
                XI   $90                 ; 08a1 23 90
                LR   (IS),A              ; 08a3 5c
                LISU 6                   ; 08a4 66          ; Fülle oberes ISAR mit 6x
                LR   (IS),A              ; 08a5 5c
                LISU 4                   ; 08a6 64          ; Fülle oberes ISAR mit 4x
                DI                       ; 08a7 1a          ; Disable Interrupt
                LR   A,$4                ; 08a8 44          ; Kopiere Scratchpad 4 in Akku
                LR   QU,A                ; 08a9 06          ; Speichere Akku in Scratchpad 14
                LR   A,$2                ; 08aa 42          ; Lade Akku ab Scratchpad 2
                LR   $9                  ; 08ab 59          ; Schreibe Akku (Scratchpad 2) in Scratchpad 9
                LIS  $0                  ; 08ac 70          ; Akku = 0
                LR   $4                  ; 08ad 54          ; Scratchpad 4 = 0
                LI   $d7                 ; 08ae 20 d7       ; Akku = 0xd7
                LR   $2                  ; 08b0 52          ; Schreibe Akku (0xd7) in Scratchpad 2
                PI   $4173               ; 08b1 28 41 73    ; PC1 = 0x8b4, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                LR   A,QU                ; 08b4 02          ; Lade Akku ab Scratchpad 14
                LR   $4                  ; 08b5 54          ; Speichere Akku in Scratchpad 4
                LR   A,$9                ; 08b6 49          ; Lade Akku ab Scratchpad 9
                LR   $2                  ; 08b7 52          ; Schreibe Akku (Scratchpad 9) in Scratchpad 2
                EI                       ; 08b8 1b
A8b9:           JMP  $4dc6               ; 08b9 29 4d c6
A8bc:           DI                       ; 08bc 1a          ; Disable Interrupt
                LISU 6                   ; 08bd 66          ; Fülle oberes ISAR mit 6x
                LISL 1                   ; 08be 69          ; Fülle unteres ISAR mit x1
                LIS  $0                  ; 08bf 70          ; Akku = 0
                OUT  $6                  ; 08c0 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                LR   $4                  ; 08c2 54          ; Scratchpad 4 = 0
                LR   (IS)-,A             ; 08c3 5e
                LR   (IS),A              ; 08c4 5c
                LISU 7                   ; 08c5 67          ; Fülle oberes ISAR mit 7x
                LR   (IS)+,A             ; 08c6 5d
                LR   (IS),A              ; 08c7 5c
                LISU 5                   ; 08c8 65          ; Fülle oberes ISAR mit 5x
                LR   (IS)-,A             ; 08c9 5e
                LR   (IS),A              ; 08ca 5c
                LISU 4                   ; 08cb 64          ; Fülle oberes ISAR mit 4x
                LR   (IS)+,A             ; 08cc 5d
                LR   (IS),A              ; 08cd 5c
                LI   $b7                 ; 08ce 20 b7       ; Akku = 0xb7
                LR   $2                  ; 08d0 52          ; Schreibe Akku (0xb7) in Scratchpad 2
                PI   $4173               ; 08d1 28 41 73    ; PC1 = 0x8d4, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                LISU 5                   ; 08d4 65          ; Fülle oberes ISAR mit 5x
                PI   $4173               ; 08d5 28 41 73    ; PC1 = 0x8d8, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LR   A,$5                ; 08d8 45
                OI   $4                  ; 08d9 22 04
                LR   $5                  ; 08db 55
; Setze bit 4, lösche bit 0 und 1 in Scratchpad 6
                LR   A,$6                ; 08dc 46          ; Lade Scratchpad 6 in Akku
                OI   $10                 ; 08dd 22 10       ; Setze bit 4
                NI   $fc                 ; 08df 21 fc       ; Lösche bit 0 und 1
                LR   $6                  ; 08e1 56          ; Speichere Akku in Scratchpad 6
                JMP  $4aad               ; 08e2 29 4a ad

; Jump von 0xcc2
; Scratch44SetBit3ClrBit6
                LISU 4                   ; 08e5 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 08e6 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 08e7 4c          ; Lade Akku ab Scratchpad 44
                OI   $8                  ; 08e8 22 08       ; Setze bit 3 -> Anwahl PLAY
                NI   $bf                 ; 08ea 21 bf       ; Lösche bit 6
                LR   (IS),A              ; 08ec 5c          ; Schreibe Scratchoad 44
                PI   $4ed2               ; 08ed 28 4e d2    ; PC1 = 0x8f0, Call Subroutine 0xed2
                LISU 5                   ; 08f0 65          ; Fülle oberes ISAR mit 5x
                LISL 6                   ; 08f1 6e          ; Fülle unteres ISAR mit x6
                LIS  $f                  ; 08f2 7f          ; Akku = 0x0f
                LR   (IS),A              ; 08f3 5c
                LIS  $8                  ; 08f4 78          ; Akku = 0x08
                LR   $7                  ; 08f5 57          ; Scratchpad 7 = 0x08

; Jump von 0x98d
A8f6:           EI                       ; 08f6 1b
                PI   $40cd               ; 08f7 28 40 cd    ; PC1 = 0x8fa, Call Subroutine 0x0cd -> LoadInputsWitchCheck
                JMP  $4ef9               ; 08fa 29 4e f9
                LI   $b7                 ; 08fd 20 b7       ; Akku = 0xb7
                LR   $2                  ; 08ff 52          ; Schreibe Akku (0xb7) in Scratchpad 2
                PI   $4106               ; 0900 28 41 06    ; PC1 = 0x903, Call Subroutine 0x106 -> HandleInputsKS
                BF   $0                  ; 0903 90 3b       ; Taste 1..9 gedrückt , Branch immer um +3b nach 0x93f
                LISU 2                   ; 0905 62          ; Fülle oberes ISAR mit 2x
                LISL 2                   ; 0906 6a          ; Lade unteres ISAR mit x2
                LR   A,(IS)              ; 0907 4c          ; Lade Akku ab Scratchpad 22
                SL   1                   ; 0908 13          ; Schiebe 1 links
                BT   1                   ; 0909 81 0b       ; Branch wenn positiv (bit 7 = 0), LSNE = 0, um +b nach 0x915
                LIS  $4                  ; 090b 74          ; Akku = 0x04
                NS   $6                  ; 090c f6          ; Akku &= Scratchpad 6
                BF   $4                  ; 090d 94 e8       ; Branch wenn nicht null, bit 2 in Scratchpad 6 war gesetzt, um -24byte nach 0x8f6
; Setze bit 2 in Scratchpad 6
                LR   A,$6                ; 090f 46          ; Lade Scratchpad 6 in Akku
                OI   $4                  ; 0910 22 04       ; Setze bit 2
                LR   $6                  ; 0912 56          ; Speichere Akku in Scratchpad 6
                BF   $0                  ; 0913 90 a8       ; Branch immer um -88 byte nach 0x8bc
; Lösche bit 2 in Scratchpad 6
A915:           LR   A,$6                ; 0915 46          ; Lade Scratchpad 6 in Akku
                NI   $fb                 ; 0916 21 fb       ; Lösche bit 2
                LR   $6                  ; 0918 56          ; Speichere Akku in Scratchpad 6
                
                PI   $4210               ; 0919 28 42 10    ; PC1 = 0x91c, Call Subroutine 0x210
                LR   A,$7                ; 091c 47          ; Lade Akku ab Scratchpad 7
                SL   4                   ; 091d 15
                BT   1                   ; 091e 81 d7
                LISU 2                   ; 0920 62          ; Fülle oberes ISAR mit 2x
                LISL 0                   ; 0921 68          ; Fülle unteres ISAR mit x0
                LR   A,(IS)              ; 0922 4c          ; Lade Akku ab Scratchpad 20
                SL   1                   ; 0923 13          ; Schiebe 1 links
                BT   1                   ; 0924 81 14       ; Branch wenn positiv (bit 7 = 0, STME = 0) um +14 nach 0x939
                LR   A,$6                ; 0926 46          ; Lade Scratchpad 6 in Akku
                SL   1                   ; 0927 13
                SL   1                   ; 0928 13
                BF   $1                  ; 0929 91 cc       ; Branch wenn negativ (bit 7 = 1) um -52 bytes 0x8f6
                LISU 4                   ; 092b 64          ; Fülle oberes ISAR mit 4x
                LISL 1                   ; 092c 69          ; Fülle unteres ISAR mit x1
                LR   A,(IS)              ; 092d 4c
                CI   $0                  ; 092e 25 00
                BF   $4                  ; 0930 94 c5
                LR   A,$5                ; 0932 45
                NI   $fb                 ; 0933 21 fb
                LR   $5                  ; 0935 55
                JMP  $4857               ; 0936 29 48 57
; Lösche bit 5 in Scratchpad 6
A939:           LR   A,$6                ; 0939 46          ; Lade Scratchpad 6 in Akku
                NI   $df                 ; 093a 21 df       ; Lösche bit 5
                LR   $6                  ; 093c 56          ; Speichere Akku in Scratchpad 6                
                BF   $0                  ; 093d 90 b8       ; Branch immer um +b8 nach 0x9f6

A93f:           LR   A,$7                ; 093f 47          ; Lade Akku ab Scratchpad 7
                SL   4                   ; 0940 15
                BF   $1                  ; 0941 91 13       ; Branch wenn negativ (bit 7 = 1) um +13 nach 0x955
                SL   1                   ; 0943 13
                BF   $1                  ; 0944 91 61       ; Branch wenn negativ (bit 7 = 1) um +61 nach 0x0a6 
                SL   1                   ; 0946 13
                BT   1                   ; 0947 81 04
                JMP  $49de               ; 0949 29 49 de
A94c:           SL   1                   ; 094c 13
                BT   1                   ; 094d 81 04
                JMP  $4a17               ; 094f 29 4a 17
A952:           JMP  $4a4e               ; 0952 29 4a 4e
A955:           LISU 4                   ; 0955 64          ; Fülle oberes ISAR mit 4x
                LISL 1                   ; 0956 69          ; Fülle unteres ISAR mit x1
                LR   A,$3                ; 0957 43
                CI   $8                  ; 0958 25 08
                BF   $4                  ; 095a 94 05
                LI   $fe                 ; 095c 20 fe       ; Akku = 0xfe
                BF   $0                  ; 095e 90 07       ; Branch immer im +7 nach 0x966
A960:           CI   $9                  ; 0960 25 09
                BF   $4                  ; 0962 94 09       ; Branch wenn nicht null um +9 nach 0x96c
                LI   $be                 ; 0964 20 be       ; Akku = 0xbe
A966:           LR   (IS),A              ; 0966 5c
                LISU 6                   ; 0967 66          ; Fülle oberes ISAR mit 6x
                LR   (IS)-,A             ; 0968 5e
                JMP  $49c1               ; 0969 29 49 c1
A96c:           CI   $1                  ; 096c 25 01       ; Rechne 1 - Akku
                BT   4                   ; 096e 84 21       ; Branch wenn 0 (Akku ist 1) um +21 nach 0x990
                DCI  $4a8f               ; 0970 2a 4a 8f    ; Schreibe 0x4a8f in DC0
                ADC                      ; 0973 8e          ; Addiere Akku zu DC0
                LM                       ; 0974 16
                LR   (IS)-,A             ; 0975 5e
                LISU 7                   ; 0976 67          ; Fülle oberes ISAR mit 7x
                LIS  $8                  ; 0977 78          ; Akku = 0x08
                LR   (IS),A              ; 0978 5c
                LISU 5                   ; 0979 65          ; Fülle oberes ISAR mit 5x
                LR   (IS)+,A             ; 097a 5d
                PI   $4173               ; 097b 28 41 73    ; PC1 = 0x97e, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LISU 6                   ; 097e 66          ; Fülle oberes ISAR mit 6x
                LISL 1                   ; 097f 69          ; Fülle unteres ISAR mit x1
                LIS  $0                  ; 0980 70          ; Akku = 0
                LR   (IS),A              ; 0981 5c

; Jump von diversen Orten
A982:           LIS  $0                  ; 0982 70          ; Akku = 0
                LR   $8                  ; 0983 58          ; Scratchpad 8 = 0x00
                LI   $3f                 ; 0984 20 3f       ; Akku = 0x3f
                LR   $4                  ; 0986 54          ; Scratchpad 4 = 0x3f
                LI   $b7                 ; 0987 20 b7       ; Akku = 0xb7
                LR   $2                  ; 0989 52          ; Scratchpad 2 = 0xb7
                PI   $4025               ; 098a 28 40 25    ; PC1 = 0x98d, Call Subroutine 0x025
                JMP  $48f6               ; 098d 29 48 f6
A990:           LR   (IS),A              ; 0990 5c
                LISU 6                   ; 0991 66          ; Fülle oberes ISAR mit 6x
                LR   (IS)-,A             ; 0992 5e
                LIS  $0                  ; 0993 70          ; Akku = 0
                LR   $4                  ; 0994 54          ; Scratchpad 4 = 0
                LISU 7                   ; 0995 67          ; Fülle oberes ISAR mit 7x
                LIS  $8                  ; 0996 78          ; Akku = 0x08
                LR   (IS),A              ; 0997 5c
                LISU 5                   ; 0998 65          ; Fülle oberes ISAR mit 5x
                LR   (IS)+,A             ; 0999 5d
                PI   $4173               ; 099a 28 41 73    ; PC1 = 0x99d, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LISU 4                   ; 099d 64          ; Fülle oberes ISAR mit 4x
                PI   $4173               ; 099e 28 41 73    ; PC1 = 0x9a1, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LIS  $4                  ; 09a1 74          ; Akku = 0x04
                LR   $7                  ; 09a2 57          ; Scratchpad 7 = 0x04
                JMP  $4982               ; 09a3 29 49 82
A9a6:           LISU 4                   ; 09a6 64          ; Fülle oberes ISAR mit 4x
                LISL 1                   ; 09a7 69          ; Fülle unteres ISAR mit x1
                LR   A,$3                ; 09a8 43
                CI   $0                  ; 09a9 25 00
                BF   $4                  ; 09ab 94 08
                LI   $f7                 ; 09ad 20 f7       ; Akku = 0xf7
                LR   (IS),A              ; 09af 5c
                LISU 6                   ; 09b0 66          ; Fülle oberes ISAR mit 6x
                LR   (IS)-,A             ; 09b1 5e
                BF   $0                  ; 09b2 90 0e
A9b4:           DCI  $4a8f               ; 09b4 2a 4a 8f    ; Schreibe 0x4a8f in DC0
                ADC                      ; 09b7 8e          ; Addiere Akku zu DC0
                LM                       ; 09b8 16
                OI   $1                  ; 09b9 22 01
                LR   (IS),A              ; 09bb 5c
                LISU 6                   ; 09bc 66          ; Fülle oberes ISAR mit 6x
                LIS  $1                  ; 09bd 71          ; Akku = 0x01
                LR   (IS),A              ; 09be 5c
                BF   $0                  ; 09bf 90 c2
A9c1:           LIS  $0                  ; 09c1 70          ; Akku = 0
                LR   $4                  ; 09c2 54          ; Scratchpad 4 = 0
                LISU 7                   ; 09c3 67          ; Fülle oberes ISAR mit 7x
                LIS  $8                  ; 09c4 78          ; Akku = 0x08
                LR   (IS),A              ; 09c5 5c
                LISU 5                   ; 09c6 65          ; Fülle oberes ISAR mit 5x
                LR   (IS),A              ; 09c7 5c
                LISL 6                   ; 09c8 6e          ; Fülle unteres ISAR mit x6
                LR   A,$3                ; 09c9 43
                CI   $0                  ; 09ca 25 00
                BF   $4                  ; 09cc 94 03
                LI   $10                 ; 09ce 20 10       ; Akku = 0x10
A9d0:           LR   (IS),A              ; 09d0 5c
                LISL 1                   ; 09d1 69          ; Fülle unteres ISAR mit x1
                PI   $4173               ; 09d2 28 41 73    ; PC1 = 0x9d5, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LISU 4                   ; 09d5 64          ; Fülle oberes ISAR mit 4x
                PI   $4173               ; 09d6 28 41 73    ; PC1 = 0x9d9, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LIS  $2                  ; 09d9 72          ; Akku = 0x02
                LR   $7                  ; 09da 57          ; Scratchpad 7 = 0x02
                JMP  $4982               ; 09db 29 49 82
                LISU 7                   ; 09de 67          ; Fülle oberes ISAR mit 7x
                LISL 1                   ; 09df 69          ; Fülle unteres ISAR mit x1
                LR   A,$3                ; 09e0 43
                DCI  $4a8f               ; 09e1 2a 4a 8f    ; Schreibe 0x4a8f in DC0
                ADC                      ; 09e4 8e          ; Addiere Akku zu DC0
                LM                       ; 09e5 16
                LR   (IS),A              ; 09e6 5c
                LISU 5                   ; 09e7 65          ; Fülle oberes ISAR mit 5x
                LR   (IS),A              ; 09e8 5c
                LISL 6                   ; 09e9 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)-             ; 09ea 4e
                SL   4                   ; 09eb 15
                CI   $90                 ; 09ec 25 90
                BT   4                   ; 09ee 84 1a
                CI   $80                 ; 09f0 25 80
                BF   $4                  ; 09f2 94 08
                LR   A,$3                ; 09f4 43
                AI   $f9                 ; 09f5 24 f9
                BT   2                   ; 09f7 82 11
                BF   $0                  ; 09f9 90 06
A9fb:           LR   A,$3                ; 09fb 43
                AI   $f8                 ; 09fc 24 f8
                BF   $2                  ; 09fe 92 0a
Aa00:           LISU 7                   ; 0a00 67          ; Fülle oberes ISAR mit 7x
                LISL 1                   ; 0a01 69          ; Fülle unteres ISAR mit x1
                LIS  $0                  ; 0a02 70          ; Akku = 0
                LR   (IS)-,A             ; 0a03 5e
                LIS  $8                  ; 0a04 78          ; Akku = 0x08
                LR   (IS),A              ; 0a05 5c
                JMP  $4982               ; 0a06 29 49 82
Aa09:           LIS  $0                  ; 0a09 70          ; Akku = 0
                LR   $4                  ; 0a0a 54          ; Scratchpad 4 = 0
                LR   A,$3                ; 0a0b 43
                SL   4                   ; 0a0c 15
                LR   (IS),A              ; 0a0d 5c
                LISL 1                   ; 0a0e 69          ; Fülle unteres ISAR mit x1
                PI   $4173               ; 0a0f 28 41 73    ; PC1 = 0xa12, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LIS  $1                  ; 0a12 71          ; Akku = 0x01
                LR   $7                  ; 0a13 57          ; Scratchpad 7 = 0x01
                JMP  $4982               ; 0a14 29 49 82
                LISU 4                   ; 0a17 64          ; Fülle oberes ISAR mit 4x
                LISL 0                   ; 0a18 68          ; Fülle unteres ISAR mit x0
                LR   A,$3                ; 0a19 43
                DCI  $4a99               ; 0a1a 2a 4a 99    ; Schreibe 0x4a99 in DC0
                ADC                      ; 0a1d 8e          ; Addiere Akku zu DC0
                LM                       ; 0a1e 16
                LR   (IS),A              ; 0a1f 5c
                LISU 6                   ; 0a20 66          ; Fülle oberes ISAR mit 6x
                LR   (IS),A              ; 0a21 5c
                LISU 5                   ; 0a22 65          ; Fülle oberes ISAR mit 5x
                LISL 6                   ; 0a23 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)-             ; 0a24 4e
                SL   4                   ; 0a25 15
                CI   $80                 ; 0a26 25 80
                BF   $4                  ; 0a28 94 16
                LR   A,(IS)              ; 0a2a 4c
                SR   4                   ; 0a2b 14
                CI   $7                  ; 0a2c 25 07
                BF   $4                  ; 0a2e 94 10
                LR   A,$3                ; 0a30 43
                AI   $fb                 ; 0a31 24 fb
                BT   2                   ; 0a33 82 0b
                LISU 4                   ; 0a35 64          ; Fülle oberes ISAR mit 4x
                LISL 1                   ; 0a36 69          ; Fülle unteres ISAR mit x1
                LR   A,(IS)              ; 0a37 4c
                LISU 6                   ; 0a38 66          ; Fülle oberes ISAR mit 6x
                LR   (IS)-,A             ; 0a39 5e
                LIS  $0                  ; 0a3a 70          ; Akku = 0
                LR   (IS),A              ; 0a3b 5c
                JMP  $4982               ; 0a3c 29 49 82
Aa3f:           LIS  $0                  ; 0a3f 70          ; Akku = 0
                LR   $4                  ; 0a40 54          ; Scratchpad 4 = 0
                LR   A,(IS)              ; 0a41 4c
                AS   $3                  ; 0a42 c3
                LR   (IS),A              ; 0a43 5c
                LISU 4                   ; 0a44 64          ; Fülle oberes ISAR mit 4x
                LISL 1                   ; 0a45 69          ; Fülle unteres ISAR mit x1
                PI   $4173               ; 0a46 28 41 73    ; PC1 = 0xa49, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LIS  $0                  ; 0a49 70          ; Akku = 0
                LR   $7                  ; 0a4a 57          ; Scratchpad 7 = 0
                JMP  $4982               ; 0a4b 29 49 82
                LISU 7                   ; 0a4e 67          ; Fülle oberes ISAR mit 7x
                LISL 0                   ; 0a4f 68          ; Fülle unteres ISAR mit x0
                LR   A,$3                ; 0a50 43
                DCI  $4aa3               ; 0a51 2a 4a a3    ; Schreibe 0x4aa3 in DC0
                ADC                      ; 0a54 8e          ; Addiere Akku zu DC0
                LM                       ; 0a55 16
                CI   $0                  ; 0a56 25 00
                BF   $4                  ; 0a58 94 14
                LR   A,$3                ; 0a5a 43
                DCI  $4a99               ; 0a5b 2a 4a 99    ; Schreibe 0x4a99 in DC0
                ADC                      ; 0a5e 8e          ; Addiere Akku zu DC0
                LM                       ; 0a5f 16
                OI   $8                  ; 0a60 22 08
                LR   (IS),A              ; 0a62 5c
                LISU 5                   ; 0a63 65          ; Fülle oberes ISAR mit 5x
                LR   (IS)+,A             ; 0a64 5d
                LR   A,(IS)              ; 0a65 4c
                LISU 7                   ; 0a66 67          ; Fülle oberes ISAR mit 7x
                LR   (IS)-,A             ; 0a67 5e
                LIS  $8                  ; 0a68 78          ; Akku = 0x08
                LR   (IS),A              ; 0a69 5c
                JMP  $4982               ; 0a6a 29 49 82
Aa6d:           LR   (IS),A              ; 0a6d 5c
                LISU 5                   ; 0a6e 65          ; Fülle oberes ISAR mit 5x
                LR   (IS),A              ; 0a6f 5c
                LIS  $0                  ; 0a70 70          ; Akku = 0
                LR   $4                  ; 0a71 54          ; Scratchpad 4 = 0
                LISL 4                   ; 0a72 6c          ; Fülle unteres ISAR mit x4
                LR   A,$3                ; 0a73 43
                SL   4                   ; 0a74 15
                LR   (IS),A              ; 0a75 5c
                SL   1                   ; 0a76 13
                SL   1                   ; 0a77 13
                BT   1                   ; 0a78 81 04
                LIS  $5                  ; 0a7a 75          ; Akku = 0x05
                AS   (IS)                ; 0a7b cc
                LR   (IS),A              ; 0a7c 5c
Aa7d:           LISL 1                   ; 0a7d 69          ; Fülle unteres ISAR mit x1
                PI   $4173               ; 0a7e 28 41 73    ; PC1 = 0xa81, Call Subroutine 0x173 -> WriteToSAAorAntenna
; Lösche bit 4 in Scratchpad 6
                LR   A,$6                ; 0a81 46          ; Lade Scratchpad 6 in Akku
                NI   $ef                 ; 0a82 21 ef       ; Lösche bit 4
                LR   $6                  ; 0a84 56          ; Speichere Akku in Scratchpad 6
                
                LR   A,$5                ; 0a85 45
                NI   $fb                 ; 0a86 21 fb
                LR   $5                  ; 0a88 55
                LIS  $0                  ; 0a89 70          ; Akku = 0
                OUT  $6                  ; 0a8a 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
                JMP  $4aad               ; 0a8c 29 4a ad
; Daten geladen ab 0x1f9, 0x2db, 0x970, 0x9b4, 0x9e1
                db   $f6                 ; 0a8f f6
                db   $14                 ; 0a90 14
                db   $ec                 ; 0a91 ec
                db   $bc                 ; 0a92 bc
                db   $1e                 ; 0a93 1e
                db   $ba                 ; 0a94 ba
                db   $fa                 ; 0a95 fa
                db   $34                 ; 0a96 34
                db   $fe                 ; 0a97 fe
                db   $be                 ; 0a98 be
; Daten geladen ab 0x1ed, 0x300, 0xa1a, 0xa5b
                db   $f5                 ; 0a99 f5
                db   $60                 ; 0a9a 60
                db   $b3                 ; 0a9b b3
                db   $f2                 ; 0a9c f2
                db   $66                 ; 0a9d 66
                db   $d6                 ; 0a9e d6
                db   $d7                 ; 0a9f d7
                db   $70                 ; 0aa0 70
                db   $f7                 ; 0aa1 f7
                db   $f6                 ; 0aa2 f6
; Daten geladen ab 0x203 oder 0x323 oder 0xa51
                db   $fd                 ; 0aa3 fd
                db   $00                 ; 0aa4 00
                db   $bb                 ; 0aa5 bb
                db   $00                 ; 0aa6 00
                db   $00                 ; 0aa7 00
                db   $de                 ; 0aa8 de
                db   $00                 ; 0aa9 00
                db   $78                 ; 0aaa 78
                db   $00                 ; 0aab 00
                db   $00                 ; 0aac 00

; Subroutine
                LISU 4                   ; 0aad 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0aae 6f          ; Fülle unteres ISAR mit x7
                LIS  $1                  ; 0aaf 71          ; Akku = 0x01
                NS   (IS)                ; 0ab0 fc          ; Akku &= Scratchpad 47
                BT   4                   ; 0ab1 84 08       ; Branch wenn null um +8 nach 0xaba     -> Muting überspringen
                INS  1                   ; 0ab3 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0ab4 21 f8       ; lösche erste 3 bit
                OUTS 1                   ; 0ab6 b1          ; Schreibe Port 1 (xxxx x000), wird invertiert ausgegeben   -> MUT (Muting ON)
                PI   $45b1               ; 0ab7 28 45 b1    ; PC1 = 0xaba, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
Aaba:           LR   A,(IS)              ; 0aba 4c          ; Lade Akku ab Scratchpad 47
                NI   $20                 ; 0abb 21 20       ; Akku &= 0x20 (bit 5)
                BT   4                   ; 0abd 84 0e       ; Branch wenn null um +e nach 0xacc
                INS  1                   ; 0abf a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0ac0 21 f8       ; lösche erste 3 bit
                AI   $6                  ; 0ac2 24 06       ; addiere 6
                OUTS 1                   ; 0ac4 b1          ; Schreibe Port 1 (xxxx x110), wird invertiert ausgegeben   -> MC (Meter Control)
                PI   $45b1               ; 0ac5 28 45 b1    ; PC1 = 0xac8, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LR   A,(IS)              ; 0ac8 4c          ; Lade Akku ab Scratchpad 47
                NI   $de                 ; 0ac9 21 de       ; Lösche bit 0 und 5
                LR   (IS),A              ; 0acb 5c          ; Speichere Scratchpad 47
Aacc:           INS  0                   ; 0acc a0          ; Lade Port 0 in Akku
                NI   $fb                 ; 0acd 21 fb       ; Lösche bit 2 -> ST (Stereo) ein
                OUTS 0                   ; 0acf b0          ; Schreibe Port 0
                LR   A,$6                ; 0ad0 46          ; Lade Scratchpad 6 in Akku
                NI   $10                 ; 0ad1 21 10       ; nur bit 4
                BT   4                   ; 0ad3 84 04       ; Branch wenn null (bit 4) um +4 nach 0xad8
                JMP  $4c7b               ; 0ad5 29 4c 7b

Aad8:           PI   $45a5               ; 0ad8 28 45 a5    ; PC1 = 0xadb, Call Subroutine 0x5a5 -> Delay10ms
                LISU 5                   ; 0adb 65          ; Fülle oberes ISAR mit 5x
                LISL 6                   ; 0adc 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 0add 4c          ; Lade Akku ab Scratchpad 56
                LISU 7                   ; 0ade 67          ; Fülle oberes ISAR mit 7x
                LR   (IS)-,A             ; 0adf 5e          ; Kopiere Scratchpad 56 nach Scratchpad 76, dec ISAR
                LISU 5                   ; 0ae0 65          ; Fülle oberes ISAR mit 5x
                LR   A,(IS)              ; 0ae1 4c          ; Lade Akku ab Scratchpad 55
                LISU 7                   ; 0ae2 67          ; Fülle oberes ISAR mit 7x
                LR   (IS)-,A             ; 0ae3 5e          ; Kopiere Scratchpad 55 nach Scratchpad 75, dec ISAR
                LISU 5                   ; 0ae4 65          ; Fülle oberes ISAR mit 5x
                LR   A,(IS)              ; 0ae5 4c          ; Lade Akku ab Scratchpad 54
                LISU 7                   ; 0ae6 67          ; Fülle oberes ISAR mit 7x
                LR   (IS)+,A             ; 0ae7 5d          ; Kopiere Scratchpad 54 nach Scratchpad 74, inc ISAR
                LI   $76                 ; 0ae8 20 76       ; Akku = 0x76 (dez 118)
                ASD  (IS)                ; 0aea dc          ; Akku += Scratchpad 75
                LR   (IS)+,A             ; 0aeb 5d          ; Speichere in Scratchpad 75, inc ISAR
                LIS  $0                  ; 0aec 70          ; Akku = 0
                LNK                      ; 0aed 19          ; Kopiere Überlauf in Akku bit 0
                AI   $67                 ; 0aee 24 67       ; Akku += 0x67
                ASD  (IS)                ; 0af0             ; Akku += Scratchpad 76
                LR   (IS),A              ; 0af1 5c          ; Speichere Akku in Scratchpad 76
                LISU 5                   ; 0af2 65          ; Fülle oberes ISAR mit 5x
                LR   A,(IS)              ; 0af3 4c          ; Lade Akku ab Scratchpad 56
                LISU 3                   ; 0af4 63          ; Fülle oberes ISAR mit 3x
                SL   4                   ; 0af5 15
                BT   4                   ; 0af6 84 13
                CI   $90                 ; 0af8 25 90
                BT   4                   ; 0afa 84 1f
                LI   $64                 ; 0afc 20 64       ; Akku = 0x64
                LR   $0                  ; 0afe 50          ; Schreibe Akku (0x64) in Scratchpad 0
                LIS  $f                  ; 0aff 7f          ; Akku = 0x0f
                LR   $1                  ; 0b00 51          ; Schreibe Akku (0x0f) in Scratchpad 1
                LIS  $9                  ; 0b01 79          ; Akku = 0x09
                LR   (IS)-,A             ; 0b02 5e
                LI   $85                 ; 0b03 20 85       ; Akku = 0x85
                LR   (IS)-,A             ; 0b05 5e
                LIS  $0                  ; 0b06 70          ; Akku = 0
                LR   (IS),A              ; 0b07 5c
                BF   $0                  ; 0b08 90 39
Ab0a:           LI   $58                 ; 0b0a 20 58       ; Akku = 0x58
                LR   $0                  ; 0b0c 50          ; Schreibe Akku (0x58) in Scratchpad 0
                LI   $11                 ; 0b0d 20 11       ; Akku = 0x11
                LR   $1                  ; 0b0f 51          ; Schreibe Akku (0x11) in Scratchpad 1
                LI   $11                 ; 0b10 20 11       ; Akku = 0x11
                LR   (IS)-,A             ; 0b12 5e
                LI   $10                 ; 0b13 20 10       ; Akku = 0x10
                LR   (IS)-,A             ; 0b15 5e
                LIS  $0                  ; 0b16 70          ; Akku = 0
                LR   (IS),A              ; 0b17 5c
                BF   $0                  ; 0b18 90 29
Ab1a:           LI   $c8                 ; 0b1a 20 c8       ; Akku = 0xc8
                LR   $0                  ; 0b1c 50          ; Schreibe Akku (0xc8) in Scratchpad 0
                LIS  $f                  ; 0b1d 7f          ; Akku = 0x0f
                LR   $1                  ; 0b1e 51          ; Schreibe Akku (0x0f) in Scratchpad 1
                LI   $10                 ; 0b1f 20 10       ; Akku = 0x10
                LR   (IS)-,A             ; 0b21 5e
                LR   (IS)-,A             ; 0b22 5e
                LIS  $0                  ; 0b23 70          ; Akku = 0
                LR   (IS),A              ; 0b24 5c
                BF   $0                  ; 0b25 90 1c
Ab27:           LISU 3                   ; 0b27 63          ; Fülle oberes ISAR mit 3x
                LISL 4                   ; 0b28 6c          ; Fülle unteres ISAR mit x4
                LI   $8b                 ; 0b29 20 8b       ; Akku = 0x8b
                ASD  (IS)                ; 0b2b dc          ; Akku += Scratchpad 34
                BF   $2                  ; 0b2c 92 0a
                LR   (IS)+,A             ; 0b2e 5d
Ab2f:           LI   $67                 ; 0b2f 20 67       ; Akku = 0x67
                ASD  (IS)                ; 0b31 dc
                BF   $2                  ; 0b32 92 04
                LR   (IS)+,A             ; 0b34 5d
                BF   $0                  ; 0b35 90 f9
Ab37:           LR   (IS),A              ; 0b37 5c
                LR   A,$0                ; 0b38 40          ; Lade Akku ab Scratchpad 0
                INC                      ; 0b39 1f          ; Inkrementiere Akku
                LR   $0                  ; 0b3a 50          ; Schreibe Akku () in Scratchpad 0
                BF   $2                  ; 0b3b 92 04
                LR   A,$1                ; 0b3d 41          ; Lade Akku ab Scratchpad 1
                LNK                      ; 0b3e 19
                LR   $1                  ; 0b3f 51          ; Schreibe Akku () in Scratchpad 1
Ab40:           LISL 4                   ; 0b40 6c          ; Fülle unteres ISAR mit x4
Ab41:           LISU 3                   ; 0b41 63          ; Fülle oberes ISAR mit 3x
Ab42:           LR   A,(IS)              ; 0b42 4c          ; Lade Akku ab Scratchpad 34
                LISU 7                   ; 0b43 67          ; Fülle oberes ISAR mit 7x
                XS   (IS)+               ; 0b44 ed
                BF   $4                  ; 0b45 94 e1
                BR7  Ab41                ; 0b47 8f f9
                LISL 5                   ; 0b49 6d          ; Fülle unteres ISAR mit x5
                LR   A,$0                ; 0b4a 40          ; Lade Akku ab Scratchpad 0
                COM                      ; 0b4b 18
                LR   (IS)+,A             ; 0b4c 5d
                LR   A,$1                ; 0b4d 41          ; Lade Akku ab Scratchpad 1
                COM                      ; 0b4e 18
                NI   $7f                 ; 0b4f 21 7f
                LR   (IS),A              ; 0b51 5c
                LI   $e7                 ; 0b52 20 e7       ; Akku = 0xe7
                LR   $2                  ; 0b54 52          ; Schreibe Akku (0xe7) in Scratchpad 2
                LIS  $0                  ; 0b55 70          ; Akku = 0
                LR   $4                  ; 0b56 54          ; Scratchpad 4 = 0
                PI   $4173               ; 0b57 28 41 73    ; PC1 = 0xb5a, Call Subroutine 0x173 -> WriteToSAAorAntenna (Synthesizer)
                PI   $45a5               ; 0b5a 28 45 a5    ; PC1 = 0xb5d, Call Subroutine 0x5a5 -> Delay10ms
; Warte bis LOC Signal 0 wird, maximal 10 Durchgänge
                LIS  $a                  ; 0b5d 7a          ; Akku = 0x0a
                LR   $3                  ; 0b5e 53          ; Scratchpad 3 = 0x0a
Ab5f:           PI   $40cd               ; 0b5f 28 40 cd    ; PC1 = 0xb62, Call Subroutine 0x0cd -> LoadInputsWitchCheck
                LISU 2                   ; 0b62 62          ; Fülle oberes ISAR mit 2x
                LISL 7                   ; 0b63 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 0b64 4c          ; Lade Akku Ab Scratchpad 27
                SL   1                   ; 0b65 13          ; Schiebe 1 links
                SL   1                   ; 0b66 13          ; Schiebe 1 links
                BT   1                   ; 0b67 81 04       ; Branch wenn positiv (bit 7 = 0, LOC = 0) um +4 nach 0xb6c      -> LOC Signal
                DS   $3                  ; 0b69 33          ; Dekrementiere Scratchpad 3
                BF   $4                  ; 0b6a 94 f4       ; Branch wenn nicht null um -12 bytes nach 0xb5f
                
Ab6c:           LISU 4                   ; 0b6c 64          ; Fülle oberes ISAR mit 4x
                LR   A,(IS)              ; 0b6d 4c          ; Lade Akku Ab Scratchpad 47
                NI   $10                 ; 0b6e 21 10       ; Lösche alles ausser bit 4
                BF   $4                  ; 0b70 94 02       ; Branch wenn nicht null (bit 4 in Scratchpad 47 gesetzt) um 2 bytes nach 0xb73
                LR   P0,Q                ; 0b72 0d          ; Lade PC0 ab Q Register (Scratchpad 14,15)

Ab73:           PI   $458b               ; 0b73 28 45 8b    ; PC1 = 0xb76, Call Subroutine 0x58b
                LIS  $a                  ; 0b76 7a          ; Akku = 0x0a
                LR   $3                  ; 0b77 53          ; Scratchpad 3 = 0x0a
Ab78:           PI   $40cd               ; 0b78 28 40 cd    ; PC1 = 0xb7b, Call Subroutine 0x0cd -> LoadInputsWitchCheck
                LISU 2                   ; 0b7b 62          ; Fülle oberes ISAR mit 2x
                LISL 6                   ; 0b7c 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 0b7d 4c          ; Lade Akku Ab Scratchpad 26
                SL   1                   ; 0b7e 13          ; Schiebe 1 links
                SL   1                   ; 0b7f 13          ; Schiebe 1 links
                BT   1                   ; 0b80 81 07       ; Branch wenn positiv (bit 7 = 0, THSTE = 0) um +7 nach 0xb88      -> THSTE Signal (Threshold Stereo)
                DS   $3                  ; 0b82 33          ; Dekrementiere Scratchpad 3
                BF   $4                  ; 0b83 94 f4       ; Branch wenn nicht null um -12 bytes nach 0xb78
Ab85:           JMP  $4c4c               ; 0b85 29 4c 4c    ; Springe nach 0xc4c

Ab88:           LISL 1                   ; 0b88 69          ; Fülle unteres ISAR mit x1
                LR   A,(IS)+             ; 0b89 4d          ; Lade Akku ab Scratchpad 21 (Inc ISAR)
                SL   1                   ; 0b8a 13          ; Schiebe 1 links
                SL   1                   ; 0b8b 13          ; Schiebe 1 links
                BF   $1                  ; 0b8c 91 f8       ; Branch wenn negativ (P Pilot presend Signal = 1) um -8 nach 0xb85  (Prüft bit 5 in Scratchpad 21)
                LR   A,(IS)              ; 0b8e 4c          ; Lade Akku ab Scratchpad 22
                SL   1                   ; 0b8f 13          ; Schiebe 1 links
                SL   1                   ; 0b90 13          ; Schiebe 1 links
                BT   1                   ; 0b91 81 04       ; Branch wenn positiv (MONO Signal = 0) um +4 nach 0xb96  (Prüft bit 5 in Scratchpad 22)
                JMP  $4c53               ; 0b93 29 4c 53    ; Springe nach 0xc53
Ab96:           LISL 4                   ; 0b96 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)-             ; 0b97 4e          ; Lade Akku ab Scratchpad 24, dec ISAR
                SL   1                   ; 0b98 13          ; Schiebe 1 links
                SL   1                   ; 0b99 13          ; Schiebe 1 links
                BT   1                   ; 0b9a 81 09       ; Branch wenn positiv (THSTA Signal = 0) um +9 nach 0xba4  (Prüft bit 5 in Scratchpad 24)       
                LR   A,(IS)              ; 0b9c 4c          ; Lade Akku ab Scratchpad 23
                SL   1                   ; 0b9d 13          ; Schiebe 1 links
                SL   1                   ; 0b9e 13          ; Schiebe 1 links
                BF   $1                  ; 0b9f 91 04       ; Branch wenn negativ (bit 7 = 1, MOFF = 1) um +4 nach 0xba4 
                JMP  $4c77               ; 0ba1 29 4c 77
Aba4:           LIS  $1                  ; 0ba4 71          ; Akku = 0x01
                NS   $6                  ; 0ba5 f6          ; Akku &= Scratchpad 6
                BT   4                   ; 0ba6 84 11
Aba8:           LIS  $1                  ; 0ba8 71          ; Akku = 0x01
                NS   $4                  ; 0ba9 f4          ; Akku &= Scratchpad 4
                BF   $4                  ; 0baa 94 fd
; Lösche bit 0 in Scratchpad 6
                LR   A,$6                ; 0bac 46          ; Lade Scratchpad 6 in Akku
                NI   $fe                 ; 0bad 21 fe       ; Lösche bit 0
                LR   $6                  ; 0baf 56          ; Speichere Akku in Scratchpad 6
                
                NI   $2                  ; 0bb0 21 02       ; Akku &= 0x02 (behalte bit 1)
                BF   $4                  ; 0bb2 94 05       ; Branch wenn nicht null um +0x05 nach 0xbb8
                DI                       ; 0bb4 1a          ; Disable Interrupt
                LIS  $0                  ; 0bb5 70          ; Akku = 0
                OUT  $6                  ; 0bb6 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
Abb8:           LISL 0                   ; 0bb8 68          ; Fülle unteres ISAR mit x0
                LR   A,(IS)-             ; 0bb9 4e          ; Lade Akku ab Scratchpad 20 (dec ISAR)
                SL   1                   ; 0bba 13          ; Schiebe 1 links
                SL   1                   ; 0bbb 13          ; Schiebe 1 links
                LISU 4                   ; 0bbc 64          ; Fülle oberes ISAR mit 4x
                BT   1                   ; 0bbd 81 14       ; Branch wenn positiv (bit 7 = 1, HBL = 1) um +0x14 nach 0xbd2
                LIS  $2                  ; 0bbf 72          ; Akku = 0x02
                NS   (IS)                ; 0bc0 fc          ; Akku &= Scratchpad 47
                BF   $4                  ; 0bc1 94 21       ; Branch wenn nicht null um +0x21 nach 0xbe3
                INS  1                   ; 0bc3 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0bc4 21 f8       ; lösche erste 3 bit
                AI   $7                  ; 0bc6 24 07       ; addiere 7
                OUTS 1                   ; 0bc8 b1          ; Schreibe Port 1 (xxxx x111), wird invertiert ausgegeben   -> STFI1/2 (Stereo Filter ON)
                PI   $45b1               ; 0bc9 28 45 b1    ; PC1 = 0xbcc, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LR   A,(IS)              ; 0bcc 4c
                OI   $2                  ; 0bcd 22 02
                LR   (IS),A              ; 0bcf 5c
                BF   $0                  ; 0bd0 90 12       ; Branch immer nach 0xbe3
Abd2:           LIS  $2                  ; 0bd2 72          ; Akku = 0x02
                NS   (IS)                ; 0bd3 fc          ; Akku &= Scratchpad ??
                BT   4                   ; 0bd4 84 0e       ; Branch wenn null um +0x0e nach 0xbe3
                INS  1                   ; 0bd6 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0bd7 21 f8       ; lösche erste 3 bit
                AI   $7                  ; 0bd9 24 07       ; addiere 7
                OUTS 1                   ; 0bdb b1          ; Schreibe Port 1 (xxxx x111), wird invertiert ausgegeben   -> STFI1/2 (Stereo Filter ON)
                PI   $45bf               ; 0bdc 28 45 bf    ; PC1 = 0xbdf, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                LR   A,(IS)              ; 0bdf 4c
                NI   $fd                 ; 0be0 21 fd
                LR   (IS),A              ; 0be2 5c

Abe3:           INS  0                   ; 0be3 a0          ; Lade Port 0 in Akku
                OI   $4                  ; 0be4 22 04
                OUTS 0                   ; 0be6 b0
                LR   A,$6                ; 0be7 46          ; Lade Scratchpad 6 in Akku
                NI   $10                 ; 0be8 21 10
                BF   $4                  ; 0bea 94 5e
                LISL 2                   ; 0bec 6a          ; Lade unteres ISAR mit x2
                LIS  $1                  ; 0bed 71          ; Akku = 0x01
                NS   (IS)                ; 0bee fc          ; Akku &= Scratchpad ?2
                BF   $4                  ; 0bef 94 39
                DI                       ; 0bf1 1a          ; Disable Interrupt
                LIS  $8                  ; 0bf2 78          ; Akku = 0x08
                LR   $3                  ; 0bf3 53          ; Scratchpad 3 = 0x08
                
Abf4:           LR   A,$4                ; 0bf4 44          ; Kopiere Scratchpad 4 in Akku
                LR   QU,A                ; 0bf5 06          ; Speichere Akku in Scratchpad 14
                LR   A,$2                ; 0bf6 42          ; Lade Akku ab Scratchpad 2
                LR   $9                  ; 0bf7 59          ; Schreibe Akku (Scratchpad 2) in Scratchpad 9
                LR   A,(IS)              ; 0bf8 4c
                OI   $1                  ; 0bf9 22 01
                LR   (IS),A              ; 0bfb 5c
                LISU 6                   ; 0bfc 66          ; Fülle oberes ISAR mit 6x
                LR   A,(IS)              ; 0bfd 4c
                OI   $1                  ; 0bfe 22 01
                LR   (IS),A              ; 0c00 5c
                LISU 7                   ; 0c01 67          ; Fülle oberes ISAR mit 7x
                LR   A,(IS)              ; 0c02 4c
                OI   $1                  ; 0c03 22 01
                LR   (IS),A              ; 0c05 5c
                LISU 5                   ; 0c06 65          ; Fülle oberes ISAR mit 5x
                LR   A,(IS)              ; 0c07 4c
                OI   $1                  ; 0c08 22 01
                LR   (IS)+,A             ; 0c0a 5d
                LR   A,$3                ; 0c0b 43
                SL   1                   ; 0c0c 13
                BF   $4                  ; 0c0d 94 02
                LISL 3                   ; 0c0f 6b          ; Fülle unteres ISAR mit x3
Ac10:           LIS  $0                  ; 0c10 70          ; Akku = 0
                LR   $4                  ; 0c11 54          ; Scratchpad 4 = 0
                LI   $d7                 ; 0c12 20 d7       ; Akku = 0xd7
                LR   $2                  ; 0c14 52          ; Schreibe Akku (0xd7) in Scratchpad 2
                PI   $4173               ; 0c15 28 41 73    ; PC1 = 0xc18, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                LISU 4                   ; 0c18 64          ; Fülle oberes ISAR mit 4x
                LISL 3                   ; 0c19 6b          ; Fülle unteres ISAR mit x3
                PI   $4173               ; 0c1a 28 41 73    ; PC1 = 0xc1d, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LR   A,QU                ; 0c1d 02          ; Lade Akku ab Scratchpad 14
                LR   $4                  ; 0c1e 54          ; Speichere Akku in Scratchpad 4
                LR   A,$9                ; 0c1f 49          ; Lade Akku ab Scratchpad 9
                LR   $2                  ; 0c20 52          ; Schreibe Akku (Scratchpad 9) in Scratchpad 2
                LR   A,$3                ; 0c21 43
                SL   4                   ; 0c22 15
                BF   $1                  ; 0c23 91 04       ; Branch wenn negativ (bit 7 = 1) um +4 nach 0xc28
                JMP  $4d51               ; 0c25 29 4d 51
Ac28:           EI                       ; 0c28 1b
Ac29:           PI   $4161               ; 0c29 28 41 61    ; PC1 = 0xc2c, Call Subroutine 0x161 -> CheckForTunerElseIncPC
                BF   $0                  ; 0c2c 90 04       ; Tuner aktiv, gehe zu 0xc31
                JMP  $4cdb               ; 0c2e 29 4c db    ; Tuner inaktiv, gehe zu 0xcdb
; Tuner aktiv
Ac31:           LISU 4                   ; 0c31 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0c32 6f          ; Fülle unteres ISAR mit x7
                LIS  $1                  ; 0c33 71          ; Akku = 0x01
                NS   (IS)                ; 0c34 fc          ; Akku &= Scratchpad 47
                BF   $4                  ; 0c35 94 13       ; Branch wenn nicht null (bit 0 in Scratchpad 47 gesetzt) um +13 nach 0xc49
                INS  1                   ; 0c37 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0c38 21 f8       ; lösche erste 3 bit
                OUTS 1                   ; 0c3a b1          ; Schreibe Port 1 (xxxx x000), wird invertiert ausgegeben   -> MUT (Muting ON)
                PI   $45bf               ; 0c3b 28 45 bf    ; PC1 = 0xc3e, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                INS  1                   ; 0c3e a1          ; Lade invertierten Port 1 (I/O) in Akku
                AI   $6                  ; 0c3f 24 06       ; addiere 6
                OUTS 1                   ; 0c41 b1          ; Schreibe Port 1 (xxxx x110), wird invertiert ausgegeben   -> MC (Meter Control)
                PI   $45bf               ; 0c42 28 45 bf    ; PC1 = 0xc45, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                LR   A,(IS)              ; 0c45 4c          ; Lade Akku ab Scratchpad 47
                OI   $21                 ; 0c46 22 21       ; Setze bit 1 und 5
                LR   (IS),A              ; 0c48 5c          ; Speichere Scratchpad 47

Ac49:           JMP  $4d35               ; 0c49 29 4d 35    ; Gehe zu 0xd35
                LISU 2                   ; 0c4c 62          ; Fülle oberes ISAR mit 2x
                LISL 5                   ; 0c4d 6d          ; Fülle unteres ISAR mit x5
                LR   A,(IS)              ; 0c4e 4c          ; Lade Akku ab Scratchpad 25
                SL   1                   ; 0c4f 13          ; Schiebe 1 links
                SL   1                   ; 0c50 13          ; Schiebe 1 links
                BF   $1                  ; 0c51 91 25       ; Branch wenn negativ (bit 7 = 1, STLY stereo only = 1) um +25 nach 0xc77
                LISL 4                   ; 0c53 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)-             ; 0c54 4e          ; Lade Akku ab Scratchpad 24, dec ISAR
                SL   1                   ; 0c55 13          ; Schiebe 1 links
                SL   1                   ; 0c56 13          ; Schiebe 1 links
                BF   $1                  ; 0c57 91 7b       ; Branch wenn negativ (bit 7 = 1, THSTA = 1) um +7b nach 0xcd3
                LIS  $1                  ; 0c59 71          ; Akku = 0x01
                NS   $6                  ; 0c5a f6          ; Akku &= Scratchpad 6
                BT   4                   ; 0c5b 84 11       ; Branch wenn null (bit 0 in Scratchpad 6 = 0) um +11 nach 0xc6d
; Loop solange bit 0 in Scratchpad 4 gesetzt
Ac5d:           LIS  $1                  ; 0c5d 71          ; Akku = 0x01
                NS   $4                  ; 0c5e f4          ; Akku &= Scratchpad 4
                BF   $4                  ; 0c5f 94 fd       ; Branch wenn nicht null (bit 0 in Scratchpad 4 gesetzt) um -3 nach 0xc5d
; Lösche bit 0 in Scratchpad 6
                LR   A,$6                ; 0c61 46          ; Lade Scratchpad 6 in Akku
                NI   $fe                 ; 0c62 21 fe       ; Lösche bit 0
                LR   $6                  ; 0c64 56          ; Speichere Akku in Scratchpad 6
                
                NI   $2                  ; 0c65 21 02       ; Akku &= 0x02 (behalte bit 1)
                BF   $4                  ; 0c67 94 05       ; Branch wenn nicht null (bit 1 in Scratchpad 6 gesetzt) um +5 nach 0xc6d
                DI                       ; 0c69 1a          ; Disable Interrupt
                LIS  $0                  ; 0c6a 70          ; Akku = 0
                OUT  $6                  ; 0c6b 27 06       ; Schreibe Akku (0) in Port 6 (Interrupt Control Port) -> Interrupts disabled
Ac6d:           INS  0                   ; 0c6d a0          ; Lade Port 0 in Akku
                NI   $fb                 ; 0c6e 21 fb       ; Lösche bit 2
                OUTS 0                   ; 0c70 b0          ; Ausgang ST wird high
                LR   A,$5                ; 0c71 45
                OI   $8                  ; 0c72 22 08
                LR   $5                  ; 0c74 55
                BF   $0                  ; 0c75 90 05
Ac77:           LR   A,$5                ; 0c77 45
                NI   $f7                 ; 0c78 21 f7
                LR   $5                  ; 0c7a 55
Ac7b:           DI                       ; 0c7b 1a          ; Disable Interrupt
                LISU 4                   ; 0c7c 64          ; Fülle oberes ISAR mit 4x
                LISL 2                   ; 0c7d 6a          ; Lade unteres ISAR mit x2
                LIS  $1                  ; 0c7e 71          ; Akku = 0x01
                NS   (IS)                ; 0c7f fc          ; Akku &= Scratchpad 42
                BT   4                   ; 0c80 84 37
                LIS  $8                  ; 0c82 78          ; Akku = 0x08
                LR   $3                  ; 0c83 53          ; Scratchpad 3 = 0x08
                LR   A,$4                ; 0c84 44          ; Kopiere Scratchpad 4 in Akku
                LR   QU,A                ; 0c85 06          ; Speichere Akku in Scratchpad 14
                LR   A,$2                ; 0c86 42          ; Lade Akku ab Scratchpad 2
                LR   $9                  ; 0c87 59          ; Schreibe Akku (Scratchpad 2) in Scratchpad 9
                LR   A,(IS)              ; 0c88 4c
                NI   $fe                 ; 0c89 21 fe
                LR   (IS),A              ; 0c8b 5c
                LISU 6                   ; 0c8c 66          ; Fülle oberes ISAR mit 6x
                LR   A,(IS)              ; 0c8d 4c
                NI   $fe                 ; 0c8e 21 fe
                LR   (IS),A              ; 0c90 5c
                LISU 7                   ; 0c91 67          ; Fülle oberes ISAR mit 7x
                LR   A,(IS)              ; 0c92 4c
                NI   $fe                 ; 0c93 21 fe
                LR   (IS),A              ; 0c95 5c
                LISU 5                   ; 0c96 65          ; Fülle oberes ISAR mit 5x
                LR   A,(IS)              ; 0c97 4c
                NI   $fe                 ; 0c98 21 fe
                LR   (IS)+,A             ; 0c9a 5d
                LR   A,$3                ; 0c9b 43
                SL   1                   ; 0c9c 13
                BF   $4                  ; 0c9d 94 02
                LISL 3                   ; 0c9f 6b          ; Fülle unteres ISAR mit x3
Aca0:           LIS  $0                  ; 0ca0 70          ; Akku = 0
                LR   $4                  ; 0ca1 54          ; Scratchpad 4 = 0
                LI   $d7                 ; 0ca2 20 d7       ; Akku = 0xd7
                LR   $2                  ; 0ca4 52          ; Schreibe Akku (0xd7) in Scratchpad 2
                PI   $4173               ; 0ca5 28 41 73    ; PC1 = 0xca8, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                LISU 4                   ; 0ca8 64          ; Fülle oberes ISAR mit 4x
                LISL 3                   ; 0ca9 6b          ; Fülle unteres ISAR mit x3
                PI   $4173               ; 0caa 28 41 73    ; PC1 = 0xcad, Call Subroutine 0x173 -> WriteToSAAorAntenna
                LR   A,QU                ; 0cad 02          ; Lade Akku ab Scratchpad 14
                LR   $4                  ; 0cae 54          ; Speichere Akku in Scratchpad 4
                LR   A,$9                ; 0caf 49          ; Lade Akku ab Scratchpad 9
                LR   $2                  ; 0cb0 52          ; Schreibe Akku (Scratchpad 9) in Scratchpad 2
                LR   A,$3                ; 0cb1 43          ; Lade Akku ab Scratchpad 3
                SL   4                   ; 0cb2 15          ; Schiebe 4 links
                BF   $1                  ; 0cb3 91 04       ; Branch wenn negativ (bit 3 in Scratchpad 3 = 1) um +4 nach 0xcb8 
                JMP  $4d84               ; 0cb5 29 4d 84
Acb8:           LR   A,$6                ; 0cb8 46          ; Lade Scratchpad 6 in Akku
                NI   $10                 ; 0cb9 21 10
                BT   4                   ; 0cbb 84 0f
                LR   A,$5                ; 0cbd 45
                SL   1                   ; 0cbe 13
                SL   4                   ; 0cbf 15
                BT   1                   ; 0cc0 81 04
                JMP  $48e5               ; 0cc2 29 48 e5    ; Springe zu 0x8e5 -> Scratch44SetBit3ClrBit6
Acc5:           SL   1                   ; 0cc5 13
                BT   1                   ; 0cc6 81 67
                JMP  $4378               ; 0cc8 29 43 78
Accb:           EI                       ; 0ccb 1b
                LR   A,$5                ; 0ccc 45
                SL   4                   ; 0ccd 15
                BT   1                   ; 0cce 81 0c
                JMP  $4c29               ; 0cd0 29 4c 29
Acd3:           LR   A,(IS)              ; 0cd3 4c
                SL   1                   ; 0cd4 13
                SL   1                   ; 0cd5 13
                BT   1                   ; 0cd6 81 a0
                JMP  $4c59               ; 0cd8 29 4c 59

; Tuner inaktiv
Acdb:           LISU 4                   ; 0cdb 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0cdc 6f          ; Fülle unteres ISAR mit x7
                LIS  $1                  ; 0cdd 71          ; Akku = 0x01
                NS   (IS)                ; 0cde fc          ; Akku &= Scratchpad 47
                BT   4                   ; 0cdf 84 0c       ; Branch wenn 0 um +c nach 0xcec
                INS  1                   ; 0ce1 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0ce2 21 f8       ; lösche erste 3 bit
                OUTS 1                   ; 0ce4 b1          ; Schreibe Port 1 (xxxx x000), wird invertiert ausgegeben   -> MUT (Muting ON)
                PI   $45b1               ; 0ce5 28 45 b1    ; PC1 = 0xce8, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LR   A,(IS)              ; 0ce8 4c          ; Lade Akku ab Scratchpad 47
                NI   $fe                 ; 0ce9 21 fe       ; Lösche bit 0
                LR   (IS),A              ; 0ceb 5c          ; Speichere Scratchpad 47
Acec:           LR   A,$6                ; 0cec 46          ; Lade Scratchpad 6 in Akku
                NI   $10                 ; 0ced 21 10       ; Akku &= 0x10 (behalte bit 4)
                BF   $4                  ; 0cef 94 13       ; Branch wenn nicht null um +13 nach 0xd03
                LR   A,(IS)              ; 0cf1 4c          ; Lade Akku ab Scratchpad 47
                NI   $20                 ; 0cf2 21 20       ; Akku &= 0x20 (behalte bit 5)
                BF   $4                  ; 0cf4 94 0e       ; Branch wenn nicht null um +e nach 0xd03
                INS  1                   ; 0cf6 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0cf7 21 f8       ; lösche erste 3 bit
                AI   $6                  ; 0cf9 24 06       ; addiere 6
                OUTS 1                   ; 0cfb b1          ; Schreibe Port 1 (xxxx x110), wird invertiert ausgegeben   -> MC (Meter Control)
                PI   $45bf               ; 0cfc 28 45 bf    ; PC1 = 0xcff, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                LR   A,(IS)              ; 0cff 4c          ; Lade Akku ab Scratchpad 47
                OI   $20                 ; 0d00 22 20       ; Setze bit 5
                LR   (IS),A              ; 0d02 5c          ; Speichere Scratchpad 47

Ad03:           PI   $4161               ; 0d03 28 41 61    ; PC1 = 0xd06, Call Subroutine 0x161 -> CheckForTunerElseIncPC
                BF   $0                  ; 0d06 90 06       ; Tuner aktiv, Branch immer um +6 nach 0xd0d 
                LI   $d7                 ; 0d08 20 d7       ; Tuner inaktiv: Akku = 0xd7
                LR   $2                  ; 0d0a 52          ; Schreibe Akku (0xd7) in Scratchpad 2
                BF   $0                  ; 0d0b 90 29       ; Branch immer um +0x29 nach 0xd35 
; Tuner aktiv
Ad0d:           LIS  $1                  ; 0d0d 71          ; Akku = 0x01
                NS   $6                  ; 0d0e f6          ; Akku &= Scratchpad 6
                BF   $4                  ; 0d0f 94 1e       ; Branch wenn nicht null (bit 0 in Scratchpad 6 gesetzt) um +1e nach 0xd2e
                LISU 7                   ; 0d11 67          ; Fülle oberes ISAR mit 7x
                LISL 1                   ; 0d12 69          ; Fülle unteres ISAR mit x1
                LIS  $0                  ; 0d13 70          ; Akku = 0
                LR   (IS)-,A             ; 0d14 5e          ; Scratchpad 71 = 0
                LR   (IS),A              ; 0d15 5c          ; Scratchpad 70 = 0
                LISU 6                   ; 0d16 66          ; Fülle oberes ISAR mit 6x
                LR   (IS)+,A             ; 0d17 5d          ; Scratchpad 60 = 0
                LR   (IS),A              ; 0d18 5c          ; Scratchpad 61 = 0
; Setze bit 0 in Scratchpad 6
                LR   A,$6                ; 0d19 46          ; Lade Scratchpad 6 in Akku
                OI   $1                  ; 0d1a 22 01       ; Setze bit 0
                LR   $6                  ; 0d1c 56          ; Speichere Akku in Scratchpad 6
                
                NI   $2                  ; 0d1d 21 02       ; Akku &= 0x02, lösche alles ausser bit 1
                BF   $4                  ; 0d1f 94 0e       ; Branch wenn nicht null (bit 1 in Scratchpad 6 gesetzt) um +0e nach 0xd2e
                DI                       ; 0d21 1a          ; Disable Interrupt
                LIS  $0                  ; 0d22 70          ; Akku = 0
                LR   $8                  ; 0d23 58          ; Scratchpad 8 = 0x00
                LIS  $3                  ; 0d24 73          ; Akku = 0x03
                LR   $4                  ; 0d25 54          ; Scratchpad 4 = 0x03
                LI   $b7                 ; 0d26 20 b7       ; Akku = 0xb7
                LR   $2                  ; 0d28 52          ; Schreibe Akku (0xb7) in Scratchpad 2
                PI   $4025               ; 0d29 28 40 25    ; PC1 = 0xd2c, Call Subroutine 0x025
                BF   $0                  ; 0d2c 90 08       ; Branch immer um +8 nach 0xd35
Ad2e:           PI   $4161               ; 0d2e 28 41 61    ; PC1 = 0xd31, Call Subroutine 0x161 -> CheckForTunerElseIncPC
                BF   $0                  ; 0d31 90 03       ; Tuner aktiv -> 0xd35
                BF   $0                  ; 0d33 90 a7       ; Tuner inaktiv um -89 bytes -> 0xcdb
Ad35:           LISU 2                   ; 0d35 62          ; Fülle oberes ISAR mit 2x
                LISL 2                   ; 0d36 6a          ; Lade unteres ISAR mit x2
                LR   A,(IS)-             ; 0d37 4e          ; Lade Akku ab Scratchpad 22, dec ISAR
                NI   $10                 ; 0d38 21 10       ; Nur bit 4 (NOD)
                BT   4                   ; 0d3a 84 39       ; Branch wenn null, bit 4 = 0, NOD = 0, um +39 nach 0xd74
                LR   A,(IS)              ; 0d3c 4c          ; Lade Akku ab Scratchpad 21
                NI   $10                 ; 0d3d 21 10       ; Nur bit 4 (NR)
                BT   4                   ; 0d3f 84 34       ; Branch wenn null, bit 4 = 0, NR = 0, um +34 nach 0xd74
                DI                       ; 0d41 1a          ; Disable Interrupt
                INS  0                   ; 0d42 a0          ; Lade Port 0 in Akku
                OI   $8                  ; 0d43 22 08       ; Setze bit 3 (DON), also DON aus an Pin
                OUTS 0                   ; 0d45 b0          ; Schreibe Port 0
                LISU 4                   ; 0d46 64          ; Fülle oberes ISAR mit 4x
                LISL 3                   ; 0d47 6b          ; Fülle unteres ISAR mit x3
                LIS  $1                  ; 0d48 71          ; Akku = 0x01
                NS   (IS)                ; 0d49 fc          ; Akku &= Scratchpad 43
                BF   $4                  ; 0d4a 94 06
                LIS  $0                  ; 0d4c 70          ; Akku = 0
                LR   $3                  ; 0d4d 53          ; Scratchpad 3 = 0
                JMP  $4bf4               ; 0d4e 29 4b f4
; Prüfe Dolby Deemphasis
Ad51:           LISU 2                   ; 0d51 62          ; Fülle oberes ISAR mit 2x
                LISL 0                   ; 0d52 68          ; Fülle unteres ISAR mit x0
                LR   A,(IS)              ; 0d53 4c          ; Lade Akku ab Scratchpad 20
                NI   $10                 ; 0d54 21 10       ; Nur bit 4 (DDE)
                BF   $4                  ; 0d56 94 2d       ; Branch wenn nicht null, also DDE=1 um +2d nach 0xd84
                ; DDE = 0
                LISU 4                   ; 0d58 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0d59 6f          ; Fülle unteres ISAR mit x7
                LIS  $4                  ; 0d5a 74          ; Akku = 0x04
                NS   (IS)                ; 0d5b fc          ; Akku &= Scratchpad 47
                BF   $4                  ; 0d5c 94 14       ; Branch wenn nicht null, also bit 2 in Scratchpad 47 gesetzt um +14 nach 0xd71 -> Mache nichts weiter mit Deemphasis
                
; Ausgang 75us high, 25us low
                INS  1                   ; 0d5e a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0d5f 21 f8       ; lösche erste 3 bit
                AI   $4                  ; 0d61 24 04       ; addiere 4
                OUTS 1                   ; 0d63 b1          ; Schreibe Port 1 (xxxx x100), wird invertiert ausgegeben   -> Deemphasis 75us
                PI   $45bf               ; 0d64 28 45 bf    ; PC1 = 0xd67, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                INS  1                   ; 0d67 a1          ; Lade invertierten Port 1 (I/O) in Akku
                INC                      ; 0d68 1f          ; Inkrementiere Akku
                OUTS 1                   ; 0d69 b1          ; Schreibe Port 1 (xxxx x101), wird invertiert ausgegeben   -> Deemphasis 25us
                PI   $45b1               ; 0d6a 28 45 b1    ; PC1 = 0xd6d, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LR   A,(IS)              ; 0d6d 4c          ; Lade Akku ab Scratchpad 47
                OI   $4                  ; 0d6e 22 04       ; Setze bit 2
                LR   (IS),A              ; 0d70 5c          ; Scratchpad 47 = Akku
Ad71:           JMP  $4dc5               ; 0d71 29 4d c5
Ad74:           DI                       ; 0d74 1a          ; Disable Interrupt
                INS  0                   ; 0d75 a0          ; Lade Port 0 in Akku
                NI   $f7                 ; 0d76 21 f7
                OUTS 0                   ; 0d78 b0
                LISU 4                   ; 0d79 64          ; Fülle oberes ISAR mit 4x
                LISL 3                   ; 0d7a 6b          ; Fülle unteres ISAR mit x3
                LIS  $1                  ; 0d7b 71          ; Akku = 0x01
                NS   (IS)                ; 0d7c fc          ; Akku &= Scratchpad 43
                BT   4                   ; 0d7d 84 06
                LIS  $0                  ; 0d7f 70          ; Akku = 0
                LR   $3                  ; 0d80 53          ; Scratchpad 3 = 0
                JMP  $4c84               ; 0d81 29 4c 84
; Prüfe 75us Taste
Ad84:           LISU 2                   ; 0d84 62          ; Fülle oberes ISAR mit 2x
                LISL 5                   ; 0d85 6d          ; Fülle unteres ISAR mit x5
                LR   A,(IS)              ; 0d86 4c          ; Lade Akku ab Scratchpad 25
                SL   1                   ; 0d87 13          ; Schiebe 1 links
                BF   $1                  ; 0d88 91 27       ; Branch wenn negativ (bit 7 = 1, 75us = 1, Taste nicht gedrückt) um +27 nach 0xdb0
                ; Taste 75us gedrückt
                LISU 4                   ; 0d8a 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0d8b 6f          ; Fülle unteres ISAR mit x7
                LIS  $8                  ; 0d8c 78          ; Akku = 0x08
                NS   (IS)                ; 0d8d fc          ; Akku &= Scratchpad 47
                BT   4                   ; 0d8e 84 0e       ; Branch wenn null (bit 3 in Scratchpad 47) um +e nach 0xd9d
; Ausgang 75us high
                INS  1                   ; 0d90 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0d91 21 f8       ; lösche erste 3 bit
                AI   $4                  ; 0d93 24 04       ; addiere 4
                OUTS 1                   ; 0d95 b1          ; Schreibe Port 1 (xxxx x100), wird invertiert ausgegeben   -> Deemphasis 75us
                PI   $45bf               ; 0d96 28 45 bf    ; PC1 = 0xd99, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                LR   A,(IS)              ; 0d99 4c          ; Lade Akku ab Scratchpad 47
                NI   $f7                 ; 0d9a 21 f7       ; Lösche bit 3
                LR   (IS),A              ; 0d9c 5c          ; Scratchpad 47 = Akku
Ad9d:           LIS  $4                  ; 0d9d 74          ; Akku = 0x04
                NS   (IS)                ; 0d9e fc          ; Akku &= Scratchpad 47
                BT   4                   ; 0d9f 84 25       ; Branch wenn null (bit 2 in Scratchpad 47) um +25 nach 0xdc5
; Ausgang 25us high
                INS  1                   ; 0da1 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0da2 21 f8       ; lösche erste 3 bit
                AI   $5                  ; 0da4 24 05       ; addiere 5
                OUTS 1                   ; 0da6 b1          ; Schreibe Port 1 (xxxx x101), wird invertiert ausgegeben   -> Deemphasis 25us
                PI   $45bf               ; 0da7 28 45 bf    ; PC1 = 0xdaa, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                LR   A,(IS)              ; 0daa 4c
                NI   $fb                 ; 0dab 21 fb
                LR   (IS),A              ; 0dad 5c
                BF   $0                  ; 0dae 90 16

Adb0:           LISU 4                   ; 0db0 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0db1 6f          ; Fülle unteres ISAR mit x7
                LIS  $8                  ; 0db2 78          ; Akku = 0x08
                NS   (IS)                ; 0db3 fc          ; Akku &= Scratchpad 47
                BF   $4                  ; 0db4 94 e8
; Ausgang 75us low
                INS  1                   ; 0db6 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0db7 21 f8       ; lösche erste 3 bit
                AI   $4                  ; 0db9 24 04       ; addiere 4
                OUTS 1                   ; 0dbb b1          ; Schreibe Port 1 (xxxx x100), wird invertiert ausgegeben   -> Deemphasis 75us
                PI   $45b1               ; 0dbc 28 45 b1    ; PC1 = 0xdbf, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LR   A,(IS)              ; 0dbf 4c
                OI   $8                  ; 0dc0 22 08
                LR   (IS),A              ; 0dc2 5c
                BF   $0                  ; 0dc3 90 d9
Adc5:           EI                       ; 0dc5 1b
                PI   $40cd               ; 0dc6 28 40 cd    ; PC1 = 0xdc9, Call Subroutine 0x0cd -> LoadInputsWitchCheck
                JMP  $4ef9               ; 0dc9 29 4e f9
                PI   $4106               ; 0dcc 28 41 06    ; PC1 = 0xdcf, Call Subroutine 0x106 -> HandleInputsKS
                BF   $0                  ; 0dcf 90 2a       ; KS Nummer gedrückt, Branch immer um +2a nach 0xdfa
                LISL 4                   ; 0dd1 6c          ; Fülle unteres ISAR mit x4
Add2:           LR   A,(IS)-             ; 0dd2 4e
                SL   1                   ; 0dd3 13
                BF   $1                  ; 0dd4 91 29       ; Branch wenn negativ (bit 7 = 1) um +29 nach 0xdfe 
                BR7  Add2                ; 0dd6 8f fb
                LISU 4                   ; 0dd8 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0dd9 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 0dda 4c
                SR   1                   ; 0ddb 12

; Einsprung von 0xec5
                SL   1                   ; 0ddc 13
                BF   $1                  ; 0ddd 91 04       ; Branch wenn negativ (bit 7 = 1) um +4 nach 0xde2 
                JMP  $474b               ; 0ddf 29 47 4b
Ade2:           LR   A,$6                ; 0de2 46          ; Lade Scratchpad 6 in Akku
                NI   $10                 ; 0de3 21 10       ; Nur bit 4
                BT   4                   ; 0de5 84 05       ; Branch wenn null um +5 nach 0xdeb
                LR   A,$5                ; 0de7 45
                SL   1                   ; 0de8 13
                BF   $1                  ; 0de9 91 07       ; Branch wenn negativ (bit 7 = 1) um +7 nach 0xdf1
; Lösche bit 3 in Scratchpad 44
Adeb:           LISU 4                   ; 0deb 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 0dec 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0ded 4c          ; Lade Akku ab Scratchpad 44
                NI   $f7                 ; 0dee 21 f7       ; Lösche bit 3
                LR   (IS),A              ; 0df0 5c          ; Speichere Akku in Scratchpad 44
; Lösche bit 5,3,2 in Scratchpad 6
Adf1:           LR   A,$6                ; 0df1 46          ; Lade Scratchpad 6 in Akku
                NI   $d3                 ; 0df2 21 d3       ; Lösche bit 5,3,2
                LR   $6                  ; 0df4 56          ; Speichere Akku in Scratchpad 6
                
; Jump hierher von 0x232 oder 0x566 oder 0x653
                LIS  $1                  ; 0df5 71          ; Akku = 0x01
                LR   $3                  ; 0df6 53          ; Scratchpad 3 = 0x01
                JMP  $4b78               ; 0df7 29 4b 78

; Lösche bit 6 in Scratchpad 6
Adfa:           LR   A,$6                ; 0dfa 46          ; Lade Scratchpad 6 in Akku
                NI   $bf                 ; 0dfb 21 bf       ; lösche bit 6 
                LR   $6                  ; 0dfd 56          ; Speichere Akku in Scratchpad 6
                
Adfe:           LISU 4                   ; 0dfe 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0dff 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 0e00 4c
                OI   $90                 ; 0e01 22 90
                LR   (IS),A              ; 0e03 5c
                LR   A,$5                ; 0e04 45
                SL   1                   ; 0e05 13
                BT   1                   ; 0e06 81 04
                JMP  $481e               ; 0e08 29 48 1e
Ae0b:           LR   A,$5                ; 0e0b 45
                SR   1                   ; 0e0c 12
                SL   1                   ; 0e0d 13
                BT   1                   ; 0e0e 81 0c
                DCI  Aff6                ; 0e10 2a 0f f6    ; Lade DC0 mit 0xff6 (RAM)
                LISU 5                   ; 0e13 65          ; Fülle oberes ISAR mit 5x
                LISL 4                   ; 0e14 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)+             ; 0e15 4d
                ST                       ; 0e16 17
                LR   A,(IS)+             ; 0e17 4d
                ST                       ; 0e18 17
                LR   A,(IS)              ; 0e19 4c
                ST                       ; 0e1a 17
Ae1b:           JMP  $4628               ; 0e1b 29 46 28

; HandleProtection
; Hier wird Endstufe ein/aus und Protection abgehandelt
; ISAR 46: Bit0->Protection ok, bit1->SpkB, bit2->SpkA
; Wenn Protection ok bit direkt nach Lautsprecher ein
; Sonst PH aus und Endstufe aus, dann 1 sek warten
; Nach Wartezeit werden Inputs neu geladen
Ae1e:           LISU 4                   ; 0e1e 64          ; Fülle oberes ISAR mit 4x
                LISL 6                   ; 0e1f 6e          ; Fülle unteres ISAR mit x6
                LIS  $1                  ; 0e20 71          ; Akku = 0x01
                NS   (IS)                ; 0e21 fc          ; Akku &= Scratchpad 46
                BF   $4                  ; 0e22 94 50       ; Branch wenn nicht null (bit 0 von Scratchpad 46 war 1), also wenn Protection OK um +0x50 nach 0xe73
                LIS  $0                  ; 0e24 70          ; Akku = 0
                OUT  $5                  ; 0e25 27 05       ; Schaltet Port 5 alles auf High       -> Kopfhörer PH aus, Endstufe aus PONL PONR
                PI   $4f96               ; 0e27 28 4f 96    ; PC1 = 0xe2a, Call Subroutine 0xf96 -> Delay1Sec                
; Hier wird bei Übertemperatur und DC am Ausgang die Endstufe abgeschaltet ond die Lautsprecher und Kopfhöhrer getrennt
                PI   $40cd               ; 0e2a 28 40 cd    ; PC1 = 0xe2d, Call Subroutine 0x0cd -> LoadInputsWitchCheck
                LISU 2                   ; 0e2d 62          ; Fülle oberes ISAR mit 2x
; CheckHeatAndDC (Einsprung von 0xf3d)    
; Prüfe Übertemperatur und DC Offset
; Wenn gut, gehe zu 0xe61, sonst direkt weiter        
                LISL 0                   ; 0e2e 68          ; Fülle unteres ISAR mit x0
                LR   A,(IS)-             ; 0e2f 4e          ; Lade Akku ab Scratchpad 20 (dec ISAR)
                SL   4                   ; 0e30 15          ; Schiebe 4 links
                BT   1                   ; 0e31 81 06       ; Branch wenn positiv (bit 7 = 0) um +6 nach 0xe38       -> H Signal (Power Amp Heat)
                LR   A,(IS)-             ; 0e33 4e          ; Lade Akku ab Scratchpad 27 (dec ISAR)
                NI   $10                 ; 0e34 21 10       ; nur bit 4     (DC Signal)
                BF   $4                  ; 0e36 94 2a       ; Branch wenn nicht null (DC Signal = 1) um +0x2a nach 0xe61 (wenn H und DC ok)
; Wenn zu heiss oder DC erkannt, Lautsprecher trennen, PH aus und Endstufe aus
; Merker für Lautsprecher aus setzen, 1s warten, Endstufe wieder ein, 2 sek warten, zurück zum Beginn
Ae38:           INS  1                   ; 0e38 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0e39 21 f8       ; lösche erste 3 bit
                INC                      ; 0e3b 1f          ; Inkrementiere Akku
                OUTS 1                   ; 0e3c b1          ; Schreibe Port 1 (xxxx x001), wird invertiert ausgegeben   -> SPA (Speakers A ON)
                PI   $45b1               ; 0e3d 28 45 b1    ; PC1 = 0xe40, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                INS  1                   ; 0e40 a1          ; Lade invertierten Port 1 (I/O) in Akku
                INC                      ; 0e41 1f          ; Inkrementiere Akku
                OUTS 1                   ; 0e42 b1          ; Schreibe Port 1 (xxx x010), wird invertiert ausgegeben    -> SPB (Speakers B ON)
                PI   $45b1               ; 0e43 28 45 b1    ; PC1 = 0xe46, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LIS  $0                  ; 0e46 70          ; Akku = 0
                OUT  $5                  ; 0e47 27 05       ; Schaltet Port 5 alles auf High       -> Kopfhörer PH aus, Endstufe aus PONL PONR
                LISU 4                   ; 0e49 64          ; Fülle oberes ISAR mit 4x
                LISL 6                   ; 0e4a 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 0e4b 4c          ; Lade Akku ab Scratchpad 46
                NI   $f9                 ; 0e4c 21 f9       ; lösche bit 1 und 2    -> Speaker sind aus
                LR   (IS),A              ; 0e4e 5c          ; Speichere Akku in Scratchpad 46
                PI   $4f96               ; 0e4f 28 4f 96    ; PC1 = 0xe52, Call Subroutine 0xf96 -> Delay1Sec
                LIS  $2                  ; 0e52 72          ; Akku = 0x02
                OUT  $5                  ; 0e53 27 05       ; Schaltet Port 5 die Endstufe ein (Bit 2) PONL / PONR
                LR   A,(IS)              ; 0e55 4c          ; Lade Akku ab Scratchpad 46
                NI   $fe                 ; 0e56 21 fe       ; Lösche bit 0
                LR   (IS),A              ; 0e58 5c          ; Speichere Akku in Scratchpad 46 -> Protection nicht OK
                PI   $4f96               ; 0e59 28 4f 96    ; PC1 = 0xe5c, Call Subroutine 0xf96 -> Delay1Sec
                PI   $4f96               ; 0e5c 28 4f 96    ; PC1 = 0xe5f, Call Subroutine 0xf96 -> Delay1Sec
                BF   $0                  ; 0e5f 90 be       ; Branch immer um -66 bytes nach 0xe1e  -> HandleProtection
; DC ok und nicht überhitzt
; Wenn Protection ok bit schon 1, direkt nach Lautprecher ein
; Sonst 2 sek warten, dann PH ein und weiter zu Lautsprecher ein
Ae61:           LISU 4                   ; 0e61 64          ; Fülle oberes ISAR mit 4x
                LIS  $1                  ; 0e62 71          ; Akku = 0x01
                NS   (IS)                ; 0e63 fc          ; Akku &= Scratchpad 46 (nicht sicher)
                BF   $4                  ; 0e64 94 0e       ; Branch wenn nicht null (bit 0 war 1) um +0x0e nach 0xe73
                LR   A,(IS)              ; 0e66 4c          ; Lade Akku ab Scratchpad 46 (nicht sicher)
                OI   $1                  ; 0e67 22 01       ; Setze bit 0
                LR   (IS),A              ; 0e69 5c          ; Speichere Akku in Scratchpad 46 (nicht sicher)
                PI   $4f96               ; 0e6a 28 4f 96    ; PC1 = 0xe6d, Call Subroutine 0xf96 -> Delay1Sec
                PI   $4f96               ; 0e6d 28 4f 96    ; PC1 = 0xe70, Call Subroutine 0xf96 -> Delay1Sec
                LIS  $1                  ; 0e70 71          ; Akku = 0x01
                OUT  $5                  ; 0e71 27 05       ; Schaltet Port 5 Kopfhörer ein (Bit 0: PH)
; Jump hierher wenn Protection okay
; Schalte Speaker A anhand Knopf A
Ae73:           INS  1                   ; 0e73 a1          ; Lade invertierten Port 1 (I/O) in Akku
                NI   $f8                 ; 0e74 21 f8       ; lösche erste 3 bit
                INC                      ; 0e76 1f          ; Inkrementiere Akku
                OUTS 1                   ; 0e77 b1          ; Schreibe Port 1 (xxxx x001), wird invertiert ausgegeben (wäre SPA (Speakers A ON))
                LISU 2                   ; 0e78 62          ; Fülle oberes ISAR mit 2x
                LISL 6                   ; 0e79 6e          ; Fülle unteres ISAR mit x6
                LR   A,(IS)              ; 0e7a 4c          ; Lade Akku ab Scratchpad 26
                LISU 4                   ; 0e7b 64          ; Fülle oberes ISAR mit 4x
                NI   $10                 ; 0e7c 21 10       ; nur bit 4                         ; TSPA
                BT   4                   ; 0e7e 84 0e       ; Branch wenn 0 (bit 4) um +e nach 0xe8d   -> Speaker A aus
                LIS  $4                  ; 0e80 74          ; Akku = 0x04
                NS   (IS)                ; 0e81 fc          ; Akku &= Scratchpad 46
                BF   $4                  ; 0e82 94 15       ; Branch wenn nicht null (bit 2 war 1) um +0x15 nach 0xe98
                PI   $45bf               ; 0e84 28 45 bf    ; PC1 = 0xe87, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                LR   A,(IS)              ; 0e87 4c          ; Lade Akku ab Scratchpad 46
                OI   $4                  ; 0e88 22 04       ; Setze bit 2
                LR   (IS),A              ; 0e8a 5c          ; Speichere Akku in Scratchpad 46
                BF   $0                  ; 0e8b 90 0c       ; Branch immer um +c nach 0xe98
; Speaker A ausschalten
Ae8d:           LIS  $4                  ; 0e8d 74          ; Akku = 0x04
                NS   (IS)                ; 0e8e fc          ; Akku &= Scratchpad 46
                BT   4                   ; 0e8f 84 08       ; Branch wenn 0 (bit 2) um +8 nach 0xe98    ; ist schon aus
                PI   $45b1               ; 0e91 28 45 b1    ; PC1 = 0xe94, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LR   A,(IS)              ; 0e94 4c          ; Lade Akku ab Scratchpad 46
                NI   $fb                 ; 0e95 21 fb       ; lösche bit 2
                LR   (IS),A              ; 0e97 5c          ; Speichere Akku in Scratchpad 46
; Schalte Speaker B anhand Knopf B
Ae98:           INS  1                   ; 0e98 a1          ; Lade invertierten Port 1 (I/O) in Akku -> (xxxx x001)
                INC                      ; 0e99 1f          ; Inkrementiere Akku
                OUTS 1                   ; 0e9a b1          ; Schreibe Port 1 (xxxx x010), wird invertiert ausgegeben (wäre SPB (Speakers B ON))
                LISU 2                   ; 0e9b 62          ; Fülle oberes ISAR mit 2x
                LISL 5                   ; 0e9c 6d          ; Fülle unteres ISAR mit x5
                LR   A,(IS)+             ; 0e9d 4d          ; Lade Akku ab Scratchpad 25  (inc ISAR)
                LISU 4                   ; 0e9e 64          ; Fülle oberes ISAR mit 4x
                NI   $10                 ; 0e9f 21 10       ; nur bit 4 (TSPB) -> Eingang Speaker B ON
                BT   4                   ; 0ea1 84 0e       ; Branch wenn 0 (bit 4) um +e nach 0xeb0    -> Speaker B soll aus sein
                LIS  $2                  ; 0ea3 72          ; Akku = 0x02
                NS   (IS)                ; 0ea4 fc          ; Akku &= Scratchpad 46
                BF   $4                  ; 0ea5 94 15       ; Branch wenn nicht null (bit 1 war nicht 0) um +0x15 nach 0xebb
                PI   $45bf               ; 0ea7 28 45 bf    ; PC1 = 0xeaa, Call Subroutine 0x5bf -> LoadHighToOutputMultiplexer
                LR   A,(IS)              ; 0eaa 4c          ; Lade Akku ab Scratchpad 46
                OI   $2                  ; 0eab 22 02       ; Setze bit 1
                LR   (IS),A              ; 0ead 5c          ; Speichere Akku in Scratchpad 46
                BF   $0                  ; 0eae 90 0c       ; Branch immer um +c nach 0xebb
; Speaker B ausschalten
Aeb0:           LIS  $2                  ; 0eb0 72          ; Akku = 0x02
                NS   (IS)                ; 0eb1 fc          ; Akku &= Scratchpad 46
                BT   4                   ; 0eb2 84 08       ; Branch wenn 0 (bit 1) um +8 nach 0xebb  ; ist schon aus
                PI   $45b1               ; 0eb4 28 45 b1    ; PC1 = 0xeb7, Call Subroutine 0x5b1 -> LoadLowToOutputMultiplexer
                LR   A,(IS)              ; 0eb7 4c          ; Lade Akku ab Scratchpad 46
                NI   $fd                 ; 0eb8 21 fd       ; lösche bit 1
                LR   (IS),A              ; 0eba 5c          ; Speichere Akku in Scratchpad 46

Aebb:           LISU 4                   ; 0ebb 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0ebc 6f          ; Fülle unteres ISAR mit x7
                LR   A,(IS)              ; 0ebd 4c          ; Lade Akku ab Scratchpad 47
                SL   1                   ; 0ebe 13          ; schiebe 1 links
                BF   $1                  ; 0ebf 91 0b       ; Branch wenn negativ (bit 7 = 1), Ursprünglich bit 6 in Scratchpad 47 um +b nach 0xecb
                LIS  $4                  ; 0ec1 74          ; Akku = 0x04
                NS   $5                  ; 0ec2 f5          ; Akku &= Scratchpad 5
                BF   $4                  ; 0ec3 94 04       ; Branch wenn nicht null (bit 2 war nicht 0) um +4 nach 0xec8
                JMP  $4dcc               ; 0ec5 29 4d cc    ; Springe zu 0xddc

Aec8:           JMP  $48fd               ; 0ec8 29 48 fd    ; Springe zu 0x8fd

Aecb:           LR   A,(IS)              ; 0ecb 4c          ; Lade Akku ab Scratchpad 47
                NI   $bf                 ; 0ecc 21 bf       ; Lösche bit 6
                LR   (IS),A              ; 0ece 5c          ; Speichere Akku in Scratchpad 47
                JMP  $4aad               ; 0ecf 29 4a ad    ; Springe zu 0xaad

; Subroutine
; Kopiert Scratchpad 12 in 14 und 13 in 15
                DI                       ; 0ed2 1a          ; Disable Interrupt
                LR   K,P                 ; 0ed3 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13
                LR   A,KU                ; 0ed4 00          ; Lade Akku mit Scratchpad 12
                LR   QU,A                ; 0ed5 06          ; Speichere Akku in Scratchpad 14
                LR   A,KL                ; 0ed6 01          ; Lade Akku mit Scratchpad 13
                LR   QL,A                ; 0ed7 07          ; Speichere Akku in Scratchpad 15
                
                LISU 4                   ; 0ed8 64          ; Fülle oberes ISAR mit 4x
                LISL 2                   ; 0ed9 6a          ; Lade unteres ISAR mit x2
                LR   A,(IS)              ; 0eda 4c          ; Lade Akku ab Scratchpad 42
                NI   $fe                 ; 0edb 21 fe       ; Lösche bit 0
                CI   $4                  ; 0edd 25 04       ; Vergleiche mit 0x4
                LR   A,(IS)              ; 0edf 4c          ; Lade Akku ab Scratchpad 42
                BF   $4                  ; 0ee0 94 04       ; Branch wenn nicht null (Scratchpad 42 mit gelöschten bit 0 war nicht 0x4) um +4 nach 0xee5
                NI   $1                  ; 0ee2 21 01       ; Lösche obere 7 bit
                LR   (IS),A              ; 0ee4 5c          ; Speichere Akku in Scratchpad 42
Aee5:           LISU 6                   ; 0ee5 66          ; Fülle oberes ISAR mit 6x
                LR   (IS)+,A             ; 0ee6 5d          ; Speichere Akku in Scratchpad 62, inc ISAR
                LISU 4                   ; 0ee7 64          ; Fülle oberes ISAR mit 4x
                LIS  $0                  ; 0ee8 70          ; Akku = 0
                LR   $4                  ; 0ee9 54          ; Scratchpad 4 = 0
                LI   $d7                 ; 0eea 20 d7       ; Akku = 0xd7
                LR   $2                  ; 0eec 52          ; Schreibe Akku (0xd7) in Scratchpad 2
                PI   $4173               ; 0eed 28 41 73    ; PC1 = 0xef0, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display, ISAR ist hier 43)
                LISL 4                   ; 0ef0 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0ef1 4c          ; Lade Akku ab Scratchpad 44
                NI   $de                 ; 0ef2 21 de       ; Löscht bit 0 und 5
                LR   (IS),A              ; 0ef4 5c          ; Speichere Akku in Scratchpad 44
                PI   $458b               ; 0ef5 28 45 8b    ; PC1 = 0xef8, Call Subroutine 0x58b
                LR   P0,Q                ; 0ef8 0d          ; Lade PC0 ab Q Register, springe wieder dorthin wo 0xed2 aufgerufen wurde
                
; Jump von 0x8fa oder 0xdc9
                PI   $413c               ; 0ef9 28 41 3c    ; PC1 = 0xefc, Call Subroutine 0x13c  -> CheckInOutSelectKeys (In Scratchpad 3 steht welche Taste -> 1:TUNER1, 2:PHONO, 3:AUX, 4:TA1, 5:TA2)
                BF   $0                  ; 0efc 90 43       ; Branch immer um +43 nach 0xf40 wenn neue Taste gedrück zu Anwahl Play / Rec.


                LISU 4                   ; 0efe 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 0eff 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0f00 4c          ; Lade Akku ab Scratchpad 44
                LISU 2                   ; 0f01 62          ; Fülle oberes ISAR mit 2x
                SL   4                   ; 0f02 15          ; Schiebe 4 links
                BF   $1                  ; 0f03 91 39       ; Branch wenn negativ (bit 7, eigentlich bit 3 von Scratchpad 44 = 1) um +39 nach 0xf3d 
                LISL 2                   ; 0f05 6a          ; Lade unteres ISAR mit x2
                LR   A,(IS)              ; 0f06 4c          ; Lade Akku ab Scratchpad 22
                LISU 4                   ; 0f07 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 0f08 6c          ; Fülle unteres ISAR mit x4
                SL   4                   ; 0f09 15          ; Schiebe 4 links
                BT   1                   ; 0f0a 81 4d       ; Branch wenn positiv (bit 7 = 0, also bit 3 in Scratchpad 22 -> RECSET) um +4d nach 0xf58
                LIS  $4                  ; 0f0c 74          ; Akku = 0x04
                NS   (IS)                ; 0f0d fc          ; Akku &= Scratchpad 44, setze bit 2
                BF   $4                  ; 0f0e 94 ac
                LR   A,(IS)              ; 0f10 4c
                OI   $4                  ; 0f11 22 04
                LR   (IS),A              ; 0f13 5c
                NI   $1                  ; 0f14 21 01
                BT   4                   ; 0f16 84 06
                PI   $4ed2               ; 0f18 28 4e d2    ; PC1 = 0xf1b, Call Subroutine 0xed2
                BF   $0                  ; 0f1b 90 9f
Af1d:           LR   A,(IS)              ; 0f1d 4c
                OI   $1                  ; 0f1e 22 01
                LR   (IS),A              ; 0f20 5c
                DI                       ; 0f21 1a          ; Disable Interrupt
                LISL 2                   ; 0f22 6a          ; Lade unteres ISAR mit x2
                LR   A,(IS)              ; 0f23 4c
                NI   $fe                 ; 0f24 21 fe
                BF   $4                  ; 0f26 94 05
                LR   A,(IS)              ; 0f28 4c
                OI   $4                  ; 0f29 22 04
                LR   (IS),A              ; 0f2b 5c
Af2c:           LR   A,(IS)              ; 0f2c 4c
                NI   $1                  ; 0f2d 21 01
                LISU 6                   ; 0f2f 66          ; Fülle oberes ISAR mit 6x
                LR   (IS),A              ; 0f30 5c
                LISU 4                   ; 0f31 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 0f32 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0f33 4c
                OI   $20                 ; 0f34 22 20
                LR   (IS),A              ; 0f36 5c
Af37:           PI   $458b               ; 0f37 28 45 8b    ; PC1 = 0xf3a, Call Subroutine 0x58b

Af3a:           JMP  $4ebb               ; 0f3a 29 4e bb    ; Springe zu 0xebb

Af3d:           JMP  $4e2e               ; 0f3d 29 4e 2e    ; Springe zu 0xe2e  -> CheckHeatAndDC

; neue Taste gedrückt zur Rec oder Play Wahl
; In Scratchpad 3 steht welche Taste -> 1:TUNER1, 2:PHONO, 3:AUX, 4:TA1, 5:TA2
Af40:           LISU 4                   ; 0f40 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 0f41 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0f42 4c          ; Lade Akku ab Scratchpad 44
                SL   4                   ; 0f43 15          ; Schiebe links um 4 bit
                BF   $1                  ; 0f44 91 0d       ; Branch wenn bit 7 (bit 3 in Scratchpad 44) gesetzt um +d nach 0xf52
                NI   $10                 ; 0f46 21 10       ; nur bit 4 behalten (war bit 0 in Scratchpad 44)
                BT   4                   ; 0f48 84 09       ; Branch wenn 0 (bit 4=0) um +9 nach 0xf52
                LR   A,$3                ; 0f4a 43          ; lade Akku ab Scratchpad 3
                SL   4                   ; 0f4b 15          ; Schiebe 4 links
                LR   $3                  ; 0f4c 53          ; Scratchpad 3 = Scratchpad 3 << 4
                PI   $4546               ; 0f4d 28 45 46    ; PC1 = 0xf50, Call Subroutine 0x546 -> SetRecord
                BF   $0                  ; 0f50 90 1e       ; Branch immer um +1e nach 0xf6f

Af52:           PI   $4504               ; 0f52 28 45 04    ; PC1 = 0xf55, Call Subroutine 0x504 -> SetPlay
                LISU 5                   ; 0f55 65          ; Fülle oberes ISAR mit 5x
                BF   $0                  ; 0f56 90 18       ; Branch immer um +18 nach 0xf6f
; RECSET gedrückt
; ISAR ist hier 44
Af58:           LR   A,(IS)              ; 0f58 4c          ; Lade Akku ab Scratchpad 44
                NI   $fb                 ; 0f59 21 fb       ; Lösche bit 2
                LR   (IS),A              ; 0f5b 5c          ; Speichere Scratchpad 44
                LISU 2                   ; 0f5c 62          ; Fülle oberes ISAR mit 2x
                LISL 1                   ; 0f5d 69          ; Fülle unteres ISAR mit x1
                LR   A,(IS)              ; 0f5e 4c          ; Lade Akku ab Scratchpad 21
                SL   4                   ; 0f5f 15          ; Schiebe 4 links
                BT   1                   ; 0f60 81 dc       ; Branch wenn positiv (bit 7 = 0), also RECOFF = 0 um -36 bytes nach 0xf3d
                LISU 4                   ; 0f62 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 0f63 6c          ; Fülle unteres ISAR mit x4
                LIS  $1                  ; 0f64 71          ; Akku = 0x01
                NS   (IS)                ; 0f65 fc          ; Akku &= Scratchpad 44
                BT   4                   ; 0f66 84 d3       ; Branch wenn null (bit 0 in Scratchpad 44 = 0) um -45 bytes nach 0xf3a
                DI                       ; 0f68 1a          ; Disable Interrupt
                LIS  $0                  ; 0f69 70          ; Akku = 0
                LR   $3                  ; 0f6a 53          ; Scratchpad 3 = 0
                PI   $4546               ; 0f6b 28 45 46    ; PC1 = 0xf6e, Call Subroutine 0x546 -> SetRecord
                LISU 4                   ; 0f6e 64          ; Fülle oberes ISAR mit 4x

Af6f:           LIS  $1                  ; 0f6f 71          ; Akku = 0x01
                NS   $6                  ; 0f70 f6          ; Akku &= Scratchpad 6
                BT   4                   ; 0f71 84 07       ; Branch wenn null (bit 0 in Scratchpad 6 war nicht gesetzt) um +7 nach 0xf79
                EI                       ; 0f73 1b          ; Enable Interrupt
; Endlosloop bis Interrupt
Af74:           LIS  $1                  ; 0f74 71          ; Akku = 0x01
                NS   $4                  ; 0f75 f4          ; Akku &= Scratchpad 4
                BF   $4                  ; 0f76 94 fd       ; Branch wenn nicht null (Bit 0 in Scratchpad 4 war gesetzt) um -3 nach 0xf74
                DI                       ; 0f78 1a          ; Disable Interrupt
Af79:           LISL 3                   ; 0f79 6b          ; Fülle unteres ISAR mit x3
                LR   A,$4                ; 0f7a 44          ; Kopiere Scratchpad 4 in Akku
                LR   QU,A                ; 0f7b 06          ; Speichere Akku in Scratchpad 14
                LR   A,$2                ; 0f7c 42          ; Lade Akku ab Scratchpad 2
                LR   $9                  ; 0f7d 59          ; Schreibe Akku (Scratchpad 2) in Scratchpad 9
                LIS  $0                  ; 0f7e 70          ; Akku = 0
                LR   $4                  ; 0f7f 54          ; Scratchpad 4 = 0
                LI   $d7                 ; 0f80 20 d7       ; Akku = 0xd7
                LR   $2                  ; 0f82 52          ; Schreibe Akku (0xd7) in Scratchpad 2
                PI   $4173               ; 0f83 28 41 73    ; PC1 = 0xf86, Call Subroutine 0x173 -> WriteToSAAorAntenna (Display)
                LR   A,QU                ; 0f86 02          ; Lade Akku ab Scratchpad 14
                LR   $4                  ; 0f87 54          ; Speichere Akku in Scratchpad 4
                LR   A,$9                ; 0f88 49          ; Lade Akku ab Scratchpad 9
                LR   $2                  ; 0f89 52          ; Schreibe Akku (Scratchpad 9) in Scratchpad 2
                LISU 4                   ; 0f8a 64          ; Fülle oberes ISAR mit 4x
                LISL 4                   ; 0f8b 6c          ; Fülle unteres ISAR mit x4
                LR   A,(IS)              ; 0f8c 4c          ; Lade Akku ab Scratchpad 44
                NI   $de                 ; 0f8d 21 de       ; Lösche bit 0 und 5
                LR   (IS),A              ; 0f8f 5c          ; Speichere Akku in Scratchpad 44
Af90:           LIS  $4                  ; 0f90 74          ; Akku = 0x04
                NS   $5                  ; 0f91 f5          ; Akku &= Scratchpad 5
                BF   $4                  ; 0f92 94 a7       ; Branch wenn nicht null um -89 bytes nach 0xf3a
                BF   $0                  ; 0f94 90 a2       ; Branch immer um -94 bytes nach 0xf37
                
; Subroutine Delay1Sec
; Loopt 2 x 195 x 256 mal
; 1 Cycle = 2ns bei 4MHz                                                                                                                                                     Cycles
                LR   K,P                 ; 0f96 08          ; Sichere PC1 (Stack register) in Scratchpad 12,13 (viele Ursprünge)                            4
                LIS  $2                  ; 0f97 72          ; Akku = 0x02                                                                                   1
                LR   $3                  ; 0f98 53          ; Schreibe Akku (0x02) in Scratchpad 3                                                          1
                LIS  $0                  ; 0f99 70          ; Akku = 0                                                                                      1
                LR   $0                  ; 0f9a 50          ; Schreibe Akku (0x00) in Scratchpad 0                                                          1

Af9b:           LI   $c3                 ; 0f9b 20 c3       ; Akku = 0xc3 (195)                                                                             2.5
                LR   $1                  ; 0f9d 51          ; Schreibe Akku (0xc3) in Scratchpad 1                                                          1
; loopt 256 mal -> 5*256*2ns = 2.56ms
Af9e:           DS   $0                  ; 0f9e 30          ; Dekrementiere Scratchpad 0                                                                    1.5
                BF   $4                  ; 0f9f 94 fe       ; Branch wenn nicht null um -2 nach 0xf9e                                                       3.5 wenn branch sonst 3
; loopt 195 mal -> 195*2.56ms + 195*5*2ns = 499.2+1.95ms = 501.15ms                
                DS   $1                  ; 0fa1 31          ; Dekrementiere Scratchpad 1                                                                    1.5
                BF   $4                  ; 0fa2 94 fb       ; Branch wenn nicht null um -5 nach 0xf9e                                                       3.5 wenn branch sonst 3
                
                DS   $3                  ; 0fa4 33          ; Dekrementiere Scratchpad 3                                                                    1.5
                BF   $4                  ; 0fa5 94 f5       ; Branch wenn nicht null um -11 nach 0xf9b                                                      3.5 wenn branch sonst 3
                PK                       ; 0fa7 0c          ; Programm Counter (fa7) wird in Stack geschrieben, zurück zu Herkunftsadresse                  4


Afa8:           INS  4                   ; 0fa8 a4          ; Lade Port 4 in Akku
                NS   $5                  ; 0fa9 f5          ; Akku &= Scratchpad 5
                BF   $4                  ; 0faa 94 08       ; Branch wenn nicht null um +8 nach 0xfb3
                PI   $43f7               ; 0fac 28 43 f7    ; PC1 = 0xfaf, Call Subroutine 0x3f7
                BF   $0                  ; 0faf 90 e0       ; Branch immer um -32 bytes nach 0xf90
                BF   $0                  ; 0fb1 90 06       ; Branch immer um +6 bytes nach 0xfb8
Afb3:           PI   $43c6               ; 0fb3 28 43 c6    ; PC1 = 0xfb6, Call Subroutine 0x3c6
                BF   $0                  ; 0fb6 90 d9       ; Branch immer um -39 bytes nach 0xf90

Afb8:           DS   $0                  ; 0fb8 30          ; Dekrementiere Scratchpad 0
                BF   $4                  ; 0fb9 94 ee       ; Branch wenn nicht null um -18 bytes nach 0xfa8
                PI   $4807               ; 0fbb 28 48 07    ; PC1 = 0xfbe, Call Subroutine 0x807
                LISU 4                   ; 0fbe 64          ; Fülle oberes ISAR mit 4x
                LISL 7                   ; 0fbf 6f          ; Fülle unteres ISAR mit x7
                
; Ab hier ist RAM
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
Afd8:           db   $ff        ; RAM Byte                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
Afdb:           db   $ff        ; wird gelesen                 
Afdc:           db   $ff        ; wird gelesen                 
Afdd:           db   $ff        ; wird gelesen                                  
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
                db   $ff                 
Aff6:           db   $ff        ; RAM Byte, wird beschrieben ab Scratchpad 54                  
                db   $ff        ; RAM Byte, wird beschrieben ab Scratchpad 55
                db   $ff        ; RAM Byte, wird beschrieben ab Scratchpad 56
                db   $ff                 
                db   $ff                 
                db   $ff                 
Affc:           db   $ff        ; RAM Byte speichert Anwahl Play und Record Anschluss (bin axxx byyy)
                                ; a: bit noch unklar, wird getoggelt bei 0x6bb und 0x87f
                                ; xxx: Wert 0..5 Anwahl RECORD (NF1..4)
                                ; b: noch unklar, wahrscheinlich nicht verwendet
                                ; yyy: Wert 1..5 Anwahl PLAY (NF5..8)               
Affd:           db   $ff        ; RAM Byte, obere 4 bit verwendet, diese dürfen 1..9 sein         
                db   $ff                 
                db   $ff                 
