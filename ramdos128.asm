; This is from COMPUTE, I think.  And is included for completeness.
; It is the assembly source for the C128 version of the REU filesystem
; driver that Zelch uses to store program files for quick-swapping.
*=$2300

    JMP $3D9D
    JMP $3DE2
    JMP $3DA1
    JMP $3DE6
    JMP $230F
    LDX #$00
    TXA
    PHA
    LDA $2321,X
    JSR $C00C
    PLA
    TAX
    INX
    CPX #$45
    BNE $2311
    RTS
    ORA $4328
    AND #$20
    AND ($39),Y
    SEC
    ROL $20,X
    EOR
    EOR $4F4D
    MVP
    EOR $20
    EOR $4C
    EOR $43
    MVN
    LSR $4349
    EOR
    JSR $544C
    MVP
    ORA $2020
    JSR $2020
    JSR $2020
    EOR ($4C,X)
    JMP $5220
    EOR #$47
    PHA
    MVN
    EOR
    EOR
    EOR
    EOR $44
    ROL $0D20
    BRK
    EOR
    PHK
    BRK
    ORA ($46,X)
    EOR #$4C
    EOR $53
    JSR $4353
    EOR
    MVN
    EOR $44
    BRK
    ORA $4F44
    EOR
    EOR
    LSR $5546
    EOR
    MVP
    EOR
    LSR $4154
    CLI
    JSR $5245
    EOR
    EOR
    ORA
    EOR
    LSR $4154
    CLI
    JSR $5245
    EOR
    EOR
    JSR $5953
    LSR $4154
    CLI
    JSR $5245
    EOR
    EOR
    AND ($53,X)
    EOR $544E,Y
    EOR ($58,X)
    JSR $5245
    EOR
    EOR
    JSR
    EOR
    LSR $4154
    CLI
    JSR $5245
    EOR
    EOR
    AND
    EOR $43
    EOR
    EOR
    JSR $4F4E
    MVN
    EOR
    EOR
    LSR $0054
    AND
    LSR $45,X
    EOR
    JMP $574F
    JSR $4E49
    JSR $4552
    EOR
    EOR
    BRK
    BIT $46,X
    EOR #$4C
    EOR $20
    MVN
    JSR $414C
    EOR
    EOR $00
    BIT $4946,X
    JMP $2045
    EOR
    BVC $2464
    LSR $3D00
    LSR $49
    JMP $2045
    LSR $544F
    JSR $504F
    EOR $4E
    BRK
    ROL $4946,X
    JMP $2045
    LSR $544F
    JSR $4F46
    EOR $4E,X
    MVP
    LSR $49
    JMP $2045
    EOR $58
    EOR #$53
    MVN
    RTI
    LSR $49
    JMP $2045
    MVN
    EOR $20
    EOR $5349
    EOR $5441
    EOR
    BRK
    WDM
    JMP $454C
    EOR
    JMP $5420
    EOR
    EOR
    JSR $4E41
    MVP
    EOR $43
    MVN
    BRK
    LSR $4E
    EOR
    JSR $4843
    EOR ($4E,X)
    LSR $4C45
    BRK
    PHA
    MVP
    PHK
    JSR $5546
    JMP $004C
    EOR #$43
    WDM
    JSR $4F44
    EOR
    LSR $34,X
    ROL $2034
    AND ($37),Y
    AND $30,X
    BRK
    BRK
    WDM
    MVP
    EOR
    EOR
    EOR
    LSR $4D55
    WDM
    EOR
    CLC
    ADC $2169
    STA $2169
    RTS
    LDX $2169
    CPX $216A
    BCC $24D4
    JSR $255F
    CLC
    JMP $3999
    LDA #$A8
    LDX #$24
    STA $2109
    STX $210A
    LDA #$37
    LDX #$01
    CLC
    ADC $2169
    BCC $24E9
    INX
    STA $DF04
    STX $DF05
    LDA #$00
    STA $DF06
    LDA $216A
    SEC
    SBC $2169
    LDX $22F5
    LDY $22F6
    SEC
    JMP $3AF9
    STA $216B
    STX $216C
    LDY #$01
    JSR $2580
    LDA #$00
    STA $216F
    LDA #$10
    LDX #$27
    JSR $2523
    LDA #$E8
    LDX #$03
    JSR $2523
    LDA #$64
    LDX #$00
    JSR $2523
    LDA $216B
    JSR $25A6
    JSR $25D4
    LDA #$00
    JMP $25A6
    STA $216D
    STX $216E
    LDA $216F
    AND #$F0
    STA $216F
    LDA $216B
    SEC
    SBC $216D
    TAX
    LDA $216C
    SBC $216E
    BCC $2568
    STA $216C
    STX $216B
    LDA $216F
    ADC #$00
    ORA #$30
    STA $216F
    BNE $2546
    LDA $216F
    BEQ $2570
    JSR $25D6
    RTS
    LDY #$49
    BIT $00A0
    LDA #$00
    TAX
    JMP $256E
    TAY
    LDA $210F
    LDX $2110
    JSR $2580
    LDA $2135
    JSR $25A6
    JSR $25D4
    LDA $2136
    JMP $25A6
    STY $2134
    STX $2135
    STA $2136
    LDA #$00
    STA $2169
    STA $216A
    LDA $2134
    JSR $25A6
    JSR $25D4
    LDA #$20
    JSR $25D6
    JSR $25EA
    JSR $25D4
    RTS
    CMP #$64
    BCC $25D5
    CMP #$C8
    BCC $25CB
    SBC #$C8
    PHA
    LDA #$02
    JMP $25BC
    SEC
    SBC #$64
    PHA
    LDA #$01
    JSR $25D1
    PLA
    LDX #$FF
    INX
    SEC
    SBC #$0A
    BCS $25D7
    PHA
    TXA
    JSR $25D1
    PLA
    CLC
    ADC #$0A
    ORA #$30
    BIT $2CA9
    LDX $216A
    STA $2137,X
    CPX #$30
    BEQ $25F8
    INC $216A
    LDA #$00
    STA $2138,X
    CLC
    RTS
    LDA #$66
    LDX #$23
    STA $FE
    STX $FF
    LDA $2134
    LDX #$00
    CMP ($FE,X)
    BEQ $2615
    JSR $260D
    BNE $2607
    JSR $2612
    BEQ $2620
    JSR $25D6
    JMP $2600
    CLC
    RTS
    JSR $2612
    BNE $2622
    INC $FE
    BNE $262D
    INC $FF
    LDX #$00
    LDA ($FE,X)
    RTS
    LDX #$10
    TXA
    JSR $263F
    JSR $262D
    LDX $2108
    DEX
    BPL $2634
    RTS
    LDX #$0F
    LDA #$00
    STA $210B,X
    DEX
    BPL $2646
    RTS
    LDA $B9
    AND #$0F
    BIT $10A9
    CMP $2108
    BEQ $2685
    PHA
    LDA #$0B
    LDX #$21
    STA $DF02
    STX $DF03
    LDA $2107
    STA $DF06
    LDA #$10
    LDX #$00
    STA $DF07
    STX $DF08
    LDA $2108
    LDY #$B0
    JSR $2678
    PLA
    STA $2108
    LDY #$B1
    JSR $2678
    LDA $2108
    LDX $210B
    CLC
    RTS
    ASL
    TAX
    LDA $268D,X
    STA $DF04
    LDA $268E,X
    ADC $2106
    STA $DF05
    STY $DF01
    RTS
    BRK
    BRK
    BPL $26A6
    JSR $3000
    BRK
    RTI
    BRK
    BVC $26AE
    RTS
    BRK
    BVS $26B2
    BRA $26B4
    BCC $26B6
    LDY #$00
    BCS $26BA
    CPY #$00
    BNE $26BE
    CPX #$00
    BEQ $26C2
    BRK
    ORA ($8D,X)
    ORA
    AND ($8E,X)
    BPL $26EE
    LDA $210F
    LDX $2110
    CPX $211C
    BNE $26DB
    CMP $211B
    BEQ $2703
    PHA
    TXA
    PHA
    JSR $26D7
    PLA
    TAX
    PLA
    STA $211B
    STX $211C
    LDY #$B1
    BIT $B0A0
    JSR $26ED
    LDA $211B
    LDX $211C
    STA $DF05
    STX $DF06
    STY $DF01
    CLC
    RTS
    LDX #$0A
    LDA $26F9,X
    STA $DF02,X
    DEX
    BPL $2707
    RTS
    BRK
    JSR $0000
    BRK
    BRK
    ORA ($00,X)
    BRK
    BRK
    BRK
    JSR $2638
    CMP #$0F
    BNE $2726
    JMP $24B0
    CPX #$00
    BNE $2733
    LDA #$46
    STA $90
    LDA #$46
    JMP $3996
    CPX #$24
    BNE $2752
    JMP $3458
    TAY
    BEQ $2751
    CLC
    ADC $210E
    STA $210E
    BCC $274E
    INC $210F
    BNE $274E
    INC $2110
    JSR $26D4
    RTS
    LDA $210B
    CMP #$52
    BEQ $2769
    CMP #$46
    BEQ $2769
    CMP #$4C
    BNE $2764
    JMP $2A0E
    LDA #$3C
    JMP $3996
    SEC
    LDA $2111
    SBC $210E
    TAY
    LDA $2112
    SBC $210F
    TAX
    LDA $2113
    SBC $2110
    BCS $2783
    JMP $398D
    BNE $2788
    TXA
    BEQ $278A
    LDY #$FF
    TYA
    PHA
    JSR $26D7
    PLA
    TAY
    BNE $2798
    LDA #$40
    STA $90
    INY
    LDA #$22
    LDX #$27
    SEC
    JMP $3ADE
    JSR $2638
    CMP #$0F
    BNE $27AA
    JMP $3184
    CPX #$57
    BEQ $27F2
    CPX #$46
    BEQ $27F2
    CPX #$4C
    BNE $27B9
    JMP $2A43
    LDA #$46
    JMP $3996
    TAY
    BEQ $27EF
    DEY
    TYA
    CLC
    ADC $210E
    STA $210E
    LDX $2110
    CPX $2113
    BNE $27D8
    LDX $210F
    CPX $2112
    BNE $27E2
    CMP $2111
    BCC $27E2
    STA $2111
    INC $210E
    BNE $27EF
    INC $210F
    BNE $27EF
    INC $2110
    JMP $26D4
    JSR $27FB
    BCS $2802
    LDA #$00
    SEC
    SBC $210E
    CMP #$00
    BNE $2805
    CLC
    JMP $39A7
    PHA
    JSR $26D7
    PLA
    TAY
    LDA #$A6
    LDX #$27
    CLC
    JMP $3ADE
    LDA $2113
    CMP $2110
    BNE $2829
    LDA $2112
    CMP $210F
    BNE $2829
    LDA $2111
    CMP $210E
    BCS $2887
    LDA $2111
    CMP #$FF
    BNE $2870
    LDA $210F
    LDX $2110
    PHA
    TXA
    PHA
    LDA $2112
    LDX $2113
    CLC
    ADC #$01
    BCC $2847
    INX
    JSR $2B1A
    TAY
    PLA
    TAX
    PLA
    STA $210F
    STX $2110
    TYA
    BCS $28A1
    INC $2112
    BNE $285F
    INC $2113
    LDA $210C
    LDX $210D
    JSR $26BB
    INC $2000
    BNE $2870
    INC $2001
    INC $2111
    LDA $2112
    LDX $2113
    JSR $26BB
    LDA #$FF
    LDY $2111
    STA $2000,Y
    JMP $27FB
    JSR $26B5
    LDY $210E
    LDA $2120
    STA $2000,Y
    INC $210E
    BNE $28A0
    INC $210F
    BNE $28A0
    INC $2110
    CLC
    RTS
    CLC
    LDA #$1A
    ADC $2114
    STA $210E
    LDA #$00
    LDX #$00
    ADC $210C
    PHA
    TXA
    ADC $210D
    TAX
    PLA
    STA $210F
    STX $2110
    LDY $210B
    CPY #$46
    BNE $28DC
    CLC
    ADC $2115
    PHA
    TXA
    ADC $2116
    TAX
    PLA
    BCS $28D9
    STA $210F
    STX $2110
    LDA #$34
    RTS
    LDA #$00
    STA $2172
    LDA $2115
    LDX $2116
    STA $2170
    STX $2171
    LDA $211A
    LSR
    PHA
    BCC $2910
    CLC
    LDA $2170
    ADC $210E
    STA $210E
    LDA $2171
    ADC $210F
    STA $210F
    LDA $2172
    ADC $2110
    STA $2110
    ASL $2170
    ROL $2171
    ROL $2172
    PLA
    BNE $28F0
    LDA #$32
    LDX $2116
    CPX $2119
    BNE $292C
    LDX $2115
    CPX $2118
    RTS
    LDA $2115
    LDX $2116
    PHA
    TXA
    PHA
    LDA $2114
    PHA
    LDA $2120
    PHA
    JSR $2940
    BCS $2944
    CLC
    TAY
    PLA
    STA $2120
    PLA
    STA $2114
    PLA
    TAX
    PLA
    STA $2115
    STX $2116
    TYA
    RTS
    LDA $2118
    LDX $2119
    CPX #$FF
    BNE $2964
    CMP #$FF
    BCS $298F
    STA $2115
    STX $2116
    LDA #$00
    STA $2114
    JSR $288A
    LDA #$FF
    STA $2120
    JSR $27FB
    BCS $298E
    INC $2114
    JSR $297B
    BCS $298E
    INC $2118
    BNE $298E
    INC $2119
    RTS
    LDA #$34
    SEC
    RTS
    LDA $2114
    CMP $211A
    BCS $29AA
    LDA #$00
    STA $2120
    JSR $27FB
    BCS $29AB
    INC $2114
    BNE $2993
    CLC
    RTS
    LDA $2114
    PHA
    LDA #$00
    STA $2114
    STA $2117
    JSR $288A
    BCS $29EE
    LDA $2114
    CMP $211A
    BCS $29E8
    JSR $26B5
    LDY $210E
    LDA $2000,Y
    BEQ $29D6
    LDA $2114
    STA $2117
    INC $210E
    BNE $29E3
    INC $210F
    BNE $29E3
    INC $2110
    INC $2114
    BNE $29BD
    PLA
    STA $2114
    CLC
    RTS
    TAY
    PLA
    TYA
    RTS
    JSR $288A
    BCS $2A01
    JSR $26B5
    LDX $210E
    LDA $2000,X
    CLC
    RTS
    JSR $2A04
    JSR $288A
    JSR $297B
    BCS $2A1A
    INC $2115
    BNE $2A15
    INC $2116
    LDA #$00
    STA $2114
    CLC
    RTS
    CLC
    ADC $2114
    STA $2114
    JMP $26D4
    LDA #$04
    LDX #$2A
    STA $2109
    STX $210A
    JSR $2994
    BCS $2A45
    JSR $288A
    SEC
    LDA $2117
    SBC $2114
    BEQ $2A48
    SEC
    JMP $2A7F
    JMP $3996
    JSR $29DA
    LDX #$00
    STX $2114
    INC $2115
    BNE $2A58
    INC $2116
    JMP $399E
    CLC
    JSR $2AA1
    BNE $2A81
    LDA #$EA
    LDX #$29
    STA $2109
    STX $210A
    LDX $2116
    CPX $2119
    BNE $2A79
    LDX $2115
    CPX $2118
    BCC $2A86
    JSR $2915
    BCC $2A6B
    BIT $33A9
    JMP $3996
    LDA $211A
    SEC
    SBC $2114
    BCC $2A81
    BEQ $2A81
    PHA
    JSR $2AA1
    PLA
    CLC
    PHP
    PHA
    JSR $288A
    JSR $26B5
    JSR $26D7
    LDA $210E
    STA $DF04
    LDA $210F
    LDX $2110
    STA $DF05
    STX $DF06
    PLA
    PLP
    JMP $3AF9
    LDA $2121
    STA $FF
    LDA #$01
    STA $FE
    LDY #$00
    LDA ($FE),Y
    BCC $2ACB
    ROL
    STA ($FE),Y
    RTS
    JSR $2D58
    BCS $2B2B
    TYA
    AND #$0F
    JSR $263F
    LDA $210B
    CMP #$46
    BEQ $2AE2
    CMP #$4C
    BNE $2B28
    JSR $2D58
    TYA
    BCS $2B2B
    STA $2115
    JSR $2D58
    TYA
    BCS $2B2B
    STA $2116
    LDA #$00
    STA $2114
    JSR $2D58
    TYA
    BCS $2B15
    LDY $210B
    CPY #$46
    BEQ $2B12
    CMP #$00
    BEQ $2B15
    TAY
    DEY
    TYA
    CMP $211A
    BCS $2B2E
    STA $2114
    LDA $2115
    BNE $2B22
    LDA $2116
    BEQ $2B25
    DEC $2116
    DEC $2115
    JMP $288A
    LDA #$46
    BIT $1EA9
    BIT $33A9
    SEC
    RTS
    STA $2173
    STX $2174
    LDA $2102
    LDX $2103
    CLC
    ADC #$01
    BNE $2B44
    INX
    CPX $2105
    BNE $2B4C
    CMP $2104
    BCC $2B51
    LDA #$48
    RTS
    LDA #$01
    LDX #$00
    JSR $2B74
    LDA $2173
    LDX $2174
    JSR $26BB
    INC $2173
    BNE $2B69
    INC $2174
    JSR $26ED
    LDA $2173
    LDX $2174
    STA $DF05
    STX $DF06
    CPX $2103
    BNE $2B80
    CMP $2102
    BCS $2B8A
    LDA #$B2
    STA $DF01
    JMP $2B49
    CLC
    RTS
    STA $2175
    STX $2176
    LDA $2108
    PHA
    LDX #$10
    TXA
    JSR $263F
    LDA $210B
    BEQ $2BCE
    LDA $2112
    LDX $2113
    JSR $2BD1
    STA $2112
    STX $2113
    LDA $210F
    LDX $2110
    JSR $2BD1
    STA $210F
    STX $2110
    LDA $210C
    LDX $210D
    JSR $2BD1
    STA $210C
    STX $210D
    LDX $2108
    DEX
    BPL $2B98
    PLA
    JSR $263F
    LDA $2102
    LDX $2103
    JSR $2BD1
    STA $2102
    STX $2103
    CLC
    RTS
    CPX $2174
    BNE $2BF1
    CMP $2173
    BCC $2BFE
    CLC
    ADC $2175
    PHA
    TXA
    ADC $2176
    TAX
    PLA
    RTS
    LDA $211B
    LDX $211C
    STA $2173
    STX $2174
    LDA $2000
    LDX $2001
    PHA
    TXA
    PHA
    LDA $2000
    LDX $2001
    EOR #$FF
    TAY
    TXA
    EOR #$FF
    TAX
    TYA
    JSR $2B74
    PLA
    TAX
    PLA
    STA $2175
    STX $2176
    LDA $2173
    LDX $2174
    SEC
    ADC $2175
    PHA
    TXA
    ADC $2176
    TAX
    PLA
    JSR $26BB
    LDA $2173
    LDX $2174
    STA $211B
    STX $211C
    INC $2173
    BNE $2C56
    INC $2174
    LDA $2103
    CMP $2174
    BNE $2C64
    LDA $2102
    CMP $2173
    BCS $2C2E
    RTS
    CMP #$40
    BCC $2C77
    CMP #$80
    BCC $2C73
    CMP #$C0
    BCC $2C77
    AND #$1F
    ORA #$40
    CLC
    RTS
    ORA ($02,X)
    TSB $08
    BPL $2C9F
    RTI
    BRA $2CA2
    AND $AD26,X
    BRK
    AND ($AE,X)
    ORA ($21,X)
    STA $210F
    STX $2110
    CPX $2103
    BNE $2C98
    CMP $2102
    BCC $2CA3
    BEQ $2C9F
    LDA #$0D
    BIT $3EA9
    SEC
    RTS
    JSR $26B5
    BCS $2CA1
    JSR $2CF6
    BCS $2CB4
    LDA $210F
    LDX $2110
    RTS
    LDA $2000
    LDX $2001
    SEC
    ADC $210F
    PHA
    TXA
    ADC $2110
    TAX
    PLA
    JMP $2C72
    JSR $263D
    LDA $2100
    LDX $2101
    STA $210F
    STX $2110
    CPX $2103
    BNE $2CDF
    CMP $2102
    BCC $2CEA
    BEQ $2CE6
    LDA #$0D
    BIT $3EA9
    SEC
    RTS
    JSR $26B5
    LDA $2002
    BEQ $2CFA
    LDA $210F
    LDX $2110
    CLC
    RTS
    LDA $2000
    LDX $2001
    SEC
    ADC $210F
    PHA
    TXA
    ADC $2110
    TAX
    PLA
    JMP $2CB9
    LDX #$FF
    INX
    LDA $2008,X
    BNE $2D21
    LDA $2177,X
    BEQ $2D1F
    CMP #$2A
    BNE $2D33
    CLC
    RTS
    LDA $2177,X
    BEQ $2D33
    CMP $2008,X
    BEQ $2D10
    CMP #$3F
    BEQ $2D10
    CMP #$2A
    BEQ $2D1F
    SEC
    RTS
    LDA #$00
    STA $2189
    STA $218A
    STA $218B
    STA $218C
    STA $218D
    JSR $3A05
    LDY $B7
    LDA $2191,Y
    LDX #$00
    BEQ $2D5A
    LDX #$01
    LDY $2292
    LDA $2292,Y
    CMP #$0D
    BNE $2D5F
    DEY
    STX $2191
    STY $2190
    LDA #$00
    STA $218F
    CLC
    RTS
    DEC $218F
    RTS
    LDY $218F
    CPY $2190
    BCS $2D8D
    LDA $2191
    BNE $2D83
    LDA $2192,Y
    JMP $2D6E
    LDA $2293,Y
    INC $218F
    JSR $2D76
    CLC
    RTS
    LDX #$07
    CMP $2D95,X
    BEQ $2D9C
    DEX
    BNE $2D90
    TAY
    LDA #$00
    RTS
    TAY
    LDA $2C61,X
    CMP #$04
    BEQ $2DA8
    CMP #$02
    BNE $2DAB
    STY $218B
    CLC
    RTS
    JSR $2A3F
    JSR
    RTI
    AND $2C24,X
    LDX #$FF
    INX
    LDA #$00
    STA $2177,X
    JSR $2D58
    BCS $2DDF
    AND #$A0
    BNE $2DDC
    LDX #$FF
    INX
    CPX #$10
    BEQ $2DDC
    LDA $2177,X
    BNE $2DCB
    TYA
    STA $2177,X
    JMP $2D9F
    JSR $2D54
    CLC
    RTS
    JSR $2DCC
    JSR $2DCC
    JSR $2D58
    BCS $2E1F
    CPY #$2C
    BNE $2E1C
    JSR $2D58
    BCS $2E1C
    TYA
    JSR $2C4F
    CMP #$50
    BEQ $2E43
    CMP #$53
    BEQ $2E43
    CMP #$55
    BEQ $2E43
    CMP #$52
    BEQ $2E4C
    CMP #$57
    BEQ $2E4C
    CMP #$41
    BEQ $2E4C
    CMP #$46
    BEQ $2E4C
    CMP #$4C
    BEQ $2E21
    JSR $2D54
    JSR $2D54
    CLC
    RTS
    JSR $2E28
    BCS $2E3F
    JSR $2D58
    BCS $2E3D
    CPY #$2C
    BNE $2E3A
    JSR $2D58
    BCS $2E3F
    STY $218D
    JMP $2E37
    JSR $2D54
    CLC
    RTS
    LDA #$1E
    SEC
    RTS
    LDY $218A
    STA $218A
    JMP $2E37
    LDY $2189
    STA $2189
    TYA
    PHA
    JSR $2D58
    BCS $2E60
    AND #$A0
    BEQ $2E54
    JSR $2D54
    CLC
    PLA
    BEQ $2E67
    LDA #$1E
    SEC
    RTS
    JSR $2D58
    BCS $2E81
    CPY #$3A
    BEQ $2E81
    CPY #$30
    BNE $2E7E
    JSR $2D58
    BCS $2E81
    CPY #$3A
    BEQ $2E81
    JSR $2D54
    CLC
    RTS
    JSR $2D1D
    JSR $2D58
    BCS $2EC2
    CPY #$40
    BNE $2EA1
    STY $218C
    JSR $2D58
    BCS $2EAE
    CPY #$40
    BEQ $2E8F
    JSR $2D54
    JMP $2E93
    CPY #$24
    BNE $2EAB
    STY $2189
    JMP $2E93
    JSR $2D54
    JSR $2E4D
    JSR $2D9D
    JSR $2DC6
    BCS $2EC0
    JSR $2D58
    BCS $2EC2
    LDA #$1E
    SEC
    RTS
    CLC
    RTS
    JSR $2638
    CMP #$0F
    BNE $2ECE
    JMP $3143
    CPX #$00
    BEQ $2ED5
    JSR $30EA
    JSR $255F
    JSR $2E68
    BCS $2F2F
    LDA $2189
    CMP #$24
    BNE $2EE7
    JMP $342D
    LDA #$22
    LDX $2177
    BEQ $2F2F
    LDA #$00
    STA $218E
    LDA $2189
    BNE $2EFD
    LDA #$52
    STA $2189
    JSR $2C69
    BCS $2F34
    PHA
    TXA
    PHA
    JSR $2638
    PLA
    TAX
    PLA
    STA $210F
    STX $2110
    JSR $26B5
    BCS $2F2F
    LDA #$3C
    LDX $2002
    BNE $2F2F
    LDX $2003
    LDA $218A
    STX $218A
    BEQ $2F31
    CMP $2003
    BEQ $2F31
    LDA #$40
    SEC
    RTS
    INC $218E
    LDA $218A
    BNE $2F3E
    LDA #$53
    STA $218A
    CMP #$4C
    BNE $2F45
    JMP $3091
    LDA $2189
    CMP #$52
    BEQ $2F5A
    CMP #$41
    BEQ $2FCD
    CMP #$46
    BNE $2F57
    JMP $2FEB
    JMP $3010
    LDA #$1E
    LDX $218C
    BNE $2FCB
    LDA #$3E
    LDX $218E
    BEQ $2FCB
    JSR $26B5
    BCS $2FCB
    JSR $2638
    LDA $211B
    LDX $211C
    STA $210C
    STX $210D
    STA $210F
    STX $2110
    CLC
    ADC $2000
    PHA
    TXA
    ADC $2001
    TAX
    PLA
    STA $2112
    STX $2113
    LDA #$1A
    STA $210E
    LDA $2004
    STA $2111
    LDA $2007
    STA $211A
    LDA $2005
    LDX $2006
    STA $2118
    STX $2119
    LDA #$00
    LDX #$00
    STA $2115
    STX $2116
    STA $2117
    STA $2114
    LDA $2189
    STA $210B
    STA $2002
    CLC
    RTS
    SEC
    RTS
    LDA #$57
    STA $2189
    LDX $218E
    BEQ $302B
    LDA #$21
    LDX $218B
    BNE $3004
    JSR $2F3F
    BCS $3004
    LDA $2111
    STA $210E
    LDA $2112
    LDX $2113
    STA $210F
    STX $2110
    INC $210E
    BNE $3002
    INC $210F
    BNE $3002
    INC $2110
    CLC
    RTS
    SEC
    RTS
    LDA #$21
    LDX $218B
    BNE $3029
    LDA #$1E
    LDX $218A
    CPX #$53
    BEQ $301C
    CPX #$50
    BEQ $301C
    SEC
    RTS
    LDA $218E
    BEQ $302B
    LDA $218C
    BNE $302B
    JMP $2F3F
    SEC
    RTS
    LDA #$21
    LDX $218B
    BEQ $3035
    JMP $308F
    LDX $218E
    BEQ $3047
    LDA #$3F
    LDX $218C
    BEQ $30AA
    JSR $26B5
    JSR $2BE7
    JSR $2638
    JSR $262D
    LDA $2102
    LDX $2103
    STA $210F
    STX $2110
    STA $210C
    STX $210D
    STA $2112
    STX $2113
    JSR $2B1A
    BCS $30AA
    JSR $2638
    JSR $26B5
    LDY #$11
    LDA $2177,Y
    STA $2008,Y
    DEY
    BPL $3072
    LDA $218A
    STA $2003
    LDA $218D
    STA $2007
    STA $211A
    LDA #$00
    LDX #$00
    STA $2000
    STX $2001
    LDA #$1A
    STA $2004
    STA $2111
    STA $210E
    LDA $2189
    STA $2002
    STA $210B
    CLC
    RTS
    SEC
    RTS
    LDA #$4C
    STA $2189
    STA $218A
    LDX $218E
    BEQ $30D4
    JSR $26B5
    LDA $2007
    LDX $218D
    STA $218D
    BEQ $30CC
    CPX $218D
    BNE $30E8
    LDX $218C
    BNE $30D4
    JMP $2F3F
    LDA $218D
    BEQ $30E8
    LDX $218E
    BNE $30E5
    LDA #$21
    LDX $218B
    BNE $30EA
    JMP $3010
    LDA #$32
    SEC
    RTS
    LDX #$10
    TXA
    PHA
    JSR $263F
    JSR $30ED
    PLA
    TAX
    DEX
    BPL $30EE
    CLC
    RTS
    LDA $B9
    AND #$0F
    CMP #$0F
    BEQ $30EC
    JSR $2638
    LDA $2108
    LDX $210B
    BEQ $315C
    CMP #$0F
    BEQ $3157
    CPX #$24
    BEQ $3157
    LDA $210C
    LDX $210D
    STA $210F
    STX $2110
    JSR $26B5
    BCS $315D
    LDA $2111
    STA $2004
    LDA $2112
    LDX $2113
    SEC
    SBC $210C
    PHA
    TXA
    SBC $210D
    TAX
    PLA
    STA $2000
    STX $2001
    LDA $2118
    LDX $2119
    STA $2005
    STX $2006
    LDA #$00
    STA $2002
    LDA #$00
    STA $210B
    CLC
    RTS
    LDA #$0F
    JSR $2638
    LDA #$57
    STA $210B
    JSR $2D2E
    LDY $B7
    CLC
    BEQ $3176
    CPY #$28
    BCC $3177
    LDA #$20
    RTS
    STY $2292
    DEY
    LDA $2192,Y
    STA $2293,Y
    DEY
    BPL $317B
    JSR $31FB
    LDX #$00
    STX $2292
    RTS
    CLC
    ADC $2292
    STA $2292
    BEQ $319E
    JSR $3169
    BCC $319E
    JSR $2567
    RTS
    LDY $2120
    LDA #$28
    SEC
    SBC $2292
    BCS $31B8
    CPY #$0D
    BNE $31B3
    LDA #$00
    STA $2292
    LDA #$20
    JMP $3996
    CPY #$0D
    BNE $31C7
    JSR $31FB
    LDX #$00
    STX $2292
    JMP $39A7
    TAY
    LDA #$72
    LDX #$31
    STA $2109
    STX $210A
    LDA #$93
    LDX #$02
    CLC
    ADC $2292
    BCC $31DD
    INX
    STA $DF04
    STX $DF05
    LDA #$00
    STA $DF06
    TYA
    CLC
    JMP $3AF9
    EOR
    AND $3252,X
    CMP $3243,X
    SBC ($4E),Y
    AND
    EOR $B533
    EOR #$33
    ADC
    AND
    LSR $32,X
    LDA $2A50,Y
    LDA
    JSR $31F4
    JSR $31F4
    INC $FE
    BNE $3215
    INC $FF
    RTS
    JSR $255F
    JSR $2D1D
    JSR $2D3A
    LDA #$D2
    LDX #$31
    STA $FE
    STX $FF
    LDA $2292
    BEQ $324C
    JSR $2D58
    TYA
    TAX
    LDY #$FD
    INY
    INY
    INY
    LDA ($FE),Y
    BNE $323E
    LDA #$1F
    SEC
    RTS
    TXA
    CMP ($FE),Y
    BNE $3233
    INY
    LDA ($FE),Y
    PHA
    INY
    LDA ($FE),Y
    PHA
    NOP
    CLC
    RTS
    JSR $2D58
    BCS $3257
    CPY #$3A
    BNE $324E
    CLC
    RTS
    JSR $3233
    JSR $2D9D
    BCS $328C
    LDA #$00
    LDX #$00
    STA $22BC
    STX $22BD
    JSR $2C69
    BCC $3276
    CMP #$3E
    BEQ $328E
    SEC
    RTS
    LDA $210F
    LDX $2110
    JSR $327C
    INC $22BC
    BNE $3287
    INC $22BD
    JSR $2BE7
    BCC $326B
    SEC
    RTS
    LDA $22BC
    LDX $22BD
    JMP $24F0
    STA $22BE
    STX $22BF
    LDA $2108
    STA $22C0
    LDA #$10
    JSR $263F
    BEQ $32C7
    LDA $22BE
    LDX $22BF
    CPX $210D
    BNE $32B8
    CMP $210C
    BNE $32C7
    LDA $2108
    CMP $22C0
    BEQ $32C7
    LDA #$00
    STA $210B
    LDA $2108
    CLC
    ADC #$FF
    BCS $32A5
    LDA $22C0
    JMP $263F
    JSR $30D1
    JSR $255F
    JSR $2CB0
    BCS $32E5
    JSR $2BE7
    BCC $32DB
    CMP #$3E
    BNE $32EA
    CLC
    RTS
    LDA $2100
    LDX $2101
    STA $2102
    STX $2103
    CLC
    RTS
    JSR $33E7
    BCS $330B
    LDX #$FF
    INX
    LDA $2123,X
    STA $2008,X
    BNE $3300
    CLC
    RTS
    SEC
    RTS
    JSR $33E7
    BCS $338B
    LDA $2000
    LDX $2001
    SEC
    ADC $2102
    PHA
    TXA
    ADC $2103
    TAX
    PLA
    CPX $2105
    BNE $332B
    CMP $2104
    BEQ $332F
    BCS $3389
    STA $22C1
    STX $22C2
    LDA $2102
    LDX $2103
    PHA
    TXA
    PHA
    LDA $2102
    LDX $2103
    STA $211B
    STX $211C
    INC $210F
    BNE $3352
    INC $2110
    INC $2102
    BNE $335A
    INC $2103
    JSR $26B5
    LDA $2103
    CMP $22C2
    BNE $336B
    LDA $2102
    CMP $22C1
    BNE $333E
    PLA
    TAX
    PLA
    STA $210F
    STX $2110
    JSR $26BB
    LDX #$FF
    INX
    LDA $2123,X
    STA $2008,X
    BNE $337B
    STA $2002
    CLC
    RTS
    LDA #$48
    SEC
    RTS
    JSR $30D1
    JMP $255C
    JSR $30D1
    JMP $255F
    JSR $2D58
    BCS $33B9
    CPY #$3A
    BEQ $338D
    CPY #$4A
    BEQ $338D
    CPY #$49
    BEQ $338D
    CPY #$30
    BNE $33B9
    JSR $2D58
    BCS $33B9
    CPY #$3E
    BNE $33B9
    CLC
    BIT $38
    BCS $33CD
    JSR $2D58
    BCS $33CD
    TYA
    AND #$9F
    BMI $33CD
    CMP #$04
    BCC $33CD
    JMP $3E0C
    LDA #$1F
    SEC
    RTS
    JSR $2D58
    JSR $2D58
    BCS $33FE
    CPY #$57
    BNE $33FE
    JSR $2D58
    BCS $33FE
    CPY #$77
    BEQ $33EA
    CPY #$78
    BNE $33FE
    JSR $2D58
    BCS $33FE
    CPY #$00
    BNE $33FE
    JSR $2D58
    BCS $33FE
    CPY #$00
    BEQ $33FE
    CLC
    BIT $38
    JMP $339F
    JSR $3233
    JSR $2D9D
    BCS $3446
    LDA $218B
    BNE $3444
    JSR $2C69
    LDA #$3F
    BCC $3446
    LDX #$FF
    INX
    LDA $2177,X
    STA $2123,X
    BNE $3418
    JSR $2D58
    BCS $3446
    CPY #$3D
    BNE $3444
    JSR $2E4D
    JSR $2D9D
    BCS $3446
    LDA #$22
    LDX $2177
    BEQ $3446
    JSR $2C69
    BCS $3441
    JMP $26AF
    LDA #$3E
    BIT $1EA9
    SEC
    RTS
    LDA #$24
    STA $210B
    JSR $263D
    LDA #$00
    STA $210E
    STA $210F
    STA $2110
    LDA $2177
    BNE $3468
    STA $2178
    LDA #$2A
    STA $2177
    JMP $34FB
    CLC
    ADC $210E
    STA $210E
    RTS
    JSR $263D
    LDY $210E
    CPY $2111
    BCC $3487
    JSR $349D
    BCC $3487
    CLC
    JMP $398D
    LDA #$50
    LDX #$34
    STA $2109
    STX $210A
    LDA #$C3
    LDX #$02
    CLC
    ADC $210E
    BCC $349C
    INX
    STA $DF04
    STX $DF05
    LDA #$00
    STA $DF06
    LDA $2111
    SEC
    SBC $210E
    LDX $22F5
    LDY $22F6
    SEC
    JMP $3AF9
    LDA $210F
    ORA $2110
    BNE $34C9
    LDA $2100
    LDX $2101
    JMP $34D3
    LDA $210F
    LDX $2110
    CPX $2103
    BNE $34D7
    CMP $2102
    BCC $34DA
    RTS
    JSR $26B5
    LDA $210F
    LDX $2110
    SEC
    ADC $2000
    PHA
    TXA
    ADC $2001
    TAX
    PLA
    STA $210F
    STX $2110
    CPX $2103
    BNE $34FC
    CMP $2102
    BCC $3504
    JSR $354A
    JMP $34F4
    JSR $26B5
    JSR $2CF6
    BCS $34B8
    JSR $3572
    LDA #$00
    STA $210E
    CLC
    RTS
    LDX #$20
    STX $2111
    DEX
    LDA $350C,X
    STA $22C3,X
    DEX
    BPL $351C
    CLC
    RTS
    ORA ($10,X)
    ORA ($10,X)
    BRK
    BRK
    ORA
    EOR
    EOR $4944
    EOR
    JSR $3456
    ROL $2034
    JSR $2020
    JSR
    JSR $4448
    JSR $3030
    BRK
    ORA ($10,X)
    BRK
    BRK
    WDM
    EOR
    EOR
    EOR
    LSR $52
    EOR $45
    JSR $2020
    JSR $2020
    JSR $2020
    JSR $2020
    JSR $0000
    LDX #$1E
    STX $2111
    DEX
    LDA $352C,X
    STA $22C3,X
    DEX
    BPL $3571
    LDA $2104
    LDX $2105
    SEC
    SBC $2102
    PHA
    TXA
    SBC $2103
    TAX
    PLA
    STA $22C5
    STX $22C6
    CLC
    RTS
    LDX #$20
    STX $2111
    LDA #$20
    STA $22C3,X
    DEX
    CPX #$03
    BNE $359A
    LDA #$22
    STA $22C7
    LDX #$00
    LDA $2008,X
    STA $22C8,X
    BEQ $35B6
    INX
    CPX #$11
    BNE $35A9
    LDA #$22
    STA $22C8,X
    LDY #$53
    LDA #$45
    LDX #$51
    CPY $2003
    BEQ $35EB
    LDY #$50
    LDA #$52
    LDX #$47
    CPY $2003
    BEQ $35EB
    LDY #$55
    LDA #$53
    LDX #$52
    CPY $2003
    BEQ $35EB
    LDY #$52
    LDA #$45
    LDX #$4C
    CPX $2003
    BEQ $35EB
    LDA #$3F
    TAX
    TAY
    STY $22DA
    STA $22DB
    STX $22DC
    LDA $2002
    CMP #$57
    BNE $3600
    LDA #$2A
    STA $22D9
    LDA $2000
    LDX $2001
    CLC
    ADC #$01
    PHA
    TXA
    ADC #$00
    TAX
    PLA
    STA $22C5
    STX $22C6
    CPX #$03
    BNE $361B
    CMP #$E8
    BCS $3636
    CPX #$00
    BNE $3623
    CMP #$64
    BCS $3633
    CPX #$00
    BNE $362B
    CMP #$0A
    BCS $3630
    JSR $361C
    JSR $361C
    JSR $361C
    LDA #$00
    STA $22E2
    CLC
    RTS
    LDX #$04
    LDA #$20
    LDY $22C3,X
    STA $22C3,X
    TYA
    INX
    CPX #$20
    BNE $3641
    RTS
    STA $93
    LDA $B7
    BNE $3658
    LDA #$08
    BNE $368C
    JSR $3676
    BCC $367E
    CMP #$00
    BNE $3671
    LDA $93
    BNE $3669
    LDA #$10
    BNE $368C
    LDA #$10
    ORA $90
    STA $90
    BNE $367E
    JSR $2567
    LDA #$02
    ORA $90
    STA $90
    LDA #$04
    BNE $368C
    LDA #$40
    ORA $90
    STA $90
    LDX $AE
    LDY $AF
    CLC
    JMP $39C1
    TAY
    LDA #$F6
    PHA
    LDA #$98
    PHA
    TYA
    JMP $39C1
    LDA #$00
    STA $90
    JSR $3A83
    JSR $2E68
    BCS $36E7
    JSR $2D58
    BCC $36E5
    LDA $218C
    BNE $36E5
    LDA $2189
    CMP #$24
    BNE $36B7
    JMP $377A
    ORA $218A
    BNE $36E5
    LDA #$22
    LDX $2177
    BEQ $36E7
    JSR $2C69
    BCS $36E7
    STA $210F
    STX $2110
    JSR $26B5
    LDA #$40
    LDX $2003
    CPX #$50
    BNE $36E7
    LDX $2002
    BEQ $36E9
    LDA #$3C
    BIT $3EA9
    BIT $1EA9
    SEC
    RTS
    JSR $F533
    JSR $26D7
    LDA $C3
    LDX $C4
    LDY $B9
    BEQ $36FD
    LDA $201A
    LDX $201B
    STA $DF02
    STX $DF03
    LDY #$1C
    STY $DF04
    LDA $210F
    LDX $2110
    STA $DF05
    STX $DF06
    SEC
    LDA $2004
    SBC #$1B
    TAY
    LDA $2000
    LDX $2001
    SBC #$00
    BCS $372F
    DEX
    JMP $370E
    LDX #$00
    TXA
    LDY $2111
    STY $DF07
    STA $DF08
    CPX #$00
    PHP
    LDA #$FF
    LDX #$EF
    SEC
    SBC $DF02
    PHA
    TXA
    SBC $DF03
    TAX
    PLA
    PLP
    BNE $3754
    CPX $DF08
    BNE $3752
    CMP $DF07
    BCS $3760
    STA $DF07
    STX $DF08
    JSR $373F
    JMP $3774
    LDA $DF02
    LDX $DF03
    CLC
    ADC $DF07
    PHA
    TXA
    ADC $DF08
    TAX
    PLA
    STA $AE
    STX $AF
    LDA $DF07
    ORA $DF08
    BEQ $3799
    LDY #$A1
    LDA $93
    BEQ $3785
    LDY #$A3
    JSR $3A30
    LDA $93
    BEQ $3799
    LDA $DF00
    AND #$20
    STA $93
    BEQ $3799
    LDA #$00
    SEC
    RTS
    CLC
    RTS
    JSR $F533
    JSR $342D
    LDA $C3
    LDX $C4
    LDY $B9
    BEQ $37AD
    LDA #$10
    LDX #$10
    STA $AE
    STX $AF
    DEC $2111
    DEC $2111
    LDX #$FF
    INX
    LDA $22C5,X
    STA $22C3,X
    CPX $2111
    BCC $37B9
    JSR $37BD
    BCS $37DB
    JSR $349D
    BCC $37C5
    LDX #$00
    STX $22C3
    INX
    STX $2111
    JSR $37BD
    LDA #$00
    RTS
    LDA #$C3
    LDX #$02
    STA $DF04
    STX $DF05
    LDA #$00
    STA $DF06
    LDA $AE
    LDX $AF
    STA $DF02
    STX $DF03
    JMP $3708
    LDA #$00
    STA $90
    JSR $3A7C
    JSR $2E68
    BCS $3848
    LDA $218A
    ORA $2189
    ORA $218B
    BNE $3846
    LDA #$22
    LDX $2177
    BEQ $3848
    JSR $2C69
    BCS $3840
    STA $210F
    STX $2110
    JSR $26B5
    LDA #$3F
    LDX $218C
    BEQ $3848
    LDA #$40
    LDX $2003
    CPX #$50
    BNE $3848
    LDA #$3C
    LDX $2002
    BNE $3848
    JSR $2BE7
    JMP $3829
    LDA #$3E
    BIT $1EA9
    SEC
    RTS
    LDA $2102
    LDX $2103
    CPX $2105
    BNE $3858
    CMP $2104
    BCC $385E
    LDA #$48
    SEC
    RTS
    JSR $26AF
    LDA $C1
    LDX $C2
    STA $201A
    STX $201B
    LDA $AE
    LDX $AF
    SEC
    SBC $C1
    PHA
    TXA
    SBC $C2
    TAX
    PLA
    TAY
    PHA
    TXA
    PHA
    TYA
    CLC
    ADC #$FF
    PHA
    TXA
    ADC #$FF
    TAX
    PLA
    CLC
    ADC #$1C
    STA $2004
    TXA
    ADC #$00
    STA $2000
    LDA #$00
    STA $2001
    ASL $2001
    STA $2002
    LDA #$50
    STA $2003
    LDX #$FF
    INX
    LDA $2177,X
    STA $2008,X
    BNE $38A4
    JSR $26D7
    PLA
    TAX
    PLA
    STA $DF07
    STX $DF08
    LDA $C1
    LDX $C2
    STA $DF02
    STX $DF03
    LDA $210F
    LDX $2110
    STA $DF05
    STX $DF06
    LDA #$1C
    STA $DF04
    LDA $2000
    LDX $2001
    SEC
    ADC $2102
    PHA
    TXA
    ADC $2103
    TAX
    PLA
    CPX $2105
    BNE $38ED
    CMP $2104
    BCC $38F2
    LDA #$48
    RTS
    STA $2102
    STX $2103
    LDY #$A0
    JSR $3A30
    JSR $26D4
    CLC
    RTS
    JSR $3A96
    STX $22F5
    STY $22F6
    STA $2120
    BCC $391A
    LDA $90
    BNE $3917
    JMP $2704
    JMP $3999
    JMP $2788
    JSR $3A96
    JMP $39C1
    BCC $391D
    JSR $3A96
    TXA
    JSR $F1E5
    PLA
    ROR
    NOP
    JSR $3B90
    CLC
    JMP $39A7
    JSR $3A96
    STA $2120
    BCS $3941
    JMP $39F1
    LDA $BA
    CMP $2122
    BEQ $3956
    LDA $3D28
    PHA
    LDA $3D27
    PHA
    LDA $2120
    JMP $39C1
    LDA $BA
    PHA
    LDA #$00
    STA $BA
    JSR $EFBD
    TAY
    PLA
    STA $BA
    TYA
    BCS $39E2
    LDA $BA
    STA $036C,X
    JSR $2EA9
    JMP $39A7
    PHP
    PHA
    JSR $3A96
    LDA $BA
    CMP $2122
    BEQ $39A1
    PLA
    STA $2120
    PLP
    BCC $3993
    LDA $3D2E
    PHA
    LDA $3D2D
    PHA
    LDA $2120
    JMP $39C1
    LDA $3D2C
    PHA
    LDA $3D2B
    PHA
    LDA $2120
    JMP $39C1
    PLA
    PLP
    BCS $39A8
    JMP $362D
    JSR $37D9
    JMP $39A7
    LDA #$42
    STA $90
    LDA #$00
    JMP $39BA
    SEC
    BCS $39C8
    LDA #$0D
    BIT $00A9
    STA $2120
    LDA #$FF
    STA $211F
    CLC
    BCC $39D5
    ROL $211F
    JSR $2567
    LDA #$0D
    STA $2120
    JSR $39E0
    LDA $2120
    LDX $22F5
    LDY $22F6
    CLC
    STA $2120
    LDA $2121
    PHA
    LDA #$E3
    PHA
    LDA $2121
    PHA
    LDA #$AA
    PHA
    LDA $211D
    STA $FE
    LDA $211E
    STA $FF
    LDA $2120
    RTS
    LDA $211F
    BEQ $3A0A
    LDA #$40
    ORA $90
    STA $90
    LDA #$00
    STA $211F
    RTS
    JSR $FF8A
    JSR $3D31
    LDA #$FA
    PHA
    LDA #$55
    PHA
    LDA $2121
    PHA
    LDA #$AA
    PHA
    RTS
    LDA $BB
    LDX $BC
    STA $DF02
    STX $DF03
    LDA $B7
    BNE $3A35
    RTS
    STA $DF07
    LDA #$00
    STA $DF08
    STA $DF06
    LDA #$92
    LDX #$01
    STA $DF04
    STX $DF05
    LDX $C7
    LDY #$A0
    JMP $3A32
    LDX $C6
    STY $22F7
    LDA $2121
    PHA
    LDA #$AA
    PHA
    LDA #$03
    PHA
    LDA #$E3
    PHA
    JSR $FF6B
    PHA
    AND #$C0
    ORA $D506
    TAX
    PLA
    JMP $3A50
    PHA
    TXA
    PHA
    LDA $22F7
    PHA
    LDX #$02
    LDA $DF00,X
    PHA
    INX
    CPX #$0B
    BNE $3A7A
    LDA $2121
    PHA
    LDA #$B6
    PHA
    LDA $2121
    PHA
    LDA #$AA
    PHA
    LDA $211D
    STA $FE
    LDA $211E
    STA $FF
    CLC
    RTS
    LDA #$BB
    LDX #$F5
    JMP $3A87
    LDA #$0E
    LDX #$F5
    TAY
    LDA $2121
    PHA
    LDA #$A7
    PHA
    TXA
    PHA
    TYA
    PHA
    JMP $39C1
    PHP
    PHA
    LDA $FE
    STA $211D
    LDA $FF
    STA $211E
    LDA $22F8
    BEQ $3AF9
    TXA
    PHA
    TYA
    PHA
    LDA $2121
    STA $FF
    LDA #$00
    STA $FE
    LDA #$2C
    LDY #$14
    STA ($FE),Y
    LDY #$26
    STA ($FE),Y
    LDA #$60
    LDY #$61
    STA ($FE),Y
    LDY #$00
    SEC
    LDA $22F8
    SBC ($FE),Y
    JSR $3ADB
    PLA
    TAY
    PLA
    TAX
    LDA #$00
    STA $22F8
    PLA
    PLP
    RTS
    JMP ($2109)
    STA $2109
    STX $210A
    LDA $210F
    LDX $2110
    STA $DF05
    STX $DF06
    LDA $210E
    STA $DF04
    TYA
    BCC $3B2D
    TAX
    LDA $2121
    PHA
    LDA #$EE
    PHA
    LDA $2121
    PHA
    LDA #$C6
    PHA
    TXA
    JMP $3B15
    TAX
    LDA $2121
    PHA
    LDA #$E3
    PHA
    TXA
    STA $22F8
    LDA #$00
    STA $FE
    LDA $2121
    STA $FF
    LDY #$DD
    BCS $3B60
    LDA #$90
    STA ($FE),Y
    LDY #$60
    LDA $210B
    EOR #$4C
    BNE $3B55
    LDY #$EA
    TYA
    LDY #$61
    STA ($FE),Y
    LDA #$2C
    LDX #$20
    BCC $3B68
    LDA #$91
    STA ($FE),Y
    LDA #$20
    LDX #$2C
    LDY #$14
    STA ($FE),Y
    LDY #$26
    TXA
    STA ($FE),Y
    LDY #$CF
    LDA $B9
    AND #$0F
    STA ($FE),Y
    LDY #$00
    LDA $22F8
    STA ($FE),Y
    LDA $2121
    STA $DF03
    LDA #$E2
    STA $DF02
    LDA #$00
    STA $DF09
    LDA #$80
    STA $DF0A
    LDA #$01
    LDX #$00
    STA $DF07
    STX $DF08
    LDX $22F5
    LDY $22F6
    LDA #$00
    STA $22F7
    LDA $2120
    JMP $3A50
    BRK
    BCS $3BB6
    JMP $30E2
    LDA $B9
    AND #$0F
    CMP #$0F
    BNE $3BB3
    RTS
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    LDA $99
    CMP #$09
    BEQ $3C2C
    JMP $FFFC
    LDA $99
    CMP #$09
    BEQ $3C35
    JMP $FFFC
    BIT $3CC4
    SEC
    BCS $3C4B
    PHA
    LDA $9A
    CMP #$09
    BEQ $3C46
    PLA
    JMP $FFFC
    PLA
    BIT $3CC4
    CLC
    JSR $3CA8
    JMP $38E1
    JSR $3C3C
    BCS $3C59
    JMP $FFFC
    STA $99
    CLC
    RTS
    LDA #$00
    STA $3C01
    JSR $F202
    TAX
    JSR $F207
    BNE $3C74
    JSR $F212
    CMP #$09
    BEQ $3C76
    LDA $B8
    TAX
    CLC
    RTS
    JSR $3C3C
    BCS $3C7F
    JMP $FFFC
    STA $9A
    CLC
    RTS
    JSR $3CA8
    JMP $3902
    PHP
    JSR $3C45
    BCS $3C83
    PLP
    JMP $FFFC
    SEC
    BIT $18
    JSR $3CA8
    JMP $3951
    CLD
    LDA #$7F
    STA $DD0D
    LDY $DD0D
    BMI $3CAF
    JSR $F63D
    JSR $FFE1
    BEQ $3CB2
    JMP $FA5F
    CLC
    BIT $38
    JSR $3CA8
    JMP $3915
    BRK
    BRK
    ORA
    SBC
    BRK
    BRK
    BRK
    JSR $B200
    EOR #$09
    BNE $3CEA
    JSR $3CF0
    PHA
    TXA
    PHA
    LDX #$09
    LDA $3C9A,X
    PHA
    DEX
    BPL $3CD7
    LDX #$09
    PLA
    STA $DF01,X
    DEX
    BPL $3CE0
    PLA
    TAX
    PLA
    RTS
    JSR $3CF0
    STA $3CE2
    LDA $B9
    AND #$0F
    CMP #$FF
    BNE $3D08
    LDA $3C00
    BEQ $3D08
    DEC $3C00
    PLA
    PLA
    LDA #$B1
    STA $DF01
    LDA #$00
    CLC
    INC $DC03
    PHA
    LDA #$00
    CLI
    STA $D030
    PLA
    RTS
    PHA
    SEI
    LDA $D030
    STA $3CE9
    DEC $DC03
    LDA #$00
    BEQ $3D12
    ROL
    BIT $26
    ASL $1A20,X
    TRB $3230
    CLC
    ORA #$12
    AND
    JMP
    BRK
    BVS $3D3B
    BRK
    BRK
    COP
    INC
    BMI $3D98
    STA
    STZ $72,X
    TDC
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    LDA #$FF
    STA $DC01
    LDA $2121
    STA $FF
    LDA #$00
    STA $FE
    LDX #$09
    LDY $3CFF,X
    LDA $0301,Y
    PHA
    LDA $0300,Y
    PHA
    TXA
    ASL
    TAY
    PLA
    CLC
    ADC #$FF
    STA $3D1D,Y
    PLA
    ADC #$FF
    STA $3D1E,Y
    LDY $3CFF,X
    LDA $0300,Y
    LDY $3D09,X
    BEQ $3D9F
    STA ($FE),Y
    LDY $3CFF,X
    LDA $0301,Y
    LDY $3D09,X
    INY
    STA ($FE),Y
    LDY $3CFF,X
    LDA $3D13,X
    STA $0300,Y
    LDA $FF
    STA $0301,Y
    DEX
    BPL $3D6B
    RTS
    ASL $28,X
    BIT $4032
    CLI
    STZ $6B
    ADC
    TAX
    LDA
    CMP #$D4
    CMP $05F7,Y
    ASL $4E1E
    LDA $A9
    ORA #$A2
    ASL $48D8
    TXA
    PHA
    JSR $3CF0
    LDX #$00
    LDA #$00
    STA $2000,X
    STA $2100,X
    STA $2200,X
    INX
    BNE $3DD6
    JSR $3E6F
    PLA
    TAX
    PLA
    PHA
    TXA
    STA $2121
    JSR $3E26
    PLA
    JSR $3E0C
    JSR $3D31
    JSR $255C
    JSR $261D
    LDA $2121
    PHA
    LDA #$E3
    PHA
    LDA $2121
    PHA
    LDA #$AA
    PHA
    RTS
    LDA #$09
    LDX #$0E
    CLD
    PHA
    TXA
    PHA
    JSR $3CF0
    LDX #$08
    LDA $3E03,X
    STA $DF02,X
    DEX
    BPL $3E19
    LDA #$B2
    STA $DF01
    PLA
    TAX
    PLA
    JMP $3DBE
    BRK
    JSR $0000
    BRK
    BRK
    ORA
    BRK
    AND #$1F
    STA $2122
    LDX $2121
    STX $FF
    LDX #$00
    STX $FE
    LDX #$04
    LDY $3D98,X
    STA ($FE),Y
    DEX
    BPL $3E46
    CLC
    RTS
    STA $FF
    LDY #$00
    STY $FE
    LDA $3C00,Y
    STA ($FE),Y
    INY
    BNE $3E56
    LDX #$10
    LDA $FF
    LDY $3D87,X
    STA ($FE),Y
    DEX
    BPL $3E62
    LDX #$1B
    LDA $3E53,X
    STA $03E4,X
    DEX
    BPL $3E6C
    LDX #$0E
    LDA $FF
    STA $03E4,X
    RTS
    LDY $D506
    STX $D506
    LDX $FF00
    SEC
    BCS $3E8F
    JSR $00A8
    JMP $38FC
    STA $FF00
    STX $FF00
    STY $D506
    RTS
    LDA #$00
    LDX #$00
    STA $211B
    STX $211C
    LDX #$00
    TXA
    EOR #$5A
    STA $2000,X
    DEX
    BNE $3EA5
    JSR $26D7
    INC $211C
    BNE $3EAE
    LDX #$00
    TXA
    EOR #$2C
    STA $2000,X
    DEX
    BNE $3EB8
    JSR $26D7
    INC $211C
    BMI $3EDC
    JSR $26D4
    LDX #$00
    TXA
    EOR #$5A
    CMP $2000,X
    BNE $3EDC
    DEX
    BNE $3ECE
    JMP $3E8C
    LDA $211B
    LDX $211C
    STA $2104
    STX $2105
    LDX #$00
    LDA #$20
    STA $2106
    STX $2107
    LDA #$22
    STA $2100
    STX $2101
    STA $2102
    STX $2103
    LDA #$29
    STA $211B
    STX $211C
    RTS
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    LSR $41
    WDM
