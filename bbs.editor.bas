!--------------------------------------------------
!- Monday, May 15, 2017 12:16:20 AM
!- Import of : 
!- c:\src\zelch128\bbs.editor.prg
!- Unknown Machine
!--------------------------------------------------
10 U=PEEK(186):CLOSE8:CLOSE2:CLOSE15:DIMLN$(1001),MD$(10),ME$(50,4),MH$(100),DX$(500),DX(500),OP(50),DF$(50,5),OT$(10),D(9,1),MT$(18),CT(26,1),F$(8)
20 PRINT"{clear}{ct n}Standby, reading data...{down}":OPEN15,U,15:OPEN2,U,2,"0:sys.variables,s,r":INPUT#15,A:IFA=0THENGOSUB4520:GOTO30:ELSECLOSE2:CLOSE15:GOSUB4500
30 FAST:IFA=0THEN50:ELSEFORX=1TO9:D(X,0)=8:D(X,1)=0:NEXTX
40 FORX=1TO16:MT$(X)="0":NEXTX:MT$(10)="1200":MT$(17)="X":MT$(18)="e0m0q0v0x1s0=1":FORX=1TO26:CT(X,0)=X:CT(X,1)=45:NEXTX:CC$="{light green}{cyan}{light blue}{blue}{purple}{red}{pink}{yellow}"
50 C=1:U=8:U1=8:W$(0)="off":W$(1)="on ":FORX=1TO6:READM$(X):NEXTX:FORX=1TO10:READOT$(X):NEXTX
60 F1$="(none)":F2$="(none)":GOSUB2290
70 READA,B:IFA>0THENFORX=ATOB:READDX$(X),DX(X):NEXTX:GOTO70
80 DATA"INFORMATION","SEQ EDITOR","MENU EDITOR","UTILITIES","SYSTEM VARS","QUIT"
90 DATA"Filename/mask","Data","Device","Drive/LU","Link data","Topic/Subboard Letter","Misc 1","Misc 2","ID number(s)","Access flags"
100 DATA 1,37,"1011000000Load a menu",3,"1011000000Execute a module",3,"0000000000Logoff",0,"0000000010Send E-Mail",1
110 DATA "0000000000Re-read E-Mail",0,"0000000000Send feedback",0,"0000000000Read feedback",0,"1011100000Edit Seq file",4
120 DATA "1011100000Read Seq file",4,"0000001100Character prompt",2,"0100000000Ask for password",1,"0000000000Graphics toggle",0
130 DATA "0000000000Linefeeds toggle",0,"0100000000Check for graphics",1,"0000000001Check 1 access flag",1
140 DATA "0000000001Check for 100% flag match",1,"0100000000Page sysop",1,"0111000000Dos Command",3,"1011100000Directory",4
150 DATA "1011100000Read seq file w/codes",4,"0000000000Edit stats",0,"0000000000User list",0,"0000000000Relogon",0
160 DATA "0000000000Change one-liner",0,"0100000000Display 1 line of text",1,"0100000000Execute another opcode",1
170 DATA "0000000000Change baud rate",0,"1011000000Count files on disk",3,"1011000000Read menu w/hotkeys",3
180 DATA "0000000010Check for ID#",1,"0100001000Set a flag",2,"0100000000Jump on bad compare",1,"0100000000Add/Subtract system credits",1
190 DATA "0100000000Reset a counter variable",1,"0100000000Check system credits",1,"1011000000Run a basic program",3,"0000000000Load previous menu",0
200 DATA 101,109,"0100000000Select a subboard",1,"0000001100List subboards",2,"0100000000Read a message",1
210 DATA "0000000000Read new messages",0,"0000010000Global new",1,"0000000000Post a message",0,"0100000000Scan messages",1
220 DATA "0000000000Check current subop flag",0,"0000000000Edit current sub intro",0
230 DATA 201,209,"0100000000Select a UD sub",1,"0000001100List UD subs",2,"1111000000Upload file",4
240 DATA "1111000000Download file",4,"0000000000Multi-upload",0,"0000000000Multi-download",0,"0000000000Check UD subop access",0
250 DATA "0000000000Blocks free",0,"0000000000Edit current sub intro",0
260 DATA 301,305,"0000011000Create/Edit a topic",2,"0000010000Delete a topic",1
270 DATA "0000010000Reset topic results",1,"0000010000Vote on topic",1,"0000000000List topics",0
280 DATA 401,407,"0000000000View user info",0,"0000000000Edit user info",0,"0000010000Edit subboard data",1
290 DATA "0000010000Edit UD data",1,"0011000000ZOS",2,"0000000000Change time/date",0,"0000000000Add a user",0,0,0
300 IFPEEK(238)=79THEN370:ELSESLOW:POKE53280,0:POKE53281,0:FORX=1TO6
310 IFLEN(M$(X))<13THENM$(X)=M$(X)+" ":GOTO310
320 NEXTX:PRINT"{home*2}{clear}{ct n}{reverse on}{white} Zelch 128               System Editor "
330 POKE2603,8:PRINTCHR$(27)+"e";
340 IFPEEK(238)=79THEN380:ELSEPRINT"{home*2}{down}{white}":FORX=1TO6:IFC=XTHENPRINT"{cyan}{reverse on}";
350 PRINTM$(X)"{white}"
360 NEXTX:GOTO410
370 PRINT"{home*2}{clear}{ct n}{reverse on}{white}                                                                                "
380 PRINT"{home*2}{reverse on}{white}";:FORX=1TO6:IFC=XTHENPRINT"{cyan}{right}{cm g}";:ELSEPRINT"{right} ";
390 PRINTM$(X);:IFC=XTHENPRINT"{cm m}";:ELSEPRINT" ";
400 PRINT"{white}{right}";:NEXTX
410 GOSUB480:IFA$="{right}"ORA$="{down}"THENC=C+1:GOTO440
420 IFA$="{left}"ORA$="{up}"THENC=C-1:GOTO440
430 IFA$=CHR$(13)THEN460
440 IFC>6THENC=1:ELSEIFC<1THENC=6
450 GOTO340
460 IFPEEK(238)=39THENWINDOW0,1,39,24:PRINT"{reverse on}{clear}";:ELSEWINDOW0,1,79,24
470 ONCGOTO550,950,2550,5250,4540,630
480 GETA$:GOSUB485:IFA$=""THEN480:ELSERETURN
485 XX=JOY(2):IFXX<128AND(3)=0THENA$=CHR$(27):XX=255:RETURN
490 IFXX>127THENA$=CHR$(13)
500 IFXX=7THENA$="{left}"
510 IFXX=3THENA$="{right}"
520 IFXX=1THENA$="{up}"
530 IFXX=5THENA$="{down}"
540 RETURN
550 PRINT"{clear}{right}{cyan}{cm t*38}"
560 PRINT"{right}{reverse on}{cyan}  For updates write to:               "
570 PRINT"{right}{reverse on}{cyan}                                      "
580 PRINT"{right}{reverse on}{cyan}     Planet Ink/Elite Software        "
590 PRINT"{right}{reverse on}{cyan}     2968 W. Ina Rd. Suite #140       "
600 PRINT"{right}{reverse on}{cyan}     Tucson,{sh space}Az 85741                 "
610 PRINT"{right}{reverse on}{cyan}{cm p*38}"
620 DO:GOSUB480:PRINT"{clear}":GOTO340
630 X=15:IFPEEK(215)THENX=55
640 PRINT"{clear}{cyan}"TAB(X)"{cm t*24}"
650 PRINTTAB(X)"{reverse on} Press ESC to exit to   "
660 PRINTTAB(X)"{reverse on} basic, any other key   "
670 PRINTTAB(X)"{reverse on} to abort.              "
680 PRINTTAB(X)"{reverse on}{cm p*24}"
690 GOSUB480:IFXX>0THENA$=""
700 IFA$<>CHR$(27)THENPRINT"{clear}":GOTO340
710 I$="{home*2}{clear}{pink}Z{yellow}e{white}l{cyan}c{light blue}h {yellow}128 (C)1990{f7}Planet Ink/Elite Software!{cyan}":GOSUB2170:POKE2603,0:END
720 TH=0:IFWTHENT$=WW$:I$=WW$+"{ct c}":GOSUB2170:I$=T$:WW=0:WW$="":WC=79:ELSEI$=""
730 GETA$:SYS15628:IFA$=""THEN730
740 IFA$=CHR$(13)THENWW$="":WW=0:GOTO930
745 IFLEN(I$)>198THENI$=I$+"{ct c}":RETURN
750 IFA$="{home}"ANDRIGHT$(I$,1)="{home}"THEN730
760 I=INSTR("{ct z}{ct l}{ct h}",A$):IFITHENA$=MID$("{142}{143}{130}",I,1)
770 IFA$="{black}"THENCC=CC+1:IFCC>8THENCC=1:PRINTLEFT$(CC$,1);:GOTO820:ELSEIFA$="{black}"THENPRINTMID$(CC$,CC,1);:GOTO820
780 IFA$="{ct k}"THENPRINT:GOTO820
790 IFA$=CHR$(20)THEN860
800 IFA$=" "ORWW>10THENWW=0:ELSEWW=WW+1
810 PRINTA$;
820 SYS15628:POKE244,0:I$=I$+A$:IF((POS(1)<>39)AND(POS(1)<>WC))OR(W=0)THEN730
830 IFTH=1ANDPOS(1)=39THEN730
840 IFPOS(1)=39ANDPEEK(238)=79THENWW=LEN(I$)-WW:MID$(I$,WW)="{f7}":TH=1:WC=WW+39:GOTO730
850 WW$=RIGHT$(I$,WW):I$=LEFT$(I$,LEN(I$)-(WW+1))+"{f7}":FORX=1TOWW:PRINTCHR$(20);:NEXTX:CR=0:GOTO930
860 IFI$=""THEN730
870 WW=WW-1:IFWW<0THENWW=0
880 B$=RIGHT$(I$,1):IFB$="{down}"THENPRINT"{up}";:ELSEIFB$="{up}"THENPRINT"{down}";:ELSEIFB$="{right}"THENPRINT"{left}";:ELSEIFB$="{left}"THENPRINT"{right}";
890 IFASC(B$)<31ORASC(B$)>128ANDASC(B$)<159THENI$=LEFT$(I$,LEN(I$)-1):GOTO730
900 IFA$=CHR$(20)ANDLEN(I$)=1THENI$="":GOTO920
910 IFA$=CHR$(20)THENI$=LEFT$(I$,LEN(I$)-1):GOTO920
920 PRINTA$;:SYS15628:GOTO730
930 POKE2603,0:PRINTCHR$(27)+CHR$(70):RETURN
940 INPUT#15,A,B$,X,Y:D$=MID$(STR$(A),2)+", "+B$+","+MID$(STR$(X),2)+","+MID$(STR$(Y),2):RETURN
950 PRINT"{down}{reverse off}{yellow}Active: device"U"{left}, drive"D
960 GOSUB930:PRINT"{ct n}{cyan}({white}"+MID$(STR$(Z),2)+"{cyan} lines) Edit: ";:GOSUB720
970 ONINSTR("cdefiklmras",I$,1)GOTO1450,1630,1490,1680,1640,1610,1530,1320,1650,1480,1710
980 ONINSTR("CDEFIKLMRAS",I$,1)GOTO1450,1630,1490,1680,1640,1610,1530,1320,1650,1480,1710
990 ONINSTR("v#!%@VjJtT*",I$,1)GOTO1550,1770,1800,1860,1900,1550,1920,1920,1960,1960,1970
1000 IFI$="load"ORI$="LOAD"THEN1560
1010 IFI$="new"ORI$="NEW"THENZ=0:PRINT:PRINT"{ct o}Text deleted.":GOTO960
1020 IFI$="quit"ORI$="QUIT"THENCLOSE8:CLOSE2:PRINT"{clear}":GOTO330
1030 IFI$="save"ORI$="SAVE"THEN1580
1040 IFI$<>"$"THEN1150:ELSEPRINT:PRINT"Search pattern (default=*): ";:GOSUB720
1050 IFI$=""THENI$="*"
1060 IFLEN(I$)>16THENI$=LEFT$(I$,16)
1070 PRINT:PRINT"Device"U"{left}, Drive"D"{left}.":PRINT:CLOSE1:OPEN1,U,0,"$"+STR$(D)+":"+I$:GET#1,A$,A$
1080 GET#1,A$,A$:IFA$=""THEN1140
1090 GET#1,B$,C$:BL=ASC(B$+CHR$(0)):BH=ASC(C$+CHR$(0)):D$=MID$(STR$(BL+256*BH),2)+CHR$(32)
1100 PRINTD$;:GET#1,D$:IFD$<>""THEN1100
1110 PRINT:GETA$:IFA$<>" "ANDA$<>"{home}"THEN1080
1120 IFA$="{home}"THENDO:GETA$:LOOPUNTILA$<>"":GOTO1080
1130 PRINT"{down}Aborted."
1140 CLOSE1:GOTO960
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
1360 WW$="":PRINT:PRINT"Starting line number (1): ";:GOSUB720:IFVAL(I$)=0THENL1=1:ELSEL1=INT(VAL(I$)):IFL1<1THEN960
1370 IFL1>1000THENPRINT"Invalid line number.":GOTO1360
1380 PRINT"  Ending line number ("MID$(STR$(Z),2)"): ";:GOSUB720:IFVAL(I$)=0THENL2=Z:ELSEL2=INT(VAL(I$)):IFL2<1THEN960
1390 IFL2<L1ORL2>1000THENPRINT"Invalid line number.":PRINT:GOTO1380:ELSERETURN
1400 WW$="":PRINT:PRINT"Line number: ";:GOSUB720:IFI$=""ORVAL(I$)=0THEN960:ELSEL1=VAL(I$)
1410 IFL1<1ORL1>999THENPRINT"Invalid line number.":GOTO1400:ELSERETURN
1420 PRINT:PRINT"Last filename used was "I$
1430 PRINT"{down}File name: ";:GOSUB720:IFI$=""THENRETURN:ELSEIFLEN(I$)>16THENPRINT"Maximum 16 characters.":GOTO1430
1440 RETURN
1450 IFZ=1000THEN1350:ELSEPRINT"{white}{clear}{cyan}";:IFZ=0THEN1470:ELSEFORT=1TOZ:I$=LN$(T):GOSUB2170:NEXTT
1460 IFWTHENCR=1
1470 GOSUB720:IFI$=""ORI$="{f6}"THENPRINT"{up}";:GOTO960:ELSEZ=Z+1:LN$(Z)=I$:IFZ>999THEN960:ELSEGOTO1460
1480 IFZ=1000THEN1350:ELSEPRINT"{cyan}":GOTO1460
1490 IFZ=0THEN1350:ELSEGOSUB1400:IFL1>ZTHEN960
1500 T=L1:T$=RIGHT$(LN$(T),1):IFINSTR("{f6}{f7}",T$,1)=0THENT$=""
1510 PRINT:I$=LN$(T):GOSUB2170:GOSUB720:IFI$=""THENPRINT"{up}{cyan}(no changes)":GOTO960
1520 LN$(T)=I$+T$:WW$="":GOTO960
1530 IFZ=0THEN1350:ELSEGOSUB1360:PRINT:FORT=L1TOL2:A$=MID$(STR$(T),2)+">":MAX=79-LEN(A$):PRINTA$;:I$=LN$(T):GOSUB4480:GETA$:IFA$<>" "THENNEXTT
1540 GOTO960
1550 IFZ=0THEN1350:ELSEGOSUB1360:PRINT:FORT=L1TOL2:I$=LN$(T):GOSUB2170:NEXTT:GOTO960
1560 I$=F1$:GOSUB1420:IFI$=""THEN960:ELSEZ=0:F1$=I$:OPEN15,U,15:OPEN2,U,2,(STR$(D)+":"+F1$+",s,r"):GOSUB940:IFA>0THENCLOSE2:CLOSE15:GOTO960:ELSEPRINT"{clear}";
1570 GOSUB4440:T=GG:Z=Z+1:LN$(Z)=I$:GOSUB2170:IFT>0ORZ=1000THENGOSUB940:CLOSE2:CLOSE15:GOTO960:ELSEGOTO1570
1580 IFZ=0THEN1350:ELSEI$=F1$:GOSUB1420:IFI$=""THEN960:ELSEF1$=I$:OPEN15,U,15,"s"+STR$(D)+":"+F1$:GOSUB940:OPEN8,U,8,(STR$(D)+":"+F1$+",s,w"):PRINT"{clear}";
1590 FORT=1TOZ:PRINT#8,LN$(T):I$=LN$(T):GOSUB2170:NEXTT
1600 PRINT:PRINT"Drive status: ";:GOSUB940:PRINTD$:CLOSE8:CLOSE15:GOTO960
1610 IFZ=0THEN1350:ELSEGOSUB1360:PRINT"{down}Enter the string of text to insert on the lines:":GOSUB720:IFI$=""THEN960:ELSEIFLEN(I$)>20THENI$=LEFT$(I$,20)
1620 FORT=L1TOL2:LN$(T)=I$+LN$(T):NEXTT:GOTO960
1630 IFZ=0THEN1350:ELSEGOSUB1360:PRINT"{down}Standby...":FORT=L1TOL2:FORJ=L1TOZ:LN$(J)=LN$(J+1):NEXTJ:Z=Z-1:NEXTT:GOTO960
1640 IFZ=0ORZ=1000THEN1350:ELSEGOSUB1400:FORT=ZTOL1STEP-1:LN$(T+1)=LN$(T):NEXTT:Z=Z+1:GOTO960
1650 IFZ=0THEN1350:ELSEGOSUB1360:PRINT"{down}Number of characters to remove: ";:GOSUB720:IFI$=""THEN960:ELSEIFVAL(I$)<1THEN960
1660 FORT=L1TOL2:S=LEN(LN$(T)):IFS<VAL(I$)THENPRINT"{white}ERROR{cyan}: line"T" too short.":NEXTT:GOTO960
1670 LN$(T)=RIGHT$(LN$(T),(S-VAL(I$))):NEXTT:GOTO960
1680 PRINT:KEY:PRINT"{down}Edit which key (1-8): ";:GOSUB720:IFI$=""THEN960:ELSEIFVAL(I$)<1ORVAL(I$)>8THEN1680
1690 L1=VAL(I$):PRINT"{down}Enter new definition (use {arrow left} at end of line for CR):":GOSUB720:IFRIGHT$(I$,1)="{arrow left}"THENI$=LEFT$(I$,LEN(I$)-1)+CHR$(13)
1700 KEY(L1),I$:GOTO1680
1710 IFZ=0THEN1350:ELSEGOSUB1360:PRINT"{down}Enter string to replace: ";:GOSUB720:IFI$=""ORLEN(I$)>20THEN960
1720 X$=I$:PRINT" String to replace with: ";:GOSUB720
1730 PRINT"{down}Standby...":FORT=L1TOL2
1740 X=INSTR(LN$(T),X$):IFX=0THEN1760
1750 X=X-1:P$=LEFT$(LN$(T),X)+I$+RIGHT$(LN$(T),LEN(LN$(T))-(X+LEN(X$))):LN$(T)=P$:GOTO1740
1760 NEXTT:GOTO960
1770 PRINT:PRINT"Current Configuration:":PRINT"  Device"U"{left}, Drive"D"{left}."
1780 PRINT"{down}New device: ";:GOSUB720:IFI$=""THEN960:ELSEIFVAL(I$)<8ORVAL(I$)>30THENPRINT"{down}Invalid":GOTO1780:ELSEU=VAL(I$)
1790 PRINT"  drive/lu: ";:GOSUB720:IFI$=""THEN960:ELSEIFVAL(I$)<0ORVAL(I$)>254THENPRINT"{down}Invalid{down}":GOTO1790:ELSED=VAL(I$):GOTO960
1800 GOSUB1430:IFI$=""THEN960:ELSEOPEN15,U,15:OPEN2,U,2,(STR$(D)+":"+I$+",s,r"):GOSUB940:IFA>0THENCLOSE2:CLOSE15:PRINT"{down}Drive Status: "D$:GOTO960
1810 PRINT"{down}{pink}{reverse on}NO SCROLL{reverse off}{white}={cyan}PAUSE        {light blue}{reverse on}SPACE    {reverse off}{white}={cyan}ABORT{cyan}":PRINT
1820 GOSUB4440:T=GG:GOSUB2170:GETA$:IFA$=""ANDT=0THEN1820
1830 IFA$=" "THENT=1:PRINT:PRINT"Aborted."
1840 IFT>0THENCLOSE2:CLOSE15:GOTO960
1850 IFA$<>"{home}"THEN1820:ELSEDO:GETA$:LOOPUNTILA$<>"{home}"ANDA$<>"":GOTO1820
1860 IFZ=0THEN1350:ELSEGOSUB1360
1870 FORT=L1TOL2STEP2:IFT+1>L2THENL2=L2-1:GOTO1890
1880 LN$(T)=LN$(T)+" "+LN$(T+1):NEXTT
1890 FORT=L2TOL1STEP-2:FORJ=TTOZ:LN$(J)=LN$(J+1):NEXTJ:Z=Z-1:NEXTT:GOTO960
1900 PRINT:PRINT"{cyan}DOS Command ({white}";MID$(STR$(U),2);",";MID$(STR$(D),2);"{cyan}): ";:GOSUB720:IFI$=""THEN960
1910 CLOSE15:OPEN15,U,15:PRINT#15,I$:PRINT:PRINT"{right}Status: {yellow}";:GOSUB940:PRINTD$:CLOSE15:GOTO1900
1920 IFZ=0THEN1350:ELSEGOSUB1360:PRINT"{down}Standby...":FORT=L1TOL2:IFLEN(LN$(T))>78THEN1950
1930 P$="                                                                              "
1940 X=INT((80-LEN(LN$(T)))/2):MID$(P$,X)=LN$(T):LN$(T)=P$
1950 NEXTT:GOTO960
1960 W=ABS(W-1):PRINT"{down}Word wrap "W$(W):GOTO960
1970 IFZ=0THEN1350:ELSEGOSUB1400:IFL1>ZTHEN960
1980 I$=LN$(L1):GOSUB1990:LN$(L1)=I$:GOTO960
1990 PRINT:PRINT"Use the arrow keys on top of the keyboard to insert cursor movements."
2000 PRINT"The crsr keys next to the shift key will move the cursor through the text.{down}"
2010 IFI$<>""THENFORX=1TOLEN(I$):POKE244,1:PRINTMID$(I$,X,1);:NEXTX:POKE244,0:YY=1:FORX=1TOLEN(I$):PRINT"{left}";:NEXTX
2020 GETA$:SYS15628:IFA$=""THEN2020
2030 IFA$=CHR$(13)THENPRINT:PRINT:RETURN
2040 IFPEEK(212)>82ANDPEEK(212)<87THEN2140
2050 IF(A$="{left}"ORA$="{down}")ANDYY>1THENYY=YY-1:PRINT"{left}";:GOTO2020:ELSEIFA$="{left}"ORA$="{down}"THEN2020
2060 IF(A$="{right}"ORA$="{up}")ANDYY<=LEN(I$)THENYY=YY+1:PRINT"{right}";:GOTO2020:ELSEIFA$="{right}"ORA$="{up}"THEN2020
2070 IFA$<>CHR$(20)THEN2100
2080 IFLEN(I$)>0ANDYY>1THENPRINTA$;:YY=YY-1:ELSEGOTO2020
2090 I$=LEFT$(I$,YY-1)+MID$(I$,YY+1):GOTO2020
2100 IFA$<>CHR$(148)THEN2130
2110 IFLEN(I$)>199THEN2020:ELSEPRINTA$;:POKE244,0:POKE245,0
2120 I$=LEFT$(I$,YY-1)+" "+MID$(I$,YY):GOTO2020
2130 IFPEEK(211)=5THENA$=CHR$(ASC(A$)+128)
2140 IFYY>LEN(I$)ANDLEN(I$)<200THENI$=I$+A$:GOTO2160:ELSEIFLEN(I$)=>200THEN2020
2150 MID$(I$,YY,1)=A$
2160 POKE244,1:PRINTA$;:POKE244,0:POKE245,0:YY=YY+1:GOTO2020
2170 L1=0:IFRIGHT$(I$,1)="{f7}"THENL1=1
2180 I=INSTR(I$,"{black}"):IFI=0THEN2200:ELSECC=CC+1:IFCC>8THENCC=1
2190 MID$(I$,I,1)=MID$(CC$,CC,1):GOTO2180
2200 I=INSTR(I$,"{f6}"):IFITHENMID$(I$,I)=CHR$(13):GOTO2200
2210 I=INSTR(I$,"{ct k}"):IFITHENMID$(I$,I)=CHR$(13):GOTO2210
2220 I=INSTR(I$,"{f5}"):IFITHENMID$(I$,I)=CHR$(34):GOTO2220
2230 I=INSTR(I$,"{f7}"):IFI=0ANDL1>0THENPRINTI$;:RETURN
2240 IFI=0ANDRIGHT$(I$,1)="{ct c}"THENPRINTI$;:RETURN
2250 IFI=0ANDL1=0THENPRINTI$:RETURN
2260 PRINTLEFT$(I$,I-1);:I$=RIGHT$(I$,LEN(I$)-I)
2270 IFPEEK(238)=39ORPOS(1)>39THENPRINT:ELSEPRINT" ";
2280 GOTO2230
2290 MD$(1)="1":MD$(2)="CMD":MD$(3)="ASCII prompt: ":MD$(4)="Color prompt: "
2300 RETURN
2310 I$="{f6}Enter up to"+STR$(X)+" characters, press ESC{f7}when done.":GOSUB2170:I$=""
2320 GETA$:SYS15628:IFA$=""THEN2320
2330 B$="":SOUND 1,10000,1,,,,3:IFA$=CHR$(27)THENPRINT:RETURN
2340 IFA$=CHR$(13)THENB$="{f6}"
2350 IFA$=CHR$(34)THENB$="{f5}"
2360 IFA$<>CHR$(20)THEN2420
2370 IFI$=""THEN2320
2380 B$=RIGHT$(I$,1):IFB$="{down}"THENPRINT"{up}";:ELSEIFB$="{up}"THENPRINT"{down}";:ELSEIFB$="{right}"THENPRINT"{left}";:ELSEIFB$="{left}"THENPRINT"{right}";
2390 IFASC(B$)<31ORASC(B$)>128ANDASC(B$)<159THENI$=LEFT$(I$,LEN(I$)-1):GOTO2320
2400 IFLEN(I$)=1THENI$="":PRINTCHR$(20);:SYS15628:GOTO2320
2410 I$=LEFT$(I$,LEN(I$)-1):PRINTCHR$(20);:SYS15628:GOTO2320
2420 IFLEN(I$)=XTHEN2320:ELSEIFB$=""THENB$=A$
2430 I$=I$+B$:PRINTA$;:SYS15628:POKE244,0:POKE245,0:GOTO2320
2440 FORX=1TO26:IFMID$(I$,X,1)="1"THENPRINT"{reverse on}";
2450 PRINTCHR$(X+192)"{reverse off}";:NEXTX:FORX=1TO26:PRINT"{left}";:NEXTX:X=1
2460 SYS15628:GETA$:GOSUB485:IFA$=""THEN2460
2470 IFA$=CHR$(13)THENPRINT:RETURN
2480 IFA$="{right}"ORA$="{up}"THENX=X+1:GOTO2520
2490 IFA$="{left}"ORA$="{down}"THENX=X-1:GOTO2530
2500 MID$(I$,X,1)=MID$(STR$(ABS(VAL(MID$(I$,X,1))-1)),2):IFMID$(I$,X,1)="1"THENPRINT"{reverse on}";
2510 PRINTCHR$(X+192)"{reverse off}{left}";:IFA$<>" "THEN2460:ELSEX=X+1
2520 IFX>26THENX=26:GOTO2460:ELSEPRINT"{right}";:GOTO2460
2530 IFX<1THENX=1:GOTO2460:ELSEPRINT"{left}";:GOTO2460
2540 PRINT:I$="{white}ERROR{cyan}: Either no file in memory or{f7}max number of commands are used.":GOSUB2170:GOTO2560
2550 PRINT"{down}{reverse off}{yellow}Active: device"U1"{left}, drive"D1
2560 GOSUB930:PRINT"{ct n}{cyan}({white}"+MID$(STR$(Z1),2)+"{cyan} commands) Edit: ";:GOSUB720
2570 ONINSTR("v!#mxl*paeid",I$,1)GOTO2970,2980,3060,3090,3140,3190,3250,3260,3530,3450,4350,4390
2580 ONINSTR("V!#MXLPAEID@",I$,1)GOTO2970,2980,3060,3090,3140,3190,3260,3530,3450,4350,4390,4420
2590 IFI$="load"ORI$="LOAD"THEN2860
2600 IFI$="new"ORI$="NEW"THENZ2=0:Z1=0:GOSUB2290:PRINT:PRINT"{ct o}Menu cleared.":GOTO2560
2610 IFI$="quit"ORI$="QUIT"THENCLOSE8:CLOSE2:PRINT"{clear}":C=3:GOTO330
2620 IFI$="save"ORI$="SAVE"THEN2930
2630 IFI$<>"$"THEN2740:ELSEPRINT:PRINT"Search pattern (default=*): ";:GOSUB720
2640 IFI$=""THENI$="*"
2650 IFLEN(I$)>16THENI$=LEFT$(I$,16)
2660 PRINT:PRINT"Device"U1"{left}, Drive"D1"{left}.":PRINT:CLOSE1:OPEN1,U1,0,"$"+STR$(D1)+":"+I$:GET#1,A$,A$
2670 GET#1,A$,A$:IFA$=""THEN2730
2680 GET#1,B$,C$:BL=ASC(B$+CHR$(0)):BH=ASC(C$+CHR$(0)):D$=MID$(STR$(BL+256*BH),2)+CHR$(32)
2690 PRINTD$;:GET#1,D$:IFD$<>""THEN2690
2700 PRINT:GETA$:IFA$<>" "ANDA$<>"{home}"THEN2670
2710 IFA$="{home}"THENDO:GETA$:LOOPUNTILA$<>"":GOTO2670
2720 PRINT"{down}Aborted."
2730 CLOSE1:GOTO2560
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
2880 Z2=Z2+1:GOSUB4440:T=GG:MH$(Z2)=I$:GOSUB2170:IFT>0THENGOSUB940:CLOSE2:CLOSE15:GOTO2560
2890 IFI$<>"{ct a}"THEN2880:ELSEZ2=Z2-1
2900 PRINT:PRINT"{white}Loading menu data, standby...{down}":FORX=1TO4:GOSUB4440:MD$(X)=I$:NEXTX:Z1=0
2910 Z1=Z1+1:FORX=0TO4:GOSUB4440:T=GG:ME$(Z1,X)=I$:NEXTX
2920 PRINT"{cyan}Command: "ME$(Z1,0)"  ";:I$=ME$(Z1,2):MAX=67:GOSUB4480:IFT>0THENCLOSE2:CLOSE15:GOTO2560:ELSEGOTO2910
2930 IFZ1=0THEN2540:ELSEI$=F2$:GOSUB1420:IFI$=""THEN2560:ELSEF2$=I$:OPEN15,U1,15,"s"+STR$(D1)+":"+F2$:GOSUB940:OPEN8,U1,8,(STR$(D1)+":"+F2$+",s,w")
2940 PRINT"{clear}{down}{white}Saving menu text...{down}{cyan}":FORX=1TOZ2:PRINT#8,MH$(X):I$=MH$(X):GOSUB2170:NEXTX:PRINT#8,"{ct a}"
2950 PRINT:PRINT"{white}Saving menu data, standby...{down}":FORX=1TO4:PRINT#8,MD$(X):NEXTX
2960 FORX=1TOZ1:PRINT"{cyan}Command: "ME$(X,0)"  "ME$(X,2):FORY=0TO4:PRINT#8,ME$(X,Y):NEXTY:NEXTX:PRINT"{down}Drive status: ";:GOSUB940:PRINTD$:CLOSE8:CLOSE15:GOTO2560
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
3100 PRINT"other=command/routine to auto-execute":PRINT"{down}Old menu code: ";MD$(1):PRINT"     New code: ";:GOSUB720:IFI$=""THEN2560:ELSEMD$(1)=LEFT$(I$,1)
3110 IFMD$(1)="0"THENI$="{ct k}The text will not be displayed when the{f7}menu is loaded.":GOSUB2170:GOTO2560
3120 IFMD$(1)="1"THENI$="{ct k}The text will be automatically{f7}displayed when the menu is loaded.":GOSUB2170:GOTO2560
3130 I$="{f6}The command that will be automatically{f7}executed is: "+MD$(1):GOSUB2170:GOTO2560
3140 I$="{f6}The menu identifier is a 3 character{f7}code that is used to identify menus":GOSUB2170
3150 I$="when the extended log option is enabled.":GOSUB2170
3160 PRINT"{down}Current extended log identifier is: "MD$(2)
3170 PRINT"          Enter the new identifier: ";:GOSUB720:IFI$=""THEN2560
3180 IFLEN(I$)<>3THENPRINT"{down}Must be 3 characters.":GOTO3160:ELSEMD$(2)=I$:GOTO2560
3190 IFZ1=0THENGOSUB2540:ELSEFORX=1TOZ1:PRINT"{down}{cyan}Command key: {white}";:I$=ME$(X,0):MAX=1:GOSUB4480
3200 GOSUB3220:PRINT"{up}"TAB(40)"{cyan}Access: {yellow}"I$:PRINT"{cyan}Description: {white}";:I$=ME$(X,2):MAX=200
3210 GOSUB4480:GETA$:IFA$=" "THEN2560:ELSEIFA$<>"{home}"THENNEXTX:GOTO2560:ELSEDO:GETA$:LOOPUNTILA$<>"":NEXTX:GOTO2560
3220 I$="":FORH=1TO26:IFMID$(ME$(X,1),H,1)="1"THENI$=I$+CHR$(H+192):ELSEI$=I$+" "
3230 NEXTH:RETURN
3240 PRINT"{down}1) ASCII prompt or 2) GRFX prompt? ";:GETKEYA$:PRINTA$:WW=VAL(A$):RETURN
3250 GOSUB3240:WW=WW-1:IFWW<0ORWW>1THEN2560:ELSEI$=MD$(3+WW):GOSUB1990:MD$(3+WW)=I$:GOTO2560
3260 GOSUB3240:WW=WW-1:IFWW<0ORWW>1THEN2560:ELSEPRINT:I$=MD$(3+WW):GOSUB2170:C=WW:GOSUB720:WW=C:IFI$=""THEN2560:ELSEMD$(3+WW)=I$:GOTO2560
3270 PRINT"{cyan}filename/mask: ";:GOSUB720:IFI$=""ORI$="*"THENRETURN
3280 IFLEN(I$)>16THENPRINT"{up*2}{white}16 characters maximum.":GOTO3270:ELSERETURN
3290 PRINT"{cyan}Device number: ";:GOSUB720:IFI$=""ORI$="*"THENRETURN
3300 U2=VAL(I$):I$=MID$(STR$(U2),2):IFU2<8ORU2>30THENPRINT"{up*2}{white}Must be between 8 and 30.":GOTO3290:ELSERETURN
3310 PRINT"{cyan}Drive/LU     : ";:GOSUB720:IFI$=""ORI$="*"THENRETURN
3320 D2=VAL(I$):I$=MID$(STR$(D2),2):IFD2<0ORD2>254THENPRINT"{up*2}{white}Must be between 0 and 254.":GOTO3310:ELSERETURN
3330 PRINT"{cyan}User ID number(s): ";:GOSUB720:IFI$=""ORI$="*"THENRETURN
3340 IFVAL(I$)<1ORVAL(I$)>500THENPRINT"{up*2}{white}Valid user ID's range from 1-500.":GOTO3330:ELSERETURN
3350 PRINT"{cyan}Misc 1: ";:GOSUB720:RETURN
3360 PRINT"{cyan}Misc 2: ";:GOSUB720:RETURN
3370 PRINT"{cyan}Topic/Subboard letter  (A-T): ";:GOSUB720:IFI$=""ORI$="*"THENRETURN
3380 I=ASC(I$):I=I-64:IFI>20THENI=I-128
3390 IFI<1ORI>20THENPRINT"{up*2}{white}Valid letters range from A-T only.":GOTO3370:ELSEI$=CHR$(I+192):RETURN
3400 I$=DF$(W1,V):IFLEN(I$)<26THENI$="00000000000000000000000000"
3410 GOSUB2440:RETURN
3420 PRINT"{cyan}Data: ";:GOSUB720:RETURN
3430 PRINT"{cyan}Filetype (P)rg, (S)eq, (W)ordpro: ";:GOSUB720:IFI$=""ORINSTR("pswPSW",I$)=0THENPRINT"{up*2}{white}You must enter P,S, or W.":GOTO3430
3440 I=INSTR("pswPSW",I$):IFI>3THENI=I-3:RETURN:ELSERETURN
3450 C0=0:PRINT:PRINT"Is this an op-code subroutine (y/n)? ";:GETKEYA$:IFINSTR("Yy",A$)>0THENC0=1:PRINT"Yes":ELSEPRINT"No."
3460 PRINT"{down}Command key: ";:GOSUB720:IFI$=""THEN2560:ELSEIFC0=0ANDASC(I$)>64ANDASC(I$)<91THENI$=CHR$(ASC(I$)+128)
3470 Y=0:DO:Y=Y+1:LOOPUNTILME$(Y,0)=I$ORY>Z1:IFY>Z1THEN2560
3480 IFC0THEN3610:ELSEPRINT"{cyan}New command key or [RETURN] to keep: ";:GOSUB720:IFI$=""THEN3510
3490 IFC0=0ANDASC(I$)>64ANDASC(I$)<91THENI$=CHR$(ASC(I$)+128)
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
3750 T$=RIGHT$("000"+MID$(STR$(OP(X)),2),4)+"  "+MID$(DX$(OP(X)),11)+CHR$(27)+"q{cyan}":RETURN
3760 PRINT"{home}{left}";:IFX=1THENRETURN:ELSEFORI=2TOX:PRINT"{down}";:NEXTI:RETURN
3770 X=LN:GOSUB3760:X=C:GOSUB3750:PRINT"{white}{reverse on}"T$
3780 GOSUB480:IFA$="{down}"THEN3810
3790 IFA$="{up}"THEN3850
3800 ONINSTR("aAeEdDiI*"+CHR$(27),A$)GOTO3890,3890,4180,4180,4190,4190,4230,4230,4280,4340:GOTO3780
3810 IFC=C1THEN3780
3820 X=LN:GOSUB3760:X=C:GOSUB3750:PRINT"{cyan}"T$
3830 IFLN=16THENPRINTCHR$(27)"v":LO=LO+1:HI=HI+1:LN=15
3840 C=C+1:LN=LN+1:X=LN:GOSUB3760:X=C:GOSUB3750:PRINT"{white}{reverse on}"T$:GOTO3780
3850 IFC=1THEN3780
3860 X=LN:GOSUB3760:X=C:GOSUB3750:PRINT"{cyan}"T$
3870 IFLN=1THENPRINTCHR$(27)"w":LO=LO-1:HI=HI+1:LN=2
3880 C=C-1:LN=LN-1:X=LN:GOSUB3760:X=C:GOSUB3750:PRINT"{white}{reverse on}"T$:GOTO3780
3890 W1=C1+1:IFW1>50THEN3740
3900 FORX=1TO5:DF$(W1,X)="*":NEXTX:GOSUB3930:C1=C1+1:C=C1:HI=C1:LO=C1-15:IFLO<1THENLO=1
3910 LN=C1:IFLN>16THENLN=16
3920 GOTO3740
3930 X=1:PRINT"{clear}{down}{cyan}Select op-code: "
3940 PRINTUSING"{home}{down}{right*16}####";X:PRINT"{up}"TAB(40)MID$(DX$(X),11)CHR$(27)"q"
3950 GOSUB480:IFA$=CHR$(13)THENOP(W1)=X:GOTO4060
3960 IFA$=CHR$(27)ANDC1>0THENPRINT"{clear}{cyan}":GOTO3740
3970 IFA$=CHR$(27)THEN4340
3980 IFA$="{down}"THEN4010
3990 IFA$="{up}"THEN4030
4000 GOTO3950
4010 IFX>499THENX=1:GOTO3940
4020 X=X+1:IFDX$(X)=""THENX=INT((X+100)/100)*100:GOTO4010:ELSE3940
4030 IFX<2THENX=501
4040 X=X-1:IFDX$(X)=""THENX=X-100:DO:X=X+1:LOOPUNTILDX$(X)="":GOTO4030:ELSE3940
4050 PRINT"{clear}{down}{cyan}"MID$(DX$(OP(W1)),11)
4060 GOSUB930:V=0:FORT=1TO10:IFMID$(DX$(OP(W1)),T,1)="0"THENNEXTT:GOTO4080
4070 V=V+1:PRINT"{yellow}"CHR$(192+V)") {white}"OT$(T)TAB(20)": {cyan}";:I$=DF$(W1,V):GOSUB4480:NEXTT
4080 IFV=0THENPRINT"{clear}{cyan}":RETURN
4090 PRINT"{down}{cyan}Edit which? ";
4100 GETKEYA$:IFA$=CHR$(13)THENPRINT"{clear}{cyan}":RETURN
4110 X=ASC(A$)-192:IFX<1ORX>VTHENX=ASC(A$)-64:IFX<1ORX>VTHEN4100
4120 PRINTCHR$(192+X):PRINT:V=0:FORI=1TO10:IFMID$(DX$(OP(W1)),I,1)="0"THENNEXTI:GOTO4050
4130 V=V+1:IFV<>XTHENNEXTI
4140 IF(W1=203ORW1=204)ANDI=2THENGOSUB3430:GOTO4170
4150 ONIGOSUB3270,3420,3290,3310,3420,3370,3350,3360,3330,3400
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
4440 I$=""
4450 GET#2,A$:GG=ST:IFA$=CHR$(13)THENRETURN
4460 IFA$="{f5}"THENA$=CHR$(34)
4470 IFGG=0THENI$=I$+A$:GOTO4450:ELSERETURN
4480 I=LEN(I$):IFI>MAXTHENI=MAX
4490 FORH=1TOI:POKE244,1:PRINTMID$(I$,H,1);:POKE244,0:POKE245,0:NEXTH:PRINT:RETURN
4500 PRINT"Insert "CHR$(34)"sys.variables"CHR$(34)" disk.":PRINT"Drive, Device/lu = 8,0{left*3}";:OPEN1,0:INPUT#1,X,Y:CLOSE1:PRINT
4510 PRINT"{down}Loading...";:CLOSE2:CLOSE15:OPEN15,X,15:OPEN2,X,2,STR$(Y)+":sys.variables,s,r":INPUT#15,A:IFA>0THENPRINT"Not found.":CLOSE2:CLOSE15:RETURN
4520 FORX=1TO9:INPUT#2,D(X,0),D(X,1):NEXTX:FORX=1TO18:INPUT#2,MT$(X):NEXTX:FORX=1TO26:INPUT#2,CT(X,0),CT(X,1):NEXTX:FORX=0TO8:GOSUB4440:F$(X)=I$:NEXTX
4530 INPUT#2,CC$:CLOSE2:CLOSE15:PRINT"done.":RETURN
4540 IFPEEK(238)=79THENWINDOW48,1,79,24,1:ELSEWINDOW5,1,39,24
4550 PRINT"{reverse on}{cyan}{cm t*23}"
4560 PRINT"{reverse on} [L]oad Configuration  ":PRINT"{reverse on} [S]ave Configuration  "
4570 PRINT"{reverse on} [C]olor Cycle         ":PRINT"{reverse on} [D]rive Configuration "
4580 PRINT"{reverse on} [F]unction Keys       ":PRINT"{reverse on} [M]odem Settings      "
4590 PRINT"{reverse on} [V] System Variables  ":PRINT"{reverse on} [T]ime/Call Limits    "
4600 PRINT"{reverse on}{cm p*23}"
4610 GOSUB480:ONINSTR("CcDdFfMmVvTtLlSs",A$)GOTO4630,4630,4680,4680,4790,4790,4820,4820,4950,4950,5150,5150,5170,5170,5180,5180
4620 PRINT"{clear}";:GOTO340
4630 PRINT"{home}":FORX=1TO8:A$=MID$(CC$,X,1):Y=INSTR("{white}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}",A$)
4640 PRINTTAB(24)A$MID$("WHITE RED   CYAN  PURPLEGREEN BLUE  YELLOWORANGEBROWN LT REDD GREYM GREYLT GRNL BLUEL GREY",(Y*6)-5,6)+CHR$(27)"q":NEXTX
4650 PRINT"{down*2}{cyan}Press the color to change: "CHR$(27)"q";:GETKEYA$:X=INSTR(CC$,A$):IFX=0THENPRINT"{clear}";:GOTO4550
4660 PRINT"                     Change to: ";:GETKEYB$:IFINSTR("{white}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}",B$)=0THENPRINT"{clear}";:GOTO4550
4670 MID$(CC$,X,1)=B$:GOTO4630
4680 PRINT"{down}Drive configuration{down}":OPEN1,0:GOSUB5130
4690 PRINT"{yellow}System prg.files :"D(1,0)","D(1,1):PRINT"{up}"TAB(19);:INPUT#1,D(1,0),D(1,1):PRINT
4700 PRINT"{yellow}System data files:"D(2,0)","D(2,1):PRINT"{up}"TAB(19);:INPUT#1,D(2,0),D(2,1):PRINT
4710 PRINT"{yellow}Expansion drive  :"D(3,0)","D(3,1):PRINT"{up}"TAB(19);:INPUT#1,D(3,0),D(3,1):PRINT
4720 PRINT"{yellow}Expansion drive  :"D(4,0)","D(4,1):PRINT"{up}"TAB(19);:INPUT#1,D(4,0),D(4,1):PRINT
4730 PRINT"{yellow}User data files  :"D(5,0)","D(5,1):PRINT"{up}"TAB(19);:INPUT#1,D(5,0),D(5,1):PRINT
4740 PRINT"{yellow}Email drive      :"D(6,0)","D(6,1):PRINT"{up}"TAB(19);:INPUT#1,D(6,0),D(6,1):PRINT
4750 PRINT"{yellow}Feedback drive   :"D(7,0)","D(7,1):PRINT"{up}"TAB(19);:INPUT#1,D(7,0),D(7,1):PRINT
4760 PRINT"{yellow}Expansion drive  :"D(8,0)","D(8,1):PRINT"{up}"TAB(19);:INPUT#1,D(8,0),D(8,1):PRINT
4780 PRINT"{yellow}Expansion drive  :"D(9,0)","D(9,1):PRINT"{up}"TAB(19);:INPUT#1,D(9,0),D(9,1):PRINT:CLOSE1:PRINT"{clear}";:GOTO5140
4790 GOSUB5130:PRINT"{clear}{down}Function key definitions:{down}":FORX=1TO8:PRINT"{yellow}"RIGHT$(STR$(X),1)") {white}";:MAX=28:I$=F$(X):GOSUB4480:NEXTX
4800 PRINT"{down}{cyan}Edit which function key (1-8)? ";:GETKEYA$:T=VAL(A$):IFT<1ORT>8THENPRINT"{clear}";:GOTO5140
4810 I$=F$(T):GOSUB930:GOSUB2010:F$(T)=I$:POKE2603,8:PRINTCHR$(27)"e";:GOTO4790
4820 PRINT"{clear}":OPEN1,0:GOSUB5130
4830 PRINT"0 = 1670, 1 = 1670, 2 = Hayes":PRINT"3 = 1650, 4 = 1660: Type: ";MT$(1)+"{left}";
4840 INPUT#1,MT$(1):PRINT
4850 W1=0:W2=0:W3=0:W4=0:IFVAL(MT$(1))=3THENW2=32:W3=2:W4=6
4860 IFVAL(MT$(1))=4THENW1=32:W4=38
4870 PRINT"{down}Hangup bit (usually 16)":PRINT"Hangup bit: "+MT$(5)+CHR$(13)+"{up}{right*12}";:INPUT#1,MT$(5):PRINT
4880 PRINT"{down}Hangup poke 56577 (should be"+STR$(W1)+")":PRINT"Hangup poke: "+MT$(6)+CHR$(13)+"{up}{right*13}";:INPUT#1,MT$(6):PRINT
4890 PRINT"{down}Hangup poke 56579 (should be"+STR$(W2)+")":PRINT"Hangup poke: "+MT$(7)+CHR$(13)+"{up}{right*13}";:INPUT#1,MT$(7):PRINT
4900 PRINT"{down}Pickup poke 56577 (should be"+STR$(W3)+")":PRINT"Pickup poke: "+MT$(8)+CHR$(13)+"{up}{right*13}";:INPUT#1,MT$(8):PRINT
4910 PRINT"{down}Pickup poke 56579 (should be"+STR$(W4)+")":PRINT"Pickup poke: "+MT$(9)+CHR$(13)+"{up}{right*13}";:INPUT#1,MT$(9):PRINT
4920 PRINT"{down}Idle/Max baud rate: ";MT$(10)+CHR$(13)+"{up}{right*20}";:INPUT#1,MT$(10):PRINT
4930 IFVAL(MT$(1))<3THENPRINT"{down}Initialize commands"+CHR$(13)+": ";MT$(18)+CHR$(13)+"{up}{right*2}";:INPUT#1,MT$(18):PRINT
4940 CLOSE1:PRINT"{clear}";:GOTO5140
4950 PRINT"{clear}":OPEN1,0:GOSUB5130
4960 PRINT"System name":PRINT":"F$(0)"{home}{down*2}{right}";:INPUT#1,F$(0):PRINT
4970 PRINT"{down}Extended log default for new":PRINT"users (0=off, 1=on): "MT$(2)"{left}";:INPUT#1,MT$(2):PRINT
4980 PRINT"{down}Maintenance hour; 0-22":PRINT"0=midnight: "MT$(3)CHR$(13)"{up}"TAB(12);:INPUT#1,MT$(3):PRINT
4990 PRINT"{down}All system upcase flag":PRINT"(0=off, 1=on): "MT$(4)"{left}";:INPUT#1,MT$(4):PRINT
5000 PRINT"{down}Number of block credits to":PRINT"give new users: "MT$(11)CHR$(13)"{up}"TAB(16);:INPUT#1,MT$(11):PRINT
5010 PRINT"{down}Number of system credits to":PRINT"give new users: "MT$(12)CHR$(13)"{up}"TAB(16);:INPUT#1,MT$(12):PRINT
5020 PRINT"{down}Default weed protect for new":PRINT"users (0=off, 1=protected): "MT$(13)"{left}";:INPUT#1,MT$(13):PRINT
5030 PRINT"{down}Number of days before auto-":PRINT"deletion: "MT$(14)CHR$(13)"{up}"TAB(10);:INPUT#1,MT$(14):PRINT
5040 W1=VAL(MT$(15)):PRINT"{down}Max users (0-500): "MT$(15)CHR$(13)"{up}"TAB(19);:INPUT#1,MT$(15):PRINT:IFVAL(MT$(15))=W1THEN5100
5050 PRINT"{down}Are you sure (y/n)? ";:DO:GETKEYA$:LOOPUNTILA$="y"ORA$="n":PRINTA$:IFA$="n"THENMT$(15)=STR$(W1):GOTO5100
5060 PRINT"Drive to read "CHR$(34)"sys.userfiles"CHR$(34):PRINT"Drive, Device/lu: 8,0{left*3}";:INPUT#1,X,Y:PRINT:IFX<8THEN5060:ELSEPRINT"{down}Standby..."
5070 OPEN2,X,2,STR$(Y)+":sys.userfiles":RECORD#2,W1+1:FORI=1TO5:INPUT#2,OP(I):NEXTI
5080 IFVAL(MT$(15))>W1THENFORI=W1+1TOVAL(MT$(15)):RECORD#2,I:PRINT#2,"{pound}":NEXTI
5090 A$="":FORI=1TO5:A$=A$+STR$(OP(I))+CHR$(13):NEXTI:RECORD#2,VAL(MT$(15))+1:PRINT#2,A$;:CLOSE2
5100 PRINT"{down}System credits awarded per":PRINT"response: "MT$(16)CHR$(13)"{up}"TAB(10);:INPUT#1,MT$(16):PRINT
5110 PRINT"{down}Password mask character: "MT$(17)"{left}";:INPUT#1,MT$(17):PRINT
5120 CLOSE1:PRINT"{clear}";:GOTO5140
5130 PRINTCHR$(27)"f";:POKE2603,0:RETURN
5140 POKE2603,8:PRINTCHR$(27)"e";:GOTO4550
5150 PRINT"{clear}{down}   Max calls, time limit":OPEN1,0:PRINT:GOSUB5130
5160 FORX=1TO26:PRINTCHR$(X+192)"        "CT(X,0)","CT(X,1):PRINT"{up}{right*10}";:INPUT#1,CT(X,0),CT(X,1):PRINT:NEXTX:CLOSE1:PRINT"{clear}";:GOTO5140
5170 PRINT:GOSUB5130:GOSUB4500:PRINT"{clear}";:GOTO5140
5180 PRINT:GOSUB5130:GOSUB5190:PRINT"{clear}";:GOTO5140
5190 PRINT"Insert disk containing "CHR$(34)"sys.variables"CHR$(34):PRINT"Drive, Device/lu = 8,0{left*3}";:OPEN1,0:INPUT#1,X,Y:CLOSE1:PRINT
5200 CLOSE15:OPEN15,X,15:PRINT#15,"s"+CHR$(Y)+":sys.variables"
5210 PRINT"{down}Saving...";:CLOSE2:OPEN2,X,2,STR$(Y)+":sys.variables,s,w":INPUT#15,A:IFA>0THENPRINT"Error.":SLEEP2:CLOSE2:CLOSE15:RETURN
5220 FORX=1TO9:PRINT#2,D(X,0):PRINT#2,D(X,1):NEXTX:FORX=1TO18:PRINT#2,MT$(X):NEXTX
5230 FORX=1TO26:PRINT#2,CT(X,0):PRINT#2,CT(X,1):NEXTX:FORX=0TO8:PRINT#2,F$(X):NEXTX
5240 PRINT#2,CC$:CLOSE2:CLOSE15:PRINT"done.":RETURN
5250 IFPEEK(238)=79THENWINDOW45,1,79,24,1:ELSEWINDOW5,1,39,24,1
5260 PRINT"{cyan}{reverse on}{cm t*31}"
5270 PRINT"{reverse on} [U]ser editor                 "
5280 PRINT"{reverse on} [H]ardcopy user files         "
5290 REMPRINT"{reverse on} [A]SCII table editor          "
5300 REMPRINT"{reverse on} [4]0 Column cursor editor     "
5310 PRINT"{reverse on}{cm p*31}"
5320 GOSUB480:ONINSTR("UuHhAa4",A$)GOTO5340,5340,5540,5540
5330 PRINT"{clear}";:GOTO340
5340 GOSUB5130:OPEN1,0:PRINT"Drive to read "CHR$(34)"sys.userfiles"CHR$(34):PRINT"Drive, Device/lu: 8,0{left*3}";
5350 INPUT#1,U3,D3:PRINT:CLOSE1:IFU3<8THENPRINT"{clear}";:GOTO5260
5360 WINDOW0,1,39,24,1:POKE2603,8:PRINTCHR$(27)"e";
5370 PRINT"{clear}{down*2}{cyan}{right*5}{reverse on}{cm t*18}"
5380 PRINT"{right*5}{reverse on} [L]ist users     "
5390 PRINT"{right*5}{reverse on} [E]dit userfile  "
5400 PRINT"{right*5}{reverse on} <CR> = Quit      "
5410 PRINT"{right*5}{reverse on}{cm p*18}"
5420 GOSUB480:ONINSTR("LlEe",A$)GOTO5440,5440,5490,5490
5430 PRINT"{clear}";:GOTO5250
5440 PRINT"{clear}ID  HANDLE           REAL NAME":OPEN2,U3,2,STR$(D3)+":sys.userfiles":X=0:DO:X=X+1:RECORD#2,X:INPUT#2,A$,B$,B$:IFLEN(A$)<2THEN5460
5450 PRINTUSING"### ################ ################";MID$(STR$(X),2),A$,B$
5460 GETA$:IFA$=" "ORX=VAL(MT$(15))THENCLOSE2:PRINT"{down}Done.":GETKEYA$:EXIT
5470 IFA$="{home}"THENDO:GETA$:LOOPUNTILA$<>""
5480 LOOP:GOTO5370
5490 PRINT"Edit which userfile: ";:OPEN1,0:GOSUB5130:INPUT#1,X:PRINT:IFX<1ORX>VAL(MT$(15))THEN5530
5500 OPEN2,U3,2,STR$(D3)+":sys.userfiles":RECORD#2,X:FORI=1TO12:INPUT#2,DF$(I,0):NEXTI:FORI=1TO12
5510 PRINTMID$("Handle    Password  Real name Phone No. Access LvlLast Call Acs Flags Info flagsCalls     Blocks    Credits   Baud      ",(I*10)-9,10)+": ";
5520 PRINTDF$(I,0):PRINT"{up}{right*12}";:INPUT#1,DF$(I,0):PRINT:NEXTI:A$="":FORI=1TO12:A$=A$+DF$(I,0)+CHR$(13):NEXTI:RECORD#2,X:PRINT#2,A$;:CLOSE2
5530 CLOSE1:POKE2603,8:PRINTCHR$(27)+"e":GOTO5370
5540 GOSUB5130:OPEN1,0:PRINT"Drive to read "CHR$(34)"sys.userfiles"CHR$(34):PRINT"Drive, Device/lu: 8,0{left*3}";
5550 INPUT#1,U3,D3:PRINT:CLOSE1:IFU3<8THENPRINT"{clear}";:GOTO5260
5560 B$="### ################ ######## ################ ############## #  ######  ######"
5570 OPEN4,4,7:PRINT#4,CHR$(13)+"ID  HANDLE           PASSWORD REAL NAME        PHONE NUMBER   *  BLOCKS  SYSTEM
5580 PRINT#4,"-------------------------------------------------------------------------------"
5590 OPEN2,U3,2,STR$(D3)+":sys.userfiles":X=0:DO:X=X+1:RECORD#2,X:FORI=1TO12:INPUT#2,DF$(I,0):NEXTI
5600 IFLEN(DF$(1,0))<2THEN5620
5610 PRINT#4,USINGB$;MID$(STR$(X),2),DF$(1,0),DF$(2,0),DF$(3,0),DF$(4,0),DF$(5,0),DF$(10,0),DF$(11,0)
5620 GETA$:LOOPUNTILX=VAL(MT$(15))ORA$=" ":CLOSE2:CLOSE4:PRINT"{clear}";:GOTO5260
