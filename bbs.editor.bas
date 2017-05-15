!--------------------------------------------------
!- Monday, May 15, 2017 3:01:31 AM
!- Import of : 
!- c:\src\zelch128\bbs.editor.prg
!- Unknown Machine
!--------------------------------------------------
2 CLR:A$="":O$="":I$="":C$="":FORX=2816TO3071:POKEX,0:NEXTX
3 H1=800:REM HIGHEST OP-CODE
5 POKE2829,1:POKE2823,1:POKE2825,255:POKE2824,1:POKE2827,0:POKE2844,0:POKE2845,0:POKE2850,0:POKE2915,SGN(PEEK(215)):POKE2917,0:U=PEEK(186):OPEN5,2,0,CHR$(6)
8 FORI=0TO3:POKE2963+I,PEEK(804+I):POKE2967+I,PEEK(810+I):NEXTI
10 CLOSE8:CLOSE2:CLOSE15:DIMLN$(1001),MD$(10),ME$(50,4),MH$(100),DX$(H1),DX(H1),OP(50),DF$(50,5),OT$(12),D(20,1),MT$(40),M$(40),CT(26,2),F$(10)
20 OPEN15,U,15:OPEN2,U,2,"0:sys.variables,s,r":INPUT#15,A:IFA=0THENGOSUB4520:GOTO30:ELSECLOSE2:CLOSE15:PRINT"{clear}{ct n}":GOSUB4500
30 FAST:IFA=0THEN50:ELSEFORX=1TO20:D(X,0)=8:D(X,1)=0:NEXTX
40 FORX=1TO16:M$(X)="0":NEXTX:M$(10)="1200":MT$(1)="X":MT$(2)="e0m0q0v0x1s0=1":MT$(3)="s7=50s11=50":MT$(7)="00000000000000000000000000"
45 MT$(4)="menu.main":MT$(5)="menu.sysop":MT$(6)="{cyan}":FORX=1TO26:CT(X,0)=X:CT(X,1)=45:NEXTX:CC$="{light green}{cyan}{light blue}{blue}{purple}{red}{pink}{yellow}"
50 C=1:U1=U:W$(0)="off":W$(1)="on ":FORX=1TO6:READTT$(X):NEXTX:FORX=1TO12:READOT$(X):NEXTX:FORX=1TO8:POKE2835+X,ASC(MID$(CC$,X,1)):NEXTX:POKE2835,1:GOTO60
54 POKE235,4+LN:PRINT:RETURN
55 U=PEEK(186):SCRATCH"bbs.editor",U(U):DSAVE"bbs.editor",U(U):END
60 CL$=CHR$(27)+"@":F1$="(none)":F2$="(none)":GOSUB2290
70 READA,B:IFA>0THENFORX=ATOB:READDX$(X),DX(X):NEXTX:GOTO70
80 DATA"INFORMATION","SEQ EDITOR","MENU EDITOR","UTILITIES","SYSTEM VARS","QUIT"
90 DATA"Filename","Data","Device","Drive/LU","Link data","Topic/Subboard","Filemask","ID number(s)","Access","Abort","Continue","Data"
100 DATA 1,41,"100000000Load a menu",1,"134000000Execute a module",3,"000000000Logoff",0,"800000000Send E-Mail",1
110 DATA "000000000Re-read E-Mail",0,"000000000Send feedback",0,"000000000Read feedback",0,"134500000Edit Seq file",4
120 DATA "134500000Read Seq file",4,"AB0000000Character prompt",2,"200000000Ask for password",1,"000000000Graphics toggle",0
130 DATA "000000000Linefeeds toggle",0,"200000000Check for graphics",1,"900000000Check 1 access flag",1
140 DATA "900000000Check for 100% flag match",1,"200000000Page sysop",1,"234000000Dos Command",3,"734200000Directory",4
150 DATA "200000000Random Check",1,"200000000Edit stats",1,"000000000User list",0,"000000000Relogon",0
160 DATA "000000000Change one-liner",0,"200000000Display 1 line of text",1,"200000000Execute another opcode",1
170 DATA "000000000Change baud rate",0,"734000000Count files on disk",3,"000000000Redisplay current menu text",0
180 DATA "800000000Check for ID#",1,"C20000000Set a flag",2,"200000000Jump on bad compare",1,"200000000Add/Subtract system credits",1
190 DATA "200000000Reset a counter variable",1,"200000000Check system credits",1,"134000000Run a basic program",3,"000000000Return to previous menu",0
195 DATA "134200000Write a file w/header",4,"A20000000Menu prompt",2,"900000000Check access",1,"000000000Toggle ANSI mode",0
200 DATA 101,112,"600000000Select a subboard",1,"660000000List subboards",2,"200000000Read a message",1
210 DATA "000000000Read new messages",0,"600000000Global new",1,"000000000Post a message",0,"200000000Scan messages",1
220 DATA "000000000Check current subop flag",0,"000000000Edit current sub intro",0,"000000000Join/Drop current sub",0,"000000000Scan new messages",0
225 DATA "000000000Toggle read mode",0
230 DATA 201,212,"600000000Select a UD sub",1,"660000000List UD subs",2,"123400000Upload file",4
240 DATA "123400000Download file",4,"234000000Multi-upload",3,"234000000Multi-download",3,"000000000Check UD subop access",0
250 DATA "000000000Blocks free",0,"000000000Edit current sub intro",0,"200000000Change protocols",1,"000000000Reconfigure records",0,"000000000List w/desc",0
260 DATA 301,306,"620000000Create/Edit a topic",2,"600000000Delete a topic",1
270 DATA "600000000Reset topic results",1,"600000000Vote on topic",1,"200000000List topics",1,"690000000Validate topic",2
280 DATA 401,409,"000000000View user info",0,"000000000Edit user info",0,"600000000Edit subboard data",1
290 DATA "600000000Edit UD data",1,"340000000ZOS",2,"000000000Change time/date",0,"000000000Add a user",0,"000000000View new user applications",0
291 DATA"000000000Edit one-liners file",0
295 DATA 501,505,"134C00000Create/Edit Newsfile",4,"134C00000Delete Newsfile",4,"134000000List Newsfiles",3,"134C00000Read a Newsfile",4
296 DATA "134000000Read New News",3
297 DATA 601,603,"000000000Menu Editor",0,"000000000User database",0,"000000000Msg base fixer",0
298 DATA 701,705,"000000000Network Mail",0,"000000000Network Feedback",0,"000000000List network systems",0
299 DATA "000000000Add a system",0,"000000000Delete a system",0,0,0
300 IFPEEK(238)=79THEN370:ELSESLOW:POKE53280,0:POKE53281,0:FORX=1TO6
310 IFLEN(TT$(X))<13THENTT$(X)=TT$(X)+" ":GOTO310
320 NEXTX:PRINT"{home*2}{clear}{ct n}{reverse on}{white} Zelch 128               System Editor "
330 POKE2603,8:PRINTCHR$(27)+"e";
340 IFPEEK(238)=79THEN380:ELSEPRINT"{home*2}{down}{white}":FORX=1TO6:IFC=XTHENPRINT"{cyan}{reverse on}";
350 PRINTTT$(X)"{white}"
360 NEXTX:GOTO410
370 PRINT"{home*2}{clear}{ct n}{reverse on}{white}                                                                                "
380 PRINT"{home*2}{reverse on}{white}";:FORX=1TO6:IFC=XTHENPRINT"{cyan}{right}{cm g}";:ELSEPRINT"{right} ";
390 PRINTTT$(X);:IFC=XTHENPRINT"{cm m}";:ELSEPRINT" ";
400 PRINT"{white}{right}";:NEXTX
410 GETKEYA$:IFA$="{right}"ORA$="{down}"THENC=C+1:GOTO440
420 IFA$="{left}"ORA$="{up}"THENC=C-1:GOTO440
430 IFA$=CHR$(13)THEN460
440 IFC>6THENC=1:ELSEIFC<1THENC=6
450 GOTO340
460 IFPEEK(238)=39THENWINDOW0,1,39,24:PRINT"{reverse on}{clear}";:ELSEWINDOW0,1,79,24
470 ONCGOTO550,950,2550,5640,5000,630
550 PRINT"{clear}{right}{cyan}{cm t*38}"
560 PRINT"{right}{reverse on}{cyan}  For updates write to:               "
570 PRINT"{right}{reverse on}{cyan}                                      "
580 PRINT"{right}{reverse on}{cyan}     Elite Software                   "
590 PRINT"{right}{reverse on}{cyan}     2968 W. Ina Rd. Suite #140       "
600 PRINT"{right}{reverse on}{cyan}     Tucson,{sh space}Az 85741                 "
610 PRINT"{right}{reverse on}{cyan}{cm p*38}"
620 GETKEYA$:PRINT"{clear}":GOTO340
630 X=15:IFPEEK(215)THENX=55
640 PRINT"{clear}{cyan}"TAB(X)"{cm t*24}"
650 PRINTTAB(X)"{reverse on} Press ESC to exit to   "
660 PRINTTAB(X)"{reverse on} basic, any other key   "
670 PRINTTAB(X)"{reverse on} to abort.              "
680 PRINTTAB(X)"{reverse on}{cm p*24}"
690 GETKEYA$
700 IFA$<>CHR$(27)THENPRINT"{clear}":GOTO340
710 PRINT"{home*2}{clear}";:I$="{pink}Z{yellow}e{white}l{cyan}c{light blue}h {white}128  Copyright 1991{f7}Elite Software!{cyan}":GOSUB2170:POKE2603,0:END
720 POKE2823,1:POKE2825,255:POKE2824,1:POKE2827,0:SYS8201:RETURN
930 POKE2603,0:PRINTCHR$(27)+CHR$(70):RETURN
940 INPUT#15,A,B$,X,Y:D$=MID$(STR$(A),2)+", "+B$+","+MID$(STR$(X),2)+","+MID$(STR$(Y),2):RETURN
950 PRINT"{down}{reverse off}{yellow}Active: device"U"{left}, drive"D
960 GOSUB930:PRINT"{ct n}{cyan}({white}"+MID$(STR$(Z),2)+"{cyan} lines) Edit: ";:POKE2831,1:GOSUB720
970 ONINSTR("CDEFIKLMRAS",I$,1)GOTO1450,1630,1490,1680,1640,1610,1530,1320,1650,1480,1710
990 ONINSTR("#!%@VJT*",I$,1)GOTO1770,1800,1860,1900,1550,1920,1960,1970
1000 IFI$="LOAD"THEN1560
1010 IFI$="NEW"THENZ=0:PRINT:PRINT"{ct o}Text deleted.":GOTO960
1020 IFI$="QUIT"ORI$="Q"THENCLOSE8:CLOSE2:PRINT"{clear}":GOTO330
1030 IFI$="SAVE"THEN1580
1040 IFI$<>"$"THEN1150:ELSEPRINT:PRINT"Search pattern (default=*): ";:GOSUB720
1050 IFI$=""THENI$="*"
1060 IFLEN(I$)>16THENI$=LEFT$(I$,16)
1070 PRINT:PRINT"Device"U"{left}, Drive"D"{left}.":PRINT:CLOSE1:OPEN2,U,0,"$"+MID$(STR$(D),2)+":"+I$:POKE253,0:SYS8219:CLOSE2:GOTO960
1150 PRINT"{down}{white}Editor Commands:{down}{cyan}"
1160 PRINT"{reverse on}QUIT{reverse off} Exit seq edit  {reverse on}NEW{reverse off} Clear text      {reverse on}LOAD{reverse off} Load file      {reverse on}SAVE{reverse off} Save file"
1170 PRINT"{down}{white}Editing Commands:{down}{cyan}"
1180 PRINT"{reverse on} A {reverse off} Add to file w/o listing             {reverse on} C {reverse off} Continue after listing"
1190 PRINT"{reverse on} D {reverse off} Delete lines                        {reverse on} E {reverse off} Edit a line"
1200 PRINT"{reverse on} I {reverse off} Insert a line                       {reverse on} S {reverse off} Search and replace"
1210 PRINT"{reverse on} * {reverse off} Bit-edit a line"
1220 PRINT"{down}{white}Line formatting commands:{down}{cyan}"
1230 PRINT"{reverse on} K {reverse off} Insert character at start of line   {reverse on} R {reverse off} Remove characters from line"
1240 PRINT"{reverse on} J {reverse off} Justify (center) text               {reverse on} T {reverse off} Toggle word-wrap ("W$(W)")"
1250 PRINT"{reverse on} % {reverse off} Convert to 80 columns"
1260 PRINT"{down}{white}Other/Miscellaneous:{down}{cyan}"
1270 PRINT"{reverse on} L {reverse off} List w/line numbers                 {reverse on} V {reverse off} View w/o line numbers"
1280 PRINT"{reverse on} F {reverse off} Create temporary f-keys             {reverse on} M {reverse off} List of special control codes"
1290 PRINT"{reverse on} ! {reverse off} Sequential file reader              {reverse on} # {reverse off} Change drive number"
1300 PRINT"{reverse on} $ {reverse off} Directory                           {reverse on} @ {reverse off} Dos commands"
1310 GOTO960
1320 PRINT:PRINT"CONTROL O <-- Flash mode on             CONTROL L <-- Flash mode off"
1330 PRINT"CONTROL B <-- Underline mode on         CONTROL H <-- Underline mode off"
1340 PRINT"CONTROL Z <-- Switch to upper case      CONTROL N <-- Switch to lowercase":GOTO960
1350 PRINT:I$="{white}ERROR{cyan}: Either no file in memory or{f7}all 1000 lines are full.":GOSUB2170:GOTO960
1360 E=0:WW$="":PRINT:PRINT"Starting line number (1): ";:GOSUB720:IFI$<>""THENL1=INT(VAL(I$)):ELSEL1=1
1370 IFL1<1ORL1>ZTHENPRINT"Invalid line number.":E=1:RETURN
1380 PRINT"  Ending line number ("MID$(STR$(Z),2)"): ";:GOSUB720:IFI$<>""THENL2=INT(VAL(I$)):ELSEL2=Z
1385 IFL2<L1ORL2>ZTHENPRINT"Invalid line number".:PRINT:E=1
1390 RETURN
1400 WW$="":E=0:PRINT:PRINT"Line number: ";:GOSUB720:IFI$=""ORVAL(I$)=0THENE=1:RETURN:ELSEL1=VAL(I$)
1410 IFL1<1ORL1>999THENPRINT"Invalid line number.":E=1:RETURN:ELSERETURN
1420 PRINT:PRINT"Last filename used was "I$:
1430 PRINT"{down}File name: "CHR$(27)"s";:GETKEYA$:IFA$="{arrow left}"THENGOSUB2010:RETURN:ELSEPOKE842,ASC(A$):POKE208,1
1435 GOSUB720:IFI$=""THENRETURN:ELSEIFLEN(I$)>16THENPRINT"Maximum 16 characters.":GOTO1430
1440 RETURN
1450 IFZ=1000THEN1350:ELSEPRINT"{white}{clear}{cyan}";:IFZ=0THEN1470:ELSEFORT=1TOZ:I$=LN$(T):GOSUB2170:NEXTT
1470 GOSUB720:IFI$=""THEN960:ELSEZ=Z+1:LN$(Z)=I$:IFZ>999THEN960:ELSEGOTO1470
1480 IFZ=1000THEN1350:ELSEPRINT"{cyan}":GOTO1470
1490 IFZ=0THEN1350:ELSEGOSUB1400:ONEGOTO960:IFL1>ZTHEN960
1500 T=L1:T$=RIGHT$(LN$(T),1):IFINSTR("{f6}{f7}",T$,1)=0THENT$=""
1510 PRINT:I$=LN$(T):GOSUB2170:GOSUB720:IFI$=""THENPRINT"{up}{cyan}(no changes)":GOTO960
1520 LN$(T)=I$+T$:WW$="":GOTO960
1530 IFZ=0THEN1350:ELSEGOSUB1360:ONEGOTO960:PRINT:FORT=L1TOL2:A$=MID$(STR$(T),2)+">":MAX=79-LEN(A$):PRINTA$;:I$=LN$(T):GOSUB4480:GETA$:IFA$<>" "THENNEXTT
1540 GOTO960
1550 IFZ=0THEN1350:ELSEGOSUB1360:ONEGOTO960:PRINT:FORT=L1TOL2:I$=LN$(T):GOSUB2170:GETA$
1555 IFA$=" "THEN960:ELSENEXTT:GOTO960
1560 I$=F1$:GOSUB1420:IFI$=""THEN960:ELSEZ=0:F1$=I$:OPEN15,U,15:OPEN2,U,2,(STR$(D)+":"+F1$+",s,r"):GOSUB940:IFA>0THENCLOSE2:CLOSE15:GOTO960
1565 I$=R$+"Loading {f5}"+F1$+"{f5}.{ct c}":GOSUB2170
1570 SYS8222:Z=Z+1:LN$(Z)=I$:IFPEEK(253)>0ORZ=1000THENGOSUB940:CLOSE2:CLOSE15:PRINT:GOTO960:ELSEI$=".{ct c}":GOSUB2170:GOTO1570
1580 IFZ=0THEN1350:ELSEI$=F1$:GOSUB1420:IFI$=""THEN960:ELSEF1$=I$:OPEN15,U,15,"s"+STR$(D)+":"+F1$:GOSUB940:OPEN8,U,8,(STR$(D)+":"+F1$+",s,w"):PRINT"{clear}";
1590 FORT=1TOZ:PRINT#8,LN$(T):I$=LN$(T):GOSUB2170:NEXTT
1600 PRINT:PRINT"Drive status: ";:GOSUB940:PRINTD$:CLOSE8:CLOSE15:GOTO960
1610 IFZ=0THEN1350:ELSEGOSUB1360:ONEGOTO960:PRINT"{down}Enter the string of text to insert on the lines:":GOSUB720:IFI$=""THEN960:ELSEIFLEN(I$)>20THENI$=LEFT$(I$,20)
1620 FORT=L1TOL2:LN$(T)=I$+LN$(T):NEXTT:GOTO960
1630 IFZ=0THEN1350:ELSEGOSUB1360:ONEGOTO960:PRINT"{down}Standby...":J=L2-L1+1:FORT=L1TOZ-J+1:LN$(T)=LN$(T+J):NEXTT:Z=Z-J:IFZ<0THENZ=0:GOTO960
1635 FORT=Z+1TOZ+J+1:LN$(T)="":NEXTT:GOTO960
1640 IFZ=0ORZ=1000THEN1350:ELSEGOSUB1400:ONEGOTO960:FORT=ZTOL1STEP-1:LN$(T+1)=LN$(T):NEXTT:Z=Z+1:GOTO960
1650 IFZ=0THEN1350:ELSEGOSUB1360:ONEGOTO960:PRINT"{down}Number of characters to remove: ";:GOSUB720:IFI$=""THEN960:ELSEIFVAL(I$)<1THEN960
1660 FORT=L1TOL2:S=LEN(LN$(T)):IFS<VAL(I$)THENPRINT"{white}ERROR{cyan}: line"T" too short.":NEXTT:GOTO960
1670 LN$(T)=RIGHT$(LN$(T),(S-VAL(I$))):NEXTT:GOTO960
1680 PRINT:KEY:PRINT"{down}Edit which key (1-8): ";:GOSUB720:IFI$=""THEN960:ELSEIFVAL(I$)<1ORVAL(I$)>8THEN1680
1690 L1=VAL(I$):PRINT"{down}Enter new definition (use {arrow left} at end of line for CR):":GOSUB720:IFRIGHT$(I$,1)="{arrow left}"THENI$=LEFT$(I$,LEN(I$)-1)+CHR$(13)
1700 KEY(L1),I$:GOTO1680
1710 IFZ=0THEN1350:ELSEGOSUB1360:ONEGOTO960:PRINT"{down}Enter string to replace: ";:GOSUB720:IFI$=""ORLEN(I$)>20THEN960
1720 X$=I$:PRINT" String to replace with: ";:GOSUB720
1730 PRINT"{down}Standby...":FORT=L1TOL2
1740 X=INSTR(LN$(T),X$):IFX=0THEN1760
1750 X=X-1:P$=LEFT$(LN$(T),X)+I$+RIGHT$(LN$(T),LEN(LN$(T))-(X+LEN(X$))):LN$(T)=P$:GOTO1740
1760 NEXTT:GOTO960
1770 PRINT:PRINT"Current Configuration:":PRINT"  Device"U"{left}, Drive"D"{left}."
1780 PRINT"{down}New device: ";:GOSUB720:IFI$=""THEN960:ELSEIFVAL(I$)<8ORVAL(I$)>30THENPRINT"{down}Invalid":GOTO1780:ELSEU=VAL(I$)
1790 PRINT"  drive/lu: ";:GOSUB720:IFI$=""THEN960:ELSEIFVAL(I$)<0ORVAL(I$)>254THENPRINT"{down}Invalid{down}":GOTO1790:ELSED=VAL(I$):GOTO960
1800 GOSUB1430:IFI$=""THEN960:ELSEOPEN15,U,15:OPEN2,U,2,(STR$(D)+":"+I$+",s,r"):GOSUB940:IFA>0THENCLOSE2:CLOSE15:PRINT"{down}Drive Status: "D$:GOTO960
1810 PRINT"{down}{pink}{reverse on}CTRL S{reverse off}{white}={cyan}PAUSE        {light blue}{reverse on}SPACE {reverse off}{white}={cyan}ABORT{cyan}":PRINT:SYS8210:CLOSE2:CLOSE15:GOTO960
1860 IFZ=0THEN1350:ELSEGOSUB1360:ONEGOTO960
1870 FORT=L1TOL2STEP2:IFT+1>L2THENL2=L2-1:GOTO1890
1880 LN$(T)=LN$(T)+"{f7}"+LN$(T+1):NEXTT
1890 FORT=L2TOL1STEP-2:FORJ=TTOZ:LN$(J)=LN$(J+1):NEXTJ:Z=Z-1:NEXTT:GOTO960
1900 PRINT:PRINT"{cyan}DOS Command ({white}";MID$(STR$(U),2);",";MID$(STR$(D),2);"{cyan}): ";:GOSUB720:IFI$=""THEN960
1910 CLOSE15:OPEN15,U,15:PRINT#15,I$:PRINT:PRINT"{right}Status: {yellow}";:GOSUB940:PRINTD$:CLOSE15:GOTO1900
1920 IFZ=0THEN1350:ELSEGOSUB1360:ONEGOTO960:PRINT"{down}Standby...":FORT=L1TOL2:IFLEN(LN$(T))>78THEN1950
1930 P$="                                                                              "
1940 X=INT((80-LEN(LN$(T)))/2):MID$(P$,X)=LN$(T):LN$(T)=P$
1950 NEXTT:GOTO960
1960 W=ABS(W-1):PRINT"{down}Word wrap "W$(W):POKE2850,W:GOTO960
1970 IFZ=0THEN1350:ELSEGOSUB1400:ONEGOTO960:IFL1>ZTHEN960
1980 I$=LN$(L1):GOSUB1990:LN$(L1)=I$:GOTO960
1990 PRINT:PRINT"Use the arrow keys on top of the keyboard to insert cursor movements."
2000 PRINT"The crsr keys next to the shift key will move the cursor through the text.{down}"
2010 O$=I$:IFI$<>""THENPOKE250,0:SYS4867:RETURN:ELSEI$=" ":GOTO2010
2170 O$=I$:IFO$<>""THENPOKE2958,1:SYS8204:RETURN:ELSEI$=" ":GOTO2170
2290 MD$(1)="1":MD$(2)="CMD":MD$(3)="ASCII prompt: ":MD$(4)="Color prompt: "
2300 RETURN
2440 GOSUB5520:FORX=1TO26:IFMID$(I$,X,1)="1"THENPRINT"{reverse on}";
2450 PRINTCHR$(X+192)"{reverse off}";:NEXTX:FORX=1TO26:PRINT"{left}";:NEXTX:X=1
2460 GETA$:SYS15628:IFA$=""THEN2460
2470 IFA$=CHR$(13)THENPRINT:RETURN
2480 IFA$="{right}"ORA$="{up}"THENX=X+1:GOTO2520
2490 IFA$="{left}"ORA$="{down}"THENX=X-1:GOTO2530
2500 MID$(I$,X,1)=MID$(STR$(ABS(VAL(MID$(I$,X,1))-1)),2):IFMID$(I$,X,1)="1"THENPRINT"{reverse on}";
2510 PRINTCHR$(X+192)"{reverse off}{left}";:IFA$<>" "THEN2460:ELSEX=X+1
2520 IFX>26THENX=26:GOTO2460:ELSEPRINT"{right}";:GOTO2460
2530 IFX<1THENX=1:GOTO2460:ELSEPRINT"{left}";:GOTO2460
2540 PRINT:I$="{white}ERROR{cyan}: Either no file in memory or{f7}max number of commands are used.":GOSUB2170:GOTO2560
2550 PRINT"{down}{reverse off}{yellow}Active: device"U1"{left}, drive"D1
2560 GOSUB930:PRINT"{ct n}{cyan}({white}"+MID$(STR$(Z1),2)+"{cyan} commands) Edit: ";:POKE2831,1:GOSUB720
2570 ONINSTR("V!#MXL*PAEID@",I$,1)GOTO2970,2980,3060,3090,3140,3190,3250,3260,3530,3450,4350,4390,4420
2590 IFI$="LOAD"THEN2860
2600 IFI$="NEW"THENZ2=0:Z1=0:GOSUB2290:PRINT:PRINT"{ct o}Menu cleared.":GOTO2560
2610 IFI$="QUIT"ORI$="Q"THENCLOSE8:CLOSE2:PRINT"{clear}":C=3:GOTO330
2620 IFI$="SAVE"THEN2930
2630 IFI$<>"$"THEN2740:ELSEPRINT:PRINT"Search pattern (default=*): ";:GOSUB720
2640 IFI$=""THENI$="*"
2650 IFLEN(I$)>16THENI$=LEFT$(I$,16)
2660 PRINT:PRINT"Device"U1"{left}, Drive"D1"{left}.":PRINT:CLOSE1:OPEN2,U1,0,"$"+MID$(STR$(D1),2)+":"+I$:POKE253,0:SYS8219:CLOSE2:GOTO2560
2740 PRINT"{down}{white}Menu Editor Commands:{down}{cyan}"
2750 PRINT"{reverse on}QUIT{reverse off} Exit editor    {reverse on}NEW{reverse off} Clear menu      {reverse on}LOAD{reverse off} Load new menu  {reverse on}SAVE{reverse off} Save menu"
2760 PRINT"{down}{white}Editing Commands:{down}{cyan}"
2770 PRINT"{reverse on} A {reverse off} Add a command                       {reverse on} D {reverse off} Delete a command"
2780 PRINT"{reverse on} E {reverse off} Edit a command                      {reverse on} I {reverse off} Insert between commands"
2790 PRINT"{down}{white}Other/Miscellaneous:{down}{cyan}"
2800 PRINT"{reverse on} L {reverse off} List commands                       {reverse on} V {reverse off} View menu text"
2810 PRINT"{reverse on} M {reverse off} Menu code                           {reverse on} X {reverse off} Change log identifier"
2820 PRINT"{reverse on} * {reverse off} Bit edit prompts                    {reverse on} P {reverse off} Edit prompts"
2830 PRINT"{reverse on} ! {reverse off} Import text to/from editor          {reverse on} # {reverse off} Change drive number"
2840 PRINT"{reverse on} $ {reverse off} Directory                           {reverse on} @ {reverse off} DOS Commands"
2850 GOTO2560
2860 I$=F2$:GOSUB1420:IFI$=""THEN2560:ELSEF2$=I$:OPEN15,U1,15:OPEN2,U1,2,(STR$(D1)+":"+F2$+",s,r"):GOSUB940:IFA>0THENCLOSE2:CLOSE15:GOTO2560
2870 PRINT"{clear}{down}{white}Loading menu text...{down}{cyan}":Z2=0
2880 Z2=Z2+1:SYS8222:A=PEEK(253):MH$(Z2)=I$:GOSUB2170:IFATHENGOSUB940:CLOSE2:CLOSE15:GOTO2560
2890 IFI$<>"{ct a}"THEN2880:ELSEZ2=Z2-1
2900 PRINT:PRINT"{white}Loading menu data, standby...{down}":FORX=1TO4:SYS8222:MD$(X)=I$:NEXTX:Z1=0
2910 Z1=Z1+1:FORX=0TO4:SYS8222:A=PEEK(253):ME$(Z1,X)=I$:NEXTX
2920 PRINT"{cyan}Command: ";:I$=ME$(Z1,0)+"  "+ME$(Z1,2):MAX=67:GOSUB4480:IFATHENCLOSE2:CLOSE15:GOTO2560:ELSEGOTO2910
2930 IFZ1=0THEN2540:ELSEI$=F2$:GOSUB1420:IFI$=""THEN2560:ELSEF2$=I$:OPEN15,U1,15,"s"+STR$(D1)+":"+F2$:GOSUB940:OPEN8,U1,8,(STR$(D1)+":"+F2$+",s,w")
2940 PRINT"{clear}{down}{white}Saving menu text...{down}{cyan}":FORX=1TOZ2:PRINT#8,MH$(X):I$=MH$(X):GOSUB2170:NEXTX:IFZ1=0THENCLOSE8:CLOSE15:GOTO2560
2950 PRINT#8,"{ct a}":PRINT:PRINT"{white}Saving menu data, standby...{down}":FORX=1TO4:PRINT#8,MD$(X):NEXTX
2960 FORX=1TOZ1:PRINT"{cyan}Command: ";:I$=ME$(X,0)+"  "+ME$(X,2):MAX=67:GOSUB4480
2965 FORY=0TO4:PRINT#8,ME$(X,Y):NEXTY:NEXTX:PRINT"{down}Drive status: ";:GOSUB940:PRINTD$:CLOSE8:CLOSE15:GOTO2560
2970 IFZ2=0THENGOSUB2540:GOTO2560:ELSEPRINT:FORX=1TOZ2:I$=MH$(X):GOSUB2170:NEXTX:GOTO2560
2980 I$="{f6}1) Import text from editor or{f7}2) Copy text to editor: {ct c}":GOSUB2170:GETKEYA$:IFA$<>"1"ANDA$<>"2"THENPRINT:GOTO2560
2990 PRINTA$:I$="Clear destination text before{f7}transfer (y/n)? {ct c}":GOSUB2170:GETKEYB$:IFINSTR("Yy",B$,1)=0THENPRINT"No":Y=0:ELSEPRINT"Yes":Y=1
3000 PRINT"{down}Copying text...":IFA$="2"THEN3040
3010 IFY=0THENT=Z2+1:Z2=Z2+Z:ELSET=1:Z2=Z
3020 IFZ2>100THENZ2=100
3030 Y=0:FORX=TTOZ2:Y=Y+1:MH$(X)=LN$(Y):NEXTX:GOTO2560
3040 IFY=0THENY=Z+1:Z=Z+Z2:ELSEY=1:Z=Z2
3050 T=0:FORX=YTOZ:T=T+1:LN$(X)=MH$(T):NEXTX:GOTO2560
3060 PRINT:PRINT"Current Configuration:":PRINT"  Device"U1"{left}, Drive"D1"{left}."
3070 PRINT"{down}New device: ";:GOSUB720:IFI$=""THEN2560:ELSEIFVAL(I$)<8ORVAL(I$)>30THENPRINT"{down}Invalid":GOTO3070:ELSEU1=VAL(I$)
3080 PRINT"  drive/lu: ";:GOSUB720:IFI$=""THEN2560:ELSEIFVAL(I$)<0ORVAL(I$)>254THENPRINT"{down}Invalid{down}":GOTO3080:ELSED1=VAL(I$):GOTO2560
3090 PRINT:I$="0=text not displayed when loaded,{ct k}1=text automatically displayed,":GOSUB2170
3100 PRINT"{down}Old menu code: ";LEFT$(MD$(1),1):PRINT"     New code: ";:GOSUB720:IFI$=""THEN2560
3110 MID$(MD$(1),1,1)=LEFT$(I$,1):I$="{ct k*2}Enter a command to be auto executed{ct k}when the menu is loaded. RETURN=None":GOSUB2170
3120 PRINT"{down}Current command: ";MID$(MD$(1),2,1);:IFMID$(MD$(1),2,1)=""THENPRINT"NONE":ELSEPRINT
3125 PRINT" Command is now: ";:GOSUB720:MD$(1)=LEFT$(MD$(1),1)+LEFT$(I$,1):IFI$=""THEN2560
3130 I$="{f6}The command that will be automatically{f7}executed is: "+RIGHT$(MD$(1),1):GOSUB2170:GOTO2560
3140 I$="{f6}The menu identifier is a 3 character{f7}code that is used to identify menus":GOSUB2170
3150 I$="when the extended log option is enabled.":GOSUB2170
3160 PRINT"{down}Current extended log identifier is: "MD$(2)
3170 PRINT"          Enter the new identifier: ";:POKE2831,1:GOSUB720:IFI$=""THEN2560
3180 IFLEN(I$)<>3THENPRINT"{down}Must be 3 characters.":GOTO3160:ELSEMD$(2)=I$:GOTO2560
3190 IFZ1=0THENGOSUB2540:ELSEFORX=1TOZ1:PRINT"{down}{cyan}Command key: {white}";:I$=ME$(X,0):MAX=1:GOSUB4480
3200 GOSUB3220:PRINT"{up}"TAB(40)"{cyan}Access: {yellow}"I$:PRINT"{cyan}Description: {white}";:I$=ME$(X,2):MAX=200
3210 GOSUB4480:GETA$:IFA$=" "THEN2560:ELSEIFA$<>"{home}"THENNEXTX:GOTO2560:ELSEDO:GETA$:LOOPUNTILA$<>"":NEXTX:GOTO2560
3220 I$="":FORH=1TO26:IFMID$(ME$(X,1),H,1)="1"THENI$=I$+CHR$(H+192):ELSEI$=I$+" "
3230 NEXTH:RETURN
3240 PRINT"{down}1) ASCII prompt or 2) GRFX prompt? ";:GETKEYA$:PRINTA$:WW=VAL(A$):RETURN
3250 GOSUB3240:WW=WW-1:IFWW<0ORWW>1THEN2560:ELSEI$=MD$(3+WW):GOSUB1990:MD$(3+WW)=I$:GOTO2560
3260 GOSUB3240:WW=WW-1:IFWW<0ORWW>1THEN2560:ELSEPRINT:I$=MD$(3+WW):GOSUB2170:C=WW:GOSUB720:WW=C:IFI$=""THEN2560:ELSEMD$(3+WW)=I$:GOTO2560
3270 PRINT"{cyan}Filename: "CL$;:GOSUB720:IFI$=""ORI$="*"THENRETURN
3280 IFLEN(I$)>16THENPRINT"{up*2}{white}16 characters maximum.":GOTO3270:ELSERETURN
3290 PRINT"{cyan}Device number: "CL$;:GOSUB720:IFI$=""ORI$="*"ORLEFT$(I$,1)="#"THENRETURN
3300 U2=VAL(I$):I$=MID$(STR$(U2),2):IFU2<8ORU2>30THENPRINT"{up*2}{white}Must be between 8 and 30.":GOTO3290:ELSERETURN
3310 PRINT"{cyan}Drive/LU     : "CL$;:GOSUB720:IFI$=""ORI$="*"ORI$="#"THENRETURN
3320 D2=VAL(I$):I$=MID$(STR$(D2),2):IFD2<0ORD2>254THENPRINT"{up*2}{white}Must be between 0 and 254.":GOTO3310:ELSERETURN
3325 PRINT"Data: "CL$;:POKE2831,1:GOSUB720:IFI$=""ORI$="*"THENRETURN
3326 I=(ASC(I$)-192):IFI<1ORI>26THENPRINT"{up*2}{white}Invalid access flag.":GOTO3325:ELSERETURN
3330 PRINT"{cyan}User ID number(s): "CL$;:GOSUB720:IFI$=""ORI$="*"THENRETURN
3340 IFVAL(I$)<1ORVAL(I$)>500THENPRINT"{up*2}{white}Valid user ID's range from 1-500.":GOTO3330:ELSERETURN
3360 PRINT"{cyan}Filemask: "CL$;:GOSUB720:RETURN
3370 PRINT"{cyan}Topic/Subboard letter  (A-Z): "CL$;:POKE2831,1:GOSUB720:IFI$=""ORI$="*"ORI$="#"THENRETURN
3380 I=(ASC(I$)-192):IFI=-147ORI=-149THENRETURN
3390 IFI<1ORI>26THENPRINT"{up*2}{white}Valid letters range from A-Z only.":GOTO3370:ELSEI$=CHR$(I+192):RETURN
3400 I$=DF$(W1,V):IFLEN(I$)<26THENI$="00000000000000000000000000"
3410 GOSUB2440:RETURN
3420 PRINT"{cyan}Data: "CL$;:GOSUB720:RETURN
3423 PRINT"{cyan}Continue key(s): "CL$;:POKE2831,1:GOSUB720:RETURN
3426 PRINT"{cyan}Abort key(s): "CL$;:POKE2831,1:GOSUB720:RETURN
3430 PRINT"{cyan}Filetype (P)rg, (S)eq, (W)ordpro: "CL$;:POKE2831,1:GOSUB720:IFI$=""ORINSTR("PSW",I$)=0THENPRINT"{up*2}{white}You must enter P,S, or W.":GOTO3430
3440 I=INSTR("PSW",I$):RETURN
3450 C0=0:PRINT:PRINT"Is this an op-code subroutine (y/n)? ";:GETKEYA$:IFINSTR("Yy",A$)>0THENC0=1:PRINT"Yes":ELSEPRINT"No."
3460 PRINT"{down}Command key: ";:GOSUB720:IFI$=""THEN2560:ELSEIFC0=0ANDASC(I$)>64ANDASC(I$)<91THENI$=CHR$(ASC(I$)OR128)
3470 Y=0:DO:Y=Y+1:LOOPUNTILME$(Y,0)=I$ORY>Z1:IFY>Z1THEN2560
3480 IFC0THEN3610:ELSEPRINT"{cyan}New command key or [RETURN] to keep: ";:GOSUB720:IFI$=""THEN3510
3490 IFC0=0ANDASC(I$)>64ANDASC(I$)<91THENI$=CHR$(ASC(I$)OR128)
3500 I=0:DO:I=I+1:LOOPUNTILME$(I,0)=I$ORI=Z1:IFME$(I,0)=I$THENPRINT"{down}Command key already used.":GOTO2560:ELSEME$(Y,0)=I$
3510 IFC0THEN3610:ELSEPRINT"{cyan}Description:":I$=ME$(Y,2):GOSUB1990:ME$(Y,2)=I$
3520 PRINT"Access: ";:I$=ME$(Y,1):GOSUB2440:ME$(Y,1)=I$:GOTO3610
3530 C0=0:PRINT:PRINT"Is this an op-code subroutine (y/n)? ";:GETKEYA$:IFINSTR("Yy",A$)>0THENC0=1:PRINT"Yes":ELSEPRINT"No."
3540 PRINT"{down}Command key: ";:GOSUB720:IFI$=""THEN2560:ELSEIFC0=0ANDASC(I$)>64ANDASC(I$)<91THENI$=CHR$(ASC(I$)+128)
3550 I$=LEFT$(I$,1):X=0:DO:X=X+1:LOOPUNTILX>Z1ORI$=ME$(X,0):IFX<=Z1ANDI$=ME$(X,0)THENPRINT"{down}Command key already used.":GOTO2560
3560 X=0:DO:X=X+1:LOOPUNTILME$(X,0)=""ORX>Z1
3570 Y=X:ME$(Y,0)=I$:IFC0THENME$(Y,2)="(subroutine)":ELSEPRINT"Description: ";:GOSUB720:ME$(Y,2)=I$
3580 C1=0:IFI$=""THEN3670
3590 I$="{f6}{cyan}Toggle all access levels that may use{f7}this command to reverse.":GOSUB2170
3600 PRINT"Access: ";:I$="00000000000000000000000000":GOSUB2440:ME$(Y,1)=I$
3610 C1=0:IFME$(Y,3)=""ORY>Z1THEN3670
3620 I$=ME$(Y,3):T$=ME$(Y,4):DO:C1=C1+1:OP(C1)=VAL(I$):GOSUB3640:X=INSTR(I$,"{f4}"):IFXTHENI$=RIGHT$(I$,LEN(I$)-X)
3630 LOOPUNTILX=0:GOTO3670
3640 IFDX(OP(C1))=0THENRETURN
3650 FORX=1TODX(OP(C1)):IFT$=""THENDF$(C1,X)="*":NEXTX:RETURN:ELSEI=INSTR(T$,"{f4}"):IFI=0THENDF$(C1,X)=T$:T$="":NEXTX:RETURN
3660 DF$(C1,X)=LEFT$(T$,I-1):T$=RIGHT$(T$,LEN(T$)-I):NEXTX:RETURN
3670 WINDOW0,1,PEEK(238),24,1:PRINT"{clear}{down}{cyan}Command key: ";:I$=ME$(Y,0):MAX=1:GOSUB4480
3680 PRINT"Description: ";:I$=ME$(Y,2):MAX=80:GOSUB4480:X=Y:GOSUB3220:PRINT"{home}{down*3}"CHR$(27)"@{cyan}Access lvls: "I$
3690 FORI=0TOSGN(PEEK(215)):PRINT"{cm @*40}";:NEXTI
3700 PRINT"{down*15}":FORI=0TOSGN(PEEK(215)):PRINT"{cm t*40}";:NEXTI
3710 PRINT"[A]dd        [D]elete     [E]dit        [I]nsert     [*] Done     [ESC] Abort";:WINDOW0,6,PEEK(238),21,1:POKE2603,8:PRINTCHR$(27)"e"CHR$(27)"m";
3720 LO=1:HI=C1:LN=1:C=1:IFHI>16THENHI=16
3730 IFC1<1THEN3890
3740 POKE2603,8:PRINTCHR$(27)"e{home}{cyan}";:FORX=LOTOHI:GOSUB3750:PRINTT$:NEXTX:IFHI<16THENPRINTCHR$(27)"@";:GOTO3770:ELSEGOTO3770
3750 T$=RIGHT$("000"+MID$(STR$(OP(X)),2),4)+"   "+MID$(DX$(OP(X)),10)+CHR$(27)+"q{cyan}":RETURN
3770 GOSUB54:PRINTTAB(5)"{pink}o"
3780 GETKEYA$:ONINSTR("{down}{up}aedi*"+CHR$(27),A$)GOTO3810,3850,3890,4180,4190,4230,4280,4340:GOTO3780
3810 IFC=C1THEN3780
3820 GOSUB54:PRINTTAB(5)" "
3830 IFLN=16THENPRINTCHR$(27)"v":X=C+1:GOSUB3750:GOSUB54:PRINT"{cyan}"T$:LO=LO+1:HI=HI+1:LN=15
3840 C=C+1:LN=LN+1:GOSUB54:PRINTTAB(5)"{pink}o":GOTO3780
3850 IFC=1THEN3780
3860 GOSUB54:PRINTTAB(5)" "
3870 IFLN=1THENPRINTCHR$(27)"w":X=C-1:GOSUB3750:GOSUB54:PRINT"{cyan}"T$:LO=LO-1:HI=HI-1:LN=2
3880 C=C-1:LN=LN-1:GOSUB54:PRINTTAB(5)"{pink}o":GOTO3780
3890 W1=C1+1:IFW1>50THEN3740
3900 FORX=1TO5:DF$(W1,X)="*":NEXTX:GOSUB3930:C1=C1+1:C=C1:HI=C1:LO=C1-15:IFLO<1THENLO=1
3910 LN=C1:IFLN>16THENLN=16
3920 GOTO3740
3930 X=1:PRINT"{clear}{down}{cyan}Select op-code: "
3940 PRINTUSING"{home}{down}{right*16}####";X:PRINT"{up}"TAB(40)MID$(DX$(X),10)CHR$(27)"q"
3950 GETKEYA$:IFA$=CHR$(13)THENOP(W1)=X:GOTO4060
3960 IFINSTR("{down}+",A$)THEN4010
3970 IFINSTR("{up}{right}-",A$)THEN4030
3975 IFVAL(A$)ORA$="0"THENX=(VAL(A$)*100)+1:IFX>H1-1THENX=1:GOTO3940:ELSE3940
3980 IFA$=CHR$(27)ANDC1>0THENPRINT"{clear}{cyan}":GOTO3740
3990 IFA$=CHR$(27)THEN4340
4000 GOTO3950
4010 IFX>H1-1THENX=1:GOTO3940
4020 X=X+1:IFDX$(X)=""THENX=INT((X+100)/100)*100:GOTO4010:ELSE3940
4030 IFX<2THENX=H1+1
4040 X=X-1:IFDX$(X)=""THENX=X-100:DO:X=X+1:LOOPUNTILDX$(X)="":GOTO4030:ELSE3940
4050 PRINT"{clear}{down}{cyan}"MID$(DX$(OP(W1)),10)
4060 GOSUB930:V=0:FORT=1TO9:X=VAL(MID$(DX$(OP(W1)),T,1)):IFX=0THENX=(ASC(MID$(DX$(OP(W1)),T,1))AND127)-55
4065 IFX<=0THENNEXTT:GOTO4080
4070 V=V+1:PRINT"{yellow}"CHR$(192+V)") {white}"OT$(X)TAB(20)": {cyan}";:I$=DF$(W1,V):GOSUB4480:NEXTT
4080 IFV=0THENPRINT"{clear}{cyan}":RETURN
4090 PRINT"{down}{cyan}Edit which? ";
4100 GETKEYA$:IFA$=CHR$(13)THENPRINT"{clear}{cyan}":RETURN
4110 X=(ASC(A$)AND127)-64:IFX<1ORX>VTHEN4100
4120 PRINTCHR$(192+X):PRINT:V=X:I=VAL(MID$(DX$(OP(W1)),X,1)):IFI=0THENI=(ASC(MID$(DX$(OP(W1)),X,1))AND127)-55:IFI<=0THEN4050
4140 IF(W1=203ORW1=204)ANDI=2THENGOSUB3430:GOTO4170
4150 ONIGOSUB3270,3420,3290,3310,3420,3370,3360,3330,3400,3426,3423,3325
4160 IFI$=""THEN4050
4170 DF$(W1,V)=I$:GOTO4050
4180 W1=C:GOSUB4050:GOTO3740
4190 IFC1=0THEN3780
4200 IFC1=1THENC1=0:PRINT"{clear}{down}{white}All op-codes are deleted.":SLEEP2:GOTO3720
4210 FORX=CTOC1:OP(X)=OP(X+1):FORI=0TO4:DF$(X,I)=DF$(X+1,I):NEXTI:NEXTX:C1=C1-1:C=1:LO=1:HI=C1:LN=1:IFHI>16THENHI=16
4220 GOTO3740
4230 W1=C1+1:IFW1>50THEN3740
4240 FORX=1TO5:DF$(W1,X)="*":NEXTX:GOSUB3930
4250 FORX=W1TOCSTEP-1:OP(X+1)=OP(X):FORI=0TO4:DF$(X+1,I)=DF$(X,I):NEXTI:NEXTX:W1=W1+1:OP(C)=OP(W1):FORX=0TO4:DF$(C,X)=DF$(W1,X):NEXTX
4260 HI=HI+1:IFHI-LO>15THENHI=LO+15
4270 C1=C1+1:GOTO3740
4280 PRINT"{clear}{down}{white}Standby, assembling data fields..."
4290 IFC1=0THEN4340
4300 ME$(Y,3)="":ME$(Y,4)="":FORX=1TOC1:ME$(Y,3)=ME$(Y,3)+MID$(STR$(OP(X)),2)+"{f4}":T=DX(OP(X)):IFT=0THEN4320
4310 FORI=1TOT:ME$(Y,4)=ME$(Y,4)+DF$(X,I)+"{f4}":NEXTI
4320 NEXTX:ME$(Y,3)=LEFT$(ME$(Y,3),LEN(ME$(Y,3))-1):IFLEN(ME$(Y,4))<>0THENME$(Y,4)=LEFT$(ME$(Y,4),LEN(ME$(Y,4))-1)
4330 IFY>Z1THENZ1=Z1+1
4340 PRINTCHR$(27)+"l":WINDOW0,1,PEEK(238),24,1:GOTO2560
4350 I$="{ct k}Enter a lowercase letter to signify{f7}a command subroutine.{ct k}":GOSUB2170:PRINT"Insert before which command? ";:GOSUB720:IFI$=""THEN2560
4360 X=0:DO:X=X+1:LOOPUNTILX>Z1ORME$(X,0)=I$:IFX>Z1THENPRINT"{down}Command "I$" not found.":GOTO2560
4370 FORY=Z1TOXSTEP-1:FORT=0TO4:ME$(Y+1,T)=ME$(Y,T):NEXTT:NEXTY:FORI=0TO4:ME$(X,I)="":NEXTI
4380 Z1=Z1+1:GOTO3530
4390 I$="{ct k}Enter a lowercase letter to delete{f7}a command subroutine.{ct k}":GOSUB2170:PRINT"Delete which command? ";:GOSUB720:IFI$=""THEN2560
4400 X=0:DO:X=X+1:LOOPUNTILME$(X,0)=I$ORX>Z1:IFX>Z1THENPRINT"{down}Command '"I$"' not found.":GOTO2560
4410 PRINT"Working...";:FORY=XTOZ1:FORT=0TO4:ME$(Y,T)=ME$(Y+1,T):NEXTT:NEXTY:Z1=Z1-1:PRINT:GOTO2560
4420 PRINT:PRINT"{cyan}DOS Command ({white}"MID$(STR$(U1),2)","MID$(STR$(D1),2)"{cyan}): ";:GOSUB720:IFI$=""THEN2560
4430 CLOSE15:OPEN15,U1,15:PRINT#15,I$:PRINT:PRINT"{right}Status: {yellow}";:GOSUB940:PRINTD$:CLOSE15:GOTO4420
4480 O$=I$:IFO$<>""THENPOKE251,MAX:SYS4864:PRINT:RETURN:ELSEI$=" ":GOTO4480
4490 IFPEEK(215)THENWINDOW0,1,39,24:RETURN:ELSEWINDOW0,X,39,24:RETURN
4500 PRINT"Insert "CHR$(34)"sys.variables"CHR$(34)" disk.":PRINT"Drive, Device/lu = 8,0{left*3}";:OPEN1,0:INPUT#1,X,Y:CLOSE1:PRINT
4510 PRINT"{down}Loading...";:CLOSE2:CLOSE15:OPEN15,X,15:OPEN2,X,2,STR$(Y)+":sys.variables,s,r":INPUT#15,A:IFA>0THENPRINT"Not found.":CLOSE2:CLOSE15:RETURN
4520 FORX=1TO12:INPUT#2,D(X,0),D(X,1):NEXTX:FORX=1TO18:SYS8222:M$(X)=I$:NEXTX:FORX=1TO7:SYS8222:MT$(X)=I$:NEXTX:FORX=1TO26:INPUT#2,CT(X,0),CT(X,1),CT(X,2):NEXTX
4530 SYS8222:F$(0)=I$:INPUT#2,CC$:CLOSE2:CLOSE15:RETURN
4600 I=INSTR(I$,","):IFI=0THENU=8:D=0:RETURN
4610 X=VAL(LEFT$(I$,I)):Y=VAL(MID$(I$,I+1)):RETURN
4620 I$=MID$(STR$(X),2)+","+MID$(STR$(Y),2):RETURN
5000 IFPEEK(238)=79THENWINDOW48,1,79,24,1:ELSEWINDOW5,1,39,24,1
5010 PRINT"{reverse on}{cyan}{cm t*23}"
5020 PRINT"{reverse on} [L]oad Configuration  ":PRINT"{reverse on} [S]ave Configuration  "
5030 PRINT"{reverse on} [C]olor Cycle         ":PRINT"{reverse on} [D]rive Configuration "
5040 PRINT"{reverse on} [M]odem Settings      "
5050 PRINT"{reverse on} [V] System Variables  ":PRINT"{reverse on} [T]ime/Call Limits    "
5060 PRINT"{reverse on}{cm p*23}"
5070 GETKEYA$:A$=CHR$(ASC(A$)AND127):I=INSTR("cdmvtls",A$):IFITHENX=11:GOSUB4490:ONIGOTO5090,5140,5250,5390,5540,5560,5570
5080 WINDOW0,1,PEEK(238),24,1:GOTO340
5090 PRINT"{clear}":FORX=1TO8:A$=MID$(CC$,X,1):Y=INSTR("{white}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}",A$)
5100 PRINTTAB(5)A$MID$("WHITE RED   CYAN  PURPLEGREEN BLUE  YELLOWORANGEBROWN LT REDD GREYM GREYLT GRNL BLUEL GREY",(Y*6)-5,6)+CHR$(27)"q":NEXTX
5110 PRINT"{down*2}{cyan}Press the color to change: "CHR$(27)"q";:GETKEYA$:X=INSTR(CC$,A$):IFX=0THENPRINT"{clear}";:GOTO5530
5120 PRINT"                     Change to: ";:GETKEYB$:IFINSTR("{white}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}",B$)=0THENPRINT"{clear}";:GOTO5530
5130 MID$(CC$,X,1)=B$:GOTO5090
5140 PRINT"{clear}{down}Drive configuration{down}":GOSUB5520
5150 PRINT"{yellow}System prg.files : {white}";:X=D(1,0):Y=D(1,1):GOSUB4620:GOSUB2010:GOSUB4600:D(1,0)=X:D(1,1)=Y
5160 PRINT"{up}{yellow}System data files: {white}";:X=D(2,0):Y=D(2,1):GOSUB4620:GOSUB2010:GOSUB4600:D(2,0)=X:D(2,1)=Y
5170 PRINT"{up}{yellow}Voting topics    : {white}";:X=D(3,0):Y=D(3,1):GOSUB4620:GOSUB2010:GOSUB4600:D(3,0)=X:D(3,1)=Y
5180 PRINT"{up}{yellow}Temp usage drive : {white}";:X=D(4,0):Y=D(4,1):GOSUB4620:GOSUB2010:GOSUB4600:D(4,0)=X:D(4,1)=Y
5190 PRINT"{up}{yellow}User data files  : {white}";:X=D(5,0):Y=D(5,1):GOSUB4620:GOSUB2010:GOSUB4600:D(5,0)=X:D(5,1)=Y
5195 PRINT"{up}{yellow}User definable   : {white}";:X=D(12,0):Y=D(12,1):GOSUB4620:GOSUB2010:GOSUB4600:D(12,0)=X:D(12,1)=Y
5200 PRINT"{up}{yellow}Email drive      : {white}";:X=D(6,0):Y=D(6,1):GOSUB4620:GOSUB2010:GOSUB4600:D(6,0)=X:D(6,1)=Y
5205 PRINT"{up}{yellow}Menus drive      : {white}";:X=D(10,0):Y=D(10,1):GOSUB4620:GOSUB2010:GOSUB4600:D(10,0)=X:D(10,1)=Y
5207 PRINT"{up}{yellow}U/D descriptions : {white}";:X=D(11,0):Y=D(11,1):GOSUB4620:GOSUB2010:GOSUB4600:D(11,0)=X:D(11,1)=Y
5210 PRINT"{up}{yellow}Feedback drive   : {white}";:X=D(7,0):Y=D(7,1):GOSUB4620:GOSUB2010:GOSUB4600:D(7,0)=X:D(7,1)=Y:PRINT"{clear}";:GOTO5530
5250 PRINT"{clear}":OPEN1,0:GOSUB5520
5260 PRINT"0 = 1670, 1 = 1670, 2 = Hayes":PRINT"3 = 1650, 4 = 1660: Type: ";M$(1)+"{left}";
5270 INPUT#1,M$(1):PRINT
5280 W1=0:W2=0:W3=0:W4=0:IFVAL(M$(1))=3THENW2=32:W3=2:W4=6
5290 IFVAL(M$(1))=4THENW1=32:W4=38
5300 PRINT"{down}Hangup bit (usually 16)":PRINT"Hangup bit: "+M$(5)+CHR$(13)+"{up}{right*12}";:INPUT#1,M$(5):PRINT
5310 PRINT"{down}Hangup poke 56577 (should be"+STR$(W1)+")":PRINT"Hangup poke: "+M$(6)+CHR$(13)+"{up}{right*13}";:INPUT#1,M$(6):PRINT
5320 PRINT"{down}Hangup poke 56579 (should be"+STR$(W2)+")":PRINT"Hangup poke: "+M$(7)+CHR$(13)+"{up}{right*13}";:INPUT#1,M$(7):PRINT
5330 PRINT"{down}Pickup poke 56577 (should be"+STR$(W3)+")":PRINT"Pickup poke: "+M$(8)+CHR$(13)+"{up}{right*13}";:INPUT#1,M$(8):PRINT
5340 PRINT"{down}Pickup poke 56579 (should be"+STR$(W4)+")":PRINT"Pickup poke: "+M$(9)+CHR$(13)+"{up}{right*13}";:INPUT#1,M$(9):PRINT
5350 PRINT"{down}Idle/Max baud rate: ";M$(10)+CHR$(13)+"{up}{right*20}";:INPUT#1,M$(10):PRINT
5360 IFVAL(M$(1))<3THENPRINT"{down}BBS Modem initialization"+CHR$(13)+": "MT$(2)CHR$(13)+"{up}{right*2}";:INPUT#1,MT$(2):PRINT
5370 IFVAL(M$(1))<3THENPRINT"{down}ZapTerm initialization"+CHR$(13)+": "MT$(3)CHR$(13)+"{up}{right*2}";:INPUT#1,MT$(3):PRINT
5380 CLOSE1:PRINT"{clear}";:GOTO5530
5390 PRINT"{clear}":OPEN1,0:GOSUB5520
5400 PRINT"System name: ";:I$=F$(0):GOSUB2010:F$(0)=I$
5410 PRINT"Extended log default for new":PRINT"users (0=off, 1=on): "M$(2)"{left}";:INPUT#1,M$(2):PRINT
5420 PRINTCHR$(27)"s{down}Maintenance hour (1-24;24=midnight): ";:I$=M$(3):GOSUB2010:M$(3)=I$
5430 PRINT"All system upcase flag":PRINT"(0=off, 1=on): "M$(4)"{left}";:INPUT#1,M$(4):PRINT
5440 PRINT"{down}Number of block credits to":PRINT"give new users: "M$(11)CHR$(13)"{up}"TAB(16);:INPUT#1,M$(11):PRINT
5450 PRINT"{down}Number of system credits to":PRINT"give new users: "M$(12)CHR$(13)"{up}"TAB(16);:INPUT#1,M$(12):PRINT
5460 PRINT"{down}Default weed protect for new":PRINT"users (0=off, 1=protected): "M$(13)"{left}";:INPUT#1,M$(13):PRINT
5480 W1=VAL(M$(15)):PRINT"{down}Max users (0-500): "M$(15)CHR$(13)"{up}"TAB(19);:INPUT#1,M$(15):PRINT
5490 PRINT"{down}System credits awarded per":PRINT"response: "M$(16)CHR$(13)"{up}"TAB(10);:INPUT#1,M$(16):PRINT
5495 PRINT"{down}Enter access levels":PRINT"for anonymous option.":PRINT"=>";:I$=MT$(7):GOSUB2440:MT$(7)=I$
5500 PRINT"{down}Password mask character: "MT$(1)"{left}";:INPUT#1,MT$(1):PRINT
5501 GOSUB5520:PRINT"{down}Name of main menu: ";:I$=MT$(4):GOSUB2010:MT$(4)=I$
5502 PRINT"Sysop menu: ";:I$=MT$(5):GOSUB2010:MT$(5)=I$
5503 PRINT"Ascii mode system color: ";:I$=MT$(6):GOSUB2010:MT$(6)=I$
5504 PRINT"Number of ASCII title screens: ";:I$=M$(17):GOSUB2010:M$(17)=I$:IFVAL(M$(17))=0THEN5504
5505 PRINT"Number of COLOR title screens: ";:I$=M$(18):GOSUB2010:M$(18)=I$:IFVAL(M$(18))=0THEN5505
5510 CLOSE1:PRINT"{clear}";:GOTO5530
5520 POKE2603,0:PRINTCHR$(27)"f";:RETURN
5530 POKE2603,8:PRINTCHR$(27)"e{clear}";:IFPEEK(238)=39THEN5000:ELSE5070
5540 PRINT"{clear}{down}   Max calls, time limit, idle time":OPEN1,0:PRINT:GOSUB5520
5550 FORX=1TO26:PRINTCHR$(X+192)"        "CT(X,0)","CT(X,1)","CT(X,2):PRINT"{up}{right*10}";:INPUT#1,CT(X,0),CT(X,1),CT(X,2):PRINT:NEXTX:CLOSE1:PRINT"{clear}";:GOTO5530
5560 PRINT:GOSUB5520:GOSUB4500:PRINT"{down}";:GOTO5530
5570 PRINT:GOSUB5520:GOSUB5580:PRINT"{down}";:GOTO5530
5580 PRINT"Insert disk containing "CHR$(34)"sys.variables"CHR$(34):PRINT"Drive, Device/lu = 8,0{left*3}";:OPEN1,0:INPUT#1,X,Y:CLOSE1:PRINT
5590 CLOSE15:OPEN15,X,15:PRINT#15,"s"+CHR$(Y)+":sys.variables"
5600 PRINT"{down}Saving...";:CLOSE2:OPEN2,X,2,STR$(Y)+":sys.variables,s,w":INPUT#15,A:IFA>0THENPRINT"Error.":SLEEP2:CLOSE2:CLOSE15:RETURN
5610 FORX=1TO12:PRINT#2,D(X,0):PRINT#2,D(X,1):NEXTX:FORX=1TO18:PRINT#2,M$(X):NEXTX:FORX=1TO7:PRINT#2,MT$(X):NEXT
5620 FORX=1TO26:PRINT#2,CT(X,0):PRINT#2,CT(X,1):PRINT#2,CT(X,2):NEXTX:PRINT#2,F$(0)
5630 PRINT#2,CC$:CLOSE2:CLOSE15:PRINT"done.":RETURN
5640 IFPEEK(238)=79THENWINDOW45,1,79,24,1:ELSEWINDOW5,1,39,24,1
5650 PRINT"{cyan}{reverse on}{cm t*31}"
5660 PRINT"{reverse on} [F]unction key editor         "
5670 PRINT"{reverse on} [A]SCII table editor          "
5680 PRINT"{reverse on} [C]opy program                "
5690 PRINT"{reverse on} [H]ardcopy userfiles          "
5700 PRINT"{reverse on}{cm p*31}"
5710 GETKEYA$:A$=CHR$(ASC(A$)AND127):I=INSTR("fach",A$):IFITHENX=7:GOSUB4490:ONIGOTO5720,5930,5940,6100:ELSEWINDOW0,1,PEEK(238),24,1:GOTO340
5715 POKE2603,8:PRINTCHR$(27)"e{clear}";:IFPEEK(238)=39THEN5640:ELSE5710
5720 GOSUB5520:I=255:FORX=1TO10:I=I-LEN(F$(X)):NEXTX:PRINT"{clear}{cyan}{down}Function keys:{white}"STR$(I)" {cyan}bytes free.{down}"
5725 MAX=34:FORX=1TO8:PRINT"{white}[{cyan}"MID$(STR$(X),2)"{white}]{yellow}= {white}";:I$=F$(X):GOSUB4480:NEXTX:MAX=31
5726 PRINT"{yellow}S{white}[{cyan}T{white}]{yellow}OP= {white}";:I$=F$(9):GOSUB4480:PRINT"{white}[{cyan}H{white}]{yellow}ELP= {white}";:I$=F$(10):GOSUB4480
5730 GOSUB930:PRINT"{cyan}Edit which function key (1-8,T,H,L,S)? ";:GETKEYA$:T=INSTR("12345678thsl",CHR$(ASC(A$)AND127)):IFT<1THENPRINT"{clear}";:GOTO5710
5735 PRINTA$:IFT>10THENON(T-10)GOTO5800,5900:ELSEI$=F$(T):I=I+LEN(I$)
5740 GOSUB930:GOSUB2010:IFLEN(I$)<=ITHENF$(T)=I$:GOTO5720:ELSEPRINT"{pink}Not enough space in fkey buffer":SLEEP2:PRINT"{home}{down*15}"CHR$(27)"@{cyan}";:GOTO5740
5800 PRINT"{down}Insert disk containing "CHR$(34)"sys.misc data"CHR$(34):PRINT"Drive, Device/lu = 8,0{left*3}";:OPEN1,0:INPUT#1,X,Y:CLOSE1:PRINT
5810 DCLEARU(X):PRINT"{down}Saving...";:OPEN2,X,2,STR$(Y)+":sys.misc data":RECORD#2,2:A$="":FORX=1TO10:A$=A$+F$(X)+CHR$(13):NEXTX
5820 PRINT#2,A$;:PRINT"done.":CLOSE2:GOTO5720
5900 I$="sys.misc data":GOSUB6010
5910 DCLEARU(X):PRINT"{down}Loading...";:OPEN2,X,2,STR$(Y)+":sys.misc data":RECORD#2,2:FORX=1TO10:SYS8222:F$(X)=I$
5920 NEXTX:PRINT"done.":CLOSE2:GOTO5720
5930 I$="bbs.ascii edit":GOSUB6000:IFETHENPRINT"{clear}";:GOTO5710:ELSERUN(I$),U(X),D(Y)
5940 I$="bbs.copy":GOSUB6000:IFETHENPRINT"{clear}";:GOTO5710:ELSERUN(I$),U(X),D(Y)
6000 E=0:PRINT"{pink}Note: {white}This function will destroy any":PRINT"      data currently in memory.":PRINT"{down}{cyan}Continue (y/n)? {reverse on} {reverse off}{left}";:GETKEYA$
6005 IFA$="y"THENPRINT"Yes":ELSEPRINT"No.":E=1:RETURN
6010 E=0:PRINT"{down}{cyan}Insert disk containing "CHR$(34)I$CHR$(34):PRINT"Drive, Device/lu = 8,0{left*3}";:OPEN1,0:INPUT#1,X,Y:CLOSE1:PRINT:PRINT"{clear}";:RETURN
6100 I$="sys.userfiles":GOSUB6010:OPEN2,X,2,MID$(STR$(Y),2)+":sys.userfiles":OPEN4,4,7
6105 PRINT#4,"ID#  HANDLE            REAL NAME         PHONE NUMBER   ACS E8WS?X#BC"
6107 PRINT#4,"---  ----------------  ----------------  -------------  --- ---------"
6110 FORI=1TOVAL(M$(15)):RECORD#2,I:SYS8222:IFI$="^"ORI$="{pound}"THEN6130
6115 LN$(995)=I$:SYS8222:FORX=996TO999:SYS8222:LN$(X)=I$:NEXTX:SYS8222:FORX=1TO4:GET#2,A$:NEXTX:SYS8222:LN$(1000)=I$
6120 PRINT#4,USING"###  ################  ################  ##############  #  #########";MID$(STR$(I),2),LN$(995),LN$(996),LN$(997),LN$(998),LN$(999),LN$(1000)
6130 IFI$="{pound}"THENI=1E99
6140 NEXTI:CLOSE2:CLOSE4:PRINT"{clear}";:GOTO5710
