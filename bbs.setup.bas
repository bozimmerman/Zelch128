!--------------------------------------------------
!- Monday, May 15, 2017 12:15:44 AM
!- Import of : 
!- c:\src\zelch128\bbs.setup.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625:REM =============== SETUP MODULE V1.0 =============== 11/03/90 =
30010 OPEN5,2,5,CHR$(8)+CHR$(0):DIMP0$(101),U$(9),U(3),D(8,1),M(20),TT$(201),UI$(500),M$(30,4),CD(26,1),MR(50),MN$(50),O(20),O$(20),T$(90),MX(30):I=RND(-TI)
30100 PRINT"{home*2}";:POKE2847,160:IFPEEK(238)=39THEN30600
30200 PRINT"{home*2}{clear}{ct n}{light gray}{reverse on} C{cm m}  Handle   :                   ID:           Access :        Baud:       {cm g}G "
30300 PRINT"{reverse on} H{cm m}  Real Name:                   LCD           Blocks :        Call:       {cm g}R "
30400 PRINT"{reverse on} A{cm m}  Phone No.:                   Now           Credits:        Cols:       {cm g}F "
30500 PRINT"{reverse on} T{cm m}  Time On  :         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z {cm g}X ":FAST:GOTO31000
30600 POKE53280,0:POKE53281,0:PRINT"{home*2}{clear}{ct n}{light gray}{reverse on}C{cm g}Hndl:                  (#   )      {cm m}G"
30700 PRINT"{reverse on}H{cm g}Name:                  Call        {cm m}R"
30800 PRINT"{reverse on}A{cm g}Ph #:                  On @        {cm m}F"
30900 PRINT"{reverse on}T{cm g}ACS :    ABCDEFGHIJKLMNOPQRSTUVWXYZ{cm m}X"
31000 PRINTCHR$(27)"m{down*20}{reverse on}Sub:";:FORI=1TOPEEK(238)-17:PRINT" ";:NEXT:PRINT"{cm g}setup       ":WINDOW0,4,PEEK(238),23:PRINTCHR$(27)"l"
31100 PRINT"{clear}{down}{cyan}Reading system variables...":OPEN2,U,8,"sys.variables,s,r":FORI=0TO8:INPUT#2,D(I,0),D(I,1):NEXTI:FORI=0TO15:INPUT#2,M(I):NEXT
31200 SYS8222:POKE2926,ASC(I$+CHR$(0)):SYS8222:O$(14)=I$
31300 FORI=1TO26:INPUT#2,CD(I,0),CD(I,1):NEXT:INPUT#2,N$:FORI=1TO8:SYS8222:KEYI,I$:NEXTI:FORI=0TO7:GET#2,A$:POKE2836+I,ASC(A$):NEXTI:GET#2,A$:CLOSE2
31400 POKE2852,M(4):POKE2853,PEEK(56577)ANDM(4)
31410 OPEN2,U,8,"sys.text,s,r":GOSUB31499:FORI=1TO34:SYS8222:T$(I)=I$:NEXTI:GOSUB31499:FORI=35TO42:SYS8222:T$(I)=I$:NEXTI
31420 GOSUB31499:FORI=43TO55:SYS8222:T$(I)=I$:NEXTI:GOSUB31499:FORI=56TO64:SYS8222:T$(I)=I$:NEXTI:GOSUB31499:FORI=65TO78:SYS8222:T$(I)=I$:NEXTI:GOSUB31499
31430 FORI=79TO86:SYS8222:T$(I)=I$:NEXTI:CLOSE2:GOTO31500
31499 FORI=1TO3:SYS8222:NEXT:RETURN
31500 POKE2835,1:PRINT"{clear}{down}Insert system data disks, press RETURN.":DO:GETKEYA$:LOOPUNTILA$=CHR$(13):I=0
31600 PRINT"{clear}{down}Reading user names...":OPEN2,D(4,0),2,STR$(D(4,1))+":sys.userfiles"
31700 I=I+1:RECORD#2,I:INPUT#2,UI$(I):IFLEN(UI$(I))<2ANDUI$(I)<>"^"THEN31800:ELSEPRINT"{home}{down*3}        {left*8}"I"users loaded.":GOTO31700
31800 UI$(I)="":RECORD#2,M(14)+1:FORI=2TO6:INPUT#2,O(I):NEXTI:CLOSE2
31900 POKE2847,50:POKE2823,1:POKE2825,50:POKE2824,1:POKE2827,0:POKE2829,1:POKE2850,0
32000 PRINT"{clear}{down}{cyan}Enter time {white}HH:MM{cyan} format: {yellow}";:X=5:GOSUB5:O$=I$:IFPEEK(238)=79THENPRINT"{up}"TAB(36);
32100 PRINT"{cyan}AM or PM ({white}a{cyan}/{white}p{cyan})? {yellow}";:DOUNTILI$="a"ORI$="p":GETI$:LOOP:PRINTI$:I=VAL(LEFT$(O$,2)):IFI=12ANDI$="a"THENI$="p":ELSEIFI=12ANDI$="p"THENI$="a"
32200 IFI$="p"THENI=I+80
32300 POKE56587,DEC(STR$(I)):POKE56586,DEC(RIGHT$(O$,2)):POKE56585,1:POKE56584,1:I=PEEK(56584)
32400 PRINT"{down}{cyan}Enter date {white}MM/DD/YY{cyan} format: {yellow}";:X=8:GOSUB5
32500 POKE2879,VAL(LEFT$(I$,2)):POKE2880,VAL(MID$(I$,4,2)):POKE2863,VAL(RIGHT$(I$,2))
32600 POKE2881,31:POKE2882,28:POKE2883,31:POKE2884,30:IFPEEK(2863)/4=INT(PEEK(2863)/4)THENPOKE2882,29
32700 POKE2885,31:POKE2886,30:POKE2887,31:POKE2888,31:POKE2889,30:POKE2890,31:POKE2891,30:POKE2892,31:IFPEEK(2880)>PEEK(2880+PEEK(2879))THEN32400
32800 GOSUB400:PRINTCHR$(13)+"{cyan}Is {white}"+O$(3)+" {cyan}correct ({white}y{cyan}/{white}n{cyan})? {yellow}";:DO:GETI$:LOOPUNTILINSTR("YyNn",I$):PRINTI$:IFI$="N"ORI$="n"THEN32000
32900 R$=CHR$(13):O$(12)="{131}Zelch 128 v1.0 Copyright (C)1990":SYS8216:O$(1)=I$:GOSUB400:O$(4)=O$(3):M7$=O$(3):M6$=UI$(1)
33000 I$="prg.logon":U=D(0,0):D=D(0,1):GOTO23
55555 OPEN1,8,15,"s0:bbs.setup":CLOSE1:DSAVE"bbs.setup",U8
