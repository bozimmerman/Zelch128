!--------------------------------------------------
!- Tuesday, May 16, 2017 10:27:08 PM
!- Import of : 
!- c:\src\zelch128next\bbs.create.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 POKE53280,0:POKE53281,0:R$=CHR$(13):IFPEEK(215)THENFAST
15 O$="0000000000000000{ct i*16}{ct a*16}":O$(0)="No ":O$(1)="Yes":DIMM$(20),N$(20)
16 READM:FORX=1TOM:READM$(X-1):NEXTX
17 DATA 7,"Userfiles","Message Bases","U/D Bases","U/D Descriptions","Voting Booth","Networking","Miscellaneous"
18 READN:FORX=1TON:READN$(X-1):NEXTX
19 DATA 4,"The Zelch BBS","The Elite BBS","Simplicity BBS","Quit to previous menu"
20 PRINT"{home*2}{clear}{cyan}{ct n}"LEFT$("BBS File Creation Utilities                                      Zelch 128 v2.0",PEEK(238))"{light blue}":IFPEEK(215)THENPRINT"{dark gray}";
30 PRINTLEFT$("{cm t*80}",PEEK(238))
40 X=1:Y=3:W=37:H=M+3:GOSUB50000:PRINT"{down}{yellow}   File              Create?  Dev. LU":FORI=1TOM
42 IFI<>1ANDI<>4THENPRINTUSING"{white}#{yellow}) {cyan}################### ###    System";CHR$(I+192),M$(I-1),O$(VAL(MID$(O$,I,1)));:GOTO46
45 PRINTUSING"{white}#{yellow}) {cyan}################### ###   ###  ####";CHR$(I+192),M$(I-1),O$(VAL(MID$(O$,I,1))),STR$(ASC(MID$(O$,16+I,1))-1),STR$(ASC(MID$(O$,32+I,1))-1);
46 PRINTCHR$(27)"q":NEXTI
47 Y=Y+H+2:H=6:IFPEEK(215)THENX=41:Y=3
50 GOSUB50000:PRINT"{down}{white}RETURN {yellow}= {cyan}Create specified files":PRINT"{white}Q      {yellow}= {cyan}Quit to basic":PRINT"{white}*      {yellow}= {cyan}Change System drive"
55 PRINT"{white}Z      {yellow}= {cyan}Zelch configurations"
60 GETKEYA$:A$=CHR$(ASC(A$)AND127):A=ASC(A$)-64:IFA$=CHR$(13)THENA=0
65 IFA$="q"THENPRINT"{home*2}{clear}":END:ELSEIFA$="z"THENU=8:D=0:U1=U:D1=D:GOTO10000
66 IFA$<>"*"THEN70
67 PRINT"{clear}{down*2}Device number     : ";:GOSUB50200:IFI$<>""THENU1=I
68 PRINT"Drive/LU          : ";:GOSUB50200:IFI$<>""THEND1=I
69 GOTO40
70 IFA<0ORA>MTHEN60
80 IFATHEN130
90 X=5:Y=5:W=30:H=3:IFPEEK(215)THENX=35:Y=7
100 GOSUB50000:PRINT"Create specified files.":PRINT"{down}Are you sure (y/n)? {reverse on}{cm @}{left}{reverse off}";
110 GETKEYA$:A$=CHR$(ASC(A$)AND127):IFA$<>"y"THENPRINT"No";:SLEEP1:GOSUB50060:GOTO40
120 PRINT"Yes";:SLEEP1:C=0:GOTO1000
130 X=5:Y=4:W=25:H=5:IFPEEK(215)THENX=35:Y=5
135 IFA<>1ANDA<>4THENH=3
140 GOSUB50000:PRINT"File: "M$(A-1):PRINT"{down}Create (y/n)?     : {reverse on}{cm @}{left}{reverse off}";:GETKEYA$:A$=CHR$(ASC(A$)AND127):I$="1":IFA$<>"y"THENI$="0":PRINT"No":ELSEPRINT"Yes"
145 MID$(O$,A,1)=I$:IFA<>1ANDA<>4THEN170
150 PRINT"Device number     : ";:GOSUB50200:IFI$<>""THENMID$(O$,16+A,1)=CHR$(I+1)
160 PRINT"Drive/LU          : ";:GOSUB50200:IFI$<>""THENMID$(O$,32+A,1)=CHR$(I+1)
170 GOSUB50060:GOTO40
200 C=C+1:U=U1:D=D1:X=VAL(MID$(O$,C,1)):IFC=1ORC=4THENU=ASC(MID$(O$,16+C,1))-1:D=ASC(MID$(O$,32+C,1))-1:RETURN:ELSERETURN
210 OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",l,"+CHR$(I):RETURN
1000 REM
1005 X=4:Y=5:W=30:H=5:IFPEEK(215)THENX=21:Y=6:W=30
1006 GOSUB50000
1010 GOSUB200:IFX=0THEN2000
1030 PRINT"{clear}{down}Note: Maximum 500 userfiles.":PRINT"{down}Create how many? ";:GOSUB50200:PRINT"{clear}{down*2}Creating userfiles...":WHY=I
1040 I=253:F$="sys.userfiles":GOSUB210:I$="{pink}{ct o}":GOSUB50100
1050 A$="{pound}"+R$+"(NONE)"+R$+"(NONE)"+R$+"(XXX)/YYY-ZZZZ"+R$+"A"+R$+"0000000000"+R$+"00/00/00"+"0000000000"+R$:YY=0
1060 FORI=1TO2:A$=A$+"00000000000000000000000000"+R$:NEXTI:FORI=1TO8:A$=A$+" 0"+R$:NEXTI
1070 RECORD#2,WHY:PRINT#2,A$:YY=0:FORXX=1TOWHY-1:GOSUB1900
1080 RECORD#2,XX:PRINT#2,A$:NEXTXX:CLOSE2:GOTO2000
1900 YY=YY+1:I$=MID$("{pink}{yellow}{white}{cyan}{light blue}{blue}{purple}{red}",YY,1):GOSUB50100:IFYY>8THENYY=0
1910 RETURN
2000 REM
2010 GOSUB200:IFX=0THEN3000
2020 PRINT"{clear}{down*2}Creating message bases..."
2030 I=253:F$="sys.mbases":GOSUB210:I$="{pink}{ct o}":GOSUB50100
2040 A$=STR$(U)+R$+STR$(D)+R$+"10"+R$+"20"+R$+"10"+R$+"{sh @}(none)"+R$+"00000000000000000000000000"+R$+"1"+R$+"2"+R$+"*"+R$+"N"+R$+"6"+R$+"4"+R$+"Y":YY=0
2050 RECORD#2,26:PRINT#2,A$:FORXX=1TO26:RECORD#2,XX:PRINT#2,A$:GOSUB1900:NEXTXX
2060 CLOSE2
2070 PRINT"{clear}{down*2}Creating message data..."
2080 I=15:F$="sys.mdata":GOSUB210:I$="{pink}{ct o}":GOSUB50100
2100 RECORD#2,1327:PRINT#2,"0000000000"+R$+"0":FORX=1TO1327:RECORD#2,X:PRINT#2,"0000000000"+R$+"0":NEXTX:FORX=51TO1327STEP51:RECORD#2,X:PRINT#2,"0"+R$+"1"
2110 NEXTX:CLOSE2
3000 REM
3010 GOSUB200:IFX=0THEN4000
3020 PRINT"{clear}{down*2}Creating transfer bases..."
3030 I=253:F$="sys.u/d bases":GOSUB210:I$="{pink}{ct o}":GOSUB50100
3040 A$=STR$(U)+R$+STR$(D)+R$+"(none)"+R$+"00000000000000000000000000"+R$+"1"+R$+"50"+R$+"2"+R$+"0":YY=0
3050 RECORD#2,26:PRINT#2,A$:FORXX=1TO26:RECORD#2,XX:PRINT#2,A$:GOSUB1900:NEXTXX
3060 CLOSE2
4000 REM
4010 GOSUB200:IFX=0THEN5000
4030 PRINT"{clear}{down}Note: Max. 1440 u/d records.":PRINT"{down}Create how many? ";:GOSUB50200:PRINT"{clear}{down*2}Creating descriptions...":WHY=I:YY=0
4040 I=127:F$="sys.u/d desc":GOSUB210:I$="{pink}{ct o}":GOSUB50100
4050 A$="":B$="..........":FORI=1TO12:A$=A$+B$:NEXTI
4070 RECORD#2,WHY+12:PRINT#2,A$:YY=0:FORXX=1TOWHY+12:GOSUB1900:IFXX>12THENA$="0"
4080 RECORD#2,XX:PRINT#2,A$:NEXTXX:CLOSE2
5000 REM
5010 GOSUB200:IFX=0THEN6000
5020 PRINT"{clear}{down*2}Creating voting booth..."
5030 I=253:F$="sys.voting booth":GOSUB210:I$="{pink}{ct o}":GOSUB50100
5040 A$="{pound}"+R$+"00000000000000000000000000"+R$+"1"+R$+"09/08/91  08:11pm"+R$+R$:YY=0
5050 RECORD#2,26:PRINT#2,A$:FORXX=1TO26:RECORD#2,XX:PRINT#2,A$:GOSUB1900:NEXTXX
5060 CLOSE2
6000 REM
6010 GOSUB200:IFX=0THEN7000
6020 PRINT"{clear}{down*2}Creating networking file..."
6030 I=127:F$="sys.network":GOSUB210:I$="{pink}{ct o}":GOSUB50100:YY=0
6040 A$="{pound}"+R$+"(none)"+R$+"L0000000000"+R$+"L0000000000"+R$+"4"+R$+"00"+R$+"00000000000000000000000000"
6050 RECORD#2,27:PRINT#2,A$:FORXX=1TO27:RECORD#2,XX:PRINT#2,A$:GOSUB1900:NEXTXX
6060 CLOSE2
7000 REM
7010 GOSUB200:IFX=0THEN8000
7020 PRINT"{clear}{down*2}Creating miscellaneous file..."
7030 I=253:F$="sys.misc data":GOSUB210:I$="{pink}{ct o}":GOSUB50100
7050 RECORD#2,24:PRINT#2,R$:RECORD#2,1:PRINT#2,"0"+R$+"0"+R$+"0"+R$+"0"+R$+"0"+R$+"Zelch 128 v2.5!":YY=0
7060 RECORD#2,2:A$="":FORI=1TO10:A$=A$+"key"+STR$(I)+R$:NEXTI:PRINT#2,A$:RECORD#2,3:PRINT#2,A$
7070 FORXX=4TO24:RECORD#2,XX:PRINT#2,"(none)"+R$+"(AAA)/XXX-YYYY"+R$+"100"+R$+"{pound}"+R$+"{pound}":GOSUB1900:NEXTXX:CLOSE2
8000 GOTO20
10000 X=1:Y=3:W=37:H=M+3:GOSUB50000:PRINT"{down}{yellow}   Configurations{down}":FORI=1TON
10010 PRINTUSING"{white}#{yellow}) {cyan}##########################";CHR$(I+192),N$(I-1);
10020 PRINTCHR$(27)"q":NEXTI
10030 X=1:Y=M+8:H=6:IFPEEK(215)THENX=41:Y=3
10040 GOSUB50000:PRINT"{clear}{down}{white}1){cyan} Source drive : {white}";U","D:PRINT"{down}{white}2){cyan} Destination drive: {white}";U1",";D1
10050 GETKEYIN$:IFINSTR("abcdefghABCDEFGH12",IN$)=0THEN10050
10100 IFIN$="1"THENPRINT"{clear}{down*2}{yellow}Device number     : {white}";:GOSUB50200:IFI$<>""THENU=I
10110 IFIN$="1"THENPRINT"{yellow}Drive/LU          : {white}";:GOSUB50200:IFI$<>""THEND=I
10115 IFIN$="1"THEN10030
10120 IFIN$="2"THENPRINT"{clear}{down*2}{yellow}Device number     : {white}";:GOSUB50200:IFI$<>""THENU1=I
10130 IFIN$="2"THENPRINT"{yellow}Drive/LU          : {white}";:GOSUB50200:IFI$<>""THEND1=I
10135 IFIN$="2"THEN10030
10140 IFCHR$(ASC(IN$)OR128)=CHR$(N+192)THEN40
10150 IF(ASC(IN$)OR128)-192>N-1THEN10050
10160 X=5:Y=5:W=30:H=3:IFPEEK(215)THENX=35:Y=7
10170 GOSUB50000:PRINT"{cyan}Create specified file.":PRINT"{down}Are you sure (y/n)? {white}{reverse on}{cm @}{left}{reverse off}";
10180 GETKEYA$:A$=CHR$(ASC(A$)AND127):IFA$<>"y"THENPRINT"No";:SLEEP1:GOSUB50060:GOTO10000
10190 PRINT"Yes";:SLEEP1:IN$=CHR$(ASC(IN$)AND127)
10200 IFIN$="a"THENF$="conf.zelch"
10210 IFIN$="b"THENF$="conf.elite"
10220 IFIN$="c"THENF$="conf.simple"
10400 X=4:Y=5:W=30:H=5:IFPEEK(215)THENX=21:Y=6
10410 GOSUB50000
10420 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":INPUT#1,E:IFETHENCLOSE2:CLOSE1:GOTO20
10425 SYS8222
10430 OPEN15,U1,15:GOSUB1900:SYS8222:GOTO10500
10460 SYS8222:IFPEEK(253)THENCLOSE3:CLOSE2:CLOSE1:CLOSE15:GOTO20
10470 IFI$<>CHR$(1)THENPRINT#3,I$:GOTO10460
10480 SYS8222:IFINSTR(I$,"{ct x}")<>1THENPRINT#3,"{ct a}":PRINT#3,I$:GOSUB1900:GOTO10460
10500 CLOSE3:PRINT"{cyan}{clear}{down}Creating: {white}"+CHR$(13)+CHR$(34)+MID$(I$,2)+CHR$(34):FF$=MID$(I$,2)
10510 OPEN3,U1,3,MID$(STR$(D1),2)+":"+FF$+",s,w":INPUT#15,E:IFETHENCLOSE3:SYS8213:CLOSE2:CLOSE1:CLOSE15:RUN
10520 GOTO10460
10999 GOTO10000
49999 END
50000 REM -------- WINDOW ROUTINES --------------------------------------------
50010 WINDOWX-1,Y-1,X+W,Y+H,1:PRINTCHR$(27)"m{home}{light blue}";:IFPEEK(215)THENPRINT"{dark gray}";
50020 PRINTLEFT$("{cm @*40}",W+2)
50030 FORI=1TOH:PRINT"{cm g}"SPC(W)"{cm m}":NEXTI
50040 PRINTLEFT$("{cm t*40}",W+2)
50050 WINDOWX,Y,X+W-1,Y+H-1:POKE250,W-1:POKE2603,0:PRINTCHR$(27)"l{cyan}";:RETURN
50060 REM -------- WINDOW ERASE -----------------------------------------------
50070 WINDOWX-1,Y-1,X+W,Y+H,1:POKE2603,8:PRINTCHR$(27)"e{cyan}";:RETURN
50100 REM -------- DISPLAY DISK ACCESS ICON -----------------------------------
50110 WINDOWPEEK(238)-7,20,PEEK(238),24:X=4:Y=5:W=30:H=5:IFPEEK(215)THENX=21:Y=6:W=30
50120 PRINTI$"{clear} {reverse on}{cm f}    ":PRINTI$" {reverse on}  O  ":PRINTI$" {reverse on}  {sh -}  ":GOTO50050
50200 REM -------- NUMBER INPUT AS I ------------------------------------------
50210 I$="":PRINT"{reverse on}{cm @}{left}{reverse off}";
50220 GETKEYA$:IFINSTR("0123456789"+CHR$(13)+CHR$(20),A$)=0THEN50220
50230 IFA$=CHR$(13)THENPRINT" ":I=VAL(I$):RETURN
50240 IFA$<>CHR$(20)THEN50270
50250 IFLEN(I$)>0THENPRINTA$;:I$=LEFT$(I$,LEN(I$)-1)
50260 GOTO50220
50270 IFLEN(I$)<3THENI$=I$+A$:PRINTA$"{reverse on}{cm @}{left}{reverse off}";
50280 GOTO50220
55555 U=PEEK(186):OPEN1,U,15,"s0:bbs.create":CLOSE1:DSAVE"bbs.create",U(U):END
