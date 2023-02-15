!--------------------------------------------------
!- Wednesday, May 17, 2017 12:20:22 AM
!- Import of : 
!- c:\src\zelch128next\bbs.setup.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625:REM =============== SETUP MODULE V3.0 =============== 08/21/92 =
30010 OPEN5,2,5,CHR$(8)+CHR$(0)
30020 DIMP0$(101),U$(10),U(8),D(17,1),M(30),TT$(501),UI$(500),M$(50,6),CD(26,3),MR(50),MN$(50),MX(50),O(30),O$(30),T$(200),PL(26),PL$(26),PH$(27,4),DR$(12)
30030 DIMVT(50),VT$(50),UB$(20),UB(20),MB$(20),MB(20),SY$(20),SY(20),GB$(50),PR$(6,2),D$(17)
30100 PRINT"{home*2}";:POKE2847,160:A=SGN(PEEK(215))*5:IFATHENFAST
30200 GRAPHIC5:PRINT"{home*2}{clear}{ct n}{light gray}{reverse on} C{cm m} HNDL:                   ID:       CRD:       CALL:        {142}Q{ct n} EXT   {142}Q{ct n} MOR {cm g}G "
30300 PRINT"{reverse on} H{cm m} NAME:                   AC:       U/D:       BDAY:        {142}Q{ct n} DEL   {142}Q{ct n} LIN {cm g}R "
30400 PRINT"{reverse on} A{cm m} PH #:                   CO:       MSG:       TYPE:        {142}Q{ct n} SYS   {142}Q{ct n} CRM {cm g}F "
30500 PRINT"{reverse on} T{cm m} LAST:                   BD:       EML:       ABCDEFGHIJKLMNOPQRSTUVWXYZ {cm g}X "
30550 PRINT"{down*20}{reverse on}Sub:";:FORI=1TO62:PRINT" ";:NEXT:PRINT"{cm g}setup       {home}";
30560 RESTORE:FORX=0TO6:FORY=0TO2:READPR$(X,Y):NEXT:NEXT
30570 DATA "Local","l-xfer 1300","prg.msg bases","Punter","p-xfer 1300","prg.u/d bases","Xmodem","x-xfer 1300","prg.voting booth","Xmodem CRC","x-xfer 1300"
30580 DATA "prg.sysop","Xmodem 1k","k-xfer 1300","prg.news","Mul-Punter","p-xfer 1300","prg.misc",,,"prg.network"
30600 POKE53280,0:POKE53281,0:GRAPHIC0:PRINT"{home*2}{clear}{ct n}{light gray}{reverse on}C{cm g}Hndl:                  (#   )      {cm m}G"
30700 PRINT"{reverse on}H{cm g}Name:                  Call        {cm m}R"
30800 PRINT"{reverse on}A{cm g}Ph #:                  On @        {cm m}F"
30900 PRINT"{reverse on}T{cm g}ACS :    ABCDEFGHIJKLMNOPQRSTUVWXYZ{cm m}X"
31000 PRINT"{down*20}{reverse on}Sub:";:FORI=1TO22:PRINT" ";:NEXT:PRINT"{cm g}setup       {home}";:GRAPHICA:PRINT"{home}{down*5}":WINDOW0,4,PEEK(238),23
31100 PRINT"{clear}{down}{cyan}Reading system variables...":OPEN2,U,2,"0:sys.variables,s,r"
31150 FORI=0TO17:INPUT#2,D(I,0),D(I,1):SYS8222:D$(I)=I$:NEXTI:SYS8222:O(25)=INSTR("UF",I$)-1:FORI=0TO18:INPUT#2,M(I):NEXT
31200 SYS8222:POKE2926,ASC(I$+CHR$(0)):SYS8222:O$(14)=I$:FORI=18TO22:SYS8222:O$(I)=I$:NEXTI:O$(23)="Local":FORI=24TO25:SYS8222:O$(I)=I$:NEXTI
31300 FORI=1TO26:INPUT#2,CD(I,0),CD(I,1),CD(I,2),CD(I,3):NEXT:SYS8222:N$=I$:FORI=0TO7:POKE2836+I,0:NEXTI:FORI=0TOM(15)-1:GET#2,A$:POKE2836+I,ASC(A$):NEXTI
31400 CLOSE2:POKE2852,M(4):M(19)=PEEK(56577)ANDM(4):POKE2853,M(19)
31410 OPEN2,U,2,"0:sys.text,s,r":FORI=1TO123
31420 SYS8222:IFLEFT$(I$,1)=";"THEN31420:ELSET$(I)=I$:NEXTI:CLOSE2
31500 POKE2835,1:PRINT"{clear}{down}Insert system data disks, press RETURN.":TI$="000000":DO:GETA$:LOOPUNTILA$=CHR$(13)ORVAL(TI$)>240:I=0
31600 A=0:PRINT"{clear}{down}Reading user names...":OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.userfiles":PRINT"{down}{right*3}0 users loaded."
31700 I=I+1:RECORD#2,I:SYS8222:UI$(I)=I$:IFUI$(I)="^"THEN31700:ELSEIFUI$(I)="{pound}"THEN31800:ELSEPRINTUSING"{home}{down*3}####";I:A=A+1:GOTO31700
31800 UI$(I)="":PRINT:PRINTUSING"#### active users.";A:CLOSE2:PRINT"{down*2}Loading miscellaneous data..."
31810 OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.misc data":RECORD#2,1:FORI=2TO6:INPUT#2,O(I):NEXTI:SYS8222:O$(12)=I$
31820 SYS8222:O$(26)=I$:RECORD#2,2:A$="":FORI=1TO10:SYS8222:A$=A$+I$:POKE4095+I,LEN(I$):NEXTI:FORI=1TOLEN(A$):A=ASC(MID$(A$,I,1)):IFA=11THENA=13
31825 POKE4105+I,A:NEXTI:CLOSE2
31850 CLOSE1:CLOSE2:OPEN1,D(1,0),15:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.one liners,s,r":INPUT#1,I:IFI>20THENCLOSE2:CLOSE1:GOTO31900:ELSEDIMOL$(100):I=1
31860 SYS8222:OL$(I)=I$:IFPEEK(253)=0ANDI<100THENI=I+1:GOTO31860:ELSECLOSE2:CLOSE1:OL$(0)=STR$(I)
31900 POKE2982,0:POKE2847,50:POKE2823,1:POKE2825,50:POKE2824,1:POKE2827,0:POKE2829,1:POKE2850,0:SP$="":FORI=1TO100:SP$=SP$+" ":NEXTI
31950 A=0:I$="1":DO:IF(D(A,0)<>PEEK(2985))AND(A<7ORA>8)THENOPEN2,D(A,0),15:SYS8264:IFST=0THENPRINT#2,"t-ra":SYS8222
31975 A=A+1:CLOSE2:LOOPUNTILVAL(I$)=0ORA=12:CLOSE2:W9$="":IFVAL(I$)=0THENW9$=I$:O$=MID$(W9$,15,5):I$=MID$(W9$,24,1):GOTO32150
32000 PRINT"{clear}{down}{cyan}Enter time {white}HH:MM{cyan} format: {yellow}";:POKE2847,5:POKE2895,1:POKE2831,1:GOSUB6:O$=I$:IFLEN(I$)<>5THEN32000:ELSEIFPEEK(238)=79THENPRINT"{up}"TAB(36);
32100 PRINT"{cyan}AM or PM ({white}a{cyan}/{white}p{cyan})? {yellow}";:DOUNTILI$="a"ORI$="p":GETI$:LOOP:PRINTI$
32150 I=VAL(LEFT$(O$,2)):IFI=12ANDI$="a"THENI$="p":ELSEIFI=12ANDI$="p"THENI$="a"
32200 IFI$="p"THENI=I+80
32300 POKE56587,DEC(STR$(I)):POKE56586,DEC(RIGHT$(O$,2)):POKE56585,1:POKE56584,1:I=PEEK(56584)
32310 A=M(2):I$="a":IFA>12THENA=A-12:I$="p"
32320 IFA=12ANDI$="a"THENI$="p":ELSEIFA=12ANDI$="p"THENI$="a"
32330 IFI$="p"THENA=A+80
32340 POKE2960,DEC(STR$(A))
32400 IFW9$>""THENI$=MID$(W9$,6,8):ELSEPRINT"{down}{cyan}Enter date {white}MM/DD/YY{cyan} format: {yellow}";:X=8:GOSUB5:IFLEN(I$)<>8THEN32400
32500 POKE2879,VAL(LEFT$(I$,2)):POKE2880,VAL(MID$(I$,4,2)):POKE2863,VAL(RIGHT$(I$,2))
32600 POKE2881,31:POKE2882,28:POKE2883,31:POKE2884,30:IFPEEK(2863)/4=INT(PEEK(2863)/4)THENPOKE2882,29
32700 POKE2885,31:POKE2886,30:POKE2887,31:POKE2888,31:POKE2889,30:POKE2890,31:POKE2891,30:POKE2892,31:IFPEEK(2880)>PEEK(2880+PEEK(2879))THEN32400
32800 IFW9$>""THEN32900:ELSEGOSUB400:PRINTCHR$(27)"s"CHR$(13)+"{cyan}Is {white}"+O$(3)+" {cyan}correct ({white}y{cyan}/{white}n{cyan})? {yellow}";
32850 TI$="000000":DO:GETI$:LOOPUNTILINSTR("yn",I$)ORVAL(TI$)>60:PRINTI$:IFI$="n"THENW9$="":GOTO32000
32900 R$=CHR$(13):SYS8216:O$(1)=I$:GOSUB400:O$(4)=O$(3):SY$(7)=O$(3):SY$(6)=UI$(1)
32910 FORI=0TO3:POKE2963+I,PEEK(804+I):POKE2967+I,PEEK(810+I):NEXTI
33000 O(21)=0:O(26)=0
33040 CLOSE2:CLOSE1
34000 I$="prg.logon":U=D(0,0):D=D(0,1):GOTO23
55555 U=PEEK(186):OPEN1,U,15,"s0:bbs.setup":CLOSE1:DSAVE"bbs.setup",U(U)
