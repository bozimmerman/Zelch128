* = $2000
;.D V2.0a 2000
        JMP GETIT;8192 / 1000 / GET A$
        JMP GETINE;8195 / 2000 / GET ONE CHARACTER
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
        JMP MSGFIX; 8246 / 5300 / RESET FROM MSG BASIC
        JMP REST; 8249 / 4800 / SETUP I$
        JMP DEFINE; 8252 / 1500 / DEFINE I$
        JMP COPIFI; 8255/17000/COPY#2 TO #3
        JMP DRECFILE; 8258/18000/DIRECTORY
        JMP RELREC; 8261/19000/RECORD LENTH
;*********END OF JMP TABLE*********
;230,570,1250,2085,2086,2570,3245,3540,3615
IDD1            BYTE 65
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
IDD2            BYTE 90
;**************CREATE ONE CHARACTER INPUT A$*******************
GETIT
        LDA #$41
        STA $0B0C
        JSR REST;**SET UP A$="
        JSR GETINE;**GET IT
        LDA $FE
        BNE ISNTNULL; NOT NULL
        LDA #$00
        STA $FB
        JMP DEFINE
ISNTNULL
        LDY #$00
        LDA $FE
        STA ($FB),Y;** STORE IN MEMORY
        LDA #$01
        STA $FB;NOT NULL
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
                BYTE 34,58,158,56,50,51,55,58
IDD3
                BYTE 49
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
        LDX #$00
        JSR $FFC6
        JSR $EEEB
        CMP #$00
        BEQ SYSNULL
        CMP #$01
        BEQ SYSNULL
        STA $FE;***STORE SYSOP KEY
        CMP #$1B
        BNE NOCHAT
        LDA $0B0E
        BEQ CH1
        JMP EXOUT
CH1 
        JSR CHATMODE;JSR CHAT WILL GO****
NOCHAT
        CMP #$0A
        BNE EXOUT
        LDA #$01
        STA $0B0B
        JMP EXOUT
IDD4            BYTE 48
IDD5            BYTE 49
SYSNULL
        LDA $0B07
        BEQ USRCONT;SYSOP LOCAL
GONE
        LDA #$00
        STA $FE
        JMP EXXOUT
USRCONT
        LDX #$05
        JSR $FFC6;MODEM INPUT
        JSR $EEEB
        STA $FE;GET BYTE
        LDX #$00
        JSR $FFC6
        LDA $FE
        BEQ GONE;USER NULL
        CMP #$03
        BEQ GONE
        CMP #$01
        BEQ GONE
        LDA $0B9E
        STA $0B9D
        LDA $0B0D
        BNE EXOUT;GFX ON/OFF
        LDX $FE
        LDA $3B00,X
        STA $FE;ASCII TRANSLATE
EXOUT
        LDA $0B0E
        BNE EXXXXX;CHAT MODE
        LDA $FE
        JSR UPCASE
        STA $FE
        CMP #$5C
        BNE ONN1
        LDA $0B07
        BNE ONN1
        LDA #$00
        STA $FE
ONN1
        CMP #$A0
        BNE ONN
        LDA #$20
        STA $FE
ONN 
        LDA $FE
        CMP #$1B
        BEQ BADSTUF
        CMP #$22
        BNE EXXXXX;QUOTE
        LDA #$87
        STA $FE
EXXXXX
        LDA $0B22
        BEQ EXXOUT
        LDA $FE
        CMP #$13
        BNE EXXOUT
BADSTUF
        LDA #$00
        STA $FE
EXXOUT
        JSR BASRTINE
        JSR LOAD
        RTS;***YER GONE
UPCASE
        LDX $0B0F;**UPCASE RTINE
        CPX #$00
        BEQ RTCASE
        CMP #$0D
        BEQ RTCASE
        CMP #$13
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
        STA $0B10;TEMP STORAGE
        STY $0B11
        STX $0B12
LOAD
        LDA $0B10; TEMP RETRIEVAL
        LDY $0B11
        LDX $0B12
        RTS
IDD6
                BYTE 51

;*****************SEND ONE CHARACTER OUT RTINE*******************
SEND
        JSR SAVE
        LDX #$00
        JSR $FFC9
        JSR $3D0C
        LDA #$00
        STA $F4
        STA $F5;**KOTE/INSERT
        LDA $0B07
        BNE STARTSND;**SKIP SLOW
        JSR SLOWIT
        JMP STARTSND
NOPE
        JMP BADDEST
STARTSND
        LDA $FE
        CMP #$03
        BEQ NOPE;**RVS C
        CMP #$0D
        BEQ RVSK
        CMP #$0B
        BEQ RVSK
        CMP #$8B
        BNE ITT
RVSK
        JMP DO0D
ITT
        CMP #$5C
        BNE MSGBAS;***\ SIGN
        LDA $0B71
        BNE MSGNOP
        LDA $0B8A
        BEQ MSGNOP
        LDA $0B8E
        BNE MSGNOP
        LDA $0B89
        BEQ MSGCON;**DUN
        LDA #$02
        STA $0B89
        JMP BADDEST
MSGCON
        LDA #$01
        STA $0B89
        LDX #$02
        LDY #$1B;*PTERS
        STX $0B87
        STY $0B88
        JMP BADDEST
MSGBAS
        LDA $0B89
        BEQ MSGNOP
        JSR MSGQUIK
        JMP BADDEST
MSGNOP
        LDA $FE
        CMP #$87
        BNE NOQUOT
        LDA #$22
        STA $FE;**SAVE TO QUOTE
NOQUOT
        CMP #$13
        BNE NOCLR
        CMP $0B68
        BNE NOCLR
        LDA #$00;**NO 2-CLRS
NOCLR
        CMP #$93
        BNE NORTNH
        LDA #$01
        STA $0B92
        LDA #$93
NORTNH
        STA $FE
        STA $0B68;**PERMIN
        CMP #$88
        BNE NOFRMT;**RVS-H FORMAT
        LDA $0B63
        BEQ ISRTN;**40 COLS=RTN
        LDA $0B6B
        BNE ISRTN;**H PREVS=RTN
        LDA #$20
        STA $FE
        INC $0B6B
        JMP NOFRMT
IDD7            BYTE 57
ISRTN
        LDA #$0D
        STA $FE
        LDA #$00
        STA $0B6B
NOFRMT
        CMP #$0D
        BNE NOFRMT2;*MORE
        INC $0B92
        LDX $0BA3
        BEQ NOFRMT2
        LDX $F3
        BEQ NOFRMT2;**RVS OFF ANSI
        LDA #$92
        STA $FE
        JSR ANSII
        LDA #$00
        STA $0BA5
        LDA #$0D
        STA $FE
NOFRMT2
        CMP #$90
        BNE NOCYCL;*COLOR
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
        LDA $0B1C
        BEQ NOSTAR;*** SYSOP LOCAL OUTPUT - * MODEM OUTPUT
        LDA $FE
        CMP #$0D
        BEQ NOSTAR
        CMP #$14
        BEQ NOSTAR
        LDA $0B6E
        STA $FE
NOSTAR
        JSR ANSII;***ANSI ROUTINES
        LDA $0BA5
        BNE SYSSEND
        LDA $0B07
        BNE SYSSEND;****SYSOP LOCAL-NO MODEM OUTPUT
        LDA $0B0D
        BNE USERSEND;***GFX ON
        LDX $FE
        LDA $3C00,X
        STA $FE;*ASCII
USERSEND
        LDX #$05
        JSR $FFC9
        LDA $FE
        BEQ SYSSEND
        JSR $EF79
        LDA $FE
        CMP #$0D
        BNE SYSSEND
        LDA $0B1D
        BEQ SYSSEND
        LDA #$0A
        JSR $EF79;***LINEFEEDS
SYSSEND
        LDX #$00
        JSR $FFC9;***LOCAL SEND
        LDA $0B0D
        BNE NOTRANS;***GFX ON
        LDA $0BA5
        BNE NOTRANS;*ANSII COLOR
        LDA $0B07
        BEQ SYSKII;**LOCAL ASCII
        LDX $FE
        LDA $3C00,X
        STA $FE
SYSKII
        LDX $FE
        LDA $3B00,X
        STA $FE
NOTRANS
        LDA $FE
        JSR $C00C;**LO-OUT
BADDEST
        LDA #$00
        STA $D015;**SPRITE OFF
        JSR BASRTINE
        JSR LOAD
        RTS
IDD8            BYTE 49
BASRTINE
        LDA $0B71
        BNE BADGOOD
BASBAD
        RTS
IDD9            BYTE 65
BADGOOD
        LDA $0B72
        BEQ BADUP
        LDA $7F
        CMP #$80
        BEQ BADUP
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
        LDA $0B0B
        BEQ BASBAD
        LDA $0B64
        BNE BASBAD
        LDX #$1E
        STX $0B64
        JMP $4D3F
MSGQUP
        LDX $0B87
        LDY $FB
        STY $0B87
        STX $FB
        LDX $0B88
        LDY $FC
        STY $0B88
        STX $FC
        RTS
MSGQUIK
        JSR MSGQUP
        LDY #$00
        LDA $FE
        STA ($FB),Y
        INC $FB
        JMP MSGQUP
DO0D
        LDA #$00
        STA $0B89
        LDA $0B68
        CMP #$88
        BNE RTNNOH
        LDA #$00
        JMP NORTNH;***H WUZ PREVS
RTNNOH
        LDA #$00
        STA $0B6B
        LDA #$0D
        JMP NORTNH
ANSII
        LDA $0B0D
        BNE ANSGO
        LDA $0BA3
        BNE ANS2
ANSGO
        LDA #$00
        STA $0BA5
        JMP ANSG3
ANSG2
        LDA $0BA5
        STA $FE
ANSG3
        LDX #$00
        JSR $FFC9
        RTS
ANS2
        LDX #$05
        JSR $FFC9
        LDX #$00
ANSLP
        LDA $3A00,X
        BEQ ANSGO
        CMP $FE
        BEQ ANSDO;***IS IT CHAR
ANSNO
        INX
        LDA $3A00,X
        BNE ANSNO
        INX
        JMP ANSLP;**LOOP BACK
ANSDO
        INX
        LDA $3A00,X
        STA $0BA5
        LDA $0B07
        BNE ANSG2
        LDA #$1B
        JSR $EF79
        LDA #$5B
        JSR $EF79
ANSD2
        INX
        LDA $3A00,X
        BEQ ANSG2
ANSX
        JSR $EF79
        JMP ANSD2;**CONT
;****************INPUT ONE LINE OF I$********************
INPT
        JSR REST;***SET UP I$
        TAY
        STA $0B1E;***CLR COL
        LDA $D7
        BEQ INPTLP;**80 COL CRSR
        LDA #$1B
        JSR $EF79
        LDA #$45
        JSR $EF79
INPTLP
        JSR GETINE;***GET A CHAR
        LDA $0B0B
        BEQ NEND;**CHAR DROP
THEEND
        JMP DUNWRAP2
NEND
        LDA $FE
        BEQ INPTLP;**NULL LP
        LDA $0B1E
        CMP #$27
        BCS NOLNM
        LDA #$4F
        STA $0B20;*DEFAULT, WORD
        LDA #$27
        STA $0B67;*WRAPPING VALS
        LDY #$FF
LNMLP
        INY
        LDA $1F00,Y
        CMP #$88
        BNE LNXT;**REMOVE STRAY H
        LDA #$20
        STA $1F00,Y
LNXT
        CPY $FB
        BNE LNMLP
        LDY #$00
        LDA $0B65
        BEQ NOLNM;**PUT REG VALS
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
        CMP #$0D
        BEQ COINPT;**PASS OVR CHK
        CMP #$14
        BEQ COINPT;**PASS OVR CHK
        LDA $0B4F
        BEQ COINPT;**STPCHK
        LDA $FB
        CMP $0B1F
        BEQ INPTLP;**MAX CHARS
COINPT
        LDA $FE
        CMP #$9D
        BNE STGOOD;**CURSOR LFT
        LDA $0B1E
        BEQ STGOOD
        DEC $0B1E
STGOOD
        JSR UPRTINE
        LDA $0B1E
        CLC
        ADC $0B6C;***INC CURR COLUMN
        STA $0B1E
        LDA $FE
        CMP #$0D
        BNE NORTRN;***CR HIT
        JMP DUNWRAP2
NORTRN
        CMP #$14
        BEQ DELETE;***DEL HIT
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
        CMP #$11
        BNE NODN;**CRSR DN
        LDA #$91
        JMP SPECDEL
NODN
        CMP #$9D
        BNE NOLF;**CRSR LF
        LDA #$1D
        JMP SPECDEL
NOLF
        CMP #$1D
        BNE NORT;**CRSR RT
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
        LDA $FB;***CHK MAX CHARS
        CMP $0B1F
        BCC NOLINK;**LINE LINK
        LDY #$00
        LDA #$03
        STA ($FB),Y
        INC $FB
        JMP DEFINE;***AD LINK N GO
NOLINK
        LDY #$00
        LDA $FE
        STA ($FB),Y;***STORE IT
        INC $FB
        JSR SEND
        LDA $0B1E
        CMP $0B67
        BEQ WORDWRAP;**40 WRAP
        CMP $0B20
        BNE JPINLP;**OTHER WRAP
;**MAIN WORD WRAP ROUTINE**
WORDWRAP
        LDA #$00
        STA $0B21
        LDA $0B22
        BNE NOTDUN;**WW FLAG=0
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
        LDA $FB
        STA $FD;**WORK VECTORS
        LDA $FC
        STA $FE
        DEC $FD
        LDY #$00
        LDA ($FD),Y
        CMP #$88
        BEQ JPINLP;***DUN ALRDY
        CMP #$20
        BNE WRAPLOOP;**LAST=SPC
        LDA #$88
        STA ($FD),Y
        LDA $0B63
        BEQ CHKS1;**CHK COLS
        LDA $0B1E
        CMP #$30
        BCS CHKS1
        JMP INPTLP
CHKS1
        JMP DUNWRAP2
WRAPLOOP
        DEC $FD
        BEQ TEN2;**FIND SPACE LP
        INC $0B21
        LDA ($FD),Y
        CMP #$20
        BNE WRAPLOOP;***PUT THE H
TEN2
        LDA #$88
        STA ($FD),Y
CHKTEN
        LDA $0B21
        STA $0B00
        CMP #$10
        BCC NXTCHK;**OVR 10 CHARS
        LDA $0B63
        BEQ CHKS1
        LDA $0B1E
        CMP #$30
        BCS CHKS1
        JMP INPTLP
NXTCHK
        LDA $0B1E;**FIXING 80 LIMIT
        CMP $0B20
        BEQ CONWRAP
        LDA $0B63
        BEQ CONWRAP
        LDA $0B20
        SEC
        SBC $0B21;**SETIN NEW 80COL WW
        STA $0B20
        JMP INPTLP
CONWRAP
        INC $0B21
WRAPLP1
        INY;**PUT CHARS IN BUFFER
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
        LDA #$0D
        STA $FE;**CR
        JSR SEND
        JMP DEFINE;**GONE
REST
        LDA #$1F
        STA $FC;***SET I$
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
        LDA $0B89
        BNE BIGNXT
        LDA $FE
        CMP #$41
        BCC BIGNXT
        CMP #$5B
        BCS BIGNXT
        ORA #$80
        STA $FE
BIGNXT
        INC $0B8A
        JSR SEND
        INY
        LDA #$00
        STA $0B8A;**CHK MSGBAS
        JMP DOMSGS
NOMSG0
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
MSAVE
        STA $0B8B
        STX $0B8C
        STY $0B8D
MLOAD
        LDX $0B8C
        LDY $0B8D
        LDA $0B8B
        RTS
DOMSGS
        JSR MSAVE
        LDA $0B89
        CMP #$02
        BNE OUTMSGS
        JSR MSGQUP
        LDY #$00
        STY $0B89
        STY $0B8A
MSGLP
        LDA BTSS,Y
        STA ($FB),Y
        INY
        CPY #$08
        BNE MSGLP
        LDY #$00
        LDA #$3A
        STA $1B00
MSGLP2
        LDA BYTS,Y
        CMP $1B02
        BEQ BEDUNWI
        INY
        CPY #$09
        BNE MSGLP2
        JMP OUTMSGS
BEDUNWI
        TYA
        ASL
        TAX
        LDA MCMD,X
        TAY
        STA $1B01
        INX
        LDA MCMD,X
        STA $1B02
        CPY #$99
        BNE MOUTFG
        LDY #$00
        LDA #$3B
        STA ($FB),Y
MOUTFG
        LDA $3D
        STA $0B69
        LDA $3E
        STA $0B6A
        LDA #$00
        LDX #$1B
        STA $3D
        STX $3E
        JSR SWITCHO
        JSR MSGQUP
        RTS
MSGFIX
        LDA $0B69
        STA $3D
        LDA $0B6A
        STA $3E
        JSR CHANGO
OUTMSGS
        JSR MLOAD
        BNE OUTMSGS2
        JMP NOMSG0
OUTMSGS2
        JMP NOMSG1
BTSS            BYTE 32,58,158,56,50,52,54,58
BYTS            BYTE 83,71,77,63,75,87,80,70,36
MCMD            BYTE 32,158;SYS
                BYTE 32,141;GOSUB
                BYTE 153,202;MID$
                BYTE 153,32;PRINT
                BYTE 161,249;GETKEY
                BYTE 254,11;SLEEP
                BYTE 153,194;PEEK
                BYTE 153,184;FRE
                BYTE 153,199;CHR$
;******************SYSOP CHAT MODE******************
ENTRANCE         BYTE "chat mode"
EXITIT          BYTE "returning to the bbs"
CHATMODE
        JSR MSAVE
        LDA $0B0E
        BNE CHATGONE;*NOT IN TWICE
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
        LDA $FE
        BEQ CHATLP;*NO NULL
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
        JSR MLOAD
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
        STA $0B92
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
        JSR $FFCF
        LDX $1EFF
        CMP #$03
        BNE FILELP2
        STA $1E00,X
        JSR $FFCF
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
        CMP #$01
        BEQ LNKOUT;**EOF MARKER
        LDA $90
        BNE CSOUT
NOCSOUT
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
        CMP #$18
        BNE CSNDN
        INX
        LDA $1E00,X
        INX;***GET ACCESS
        CMP $0BA2
        BEQ CSENT
        JMP FILES;*LOW
CSNDN
        CMP #$08
        BNE CSNDN2;**40 COL
        LDA $0B63
        BNE CSNDN2;***80 COLS
        LDA #$0D
        STA $FE
        JSR SEND
        JMP FILES;***EXIT IF 40
CSNDN2
        INC $0B8A
        JSR SEND
        LDA #$00
        STA $0B8A
        LDA #$01
        JMP DOMSGS;**CHK MSGBAS
NOMSG1
        LDA $0B92
        CMP #$17
        BCC NOMSGY
        JSR MOREBY
NOMSGY
        LDA #$01
        STA $0B0F
        JSR GETINE
        LDA #$00
        STA $0B0F
        LDA $FE
        BEQ NOPAAS;*CHECK SPACEBAR
        JMP HOTRTINE;*CHK SPACEBAR, HOTKEYS
NOPAAS
        CPX $1EFF
        BEQ JPFILES
        INX
        JMP CSENT
JPFILES
        JMP FILES
LNKOUT
        STA $FF
        STX $0B11
        JSR $FFCF
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
        LDA #$00
        STA $FC
        LDA #$0E
        STA $FE
        JSR SEND
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
MOREBY
        LDA $0B8F
        BEQ NOMORE
        LDA #$00
        STA $0B92
        LDY #$00
MORELP
        LDA MORE,Y
        STA $FE
        JSR SEND
        INY
        CPY #$07
        BNE MORELP
MOREWT
        JSR PAAS
        LDY #$00
MORELP2 LDA #$14
        STA $FE
        JSR SEND
        INY
        CPY #$07
        BNE MORELP2
NOMORE
        RTS
MORE    BYTE "-pause-"
;******************GET ONE DISK LINK FILE******************
FILEGET
        LDA #$00
        STA $FD
        LDX #$02
        JSR $FFC6
FGETLOOP
        JSR $FFCF
        STA $FE
        LDA $90
        STA $FD
        BNE FGETEND;**EOF REAL
        LDA $FE
        CMP #$01
        BEQ FGETEND;FILE LINKER
        JMP FGETLOOP
FGETEND
        JSR $FFCF
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
        LDY #$00
        STA ($FB),Y;*1ST
        LDA $FD
        AND #$0F
        ADC #$30
        INY
        STA ($FB),Y;*2ND
        LDA #$3A
        INY
        STA ($FB),Y;*''
        LDA $FE
        AND #$F0
        LSR
        LSR
        LSR
        LSR
        ADC #$30
        INY
        STA ($FB),Y;*4TH
        LDA $FE
        AND #$0F
        ADC #$30
        INY
        STA ($FB),Y;*5TH
        LDA #$4D
        LDY #$06
        STA ($FB),Y;*'M'
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
        LDA $DD08
        JMP DEFINE
;***************SEND OUT DIRECTORY FORMAT***************
DIREC
        LDX #$02
        JSR $FFC6
        LDA #$00
        CLC;***MASKS 4 LOC/OB
        ADC $0B07
        ADC $0B71
        STA $0BA4
        LDA $0B22
        STA $0B37
        JSR $FFCF
        JSR $FFCF;*USELESS
DRECLP
        JSR $FFCF
        JSR $FFCF
        BNE NECOT;*EOF
        JMP DRECOUT
NECOT
        JSR $FFCF
        STA $FB;**LO BLKS
        JSR $FFCF
        STA $FC;**HI BLKS
        LDA $0BA4
        BNE SKPSW1
        JSR SWITCHO
SKPSW1
        LDA $FC
        LDX $FB
        JSR $8E32
        LDA $0BA4
        BNE SKPSW2
        JSR CHANGO
SKPSW2
        LDA #$20
        STA $FE
        JSR SEND
        LDX #$02
        JSR $FFC6
        LDY #$00;*****
DRECLP2
        JSR $FFCF
        BEQ DRUB
        CMP $FD
        BEQ QCHAR;*CHAR MASK
DRUM
        STA $1E00,Y
        INY
        JMP DRECLP2
DRUB
        STY $FC
        JSR $FFCC
        LDY #$00
DRECLP3
        LDA $1E00,Y;***********
        STA $FE
        JSR SEND
        LDA #$00
        STA $0B22
        JSR GETINE
        LDA $0B37
        STA $0B22
        LDA $FE
        CMP #$20
        BEQ DREGOT
        CMP #$13
        BNE KPDRNG
        JSR PAAS
KPDRNG
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
        JSR REST;*SET UP I$
        LDA #$00
        STA $FD
INLOOP
        JSR $FFCF
        STA $FE
        LDA $90
        BNE ENDFIL;*EOF
        LDA $FB
        CMP #$F0
        BEQ ENDFIL;*TOO LONG
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
        JSR $FFCF
        JSR $FFCF
        JSR $FFCF
        JSR $FFCF
        JSR $FFCF
        JSR $FFCF;**USELESS
BLOKLP
        JSR $FFCF
        CMP #$00
        BNE BLOKLP;*NU$L
        JSR $FFCF
        JSR $FFCF;*USELESS
        JSR $FFCF
        STA $0B26;*FILE BLOCKS
        JSR $FFCF
        STA $0B27
BLOKLP2
        JSR $FFCF
        CMP #$00
        BNE BLOKLP2
        JSR $FFCF
        JSR $FFCF;*USELESS
        JSR $FFCF
        STA $0B28;*DISK BLOCKS
        JSR $FFCF
        STA $0B29
        JSR $FFCC
        RTS
;******************FILE COUNTER*******************
COUNTFILE
        LDA #$00
        STA $0B2A
        STA $0B2B
        LDX #$02
        JSR $FFC6
        JSR $FFCF
        JSR $FFCF;*USELESS
COUNTLP
        JSR $FFCF
        JSR $FFCF
        JSR $FFCF
        JSR $FFCF;*MORE USELESS
COUNTLP2
        JSR $FFCF
        LDX $90
        BNE COUNTOUT;*EOF
        CMP #$00
        BNE COUNTLP2;*YES NULL
        INC $0B2A
        BNE COUNTLP
        INC $0B2B
        JMP COUNTLP
COUNTOUT
        SEC;***NO FREE OR HEADER
        LDA $0B2A
        SBC #$02
        STA $0B2A
        LDA $0B2B
        SBC #$00
        STA $0B2B
        JSR $FFCC
        RTS
ASCMSG          BYTE "ascii term"
GFXMSG          BYTE "graphics term"
;*******************ZAP TERM**********************
ZAPTERM
        JSR $FFCC
        JSR A80CHK
        LDA #$0D
        STA $FE
        JSR SEND
        LDX #$00
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
        CMP #$0B
        BNE ZAPBURP
        LDA #$0D
ZAPBURP
        STA $FE
        LDA $D3
        AND #$08
        BEQ N2TERM;*GFX CHANGE
ALTLP
        LDA $D3
        BNE ALTLP
        LDA $0B0D
        EOR #$01
        STA $0B0D
        JMP ZAPTERM
N2TERM
        LDA $FE
        BEQ NXTERM
        CMP #$0D
        BNE NO80CK
        JSR A80CHK
        LDA $FE
NO80CK  CMP #$1B
        BNE OTERM
        RTS
OTERM
        CMP #$0A
        BNE N3TERM
        LDA $0B1D
        EOR #$01
        STA $0B1D
        JSR FEDSWCH
        JMP ZAPCONT;*TGLE LINEFEEDS
N3TERM
        LDA $0B0D
        BNE N4TERM;*GFX
        LDX $FE
        LDA $3C00,X
        STA $FE
N4TERM
        JSR SLOWIT
        LDX #$05
        JSR $FFC9;*MODEM OUT
        LDA $FE
        JSR $EF79
NXTERM
        LDX #$05
        JSR $FFC6
        JSR $EEEB
        STA $FE;**MODEM IN
        JSR $FFCC
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
        LDA $3B00,X
        STA $FE
CONTERM
        LDA #$00
        STA $F4
        STA $F5
        JSR SLOWIT
        LDA $FE
        JSR $EF79
        JMP ZAPCONT;**OUTPUT TO SCREEN, EXIT
A80CHK
        LDA $0B1D
        BEQ A80CHK1
        LDX #$05
        JSR $FFC9
        LDA #$0A
        JSR $EF79
        JSR $FFCC
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
                BYTE "onoff"
LINFED
                BYTE "linefeeds "
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
        LDA $120B
        LDX $120C;**TRAP VECTORS
        STA $1B02
        STX $1B03
        LDA $0B02
        LDX $0B03;** LAST END OF BASIC POINTERS
        STA $1B04
        STX $1B05
        LDX #$FF
ZIN1
        INX
        LDA $00,X
        STA $1B0A,X
        CPX #$DB
        BNE ZIN1;***ZERO PAGE
        PLA
        STA $1B06
        PLA
        STA $1B07;**STORE CURRENT
        PLA
        STA $1B08;**BASIC POSITIONS
        PLA
        STA $1B09
PHARTINE
        NOP;***REPLACE LAST LEFT
        LDA $1B09
        PHA
        LDA $1B08
        PHA
        LDA $1B07
        PHA
        LDA $1B06
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
        LDA $0A1A
        CMP $0A1B
        BNE SLOWIT;***SLOWS OUTPUT FOR MODEM SYNC
SLOW2
        LDA $0A21
        BNE SLOW2
        LDA $0A0F
        AND #$03
        BNE SLOW2
        RTS
;****BASIN**** $EF06 *******
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
        LDA $33
        LDX $34;**STRT FRE VARMEM
        STA $2F
        STX $30;**STRT OF VARS
        STA $31
        STX $32;**STRT ARRAYS
        LDA $35
        LDX $36;**BOTTOM STRINGS
        STA $39
        STX $3A;**TOP OF STRINGS
        LDA #$FF
        STA $120C;**NEW TRAP
        JSR $F226;**CLOSE MOST FILES
        JSR SWITCHO
NOSWTCH
        LDA #$01
        STA $0B73
        RTS
SWITCHO
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
        LDA #$26   
        LDX #$F2
        STA $032C  
        STX $032D
        LDA #$00
        STA $0B64
        RTS
;***** TURN OFF ONLINE BASIC - RETURN TO WHERE YOU CAME FROM *****
OFFBAS
        LDA #$00
        STA $0B71
        STA $0B64
        LDA #$80
        STA $7F;**RUN MODE
        LDA $1B02
        LDX $1B03
        STA $120B
        STX $120C;**TRAP
        LDA $1B04
        LDX $1B05
        STA $1210
        STX $1211;**END OF PRG
        JSR CHANGO
        LDA #$00
        STA $0B72;** NO AUTODO
        LDX #$FF
ZOT1
        INX
        LDA $1B0A,X
        STA $00,X
        CPX #$DB
        BNE ZOT1
        JMP PHARTINE
CHANGO
        LDY #$04
CHA2
        LDA $0B92,Y
        STA $0323,Y
        DEY
        BNE CHA2
        LDY #$04
CHA3
        LDA $0B96,Y
        STA $0329,Y
        DEY
        BNE CHA3
        RTS
;******COPYFILE #2TO#3*********
COPIFI
        LDA #$00
        LDX #$1C;**BFERS
        STA $FB
        STA $FD
        STX $FC
        STX $FE
        JSR $FFCC;***CLEARIT
        LDX #$02
        JSR $FFC6
FIGET
        JSR $FFCF
        LDY #$00
        STA ($FD),Y;**STORE
        INC $FD
        BNE FIKP
        INC $FE;***INC BUFFERS
FIKP
        LDA $90
        BNE FIERR
        LDA $FD
        LDX $FE
        CPX #$1F
        BNE FIGET
        CMP #$FE
        BNE FIGET
        LDA #$00;***SEND IT ON OUT
FIERR
        STA $FF
        JSR $FFCC;***CLEAR EM AGAIN
        LDX #$03
        JSR $FFC9
CKBEEF
        LDA $FB
        LDX $FC
        CPX $FE
        BNE FIKP2;**CHECK BFERS
        CMP $FD
        BNE FIKP2
        JSR $FFCC
        LDA $FF
        BNE COPIXIT
        JMP COPIFI
COPIXIT
        RTS;***LEAVEIT
FIKP2
        LDY #$00
        LDA ($FB),Y;**SNDS
        JSR $FFD2
        INC $FB
        BNE FIKP3
        INC $FC
FIKP3
        JMP CKBEEF
DRECFILE
        JSR REST
        JSR $FFCC
        LDX #$02
        JSR $FFC6
        JSR $FFE4
        JSR $FFE4;**BEGIN HERE
        LDX $90
        BNE DFOUT;**EOF
        JSR $FFE4
        STA $0B9F;**LO BLKS
        JSR $FFE4
        STA $0BA0;**HI BLKS
        JSR $FFCC
        LDX #$02
        JSR $FFC6;****
DFLOOP
        JSR $FFE4
        LDX $90
        BNE DFOUT
        CMP #$22
        BNE DFLOOP
DFLP2
        JSR $FFE4
        LDX $90
        BNE DFOUT
        CMP #$22
        BEQ DFK2
        CMP $FD
        BEQ DFLP2;*CHAR MASK
        LDY #$00
        STA ($FB),Y
        INC $FB
        JMP DFLP2
DFK2
        JSR $FFE4
        CMP #$20
        BEQ DFK2
        LDY #$00
        TAX
        LDA #$2C
        STA ($FB),Y
        TXA
        INC $FB
        STA ($FB),Y
        INC $FB
DFK22
        JSR $FFE4
        BNE DFK22
        LDA #$00
        STA $FE
        JSR $FFCC
        JMP DEFINE
DFOUT
        INC $FE
        JSR $FFCC
        RTS
;****************  FIND RECORD LENGTH OF REL FILE O$*********************
RELREC
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
        LDX #$02
        JSR $FFC6
RELP
        LDY #$00
RELP2
        LDX #$FC
        JSR LDAFAR2
        STA $FF
        JSR $FFE4
        LDX $90
        BNE RELOT
        CMP $FF
        BNE RELP
        INY
        CPY $FB
        BNE RELP2
REC2
        JSR $FFE4
        INC $FB
        LDX $FB
        CPX #$13
        BNE REC2
RELOT2
        STA $0BA1
        JSR $FFCC
        RTS
RELOT
        LDA #$00
        JMP RELOT2
PRINT
        NOP
        ;OPEN1,8,15,"S0:ML2000,V3.0 2000":CLOSE1:SAVE"ML2000",8


