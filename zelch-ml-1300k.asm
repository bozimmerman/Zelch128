*= $1300
;.D K-XFER 1300
        JMP SEND1K
        JMP RECV1K
PRINT2
        NOP
        ;OPEN1,8,15,"S0:K-XFER 1300,ML1300K":CLOSE1:SAVE"ML1300K",8:STOP

;**********
;CRC TABLES
;**********
CRCLSB
.BYTE 0 33 66 99 132 165 198 231
.BYTE 8 41 74 107 140 173 206 239
.BYTE 49 16 115 82 181 148 247 214
.BYTE 57 24 123 90 189 156 255 222
.BYTE 98 67 32 1 230 199 164 133
.BYTE 106 75 40 9 238 207 172 141
.BYTE 83 114 17 48 215 246 149 180
.BYTE 91 122 25 56 223 254 157 188
.BYTE 196 229 134 167 64 97 2 35
.BYTE 204 237 142 175 72 105 10 43
.BYTE 245 212 183 150 113 80 51 18
.BYTE 253 220 191 158 121 88 59 26
.BYTE 166 135 228 197 34 3 96 65
.BYTE 174 143 236 205 42 11 104 73
.BYTE 151 182 213 244 19 50 81 112
.BYTE 159 190 221 252 27 58 89 120
.BYTE 136 169 202 235 12 45 78 111
.BYTE 128 161 194 227 4 37 70 103
.BYTE 185 152 251 218 61 28 127 94
.BYTE 177 144 243 210 53 20 119 86
.BYTE 234 203 168 137 110 79 44 13
.BYTE 226 195 160 129 102 71 36 5
.BYTE 219 250 153 184 95 126 29 60
.BYTE 211 242 145 176 87 118 21 52
.BYTE 76 109 14 47 200 233 138 171
.BYTE 68 101 6 39 192 225 130 163
.BYTE 125 92 63 30 249 216 187 154
.BYTE 117 84 55 22 241 208 179 146
.BYTE 46 15 108 77 170 139 232 201
.BYTE 38 7 100 69 162 131 224 193
.BYTE 31 62 93 124 155 186 217 248
.BYTE 23 54 85 116 147 178 209 240
;
CRCMSB
.BYTE 0 16 32 48 64 80 96 112
.BYTE 129 145 161 177 193 209 225 241
.BYTE 18 2 50 34 82 66 114 98
.BYTE 147 131 179 163 211 195 243 227
.BYTE 36 52 4 20 100 116 68 84
.BYTE 165 181 133 149 229 245 197 213
.BYTE 54 38 22 6 118 102 86 70
.BYTE 183 167 151 135 247 231 215 199
.BYTE 72 88 104 120 8 24 40 56
.BYTE 201 217 233 249 137 153 169 185
.BYTE 90 74 122 106 26 10 58 42
.BYTE 219 203 251 235 155 139 187 171
.BYTE 108 124 76 92 44 60 12 28
.BYTE 237 253 205 221 173 189 141 157
.BYTE 126 110 94 78 62 46 30 14
.BYTE 255 239 223 207 191 175 159 143
.BYTE 145 129 177 161 209 193 241 225
.BYTE 16 0 48 32 80 64 112 96
.BYTE 131 147 163 179 195 211 227 243
.BYTE 2 18 34 50 66 82 98 114
.BYTE 181 165 149 133 245 229 213 197
.BYTE 52 36 20 4 116 100 84 68
.BYTE 167 183 135 151 231 247 199 215
.BYTE 38 54 6 22 102 118 70 86
.BYTE 217 201 249 233 153 137 185 169
.BYTE 88 72 120 104 24 8 56 40
.BYTE 203 219 235 251 139 155 171 187
.BYTE 74 90 106 122 10 26 42 58
.BYTE 253 237 221 205 189 173 157 141
.BYTE 124 108 92 76 60 44 28 12
.BYTE 239 255 207 223 175 191 143 159
.BYTE 110 126 78 94 46 62 14 30
;****************
;VARIABLE STORAGE
;****************
BUFFER  = $1AFD
BUFFER3 = $1B00
ENDBUF = $1F00
CRCBUF  = $1F01
ACK = $06
CAN = $18
EOT = $04
NAK = $15
SOH = $01
CNAK = $43
PAD = $1A
OTH = $02
;***************
;VARIABLE MEMORY
;***************
BLOCK           .BYTE 0
GOOD            .BYTE 0
ERRORS          .BYTE 0
ABORT           .BYTE 0
TIMEOUTS        .BYTE 0
BUFBIT          .BYTE 0
CNT             .BYTE 0
CRC             .BYTE 0 0
CLOCK           .BYTE 0
IOSTAT          .BYTE 0
;*************
;MISC ROUTINES
;*************
CLEAR
        LDA #$00
        STA BLOCK
        STA GOOD
        STA ERRORS
        STA ABORT
        STA BUFBIT
        STA CNT
        STA CRC
        STA CRC+1
        STA TIMEOUTS
        RTS
RETIME
        LDA #$00
        TAX
        TAY
        JMP $FFDB
CHECKTIME
        LDA #$00
        STA CLOCK
        LDA $A1
        CMP #$03
        BCS BADTIME
        RTS
BADTIME
        INC TIMEOUTS
        INC CLOCK
        JMP RETIME
CHECKABORT
        LDA $D3
        CMP #$02
        BEQ ABORTED
        LDA $0B0B
        BNE ABORTED
        RTS
ABORTED
        LDA #$01
        STA ABORT
        JMP $FFCC
ERRFLUSH
        INC ERRORS
FLUSHBUF
        JSR SBUF
        LDY #$00
        STY CNT
FLP2
        LDA #PAD
FLUSHLP
        STA ($FE),Y
        INY
        BNE FLUSHLP
        INC $FF
        INC CNT
        LDA CNT
        CMP #$04
        BNE FLP2
FLP3
        LDA #PAD
        STA ($FE),Y
        INY
        CPY #$05
        BCC FLP3
MINFLUSH
        LDA $0A1A
        STA $0A1B
        LDA #$00
        STA $D0
        STA CNT
        STA BUFBIT
        STA GOOD
        JSR RETIME
        RTS
PAAS
        JSR RETIME
PAS1
        LDA $A2
        CMP #$05
        BNE PAS1
        RTS
GETKEY
        TYA
        PHA
        LDA $0A18
        CMP $0A19
        BEQ NOKEY
        LDY $0A19
        LDA ($C8),Y
        STA $FA
        INC $0A19
        LDA #$01
        STA $96
        PLA
        TAY
        RTS
NOKEY
        LDA #$00
        STA $96
        STA $FA
        PLA
        TAY
        RTS
SBUF
        LDA #<BUFFER
        LDX #>BUFFER
        STA $FE
        STX $FF
        RTS
SRBUF
        LDA #<BUFFER3
        LDX #>BUFFER3
        STA $FE
        STX $FF
        RTS
;*******************
;CHECK BLOCK ROUTINE
;*******************
CHKBLK
        JSR SRBUF
        LDY #$00
        STY CNT
        STY CRC
        STY CRC+1
CRCCLP
        LDA ($FE),Y
        EOR CRC
        TAX
        LDA CRCMSB,X
        EOR CRC+1
        STA CRC
        LDA CRCLSB,X
        STA CRC+1
        INY
        BNE CRCCLP
        INC $FF
        INC CNT
        LDA CNT
        CMP #$04
        BCC CRCCLP
        RTS
;*********************
;RECEIVE A XMODEM FILE
;*********************
RECV1K
        JSR CLEAR
        JSR FLUSHBUF
        INC BLOCK
        JSR SBUF
        LDX #$05
        JSR $FFC9
        LDA #CNAK
        JSR $FFD2
RECVLP
        LDA ERRORS
        CMP #$0E
        BCC R2;**TOO MANY ERRS
CANCEL
        LDA #$01
        STA ABORT
R2
        JSR CHECKABORT
        JSR CHECKTIME
        LDA ABORT
        BEQ ARECVN
        JMP ABORTXMODEM
RCVDONE
        JMP EXITRCV
ARECVN
        LDA BLOCK
        CMP #$01
        BNE NEXTR
        LDA TIMEOUTS
        CMP #$02
        BNE NEXTR
        JMP CANCEL
NEXTR
        LDA CLOCK
        BEQ NOCLOCK
        JMP NORBORT
NOCLOCK
        LDX #$05
        JSR $FFC6
        LDA BUFFER
        CMP #CAN
        BEQ CANCEL
        CMP #EOT
        BEQ RCVDONE
        JSR GETKEY
        LDA $96
        BEQ RECVLP
        JSR RETIME
        LDY BUFBIT
        LDA $FA
        STA ($FE),Y
        INC BUFBIT
        INY
        CPY #$05
        BEQ IEND
        CPY #$00
        BNE RECVLP
        INC CNT
        INC $FF
        JMP RECVLP
IEND
        LDA CNT
        CMP #$04
        BNE RECVLP
;**** CHECK THE BLOCK ****
        JSR PAAS
        LDA BUFFER
        CMP #EOT
        BEQ RCVDONE
        CMP #CAN
        BEQ CANCEL
        CMP #OTH
        BEQ CHKREST
        CMP #SOH
        BEQ CHKREST
        JMP CONRCV
CHKREST
        LDA BUFFER+1
        CMP BLOCK
        BNE CONRCV
        EOR #$FF
        CMP BUFFER+2
        BNE CONRCV
        JSR CHKBLK
        LDA ENDBUF
        CMP CRC
        BNE CONRCV
        LDA CRCBUF
        CMP CRC+1
        BNE CONRCV
GOODIE
        LDA #$01
        STA GOOD
;**** WRITE OR NAK BLOCK ****
CONRCV
        LDA GOOD
        BEQ NORGOOD
        JSR $FFCC
        LDX #$02
        JSR $FFC9
        JSR SRBUF
        LDY #$00
        STY CNT
WRITELP
        LDA ($FE),Y
        JSR $FFD2
        INY
        BNE WRITELP
        INC $FF
        INC CNT
        LDA CNT
        CMP #$04
        BCC WRITELP
        JSR FLUSHBUF
        JSR $FFCC
        LDA #$2D
        JSR $FFD2
        LDX #$05
        JSR $FFC9
        LDA #ACK
        JSR $FFD2
        JSR $FFCC
        INC BLOCK
        JSR SBUF
        JMP RECVLP
NORGOOD
        LDA ABORT
        BEQ NORBORT
        JMP ABORTXMODEM
NORBORT
        JSR FLUSHBUF
        JSR $FFCC
        LDA #$3A
        JSR $FFD2
        LDX #$05
        JSR $FFC9
        LDA BLOCK
        CMP #$02
        BCS NAKK
        LDA #CNAK
        JSR $FFD2
        JMP CONAK
NAKK
        LDA #NAK
        JSR $FFD2
CONAK
        INC ERRORS
        JSR $FFCC
        JSR SBUF
        JMP RECVLP
;****** ALL DONE ******
EXITRCV
        JSR $FFCC
        LDX #$05
        JSR $FFC9
        LDA #ACK
        JSR $FFD2
        JMP EXITXMODEM
ABORTXMODEM
        LDA #$01
        STA ABORT
        JSR $FFCC
        LDX #$05
        JSR $FFC9
        LDA #CAN
        JSR $FFD2
        JSR $FFD2
        JSR $FFD2
EXITXMODEM
        LDX ABORT
        JSR CLEAR
        STX ABORT
        JSR FLUSHBUF
        JSR $FFCC
        LDA #$2A
        JSR $FFD2
        LDA ABORT
        STA $FB
        RTS
;******************
;SEND A XMODEM FILE
;******************
SEND1K
        JSR CLEAR
        JSR FLUSHBUF
        INC BLOCK
SNDBUILD
        LDX #$02
        JSR $FFC6
        JSR SRBUF
        LDY #$00
        STY IOSTAT
        STY CNT
SREAD
        JSR $FFE4
        STA ($FE),Y
        LDA $90
        STA IOSTAT
        BNE PADBUF
        INY
        BNE SREAD
        INC $FF
        INC CNT
        LDA CNT
        CMP #$04
        BNE SREAD
        JMP SND2
PADBUF
        INY
PAD2
        LDA #PAD
        STA ($FE),Y
        INY
        BNE PAD2
        INC $FF
        INC CNT
        LDA CNT
        CMP #$04
        BNE PAD2
SND2
        LDA #OTH
        STA BUFFER
        LDA BLOCK
        STA BUFFER+1
        EOR #$FF
        STA BUFFER+2
;**** BUILD CHECKSUMS ****
        JSR CHKBLK
        LDA CRC
        STA ENDBUF
        LDA CRC+1
        STA CRCBUF
;***** SEND THE BLOCK *****
SNDCONT
        JSR MINFLUSH
        JSR $FFCC
        LDX #$05
        JSR $FFC9
        JSR SBUF
        LDY #$00
        STY BUFBIT
        STY CNT
SENDLOOP
        LDA ($FE),Y
        JSR $FFD2
        LDY BUFBIT
        INY
        STY BUFBIT
        CPY #$05
        BEQ IEN
        CPY #$00
        BNE SENDLOOP
        INC $FF
        INC CNT
        JMP SENDLOOP
IEN
        LDA CNT
        CMP #$04
        BNE SENDLOOP
        JSR $FFCC
        LDX #$05
        JSR $FFC6
        JSR RETIME
SENDWAIT
        JSR CHECKABORT
        JSR CHECKTIME
        JSR $FFE4
        CMP #NAK
        BEQ RESEND
        CMP #CNAK
        BEQ RESEND
        CMP #CAN
        BEQ SNDABORT
        CMP #ACK
        BEQ NEXTBLOCK
        LDA ERRORS
        CMP #$0E
        BEQ SNDABORT
        LDA ABORT
        BNE SNDABORT
        LDA CLOCK
        BNE RESEND
        JMP SENDWAIT
;****** MISC SEND ROUTINES ******
SNDABORT
        JMP ABORTXMODEM
RESEND
        INC ERRORS
        JSR $FFCC
        LDA #$3A
        JSR $FFD2
        JSR PAAS
        JMP SNDCONT
NEXTBLOCK
        INC BLOCK
        JSR $FFCC
        LDA #$2D
        JSR $FFD2
        LDA IOSTAT
        BEQ NXTGO
        LDX #$05
        JSR $FFC9
        LDY #$00
EOPL
        LDA #EOT
        JSR $FFD2
        INY
        CPY #$85
        BNE EOPL
        JMP EXITXMODEM
NXTGO
        JSR PAAS
        JSR FLUSHBUF
        JMP SNDBUILD


