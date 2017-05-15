!--------------------------------------------------
!- Monday, May 15, 2017 12:17:58 AM
!- Import of : 
!- c:\src\zelch128\prg.zapterm.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625:REM =============== ZAPTERM MODULE V1.0 ============ 10/02/90 =
30010 U=8:D=0:POKE2823,1:POKE2829,1:POKE2845,0:I=1200:GOSUB450:IFM(0)>2THENI=300:GOSUB450
31000 PRINT"{clear}{down}{pink}{ct n}Z{yellow}e{white}l{cyan}c{light blue}h {white}ZAPTERM v1.0":POKE2825,255:POKE2824,1:POKE2827,0:POKE2830,1:POKE2850,0:POKE2603,0
31010 PRINT"{down}{white}{reverse on}ESC{reverse off} {yellow}TERMINAL{sh space}MODE"TAB(20)"{reverse on}{white} R {reverse off} {yellow}RESET TERM"TAB(40)"{reverse on}{white} Q {reverse off} {yellow}QUIT{sh space}TO{sh space}BBS"SPC(5)"{white}{reverse on} B {reverse off} {yellow}BAUD{sh space}CHANGE"
31020 PRINT"{white}{reverse on} D {reverse off} {yellow}DOWNLOAD{sh space}FILE"TAB(20)"{reverse on}{white} U {reverse off} {yellow}UPLOAD FILE"TAB(40)"{reverse on}{white} $ {reverse off} {yellow}DIRECTORY"SPC(7)"{reverse on}{white} @ {reverse off} {yellow}DOS{sh space}CHANNEL"
31030 PRINT"{reverse on}{white} P {reverse off} {yellow}PICKUP PHONE"TAB(20)"{reverse on}{white} H {reverse off} {yellow}HANGUP{sh space}LINE"TAB(40)"{reverse on}{white} C {reverse off} {yellow}CHANGE DRIVES"SPC(3)"{reverse on}{white} X {reverse off} {yellow}RESET HAYES"
31040 PRINT"{down}{white}BAUD:{yellow}"BA;TAB(20)"{white}DRIVE:{yellow}"U"{left},"+MID$(STR$(D),2):PRINT"{down}{yellow}ZAP{white}> <{left*2}"CHR$(27)"s"CHR$(27)"f";
31050 C$=CHR$(27)+"rqbdu$@phcex":GOSUB28:PRINT"{yellow}"A$"{white}>";:ONIGOTO31500,30010,31600,32000,33000,34000,35000,36000,37000,38000,39000,40000,41000
31500 PRINT"{white}{ct n}":SYS8231:GOTO31000
31600 POKE2830,0:U=D(0,0):D=D(0,1):I$="prg.logon":GOTO23NOTYET!
31700 POKE2895,1:POKE2847,16:PRINT"{yellow}FILENAME: {white}";:GOSUB6:IFI$=""THENX=1:RETURN:ELSEFORI=1TO6:IFINSTR(I$,MID$("@*:?$;",I,1))THENX=1
31710 NEXTI:F$=I$:A$="":PRINT"{yellow}P)RG, S)EQ, or W)RP {white}: ";:DO:GOSUB8:LOOPUNTILINSTR("psw"+R$,A$):I=INSTR("psw"+R$,A$):PRINTA$:IFI=4THENX=1:RETURN:ELSERETURN
32000 POKE2895,1:POKE2847,4:PRINT"{yellow}NEW{sh space}BAUD ({white}"+RIGHT$(STR$(BA),LEN(STR$(BA))-1)+"{yellow}) : ";:GOSUB10:IFI=1200THENGOSUB450:ELSEIFI=2400THENGOSUB450
32010 IFI<600ANDI>150THENGOSUB450:GOTO31000:ELSE31000
33000 X=0:GOSUB31700:IFX=1THEN31000:ELSEPRINT"{clear}{white}DOWNLOAD:{yellow} "F$","A$:GOSUB500:GOTO31500
34000 X=0:GOSUB31700:IFX=1THEN31000:ELSEPRINT"{clear}{white}UPLOAD:{yellow} "F$","A$:GOSUB550:GOTO31500
35000 POKE2847,16:PRINT"{yellow}FILEMASK ({white}*{yellow}) : ";:GOSUB6:IFI$=""THENI$="*"
35010 POKE253,0:PRINT"{white}":OPEN1,U,15:OPEN2,U,0,"$"+STR$(D)+":"+I$:INPUT#1,A:IFA>0THENPRINT"Drive error":ELSESYS8219
35020 CLOSE1:CLOSE2:PRINT:PRINT"{white}HIT{sh space}RETURN>";:DOUNTILA$=CHR$(13):GETKEYA$:LOOP:GOTO31000
36000 POKE2895,0:GOSUB6:IFI$=""THEN36010:ELSEOPEN1,U,15,I$:CLOSE1
36010 OPEN1,U,15:INPUT#1,I,I$,X,Y:PRINT"{yellow}STATUS:{white}"I","I$","X","Y:CLOSE1:PRINT"{down}{white}HIT{sh space}RETURN>";:DOUNTILA$=CHR$(13):GETKEYA$:LOOP:GOTO31000
37000 GOSUB18:GOTO31000
38000 GOSUB13:GOTO31000
39000 POKE2895,1:POKE2847,2:PRINT"{yellow}DEVICE{sh space}(8-11) :{white} ";:GOSUB10:IFI<8ORI>11THEN31000
39005 U=I:PRINT"{yellow}{up}{right*6}DRIVE (0-254):{white} "CHR$(27)"q";:GOSUB10:IFI<0ORI>254THEN31000
39010 D=I:GOTO31000
41000 GOSUB29:GOTO31000
55555 OPEN1,8,15,"s0:prg.zapterm":CLOSE1:DSAVE"prg.zapterm",U8
