* =$1300

                    ; x-modem source for zelch 2.0a

kCHKIN = $FFC6
kCHKOUT = $FFC9
kCLRCHN = $FFCC
kCHRIN = $FFCF
kGETIN = $FFE4
kCHROUT = $FFD2
kRDTIM = $FFDE
kREADST = $FFB7

L1300               jmp L1435

                    byte $4c,$ca,$14,$81,$80,$0,$0
                    byte $0,$0,$0,$0,$0,$0

S1310               lda #$00
                    sta $1d01
                    sta $1c01
                    sta $1d83
                    sta $1d84
                    sta $1c04
                    sta $1c05
                    sta $130b
                    lda #$ff
                    sta $1d02
                    sta $1c02
                    lda #$01
                    sta $1d00
                    sta $1c00
                    rts 
                    
S1338               jsr kCLRCHN
                    ldx #$02
                    jsr kCHKIN
                    ldy #$00
L1342               tya 
                    asl a
                    bcs L136e
                    jsr kCHRIN
                    tax 
                    lda $90
                    bne L1356
                    txa 
                    sta $1d03,y
                    iny 
                    clc 
                    bcc L1342
L1356               and #$40
                    sta $130b
                    beq L1342
                    txa 
                    sta $1d03,y
L1361               iny 
                    tya 
                    asl a
                    bcs L136e
                    lda #$00
                    sta $1d03,y
                    clc 
                    bcc L1361
L136e               sty $02
                    inc $1d01
                    dec $1d02
                    jsr kCLRCHN
                    ldx #$05
                    jsr kCHKOUT
                    ldx #$00
                    stx $1d83
L1383               lda $1d83
                    clc 
                    adc $1d00,x
                    sta $1d83
                    inx 
                    cpx #$83
                    bne L1383
S1392               ldx #$00
L1394               lda $1d00,x
                    jsr kCHROUT
                    inx 
                    cpx #$84
                    bne L1394
                    jsr kCLRCHN
                    rts 
                    
L13a3               jsr kCLRCHN
                    rts 
                    
S13a7               jsr kRDTIM
                    sty $130d
                    stx $130e
                    sta $130f
                    rts 
                    
S13b4               byte $ad,$06,$00,$ae,$07,$00,$ac,$08,$00
                    jsr S13a7
                    lda #$b8
                    clc 
                    adc $130f
                    sta $130f
                    lda #$0b
                    adc $130e
                    sta $130e
                    lda #$00
                    adc $130d
                    sta $130d
                    byte $ad,$06,$00,$ae,$07,$00,$ac,$08,$00
                    rts 
                    
L13e3               byte $8d,$06,$00,$8e,$07,$00,$8c,$08,$00
                    jsr S13a7
                    lda #$68
                    clc 
                    adc $130f
                    sta $130f
                    lda #$01
                    adc $130e
                    sta $130e
                    lda #$00
                    adc $130d
                    sta $130d
                    byte $ad,$06,$00,$ae,$07,$00,$ac,$08,$00
                    rts 
                    
S1412               byte $8d,$06,$00,$8e,$07,$00,$8c,$08,$00
                    jsr kRDTIM
                    cmp $130f
                    txa 
                    sbc $130e
                    tya 
                    sbc $130d
                    php 
                    byte $ad,$06,$00,$ae,$07,$00,$ac,$08,$00
                    plp 
                    rts 
                    
L1435               jsr kCLRCHN
                    jsr S1310
                    ldx #$05
                    jsr kCHKIN
                    jsr S13b4
L1443               jsr kGETIN
                    cmp #$15
                    beq L1456
                    jsr S1412
                    bcc L1443
                    lda #$00
                    sta $02
                    jmp L13a3
                    
L1456               jsr S1338
L1459               jsr S13b4
                    ldx #$05
                    jsr kCHKIN
L1461               jsr kGETIN
                    cmp #$06
                    beq L149e
                    cmp #$18
                    bne L147b
                    jsr kCLRCHN
                    lda #$58
                    jsr kCHROUT
                    lda #$00
                    sta $02
                    jmp L13a3
                    
L147b               cmp #$15
                    bne L1492
                    jsr kCLRCHN
                    lda #$3a
                    jsr kCHROUT
                    ldx #$05
                    jsr kCHKOUT
                    jsr S1392
                    jmp L1459
                    
L1492               jsr S1412
                    bcc L1461
                    lda #$00
                    sta $02
                    jmp L13a3
                    
L149e               lda $130b
                    bne L14ae
                    jsr kCLRCHN
                    lda #$2d
                    jsr kCHROUT
                    jmp L1456
                    
L14ae               jsr kCLRCHN
                    ldx #$05
                    jsr kCHKOUT
                    lda #$04
                    jsr kCHROUT
                    jsr kCLRCHN
                    lda #$2a
                    jsr kCHROUT
                    lda #$80
                    sta $02
                    jmp L13a3
                    
L14ca               tsx 
                    stx $130c
                    jsr S1310
                    jsr kCLRCHN
                    lda $0a18
                    sta $0a19
                    ldx #$05
                    jsr kCHKOUT
                    lda #$15
                    jsr kCHROUT
                    lda #$00
                    sta $1c81
                    sta $1c80
L14ec               jsr L13e3
                    inc $1c01
                    dec $1c02
                    jsr kCLRCHN
                    ldx #$05
                    jsr kCHKIN
L14fd               jsr kGETIN
                    pha 
                    lda $0a14
                    beq L1513
                    and #$08
                    beq L1513
                    pla 
                    jsr S1412
                    bcc L14fd
                    jmp L1577
                    
L1513               jsr L13e3
                    ldy $1c81
                    pla 
                    sta $1d00,y
                    iny 
                    sty $1c81
                    cpy #$84
                    bne L14fd
                    lda $1d00
                    cmp #$01
                    bne L1577
                    lda $1d01
                    cmp $1c01
                    bne L1577
                    lda $1d02
                    cmp $1c02
                    bne L1577
                    lda #$00
                    sta $1c04
                    ldy #$00
L1543               lda $1d00,y
                    clc 
                    adc $1c04
                    sta $1c04
                    iny 
                    cpy #$83
                    bne L1543
                    cmp $1d83
                    bne L1577
                    jsr kCLRCHN
                    ldx #$02
                    jsr kCHKOUT
                    ldy #$ff
L1561               iny 
                    lda $1d03,y
                    jsr kCHROUT
                    cpy #$7f
                    bcc L1561
                    jsr kCLRCHN
                    lda #$2d
                    jsr kCHROUT
                    jmp L15d0
                    
L1577               jsr kCLRCHN
                    lda $0a18
                    sta $0a19
                    lda #$3a
                    jsr kCHROUT
                    ldx #$05
                    jsr kCHKOUT
                    inc $1c80
                    ldx $1c80
                    cpx #$0a
                    bcs L15ac
                    lda #$15
                    jsr kCHROUT
                    ldy #$00
                    sty $1c81
                    jsr kCLRCHN
                    ldx #$05
                    jsr kCHKIN
                    jsr L13e3
                    jmp L14fd
                    
L15ac               tsx 
                    cpx $130c
                    beq L15b7
                    inx 
                    txs 
                    clc 
                    bcc L15ac
L15b7               jsr kCLRCHN
                    lda #$58
                    jsr kCHROUT
                    ldx #$05
                    jsr kCHKOUT
                    lda #$18
                    jsr kCHROUT
                    lda #$00
                    lda $02
                    jmp L13a3
                    
L15d0               lda #$00
                    sta $1c80
                    jsr kCLRCHN
                    ldx #$05
                    jsr kCHKOUT
                    lda #$06
                    jsr kCHROUT
                    jsr kCLRCHN
                    ldx #$05
                    jsr kCHKIN
                    jsr L13e3
L15ed               jsr kGETIN
                    pha 
                    lda $0a14
                    and #$08
                    beq L1601
                    pla 
                    jsr S1412
                    bcc L15ed
                    jmp L1577
                    
L1601               pla 
                    cmp #$04
                    beq L1611
                    sta $1d00
                    ldy #$01
                    sty $1c81
                    jmp L14ec
                    
L1611               jsr kCLRCHN
                    lda #$2a
                    jsr kCHROUT
                    ldx #$05
                    jsr kCHKOUT
                    lda #$06
                    jsr kCHROUT
                    jsr kCLRCHN
                    lda #$80
                    sta $02
                    jmp L13a3