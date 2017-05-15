        
        
* = $2000
        ; .D V1.0 2000
        JMP GETIT; 8192 / 1000 / GET A$
        JMP GETINE; 8195 / 2000 / GET ONE CHARACTER
        JMP SEND; 8198 / 3000 / SEND ONE CHARACTER
        JMP INPT; 8201 / 4000 / INPUT I$
        JMP BIGOUT; 8204 / 5000 / OUTPUT O$
        JMP CHATMODE; 8207 / 6000 / CHAT MODE
        JMP FILESEND; 8210 / 7000 / SEND FILE OUT
        JMP FILEGET; 8213 / 8000 / GET FILE WITHOUT SHOWING
        JMP TIMEVAR; 8216 / 9000 / TIME INTO I$
        JMP DIREC; 8219 / 10000 / DIRECTORY OUT
        JMP INLINE; 8222 / 11000 / GET I$ FROM DISK
        JMP BLOCKS; 8225 / 12000 / DIRECTORY BLOCKS
        JMP COUNTFILE; 8228 / 13000 / COUNT FILES
        JMP ZAPTERM; 8231 / 14000 / ZAP TERM PROGRAM
        JMP SETPOT; 8234 / 15000 / SET RETURN ONLINE BASIC POINTERS
        JMP DEFFIX; 8237 / 1500 / RESTORE BAISC POINTERS AFTER A DEFINE
        JMP SETBAS; 8240 / 16000 / TURN ON ONLINE BASIC
        JMP OFFBAS; 8243 / 16500 / TURN OFF ONLINE BASIC
        ; 220,570,1250,2085,2086,2570,3245,3540,3615
IDD1
        BYTE $65
        ;*******VERY IMPORTANT******
LDAFAR
        LDX #$01
        LDA #$AE
        JSR $FF74
        RTS
LDAFAR2
        TXA
        LDX #$01
        JSR $FF74
        RTS
IDD2
        BYTE $90
        ;**************CREATE ONE CHARACTER INPUT A$*******************
GETIT
        LDA #$41; **SET UP A$="
        STA $0B0C
        JSR REST
        JSR GETINE; **GET IT
        LDA $FE
        BNE ISNTNULL; NOT NULL
        LDA #$00
        STA $FB
        JMP DEFINE
ISNTNULL
        LDY #$00; ** STORE IN MEMORY
        LDA $FE
        STA ($FB),Y
        LDA #$01; NOT NULL
        STA $FB
DEFINE
        LDA #$00
        STA $0B0F
        STA $0B0C
        STA $0B1C
        STA $0B4F
        LDA #$78
        STA $0B1F
        LDX #$00
        LDY #$FF
DEFLP
        LDA DEFBITS,X
        INY
        STA ($FB),Y
        INX
        CPX #$08
        BNE DEFLP
        LDA $3D
        STA $0B69
        LDA $3E
        STA $0B6A
        LDA #$FB
        STA $3D
        LDA #$1E
        STA $3E
        RTS
DEFBITS
        BYTES $34 $58 $158 $56 $50 $51 $55 $58
IDD3
        BYTE $49
DEFFIX
        LDA $0B69
        STA $3D
        LDA $0B6A
        STA $3E
        RTS
        ;*****************MAIN ONE CHAR INPUT ROUTINE****************
GETINE
        JSR SAVE
        JSR $3D0C
        LDX #$FE
        JSR $FFC6
        JSR $EEEB
        CMP #$00; STORE SYSOP KEY
        BEQ SYSNULL
        CMP #$01
        BEQ SYSNULL
        STA $FE
        CMP #$1B
        BNE NOCHAT
        LDA $0B0E
        BEQ CH1
        JMP EXOUT
CH1     JSR CHATMODE; JSR CHAT WILL GO****
NOCHAT
        CMP #$0A
        BNE EXOUT
        LDA #$01
        STA $0B0B
        JMP EXOUT
IDD4
        BYTE $50
IDD5
        BYTE $48
SYSNULL
        LDA $0B07; SYSOP LOCAL
        BEQ USRCONT
GONE
        LDA #$00
        STA $FE
        JMP EXXOUT
USRCONT
        LDX #$05; MODEM INPUT
        JSR $FFC6
        JSR $EEEB; GET BYTE
        STA $FE
        LDX #$FE
        JSR $FFC6
        LDA $FE; USER NULL
        BEQ GONE
        CMP #$03
        BEQ GONE
        CMP #$01
        BEQ GONE
        LDA $0B0D; GFX ON/OFF
        BNE EXOUT
        LDX $FE
        LDA $1C00,X; ASCII TRANSLATE
        STA $FE
EXOUT
        LDA $0B0E; CHAT MODE
        BNE EXXXXX
        LDA $FE
        JSR UPCASE
        STA $FE
        CMP #$22; QUOTE
        BNE EXXXXX
        LDA #$87
        STA $FE
EXXXXX
        LDA $0B22
        BEQ EXXOUT
        LDA $FE
        CMP #$13
        BNE EXXOUT
        LDA #$00
        STA $FE
EXXOUT
        JSR BASRTINE
        JSR LOAD
        RTS; ***YER GONE
UPCASE
        LDX $0B0F; **UPCASE RTINE
        CPX #$00
        BEQ RTCASE
        CMP #$0D
        BEQ RTCASE
        CMP #$13
        BEQ RTCASE
        CMP #$0A
        BEQ RTCASE
        CMP #$08
        BEQ RTCASE
        CMP #$14
        BEQ RTCASE
        CMP #$94
        BEQ RTCASE
        CMP #$20
        BCC RTTCASE
        CMP #$41
        BCC RTCASE
        CMP #$61
        BCC MNCASE
        CMP #$7B
        BCC RTCASE
        CMP #$A0
        BCC RTTCASE
        CMP #$C0
        BCC RTCASE
        CMP #$E0
        BCC MNCASE
        CMP #$FF
        BCC RTTCASE
MNCASE
        ORA #$80
RTCASE
        RTS
RTTCASE
        LDA #$00
        RTS
SAVE
        STA $0B10; TEMP STORAGE
        STY $0B11
        STX $0B12
LOAD
        LDA $0B10; TEMP RETRIEVAL
        LDY $0B11
        LDX $0B12
        RTS
IDD6
        BYTE $49
        ;*****************SEND ONE CHARACTER OUT RTINE*******************
SEND
        JSR SAVE
        LDX #$FF
        JSR $FFC9
        JSR $3D0C
        LDA #$00; **KOTE/INSERT
        STA $F4
        STA $F5
        LDA $0B07; **SKIP SLOW
        BNE STARTSND
        JSR SLOWIT
        JMP STARTSND
NOPE
        JMP BADDEST
STARTSND
        LDA $FE
        CMP #$03; **RVS C
        BEQ NOPE
        CMP #$87
        BNE NOQUOTE
        LDA #$22; **SAVE TO QUOTE
        STA $FE
NOQUOTE
        LDA $FE
        CMP #$8B
        BEQ RVSK
        CMP #$0B
        BNE NORVSK
RVSK
        LDA #$0D; **CHAR TO CR
NORVSK
        CMP #$13
        BNE NOCLR
        CMP $0B68
        BNE NOCLR
        LDA #$00; **NO 2-CLRS
NOCLR
        CMP #$0D
        BNE NORTNH
        LDA $0B68
        CMP #$88
        BNE RTNNOH
        LDA #$00; ***H WUZ PREVS
        JMP NORTNH
RTNNOH
        LDA #$00
        STA $0B6B
        LDA #$0D
NORTNH
        STA $FE; **PERMIN
        STA $0B68
        CMP #$88; **RVS-H FORMAT
        BNE NOFRMT
        LDA $0B63; **40 COLS=RTN
        BEQ ISRTN
        LDA $0B6B; **H PREVS=RTN
        BNE ISRTN
        LDA #$20
        STA $FE
        INC $0B6B
        JMP NOFRMT
IDD7
        BYTE $57
ISRTN
        LDA #$0D
        STA $FE
        LDA #$00
        STA $0B6B
NOFRMT
        CMP #$90; **COLOR
        BNE NOCYCL
        LDX $0B13
        INX
        CPX #$08
        BNE NXTCOLOR
        LDX #$00
NXTCOLOR
        STX $0B13
        LDA $0B14,X
        STA $FE
NOCYCL
        LDA $0B1C; *** SYSOP LOCAL OUTPUT - * MODEM OUTPUT
        BEQ NOSTAR
        LDA $FE
        CMP #$0D
        BEQ NOSTAR
        CMP #$14
        BEQ NOSTAR
        LDA $0B6E
        STA $FE
NOSTAR
        LDA $0B07; *** SYSOP LOCAL, NO MODEM OUTPUT
        BNE SYSSEND
        LDA $0B0D; ***GFX ON
        BNE USERSEND
        LDX $FE; *ASCII
        LDA $1D00,X
        STA $FE
USERSEND
        LDX #$05
        JSR $FFC9
        LDA $FE
        JSR $EF79
        LDA $FE
        CMP #$0D
        BNE SYSSEND
        LDA $0B1D
        BEQ SYSSEND
        LDA #$0A; ***LINEFEEDS
        JSR $EF79
SYSSEND
        LDX #$FF; ***LOCAL SEND
        JSR $FFC9
        LDA $0B0D; ***GFX ON
        BNE NOTRANS
        LDA $0B07; **LOCAL ASCII
        BEQ SYSKII
        LDX $FE
        LDA $1D00,X
        STA $FE
SYSKII
        LDX $FE
        LDA $1C00,X
        STA $FE
NOTRANS
        LDA $FE; **LO-OUT
        JSR $C00C
BADDEST
        LDA #$00; **SPRITE OFF
        STA $D015
        JSR BASRTINE
        JSR LOAD
        RTS
IDD8
        BYTE $48
BASRTINE
        LDA $0B71
        BNE BASGOOD
BASBAD
        RTS
IDD9
        BYTE $65
BASGOOD
        LDA $0B0B
        BEQ BADUP
BASBAS
        LDA #$00
        STA $0B71
        JMP OFFBAS
BADUP
        LDA $FE
        CMP #$18
        BNE BADDN
        LDA #$7F
        STA $91
BADDN
        LDA $0B72
        BEQ BASBAD
        LDA $7F
        CMP #$80
        BEQ BASBAD
        JMP BASBAS
        ;****************INPUT ONE LINE OF I$********************
INPT
        JSR REST; ***SET UP I$
        TAY; ***CLEAR COLUMN
        STA $0B1E
        LDA $D7; **80 COL CRSR
        BEQ INPTLP
        LDA #$1B
        JSR $EF79
        LDA #$45
        JSR $EF79
INPTLP
        JSR GETINE; ***GET A CHAR
        LDA $0B0B; **CHAR DROP
        BEQ NEND
        JMP DUNWRAP2
NEND
        LDA $FE; **NULL LP
        BEQ INPTLP
        LDA $0B1E
        CMP #$27
        BCS NOLNM
        LDA #$4F; *DEFAULT, WORD
        STA $0B20
        LDA #$27; *WRAPPING VALS
        STA $0B67
        LDY #$FF
LNMLP
        INY
        LDA $1F00,Y
        CMP #$88; **REMOVE STRAY H
        BNE LNXT
        LDA #$20
        STA $1F00,Y
LNXT
        CPY $FB
        BNE LNMLP
        LDY #$00
        LDA $0B65; **PUT REG VALS
        BEQ NOLNM
        LDA $0B63
        BNE LIN80
        LDA #$23
        STA $0B67
        STA $0B20
        JMP NOLNM
LIN80
        LDA #$4B
        STA $0B20
NOLNM
        LDA $FE
        CMP #$0D; **PASS OVR CHK
        BEQ COINPT
        CMP #$14; **PASS OVR CHK
        BEQ COINPT
        LDA $0B4F; **STPCHK
        BEQ COINPT
        LDA $FB
        CMP $0B1F; **MAX CHARS
        BEQ INPTLP
COINPT
        LDA $FE
        CMP #$9D; **CURSOR LFT
        BNE STGOOD
        LDA $0B1E
        BEQ STGOOD
        DEC $0B1E
STGOOD
        JSR UPRTINE
        LDA $0B1E
        CLC; ***INC CURR COLUMN
        ADC $0B6C
        STA $0B1E
        LDA $FE
        CMP #$0D; ***CR HIT
        BNE NORTRN
        JMP DUNWRAP2
NORTRN
        CMP #$14; ***DEL HIT
        BEQ DELETE
        JMP NODELETE
SPECDEL
        STA $FE
        JSR SEND
        JMP INPTLP
        ;**SMART DELETE ROUTINE**
DELETE
        LDA $FB
        BEQ JPINLP
        DEC $FB
        LDA ($FB),Y
        CMP #$91
        BNE NOUP;     **CRSR UP
        LDA #$11
        JMP SPECDEL
NOUP
        CMP #$11; **CRSR DN
        BNE NODN
        LDA #$91
        JMP SPECDEL
NODN
        CMP #$9D; **CRSR LF
        BNE NOLF
        LDA #$1D
        JMP SPECDEL
NOLF
        CMP #$1D; **CRSR RT
        BNE NORT
        LDA #$9D
        JMP SPECDEL
NORT
        JSR UPRTINE
        LDA $0B6C
        BEQ JPINLP
        JSR SEND
        DEC $0B1E
JPINLP
        JMP INPTLP
NODELETE
        LDA $FB; ***CHK MAX CHARS
        CMP $0B1F; **LINE LINK
        BCC NOLINK
        LDY #$00
        LDA #$03
        STA ($FB),Y
        INC $FB; ***AD LINK N GO
        JMP DEFINE
NOLINK
        LDY #$00
        LDA $FE; ***STORE IT
        STA ($FB),Y
        INC $FB
        JSR SEND
        LDA $0B1E
        CMP $0B67; **40 WRAP
        BEQ WORDWRAP
        CMP $0B20; **OTHER WRAP
        BNE JPINLP
        ;**MAIN WORD WRAP ROUTINE**
WORDWRAP
        LDA #$00
        STA $0B21
        LDA $0B22; **WW FLAG=0
        BNE NOTDUN
        LDA $0B63
        BEQ DUN40
        LDA $0B1E
        CMP #$30
        BCS DUN40
        JMP INPTLP
DUN40
        LDA #$14
        STA $FE
        JMP DELETE
NOTDUN
        LDA $FB; **WORK VECTORS
        STA $FD
        LDA $FC
        STA $FE
        DEC $FD
        LDY #$00
        LDA ($FD),Y
        CMP #$88; ***DUN ALRDY
        BEQ JPINLP
        CMP #$20; **LAST=SPC
        BNE WRAPLOOP
        LDA #$88
        STA ($FD),Y
        LDA $0B63; **CHK COLS
        BEQ CHKS1
        LDA $0B1E
        CMP #$30
        BCS CHKS1
        JMP INPTLP
CHKS1
        JMP DUNWRAP2
WRAPLOOP
        DEC $FD; **FIND SPACE LP
        BEQ TEN2
        INC $0B21
        LDA ($FD),Y
        CMP #$20; ***PUT THE H
        BNE WRAPLOOP
TEN2
        LDA #$88
        STA ($FD),Y
CHKTEN
        LDA $0B21
        STA $0B00
        CMP #$10; **OVR 10 CHARS
        BCC NXTCHK
        LDA $0B63
        BEQ CHKS1
        LDA $0B1E
        CMP #$30
        BCS CHKS1
        JMP INPTLP
NXTCHK
        LDA $0B1E; **FIXING 80 LIMIT
        CMP $0B20
        BEQ CONWRAP
        LDA $0B63
        BEQ CONWRAP
        LDA $0B20
        SEC; **SETIN NEW 80COL WW
        SBC $0B21
        STA $0B20
        JMP INPTLP
CONWRAP
        INC $0B21
WRAPLP1
        INY; **PUT CHARS IN BUFFER
        CPY $0B21
        BEQ WRAPNXT
        LDA ($FD),Y
        STA $0349,Y
        JMP WRAPLP1
WRAPNXT
        LDX $0B21
        DEX
        STX $D0
        LDA $FD
        STA $FB
        DEY
WRAPLP2
        LDA #$14
        STA $FE
        JSR SEND
        DEY
        BNE WRAPLP2
DUNWRAP
        LDA #$88
        STA ($FB),Y
        INC $FB
DUNWRAP2
        LDA #$0D; **CR
        STA $FE
        JSR SEND; **GONE
        JMP DEFINE
REST
        LDA #$1F; ***SET I$
        STA $FC
        LDA #$00
        STA $FB
        LDA $0B0C
        CMP #$41
        BEQ RESTNXT
        LDA #$49
RESTNXT
        STA $0B0C
        LDA #$3A
        STA $1EFB
        LDA $0B0C
        STA $1EFC
        LDA #$24
        STA $1EFD
        LDA #$B2
        STA $1EFE
        LDA #$22
        STA $1EFF
        LDA #$00
        RTS
UPRTINE
        NOP
        CMP #$8D
        BEQ UPONE
        CMP #$88
        BEQ UPONE
        CMP #$1D
        BEQ UPONE
        CMP #$87
        BEQ UPONE
        CMP #$88
        BEQ UPONE
        CMP #$20
        BCC NOONE
        CMP #$80
        BCC UPONE
        CMP #$A0
        BCC NOONE
UPONE
        LDA #$01
        STA $0B6C
        RTS
NOONE
        LDA #$00
        STA $0B6C
        RTS
        ;*****************SEND OUT ONE LINE OF O$*****************
BIGOUT
        LDY #$09
        LDX #$2F
        JSR LDAFAR2
        STA $FB
        INY
        LDX #$2F
        JSR LDAFAR2
        STA $FC
        INY
        LDX #$2F
        JSR LDAFAR2
        STA $FD
        LDY #$00
BIGLOOP
        LDX #$FC
        JSR LDAFAR2
        STA $FE
        LDA $0B6D
        BEQ BIGNXT
        LDA $FE
        CMP #$41
        BCC BIGNXT
        CMP #$5B
        BCS BIGNXT
        ORA #$80
        STA $FE
BIGNXT
        JSR SEND
        INY
        CPY $FB
        BEQ BIGGON
        JMP BIGLOOP
BIGGON
        LDA $FE
        CMP #$03
        BNE RTNSEND
        STA $0B68
        LDA #$00
        STA $0B6B
        RTS
RTNSEND
        LDA #$0D
        STA $FE
        JSR SEND
        RTS
        ;******************SYSOP CHAT MODE******************
ENTRANCE
        BYTES "CHAT MODE"
EXITIT
        BYTES "RETURNING TO THE BBS"
CHATMODE
        LDA $0B0E; *NOT IN TWICE
        BNE CHATGONE
        LDA #$01
        STA $0B0E
        LDA #$0D
        STA $FE
        JSR SEND
        LDY #$00
        LDX #$00
ENTRALP
        LDA ENTRANCE,X
        STA $FE
        JSR SEND
        INX
        CPX #$09
        BNE ENTRALP
        LDA #$0D
        STA $FE
        JSR SEND
        LDA $0B09
        STA $0B23
CHATLP
        JSR GETINE
        LDA $0B23
        STA $0B09
        LDA $FE; *NO NULL
        BEQ CHATLP
        CMP #$1B
        BEQ CHATOT
        JSR SEND
        JMP CHATLP
CHATOT
        LDA #$0D
        STA $FE
        JSR SEND
        LDX #$00
        STX $0B0E
EXILOOP
        LDA EXITIT,X
        STA $FE
        JSR SEND
        INX
        CPX #$14
        BNE EXILOOP
        LDA #$0D
        STA $FE
        JSR SEND
        LDA #$02
        STA $0B50
CHATGONE
        LDA #$00
        STA $FE
        RTS
IDENTIFY
        LDX #$05
        JSR $FFC9
        LDA IDD1
        JSR $FFD2
        LDA IDD2
        JSR $FFD2
        LDA IDD3
        JSR $FFD2
        LDA IDD4
        JSR $FFD2
        LDA IDD5
        JSR $FFD2
        LDA IDD6
        JSR $FFD2
        LDA IDD7
        JSR $FFD2
        LDA IDD8
        JSR $FFD2
        LDA IDD9
        JSR $FFD2
        JSR $FFCC
        RTS
        ;******************SEND OUT FILE ROUTINE*******************
FILESEND
        LDA #$00
        STA $FD
        STA $FC
        STA $FF
        STA $0B2B
        LDA $0B22
        STA $0B01
        LDA #$00
        STA $0B22
FILES
        LDX #$02
        JSR $FFC6
        LDX #$00
FILELOOP
        STX $1EFF
        JSR $EEEB
        LDX $1EFF
        CMP #$03
        BNE FILELP2
        STA $1E00,X
        JSR $EEEB
        LDX $1EFF
        JMP CSEND
FILELP2
        STA $1E00,X
        CMP #$8E
        BNE SKIPUP
        LDA #$01
        STA $FC
        LDA #$8E
SKIPUP
        CMP #$0D
        BEQ CSEND
        CMP #$01; **EOF MARKER
        BEQ LNKOUT
        LDA $90; **EOF REAL
        BNE CSOUT
        INX
        CPX #$FD
        BNE FILELOOP
        DEX
CSEND
        LDA #$01
        STA $FD
        STX $1EFF
        LDX #$00
CSENT
        LDA $1E00,X
        STA $FE
        JSR SEND
        LDA #$01
        STA $0B0F
        JSR GETINE
        LDA #$00
        STA $0B0F
        LDA $FE; *CHECK SPACEBAR
        BEQ NOPAAS
        JMP HOTRTINE; *CHK SPACEBAR, HOTKEYS
NOPAAS
        CPX $1EFF
        BEQ FILES
        INX
        JMP CSENT
LNKOUT
        STA $FF
        STX $0B11
        JSR $EEEB
        LDX $0B11
CSOUT
        CPX #$00
        BEQ COQEND
        STX $1EFF
        LDX #$00
FILELP3
        LDA $1E00,X
        STA $FE
        JSR SEND
        CPX $1EFF
        BEQ COQEND
        INX
        JMP FILELP3
COQEND
        LDA #$0D
        STA $FE
        JSR SEND
        LDA $0B01
        STA $0B22
        RTS
HOTRTINE
        STX $0B2C
        LDA $FE
        CMP #$20
        BEQ FILEOTT
        CMP #$13
        BNE HOTCUNT
        JSR PAAS
        JMP SPACOT
HOTCUNT
        LDA $2F
        STA $AE
        LDA $30
        STA $AF
        LDY #$17
        JSR LDAFAR
        STA $FF
        CMP #$00
        BEQ SPACOT
        INY
        JSR LDAFAR
        STA $0B10
        INY
        JSR LDAFAR
        STA $AF
        LDA $0B10
        STA $AE
        LDY #$00
HOTLOOP
        JSR LDAFAR
        CMP $FE
        BNE HOTCONT
        STA $0B2B
FILEOTT
        JSR FILEGET
        JMP COQEND
HOTCONT
        INY
        CPY $FF
        BNE HOTLOOP
SPACOT
        LDX $0B2C
        JMP NOPAAS
PAAS
        LDA $0B0B
        BNE OTPAAS
        JSR GETINE
        LDA $FE
        CMP #$DA
        BNE PAAPA
        JSR IDENTIFY
PAAPA
        LDA $FE
        BEQ PAAS
        CMP #$13
        BEQ PAAS
OTPAAS
        RTS
        ;******************GET ONE DISK LINK FILE******************
FILEGET
        LDA #$00
        STA $FD
        LDX #$02
        JSR $FFC6
FGETLOOP
        JSR $EEEB
        STA $FE
        LDA $90; **EOF REAL
        STA $FD
        BNE FGETEND
        LDA $FE
        CMP #$01; FILE LINKER
        BEQ FGETEND
        JMP FGETLOOP
FGETEND
        JSR $EEEB
        JSR $FFCC
        RTS
        ;*****************PUT TOD CLOCK INTO I$******************
TIMEVAR
        JSR REST
        LDA $DD0B
        STA $FD
        LDA $DD0A
        STA $FE
        LDA $FD
        AND #$10
        LSR
        LSR
        LSR
        LSR
        ADC #$30
        LDY #$00; *1ST
        STA ($FB),Y
        LDA $FD
        AND #$0F
        ADC #$30
        INY; *2ND
        STA ($FB),Y
        LDA #$3A; *':'
        INY
        STA ($FB),Y
        LDA $FE
        AND #$F0
        LSR
        LSR
        LSR
        LSR
        ADC #$30
        INY; *4TH
        STA ($FB),Y
        LDA $FE
        AND #$0F
        ADC #$30
        INY; *5TH
        STA ($FB),Y
        LDA #$4D; *'M'
        LDY #$06
        STA ($FB),Y
        LDA $FD
        AND #$80
        CMP #$00
        BNE NOTTHISM
        LDA #$41
        DEY
        STA ($FB),Y
        JMP TIMDEF
NOTTHISM
        LDA #$50
        DEY
        STA ($FB),Y
        JMP TIMDEF
TIMDEF
        LDA #$07
        STA $FB
        JMP DEFINE
        ;***************SEND OUT DIRECTORY FORMAT***************
DIREC
        LDX #$02
        JSR $FFC6
        JSR $EEEB; *USELESS
        JSR $EEEB
DRECLP
        JSR $EEEB
        JSR $EEEB; *EOF
        BEQ DRECOUT
        JSR $EEEB; **LO BLKS
        STA $FB
        JSR $EEEB; **HI BLKS
        STA $FC
        LDA #<BSOUT
        STA $0326
        LDA #>BSOUT
        STA $0327
        LDA $FC
        LDX $FB
        JSR $8E32
        LDA #$79
        STA $0326
        LDA #$EF
        STA $0327
        LDA #$20
        STA $FE
        JSR SEND
        LDX #$02; *****
        JSR $FFC6
        LDY #$00
DRECLP2
        JSR $EEEB
        BEQ DRUB
        CMP $FD; *CHAR MASK
        BEQ QCHAR
DRUM
        STA $1E00,Y
        INY
        JMP DRECLP2
DRUB
        STY $FC
        JSR $FFCC
        LDY #$00
DRECLP3
        LDA $1E00,Y; ***********
        STA $FE
        JSR SEND
        JSR GETINE
        LDA $FE
        CMP #$20
        BEQ DREGOT
        INY
        CPY $FC
        BNE DRECLP3
DRECGO
        LDA #$0D
        STA $FE
        JSR SEND
        LDX #$02
        JSR $FFC6
        JMP DRECLP
DREGOT
        LDA #$0D
        STA $FE
        JSR SEND
DRECOUT
        JSR $FFCC
        RTS
QCHAR
        LDA #$00
        JMP DRUM
        ;**************GET I$ FROM DISK FILE**************
INLINE
        LDX #$02
        JSR $FFC6
        JSR REST; *SET UP I$
        LDA #$00
        STA $FD
INLOOP
        JSR $EEEB
        STA $FE
        LDA $90; *EOF
        BNE ENDFIL
        LDA $FB; *TOO LONG
        CMP #$FD
        BEQ ENDFIL
        LDA $FE
        CMP #$0D
        BEQ INOUT
        CMP #$22
        BNE INSTOR
        LDA #$87
INSTOR
        LDY #$00
        STA ($FB),Y
        INC $FB
        JMP INLOOP
ENDFIL
        LDA #$01
        STA $FD
INOUT
        JSR $FFCC
        JMP DEFINE
        ;***************VARIOUS DIRECTORY NECESSITIES***************
BLOCKS
        LDX #$02
        JSR $FFC6
        JSR $EEEB; **USELESS
        JSR $EEEB
        JSR $EEEB
        JSR $EEEB
        JSR $EEEB
        JSR $EEEB
BLOKLP
        JSR $EEEB; *NULL
        CMP #$00
        BNE BLOKLP
        JSR $EEEB; *USELESS
        JSR $EEEB
        JSR $EEEB; *FILE BLOCKS
        STA $0B26
        JSR $EEEB
        STA $0B27
BLOKLP2
        JSR $EEEB
        CMP #$00
        BNE BLOKLP2
        JSR $EEEB; *USELESS
        JSR $EEEB
        JSR $EEEB; *DISK BLOCKS
        STA $0B28
        JSR $EEEB
        STA $0B29
        JSR $FFCC
        RTS
        ;******************FILE COUNTER*******************
COUNTFILE
        LDA #$00
        STA $0B2A
        LDX #$02
        JSR $FFC6
        JSR $EEEB; *USELESS
        JSR $EEEB
COUNTLP
        JSR $EEEB; *MORE USELESS
        JSR $EEEB
        JSR $EEEB
        JSR $EEEB
COUNTLP2
        JSR $EEEB
        LDX $90; *EOF
        BNE COUNTOUT
        CMP #$00; *YES NULL
        BNE COUNTLP2
        INC $0B2A
        JMP COUNTLP
COUNTOUT
        DEC $0B2A; *NO BLOCKS OR HEADER
        DEC $0B2A
        JSR $FFCC
        RTS
ASCMSG
        BYTES "ASCII TERM"
GFXMSG
        BYTES "GRAPHICS TERM"
        ;*******************ZAP TERM**********************
ZAPTERM
        JSR $FFCC
        JSR A80CHK
        LDX #$00
        LDA #$0D
        STA $FE
        JSR SEND
        LDA $0B0D
        BEQ ASCLP
GFXLP
        LDA GFXMSG,X
        STA $FE
        JSR SEND
        INX
        CPX #$0D
        BNE GFXLP
        JMP ZAPCON
ASCLP
        LDA ASCMSG,X
        STA $FE
        JSR SEND
        INX
        CPX #$0A
        BNE ASCLP
ZAPCON
        LDA #$0D
        STA $FE
        JSR SEND
        JSR A80CHK
ZAPCONT
        JSR $3D0C
        JSR $EEEB
        CMP #$0D
        BNE NO80CK
        JSR A80CHK
        LDA #$0D
NO80CK
        CMP #$00
        BEQ NXTERM
        STA $FE
        CMP #$09; *GFX CHANGE
        BNE N2TERM
        LDA $0B0D
        EOR #$01
        STA $0B0D
        JMP ZAPTERM
N2TERM
        CMP #$1B; *EXIT
        BNE N25TERM
        RTS
N25TERM
        CMP #$0A
        BNE N3TERM
        LDA $0B1D; *TGLE LINEFEEDS
        EOR #$01
        STA $0B1D
        JSR FEDSWCH
        JMP ZAPCONT
N3TERM
        LDA $0B0D; *GFX
        BNE N4TERM
        LDX $FE
        LDA $1D00,X
        STA $FE
N4TERM
        SEI; *MODEM OUT
        LDX #$05
        JSR $FFC9
        LDA $FE
        JSR $EF79
NXTERM
        SEI
        LDX #$05
        JSR $FFC6
        JSR $EEEB; **MODEM IN
        STA $FE
        JSR $FFCC
        CLI
        LDA $FE
        CMP #$00
        BEQ ZAPCONT
        CMP #$03
        BEQ ZAPCONT
        CMP #$0A
        BNE CON2
        LDA $0B1D
        BEQ ZAPCONT
        LDA #$0A
CON2
        LDA $0B0D
        BNE CONTERM
        LDX $FE
        LDA $1C00,X
        STA $FE
CONTERM
        LDA #$00
        STA $F4
        STA $F5
        LDA $FE
        JSR $EF79
        JMP ZAPCONT
A80CHK
        LDA $0B1D
        BEQ A80CHK1
        SEI
        LDX #$05
        JSR $FFC9
        LDA #$0A
        JSR $EF79
        JSR $FFCC
        CLI
A80CHK1
        LDA $D7
        BNE A80CHK2
        RTS
A80CHK2
        LDA #$1B
        JSR $EF79
        LDA #$45
        JSR $EF79
        RTS
ONOFF
        BYTES "ONOFF"
LINFED
        BYTES "LINEFEEDS "
FEDSWCH
        LDA #$0D
        STA $FE
        JSR SEND
        LDX #$00
FED1
        LDA LINFED,X
        STA $FE
        JSR SEND
        INX
        CPX #$0A
        BNE FED1
        LDX #$00
        LDA $0B1D
        BNE FEDSW2
        LDX #$02
FED2
        LDA ONOFF,X
        STA $FE
        JSR SEND
        INX
        CPX #$05
        BNE FED2
        JMP FED3
FEDSW2
        LDA ONOFF,X
        STA $FE
        JSR SEND
        INX
        CPX #$02
        BNE FEDSW2
FED3
        LDA #$0D
        STA $FE
        JSR SEND
        RTS
        ;************** SET RETURN ONLINE BASIC POINTERS *****************
SETPOT
        LDA $120B; **TRAP VECTORS
        LDX $120C
        STA $3B02
        STX $3B03
        LDA $0B02; ** LAST END OF BASIC POINTERS
        LDX $0B03
        STA $3B04
        STX $3B05
        LDX #$FF
ZIN1
        INX
        LDA $00,X
        STA $3B0A,X
        CPX #$DB; ***ZERO PAGE
        BNE ZIN1
        PLA
        STA $3B06
        PLA; **STORE CURRENT
        STA $3B07
        PLA; **BASIC POSITIONS
        STA $3B08
        PLA
        STA $3B09
PHARTINE
        NOP; ***REPLACE LAST LEFT
        LDA $3B09
        PHA
        LDA $3B08
        PHA
        LDA $3B07
        PHA
        LDA $3B06
        PHA
        RTS
        ;************ ONLINE PART OF ONLINE BASIC RTINES ****************
        ;****GETIN**** $FFE4 *******
GETIN
        LDA $99
        BEQ GET2
        JMP $EEEB
GET2
        JSR $E797
        JSR GETINE
        LDA $FE
        CLC
        RTS
        ;****BSOUT**** $FFD2 *******
BSOUT
        PHA
        LDA $9A
        CMP #$04
        BCC BSO1
        PLA
        JMP $EF79
BSO1
        PLA
BSO2
        STX $0B6F
        STY $0B70
        PHA
        STA $FE
        JSR SEND
        JSR SLOWIT
        PLA
        LDX $0B6F
        LDY $0B70
        CLC
        RTS
SLOWIT
        LDA $0A1A; ***SLOWS OUTPUT FOR MODEM SYNC
        CMP $0A1B
        BNE SLOWIT
SLOW2
        LDA $0A21
        BNE SLOW2
        LDA $0A0F
        AND #$03
        BNE SLOW2
        RTS
        ;****BASIN**** $FFCF *******
BASIN
        LDA $99
        BEQ BSI2
        JMP $EF06
BSI2
        JSR $A845
        LDA $EC
        STA $E9
        LDA $EB
        STA $E8
        TYA
        PHA
        TXA
        PHA
        LDA $D6
        BEQ BSI4
        BPL BSI3
        JMP $C2A5
BSI3
        JMP $C2BC
BSI4
        JSR $E797
        JSR GETINE
        LDA $FE
        BEQ BSI4
        CMP #$0D
        BEQ BSI5
        JSR BSO2
        JMP BSI4
BSI5
        STA $D6
        LDA #$00
        STA $F4
        JSR $CBC3
        STX $0A30
        JSR $CBB5
        LDY $E6
        LDA $E8
        BMI BSI6
        CMP $EB
        BCC BSI6
        LDY $E9
        CMP $0A30
        BNE BSI7
        CPY $EA
        BEQ BSI8
BSI7
        BCS BSI9
BSI8
        STA $EB
BSI6
        STY $EC
        JMP $C2BC
BSI9
        JMP $C2A5
        ;************ TURN ON ONLINE BASIC *************
SETBAS
        LDA #$01
        STA $0B71
        LDA $33; **STRT FRE VARMEM
        LDX $34
        STA $2F; **STRT OF VARS
        STX $30
        STA $31; **STRT ARRAYS
        STX $32
        LDA $35; **BOTTOM STRINGS
        LDX $36
        STA $39; **TOP OF STRINGS
        STX $3A
        LDA #$FF; **NEW TRAP
        STA $120C
        JSR $F226; **CLOSE MOST FILES
        LDA #<BASIN
        LDX #>BASIN
        STA $0324  
        STX $0325
        LDA #<BSOUT
        LDX #>BSOUT
        STA $0326  
        STX $0327
        LDA #<GETIN
        LDX #>GETIN
        STA $032A  
        STX $032B
        LDA #$26; **CLOSEALL
        STA $032C
        LDA #$01
        STA $0B73
        RTS
        ;***** TURN OFF ONLINE BASIC - RETURN TO WHERE YOU CAME FROM *****
OFFBAS
        LDA #$00
        STA $0B71
        LDA #$80; **RUN MODE
        STA $7F
        LDA $3B02
        LDX $3B03
        STA $120B; **TRAP
        STX $120C
        LDA $3B04
        LDX $3B05
        STA $1210; **END OF PRG
        STX $1211
        LDA #$22 ; **CLOSEALL
        STA $032C
        LDA #$06 
        LDX #$EF
        STA $0324
        STX $0325
        LDA #$79 
        LDX #$EF
        STA $0326
        STX $0327
        LDA #$EB 
        LDX #$EE
        STA $032A
        STX $032B
        LDA #$00; ** NO AUTODO
        STA $0B72
        LDX #$DB
ZOT1
        LDA $3B0A,X
        STA $00,X
        DEX
        BNE ZOT1
        JMP PHARTINE
PRINT
        NOP; :OPEN1,8,15,"S0:ML2000,V1.0 2000":CLOSE1:SAVE"ML2000",8
