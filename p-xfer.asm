* =$1300
                    ; punter protocol for zelch 2.0a
kCHKIN = $FFC6
kCHKOUT = $FFC9
kCLRCHN = $FFCC
kCHRIN = $FFCF
kGETIN = $FFE4
kREADST = $FFB7

L3000               lda #$00
                    bit $03a9
                    bit $06a9
                    bit $09a9
                    bit $0ca9
                    bit $0fa9
                    nop 
                    jmp L3018
                    
                    byte $4c,$9b,$18 
L3018               sta $64
                    tsx 
                    stx $1c1c
                    lda #$30
                    clc 
                    adc $64
                    sta $132e
                    lda #$13
                    adc #$00
                    sta $132f
                    jmp L3030
                    
L3030               jmp L3051
                    
                    byte $4c,$08,$17,$4c,$d0,$16,$4c,$ce
                    byte $17,$4c,$17,$18,$4c,$aa,$18,$47
                    byte $4f,$4f,$42,$41,$44,$41,$43,$4b
                    byte $53,$2f,$42,$53,$59,$4e 
L3051               sta $1c05
                    lda #$00
                    sta $1c00
                    sta $1c01
                    sta $1c02
L305f               lda #$00
                    sta $1c06
                    sta $1c07
L3067               jsr S367b
                    jsr S30f2
                    lda $96
                    bne L30c9
                    lda $1c01
                    sta $1c00
                    lda $1c02
                    sta $1c01
                    lda $0200
                    sta $1c02
                    lda #$00
                    sta $1c04
                    lda #$01
                    sta $1c03
L308d               lda $1c05
                    bit $1c03
                    beq L30ab
                    ldy $1c04
                    ldx #$00
L309a               lda $1c00,x
                    cmp $1342,y
                    bne L30ab
                    iny 
                    inx 
                    cpx #$03
                    bne L309a
                    jmp L30be
                    
L30ab               asl $1c03
                    lda $1c04
                    clc 
                    adc #$03
                    sta $1c04
                    cmp #$0f
                    bne L308d
                    jmp L305f
                    
L30be               lda #$ff
                    sta $1c06
                    sta $1c07
                    jmp L3067
                    
L30c9               inc $1c06
                    bne L30d1
                    inc $1c07
L30d1               lda $1c07
                    ora $1c06
                    beq L30ec
                    lda $1c06
                    cmp #$07
                    lda $1c07
                    cmp #$14
                    bcc L3067
                    lda #$01
                    sta $96
                    jmp L355e
                    
L30ec               lda #$00
                    sta $96
                    rts 
                    
S30f1               nop 
S30f2               tya 
                    pha 
                    lda $0a18
                    cmp $0a19
                    beq L3112
                    ldy $0a19
                    lda ($c8),y
                    pha 
                    inc $0a19
                    lda #$00
                    sta $96
                    pla 
                    sta $0200
                    pla 
                    tay 
                    jmp L311d
                    
L3112               lda #$02
                    sta $96
                    lda #$00
                    sta $0200
                    pla 
                    tay 
L311d               pha 
                    lda #$03
                    sta $ba
                    pla 
                    rts 
                    
L3124               ldx #$05
                    jsr kCHKOUT
                    ldx #$00
L312b               lda $1342,y
                    jsr S3700
                    iny 
                    inx 
                    cpx #$03
                    bne L312b
                    jmp kCLRCHN
                    
L313a               sta $1c08
                    lda #$00
                    sta $1c0b
L3142               lda #$02
                    sta $64
                    ldy $1c08
                    jsr L3124
L314c               lda #$04
                    jsr L3051
                    lda $96
                    beq L315c
                    dec $64
                    bne L314c
                    jmp L3142
                    
L315c               ldy #$09
                    jsr L3124
                    lda $1c0d
                    beq L316b
                    lda $1c08
                    beq L318a
L316b               lda $1d04
                    sta $1c09
                    sta $1c17
                    jsr S327f
                    lda $96
                    cmp #$01
                    beq L3189
                    cmp #$02
                    beq L315c
                    cmp #$04
                    beq L3189
                    cmp #$08
                    beq L315c
L3189               rts 
                    
L318a               lda #$10
                    jsr L3051
                    lda $96
                    bne L315c
                    lda #$0a
                    sta $1c09
L3198               ldy #$0c
                    jsr L3124
                    lda #$08
                    jsr L3051
                    lda $96
                    beq L31ab
                    dec $1c09
                    bne L3198
L31ab               rts 
                    
S31ac               lda #$01
                    sta $1c0b
L31b1               lda $1c1e
                    beq L31bb
                    ldy #$00
                    jsr L3124
L31bb               lda #$0b
                    jsr L3051
                    lda $96
                    bne L31b1
                    lda #$00
                    sta $1c1e
                    lda $1c04
                    cmp #$00
                    bne L3205
                    lda $1c0d
                    bne L323d
                    inc $1c19
                    bne L31dd
                    inc $1c1a
L31dd               jsr S3364
                    ldy #$05
                    iny 
                    lda ($66),y
                    cmp #$ff
                    bne L31ff
                    lda #$01
                    sta $1c0d
                    lda $1c16
                    eor #$01
                    sta $1c16
                    jsr S3364
                    jsr S3344
                    jmp L3202
                    
L31ff               
                    byte $20, $ff,$15
L3202               lda #$2d
                    ;;bit $3aa9
                    byte $2c
L3205               lda #$3a
                    jsr S3586
                    ldy #$06
                    jsr L3124
                    lda #$08
                    jsr L3051
                    lda $96
                    bne L3202
                    jsr S3364
                    ldy #$04
                    lda ($66),y
                    sta $1c09
                    jsr S3371
                    ldx #$05
                    jsr kCHKOUT
                    ldy #$00
L322c               lda ($66),y
                    jsr S3700
                    iny 
                    cpy $1c09
                    bne L322c
                    jsr kCLRCHN
                    lda #$00
                    rts 
                    
L323d               lda #$2a
                    jsr S3586
                    ldy #$06
                    jsr L3124
                    lda #$08
                    jsr L3051
                    lda $96
                    bne L323d
                    lda #$0a
                    sta $1c09
L3255               ldy #$0c
                    jsr L3124
                    lda #$10
                    jsr L3051
                    lda $96
                    beq L3268
                    dec $1c09
                    bne L3255
L3268               lda #$03
                    sta $1c09
L326d               ldy #$09
                    jsr L3124
                    lda #$00
                    jsr L3051
                    dec $1c09
                    bne L326d
                    lda #$01
                    rts 
                    
S327f               ldy #$00
L3281               lda #$00
                    sta $1c06
                    sta $1c07
L3289               jsr S367b
                    jsr S30f2
                    lda $96
                    bne L32cf
                    lda $0200
                    sta $1d00,y
                    cpy #$03
                    bcs L32b9
                    sta $1c00,y
                    cpy #$02
                    bne L32b9
                    lda $1c00
                    cmp #$41
                    bne L32b9
                    lda $1c01
                    cmp #$43
                    bne L32b9
                    lda $1c02
                    cmp #$4b
                    beq L32c4
L32b9               iny 
                    cpy $1c09
                    bne L3281
                    lda #$01
                    sta $96
                    rts 
                    
L32c4               lda #$ff
                    sta $1c06
                    sta $1c07
                    jmp L3289
                    
L32cf               inc $1c06
                    bne L32d7
                    inc $1c07
L32d7               lda $1c06
                    ora $1c07
                    beq L32fa
                    lda $1c06
                    cmp #$06
                    lda $1c07
                    cmp #$10
                    bne L3289
                    lda #$02
                    sta $96
                    cpy #$00
                    beq L32f7
                    lda #$04
                    sta $96
L32f7               jmp L355e
                    
L32fa               lda #$08
                    sta $96
                    rts 
                    
L32ff               lda $1c16
                    eor #$01
                    sta $1c16
                    jsr S3364
                    ldy #$05
                    lda $1c19
                    clc 
                    adc #$01
                    sta ($66),y
                    iny 
                    lda $1c1a
                    adc #$00
                    sta ($66),y
                    ldx #$02
                    jsr kCHKIN
                    ldy #$07
L3323               jsr kCHRIN
                    sta ($66),y
                    iny 
                    jsr kREADST
                    bne L3338
                    cpy $1c18
                    bne L3323
                    tya 
                    pha 
                    jmp L3345
                    
L3338               tya 
                    pha 
                    ldy #$05
                    iny 
                    lda #$ff
                    sta ($66),y
                    jmp L3345
                    
S3344               pha 
L3345               jsr kCLRCHN
                    jsr S359b
                    jsr L3579
                    jsr S359b
                    ldy #$04
                    lda ($66),y
                    sta $1c09
                    jsr S3371
                    pla 
                    ldy #$04
                    sta ($66),y
                    jsr S3380
                    rts 
                    
S3364               lda #$00
                    sta $66
                    lda $1c16
                    clc 
                    adc #$1d
                    sta $67
                    rts 
                    
S3371               lda #$00
                    sta $66
                    lda $1c16
                    eor #$01
                    clc 
                    adc #$1d
                    sta $67
                    rts 
                    
S3380               lda #$00
                    sta $1c12
                    sta $1c13
                    sta $1c14
                    sta $1c15
                    ldy #$04
L3390               lda $1c12
                    clc 
                    adc ($66),y
                    sta $1c12
                    bcc L339e
                    inc $1c13
L339e               lda $1c14
                    eor ($66),y
                    sta $1c14
                    lda $1c15
                    rol a
                    rol $1c14
                    rol $1c15
                    iny 
                    cpy $1c09
                    bne L3390
                    ldy #$00
                    lda $1c12
                    sta ($66),y
                    iny 
                    lda $1c13
                    sta ($66),y
                    iny 
                    lda $1c14
                    sta ($66),y
                    iny 
                    lda $1c15
                    sta ($66),y
                    rts 
                    
L33d0               lda #$00
                    sta $1c0d
                    sta $1c0c
                    sta $1c1d
                    lda #$01
                    sta $1c16
                    lda #$ff
                    sta $1c19
                    sta $1c1a
                    jsr S3371
                    ldy #$04
                    lda #$07
                    sta ($66),y
                    jsr S3364
                    ldy #$05
                    lda #$00
                    sta ($66),y
                    iny 
                    sta ($66),y
L33fd               jsr S31ac
                    beq L33fd
L3402               lda #$00
                    sta $0200
                    rts 
                    
L3408               lda #$01
                    sta $1c19
                    lda #$00
                    sta $1c1a
                    sta $1c0d
                    sta $1c16
                    sta $1d05
                    sta $1d06
                    sta $1c0c
                    lda #$07
                    sta $1d04
                    lda #$00
L3428               jsr L313a
                    lda $1c0d
                    bne L3402
                    jsr S3484
                    bne L3471
                    jsr kCLRCHN
                    lda $1c09
                    cmp #$07
                    beq L3455
                    ldx #$02
                    jsr kCHKOUT
                    ldy #$07
L3446               lda $1d00,y
                    jsr S3700
                    iny 
                    cpy $1c09
                    bne L3446
                    jsr kCLRCHN
L3455               lda $1d06
                    cmp #$ff
                    bne L3464
                    lda #$01
                    sta $1c0d
                    lda #$2a
                    byte $2c
                    ;;bit $2da9
L3464               lda #$2d
                    jsr S3700
                    jsr S359b
                    lda #$00
                    jmp L3428
                    
L3471               jsr kCLRCHN
                    lda #$3a
                    jsr S3700
                    lda $1c17
                    sta $1d04
                    lda #$03
                    jmp L3428
                    
S3484               lda $1d00
                    sta $1c0e
                    lda $1d01
                    sta $1c0f
                    lda $1d02
                    sta $1c10
                    lda $1d03
                    sta $1c11
                    jsr S3364
                    lda $1c17
                    sta $1c09
                    jsr S3380
                    lda $1d00
                    cmp $1c0e
                    bne L34cb
                    lda $1d01
                    cmp $1c0f
                    bne L34cb
                    lda $1d02
                    cmp $1c10
                    bne L34cb
                    lda $1d03
                    cmp $1c11
                    bne L34cb
                    lda #$00
                    rts 
                    
L34cb               lda #$01
                    rts 
                    
L34ce               lda #$00
                    sta $1c19
                    sta $1c1a
                    sta $1c0d
                    sta $1c16
                    sta $1c0c
                    lda #$07
                    clc 
                    adc #$01
                    sta $1d04
                    lda #$00
L34e9               jsr L313a
                    lda $1c0d
                    bne L3511
                    jsr S3484
                    bne L3506
                    lda $1d07
                    sta $1c1b
                    lda #$01
                    sta $1c0d
                    lda #$00
                    jmp L34e9
                    
L3506               lda $1c17
                    sta $1d04
                    lda #$03
                    jmp L34e9
                    
L3511               lda #$00
                    sta $0200
                    rts 
                    
L3517               lda #$00
                    sta $1c0d
                    sta $1c0c
                    lda #$01
                    sta $1c16
                    sta $1c1d
                    lda #$ff
                    sta $1c19
                    sta $1c1a
                    jsr S3371
                    ldy #$04
                    lda #$07
                    clc 
                    adc #$01
                    sta ($66),y
                    jsr S3364
                    ldy #$05
                    lda #$ff
                    sta ($66),y
                    iny 
                    sta ($66),y
                    ldy #$07
                    lda $1c1b
                    sta ($66),y
                    lda #$01
                    sta $1c1e
L3553               jsr S31ac
                    beq L3553
                    lda #$00
                    sta $0200
                    rts 
                    
L355e               inc $1c0c
                    lda $1c0c
                    cmp #$03
                    bcc L3574
                    lda #$00
                    sta $1c0c
                    lda $1c0b
                    beq L3579
                    bne L3585
L3574               lda $1c0b
                    beq L3585
L3579               ldx #$00
L357b               ldy #$00
L357d               iny 
                    bne L357d
                    inx 
                    cpx #$78
                    bne L357b
L3585               rts 
                    
S3586               pha 
                    lda $1c19
                    ora $1c1a
                    beq L3599
                    lda $1c1d
                    bne L3599
                    pla 
                    jsr S3700
                    pha 
L3599               pla 
                    rts 
                    
S359b               jsr $e6c2
                    lda $0a0f
                    cmp #$80
                    beq S359b
                    cmp #$92
                    beq S359b
                    rts 
                    
L35aa               jsr S3667
L35ad               jsr S30f1
                    lda $96
                    bne L35c8
                    lda $0200
                    and #$7f
                    sta $0200
                    cmp #$08
                    beq L35cb
                    cmp #$0d
                    beq L35cb
                    cmp #$20
                    bpl L35cb
L35c8               jmp L3615
                    
L35cb               cmp #$61
                    bcc L35dc
                    cmp #$7b
                    bcs L35dc
                    sec 
                    sbc #$20
                    sta $0200
                    jmp L35ea
                    
L35dc               cmp #$41
                    bcc L35ea
                    cmp #$5b
                    bcs L35ea
                    clc 
                    adc #$80
                    sta $0200
L35ea               cmp #$08
                    bne L35f3
                    lda #$14
                    sta $0200
L35f3               cmp #$22
                    bne L3601
                    jsr S3700
                    lda #$14
                    jsr S3700
                    lda #$22
L3601               lda $0200
                    cmp #$0d
                    bne L360f
                    lda #$20
                    jsr S3700
                    lda #$0d
L360f               jsr S3700
                    jsr S3667
L3615               jsr kGETIN
                    beq L35ad
                    sta $0200
                    cmp #$13
                    beq L3666
                    cmp #$41
                    bcc L3632
                    cmp #$5b
                    bcs L3632
                    clc 
                    adc #$20
                    sta $0200
                    jmp L3643
                    
L3632               lda $0200
                    cmp #$c1
                    bcc L3643
                    cmp #$db
                    bcs L3643
                    sec 
                    sbc #$80
                    sta $0200
L3643               cmp #$14
                    bne L364c
                    lda #$08
                    sta $0200
L364c               cmp #$83
                    bne L3655
                    lda #$10
                    sta $0200
L3655               ldx #$05
                    jsr kCHKOUT
                    lda $0200
                    jsr S3700
                    jsr kCLRCHN
                    jmp L35aa
                    
L3666               rts 
                    
S3667               lda #$12
                    jsr S3700
                    lda #$20
                    jsr S3700
                    lda #$9d
                    jsr S3700
                    lda #$92
                    jsr S3700
S367b               lda $d3
                    nop 
                    cmp #$02
                    beq L368d
                    lda $dd01
                    and $0b24
                    cmp $0b25
                    bne L3694
L368d               pla 
                    tsx 
                    cpx $1c1c
                    bne L368d
L3694               lda #$01
                    sta $0200
                    rts 
                    
                    BYTE $99,$99,$99,$99,$99,$99 
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99 
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99 
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99 
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99 
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99 
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99 
                    BYTE $99,$99,$99,$99,$99,$99,$99,$99
S3700               pha 
                    lda $9a
                    cmp #$03
                    bne L370b
                    pla 
                    jmp $ef79
                    
L370b               bcc L3711
                    pla 
                    jmp $ef79
                    
L3711               lsr a
                    pla 
                    sta $9e
                    txa 
                    pha 
                    tya 
                    pha 
                    bcc L3740
                    jsr $e9be
                    bne L372f
                    jsr $ea15
                    bcs L3735
                    lda #$02
                    ldy #$00
                    sta $1b02,y
                    iny 
                    sty $a6
L372f               lda $9e
                    sta $1b02,y
L3734               clc 
L3735               pla 
                    tay 
                    pla 
                    tax 
                    lda $9e
                    bcc L373f
                    lda #$00
L373f               rts 
                    
L3740               jsr S3749
                    jmp L3734
                    
L3746               jsr S375a
S3749               ldy $0a1b
                    iny 
                    cpy $0a1a
                    beq L3746
                    sty $0a1b
                    dey 
                    lda $9e
                    sta ($ca),y
S375a               lda $0a0f
                    lsr a
                    bcs L377e
                    lda #$10
                    sta $dd0e
                    lda $1b00
                    sta $dd04
                    lda $1b01
                    sta $dd05
                    lda #$81
                    jsr $e67f
                    jsr $e64a
                    lda #$11
                    sta $dd0e
L377e               rts 
                    
                    BYTE $66,$99,$99 
                    
