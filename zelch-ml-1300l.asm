* = $1300
;.D L-XFER 1300
        JMP BITLIST
        JMP BITEDIT
LDAFAR2
        TXA
        LDX #$01
        JSR $FF74
        RTS
BITLIST
        JSR $FFCC
        LDY #$09
        LDX #$2F
        JSR LDAFAR2
        CMP $FB
        BCS BITBURP
        STA $FB
BITBURP
        INY
        LDX #$2F
        JSR LDAFAR2
        STA $FC
        INY
        LDX #$2F
        JSR LDAFAR2
        STA $FD
        LDY #$00
BITLOOP
        LDX #$FC
        JSR LDAFAR2
        LDX #$01
        STX $F5
        STA $1F00,Y
        JSR $FFD2
        LDA #$00
        STA $F5
        STA $F4
        INY
        CPY $FB
        BNE BITLOOP
        RTS
BITEDIT
        JSR $FFCC
        JSR $2039
        LDY #$09
        LDX #$2F
        JSR LDAFAR2
        STA $FB
        JSR BITLIST
        LDA $FA
        BNE BITSHIT
        LDA #$F0
BITSHIT
        STA $FA
        LDY $FB
DELOP
        LDA #$9D
        JSR $FFD2
        DEY
        BNE DELOP
        LDA #$00
        STA $FE
GETKEY
        JSR $FFE4
        STA $FC
        JSR $3D0C
        LDA $FC
        BEQ GETKEY
        CMP #$22
        BNE NOKOTE
        LDA #$87
        STA $FC
NOKOTE
        CMP #$0D
        BNE NOGO
GOGO 
        JMP OUTGOGO
NOGO
        LDA $0B4D
        BNE GOGO
        LDA $D4
        CMP #$53
        BCC NOT212
        CMP #$57
        BCS NOT212
        JMP NOTFIV
NOT212
        LDA $FC
        CMP #$9D
        BEQ THIS1
        CMP #$11
        BNE NOTBK
THIS1
        LDA $FE
        BEQ GETKEY
        DEC $FE
        LDA #$9D
        JSR $FFD2
        JMP GETKEY
NOTBK
        LDA $FC
        CMP #$1D
        BEQ THIS2
        CMP #$91
        BNE NOTUP
THIS2
        LDA $FE
        CMP $FB
        BCC DOIT
        JMP GETKEY
DOIT
        INC $FE
        LDA #$1D
        JSR $FFD2
        JMP GETKEY
NOTUP
        LDA $FC
        CMP #$14
        BEQ DELETE
        CMP #$94
        BNE NOINST
        JMP INSERT
NOINST
        LDA $D3
        CMP #$05
        BNE NOTFIV
        LDA $FC
        ORA #$80
        STA $FC
NOTFIV
        LDX $FE
        INX
        CPX $FB
        BCC NOSHIT
        BEQ NOSHIT
        CPX $FA
        BCS JPGT
        LDY $FB
        LDA $FC
        STA $1F00,Y
        INY
        STY $FB
PRINT
        LDA #$01
        STA $F4
        LDA $FC
        JSR $FFD2
        LDA #$00
        STA $F4
        STA $F5
        INC $FE
        JMP GETKEY
NOSHIT
        LDX $FE
        CPX $FA
        BCS JPGT
        LDY $FE
        LDA $FC
        STA $1F00,Y
        JMP PRINT
OUTGOGO
        LDA #$0D
        JSR $FFD2
        LDA #$0D
        JSR $FFD2
        LDA #$1F
        STA $FC
        JMP $203C
JPGT
        JMP GETKEY
DELETE
        LDA $FB
        BEQ JPGT
        LDA $FE
        BEQ JPGT
        LDA $FC
        JSR $FFD2
        DEC $FE
        DEC $FB
        LDY $FE
LOOP2 
        INY
        LDA $1F00,Y
        DEY
        STA $1F00,Y
        INY
        CPY $FB
        BCC LOOP2
        JMP GETKEY
INSERT
        LDA $FB
        CMP $FA
        BCS JPGT
        LDA $FC
        JSR $FFD2
        LDA #$00
        STA $F4
        STA $F5
        INC $FB
        LDY $FB
LOOP3 
        DEY
        LDA $1F00,Y
        INY
        STA $1F00,Y
        DEY
        CPY $FE
        BNE LOOP3
        LDA #$20
        STA $1F00,Y
        JMP GETKEY
PRINT2
        NOP
        ;OPEN1,8,15,"S0:ML1300L,L-XFER 1300":CLOSE1:SAVE"ML1300L",8


