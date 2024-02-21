* =$1300
; new punter protocol c1 by steve punter
kCHKIN = $FFC6          ; open channel for input
kCHKOUT = $FFC9         ; open channel for output
kCLRCHN = $FFCC         ; close input and output channels
kCHRIN = $FFCF          ; input character from channel
kCHROUT = $FFD2         ; output character to channel
kGETIN = $FFE4          ; get a character from keyboard queue
kREADST = $FFB7

; these are Zelch-specific registers
ZELCH_DCD_BIT = $0b24
ZELCH_DCD_VAL = $0b25

; these are kernal registers which are platform dependent
RX_BUF_END         = $0a18
TX_BUF_START       = $0a1a
KERNAL_RS232_SETUP = $e6c2
RS232_ENABL        = $0a0f
IS_CMDR_KEY_DOWN   = $d3
;KERNAL_NUM_PRINT   = $
KERNAL_DCD_REG     = $dd01
KERNAL_CUR_DEV     = $ba
ZP_RX_BUF_PTR      = $c8
ZP_TX_BUF_PTR      = $ca
KERNAL_CUR_OUT_DEV = $9a
KERNAL_FFD2        = $ef79
KERNAL_CASSBUF_FULL= $e9be
KERNAL_CASSWRITEBLK= $ea15
KERNAL_CASSBUFF_PTR= $a6
KERNAL_TIMER2A_CTR = $dd04
KERNAL_CNTRL2A_REG = $dd0e
KERNAL_SETCIA_RS232= $e67f
KERNAL_SETXMT_RS232= $e64a

; these are generally empty spots in ZP
ZP_JUNK_IDX  = $64 ; floating point accumulator
ZP_POINTER   = $66
ZP_STAT_SYNO = $96
ZP_JUNK_TAPE = $9e ; tape error log ptr

; these are internal use buffers and can all be moved
codebuf = $1c00    ; steve put this at $c800 (3)
bitpnt  = $1c03
bitcnt  = $1c04
bitpat  = $1c05
timer1  = $1c06
gbsave  = $1c08    ; location to save good bad signal needed
bufcount= $1c09    ; number of chrs to buffer into block
delay   = $1c0b    ; delay for wait period
skpdelay= $1c0c    ; delay skip counter
endflag = $1c0d    ; flag to indicate last block
checka  = $1c0e    ; save place for checksum (4)
checkb  = $1c12    ; secondary checksum holding place (4)
bufpnt  = $1c16    ; pointer to current buffer
recsize = $1c17    ; size of received buffer
maxsize = $1c18    ; maximum block size   -- TODO:nothing sets this! problem!
blocknum= $1c19    ; block number (2)
filetype= $1c1b    ; file type (from basic)
stack   = $1c1c    ; stack pointer at entry
dontdash= $1c1d    ; flag to suppress dashes and colons
specmode= $1c1e    ; flag to send special start code
buffer  = $1d00    ; buffer for block - sp had it at $c900
unkbuf  = $1b00    ; buffer for the ffd2 override method

lastch  = $0200    ; last used character - basic line ed input buffer

StartLoc            lda #$00
                    bit $03a9
                    bit $06a9
                    bit $09a9
                    bit $0ca9
                    bit $0fa9 ; Pre-Send Injection Point
                    nop 
                    jmp Setup_Jump
                    jmp RS232_Reset
                    ; byte $00,$00,$00
Setup_Jump          sta ZP_JUNK_IDX ; LB of mantissa FPA -- basically junk
                    tsx 
                    stx stack ; store X in free ram here in C000?!
                    lda #<Entry_Accept
                    clc 
                    adc ZP_JUNK_IDX
                    sta Entry_Jump+1
                    lda #>Entry_Accept
                    adc #$00
                    sta Entry_Jump+2
Entry_Jump          jmp Entry_Accept
                    
; ** TRUE base of the Jump table.  All the stuff above is nonsense.                    
Entry_Accept        jmp Accept_Ch           ; + $00 
                    jmp Punter_Receive      ; + $03
                    jmp Punter_Transmit     ; + $06
                    jmp Punter_ReceiveType  ; + $09
                    jmp Punter_TransmitType ; + $0c
                    jmp L35aa               ; + $0f
Proto_Codes         byte $47, $4f, $4f      ; "goo"
                    byte $42, $41, $44      ; "bad"
                    byte $41, $43, $4b      ; "ack"
                    byte $53, $2f, $42      ; "s/b"
                    byte $53, $59, $4e      ; "syn"
;
; accept characters and check for codes
;
Accept_Ch           sta bitpat  ;save required bit pattern
                    lda #$00
                    sta codebuf
                    sta codebuf+1
                    sta codebuf+2
L305f               lda #$00
                    sta timer1     ;clear timer
                    sta timer1+1
L3067               jsr ExitCheck
                    jsr GetNum       ;get a chr from the modem
                    lda ZP_STAT_SYNO
                    bne L30c9      ;if no chr, do timer check
                    lda codebuf+1
                    sta codebuf
                    lda codebuf+2
                    sta codebuf+1
                    lda lastch
                    sta codebuf+2
                    lda #$00
                    sta bitcnt    ;clear bit counter
                    lda #$01
                    sta bitpnt    ;initialize bit pointer
L308d               lda bitpat    ;look at bit pattern
                    bit bitpnt    ;is bit set
                    beq L30ab
                    ldy bitcnt
                    ldx #$00
L309a               lda codebuf,x
                    cmp Proto_Codes,y
                    bne L30ab
                    iny 
                    inx 
                    cpx #$03
                    bne L309a
                    jmp L30be
                    
L30ab               asl bitpnt    ;shift bit pointer
                    lda bitcnt
                    clc 
                    adc #$03
                    sta bitcnt
                    cmp #$0f
                    bne L308d
                    jmp L305f
                    
L30be               lda #$ff
                    sta timer1
                    sta timer1+1
                    jmp L3067
                    
L30c9               inc timer1
                    bne L30d1
                    inc timer1+1
L30d1               lda timer1+1
                    ora timer1
                    beq L30ec
                    lda timer1
                    cmp #$07
                    lda timer1+1
                    cmp #$14
                    bcc L3067
                    lda #$01
                    sta ZP_STAT_SYNO
                    jmp DoDelay
                    
L30ec               lda #$00
                    sta ZP_STAT_SYNO
                    rts 
;
; get# for c128
;
                    
GetNum1             nop 
GetNum              tya 
                    pha 
                    lda RX_BUF_END
                    cmp RX_BUF_END+1
                    beq L3112
                    ldy RX_BUF_END+1
                    lda (ZP_RX_BUF_PTR),y
                    pha 
                    inc RX_BUF_END+1
                    lda #$00
                    sta ZP_STAT_SYNO
                    pla 
                    sta lastch
                    pla 
                    tay 
                    jmp L311d
                    
L3112               lda #$02
                    sta ZP_STAT_SYNO
                    lda #$00
                    sta lastch
                    pla 
                    tay 
L311d               pha 
                    lda #$03
                    sta KERNAL_CUR_DEV
                    pla 
                    rts 
;
; send a code
;          
                    
SendCode            ldx #$05
                    jsr kCHKOUT
                    ldx #$00
L312b               lda Proto_Codes,y
                    jsr Punter_ChrOut
                    iny 
                    inx 
                    cpx #$03
                    bne L312b
                    jmp kCLRCHN
                    
;
; do handshaking for reception end
;                    
RcvHandshake        sta gbsave   ;save good or bad signal as needed
                    lda #$00
                    sta delay    ;no delay
L3142               lda #$02
                    sta ZP_JUNK_IDX
                    ldy gbsave
                    jsr SendCode ;send g/b signal
L314c               lda #$04     ;allow "ack" signals
                    jsr Accept_Ch   ;wait for code
                    lda ZP_STAT_SYNO
                    beq L315c        ; if ok, send g/b signal again
                    dec ZP_JUNK_IDX
                    bne L314c
                    jmp L3142
                    
L315c               ldy #$09        ; send "s/b" code
                    jsr SendCode
                    lda endflag
                    beq L316b
                    lda gbsave
                    beq L318a
L316b               lda buffer+4
                    sta bufcount
                    sta recsize
                    jsr RecModemBlk  ; wait for block
                    lda ZP_STAT_SYNO
                    cmp #$01         ; check for good block
                    beq L3189
                    cmp #$02          ;check for blank input
                    beq L315c
                    cmp #$04         ;check for loss of signal
                    beq L3189
                    cmp #$08         ;check for "ack" signal
                    beq L315c
L3189               rts 
                    
L318a               lda #$10         ;wait for "syn" signal
                    jsr Accept_Ch
                    lda ZP_STAT_SYNO
                    bne L315c       ;if not, send "s/b" again
                    lda #$0a
                    sta bufcount
L3198               ldy #$0c        ;send "syn" signal
                    jsr SendCode
                    lda #$08        ;wait for "s/b" signal
                    jsr Accept_Ch
                    lda ZP_STAT_SYNO
                    beq L31ab
                    dec bufcount
                    bne L3198
L31ab               rts 

;
; do handshaking for transmission end
;
                    
TranHandshake       lda #$01
                    sta delay     ; use delay
L31b1               lda specmode
                    beq L31bb
                    ldy #$00
                    jsr SendCode   ;send a "goo" signal
L31bb               lda #$0b        ;allow "goo", "bad", and "s/b"
                    jsr Accept_Ch    ;wait for codes
                    lda ZP_STAT_SYNO
                    bne L31b1        ;if no signal, wait again
                    lda #$00
                    sta specmode
                    lda bitcnt
                    cmp #$00        ;"good" signal
                    bne L3205       ;no, resend old block
                    lda endflag
                    bne L323d
                    inc blocknum
                    bne L31dd
                    inc blocknum+1
L31dd               jsr SetBufPtr
                    ldy #$05          ;block number high order part
                    iny 
                    lda (ZP_POINTER),y
                    cmp #$ff
                    bne L31ff
                    lda #$01
                    sta endflag
                    lda bufpnt
                    eor #$01
                    sta bufpnt
                    jsr SetBufPtr
                    jsr DummyBlock1
                    jmp L3202
                    
L31ff               jsr CreateTranBlock   ; yes, get new block
L3202               lda #$2d
                    ;;bit $3aa9
                    byte $2c
L3205               lda #$3a
                    jsr PrintProgress
                    ldy #$06
                    jsr SendCode       ;send "ack" code
                    lda #$08           ;allow only "s/b" code
                    jsr Accept_Ch       ;wait for code
                    lda ZP_STAT_SYNO
                    bne L3202
                    jsr SetBufPtr
                    ldy #$04               ;block size
                    lda (ZP_POINTER),y
                    sta bufcount
                    jsr SetBufPtrB
                    ldx #$05
                    jsr kCHKOUT
                    ldy #$00
L322c               lda (ZP_POINTER),y    ;transmit alternate buffer
                    jsr Punter_ChrOut
                    iny 
                    cpy bufcount
                    bne L322c
                    jsr kCLRCHN
                    lda #$00
                    rts 
                    
L323d               lda #$2a
                    jsr PrintProgress
                    ldy #$06             ;send "ack" signal
                    jsr SendCode
                    lda #$08             ;wait for "s/b" signal
                    jsr Accept_Ch
                    lda ZP_STAT_SYNO
                    bne L323d          ;if not, resend "ack" signal
                    lda #$0a
                    sta bufcount
L3255               ldy #$0c
                    jsr SendCode       ;send "syn" signal
                    lda #$10
                    jsr Accept_Ch
                    lda ZP_STAT_SYNO   ;wait for "syn" signal back
                    beq L3268
                    dec bufcount
                    bne L3255
L3268               lda #$03
                    sta bufcount
L326d               ldy #$09
                    jsr SendCode
                    lda #$00
                    jsr Accept_Ch
                    dec bufcount
                    bne L326d
                    lda #$01
                    rts 

;receive a block from the modem
;
; stat returns with:
;
; bit 0 - buffered all characters successfully
; bit 1 - no characters received at all
; bit 2 - insufficient characters received
; bit 3 - "ack" signal received
                    
RecModemBlk         ldy #$00           ;start index
L3281               lda #$00           ;clear timers
                    sta timer1
                    sta timer1+1
L3289               jsr ExitCheck
                    jsr GetNum         ;get a chr from the modem
                    lda ZP_STAT_SYNO
                    bne L32cf      ;no character received
                    lda lastch
                    sta buffer,y     ;save chr in buffer
                    cpy #$03        ;chr one of the first 3
                    bcs L32b9          ;no, skip code check
                    sta codebuf,y    ;save chr in code buffer
                    cpy #$02         ;on the 3rd chr
                    bne L32b9          ;no, don't look at chrs yet
                    lda codebuf       ;check for a "ack" signal
                    cmp #$41
                    bne L32b9
                    lda codebuf+1
                    cmp #$43
                    bne L32b9
                    lda codebuf+2
                    cmp #$4b
                    beq L32c4         ;"ack" found
L32b9               iny               ;inc index
                    cpy bufcount       ;buffered all chrs
                    bne L3281         ;no, buffer next
                    lda #$01          ;yes, return bit 0 set
                    sta ZP_STAT_SYNO
                    rts 
                    
L32c4               lda #$ff           ;"syn" found, set timer to -1
                    sta timer1
                    sta timer1+1
                    jmp L3289          ;see if there is another chr
                    
L32cf               inc timer1         ;inc timer
                    bne L32d7
                    inc timer1+1
L32d7               lda timer1
                    ora timer1+1       ;timer now at zero
                    beq L32fa          ;"syn" found with no following chrs
                    lda timer1
                    cmp #$06
                    lda timer1+1
                    cmp #$10           ;time out yet
                    bne L3289          ;no, get next chr
                    lda #$02           ;yes, set bit 1
                    sta ZP_STAT_SYNO
                    cpy #$00
                    beq L32f7
                    lda #$04           ;but if chrs received, set bit 2
                    sta ZP_STAT_SYNO
L32f7               jmp DoDelay
                    
L32fa               lda #$08           ;"ack" found, set bit 2
                    sta ZP_STAT_SYNO
                    rts 
;
; create dummy block for transmission
;
                    
CreateTranBlock     lda bufpnt
                    eor #$01
                    sta bufpnt
                    jsr SetBufPtr       ;read block into "this" buffer
                    ldy #$05
                    lda blocknum
                    clc 
                    adc #$01
                    sta (ZP_POINTER),y   ;set block number low part
                    iny 
                    lda blocknum+1
                    adc #$00
                    sta (ZP_POINTER),y   ;set block number high part
                    ldx #$02
                    jsr kCHKIN
                    ldy #$07             ;actual block
L3323               jsr kCHRIN
                    sta (ZP_POINTER),y
                    iny 
                    jsr kREADST
                    bne L3338
                    cpy maxsize
                    bne L3323
                    tya 
                    pha 
                    jmp L3345
                    
L3338               tya 
                    pha 
                    ldy #$05    ;block number
                    iny            ;high part
                    lda #$ff
                    sta (ZP_POINTER),y
                    jmp L3345
                    
DummyBlock1         pha           ;save size of just read block
L3345               jsr kCLRCHN
                    jsr RS232_Reset
                    jsr BusyWait
                    jsr RS232_Reset
                    ldy #$04           ;block size
                    lda (ZP_POINTER),y
                    sta bufcount        ;set bufcount for checksum
                    jsr SetBufPtrB
                    pla 
                    ldy #$04              ;block size
                    sta (ZP_POINTER),y
                    jsr DoChksum
                    rts 
;
; set pointers for current buffer
;
                    
SetBufPtr           lda #$00
                    sta ZP_POINTER
                    lda bufpnt
                    clc 
                    adc #>buffer
                    sta ZP_POINTER+1
                    rts 
;
; set pointer b for current buffer
;
                    
SetBufPtrB          lda #$00
                    sta ZP_POINTER
                    lda bufpnt
                    eor #$01
                    clc 
                    adc #>buffer
                    sta ZP_POINTER+1
                    rts 

;
; calculate checksum
;
DoChksum         
                    lda #$00
                    sta checkb
                    sta checkb+1
                    sta checkb+2
                    sta checkb+3
                    ldy #$04
L3390               lda checkb
                    clc 
                    adc (ZP_POINTER),y
                    sta checkb
                    bcc L339e
                    inc checkb+1
L339e               lda checkb+2
                    eor (ZP_POINTER),y
                    sta checkb+2
                    lda checkb+3
                    rol a             ;set or clear carry flag
                    rol checkb+2
                    rol checkb+3
                    iny 
                    cpy bufcount
                    bne L3390
                    ldy #$00
                    lda checkb
                    sta (ZP_POINTER),y
                    iny 
                    lda checkb+1
                    sta (ZP_POINTER),y
                    iny 
                    lda checkb+2
                    sta (ZP_POINTER),y
                    iny 
                    lda checkb+3
                    sta (ZP_POINTER),y
                    rts 
;
; transmit a program
;
                    
Punter_Transmit     lda #$00
                    sta endflag
                    sta skpdelay
                    sta dontdash
                    lda #$01
                    sta bufpnt
                    lda #$ff
                    sta blocknum
                    sta blocknum+1
                    jsr SetBufPtrB
                    ldy #$04              ;block size
                    lda #$07
                    sta (ZP_POINTER),y
                    jsr SetBufPtr
                    ldy #$05              ;block number
                    lda #$00
                    sta (ZP_POINTER),y
                    iny 
                    sta (ZP_POINTER),y
L33fd               jsr TranHandshake
                    beq L33fd
L3402               lda #$00
                    sta lastch
                    rts 

;
; receive a file
;                    
Punter_Receive      lda #$01
                    sta blocknum
                    lda #$00
                    sta blocknum+1
                    sta endflag
                    sta bufpnt
                    sta buffer+5       ;block number
                    sta buffer+6
                    sta skpdelay
                    lda #$07
                    sta buffer+4      ;block size
                    lda #$00
L3428               jsr RcvHandshake
                    lda endflag
                    bne L3402
                    jsr CheckMatch    ;do checksums match
                    bne L3471         ;no
                    jsr kCLRCHN
                    lda bufcount
                    cmp #$07
                    beq L3455
                    ldx #$02
                    jsr kCHKOUT
                    ldy #$07
L3446               lda buffer,y
                    jsr Punter_ChrOut
                    iny 
                    cpy bufcount
                    bne L3446
                    jsr kCLRCHN
L3455               lda buffer+6     ;block number high order part
                    cmp #$ff
                    bne L3464
                    lda #$01
                    sta endflag
                    lda #$2a
                    byte $2c           ; BIT xxxx
                    ;;bit $2da9
L3464               lda #$2d
                    jsr Punter_ChrOut
                    jsr RS232_Reset
                    lda #$00
                    jmp L3428
                    
L3471               jsr kCLRCHN
                    lda #$3a
                    jsr Punter_ChrOut
                    lda recsize
                    sta buffer+4
                    lda #$03
                    jmp L3428
                    
;
; see if checksums match
;                    
CheckMatch          lda buffer
                    sta checka
                    lda buffer+1
                    sta checka+1
                    lda buffer+2
                    sta checka+2
                    lda buffer+3
                    sta checka+3
                    jsr SetBufPtr
                    lda recsize
                    sta bufcount
                    jsr DoChksum
                    lda buffer
                    cmp checka
                    bne L34cb
                    lda buffer+1
                    cmp checka+1
                    bne L34cb
                    lda buffer+2
                    cmp checka+2
                    bne L34cb
                    lda buffer+3
                    cmp checka+3
                    bne L34cb
                    lda #$00
                    rts 
                    
L34cb               lda #$01
                    rts 

;
; receive file type block
;
                    
Punter_ReceiveType  lda #$00
                    sta blocknum
                    sta blocknum+1
                    sta endflag
                    sta bufpnt
                    sta skpdelay
                    lda #$07
                    clc 
                    adc #$01
                    sta buffer+4
                    lda #$00
L34e9               jsr RcvHandshake
                    lda endflag
                    bne L3511
                    jsr CheckMatch
                    bne L3506
                    lda buffer+7
                    sta filetype
                    lda #$01
                    sta endflag
                    lda #$00
                    jmp L34e9
                    
L3506               lda recsize
                    sta buffer+4
                    lda #$03
                    jmp L34e9
                    
L3511               lda #$00
                    sta lastch
                    rts 

;
; transmit file type
;                    
                    
Punter_TransmitType lda #$00
                    sta endflag
                    sta skpdelay
                    lda #$01
                    sta bufpnt
                    sta dontdash
                    lda #$ff
                    sta blocknum
                    sta blocknum+1
                    jsr SetBufPtrB
                    ldy #$04        ;block size
                    lda #$07
                    clc 
                    adc #$01
                    sta (ZP_POINTER),y
                    jsr SetBufPtr
                    ldy #$05         ;block number
                    lda #$ff
                    sta (ZP_POINTER),y
                    iny 
                    sta (ZP_POINTER),y
                    ldy #$07
                    lda filetype
                    sta (ZP_POINTER),y
                    lda #$01
                    sta specmode
L3553               jsr TranHandshake
                    beq L3553
                    lda #$00
                    sta lastch
                    rts 
;
; do delay for timing
;
                    
DoDelay             inc skpdelay
                    lda skpdelay
                    cmp #$03
                    bcc L3574
                    lda #$00
                    sta skpdelay
                    lda delay
                    beq BusyWait
                    bne L3585
L3574               lda delay
                    beq L3585

BusyWait            ldx #$00
L357b               ldy #$00
L357d               iny 
                    bne L357d
                    inx 
                    cpx #$78
                    bne L357b
L3585               rts 

;
;print dash, colon, or star
;                    
PrintProgress       pha 
                    lda blocknum
                    ora blocknum+1
                    beq L3599
                    lda dontdash
                    bne L3599
                    pla 
                    jsr Punter_ChrOut
                    pha 
L3599               pla 
                    rts 
;
;reset rs232 port
;                    
RS232_Reset         jsr KERNAL_RS232_SETUP
                    lda RS232_ENABL
                    cmp #$80
                    beq RS232_Reset
                    cmp #$92
                    beq RS232_Reset
                    rts                    
L35aa               jsr S3667          ; TODO
L35ad               jsr GetNum1
                    lda ZP_STAT_SYNO
                    bne L35c8
                    lda lastch
                    and #$7f
                    sta lastch
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
                    sta lastch
                    jmp L35ea
                    
L35dc               cmp #$41
                    bcc L35ea
                    cmp #$5b
                    bcs L35ea
                    clc 
                    adc #$80
                    sta lastch
L35ea               cmp #$08
                    bne L35f3
                    lda #$14
                    sta lastch
L35f3               cmp #$22
                    bne L3601
                    jsr Punter_ChrOut
                    lda #$14
                    jsr Punter_ChrOut
                    lda #$22
L3601               lda lastch
                    cmp #$0d
                    bne L360f
                    lda #$20
                    jsr Punter_ChrOut
                    lda #$0d
L360f               jsr Punter_ChrOut
                    jsr S3667
L3615               jsr kGETIN
                    beq L35ad
                    sta lastch
                    cmp #$13
                    beq L3666
                    cmp #$41
                    bcc L3632
                    cmp #$5b
                    bcs L3632
                    clc 
                    adc #$20
                    sta lastch
                    jmp L3643
                    
L3632               lda lastch
                    cmp #$c1
                    bcc L3643
                    cmp #$db
                    bcs L3643
                    sec 
                    sbc #$80
                    sta lastch
L3643               cmp #$14
                    bne L364c
                    lda #$08
                    sta lastch
L364c               cmp #$83
                    bne L3655
                    lda #$10
                    sta lastch
L3655               ldx #$05
                    jsr kCHKOUT
                    lda lastch
                    jsr Punter_ChrOut
                    jsr kCLRCHN
                    jmp L35aa
                    
L3666               rts 
                    
S3667               lda #$12
                    jsr Punter_ChrOut
                    lda #$20
                    jsr Punter_ChrOut
                    lda #$9d
                    jsr Punter_ChrOut
                    lda #$92
                    jsr Punter_ChrOut

; 
; check for cmdr key, and dcd drop
;
ExitCheck           lda IS_CMDR_KEY_DOWN
                    nop 
                    cmp #$02
                    beq L368d
                    lda KERNAL_DCD_REG
                    and ZELCH_DCD_BIT
                    cmp ZELCH_DCD_VAL
                    bne L3694
L368d               pla 
                    tsx 
                    cpx stack
                    bne L368d
L3694               lda #$01
                    sta lastch
                    rts 
                    
; 102 bytes?! What for?
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

;
; Replacement for kCHROUT, added by unk author
; Maybe it's mostly a copy of the existing
; kernal code, due to the cassette nonsense?
;
Punter_ChrOut       pha 
                    lda KERNAL_CUR_OUT_DEV
                    cmp #$03
                    bne L370b
                    pla 
                    jmp KERNAL_FFD2
                    
L370b               bcc L3711
                    pla 
                    jmp KERNAL_FFD2
                    
L3711               lsr a       ; we get here if dev is 0, 1 or 2. 'C' set
                    pla         ; immediately under the LSR .a?
                    sta ZP_JUNK_TAPE  ; store the char in junk tape buf
                    txa 
                    pha 
                    tya 
                    pha 
                    bcc L3740   ; if dev was 2 or 0, jump over
                    jsr KERNAL_CASSBUF_FULL ; if dev was 1, stay here!
                    bne L372f
                    jsr KERNAL_CASSWRITEBLK
                    bcs L3735
                    lda #$02
                    ldy #$00
                    sta unkbuf+2,y
                    iny 
                    sty KERNAL_CASSBUFF_PTR
L372f               lda ZP_JUNK_TAPE
                    sta unkbuf+2,y
FFD2_Exit           clc 
L3735               pla 
                    tay 
                    pla 
                    tax 
                    lda ZP_JUNK_TAPE
                    bcc L373f
                    lda #$00
L373f               rts 

                    ; if we are here, then ffd2 dev is 0 or 2
L3740               jsr Empty_Transmit
                    jmp FFD2_Exit
                    
Transmit_Repeat     jsr Start_Transmit

;  *** FALLS THROUGH

;
;  I think this checks if the buffer is empty, and if so transmits
;  if not empty, it transmits until it is
;
Empty_Transmit      ldy TX_BUF_START+1
                    iny 
                    cpy TX_BUF_START      ; check if peek(buf+1)+1 == peek(buf)
                    beq Transmit_Repeat   ; if so, move up
                    sty TX_BUF_START+1    ; no, so increment peek(buf+1)
                    dey 
                    lda ZP_JUNK_TAPE
                    sta (ZP_TX_BUF_PTR),y ; save junk val to tx buf


;  *** FALLS THROUGH

;
;  I think this enables RS232 transmit to happen by the kernal right now.
;
Start_Transmit      lda RS232_ENABL
                    lsr a
                    bcs L377e
                    lda #$10
                    sta KERNAL_CNTRL2A_REG
                    lda unkbuf
                    sta KERNAL_TIMER2A_CTR
                    lda unkbuf+1
                    sta KERNAL_TIMER2A_CTR+1
                    lda #$81
                    jsr KERNAL_SETCIA_RS232
                    jsr KERNAL_SETXMT_RS232
                    lda #$11
                    sta KERNAL_CNTRL2A_REG
L377e               rts 
                    
                    BYTE $66,$99,$99 
                    
