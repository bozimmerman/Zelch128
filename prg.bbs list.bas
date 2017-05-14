!--------------------------------------------------
!- Sunday, May 14, 2017 12:04:27 AM
!- Import of : 
!- c:\tmp\delme\prg.bbs list.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 REM **ZELCH128 BBS LIST SYSTEM -- J. MACNISH 1991**
20 U=11:DV=0:IFU<8ORU>30THENU=8:DV=0
30 CL$(1)="Commodore 64/128":CL$(2)="Amiga":CL$(3)="Apple 8-bit":CL$(4)="Macintosh":CL$(5)="IBM & clones":CL$(6)="Atari 8-bit":CL$(7)="Atari ST"
40 DIM SY$(101,6):DIM SY%(101,16)
50 AC$(1)="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ- '&#!"
60 AC$(2)="-1234567890":SP$="                                    {sh space}"
70 P=1:P2=10
80 C$(1)="C64/128":C$(2)="Amiga":C$(3)="Apple8":C$(4)="Mac":C$(5)="IBM":C$(6)="Atari8":C$(7)="ST"
90 PRINT "{clear}{down}{cyan}Zelch 128 BBS Database System"
100 PRINT:PRINT"Reading systems...";
110 DOPEN#1,"sys.bbs list",D(DV),U(U),R:IFDS<>0THENDCLOSE#1:GOSUB 1210
120 C=1
130 INPUT#1,SY$(C,1),SY$(C,2),SY$(C,3),SY$(C,4),SY$(C,5),SY%(C,1),SY%(C,2),SY%(C,3),SY%(C,4),SY%(C,5),SY%(C,6),SY%(C,7),SY%(C,8),SY%(C,9),SY%(C,10)
140 INPUT#1,SY%(C,11),SY%(C,12),SY%(C,13),SY%(C,14),SY%(C,15)
150 C=C+1:IF ST=0 THEN 130
160 PRINT:DCLOSE#1
170 PRINT:PRINT "{cyan}";STR$(C-1);" systems in database."
180 PRINT
190 PRINT "{cyan}Add, List, Search, Quit":PRINT:PRINT "BBS Database: ";:P$="ALSQ":GOSUB1120
200 IF R=4 THEN PRINT"{light gray}Quit":PRINT:PRINT "{cyan}Zelch 128 BBS list system{f7}by J. MacNish 1991":END
210 IF R=1 THEN BEGIN
220 PRINT "{light gray}Add new system"
230 PRINT
240 A=C
250 PRINT "{cyan}General Information"
260 PRINT "  {white}System Name(18 characters):";:P=1:P2=18:GOSUB1060:IF R$="" THEN PRINT:GOTO 190:ELSE SY$(A,1)=R$
270 PRINT "{white}(???)XXX-XXXX      Area code:";:P=3:GOSUB1170:IFR$=""ORLEN(R$)<3 THEN GOTO 190:ELSE SY$(A,2)=R$
280 PRINT "{white}(XXX)???-XXXX   Phone prefix:";:P=3:GOSUB1170:SY$(A,3)=R$
290 PRINT "{white}(XXX)XXX-????  Phone postfix:";:P=4:GOSUB1170:SY$(A,3)=SY$(A,3)+"-"+R$
300 PRINT "{white}                         Pay:";:GOSUB1150:SY%(A,12)=R
310 PRINT "{cyan}Supported Baud Rates"
320 PRINT "{white}          300 baud supported:";:GOSUB1150:SY%(A,1)=R
330 PRINT "         1200 baud supported:";:GOSUB1150:SY%(A,2)=R
340 PRINT "         2400 baud supported:";:GOSUB1150:SY%(A,3)=R
350 PRINT "         9600 baud supported:";:GOSUB1150:SY%(A,4)=R
360 PRINT "{cyan}File Support:
370 PRINT "            {white}Commodore 64/128:";:GOSUB1150:SY%(A,5)=R
380 PRINT "            {white}           Amiga:";:GOSUB1150:SY%(A,6)=R
390 PRINT "            {white}     Apple 8 bit:";:GOSUB1150:SY%(A,7)=R
400 PRINT "            {white} Apple Macintosh:";:GOSUB1150:SY%(A,8)=R
410 PRINT "            {white}  IBM and Clones:";:GOSUB1150:SY%(A,9)=R
420 PRINT "            {white}     Atari 8 bit:";:GOSUB1150:SY%(A,10)=R
430 PRINT "            {white}        Atari ST:";:GOSUB1150:SY%(A,11)=R
440 SY$(A,4)="XXX":SY$(A,5)="XXX"
450 APPEND#1,"sys.bbs list",D(DV),U(U):FORX=1TO5:PRINT#1,SY$(A,X):NEXTX:FORX=1TO15:PRINT#1,SY%(A,X):NEXTX:DCLOSE#1
460 PRINT:PRINT "{cyan}New system added.":C=C+1
470 GOTO170:BEND
480 IF R=2 THEN BEGIN
490 PRINT "{light gray}List systems":PRINT
500 PRINTLEFT$(SP$,34);"{light gray}[{pink}--Baud(x100)--{light gray}][{yellow}-------File support-------{light gray}]"
510 PRINT"{light gray}[{white}---System Name---{light gray}][{green}ACd{light gray}][{light green}-Number-{light gray}][{pink}03{light gray}][{pink}12{light gray}][{pink}24{light gray}][{pink}96{light gray}][{yellow}64{light gray}][{yellow}Am{light gray}][{yellow}Ap{light gray}][{yellow}Mc{light gray}][{yellow}IB{light gray}][{yellow}At{light gray}][{yellow}ST{light gray}]"
520 FORX=1 TO C-1:IF SY%(X,12)=1 THEN PRINT "{pink}*{white}";:ELSE PRINT "{white} ";
530 PRINTUSING"################# {light green}({green}###{light green})/########   ";SY$(X,1),SY$(X,2),SY$(X,3);
540 FORZ=1TO4:IFSY%(X,Z)=1THENPRINT"{red}o   ";:ELSEPRINT"    ";
550 NEXTZ
560 FORZ=5 TO 11:IF SY%(X,Z)=1 THEN PRINT "{yellow}o   ";:ELSEPRINT"    ";
570 NEXTZ
580 PRINT:NEXTX
590 PRINT"{ct k}{pink}* {cyan}denotes a pay board."
600 PRINT"{ct k}{yellow}64{cyan}:Commodore 64/128 {yellow}Am{cyan}:Amiga            {yellow}Ap{cyan}:Apple 8-bit      {yellow}Mc{cyan}:Macintosh"
610 PRINT"{yellow}IB{cyan}:IBM & Clones     {yellow}At{cyan}:Atari 8-bit      {yellow}ST{cyan}:Atari ST"
620 GOTO 170
630 BEND
640 IF R=3 THEN BEGIN
650 BR=0:S1=0:S2=0:FORZ=1TO7:SC(Z)=0:NEXTZ:PRINT "{light gray}Search"
660 PRINT:PRINT "{cyan}Set search restrictions:"
670 PRINT:IF S1=0 THEN X$=" any area code":ELSE X$=STR$(S1)+" area code"
680 PRINT "{light gray}[{green}A{light gray}]{green}rea code{f7}   (currently searching for"X$")"
690 IF BR=0 THEN X$=" any baud)":ELSE X$=STR$(BR)+" baud and higher)"
700 PRINT "{light gray}[{pink}B{light gray}]{pink}uad rate{f7}   (currently searching for"X$
710 FOR X=1 TO 7:X$=MID$(STR$(X),2):PRINT "{light gray}[{yellow}"X$"{light gray}]{yellow}"CL$(X)" file support{f7}   (currently ";:IFSC(X)=1THENPRINT"on)":ELSEPRINT"off)"
720 NEXT X
730 PRINT "{light gray}[{white}S{light gray}]{white}earch using these standards"
740 PRINT "{light gray}[{white}Q{light gray}]{white}uit search":PRINT "{ct k}{white}Choice: ";
750 P$="AB1234567SQ":GOSUB1120
760 IF R=10 THEN 850:ELSE IF R=11 THEN PRINT "{cyan}Quit":GOTO170
770 IF R=2THEN BEGIN:PRINT "{cyan}Baud rate"
780 PRINT "{ct k}{cyan}Search for baud rate at or higher than{f7}{light gray}A]{cyan}1200 {light gray}B]{cyan}2400 {light gray}C]{cyan}9600 {light gray}D]{cyan}Any{white}:";:P$="ABCD":GOSUB1120:S2=R:BR=R*1200:IFR=3THENBR=9600
790 IFR=4THENS2=0:BR=0
800 IF BR>0 THEN PRINT MID$(STR$(BR),2);" baud":ELSE PRINT "Any baud"
810 GOTO 670
820 BEND
830 IF R=1 THEN PRINT "{cyan}Search for what area code{f7}(000 for no search by area code){white}: ";:P=3:GOSUB1170:S1=VAL(R$):GOTO670
840 R=R-2:PRINT "{cyan}Toggle "CL$(R)" file support":IF SC(R) THEN SC(R)=0:GOTO670:ELSE SC(R)=1:GOTO670
850 PRINT"{cyan}Search":PRINT:PRINTLEFT$(SP$,34);"{light gray}[{pink}--Baud(x100)--{light gray}][{yellow}-------File support-------{light gray}]"
860 PRINT"{light gray}[{white}---System Name---{light gray}][{green}ACd{light gray}][{light green}-Number-{light gray}][{pink}03{light gray}][{pink}12{light gray}][{pink}24{light gray}][{pink}96{light gray}][{yellow}64{light gray}][{yellow}Am{light gray}][{yellow}Ap{light gray}][{yellow}Mc{light gray}][{yellow}IB{light gray}][{yellow}At{light gray}][{yellow}ST{light gray}]"
870 FOR X=1 TO C-1:IF S1<>0 AND S1<>VAL(SY$(X,2)) THEN970
880 IF S2<>0 AND SY%(X,(S2+1))=0 THEN 970
890 FOR Y=1 TO 7:IF SC(Y)=1 AND SY%(X,(Y+4))=0 THEN 970
900 NEXT Y
910 IF SY%(X,12)=1 THEN PRINT "{pink}*{white}";:ELSE PRINT "{white} ";
920 PRINTUSING"################# {light green}({green}###{light green})/########   ";SY$(X,1),SY$(X,2),SY$(X,3);
930 FORZ=1TO4:IFSY%(X,Z)=1THENPRINT"{red}o   ";:ELSEPRINT"    ";
940 NEXTZ
950 FORZ=5 TO 11:IF SY%(X,Z)=1 THEN PRINT "{yellow}o   ";:ELSEPRINT"    ";
960 NEXTZ
970 NEXT X:PRINT
980 PRINT"{ct k}{pink}* {cyan}denotes a pay board."
990 PRINT"{ct k}{yellow}64{cyan}:Commodore 64/128 {yellow}Am{cyan}:Amiga            {yellow}Ap{cyan}:Apple 8-bit      {yellow}Mc{cyan}:Macintosh"
1000 PRINT"{yellow}IB{cyan}:IBM & Clones     {yellow}At{cyan}:Atari 8-bit      {yellow}ST{cyan}:Atari ST"
1010 GOTO 170
1020 BEND
1030 GOTO 170
1040 END
1050 REM **INPUT**
1060 R$=""
1070 GETKEYX$
1080 IF X$=CHR$(13) THEN PRINT CHR$(13);:RETURN
1090 IFX$=CHR$(20)ANDLEN(R$)>0 THEN R$=LEFT$(R$,LEN(R$)-1):PRINTX$;:GOTO1070:ELSE IF INSTR(AC$(P),X$)=0 THEN 1070
1100 IF LEN(R$)=P2 THEN 1070:ELSE R$=R$+X$:PRINT X$;:GOTO1070
1110 REM **QUICKKEY:P$=COMMAND STRING**
1120 GETKEYX$:R=INSTR(P$,X$):IFRTHENRETURN
1130 X$=CHR$(ASC(X$)OR128):R=INSTR(P$,X$):IFRTHENRETURN:ELSE1120
1140 REM ** YES/NO **
1150 R=0:X$="":GETKEYX$:IFX$<>"y"ANDX$<>"Y"ANDX$<>"N"ANDX$<>"n" THEN 1150:ELSE IFX$="y" OR X$="Y" THEN R=1:PRINT "Yes":RETURN:ELSE PRINT "No":RETURN
1160 REM **FORMATTED NUMERIC INPUT:P=LENGTH**
1170 R$=""
1180 GETKEYX$:IFX$=CHR$(13) AND LEN(R$)=P THEN PRINT CHR$(13);:RETURN
1190 IF X$=CHR$(20)ANDLEN(R$)>0 THEN R$=LEFT$(R$,LEN(R$)-1):PRINTX$;:GOTO 1180:ELSE IF INSTR("1234567890",X$)=0 THEN 1180
1200 IF LEN(R$)=P THEN 1180:ELSE R$=R$+X$:PRINTX$;:GOTO1180
1210 DOPEN#1,"sys.bbs list",D(DV),U(U),W:FORX=1TO5:READA$:PRINT#1,A$:NEXTX:FORX=1TO15:READA:PRINT#1,A:NEXTX:DCLOSE#1:DOPEN#1,"sys.bbs list",D(DV),U(U),R:RETURN
1220 DATA "Elite","602","742-7319","XXX","XXX",1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
