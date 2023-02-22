; Machine language for 128dle

* = $8C00
        ;.D GAM.128DLML.BIN
BLOCKS = $9348
INDEX = $8E00
PTR = $FE
EOALL = $F86E
        JMP GETWORD
        JMP CHKWORD
; THE INPUT BUFFER
INPT
        byte 0,0,0,0,0
BLKST
        byte 0,0
BLKEN
        byte 0,0
INREF
        byte 0,0,0,0,0
FLCTR
        byte 0,0
; *** INCREASE PTR BY 2
INCPTR2
        INC PTR
        BNE INCP2
        INC PTR+1
INCP2
        INC PTR
        BNE INCP3
        INC PTR+1
INCP3
        RTS
; *** INCREASE THE FIRST LETTER TRACKER
INCFL
        INC FLCTR+1; CLC = ALL GOOD, SEC = ALL DONE
        LDA FLCTR+1
        CMP #$5B
        BCC INCFL2
        LDA #$41
        STA FLCTR+1
        INC FLCTR
        CLC
INCFL2
        RTS
; *** GET A WORD FROM THE LIST, GIVEN AN INDEX IN INPT
GETWORD
        ASL INPT
        ROL INPT+1
        LDA INPT
        CLC
        ADC #<BLOCKS
        STA INREF
        LDA INPT+1
        ADC #>BLOCKS
        STA INREF+1
; OK, NOW FIND THE HEADER LETTERS
        LDA #<INDEX
        STA PTR
        LDA #>INDEX
        STA PTR+1
        LDA #$41; STORE 'A' EVERYWHERE
        STA FLCTR
        STA FLCTR+1
        SEI
;STA ONRAM
; START THE SCAN
GW1
        LDY #1
        LDA (PTR),Y
        BEQ GW2
        LDA FLCTR
        STA INPT
        LDA FLCTR+1
        STA INPT+1
GW2
        JSR INCFL
        BCS GW3; IF CS, THEN JUST FAIL
        JSR INCPTR2
; OK, NOW COMPARE TABLE PTR TO INREF
        LDY #1
        LDA (PTR),Y
        BEQ GW1
        CMP INREF+1
        BCC GW1; LESS THAN, SO TRY AGAIN.
        BNE GW3; GREATER THAN, SO MOVE ONTO WIN!
        DEY
        LDA (PTR),Y
        CMP INREF
        BCC GW1; LESS THAN, SO TRY AGAIN
        BNE GW3; GREATER THAN, SO MOVE ONTO WIN!
; EQUAL, SO DECLARE THIS THE WINNER
        LDA FLCTR
        STA INPT
        LDA FLCTR+1
        STA INPT+1
; WE NOW KNOW THE FIRST TWO LETTERS
; WE NOW HAVE TO FIND THE LAST 3 LETTERS
GW3
        LDA INREF
        STA PTR
        LDA INREF+1
        STA PTR+1
        LDY #0; IS COMMONPRINT
        LDA (PTR),Y
        AND #$80; YES! CONT...
        BNE GW35
        STA INPT; NO, FAIL
;STA ONROM
        CLI
        RTS
GW35
        LDY #1
        LDA (PTR),Y
        AND #$1F
        CLC
        ADC #$41
        STA INPT+4; WE HAVE THE LAST LETTER
        LDA (PTR),Y
        STA INPT+3
        DEY; GRAB FIRST TWO BITS
        LDA (PTR),Y
        LSR
        ROR INPT+3
        LSR
        ROR INPT+3
        LSR INPT+3; NOW SHIFT AWAY THE OLD NUMBER
        LSR INPT+3
        LSR INPT+3; WE NOW HAVE THE 4TH LETTER
        LDA INPT+3
        CLC
        ADC #$41
        STA INPT+3
        LDA (PTR),Y
        AND #$7F; CLEAR COMMON BIT
        LSR
        LSR
        CLC
        ADC #$41
        STA INPT+2; WE NOW HAVE THE 3RD LETTER
;STA ONROM
        CLI
        RTS
; CHECK THE WORD IN INPT AGAINST THE LIST
CHKWORD
        LDA INPT+2
; FIRST CONVERT LAST 3 LETTERS TO 2-BYTE CODE
        SEC
        SBC #$41
        STA INREF
        LDA INPT+3
        SEC
        SBC #$41
        STA INREF+1
        LDA INPT+4
        SEC
        SBC #$41
        STA INREF+2
; OK, ALL 3 BYTES IN INREF->INREF2 AS OFFSETS 0-25
        LDA INREF+1
        ASL
        ASL
        ASL
        ASL
        ASL
        CLC
        ADC INREF+2
        STA INREF+2
; OK INREF 2 HAS FIRST FULL CODED BYTES
        LDA INREF
        ASL
        ASL
        STA INREF; FIRST LETTER NOW POSITIONED
        LDA INREF+1
        LSR
        LSR
        LSR
        CLC
        ADC INREF
        STA INREF+1
; OK, NOW INREF+1 AND INREF+2 HAVE THE BYTES!
        SEI
;STA ONRAM
        LDA #<INDEX
        STA PTR
        LDA #>INDEX
        STA PTR+1
        LDA #$41
        STA FLCTR
        STA FLCTR+1
        CLC
        BCC CHK1
; START THE SEARCH!
CHK0
        JSR INCPTR2; INCREASE THE HEADER POINTER
        JSR INCFL
        BCC CHK1
        LDA #0; RECORD A FAIL
        STA INPT
;STA ONROM
        CLI
        RTS
CHK1
        LDA FLCTR
        CMP INPT
        BNE CHK0
        LDA FLCTR+1
        CMP INPT+1
        BNE CHK0
; WE NOW HAVE PTR TO THE RIGHT 3 LETTER TABLE, FIRST 2 LETTERS MATCHED
        LDY #1
        LDA (PTR),Y
        STA BLKST+1
        BNE CHK2
        STA INPT; FOUND LETTERS, BUT NO WORDS, SO FAIL
;STA ONROM
        CLI
        RTS
CHK2
        DEY; SET UP THE TABLE PERUSAL
        LDA (PTR),Y
        STA BLKST
; WE NEED BLKEND TO BE RIGHT, BUT ITS TRICKY
CHK2A
        JSR INCPTR2
        JSR INCFL
        BCC CHK2B
        LDA #<EOALL
        STA BLKEN
        LDA #>EOALL
        STA BLKEN+1
        SEC
        BCS CHK2C
CHK2B
        LDY #1
        LDA (PTR),Y; IF ITS BLANK, ITS NO GOOD
        BEQ CHK2A
        STA BLKEN+1
        DEY
        LDA (PTR),Y
        STA BLKEN
CHK2C
        LDA BLKST; ALMOST READY TO START
        STA PTR
        LDA BLKST+1
        STA PTR+1
        SEC
        BCS CHK5
; BEGIN WORD BLOCK PERUSAL
CHK3
        JSR INCPTR2
        LDA PTR+1
        CMP BLKEN+1
        BCC CHK5
        LDA PTR
        CMP BLKEN
        BCC CHK5
CHK4
        LDA #0; REACHED END, AND NOT FOUND, SO...
        STA INPT
;STA ONROM
        CLI
        RTS
CHK5
        LDY #0; COMPARE THE BY
        LDA (PTR),Y
        AND #$7F; CLEAR COMMON BIT
        CMP INREF+1
        BNE CHK3; FIRST BYTE COMPARE
        INY
        LDA (PTR),Y
        CMP INREF+2
        BNE CHK3; 2ND BYTE COMPARE
        LDA #$FF
        STA INPT; WINNER FOUND!
;STA ONROM
        CLI
        RTS
