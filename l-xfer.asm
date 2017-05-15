* =$1300

                    ; ?-modem source for zelch 2.0a

kCHKIN = $FFC6
kCHKOUT = $FFC9
kCLRCHN = $FFCC
kCHRIN = $FFCF
kGETIN = $FFE4
kCHROUT = $FFD2
kRDTIM = $FFDE
kREADST = $FFB7

L1300               jmp L130d
                    
L1303               jmp L134a
                    
S1306               txa 
                    ldx #$01
                    jsr $ff74
                    rts 
                    
L130d               jsr kCLRCHN
                    ldy #$09
                    ldx #$2f
                    jsr S1306
                    cmp $fb
                    bcs L131d
                    sta $fb
L131d               iny 
                    ldx #$2f
                    jsr S1306
                    sta $fc
                    iny 
                    ldx #$2f
                    jsr S1306
                    sta $fd
                    ldy #$00
L132f               ldx #$fc
                    jsr S1306
                    ldx #$01
                    stx $f5
                    sta $1f00,y
                    jsr kCHROUT
                    lda #$00
                    sta $f5
                    sta $f4
                    iny 
                    cpy $fb
                    bne L132f
                    rts 
                    
L134a               jsr kCLRCHN
                    jsr $2039
                    ldy #$09
                    ldx #$2f
                    jsr S1306
                    sta $fb
                    jsr L130d
                    lda $fa
                    bne L1362
                    lda #$f0
L1362               sta $fa
                    ldy $fb
L1366               lda #$9d
                    jsr kCHROUT
                    dey 
                    bne L1366
                    lda #$00
                    sta $fe
L1372               jsr kGETIN
                    sta $fc
                    jsr $3d0c
                    lda $fc
                    beq L1372
                    cmp #$22
                    bne L1386
                    lda #$87
                    sta $fc
L1386               cmp #$0d
                    bne L138d
                    jmp L1423
                    
L138d               lda $d4
                    cmp #$53
                    bcc L139a
                    cmp #$57
                    bcs L139a
                    jmp L13e8
                    
L139a               lda $fc
                    cmp #$9d
                    beq L13a4
                    cmp #$11
                    bne L13b2
L13a4               lda $fe
                    beq L1372
                    dec $fe
                    lda #$9d
                    jsr kCHROUT
                    jmp L1372
                    
L13b2               lda $fc
                    cmp #$1d
                    beq L13bc
                    cmp #$91
                    bne L13cf
L13bc               lda $fe
                    cmp $fb
                    bcc L13c5
                    jmp L1372
                    
L13c5               inc $fe
                    lda #$1d
                    jsr kCHROUT
                    jmp L1372
                    
L13cf               lda $fc
                    cmp #$14
                    beq L1437
                    cmp #$94
                    bne L13dc
                    jmp L145a
                    
L13dc               lda $d3
                    cmp #$05
                    bne L13e8
                    lda $fc
                    ora #$80
                    sta $fc
L13e8               ldx $fe
                    inx 
                    cpx $fb
                    bcc L1413
                    beq L1413
                    cpx $fa
                    bcs L1434
                    ldy $fb
                    lda $fc
                    sta $1f00,y
                    iny 
                    sty $fb
L13ff               lda #$01
                    sta $f4
                    lda $fc
                    jsr kCHROUT
                    lda #$00
                    sta $f4
                    sta $f5
                    inc $fe
                    jmp L1372
                    
L1413               ldx $fe
                    cpx $fa
                    bcs L1434
                    ldy $fe
                    lda $fc
                    sta $1f00,y
                    jmp L13ff
                    
L1423               lda #$0d
                    jsr kCHROUT
                    lda #$0d
                    jsr kCHROUT
                    lda #$1f
                    sta $fc
                    jmp $203c
                    
L1434               jmp L1372
                    
L1437               lda $fb
                    beq L1434
                    lda $fe
                    beq L1434
                    lda $fc
                    jsr kCHROUT
                    dec $fe
                    dec $fb
                    ldy $fe
L144a               iny 
                    lda $1f00,y
                    dey 
                    sta $1f00,y
                    iny 
                    cpy $fb
                    bcc L144a
                    jmp L1372
                    
L145a               lda $fb
                    cmp $fa
                    bcs L1434
                    lda $fc
                    jsr kCHROUT
                    lda #$00
                    sta $f4
                    sta $f5
                    inc $fb
                    ldy $fb
L146f               dey 
                    lda $1f00,y
                    iny 
                    sta $1f00,y
                    dey 
                    cpy $fe
                    bne L146f
                    lda #$20
                    sta $1f00,y
                    jmp L1372
                    
                    byte $ea 