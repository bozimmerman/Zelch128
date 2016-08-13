

* = $3D00
;.D V3.0 3D00
; *** INTERRUPT/ MISC ROUTINES.
        JMP SETUP; 15616 / 1000 / SETUP INITIAL POINTERS/INITIALIZE INTERRUPTS
        JMP LOCKUPS; 15619 / 2000 / INTERRUPTS
        JMP OVERLAY; 15622 / 3000 / SET UP OVERLAY POINTERS
        JMP UNDERLAY; 15625 / 4000 / RESET BASIC VECTORS
        JMP CURSOR; 15628 / 5000 / 40 COLUMN CURSOR CONTROL
        JMP ONWINDOW; 15631 / 6000 / SEND STRING TO POSITION ON WINDOW
        JMP CLEAR1; 15634 / 7000 / SET VARS FOR CLEAR
        JMP CLEAR2; 15637 / 7500 / RESET VARS FOR CLEAR
;******************SETUP INITIAL IMPORTANT VALUES********************
SETUP
        SEI; ITS A DIRTY JOB...
        LDA $0314
        STA PLACE
        LDA $0315
        STA PLACE+1; IRQ VECTORS
        LDA #$03
        STA $0314
        LDA #$3D
        STA $0315; REPLACE WITH NEW IRQ
        LDX $0BA9; * SAVE RAMDOS DRIVE
        LDY #$00
        TYA;***CLEAR POINTER AREA
CLRLOP
        STA $0B02,Y
        INY
        CPY #$F0
        BNE CLRLOP
        STX $0BA9; * RESTORE RAMDOS DRIVE
        LDA $D7
        CMP #$80
        BEQ CUR80; CHECK COLUMNS
        LDA #$38
        STA $1FF8; USING SPRITE NUMBER 1
        LDA #$01
        STA $D015; TURN SPRITE ON
        LDA #$00
        STA $D017
        STA $D01B
        STA $D01C
        STA $D01D; DEFAULTS
        LDA #$00
        STA $D020
        STA $D021; BACKGROUND DEFAULTS
        JMP CUR40
CUR80
        NOP;PUT 80 COL CURSOR SETUP HERE
CUR40
        CLI
        RTS
PLACE
        NOP
        NOP
;***********************INTERRUPT ROUTINES*****************
LOCKUPS
        SEI
        LDA $0B07
        BNE NOCHK
        LDA $DD01;****IGNORE CARRIER CHECKS FOR SYSOP
        AND $0B24
        CMP $0B25
        BNE NOCHK
        JMP LOGOFF;**CARRIER FAIL
NOCHK
        LDA $0B62
        BEQ LOCHK
        LDA $DD0A
        CMP #$05
        BNE NOCHK2
        LDA $DD0B
        CMP #$12
        BNE NOCHK2
        LDA #$00
        STA $0B62
LOCHK
        LDA $DD0A
        BNE NOCHK2
        LDA $DD0B
        CMP $0B90
        BNE LICHK
        LDA $0B91
        BNE LICHK
        LDA #$01
        STA $0B91
LICHK
        CMP #$12
        BNE NOCHK2
        LDA $0B40
        LDX $0B3F
        CMP $0B40,X
        BEQ SKP1
        INC $0B40
        JMP SOCHK
SKP1
        LDA #$01
        STA $0B40
        LDA $0B3F
        CMP #$0C
        BEQ SOCHK2
        INC $0B3F
        JMP SOCHK
SOCHK2
        LDA #$01
        STA $0B3F
        INC $0B2F
SOCHK
        LDA #$01
        STA $0B62
NOCHK2
        LDA $0B08
        BEQ LOGOFF
        LDA $D3
        AND #$08;***CHECK ALT
        STA $0B4D
        BEQ NOALT
        LDA $0B71
        BEQ NOALT
        LDA $0B72
        BNE NOALT
        JSR LOCKALT
NOALT
        LDA $DC00
        CMP #$6F
        BNE INRR
        LDA $D4
        CMP #$58
        BNE INRR
        LDA #$08
        STA $0B4D;**DO BUTTON
INRR
        LDA $0B09
        BEQ TIMEUP; TIME UP
        LDA $0B0A; CHECK A TICK
        CMP $DD0A
        BNE INRC
        JMP OUTA
TIMEUP
        LDA #$00
        STA $0B08
        STA $0B09
LOGOFF
        LDA #$01
        STA $0B0B;***LOGOFFFLAG
OUTA
        LDA $DD08
        JMP (PLACE); GOODBYE
INRC
        LDA $DD0A
        STA $0B0A
        DEC $0B09;*****LOSE ONE TICK
        DEC $0BA7
        LDA $0B09
        BNE SLTM
        LDA $0BA7
        BEQ TIMEUP
        SLTM NOP
        LDA $0B9E
        BEQ INRR;**CHK IDLE
        LDA $0B07
        BNE INRR
        DEC $0B9D
        BNE INRR
        JMP TIMEUP
;**************SET UP BASIC OVERLAY NEXTS****************
OVERLAY
        LDA $0B05
        BNE OVRCONT
        LDA $1210
        STA $0B02
        LDA $1211
        STA $0B03; SAVE END BASIC POINTERS
        LDA $2D
        STA $0B04
        LDA $2E
        STA $0B05; SAVE START OF BASIC POINTERS
OVRCONT
        LDA $0B02
        SEC
        SBC #$02
        STA $2D
        LDA $0B03
        SBC #$00
        STA $2E
        LDA #$01
        STA $0B06
        RTS
LOCKALT
        LDY #$00
        ALP LDA BIXIT,Y
        STA $034A,Y
INY:CPY
        #$08
        BNE ALP
        STY $D0
        RTS
BIXIT
        .BYTE 83 89 83 56 50 52 51 13
;**********RESTORE OLD BASIC POINTERS***************
UNDERLAY
        LDA $0B06
        BEQ ALLSET
        LDA $0B04
        STA $2D
        LDA $0B05
        STA $2E; RESET START OF BASIC
ALLSET
        LDA #$00
        STA $0B06
        RTS
;*************40 COLUMN CURSOR CONTROLER******************
CURSOR
        LDA $D7
        CMP #$80
        BEQ CURS80; SKIP IF 80 COLUMNS
        LDA #$01
        STA $D015
        LDA #$38
        STA $1FF8
        STA $07F8
        LDA $F1
        STA $D027; SPRITE COLOR
        LDA $EB; CURSOR Y COORD CONTROL
        CLC
        ASL
        ASL
        ASL
        ADC #$32
        STA $D001
        LDA $EC; CURSOR X COORD CONTROL
        CMP #$28
        BCC OVRBDR;OVER BOUNDRY
        SEC
        SBC #$28
OVRBDR
        CMP #$1F
        BCS SKIP0;FORGOT WHAT THIS DOES
        ASL
        ASL
        ASL
        ADC #$08
        STA $D000
        LDA #$00
        STA $D010;LEFT SIDE OF BORDER
        JMP CURS80
SKIP0
        SEC
        SBC #$1F
        ASL
        ASL
        ASL
        STA $D000
        LDA #$01
        STA $D010;RIGHT SIDE OF BORDER
CURS80
        RTS
;**************ROUTINE TO POSITION A STRING ON THE WINDOW****************
ONWINDOW
        LDY #$00
ONWINLP
        LDA $E0,Y
        STA $0B30,Y;*TEMP STORAGE
        INY
        CPY #$0F
        BNE ONWINLP
        LDA #$00
        STA $E5
        STA $E6;* RESET WINDOWS
        LDA #$18
        STA $E4
        LDA $EE
        STA $E7
        LDA $0B2D
        STA $EC
        LDA $0B2E
        STA $EB
        JSR $C15C;*SET CRSR POSITIONS
        LDY #$09
        LDA #$2F
        LDX #$01
        JSR $FF74
        STA $FB;*BEGIN STRING OUT
        INY
        LDA #$2F
        LDX #$01
        JSR $FF74
        STA $FC
        INY
        LDA #$2F
        LDX #$01
        JSR $FF74
        STA $FD
        LDY #$00
ONWINLP2
        LDA #$FC
        LDX #$01
        JSR $FF74
        STA $FE
        JSR $FFD2;*SEND STRING
        INY
        CPY $FB
        BNE ONWINLP2
        LDY #$00
ONWINLP3
        LDA $0B30,Y
        STA $E0,Y;*RESTORE OLD VALUES
        INY
        CPY #$0F
        BNE ONWINLP3
        LDA #$00
        STA $F3
        STA $F4
        STA $F5
        RTS
;****************ROUTINE TO SET VAR POINTERS BEFORE CLR*******************
CLEAR1
        LDA $032C
        STA $0B51
        LDA $032D
        STA $0B52
        LDY #$00
CLRLP
        LDA $2F,Y
        STA $0B53,Y
        INY
        CPY #$0D
        BNE CLRLP
        LDA #$EF
        STA $032C
        LDA #$84
        STA $032D
        RTS
        STA $7D
        STY $7E
        JSR $5AE1
        LDX #$1B
        STX $18
        PLA
        TAY
        PLA
        LDX #$FA
        TXS
        PHA
        TYA
        PHA
        LDA #$00
        STA $1203
        STA $12
        STA $03DF
        CLI
        RTS
;****************ROUTINE TO RESTORE POINTERS AFTER CLR*******************
CLEAR2
        LDA $0B51
        STA $032C
        LDA $0B52
        STA $032D
        LDY #$00
CLRLP2
        LDA $0B53,Y
        STA $2F,Y
        INY
        CPY #$0D
        BNE CLRLP2
        RTS
PRINT
        NOP
        ;
        ;'OPEN1,8,15,"S0:ML3D00,V3.0 3D00":CLOSE1:SAVE"ML3D00",8


