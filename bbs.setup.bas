!--------------------------------------------------
!- Monday, May 15, 2017 3:01:47 AM
!- Import of : 
!- c:\src\zelch128\bbs.setup.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625:REM =============== SETUP MODULE V2.0 =============== 08/15/91 =
30010 OPEN5,2,5,CHR$(8)+CHR$(0):DIMP0$(101),U$(10),U(5),D(12,1),M(20),TT$(501),UI$(500),M$(30,4),CD(26,2),MR(50),MN$(50),MX(50),O(20),O$(30),T$(121),PL(26)
30020 DIMPH$(20,4),DR$(12),VT(50),VT$(50)
30100 PRINT"{home*2}";:POKE2847,160:A=SGN(PEEK(215))*5:IFATHENFAST
30200 GRAPHIC5:PRINT"{home*2}{clear}{ct n}{light gray}{reverse on} C{cm m}  Handle   :                   ID:           Access :        Baud:       {cm g}G "
30300 PRINT"{reverse on} H{cm m}  Real Name:                   LCD           Blocks :        Call:       {cm g}R "
30400 PRINT"{reverse on} A{cm m}  Phone No.:                   Now           Credits:        Cols:       {cm g}F "
30500 PRINT"{reverse on} T{cm m}  Time On  :         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z {cm g}X "
30550 PRINT"{down*20}{reverse on}Sub:";:FORI=1TO62:PRINT" ";:NEXT:PRINT"{cm g}setup       {home}";
30600 POKE53280,0:POKE53281,0:GRAPHIC0:PRINT"{home*2}{clear}{ct n}{light gray}{reverse on}C{cm g}Hndl:                  (#   )      {cm m}G"
30700 PRINT"{reverse on}H{cm g}Name:                  Call        {cm m}R"
30800 PRINT"{reverse on}A{cm g}Ph #:                  On @        {cm m}F"
30900 PRINT"{reverse on}T{cm g}ACS :    ABCDEFGHIJKLMNOPQRSTUVWXYZ{cm m}X"
31000 PRINT"{down*20}{reverse on}Sub:";:FORI=1TO22:PRINT" ";:NEXT:PRINT"{cm g}setup       {home}";:GRAPHICA:PRINT"{home}{down*5}":WINDOW0,4,PEEK(238),23
31100 PRINT"{clear}{down}{cyan}Reading system variables...":OPEN2,U,2,"0:sys.variables,s,r":FORI=0TO11:INPUT#2,D(I,0),D(I,1):NEXTI:FORI=0TO17:INPUT#2,M(I):NEXT
31200 SYS8222:POKE2926,ASC(I$+CHR$(0)):SYS8222:O$(14)=I$:FORI=18TO22:SYS8222:O$(I)=I$:NEXTI:O$(23)="Punter"
31300 FORI=1TO26:INPUT#2,CD(I,0),CD(I,1),CD(I,2):NEXT:SYS8222:N$=I$:FORI=0TO7:GET#2,A$:POKE2836+I,ASC(A$):NEXTI:GET#2,A$:CLOSE2
31400 POKE2852,M(4):POKE2853,PEEK(56577)ANDM(4)
31410 OPEN2,U,2,"0:sys.text,s,r":FORI=1TO121
31420 SYS8222:IFLEFT$(I$,1)=";"THEN31420:ELSET$(I)=I$:NEXTI:CLOSE2
31500 POKE2835,1:PRINT"{clear}{down}Insert system data disks, press RETURN.":DO:GETKEYA$:LOOPUNTILA$=CHR$(13):I=0
31600 A=0:PRINT"{clear}{down}Reading user names...":OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.userfiles":PRINT"{down}{right*3}0 users loaded."
31700 I=I+1:RECORD#2,I:SYS8222:UI$(I)=I$:IFUI$(I)="^"THEN31700:ELSEIFUI$(I)="{pound}"THEN31800:ELSEPRINTUSING"{home}{down*3}####";I:A=A+1:GOTO31700
31800 UI$(I)="":PRINT:PRINTUSING"#### active users.";A:CLOSE2:PRINT"{down*2}Loading miscellaneous data..."
31810 OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.misc data":RECORD#2,1:FORI=2TO6:INPUT#2,O(I):NEXTI
31820 SYS8222:O$(12)=I$:RECORD#2,2:A$="":FORI=1TO10:SYS8222:A$=A$+I$:POKE4095+I,LEN(I$):NEXTI:FORI=1TOLEN(A$):A=ASC(MID$(A$,I,1)):IFA=11THENA=13
31825 POKE4105+I,A:NEXTI:CLOSE2
31830 OPEN1,D(10,0),15:OPEN2,D(10,0),2,MID$(STR$(D(10,1)),2)+":sys.u/d desc":INPUT#1,E:IFETHEN31850
31840 FORI=1TO12:RECORD#2,I:SYS8222:DR$(I)=I$:NEXTI
31850 CLOSE1:CLOSE2:OPEN1,D(1,0),15:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.one liners,s,r":INPUT#1,I:IFI>20THENCLOSE2:CLOSE1:GOTO31900:ELSEDIMOL$(100):I=1
31860 SYS8222:OL$(I)=I$:IFPEEK(253)=0ANDI<100THENI=I+1:GOTO31860:ELSECLOSE2:CLOSE1:OL$(0)=STR$(I)
31900 POKE2847,50:POKE2823,1:POKE2825,50:POKE2824,1:POKE2827,0:POKE2829,1:POKE2850,0:SP$="":FORI=1TO100:SP$=SP$+" ":NEXTI
32000 PRINT"{clear}{down}{cyan}Enter time {white}HH:MM{cyan} format: {yellow}";:X=5:GOSUB5:O$=I$:IFPEEK(238)=79THENPRINT"{up}"TAB(36);
32100 PRINT"{cyan}AM or PM ({white}a{cyan}/{white}p{cyan})? {yellow}";:DOUNTILI$="a"ORI$="p":GETI$:LOOP:PRINTI$:I=VAL(LEFT$(O$,2)):IFI=12ANDI$="a"THENI$="p":ELSEIFI=12ANDI$="p"THENI$="a"
32200 IFI$="p"THENI=I+80
32300 POKE56587,DEC(STR$(I)):POKE56586,DEC(RIGHT$(O$,2)):POKE56585,1:POKE56584,1:I=PEEK(56584)
32310 A=M(2):I$="a":IFA>12THENA=A-12:I$="p"
32320 IFA=12ANDI$="a"THENI$="p":ELSEIFA=12ANDI$="p"THENI$="a"
32330 IFI$="p"THENA=A+80
32340 POKE2960,DEC(STR$(A))
32400 PRINT"{down}{cyan}Enter date {white}MM/DD/YY{cyan} format: {yellow}";:X=8:GOSUB5
32500 POKE2879,VAL(LEFT$(I$,2)):POKE2880,VAL(MID$(I$,4,2)):POKE2863,VAL(RIGHT$(I$,2))
32600 POKE2881,31:POKE2882,28:POKE2883,31:POKE2884,30:IFPEEK(2863)/4=INT(PEEK(2863)/4)THENPOKE2882,29
32700 POKE2885,31:POKE2886,30:POKE2887,31:POKE2888,31:POKE2889,30:POKE2890,31:POKE2891,30:POKE2892,31:IFPEEK(2880)>PEEK(2880+PEEK(2879))THEN32400
32800 GOSUB400:PRINTCHR$(13)+"{cyan}Is {white}"+O$(3)+" {cyan}correct ({white}y{cyan}/{white}n{cyan})? {yellow}";:DO:GETI$:LOOPUNTILINSTR("YyNn",I$):PRINTI$:IFI$="N"ORI$="n"THEN32000
32900 R$=CHR$(13):SYS8216:O$(1)=I$:GOSUB400:O$(4)=O$(3):M7$=O$(3):M6$=UI$(1)
32910 FORI=0TO3:POKE2963+I,PEEK(804+I):POKE2967+I,PEEK(810+I):NEXTI
33000 I$="prg.logon":U=D(0,0):D=D(0,1):GOTO23
55555 U=PEEK(186):OPEN1,U,15,"s0:bbs.setup":CLOSE1:DSAVE"bbs.setup",U(U)
