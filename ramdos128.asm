* =$2300

kRESTOR = $ff8a
kSTOP = $ffe1

L2300               jmp L3d9d
                    
L2303               jmp L3de2
                    
L2306               jmp L3da1
                    
L2309               jmp L3de6
                    
L230c               jmp L230f
                    
L230f               ldx #$00
L2311               txa 
                    pha 
                    lda $2321,x
                    jsr $c00c
                    pla 
                    tax 
                    inx 
                    cpx #$45
                    bne L2311
                    rts 
                    
        BYTE $0d,$28,$43,$29,$20,$31,$39,$38
        BYTE $36,$20,$43,$4f,$4d,$4d,$4f
        BYTE $44,$4f,$52,$45,$20,$45,$4c,$45
        BYTE $43,$54,$52,$4f,$4e,$49,$43,$53
        BYTE $2c,$20,$4c,$54,$44,$2e,$20,$0d
        BYTE $20,$20,$20,$20,$20,$20,$20,$20
        BYTE $41,$4c,$4c,$20,$52,$49,$47,$48
        BYTE $54,$53,$20,$52,$45,$53,$45,$52
        BYTE $56,$45,$44,$2e,$20,$0d,$00,$4f
        BYTE $4b,$00,$01,$46,$49,$4c,$45,$53
        BYTE $20,$53,$43,$52,$41,$54,$43,$48
        BYTE $45,$44,$00,$0d,$44,$4f,$53,$20
        BYTE $43,$4f,$4e,$46,$55,$53,$45,$44
        BYTE $00,$1e,$53,$59,$4e,$54,$41,$58
        BYTE $20,$45,$52,$52,$4f,$52,$00,$1f
        BYTE $53,$59,$4e,$54,$41,$58,$20,$45
        BYTE $52,$52,$4f,$52,$00,$20,$53,$59
        BYTE $4e,$54,$41,$58,$20,$45,$52,$52
        BYTE $4f,$52,$00,$21,$53,$59,$4e,$54
        BYTE $41,$58,$20,$45,$52,$52,$4f,$52
        BYTE $00,$22,$53,$59,$4e,$54,$41,$58
        BYTE $20,$45,$52,$52,$4f,$52,$00,$32
        BYTE $52,$45,$43,$4f,$52,$44,$20,$4e
        BYTE $4f,$54,$20,$50,$52,$45,$53,$45
        BYTE $4e,$54,$00,$33,$4f,$56,$45,$52
        BYTE $46,$4c,$4f,$57,$20,$49,$4e,$20
        BYTE $52,$45,$43,$4f,$52,$44,$00,$34
        BYTE $46,$49,$4c,$45,$20,$54,$4f,$4f
        BYTE $20,$4c,$41,$52,$47,$45,$00,$3c
        BYTE $46,$49,$4c,$45,$20,$4f,$50,$45
        BYTE $4e,$00,$3d,$46,$49,$4c,$45,$20
        BYTE $4e,$4f,$54,$20,$4f,$50,$45,$4e
        BYTE $00,$3e,$46,$49,$4c,$45,$20,$4e
        BYTE $4f,$54,$20,$46,$4f,$55,$4e,$44
        BYTE $00,$3f,$46,$49,$4c,$45,$20,$45
        BYTE $58,$49,$53,$54,$53,$00,$40,$46
        BYTE $49,$4c,$45,$20,$54,$59,$50,$45
        BYTE $20,$4d,$49,$53,$4d,$41,$54,$43
        BYTE $48,$00,$42,$49,$4c,$4c,$45,$47
        BYTE $41,$4c,$20,$54,$52,$41,$43,$4b
        BYTE $20,$41,$4e,$44,$20,$53,$45,$43
        BYTE $54,$4f,$52,$00,$46,$4e,$4f,$20
        BYTE $43,$48,$41,$4e,$4e,$45,$4c,$00
        BYTE $48,$44,$49,$53,$4b,$20,$46,$55
        BYTE $4c,$4c,$00,$49,$43,$42,$4d,$20
        BYTE $44,$4f,$53,$20,$56,$34,$2e,$34
        BYTE $20,$31,$37,$35,$30,$00,$00,$42
        BYTE $41,$44,$20,$45,$52,$52,$4f,$52
        BYTE $20,$4e,$55,$4d,$42,$45,$52,$00
        BYTE $18,$6d,$69,$21,$8d,$69,$21,$60
L24b0               ldx $2169
                    cpx $216a
                    bcc L24bf
                    jsr S255f
                    clc 
                    jmp L3999
                    
L24bf               lda #$a8
                    ldx #$24
                    sta $2109
                    stx $210a
                    lda #$37
                    ldx #$01
                    clc 
                    adc $2169
                    bcc L24d4
                    inx 
L24d4               sta $df04
                    stx $df05
                    lda #$00
                    sta $df06
                    lda $216a
                    sec 
                    sbc $2169
                    ldx $22f5
                    ldy $22f6
                    sec 
                    jmp L3af9
                    
L24f0               sta $216b
                    stx $216c
                    ldy #$01
                    jsr S2580
                    lda #$00
                    sta $216f
                    lda #$10
                    ldx #$27
                    jsr S2523
                    lda #$e8
                    ldx #$03
                    jsr S2523
                    lda #$64
                    ldx #$00
                    jsr S2523
                    lda $216b
                    jsr S25a6
                    jsr S25d4
                    lda #$00
                    jmp S25a6
                    
S2523               sta $216d
                    stx $216e
                    lda $216f
                    and #$f0
                    sta $216f
L2531               lda $216b
                    sec 
                    sbc $216d
                    tax 
                    lda $216c
                    sbc $216e
                    bcc L2553
                    sta $216c
                    stx $216b
                    lda $216f
                    adc #$00
                    ora #$30
                    sta $216f
                    bne L2531
L2553               lda $216f
                    beq L255b
                    jsr S25d6
L255b               rts 
                    
S255c               ldy #$49
                    byte $2c
S255f               ldy #$00
                    lda #$00
                    tax 
                    jmp L256e
                    
L2567               tay 
                    lda $210f
                    ldx $2110
L256e               jsr S2580
                    lda $2135
                    jsr S25a6
                    jsr S25d4
                    lda $2136
                    jmp S25a6
                    
S2580               sty $2134
                    stx $2135
                    sta $2136
                    lda #$00
                    sta $2169
                    sta $216a
                    lda $2134
                    jsr S25a6
                    jsr S25d4
                    lda #$20
                    jsr S25d6
                    jsr S25ea
                    jsr S25d4
                    rts 
                    
S25a6               cmp #$64
                    bcc L25c0
                    cmp #$c8
                    bcc L25b6
                    sbc #$c8
                    pha 
                    lda #$02
                    jmp L25bc
                    
L25b6               sec 
                    sbc #$64
                    pha 
                    lda #$01
L25bc               jsr S25d1
                    pla 
L25c0               ldx #$ff
L25c2               inx 
                    sec 
                    sbc #$0a
                    bcs L25c2
                    pha 
                    txa 
                    jsr S25d1
                    pla 
                    clc 
                    adc #$0a
S25d1               ora #$30
                    byte $2c
S25d4
                    lda #$2c
S25d6               ldx $216a
                    sta $2137,x
                    cpx #$30
                    beq L25e3
                    inc $216a
L25e3               lda #$00
                    sta $2138,x
                    clc 
                    rts 
                    
S25ea               lda #$66
                    ldx #$23
                    sta $fe
                    stx $ff
L25f2               lda $2134
                    ldx #$00
                    cmp ($fe,x)
                    beq L2600
                    jsr S260d
                    bne L25f2
L2600               jsr S2612
                    beq L260b
                    jsr S25d6
                    jmp L2600
                    
L260b               clc 
                    rts 
                    
S260d               jsr S2612
                    bne S260d
S2612               inc $fe
                    bne L2618
                    inc $ff
L2618               ldx #$00
                    lda ($fe,x)
                    rts 
                    
S261d               ldx #$10
L261f               txa 
                    jsr S263f
                    jsr S262d
                    ldx $2108
                    dex 
                    bpl L261f
                    rts 
                    
S262d               ldx #$0f
                    lda #$00
L2631               sta $210b,x
                    dex 
                    bpl L2631
                    rts 
                    
L2638               lda $b9
                    and #$0f
                    byte $2c
S263d               lda #$10
S263f               cmp $2108
                    beq L2670
                    pha 
                    lda #$0b
                    ldx #$21
                    sta $df02
                    stx $df03
                    lda $2107
                    sta $df06
                    lda #$10
                    ldx #$00
                    sta $df07
                    stx $df08
                    lda $2108
                    ldy #$b0
                    jsr S2678
                    pla 
                    sta $2108
                    ldy #$b1
                    jsr S2678
L2670               lda $2108
                    ldx $210b
                    clc 
                    rts 
                    
S2678               asl a
                    tax 
                    lda $268d,x
                    sta $df04
                    lda $268e,x
                    adc $2106
                    sta $df05
                    sty $df01
                    rts 
                    
        BYTE $00,$00,$10
        BYTE $00,$20,$00,$30,$00,$40,$00,$50
        BYTE $00,$60,$00,$70,$00,$80,$00,$90
        BYTE $00,$a0,$00,$b0,$00,$c0,$00,$d0
        BYTE $00,$e0,$00,$f0,$00,$00,$01
L26af               sta $210f
                    stx $2110
S26b5               lda $210f
                    ldx $2110
S26bb               cpx $211c
                    bne L26c3
                    cmp $211b
L26c3               beq L26eb
                    pha 
                    txa 
                    pha 
                    jsr S26d7
                    pla 
                    tax 
                    pla 
                    sta $211b
                    stx $211c
S26d4               ldy #$b1
                    BYTE $2c
S26d7
                    ldy #$b0
                    jsr S26ed
                    lda $211b
                    ldx $211c
                    sta $df05
                    stx $df06
                    sty $df01
L26eb               clc 
                    rts 
                    
S26ed               ldx #$0a
L26ef               lda $26f9,x
                    sta $df02,x
                    dex 
                    bpl L26ef
                    rts 
                    
        BYTE $00,$20,$00,$00,$00,$00,$01
        BYTE $00,$00,$00,$00
L2704               jsr L2638
                    cmp #$0f
                    bne L270e
                    jmp L24b0
                    
L270e               cpx #$00
                    bne L271b
                    lda #$46
                    sta $90
                    lda #$46
                    jmp L3996
                    
L271b               cpx #$24
                    bne L273a
                    jmp L3458
                    
L2722               tay 
                    beq L2739
                    clc 
                    adc $210e
                    sta $210e
                    bcc L2736
                    inc $210f
                    bne L2736
                    inc $2110
L2736               jsr S26d4
L2739               rts 
                    
L273a               lda $210b
L2720               cmp #$52
                    beq L2751
                    cmp #$46
                    beq L2751
                    cmp #$4c
                    bne L274c
                    jmp L2a0e
                    
L274c               lda #$3c
                    jmp L3996
                    
L2751               sec 
                    lda $2111
                    sbc $210e
                    tay 
                    lda $2112
                    sbc $210f
                    tax 
                    lda $2113
                    sbc $2110
                    bcs L276b
                    jmp L398d
                    
L276b               bne L2770
                    txa 
                    beq L2772
L2770               ldy #$ff
L2772               tya 
                    pha 
                    jsr S26d7
                    pla 
                    tay 
                    bne L2780
                    lda #$40
                    sta $90
                    iny 
L2780               lda #$22
                    ldx #$27
                    sec 
                    jmp L3ade
                    
L2788               jsr L2638
                    cmp #$0f
                    bne L2792
                    jmp L3184
                    
L2792               cpx #$57
                    beq L27da
                    cpx #$46
                    beq L27da
                    cpx #$4c
                    bne L27a1
                    jmp L2a43
                    
L27a1               lda #$46
                    jmp L3996
                    
L27a6               tay 
                    beq L27d7
                    dey 
                    tya 
                    clc 
                    adc $210e
                    sta $210e
                    ldx $2110
                    cpx $2113
                    bne L27c0
                    ldx $210f
                    cpx $2112
L27c0               bne L27ca
                    cmp $2111
                    bcc L27ca
                    sta $2111
L27ca               inc $210e
                    bne L27d7
                    inc $210f
                    bne L27d7
                    inc $2110
L27d7               jmp S26d4
                    
L27da               jsr S27fb
                    bcs L27ea
                    lda #$00
                    sec 
                    sbc $210e
                    cmp #$00
                    bne L27ed
                    clc 
L27ea               jmp L39a7
                    
L27ed               pha 
                    jsr S26d7
                    pla 
                    tay 
                    lda #$a6
                    ldx #$27
                    clc 
                    jmp L3ade
                    
S27fb               lda $2113
                    cmp $2110
                    bne L2811
                    lda $2112
                    cmp $210f
                    bne L2811
                    lda $2111
                    cmp $210e
L2811               bcs L286f
                    lda $2111
                    cmp #$ff
                    bne L2858
                    lda $210f
                    ldx $2110
                    pha 
                    txa 
                    pha 
                    lda $2112
                    ldx $2113
                    clc 
                    adc #$01
                    bcc L282f
                    inx 
L282f               jsr S2b1a
                    tay 
                    pla 
                    tax 
                    pla 
                    sta $210f
                    stx $2110
                    tya 
                    bcs L2889
                    inc $2112
                    bne L2847
                    inc $2113
L2847               lda $210c
                    ldx $210d
                    jsr S26bb
                    inc $2000
                    bne L2858
                    inc $2001
L2858               inc $2111
                    lda $2112
                    ldx $2113
                    jsr S26bb
                    lda #$ff
                    ldy $2111
                    sta $2000,y
                    jmp S27fb
                    
L286f               jsr S26b5
                    ldy $210e
                    lda $2120
                    sta $2000,y
                    inc $210e
                    bne L2888
                    inc $210f
                    bne L2888
                    inc $2110
L2888               clc 
L2889               rts 
                    
S288a               clc 
                    lda #$1a
                    adc $2114
                    sta $210e
                    lda #$00
                    ldx #$00
                    adc $210c
                    pha 
                    txa 
                    adc $210d
                    tax 
                    pla 
                    sta $210f
                    stx $2110
                    ldy $210b
                    cpy #$46
                    bne L28c4
                    clc 
                    adc $2115
                    pha 
                    txa 
                    adc $2116
                    tax 
                    pla 
                    bcs L28c1
                    sta $210f
                    stx $2110
L28c1               lda #$34
                    rts 
                    
L28c4               lda #$00
                    sta $2172
                    lda $2115
                    ldx $2116
                    sta $2170
                    stx $2171
                    lda $211a
L28d8               lsr a
                    pha 
                    bcc L28f8
                    clc 
                    lda $2170
                    adc $210e
                    sta $210e
                    lda $2171
                    adc $210f
                    sta $210f
                    lda $2172
                    adc $2110
                    sta $2110
L28f8               asl $2170
                    rol $2171
                    rol $2172
                    pla 
                    bne L28d8
                    lda #$32
                    ldx $2116
                    cpx $2119
                    bne L2914
                    ldx $2115
                    cpx $2118
L2914               rts 
                    
S2915               lda $2115
                    ldx $2116
                    pha 
                    txa 
                    pha 
                    lda $2114
                    pha 
                    lda $2120
                    pha 
                    jsr S2940
                    bcs L292c
                    clc 
L292c               tay 
                    pla 
                    sta $2120
                    pla 
                    sta $2114
                    pla 
                    tax 
                    pla 
                    sta $2115
                    stx $2116
                    tya 
                    rts 
                    
S2940               lda $2118
                    ldx $2119
                    cpx #$ff
                    bne L294c
                    cmp #$ff
L294c               bcs L2977
                    sta $2115
                    stx $2116
                    lda #$00
                    sta $2114
                    jsr S288a
                    lda #$ff
                    sta $2120
                    jsr S27fb
                    bcs L2976
                    inc $2114
                    jsr S297b
                    bcs L2976
                    inc $2118
                    bne L2976
                    inc $2119
L2976               rts 
                    
L2977               lda #$34
                    sec 
                    rts 
                    
S297b               lda $2114
                    cmp $211a
                    bcs L2992
                    lda #$00
                    sta $2120
                    jsr S27fb
                    bcs L2993
                    inc $2114
                    bne S297b
L2992               clc 
L2993               rts 
                    
S2994               lda $2114
                    pha 
                    lda #$00
                    sta $2114
                    sta $2117
                    jsr S288a
                    bcs L29d6
L29a5               lda $2114
                    cmp $211a
                    bcs L29d0
                    jsr S26b5
                    ldy $210e
                    lda $2000,y
                    beq L29be
                    lda $2114
                    sta $2117
L29be               inc $210e
                    bne L29cb
                    inc $210f
                    bne L29cb
                    inc $2110
L29cb               inc $2114
                    bne L29a5
L29d0               pla 
                    sta $2114
                    clc 
                    rts 
                    
L29d6               tay 
                    pla 
                    tya 
                    rts 
                    
S29da               jsr S288a
                    bcs L29e9
                    jsr S26b5
                    ldx $210e
                    lda $2000,x
                    clc 
L29e9               rts 
                    
L29ea               jsr S2a04
                    jsr S288a
                    jsr S297b
                    bcs L2a02
                    inc $2115
                    bne L29fd
                    inc $2116
L29fd               lda #$00
                    sta $2114
L2a02               clc 
                    rts 
                    
S2a04               clc 
                    adc $2114
                    sta $2114
                    jmp S26d4
                    
L2a0e               lda #$04
                    ldx #$2a
                    sta $2109
                    stx $210a
                    jsr S2994
                    bcs L2a2d
                    jsr S288a
                    sec 
                    lda $2117
                    sbc $2114
                    beq L2a30
                    sec 
                    jmp L2a7f
                    
L2a2d               jmp L3996
                    
L2a30               jsr S29da
                    ldx #$00
                    stx $2114
                    inc $2115
                    bne L2a40
                    inc $2116
S2a3f = L2a40 - 1               
L2a40               jmp L399e
                    
L2a43               clc 
                    jsr S2aa1
                    bne L2a69
                    lda #$ea
                    ldx #$29
                    sta $2109
                    stx $210a
L2a53               ldx $2116
                    cpx $2119
                    bne L2a61
                    ldx $2115
                    cpx $2118
L2a61               bcc L2a6e
                    jsr S2915
                    bcc L2a53
                    byte $2c
L2a69               lda #$33
                    jmp L3996
                    
L2a6e               lda $211a
                    sec 
                    sbc $2114
                    bcc L2a69
                    beq L2a69
                    pha 
                    jsr S2aa1
                    pla 
                    clc 
L2a7f               php 
                    pha 
                    jsr S288a
                    jsr S26b5
                    jsr S26d7
                    lda $210e
                    sta $df04
                    lda $210f
                    ldx $2110
                    sta $df05
                    stx $df06
                    pla 
                    plp 
                    jmp L3af9
                    
S2aa1               lda $2121
                    sta $ff
                    lda #$01
                    sta $fe
                    ldy #$00
                    lda ($fe),y
                    bcc L2ab3
                    rol a
                    sta ($fe),y
L2ab3               rts 
                    
L2ab4               jsr S2d58
                    bcs L2b13
                    tya 
                    and #$0f
                    jsr S263f
                    lda $210b
                    cmp #$46
                    beq L2aca
                    cmp #$4c
                    bne L2b10
L2aca               jsr S2d58
                    tya 
                    bcs L2b13
                    sta $2115
                    jsr S2d58
                    tya 
                    bcs L2b13
                    sta $2116
                    lda #$00
                    sta $2114
                    jsr S2d58
                    tya 
                    bcs L2afd
                    ldy $210b
                    cpy #$46
                    beq L2afa
                    cmp #$00
                    beq L2afd
                    tay 
                    dey 
                    tya 
                    cmp $211a
                    bcs L2b16
L2afa               sta $2114
L2afd               lda $2115
                    bne L2b0a
                    lda $2116
                    beq L2b0d
                    dec $2116
L2b0a               dec $2115
L2b0d               jmp S288a
                    
L2b10               lda #$46
                    byte $2c
L2b13               lda #$1e
                    byte $2c
L2b16               lda #$33
                    sec 
                    rts 
                    
S2b1a               sta $2173
                    stx $2174
                    lda $2102
                    ldx $2103
                    clc 
                    adc #$01
                    bne L2b2c
                    inx 
L2b2c               cpx $2105
                    bne L2b34
                    cmp $2104
L2b34               bcc L2b39
                    lda #$48
                    rts 
                    
L2b39               lda #$01
                    ldx #$00
                    jsr S2b74
                    lda $2173
                    ldx $2174
                    jsr S26bb
L2b49               inc $2173
                    bne L2b51
                    inc $2174
L2b51               jsr S26ed
                    lda $2173
                    ldx $2174
                    sta $df05
                    stx $df06
                    cpx $2103
                    bne L2b68
                    cmp $2102
L2b68               bcs L2b72
                    lda #$b2
                    sta $df01
                    jmp L2b49
                    
L2b72               clc 
                    rts 
                    
S2b74               sta $2175
                    stx $2176
                    lda $2108
                    pha 
                    ldx #$10
L2b80               txa 
                    jsr S263f
                    lda $210b
                    beq L2bb6
                    lda $2112
                    ldx $2113
                    jsr S2bd1
                    sta $2112
                    stx $2113
                    lda $210f
                    ldx $2110
                    jsr S2bd1
                    sta $210f
                    stx $2110
                    lda $210c
                    ldx $210d
                    jsr S2bd1
                    sta $210c
                    stx $210d
L2bb6               ldx $2108
                    dex 
                    bpl L2b80
                    pla 
                    jsr S263f
                    lda $2102
                    ldx $2103
                    jsr S2bd1
                    sta $2102
                    stx $2103
                    clc 
                    rts 
                    
S2bd1               cpx $2174
                    bne L2bd9
                    cmp $2173
L2bd9               bcc L2be6
                    clc 
                    adc $2175
                    pha 
                    txa 
                    adc $2176
                    tax 
                    pla 
L2be6               rts 
                    
L2be7               lda $211b
                    ldx $211c
                    sta $2173
                    stx $2174
                    lda $2000
                    ldx $2001
                    pha 
                    txa 
                    pha 
                    lda $2000
                    ldx $2001
                    eor #$ff
                    tay 
                    txa 
                    eor #$ff
                    tax 
                    tya 
                    jsr S2b74
                    pla 
                    tax 
                    pla 
                    sta $2175
                    stx $2176
L2c16               lda $2173
                    ldx $2174
                    sec 
                    adc $2175
                    pha 
                    txa 
                    adc $2176
                    tax 
                    pla 
                    jsr S26bb
                    lda $2173
                    ldx $2174
                    sta $211b
                    stx $211c
                    inc $2173
                    bne L2c3e
                    inc $2174
L2c3e               lda $2103
                    cmp $2174
                    bne L2c4c
                    lda $2102
                    cmp $2173
L2c4c               bcs L2c16
                    rts 
                    
L2c4f               cmp #$40
                    bcc L2c5f
                    cmp #$80
                    bcc L2c5b
                    cmp #$c0
                    bcc L2c5f
L2c5b               and #$1f
                    ora #$40
L2c5f               clc 
                    rts 
                    
        BYTE $01,$02,$04,$08,$10,$20,$40,$80
L2c69               jsr S263d
                    lda $2100
                    ldx $2101
L2c72               sta $210f
                    stx $2110
                    cpx $2103
                    bne L2c80
                    cmp $2102
L2c80               bcc L2c8b
                    beq L2c87
                    lda #$0d
                    
                    byte $2c 
L2c87               lda #$3e
L2c89               sec
                    rts 
                    
L2c8b               jsr S26b5
                    bcs L2c89
                    jsr S2cf6
                    bcs L2c9c
                    lda $210f
                    ldx $2110
                    rts 
                    
L2c9c               lda $2000
                    ldx $2001
                    sec 
                    adc $210f
                    pha 
                    txa 
                    adc $2110
                    tax 
                    pla 
                    jmp L2c72
                    
L2cb0               jsr S263d
                    lda $2100
                    ldx $2101
L2cb9               sta $210f
                    stx $2110
                    cpx $2103
                    bne L2cc7
                    cmp $2102
L2cc7               bcc L2cd2
                    beq L2cce
                    lda #$0d
                    byte $2c
L2cce               lda #$3e
                    sec 
                    rts 
                    
L2cd2               jsr S26b5
                    lda $2002
                    beq L2ce2
                    lda $210f
                    ldx $2110
                    clc 
                    rts 
                    
L2ce2               lda $2000
                    ldx $2001
                    sec 
                    adc $210f
                    pha 
                    txa 
                    adc $2110
                    tax 
                    pla 
                    jmp L2cb9
                    
S2cf6               ldx #$ff
L2cf8               inx 
                    lda $2008,x
                    bne L2d09
                    lda $2177,x
                    beq L2d07
                    cmp #$2a
                    bne L2d1b
L2d07               clc 
                    rts 
                    
L2d09               lda $2177,x
                    beq L2d1b
                    cmp $2008,x
                    beq L2cf8
                    cmp #$3f
                    beq L2cf8
                    cmp #$2a
                    beq L2d07
L2d1b               sec 
                    rts 
                    
S2d1d               lda #$00
                    sta $2189
                    sta $218a
                    sta $218b
                    sta $218c
                    sta $218d
S2d2e               jsr S3a05
                    ldy $b7
                    lda $2191,y
                    ldx #$00
                    beq L2d42
S2d3a               ldx #$01
                    ldy $2292
                    lda $2292,y
L2d42               cmp #$0d
                    bne L2d47
                    dey 
L2d47               stx $2191
                    sty $2190
                    lda #$00
                    sta $218f
                    clc 
                    rts 
                    
L2d54               dec $218f
                    rts 
                    
S2d58               ldy $218f
                    cpy $2190
                    bcs L2d75
                    lda $2191
                    bne L2d6b
                    lda $2192,y
                    jmp L2d6e
                    
L2d6b               lda $2293,y
L2d6e               inc $218f
                    jsr S2d76
                    clc 
L2d75               rts 
                    
S2d76               ldx #$07
L2d78               cmp L2d95,x
                    beq L2d84
                    dex 
                    bne L2d78
                    tay 
                    lda #$00
                    rts 
                    
L2d84               tay 
                    lda $2c61,x
                    cmp #$04
                    beq L2d90
                    cmp #$02
                    bne L2d93
L2d90               sty $218b
L2d93               clc 
                    rts 
                    
L2d95               jsr S2a3f
L2d98               BYTE $22,$40 
L2d9a               and $2c24,x
L2d9d               ldx #$ff
L2d9f               inx 
                    lda #$00
                    sta $2177,x
                    jsr S2d58
                    bcs L2dc4
                    and #$a0
                    bne L2dc1
                    ldx #$ff
L2db0               inx 
                    cpx #$10
                    beq L2dc1
                    lda $2177,x
                    bne L2db0
                    tya 
                    sta $2177,x
                    jmp L2d9f
                    
L2dc1               jsr L2d54
L2dc4               clc 
                    rts 
                    
L2dc6               jsr S2dcc
                    jsr S2dcc
S2dcc               jsr S2d58
                    bcs L2e04
                    cpy #$2c
                    bne L2e01
                    jsr S2d58
                    bcs L2e01
                    tya 
                    jsr L2c4f
                    cmp #$50
                    beq L2e28
                    cmp #$53
                    beq L2e28
                    cmp #$55
                    beq L2e28
                    cmp #$52
                    beq L2e31
                    cmp #$57
                    beq L2e31
                    cmp #$41
                    beq L2e31
                    cmp #$46
                    beq L2e31
                    cmp #$4c
                    beq L2e06
                    jsr L2d54
L2e01               jsr L2d54
L2e04               clc 
                    rts 
                    
L2e06               jsr L2e28
                    bcs L2e24
                    jsr S2d58
                    bcs L2e22
                    cpy #$2c
                    bne L2e1f
                    jsr S2d58
                    bcs L2e24
                    sty $218d
                    jmp L2e37
                    
L2e1f               jsr L2d54
L2e22               clc 
                    rts 
                    
L2e24               lda #$1e
                    sec 
                    rts 
                    
L2e28               ldy $218a
                    sta $218a
                    jmp L2e37
                    
L2e31               ldy $2189
                    sta $2189
L2e37               tya 
                    pha 
L2e39               jsr S2d58
                    bcs L2e45
                    and #$a0
                    beq L2e39
                    jsr L2d54
L2e45               clc 
                    pla 
                    beq L2e4c
                    lda #$1e
                    sec 
L2e4c               rts 
                    
L2e4d               jsr S2d58
                    bcs L2e66
                    cpy #$3a
                    beq L2e66
                    cpy #$30
                    bne L2e63
                    jsr S2d58
                    bcs L2e66
                    cpy #$3a
                    beq L2e66
L2e63               jsr L2d54
L2e66               clc 
                    rts 
                    
L2e68               jsr S2d1d
                    jsr S2d58
                    bcs L2ea7
                    cpy #$40
                    bne L2e86
L2e74               sty $218c
                    jsr S2d58
                    bcs L2e93
                    cpy #$40
                    beq L2e74
                    jsr L2d54
                    jmp L2e93
                    
L2e86               cpy #$24
                    bne L2e90
                    sty $2189
                    jmp L2e93
                    
L2e90               jsr L2d54
L2e93               jsr L2e4d
                    jsr L2d9d
                    jsr L2dc6
                    bcs L2ea5
                    jsr S2d58
                    bcs L2ea7
                    lda #$1e
L2ea5               sec 
                    rts 
                    
L2ea7               clc 
                    rts 
                    
L2ea9               jsr L2638
                    cmp #$0f
                    bne L2eb3
                    jmp L3143
                    
L2eb3               cpx #$00
                    beq L2eba
                    jsr S30ea
L2eba               jsr S255f
                    jsr L2e68
                    bcs L2f14
                    lda $2189
                    cmp #$24
                    bne L2ecc
                    jmp L342d
                    
L2ecc               lda #$22
                    ldx $2177
                    beq L2f14
                    lda #$00
                    sta $218e
                    lda $2189
                    bne L2ee2
                    lda #$52
                    sta $2189
L2ee2               jsr L2c69
                    bcs L2f19
                    pha 
                    txa 
                    pha 
                    jsr L2638
                    pla 
                    tax 
                    pla 
                    sta $210f
                    stx $2110
                    jsr S26b5
                    bcs L2f14
                    lda #$3c
                    ldx $2002
                    bne L2f14
                    ldx $2003
                    lda $218a
                    stx $218a
                    beq L2f16
                    cmp $2003
                    beq L2f16
                    lda #$40
L2f14               sec 
                    rts 
                    
L2f16               inc $218e
L2f19               lda $218a
                    bne L2f23
                    lda #$53
                    sta $218a
L2f23               cmp #$4c
                    bne L2f2a
                    jmp L3091
                    
L2f2a               lda $2189
                    cmp #$52
                    beq L2f3f
                    cmp #$41
                    beq L2fb2
                    cmp #$46
                    bne L2f3c
                    jmp L2feb
                    
L2f3c               jmp L3010
                    
L2f3f               lda #$1e
                    ldx $218c
                    bne L2fb0
                    lda #$3e
                    ldx $218e
                    beq L2fb0
                    jsr S26b5
                    bcs L2fb0
                    jsr L2638
                    lda $211b
                    ldx $211c
                    sta $210c
                    stx $210d
                    sta $210f
                    stx $2110
                    clc 
                    adc $2000
                    pha 
                    txa 
                    adc $2001
                    tax 
                    pla 
                    sta $2112
                    stx $2113
                    lda #$1a
                    sta $210e
                    lda $2004
                    sta $2111
                    lda $2007
                    sta $211a
                    lda $2005
                    ldx $2006
                    sta $2118
                    stx $2119
                    lda #$00
                    ldx #$00
                    sta $2115
                    stx $2116
                    sta $2117
                    sta $2114
                    lda $2189
                    sta $210b
                    sta $2002
                    clc 
                    rts 
                    
L2fb0               sec 
                    rts 
                    
L2fb2               lda #$57
                    sta $2189
                    ldx $218e
                    beq L3010
                    lda #$21
                    ldx $218b
                    bne L2fe9
                    jsr L2f3f
                    bcs L2fe9
                    lda $2111
                    sta $210e
                    lda $2112
                    ldx $2113
                    sta $210f
                    stx $2110
                    inc $210e
                    bne L2fe7
                    inc $210f
                    bne L2fe7
                    inc $2110
L2fe7               clc 
                    rts 
                    
L2fe9               sec 
                    rts 
                    
L2feb               lda #$21
                    ldx $218b
                    bne L300e
                    lda #$1e
                    ldx $218a
                    cpx #$53
                    beq L3001
                    cpx #$50
                    beq L3001
                    sec 
                    rts 
                    
L3001               lda $218e
                    beq L3010
                    lda $218c
                    bne L3010
                    jmp L2f3f
                    
L300e               sec 
                    rts 
                    
L3010               lda #$21
                    ldx $218b
                    beq L301a
                    jmp L308f
                    
L301a               ldx $218e
                    beq L302c
                    lda #$3f
                    ldx $218c
                    beq L308f
                    jsr S26b5
                    jsr L2be7
L302c               jsr L2638
                    jsr S262d
                    lda $2102
                    ldx $2103
                    sta $210f
                    stx $2110
                    sta $210c
                    stx $210d
                    sta $2112
                    stx $2113
                    jsr S2b1a
                    bcs L308f
                    jsr L2638
                    jsr S26b5
                    ldy #$11
L3057               lda $2177,y
                    sta $2008,y
                    dey 
                    bpl L3057
                    lda $218a
                    sta $2003
                    lda $218d
                    sta $2007
                    sta $211a
                    lda #$00
                    ldx #$00
                    sta $2000
                    stx $2001
                    lda #$1a
                    sta $2004
                    sta $2111
                    sta $210e
                    lda $2189
                    sta $2002
                    sta $210b
                    clc 
                    rts 
                    
L308f               sec 
                    rts 
                    
L3091               lda #$4c
                    sta $2189
                    sta $218a
                    ldx $218e
                    beq L30b9
                    jsr S26b5
                    lda $2007
                    ldx $218d
                    sta $218d
                    beq L30b1
                    cpx $218d
                    bne L30cd
L30b1               ldx $218c
                    bne L30b9
                    jmp L2f3f
                    
L30b9               lda $218d
                    beq L30cd
                    ldx $218e
                    bne L30ca
                    lda #$21
                    ldx $218b
                    bne L30cf
L30ca               jmp L3010
                    
L30cd               lda #$32
L30cf               sec 
                    rts 
                    
L30d1               ldx #$10
L30d3               txa 
                    pha 
                    jsr S263f
                    jsr S30ed
                    pla 
                    tax 
                    dex 
                    bpl L30d3
                    clc 
                    rts 
                    
L30e2               lda $b9
                    and #$0f
                    cmp #$0f
                    beq L30d1
S30ea               jsr L2638
S30ed               lda $2108
                    ldx $210b
                    beq L3141
                    cmp #$0f
                    beq L313c
                    cpx #$24
                    beq L313c
                    lda $210c
                    ldx $210d
                    sta $210f
                    stx $2110
                    jsr S26b5
                    bcs L3142
                    lda $2111
                    sta $2004
                    lda $2112
                    ldx $2113
                    sec 
                    sbc $210c
                    pha 
                    txa 
                    sbc $210d
                    tax 
                    pla 
                    sta $2000
                    stx $2001
                    lda $2118
                    ldx $2119
                    sta $2005
                    stx $2006
                    lda #$00
                    sta $2002
L313c               lda #$00
                    sta $210b
L3141               clc 
L3142               rts 
                    
L3143               lda #$0f
                    jsr L2638
                    lda #$57
                    sta $210b
                    jsr S2d2e
                    ldy $b7
                    clc 
                    beq L315b
                    cpy #$28
                    bcc L315c
                    lda #$20
L315b               rts 
                    
L315c               sty $2292
                    dey 
L3160               lda $2192,y
                    sta $2293,y
                    dey 
                    bpl L3160
S3169               jsr S31fb
                    ldx #$00
                    stx $2292
                    rts 
                    
L3172               clc 
                    adc $2292
                    sta $2292
                    beq L3183
                    jsr S3169
                    bcc L3183
                    jsr L2567
L3183               rts 
                    
L3184               ldy $2120
                    lda #$28
                    sec 
                    sbc $2292
                    bcs L319d
                    cpy #$0d
                    bne L3198
                    lda #$00
                    sta $2292
L3198               lda #$20
                    jmp L3996
                    
L319d               cpy #$0d
                    bne L31ac
                    jsr S31fb
                    ldx #$00
                    stx $2292
                    jmp L39a7
                    
L31ac               tay 
                    lda #$72
                    ldx #$31
                    sta $2109
                    stx $210a
                    lda #$93
                    ldx #$02
                    clc 
                    adc $2292
                    bcc L31c2
                    inx 
L31c2               sta $df04
                    stx $df05
                    lda #$00
                    sta $df06
                    tya 
                    clc 
                    
        BYTE $4c,$f9,$3a,$53,$32,$3d,$52,$32,$dd
        BYTE $43,$32,$f1,$4e,$32,$cf,$4d,$33
        BYTE $b5,$49,$33,$77,$55,$33,$7d,$56
        BYTE $32,$b9,$50,$2a,$b3,$00
L31ee               jsr S31f4
                    jsr S31f4
S31f4               inc $fe
                    bne L31fa
                    inc $ff
L31fa               rts 
                    
S31fb               jsr S255f
                    jsr S2d1d
                    jsr S2d3a
                    lda #$d2
                    ldx #$31
                    sta $fe
                    stx $ff
                    lda $2292
                    beq L3231
                    jsr S2d58
                    tya 
                    tax 
                    ldy #$fd
L3218               iny 
                    iny 
                    iny 
                    lda ($fe),y
                    bne L3223
                    lda #$1f
                    sec 
                    rts 
                    
L3223               txa 
                    cmp ($fe),y
                    bne L3218
                    iny 
                    lda ($fe),y
                    pha 
                    iny 
                    lda ($fe),y
                    pha 
                    nop 
L3231               clc 
                    rts 
                    
L3233               jsr S2d58
                    bcs L323c
                    cpy #$3a
                    bne L3233
L323c               clc 
                    rts 
                    
L323e               jsr L3233
                    jsr L2d9d
                    bcs L3271
                    lda #$00
                    ldx #$00
                    sta $22bc
                    stx $22bd
L3250               jsr L2c69
                    bcc L325b
                    cmp #$3e
                    beq L3273
                    sec 
                    rts 
                    
L325b               lda $210f
                    ldx $2110
                    jsr S327c
                    inc $22bc
                    bne L326c
                    inc $22bd
L326c               jsr L2be7
                    bcc L3250
L3271               sec 
                    rts 
                    
L3273               lda $22bc
                    ldx $22bd
                    jmp L24f0
                    
S327c               sta $22be
                    stx $22bf
                    lda $2108
                    sta $22c0
                    lda #$10
L328a               jsr S263f
                    beq L32ac
                    lda $22be
                    ldx $22bf
                    cpx $210d
                    bne L329d
                    cmp $210c
L329d               bne L32ac
                    lda $2108
                    cmp $22c0
                    beq L32ac
                    lda #$00
                    sta $210b
L32ac               lda $2108
                    clc 
                    adc #$ff
                    bcs L328a
                    lda $22c0
                    jmp S263f
                    
L32ba               jsr L30d1
                    jsr S255f
L32c0               jsr L2cb0
                    bcs L32ca
                    jsr L2be7
                    bcc L32c0
L32ca               cmp #$3e
                    bne L32cf
                    clc 
L32cf               rts 
                    
L32d0               lda $2100
                    ldx $2101
                    sta $2102
                    stx $2103
                    clc 
                    rts 
                    
L32de               jsr S33e7
                    bcs L32f0
                    ldx #$ff
L32e5               inx 
                    lda $2123,x
                    sta $2008,x
                    bne L32e5
                    clc 
                    rts 
                    
L32f0               sec 
                    rts 
                    
L32f2               jsr S33e7
                    bcs L3370
                    lda $2000
                    ldx $2001
                    sec 
                    adc $2102
                    pha 
                    txa 
                    adc $2103
                    tax 
                    pla 
                    cpx $2105
                    bne L3310
                    cmp $2104
L3310               beq L3314
                    bcs L336e
L3314               sta $22c1
                    stx $22c2
                    lda $2102
                    ldx $2103
                    pha 
                    txa 
                    pha 
L3323               lda $2102
                    ldx $2103
                    sta $211b
                    stx $211c
                    inc $210f
                    bne L3337
                    inc $2110
L3337               inc $2102
                    bne L333f
                    inc $2103
L333f               jsr S26b5
                    lda $2103
                    cmp $22c2
                    bne L3350
                    lda $2102
                    cmp $22c1
L3350               bne L3323
                    pla 
                    tax 
                    pla 
                    sta $210f
                    stx $2110
                    jsr S26bb
                    ldx #$ff
L3360               inx 
                    lda $2123,x
                    sta $2008,x
                    bne L3360
                    sta $2002
                    clc 
                    rts 
                    
L336e               lda #$48
L3370               sec 
                    rts 
                    
L3372               jsr L30d1
                    jmp S255c
                    
L3378               jsr L30d1
                    jmp S255f
                    
L337e               jsr S2d58
                    bcs L339e
                    cpy #$3a
                    beq L3372
                    cpy #$4a
                    beq L3372
                    cpy #$49
                    beq L3372
                    cpy #$30
                    bne L339e
                    jsr S2d58
                    bcs L339e
                    cpy #$3e
                    bne L339e
                    clc
                    byte $24
L339e               sec
L339f               bcs L33b2;$11
                
                    jsr S2d58
                    bcs L33b2
                    tya 
                    and #$9f
                    bmi L33b2
                    cmp #$04
                    bcc L33b2
                    jmp S3e0c
                    
L33b2               lda #$1f
                    sec 
                    rts 
                    
L33b6               jsr S2d58
                    jsr S2d58
                    bcs L33e3
                    cpy #$57
                    bne L33e3
                    jsr S2d58
                    bcs L33e3
                    cpy #$77
                    beq L33cf
                    cpy #$78
                    bne L33e3
L33cf               jsr S2d58
                    bcs L33e3
                    cpy #$00
                    bne L33e3
                    jsr S2d58
                    bcs L33e3
                    cpy #$00
                    beq L33e3
                    clc 
                    byte $24
L33e3               sec 
                    jmp L339f
                    
S33e7               jsr L3233
                    jsr L2d9d
                    bcs L342b
                    lda $218b
                    bne L3429
                    jsr L2c69
                    lda #$3f
                    bcc L342b
                    ldx #$ff
L33fd               inx 
                    lda $2177,x
                    sta $2123,x
                    bne L33fd
                    jsr S2d58
                    bcs L342b
                    cpy #$3d
                    bne L3429
                    jsr L2e4d
                    jsr L2d9d
                    bcs L342b
                    lda #$22
                    ldx $2177
                    beq L342b
                    jsr L2c69
                    bcs L3426
                    jmp L26af
                    
L3426               lda #$3e
                    byte $2c
L3429               lda #$1e
L342b               sec 
                    rts 
                    
L342d               lda #$24
                    sta $210b
                    jsr S263d
                    lda #$00
                    sta $210e
                    sta $210f
                    sta $2110
                    lda $2177
                    bne L344d
                    sta $2178
                    lda #$2a
                    sta $2177
L344d               jmp L34fb
                    
        BYTE $18,$6d,$0e,$21,$8d,$0e,$21,$60
L3458               jsr S263d
                    ldy $210e
                    cpy $2111
                    bcc L346c
                    jsr S349d
                    bcc L346c
                    clc 
                    jmp L398d
                    
L346c               lda #$50
                    ldx #$34
                    sta $2109
                    stx $210a
                    lda #$c3
                    ldx #$02
                    clc 
                    adc $210e
                    bcc L3481
                    inx 
L3481               sta $df04
                    stx $df05
                    lda #$00
                    sta $df06
                    lda $2111
                    sec 
                    sbc $210e
                    ldx $22f5
                    ldy $22f6
                    sec 
                    jmp L3af9
                    
S349d               lda $210f
                    ora $2110
                    bne L34ae
                    lda $2100
                    ldx $2101
                    jmp L34d3
                    
L34ae               lda $210f
                    ldx $2110
                    cpx $2103
                    bne L34bc
                    cmp $2102
L34bc               bcc L34bf
                    rts 
                    
L34bf               jsr S26b5
                    lda $210f
                    ldx $2110
                    sec 
                    adc $2000
                    pha 
                    txa 
                    adc $2001
                    tax 
                    pla 
L34d3               sta $210f
                    stx $2110
                    cpx $2103
                    bne L34e1
                    cmp $2102
L34e1               bcc L34e9
                    jsr S354a
                    jmp L34f4
                    
L34e9               jsr S26b5
                    jsr S2cf6
                    bcs S349d
                    jsr S3572
L34f4               lda #$00
                    sta $210e
                    clc 
                    rts 
                    
L34fb               ldx #$20
                    stx $2111
                    dex 
L3501               lda $350c,x
                    sta $22c3,x
                    dex 
                    bpl L3501
                    clc 
                    rts 
                    
        BYTE $01,$10,$01,$10
        BYTE $00,$00,$12,$22,$52,$41,$4d,$44
        BYTE $49,$53,$4b,$20,$56,$34,$2e,$34
        BYTE $20,$20,$20,$20,$22,$20,$48,$44
        BYTE $20,$30,$30,$00,$01,$10,$00,$00
        BYTE $42,$4c,$4f,$43,$4b,$53,$20,$46
        BYTE $52,$45,$45,$20,$20,$20,$20,$20
        BYTE $20,$20,$20,$20,$20,$20,$20,$20
        BYTE $00,$00
S354a               ldx #$1e
                    stx $2111
                    dex 
L3550               lda $352c,x
                    sta $22c3,x
                    dex 
                    bpl L3550
                    lda $2104
                    ldx $2105
                    sec 
                    sbc $2102
                    pha 
                    txa 
                    sbc $2103
                    tax 
                    pla 
                    sta $22c5
                    stx $22c6
                    clc 
                    rts 
                    
S3572               ldx #$20
                    stx $2111
                    lda #$20
L3579               sta $22c3,x
                    dex 
                    cpx #$03
                    bne L3579
                    lda #$22
                    sta $22c7
                    ldx #$00
L3588               lda $2008,x
                    sta $22c8,x
                    beq L3595
                    inx 
                    cpx #$11
                    bne L3588
L3595               lda #$22
                    sta $22c8,x
                    ldy #$53
                    lda #$45
                    ldx #$51
                    cpy $2003
                    beq L35ca
                    ldy #$50
                    lda #$52
                    ldx #$47
                    cpy $2003
                    beq L35ca
                    ldy #$55
                    lda #$53
                    ldx #$52
                    cpy $2003
                    beq L35ca
                    ldy #$52
                    lda #$45
                    ldx #$4c
                    cpx $2003
                    beq L35ca
                    lda #$3f
                    tax 
                    tay 
L35ca               sty $22da
                    sta $22db
                    stx $22dc
                    lda $2002
                    cmp #$57
                    bne L35df
                    lda #$2a
                    sta $22d9
L35df               lda $2000
                    ldx $2001
                    clc 
                    adc #$01
                    pha 
                    txa 
                    adc #$00
                    tax 
                    pla 
                    sta $22c5
                    stx $22c6
                    cpx #$03
                    bne L35fa
                    cmp #$e8
L35fa               bcs L3615
                    cpx #$00
                    bne L3602
                    cmp #$64
L3602               bcs L3612
                    cpx #$00
                    bne L360a
                    cmp #$0a
L360a               bcs L360f
                    jsr S361c
L360f               jsr S361c
L3612               jsr S361c
L3615               lda #$00
                    sta $22e2
                    clc 
                    rts 
                    
S361c               ldx #$04
                    lda #$20
L3620               ldy $22c3,x
                    sta $22c3,x
                    tya 
                    inx 
                    cpx #$20
                    bne L3620
                    rts 
                    
L362d               sta $93
                    lda $b7
                    bne L3637
                    lda #$08
                    bne L366b
L3637               jsr S3676
                    bcc L365d
                    cmp #$00
                    bne L3650
                    lda $93
                    bne L3648
                    lda #$10
                    bne L366b
L3648               lda #$10
                    ora $90
                    sta $90
                    bne L365d
L3650               jsr L2567
                    lda #$02
                    ora $90
                    sta $90
                    lda #$04
                    bne L366b
L365d               lda #$40
                    ora $90
                    sta $90
                    ldx $ae
                    ldy $af
                    clc 
                    jmp L39c1
                    
L366b               tay 
                    lda #$f6
                    pha 
                    lda #$98
                    pha 
                    tya 
                    jmp L39c1
                    
S3676               lda #$00
                    sta $90
                    jsr S3a83
                    jsr L2e68
                    bcs L36c6
                    jsr S2d58
                    bcc L36c4
                    lda $218c
                    bne L36c4
                    lda $2189
                    cmp #$24
                    bne L3696
                    jmp L377a
                    
L3696               ora $218a
                    bne L36c4
                    lda #$22
                    ldx $2177
                    beq L36c6
                    jsr L2c69
                    bcs L36c6
                    sta $210f
                    stx $2110
                    jsr S26b5
                    lda #$40
                    ldx $2003
                    cpx #$50
                    bne L36c6
                    ldx $2002
                    beq L36c8
                    lda #$3c
                    bit $3ea9
                    byte $2c
L36c4               lda #$1e
L36c6               sec 
                    rts 
                    
L36c8               jsr $f533
                    jsr S26d7
                    lda $c3
                    ldx $c4
                    ldy $b9
                    beq L36dc
                    lda $201a
                    ldx $201b
L36dc               sta $df02
                    stx $df03
                    ldy #$1c
                    sty $df04
                    lda $210f
                    ldx $2110
                    sta $df05
                    stx $df06
                    sec 
                    lda $2004
                    sbc #$1b
                    tay 
                    lda $2000
                    ldx $2001
                    sbc #$00
                    bcs L370e
                    dex 
                    jmp L370e
                    
L3708               ldx #$00
                    txa 
                    ldy $2111
L370e               sty $df07
                    sta $df08
                    cpx #$00
                    php 
                    lda #$ff
                    ldx #$ef
                    sec 
                    sbc $df02
                    pha 
                    txa 
                    sbc $df03
                    tax 
                    pla 
                    plp 
                    bne L3733
                    cpx $df08
                    bne L3731
                    cmp $df07
L3731               bcs L373f
L3733               sta $df07
                    stx $df08
                    jsr L373f
                    jmp L3774
                    
L373f               lda $df02
                    ldx $df03
                    clc 
                    adc $df07
                    pha 
                    txa 
                    adc $df08
                    tax 
                    pla 
                    sta $ae
                    stx $af
                    lda $df07
                    ora $df08
                    beq L3778
                    ldy #$a1
                    lda $93
                    beq L3764
                    ldy #$a3
L3764               jsr S3a30
                    lda $93
                    beq L3778
                    lda $df00
                    and #$20
                    sta $93
                    beq L3778
L3774               lda #$00
                    sec 
                    rts 
                    
L3778               clc 
                    rts 
                    
L377a               jsr $f533
                    jsr L342d
                    lda $c3
                    ldx $c4
                    ldy $b9
                    beq L378c
                    lda #$10
                    ldx #$10
L378c               sta $ae
                    stx $af
                    dec $2111
                    dec $2111
                    ldx #$ff
L3798               inx 
                    lda $22c5,x
                    sta $22c3,x
                    cpx $2111
                    bcc L3798
L37a4               jsr S37bd
                    bcs L37ba
                    jsr S349d
                    bcc L37a4
                    ldx #$00
                    stx $22c3
                    inx 
                    stx $2111
                    jsr S37bd
L37ba               lda #$00
                    rts 
                    
S37bd               lda #$c3
                    ldx #$02
                    sta $df04
                    stx $df05
                    lda #$00
                    sta $df06
                    lda $ae
                    ldx $af
                    sta $df02
                    stx $df03
                    jmp L3708
                    
L37d9               lda #$00
                    sta $90
                    jsr S3a7c
                    jsr L2e68
                    bcs L3827
                    lda $218a
                    ora $2189
                    ora $218b
                    bne L3825
                    lda #$22
                    ldx $2177
                    beq L3827
                    jsr L2c69
                    bcs L381f
                    sta $210f
                    stx $2110
                    jsr S26b5
                    lda #$3f
                    ldx $218c
                    beq L3827
                    lda #$40
                    ldx $2003
                    cpx #$50
                    bne L3827
                    lda #$3c
                    ldx $2002
                    bne L3827
                    jsr L2be7
L381f               jmp L3829
                    
                    lda #$3e
                    byte $2c
L3825               lda #$1e
L3827               sec 
                    rts 
                    
L3829               lda $2102
                    ldx $2103
                    cpx $2105
                    bne L3837
                    cmp $2104
L3837               bcc L383d
                    lda #$48
                    sec 
                    rts 
                    
L383d               jsr L26af
                    lda $c1
                    ldx $c2
                    sta $201a
                    stx $201b
                    lda $ae
                    ldx $af
                    sec 
                    sbc $c1
                    pha 
                    txa 
                    sbc $c2
                    tax 
                    pla 
                    tay 
                    pha 
                    txa 
                    pha 
                    tya 
                    clc 
                    adc #$ff
                    pha 
                    txa 
                    adc #$ff
                    tax 
                    pla 
                    clc 
                    adc #$1c
                    sta $2004
                    txa 
                    adc #$00
                    sta $2000
                    lda #$00
                    sta $2001
                    asl $2001
                    sta $2002
                    lda #$50
                    sta $2003
                    ldx #$ff
L3883               inx 
                    lda $2177,x
                    sta $2008,x
                    bne L3883
                    jsr S26d7
                    pla 
                    tax 
                    pla 
                    sta $df07
                    stx $df08
                    lda $c1
                    ldx $c2
                    sta $df02
                    stx $df03
                    lda $210f
                    ldx $2110
                    sta $df05
                    stx $df06
                    lda #$1c
                    sta $df04
                    lda $2000
                    ldx $2001
                    sec 
                    adc $2102
                    pha 
                    txa 
                    adc $2103
                    tax 
                    pla 
                    cpx $2105
                    bne L38cc
                    cmp $2104
L38cc               bcc L38d1
                    lda #$48
                    rts 
                    
L38d1               sta $2102
                    stx $2103
                    ldy #$a0
                    jsr S3a30
                    jsr S26d4
                    clc 
                    rts 
                    
L38e1               jsr S3a96
                    stx $22f5
                    sty $22f6
                    sta $2120
                    bcc L38f9
                    lda $90
                    bne L38f6
                    jmp L2704
                    
L38f6               jmp L3999
                    
L38f9               jmp L2788
                    
L38fc               jsr S3a96
                    jmp L39c1
                    
L3902               bcc L38fc
                    jsr S3a96
                    txa 
                    jsr $f1e5
                    pla 
                    ror a
                    nop 
                    jsr S3b90
L3900               
                    clc 
                    jmp L39a7
                    
L3915               jsr S3a96
                    sta $2120
                    bcs L3920
                    jmp L39f1
                    
L3920               lda $ba
                    cmp $2122
                    beq L3935
                    lda $3d28
                    pha 
                    lda $3d27
                    pha 
                    lda $2120
                    jmp L39c1
                    
L3935               lda $ba
                    pha 
                    lda #$00
                    sta $ba
                    jsr $efbd
                    tay 
                    pla 
                    sta $ba
                    tya 
                    bcs L39c1
                    lda $ba
                    sta $036c,x
                    jsr L2ea9
                    
                    
                    byte $4c,$a7 
L3950               byte $39
L3951               php
                    pha 
                    jsr S3a96
                    lda $ba
                    cmp $2122
                    beq L3980
                    pla 
                    sta $2120
                    plp 
                    bcc L3972
                    lda $3d2e
                    pha 
                    lda $3d2d
                    pha 
                    lda $2120
                    jmp L39c1
                    
L3972               lda $3d2c
                    pha 
                    lda $3d2b
                    pha 
                    lda $2120
                    jmp L39c1
                    
L3980               pla 
                    plp 
                    bcs L3987
                    jmp L362d
                    
L3987               jsr L37d9
                    jmp L39a7
                    
L398d               lda #$42
                    sta $90
                    lda #$00
                    jmp L39ba
                    
L3996               sec 
                    bcs L39a7
L3999               lda #$0d
                    byte $2c,$a9,$00
L399e               sta $2120
                    lda #$ff
                    sta $211f
                    clc 
L39a7               bcc L39b4
                    rol $211f
                    jsr L2567
                    lda #$0d
                    sta $2120
L39b4               jsr S39e0
                    lda $2120
L39ba               ldx $22f5
                    ldy $22f6
                    clc 
L39c1               sta $2120
                    lda $2121
                    pha 
                    lda #$e3
                    pha 
                    lda $2121
                    pha 
                    lda #$aa
                    pha 
                    lda $211d
                    sta $fe
                    lda $211e
                    sta $ff
                    lda $2120
                    rts 
                    
S39e0               lda $211f
                    beq L39e9
                    lda #$40
                    ora $90
L39e9               sta $90
                    lda #$00
                    sta $211f
                    rts 
                    
L39f1               jsr kRESTOR
                    jsr S3d31
                    lda #$fa
                    pha 
                    lda #$55
                    pha 
                    lda $2121
                    pha 
                    lda #$aa
                    pha 
                    rts 
                    
S3a05               lda $bb
                    ldx $bc
                    sta $df02
                    stx $df03
                    lda $b7
                    bne L3a14
                    rts 
                    
L3a14               sta $df07
                    lda #$00
                    sta $df08
                    sta $df06
                    lda #$92
                    ldx #$01
                    sta $df04
                    stx $df05
                    ldx $c7
                    ldy #$a0
                    jmp L3a32
                    
S3a30               ldx $c6
L3a32               sty $22f7
                    lda $2121
                    pha 
                    lda #$aa
                    pha 
                    lda #$03
                    pha 
                    lda #$e3
                    pha 
                    jsr $ff6b
                    pha 
                    and #$c0
                    ora $d506
                    tax 
                    pla 
                    jmp L3a50
                    
L3a50               pha 
                    txa 
                    pha 
                    lda $22f7
                    pha 
                    ldx #$02
L3a59               lda $df00,x
                    pha 
                    inx 
                    cpx #$0b
                    bne L3a59
                    lda $2121
                    pha 
                    lda #$b6
                    pha 
                    lda $2121
                    pha 
                    lda #$aa
                    pha 
                    lda $211d
                    sta $fe
                    lda $211e
                    sta $ff
                    clc 
                    rts 
                    
S3a7c               lda #$bb
                    ldx #$f5
                    jmp L3a87
                    
S3a83               lda #$0e
                    ldx #$f5
L3a87               tay 
                    lda $2121
                    pha 
                    lda #$a7
                    pha 
                    txa 
                    pha 
                    tya 
                    pha 
                    jmp L39c1
                    
S3a96               php 
                    pha 
                    lda $fe
                    sta $211d
                    lda $ff
                    sta $211e
                    lda $22f8
                    beq L3ad8
                    txa 
                    pha 
                    tya 
                    pha 
                    lda $2121
                    sta $ff
                    lda #$00
                    sta $fe
                    lda #$2c
                    ldy #$14
                    sta ($fe),y
                    ldy #$26
                    sta ($fe),y
                    lda #$60
                    ldy #$61
                    sta ($fe),y
                    ldy #$00
                    sec 
                    lda $22f8
                    sbc ($fe),y
                    jsr S3adb
                    pla 
                    tay 
                    pla 
                    tax 
                    lda #$00
                    sta $22f8
L3ad8               pla 
                    plp 
                    rts 
                    
S3adb               jmp ($2109)
L3ade               sta $2109
                    stx $210a
                    lda $210f
                    ldx $2110
                    sta $df05
                    stx $df06
                    lda $210e
                    sta $df04
                    tya 
                    bcc L3b0c
L3af9               tax 
                    lda $2121
                    pha 
                    lda #$ee
                    pha 
                    lda $2121
                    pha 
                    lda #$c6
                    pha 
                    txa 
                    jmp L3b15
                    
L3b0c               tax 
                    lda $2121
                    pha 
                    lda #$e3
                    pha 
                    txa 
L3b15               sta $22f8
                    lda #$00
                    sta $fe
                    lda $2121
                    sta $ff
                    ldy #$dd
                    bcs L3b3f
                    lda #$90
                    sta ($fe),y
                    ldy #$60
                    lda $210b
                    eor #$4c
                    bne L3b34
                    ldy #$ea
L3b34               tya 
                    ldy #$61
                    sta ($fe),y
                    lda #$2c
                    ldx #$20
                    bcc L3b47
L3b3f               lda #$91
                    sta ($fe),y
                    lda #$20
                    ldx #$2c
L3b47               ldy #$14
                    sta ($fe),y
                    ldy #$26
                    txa 
                    sta ($fe),y
                    ldy #$cf
                    lda $b9
                    and #$0f
                    sta ($fe),y
                    ldy #$00
                    lda $22f8
                    sta ($fe),y
                    lda $2121
                    sta $df03
                    lda #$e2
                    sta $df02
                    lda #$00
                    sta $df09
                    lda #$80
                    sta $df0a
                    lda #$01
                    ldx #$00
                    sta $df07
                    stx $df08
                    ldx $22f5
                    ldy $22f6
                    lda #$00
                    sta $22f7
                    lda $2120
                    jmp L3a50
                    
        BYTE $00
S3b90               bcs L3b95
L3b92               jmp L30e2
                    
L3b95               lda $b9
                    and #$0f
                    cmp #$0f
                    bne L3b92
                    rts 
                    
        BYTE $00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00
L3c02               lda $99
                    cmp #$09
                    beq L3c0b
                    jmp $fffc
                    
L3c0b               lda $99
                    cmp #$09
                    beq L3c14
                    jmp $fffc
                    
L3c14               bit L3cc4
                    sec 
                    bcs L3c2a
                    pha 
                    lda $9a
                    cmp #$09
                    beq L3c25
                    pla 
                    jmp $fffc
                    
L3c25               pla 
                    bit L3cc4
                    clc 
L3c2a               jsr S3ca8
                    jmp L38e1
                    
L3c30               jsr S3c3c
                    bcs L3c38
                    jmp $fffc
                    
L3c38               sta $99
                    clc 
                    rts 
                    
S3c3c               lda #$00
                    sta $3c01
                    jsr $f202
                    tax 
S3c45               jsr $f207
                    bne L3c53
                    jsr $f212
                    cmp #$09
                    beq L3c55
                    lda $b8
L3c53               tax 
                    clc 
L3c55               rts 
                    
L3c56               byte $20,$3c,$3c
                    bcs L3c5e
                    jmp $fffc
                    
L3c5e               sta $9a
                    clc 
                    rts 
                    
L3c62               jsr S3ca8
                    jmp L3902
                    
L3c68               php 
                    jsr S3c45
                    bcs L3c62
                    plp 
                    jmp $fffc
                    
L3c72               sec 
                    bit $18
L3c75               jsr S3ca8
                    jmp L3951
                    
L3c7b               cld 
                    lda #$7f
                    sta $dd0d
                    ldy $dd0d
                    bmi L3c8e
                    jsr $f63d
                    jsr kSTOP
                    beq L3c91
L3c8e               jmp $fa5f
                    
L3c91               clc 
                    bit $38
                    jsr S3ca8
                    jmp L3915
                    
        BYTE $00,$00,$1f,$ff,$00,$00,$00,$20
        BYTE $00,$b2,$49,$09,$d0,$1b
S3ca8               jsr S3cf0
                    pha 
                    txa 
                    pha 
                    ldx #$09
L3cb0               lda $3c9a,x
                    pha 
                    dex 
                    bpl L3cb0
                    ldx #$09
L3cb9               pla 
                    sta $df01,x
                    dex 
                    bpl L3cb9
                    pla 
                    tax 
                    pla 
                    rts 
                    
L3cc4               jsr S3cf0
                    sta $3ce2
                    lda $b9
                    and #$0f
                    cmp #$ff
                    bne L3ce1
                    lda $3c00
                    beq L3ce1
                    dec $3c00
                    pla 
                    pla 
                    lda #$b1
                    sta $df01
L3ce1               lda #$00
                    clc 
                    inc $dc03
                    pha 
                    lda #$00
                    cli 
L3ceb               sta $d030
                    pla 
                    rts 
                    
S3cf0               pha 
                    sei 
                    lda $d030
                    sta $3ce9
                    dec $dc03
                    lda #$00
                    beq L3ceb
                    rol a
                    bit $26
                    asl $1a20,x
L3d05   BYTE $1c,$30,$32,$18,$09,$12,$23,$36,$5c,$00,$70 
        BYTE $00,$00,$00,$02,$0b,$1a,$30,$56
        BYTE $93,$68,$74,$72,$7b,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00
S3d31               lda #$ff
                    sta $dc01
                    lda $2121
                    sta $ff
                    lda #$00
                    sta $fe
                    ldx #$09
L3d41               ldy $3cff,x
                    lda $0301,y
                    pha 
                    lda $0300,y
                    pha 
                    txa 
                    asl a
                    tay 
                    pla 
                    clc 
                    adc #$ff
                    sta $3d1d,y
                    pla 
                    adc #$ff
                    sta $3d1e,y
                    ldy $3cff,x
                    lda $0300,y
                    ldy $3d09,x
                    beq L3d75
                    sta ($fe),y
                    ldy $3cff,x
                    lda $0301,y
                    ldy $3d09,x
                    iny 
                    sta ($fe),y
L3d75               ldy $3cff,x
                    lda $3d13,x
                    sta $0300,y
                    lda $ff
                    sta $0301,y
                    dex 
                    bpl L3d41
                    rts 
                    
        BYTE $16,$28,$2c,$32,$40,$58,$64,$6b
        BYTE $77
        BYTE $96,$aa,$b2,$c6,$c9,$d4,$d9,$f7
        BYTE $05,$0e,$1e,$4e,$a5
L3d9d               lda #$09
                    ldx #$0e
L3da1               cld 
                    pha 
                    txa 
                    pha 
                    jsr S3cf0
                    ldx #$00
                    lda #$00
L3dac               sta $2000,x
                    sta $2100,x
                    sta $2200,x
                    inx 
                    bne L3dac
                    jsr S3e6f
                    pla 
                    tax 
                    pla 
L3dbe               pha 
                    txa 
                    sta $2121
                    jsr S3e26
                    pla 
                    jsr S3e0c
                    jsr S3d31
                    jsr S255c
                    jsr S261d
                    lda $2121
                    pha 
                    lda #$e3
                    pha 
                    lda $2121
                    pha 
                    lda #$aa
                    pha 
                    rts 
                    
L3de2               lda #$09
                    ldx #$0e
L3de6               cld 
                    pha 
                    txa 
                    pha 
                    jsr S3cf0
                    ldx #$08
L3def               lda $3e03,x
                    sta $df02,x
                    dex 
                    bpl L3def
                    lda #$b2
                    sta $df01
                    pla 
                    tax 
                    pla 
                    jmp L3dbe
                    
        BYTE $00,$20,$00,$00,$00,$00,$03,$00
        BYTE $00
S3e0c               and #$1f
                    sta $2122
                    ldx $2121
                    stx $ff
                    ldx #$00
                    stx $fe
                    ldx #$04
L3e1c               ldy $3d98,x
                    sta ($fe),y
                    dex 
                    bpl L3e1c
                    clc 
                    rts 
                    
S3e26               sta $ff
                    ldy #$00
                    sty $fe
L3e2c               lda $3c00,y
                    sta ($fe),y
                    iny 
                    bne L3e2c
                    ldx #$10
                    lda $ff
L3e38               ldy $3d87,x
                    sta ($fe),y
                    dex 
                    bpl L3e38
                    ldx #$1b
L3e42               lda L3e53,x
                    sta $03e4,x
                    dex 
                    bpl L3e42
                    ldx #$0e
                    lda $ff
                    sta $03e4,x
                    rts 
                    
L3e53               ldy $d506
                    stx $d506
                    ldx $ff00
                    sec 
                    bcs L3e65
                    jsr $00a8
                    jmp L38fc
                    
L3e65               sta $ff00
                    stx $ff00
                    sty $d506
                    rts 
                    
S3e6f               lda #$00
                    ldx #$00
                    sta $211b
                    stx $211c
                    ldx #$00
L3e7b               txa 
                    eor #$5a
                    sta $2000,x
                    dex 
                    bne L3e7b
L3e84               jsr S26d7
                    inc $211c
                    bne L3e84
L3e8c               ldx #$00
L3e8e               txa 
                    eor #$2c
                    sta $2000,x
                    dex 
                    bne L3e8e
                    jsr S26d7
                    inc $211c
                    bmi L3eb2
                    jsr S26d4
                    ldx #$00
L3ea4               txa 
                    eor #$5a
                    cmp $2000,x
                    bne L3eb2
                    dex 
                    bne L3ea4
                    jmp L3e8c
                    
L3eb2               lda $211b
                    ldx $211c
                    sta $2104
                    stx $2105
                    ldx #$00
                    lda #$20
                    sta $2106
                    stx $2107
                    lda #$22
                    sta $2100
                    stx $2101
                    sta $2102
                    stx $2103
                    lda #$29
                    sta $211b
                    stx $211c
                    rts 
                    
        BYTE $00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$00,$00,$00
        BYTE $00,$00,$00,$00,$00,$46,$41,$42
