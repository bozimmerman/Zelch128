!--------------------------------------------------
!- Tuesday, May 16, 2017 10:30:53 PM
!- Import of : 
!- c:\src\zelch128next\prg.online utils.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 REM ===================== ONLINE SYSOP UTILS V2.5 ============ 07/18/92 =
30010 IFW1=9E9THENSYS15625:GOTO40000
30015 RESTORE:FORI=1TO4:CLOSE(I):NEXTI:W2=U:W3=D:W4=PEEK(2974):POKE2974,0:WINDOW0,4,PEEK(238),23,1:D1=PEEK(2825):W5=PEEK(2823):POKE2823,1:FORX=1TO6:READTT$(X+9)
30020 IFPEEK(238)=39ANDLEN(TT$(X))<13THENTT$(X+9)=TT$(X+9)+" ":GOTO30020
30030 NEXTX:C=1
30035 W0=O(19):IFW0<>2THENBLOAD"l-xfer 1300",U(D(0,0)),D(D(0,1)):O(19)=2
30040 DATA"INFORMATION","USER PROFILE","ACCESS/FLAGS","TIME/CREDITS","DOS.","QUIT"
30050 W6$="{left} {right}":W7$=R$+" {down}":IFPEEK(215)THENPOKE2603,8:PRINTCHR$(27)"e{reverse on}{light gray}"+LEFT$(SP$,79):GOTO30120
30060 PRINT"{reverse on}{white} Zelch 128 v2.0      Online Sysop Menu ":W6$="{up} {down}":W7$=R$+" "
30080 WINDOW0,4,PEEK(238),23:IFPEEK(215)THEN30120:ELSEPRINT"{white}{home}{down}":FORX=1TO6:IFC=XTHENPRINT"{cyan}{reverse on}";
30090 PRINTTT$(X+9)"{white}"
30100 NEXTX:GOTO30150
30120 PRINT"{reverse on}{home}{light gray}";:FORX=1TO6:IFC=XTHENPRINT"{cyan}{right}{cm g}";:ELSEPRINT"{right} ";
30130 PRINTTT$(X+9);:IFC=XTHENPRINT"{cm m}";:ELSEPRINT" ";
30140 PRINT"{light gray}{right}";:NEXTX
30150 A$="":SYS8192:IFA$=""THEN30150:ELSEX=INSTR(W6$,A$):IFXTHENC=C+X-2
30170 IFINSTR(W7$,A$)THEN30200
30180 IFC>6THENC=1:ELSEIFC<1THENC=6
30190 GOTO30080
30200 IFC=6THEN33200
30300 PRINT:WINDOW0,5,PEEK(238),23,1:W6=0:ONCGOSUB30910,32000,32500,32700,33000
30310 PRINT:WINDOW0,5,PEEK(238),23:POKE2603,8:PRINTCHR$(27)"e"CHR$(27)"l":PRINT"{down*37}";:GOTO30080
30400 REM -------- WINDOW ROUTINES --------------------------------------------
30410 WINDOWX-1,Y-1,X+W8,Y+W9,1:PRINTCHR$(27)"m{home}{cyan}";
30420 PRINTLEFT$("{cm @*40}",W8+2)
30430 FORA=1TOW9:PRINT"{cm g}"SPC(W8)"{cm m}":NEXTA
30440 PRINTLEFT$("{cm t*40}",W8+2)
30450 WINDOWX,Y,X+W8-1,Y+W9-1:POKE250,W8-1:POKE2603,0:PRINTCHR$(27)"l"CHR$(27)"f";:RETURN
30460 REM -------- WINDOW ERASE -----------------------------------------------
30470 WINDOWX-1,Y-1,X+W8,Y+W9,1:POKE2603,8:PRINTCHR$(27)"e{cyan}";:RETURN
30471 REM -------- WINDOW ROUTINES W/LIGHT BAR --------------------------------
30472 PRINTCHR$(27)"m{cyan}";:IFW6THENWINDOWX,Y,X+W8+4,Y+W9-1:GOTO30479:ELSEW6=1
30473 WINDOWX-1,Y-1,X+W8+4,Y+W9,1
30474 PRINT"{cyan}{reverse on}"LEFT$("{cm t*40}",W8+6)
30475 FORI=1TOW9+1:PRINT"{reverse on}"LEFT$(SP$,W8+6):NEXT:WINDOWX,Y,X+W8+4,Y+W9-1:FORI=1TOW9:IFLEN(TT$(I))<W8THENTT$(I)=LEFT$(TT$(I)+SP$,W8)
30476 NEXTI
30477 PRINT"{cyan}{home}";:FORI=1TOW9:PRINT"{reverse on} ";:IFW6=ITHENPRINT"{reverse off}";
30478 PRINT" "TT$(I)" ":NEXTI
30479 A$="":POKE2830,1:SYS8192:POKE2830,0:IFA$=""THEN30479:ELSEIFINSTR("{down}{up}"+CHR$(27),A$)THEN30481
30480 IFA$=CHR$(13)THENRETURN:ELSE30479
30481 IFA$="{up}"THENW6=W6-1:IFW6<1THENRETURN
30482 IFA$="{down}"THENW6=W6+1:IFW6>W9THENW6=W9:GOTO30479
30483 IFA$=CHR$(27)THENW6=0:RETURN
30484 GOTO30477
30500 REM -------- ACCES FLAG TOGGLE ROUTINE ----------------------------------
30510 FORI=1TO26:IFMID$(I$,I,1)="1"THENPRINT"{reverse on}";
30520 PRINTCHR$(I+192)"{reverse off}";:NEXTI:FORI=1TO26:PRINT"{left}";:NEXTI:I=1
30530 A$="":SYS8192:SYS15628:IFA$=""THEN30530
30540 IFA$=CHR$(13)THENPRINT:RETURN
30550 IFA$="{right}"THENI=I+1:GOTO30590
30560 IFA$="{left}"THENI=I-1:GOTO30600:ELSEIFINSTR("{up}{down}",A$)THEN30530
30570 MID$(I$,I,1)=MID$(STR$(ABS(VAL(MID$(I$,I,1))-1)),2):IFMID$(I$,I,1)="1"THENPRINT"{reverse on}";
30580 PRINTCHR$(I+192)"{reverse off}{left}";:IFA$<>" "THEN30530:ELSEI=I+1
30590 IFI>26THENI=26:GOTO30530:ELSEPRINT"{right}";:GOTO30530
30600 IFI<1THENI=1:GOTO30530:ELSEPRINT"{left}";:GOTO30530
30900 REM -------- INFORMATION ------------------------------------------------
30910 PRINT" {cyan}{reverse on}{cm t*33}"
30920 PRINT" {reverse on}  * When editing handles, be     "
30930 PRINT" {reverse on}  careful not to duplicate an    "
30940 PRINT" {reverse on}  already existing handle since  "
30950 PRINT" {reverse on}  no checking takes place in     "
30960 PRINT" {reverse on}  this module.                   "
30970 PRINT" {reverse on}                                 "
30980 PRINT" {reverse on}  * To exit these windows, press "
30990 PRINT" {reverse on}  [ESC] or cursor the light bar  "
31100 PRINT" {reverse on}  up off of the window.          "
31110 PRINT" {reverse on}                                 "
31999 A$="":SYS8192:IFA$=""THEN31999:ELSERETURN
32000 REM -------- USER PROFILE -----------------------------------------------
32010 TT$(1)="Edit caller's handle":TT$(2)="Change password":TT$(3)="Real name":TT$(4)="Phone number"
32020 W8=20:W9=4:Y=6:IFPEEK(215)THENX=17:ELSEX=3
32030 GOSUB30471:IFW6=0THENRETURN
32090 X=10:Y=12:W8=20:W9=1:IFPEEK(215)THENX=47:Y=5+W6
32100 GOSUB30400:PRINT"{white}";:O$=U$(W6):SYS4867:GOSUB30470:IFI$=""THEN32020:ELSEFORI=1TOLEN(I$):A=ASC(MID$(I$,I,1)):IFA<65ORA>90THEN32110
32105 IFO(25)=0ORI=1THENA=AOR128:GOTO32110
32107 IFMID$(I$,I-1,1)=" "THENA=AOR128:ELSEA=AAND127
32110 MID$(I$,I,1)=CHR$(A):NEXTI
32120 IFRIGHT$(I$,1)=" "THENI$=LEFT$(I$,LEN(I$)-1):GOTO32120
32130 U$(W6)=I$:GOTO32020
32500 REM -------- ACCESS AND FLAGS -------------------------------------------
32510 TT$(1)="Access level":TT$(2)="System access flags":TT$(3)="Toggle SysOp flag"
32520 W8=19:W9=3:Y=6:IFPEEK(215)THENX=33:ELSEX=6
32530 GOSUB30471:IFW6=0THENRETURN
32570 X=10:Y=12:W8=19:W9=1:IFPEEK(215)THENX=9:Y=5+W6
32580 ONW6GOTO32590,32650,32670
32590 GOSUB30400:PRINT"New Access Level: {white}";:GETKEYA$:A$=CHR$(ASC(A$)OR128):PRINTA$
32600 IFINSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ",A$)=0THENPRINT"{pink}Invalid level";:SLEEP1:GOTO32620
32610 PRINT"{cyan}Access changed!";:SLEEP1:U$(5)=A$
32620 GOSUB30470:GOTO32520
32650 W8=28:X=5:IFPEEK(215)THENX=1
32660 GOSUB30400:PRINT" ";:I$=U$(9):GOSUB30500:U$(9)=I$:GOTO32620
32670 W1=VAL(MID$(U$(8),4,1)):MID$(U$(8),4,1)=MID$(STR$(ABS(W1-1)),2)
32680 GOSUB30400:IFW1=0THENPRINT"{cyan}SysOp flag ON";:SLEEP1:GOTO32690
32685 PRINT"{cyan}SysOp flag OFF";:SLEEP1
32690 GOSUB30470:GOTO32520
32700 REM -------- TIME AND CREDITS -------------------------------------------
32710 TT$(1)="Time remaining":TT$(2)="Calls today":TT$(3)="UD Block credits":TT$(4)="System credits":TT$(5)="Mins Today"
32720 W8=16:W9=5:Y=6:IFPEEK(215)THENX=49:ELSEX=6
32730 GOSUB30471:IFW6=0THENRETURN
32810 X=3:Y=12:W8=25:W9=1:IFPEEK(215)THENX=20:Y=5+W6
32820 GOSUB30400:ONW6GOTO32830,32850,32870,32890,32910
32830 PRINT"Time remaining: {white}";:O$=MID$(STR$(D1),2):SYS4867:I=VAL(I$):IFI>0ANDI<256THEND1=I:IFD1>PEEK(2982)THENPOKE2982,D1
32840 GOSUB30470:GOTO32720
32850 PRINT"Calls today: {white}";:O$=MID$(STR$(U(6)),2):SYS4867:I=VAL(I$):IFI>-1ANDI<1000000THENU(6)=I
32860 GOTO32840
32870 PRINT"UD Blocks: {white}";:O$=MID$(STR$(U(1)),2):SYS4867:I=VAL(I$):IFI>-1ANDI<1000000THENU(1)=I
32880 GOTO32840
32890 PRINT"System credits: {white}";:O$=MID$(STR$(U(2)),2):SYS4867:I=VAL(I$):IFI>-1000000ANDI<1000000THENU(2)=I
32900 GOTO32840
32910 PRINT"Mins remaining: {white}";:O$=MID$(STR$(PEEK(2983)),2):SYS4867:I=VAL(I$):IFI>0ANDI<256THENPOKE2983,I
32920 GOSUB30470:GOTO32720
33000 REM -------- DOS COMMANDS -----------------------------------------------
33010 CLOSE1:OPEN1,U,15
33020 X=2:Y=6:W8=35:W9=2:GOSUB30400:PRINT"Device:{white}"STR$(U)"{cyan}, Drive:{white}"STR$(D):INPUT#1,A,A$,B,I:PRINT"{cyan}Status:{yellow}"STR$(A)","A$","STR$(B)","STR$(I);
33030 Y=10:W8=35:W9=1:GOSUB30400:O$=" ":PRINT"@:{white}";:SYS4867:IFI$=""ORI$=" "THENCLOSE1:GOSUB30470:RETURN
33040 A=VAL(LEFT$(I$,2)):IFA=0THEN33050:ELSEU=A:A=INSTR(I$,","):IFA=0THEN33010
33045 D=VAL(MID$(I$,INSTR(I$,",")+1)):GOTO33010
33050 IFLEFT$(I$,1)<>"$"THENPRINT#1,I$:GOTO33020
33060 A=INSTR(I$,":"):IFA=0THENA$="*":ELSEA$=MID$(I$,A+1)
33070 IFLEN(A$)>16THENA$=LEFT$(A$,16)
33080 X=10:Y=13:W8=27:W9=10:IFPEEK(215)THENX=45:Y=6:W9=17
33090 GOSUB30400:CLOSE2:OPEN2,U,0,"$"+MID$(STR$(D),2)+":"+A$:POKE253,0:SYS8219:CLOSE2
33100 PRINT:PRINT"Press RETURN to continue: ";:DO:GETA$:LOOPUNTILA$=CHR$(13):GOSUB30470:GOTO33020
33200 REM -------- EXIT ROUTINE -----------------------------------------------
33210 PRINT:WINDOW0,4,PEEK(238),23,1:POKE2823,W5:POKE2974,W4:POKE2825,D1:POKE2824,1:POKE2827,0
33215 IFW0<>O(19)THENBLOAD(MID$("pxl",W0+1,1)+"-xfer 1300"),U(D(0,0)),D(D(0,1)):O(19)=W0
33220 U=W2:D=W3:POKE2603,0:PRINTCHR$(27)"e"O$(21);:SYS15625:GOSUB100:O$=T$(121):GOSUB4:SYS15634:CLR:SYS15637
33230 DO:GET#5,A$:LOOPUNTILA$="":GOTO920
40000 REM -------- CALCULATOR -------------------------------------------------
40010 X=INT(PEEK(238)/2-9):WINDOWX,5,X+22,21
40020 PRINT"{cyan}{clear} {cm i*22}"
40030 PRINT"{light blue}{reverse on}  Zelch 128 Calc 1.0  {cyan} "
40040 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
40050 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
40060 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
40070 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
40080 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
40090 PRINT"{light blue}{reverse on}                      {cyan} "
40100 PRINT"{light blue}{reverse on}  {cyan}{cm g}7{cm m}{light blue}  {cyan}{cm g}8{cm m}{light blue}  {cyan}{cm g}9{cm m}{light blue}  {cyan}{cm g}+{cm m}{light blue}  {cyan} "
40110 PRINT"{light blue}{reverse on}                      {cyan} "
40120 PRINT"{light blue}{reverse on}  {cyan}{cm g}4{cm m}{light blue}  {cyan}{cm g}5{cm m}{light blue}  {cyan}{cm g}6{cm m}{light blue}  {cyan}{cm g}-{cm m}{light blue}  {cyan} "
40130 PRINT"{light blue}{reverse on}                      {cyan} "
40140 PRINT"{light blue}{reverse on}  {cyan}{cm g}1{cm m}{light blue}  {cyan}{cm g}2{cm m}{light blue}  {cyan}{cm g}3{cm m}{light blue}  {cyan}{cm g}/{cm m}{light blue}  {cyan} "
40150 PRINT"{light blue}{reverse on}                      {cyan} "
40160 PRINT"{light blue}{reverse on}  {cyan}{cm g}0{cm m}{light blue}  {cyan}{cm g}.{cm m}{light blue}  {cyan}{cm g}*{cm m}{light blue}  {cyan}{cm g}={cm m}{light blue}  {cyan} "
40170 PRINT"{light blue}{reverse on}                      {cyan}{cm i}"
40180 WINDOWX+1,7,X+20,11
40190 I=0:X=0:Y=0:O$=" ":PRINT"{white}{clear}";
40200 GOSUB40320:A=A-19:IFA=7THENX=INT(PEEK(238)/2-9):WINDOWX,5,X+22,21,1:I$="prg.logon":GOTO23
40210 IFA$="{ct h}"THENPRINT">HEX: "HEX$(I):O$=" ":Y=0:GOTO40200
40220 IFA$="{ct d}"THENPRINT">DEC:"DEC(I$):O$=" ":Y=0:GOTO40200
40230 IFO$=" "THENY=I:O$=A$:GOTO40250
40240 ONINSTR("+-*/^",O$)GOSUB40270,40280,40290,40300,40310:O$=A$
40250 IFA=6THENPRINTO$+MID$(STR$(Y),2):O$=" "
40260 GOTO40200
40270 Y=Y+I:RETURN
40280 Y=Y-I:RETURN
40290 Y=Y*I:RETURN
40300 Y=Y/I:RETURN
40310 Y=Y^I:RETURN
40320 PRINTO$"0{left}";:I$="":I=0
40330 GETKEYA$:A$=CHR$(ASC(A$)AND127):IFA$=CHR$(13)THENA$="="
40340 A=INSTR(CHR$(20)+"{home}abcdef.0123456789+-*/^="+CHR$(27)+"{ct h}{ct d}",A$):IFA=0THEN40330
40350 IFA<20THENONAGOTO40410,40190:GOTO40430
40360 IFI$=""ANDA<25THENO$=A$:PRINT"{left}";:GOTO40320
40370 IFO$=" "THENY=0
40380 PRINT:TRAP40390:I=VAL(I$):RETURN
40390 I=0:RETURN
40400 ONAGOTO40410,40190:GOTO40430
40410 IFI$<>""THENI$=LEFT$(I$,LEN(I$)-1):PRINT"{left} {left}";:IFI$=""THENPRINT"0{left}";
40420 GOTO40330
40430 IFLEN(I$)>18THENPRINT"{ct g}";:GOTO40330
40440 I$=I$+A$:PRINTA$;:GOTO40330
55555 A=PEEK(186):OPEN1,A,15,"s0:prg.online utils":CLOSE1:DSAVE"prg.online utils",U(A),D0
