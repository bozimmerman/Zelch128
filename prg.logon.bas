!--------------------------------------------------
!- Tuesday, May 16, 2017 10:29:06 PM
!- Import of : 
!- c:\src\zelch128next\prg.logon.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625:REM =============== LOGON MODULE V1.0 =============== 09/22/90 =
30010 IFO(26)THENO(26)=0:GOTO50000
30100 ID=0:SYS15634:CLR:SYS15637:IFO(15)THENGOSUB35400:O$="{ct c}":GOTO34500:ELSEI=M(9):GOSUB450:CLOSE5:OPEN5,2,0,CHR$(PEEK(2576))
30120 GOSUB13:IFM(0)>2THEN30200:ELSEPRINT#5,R$R$R$:A$=O$(14):GOSUB2
30130 IFW1=408THENW1=0:GOTO35700
30200 POKE2822,0:POKE2823,1:POKE2824,0:POKE2825,0:POKE2827,0:POKE2829,0:POKE2830,0:POKE2831,0:POKE2844,0:POKE2845,1:POKE2850,1:POKE2953,0:POKE2954,0:POKE2958,0
30300 POKE2895,0:POKE2896,0:POKE2915,0:POKE2917,0:POKE2603,8:POKE2925,M(3):POKE2959,1:POKE2974,0:POKE2979,0:POKE2982,O(25):POKE2983,0:POKE2984,25
30350 FORI=8TO15:O(I)=0:NEXTI:FORI=0TO26:PL(I)=0:PL$(I)="":NEXTI:O(26)=0:FORI=0TO13:MB(I)=0:UB(I)=0:MB$(I)="":UB$(I)="":NEXTI
30370 MB$(7)="$":UB$(7)="$":MB$(1)="(none)":UB$(1)="(none)":MB$(6)="MESSAGE BASES":MB$(2)="?"
30400 O$="Waiting for call":GOSUB250:GOSUB300:TRAP360:SY$(1)="":U$(8)="1111"
30500 PRINT"{clear}";:WINDOW0,4,29,15:PRINTCHR$(27)"f";:PRINTR$"{clear}{light gray}{reverse on}{ct n}{cm t*29}":O$="{reverse on}                             "+R$+"{up}{reverse on} "
30600 PRINTO$TAB(13-(INT(LEN(N$)/2)))LEFT$(N$,27):PRINTO$R$O$R$O$R$O$"Total calls"TAB(20)":"O(4)
30700 PRINTO$"Calls since boot"TAB(20)":"O(0):PRINTO$"Number of feedback"TAB(20)":"O(2):P0=1:O(1)=0:O(7)=0:O(9)=0:O(20)=0
30800 PRINTO$"Logged errors"TAB(20)":"O(5):PRINTO$"New users"TAB(20)":"O(6):PRINT"{reverse on}{cm @*29}":O(3)=0
30900 SYS8216:PRINT"{home}{down*3}{right}{reverse on}"MID$("JanFebMarAprMayJunJulAugSepOctNovDec",((PEEK(2879)-1)*3)+1,3)PEEK(2880)TAB(21)I$
31200 IFPEEK(2961)THENGOSUB35900:GOSUB36666:I$="prg.monster":U=D(0,0):D=D(0,1):GOTO23
31300 IF(PEEK(56577)AND8)=8ORM(0)<3THEN31600:ELSEI=0:GOSUB18
31400 IF(PEEK(56577)ANDM(4))=0THEN34100:ELSEIFI<11THENI=I+1:SLEEP1:GOTO31400
31500 GOSUB13
31600 GETA$:IFA$=CHR$(27)ORPEEK(56320)=111THENX=1:GOTO32000
31602 IFA$="{ct c}"THENGOSUB35900:I$="prg.online utils":U=D(0,0):D=D(0,1):W1=9E9:GOTO23
31605 IFA$="{ct x}"THENPRINTCHR$(27)"x":WINDOW0,4,PEEK(238),23,1:PRINT"{down}{home}":SLOW:IFPEEK(215)THENFAST:GOTO30400:ELSEIFA$="{ct x}"THEN30400
31610 IF(PEEK(211)AND8)THENO(16)=ABS(O(16)-1):IFO(16)=0THENGOSUB35900
31620 IFO(16)ANDO(3)=0THENGOSUB35800
31630 IFA$=" "THENO(3)=1:TI$="000000":GOSUB35900
31640 IFO(3)ANDVAL(TI$)>10THENO(3)=0
31700 GET#5,A$:IFA$=""THEN30900:ELSEA=ASC(A$)AND127:IFA<>49THEN31800:ELSEGET#5,A$:IF(ASC(A$)AND127)=48THENI=2400:GOSUB450:GOTO34100:ELSEI=300:GOSUB450:GOTO34100
31800 IFA=53THENI=1200:GOSUB450:GOTO34100:ELSEIFA=50ANDINSTR(O$(14),"s0=0")THENSLEEP1:PRINT#5,"ata"
31900 GOTO30900
32000 GOSUB35900:A=PEEK(238)-34:POKE2829,1:POKE2845,0:WINDOWA,9,A+22,23
32090 W0=1:X=1:GOSUB32100:Y=1:GOTO32800
32100 TT$(0)="{cm m}{reverse on} Local Mode Options {reverse off}{cm g}":TT$(1)=" Local logon        ":TT$(2)=" SysOp logon        ":TT$(3)=" Zapterm            "
32200 TT$(4)=" Read feedback      ":TT$(5)=" View caller log    ":TT$(6)=" Check errorlog     ":TT$(7)=" New user apps      ":TT$(8)=" SysOp utility menu "
32300 PRINT"{clear} {cm @*20} ":PRINT"{cm m}{reverse on}                    {reverse off}{cm g}":PRINTTT$(0):PRINT"{cm m}{reverse on}                    {reverse off}{cm g}"
32400 FORI=1TO8:Y=I:GOSUB32600:NEXT:PRINT"{cm m}{reverse on}                    {reverse off}{cm g}":PRINT"{reverse off} {cm t*20}":RETURN
32500 PRINTLEFT$("{home}{down*11}",Y+4);
32600 I$="{reverse on}"+CHR$(PEEK(2835+W0)):IFY<>XTHENI$="{reverse on}{light gray}"
32700 PRINT"{reverse off}{light gray}{cm m}"I$TT$(Y)"{reverse off}{light gray}{cm g}":Y=Y+1:RETURN
32800 ID=0:A=0:TI$="000000":DOUNTILA$=CHR$(13):GETA$:W1=PEEK(56320):IFVAL(TI$)>20THENA$=CHR$(27):EXIT
32810 IFW1=125THENA$="{down}":ELSEIFW1=126THENA$="{up}":ELSEIFW1=111THENA$=R$
32850 I=INSTR("{up} {down}",A$):IFI=0THEN33100
32900 I=I-2:Y=X:X=X+I:IFX=0THENX=8:ELSEIFX=9THENX=1
32950 W0=W0+I:IFW0=0THENW0=M(15):ELSEIFW0>M(15)THENW0=1
33000 GOSUB32500:Y=X:GOSUB32500
33100 LOOPUNTILA$=CHR$(27):IFA$=CHR$(27)ANDPEEK(215)THENPRINT"{home}"SP$SP$SP$SP$:WINDOW0,4,29,15:PRINT:GOTO30900:ELSEIFA$=CHR$(27)THEN30500
33200 GOSUB36666:U=D(1,0):D=D(1,1):POKE2823,1:IFX=1THENBA=9600:GOSUB35300:GOTO34200:ELSEIFX=2THENI=1:BA=9600:GOSUB35300:GOTO35100
33300 IFX=3THENU=D(0,0):D=D(0,1):I$="prg.zapterm":GOTO23:ELSEIFX=8THENGOSUB35300:I=1:E=1:BA=9600:GOTO35100
33400 IFX=4THEN35500:ELSEIFX=5THENF$="sys.userlog":ELSEIFX=6THENF$="sys.errorlog":ELSE35450
33500 POKE2825,255:POKE2824,1:POKE2827,0:OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":PRINT"{clear}{ct n}";:INPUT#1,I:IFITHENCLOSE2:GOTO33700
33600 SYS8210:IFPEEK(255)=0THEN33650:ELSEPRINT"{ct n}"+CHR$(13)+"RETURN>";:DO:GETKEYA$:LOOPUNTILA$=CHR$(13):GOTO33600
33650 CLOSE2:PRINT"DELETE{sh space}(Y/N)? ";:C$="YN"+R$:GOSUB28:IFI>1THENCLOSE1:GOTO30200
33700 PRINT#1,"s"+MID$(STR$(D),2)+":"+F$:CLOSE1:IFMID$(F$,10)="log"ANDO(5)THENO(5)=0:GOTO35700
33800 IFMID$(F$,9)="user"ANDO(6)THENO(6)=0:GOTO35700:ELSE30200
34100 POKE2973,3:POKE2979,0:POKE2974,3:POKE2823,0:GOSUB35300:SYS8216:O$="Connect:"+STR$(BA)+" baud   /   On at: "+I$:GOSUB250:POKE2845,1
34200 SLEEP1:FORI=0TO50:GET#5,A$:NEXTI:PRINTO$(21);
34250 O$=T$(35):GOSUB4:C$=R$+CHR$(10)+"Z":GOSUB32:IFI=3THENI$="prg.network":U=D(0,0):D=D(0,1):W1=.1:GOTO23:ELSEO$=T$(36):GOSUB4
34300 O$=T$(21):POKE2829,1:DO:GOSUB8:LOOPUNTILA$>""ANDA$<>R$ANDA$<>CHR$(10):IFA$=CHR$(20)THENPOKE2845,0:O$=T$(21):GOTO34500:ELSEPOKE2829,0:O$=T$(22):GOSUB4
34400 O$=T$(37):GOSUB4:C$="NY"+R$:GOSUB28:POKE2845,SGN(I-1):O$=T$(23):IFI=1THENO$=T$(24):GOSUB4:ELSEGOSUB4
34410 O$=T$(94):GOSUB4:C$=R$+"NY":GOSUB28:O$=T$(92):IFI=3THENO$=T$(93):POKE2979,1
34500 GOSUB4:POKE2825,4:U=D(1,0):D=D(1,1):A$="":IFM(16+PEEK(2829))>1THENA$=STR$(INT(RND(TI)*(M(PEEK(2829)+16))+1))
34590 F$="sys.title"+A$:IFPEEK(2829)=0THENF$=F$+"/a":GOSUB25:ELSEGOSUB25
34600 ID=0:O$=T$(38):GOSUB4:X=16:GOSUB5:I=VAL(I$):IFI$="NEW"ORI$="New"THEN34800:ELSEIFI>0ANDI<501THEN34900
34700 IFI$<>""THENX=0:DO:X=X+1:LOOPUNTIL(UI$(X)="")OR(X>M(14))OR(UI$(X)=I$):IFUI$(X)=I$THENI=X:GOTO34900
34800 O$=T$(39):GOSUB4:C$="YN":GOSUB28:IFI=1THENI$="prg.new user":U=D(0,0):D=D(0,1):POKE2973,5:POKE2974,5:GOTO23:ELSE34600
34900 IFUI$(I)=""ORUI$(I)="^"THEN34700:ELSEO$=T$(40):GOSUB4:POKE2844,1:X=10:GOSUB5:IFI$=""THEN34600
35000 O$=I$:OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.userfiles":RECORD#2,I:SYS8222:SYS8222:CLOSE2:IFI$<>O$THENO$=T$(41):GOSUB4:GOTO34600
35100 ID=I:O$=T$(42):GOSUB4:OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.userfiles"
35150 RECORD#2,ID:FORI=1TO10:SYS8222:U$(I)=I$:NEXTI:FORI=1TO8:SYS8222:U(I)=VAL(I$):NEXTI:IFPEEK(2823)THENPOKE2915,SGN(PEEK(215))
35200 CLOSE2:U(6)=U(6)+1:POKE2959,VAL(MID$(U$(8),5,1)):POKE2915,VAL(MID$(U$(8),2,1))
35210 U=D(0,0):D=D(0,1):IFPEEK(2823)THENBLOAD"l-xfer 1300",U(U),D(D):O(19)=2:O$(23)="Local":GOTO35250:ELSEIFBA=2400THENPOKE2582,160+VAL(MID$(U$(8),9,1))
35220 A=VAL(MID$(U$(8),6,1)):IFA<>O(19)THENBLOAD(MID$("px",A+1,1)+"-xfer 1300"),U(U),D(D):O(19)=A:O$(23)="Punter":IFO(19)=1THENO$(23)="Xmodem"
35250 A=CD(ASC(U$(5))-192,2):POKE2973,A:POKE2974,A:IFE=0THEN2000:ELSE37000
35300 POKE2603,0:ID=0:PRINTCHR$(27)"e{clear}{light gray}"CHR$(27)"s";:POKE2825,3:POKE2824,1:POKE2827,0:O(1)=0
35400 O(15)=0:O(3)=0:E=0:GOSUB35900:GOSUB36666:RETURN
35450 W1=408:I$="prg.sysop":U=D(0,0):D=D(0,1):POKE2915,SGN(PEEK(215)):GOSUB35300:POKE2825,255:GOTO23
35500 F0$="sys.feedback":U0=D(6,0):D0=D(6,1):POKE2915,SGN(PEEK(215)):GOSUB35300:POKE2823,1:POKE2825,255:OPEN1,U0,15,"s"+MID$(STR$(D0),2)+":mail.work":CLOSE1
35600 PRINT"{clear}{ct n}";:U$(1)=UI$(1):ID=1:GOSUB8130:O(2)=W7:IFO(2)<0THENO(2)=0
35700 OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.misc data":RECORD#2,1:A$="":FORI=2TO6:A$=A$+STR$(O(I))+R$:NEXTI:PRINT#2,A$+O$(12):CLOSE2:POKE2915,0:GOTO30200
35800 SYS52684,1,34:SYS52684,1,35:FAST:RETURN
35900 SYS52684,125,34:SYS52684,100,35:IFPEEK(215)THENRETURN:ELSESLOW:RETURN
36666 WINDOW0,4,PEEK(238),23:RETURN
36667 GOSUB36666:PRINTCHR$(27)"s{clear}":LIST32000-
37000 O(21)=0:OPEN1,D(9,0),15:OPEN2,D(9,0),2,MID$(STR$(D(9,1)),2)+":"+O$(22)+",s,r":INPUT#1,E:IFETHENCLOSE2:CLOSE1:GOTO37100
37010 SYS8213:FORI=1TO4:SYS8222:NEXTI:IFPEEK(253)THENCLOSE2:CLOSE1:GOTO37100
37040 O(21)=O(21)+1:FORI=0TO4:SYS8222:M$(O(21),I)=I$:NEXTI
37050 IFPEEK(253)=0THEN37040:ELSECLOSE2:CLOSE1
37100 O$(15)=O$(20):POKE2825,255:GOSUB100:GOTO8990
49999 REM--------------------- LOGOFF ------------------------------------
50000 O(20)=0:F0$="mail.work":ONO(14)GOSUB8245:FORI=1TO4:CLOSEI:NEXT:IFPEEK(2824)=0THENO$=T$(9):GOSUB4
50010 IFINSTR(N$,"{ct c}")=0THENO$="{ct k}Elite Software{ct k}2968 W. Ina Rd. Suite 140{ct k}Tucson, Az 85741{ct k}":GOSUB4
50020 IFPEEK(212)=75ORID<1THEN50500:ELSEU(8)=PEEK(2983)
50030 O(4)=O(4)+1:O(0)=O(0)+1:GOSUB400:U(3)=BA:U$(6)=O$(17):OPEN1,D(1,0),15:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.userlog,s,a":SY$(6)=U$(1):SY$(7)=O$(3)
50040 INPUT#1,I:IFI<20THEN50050:ELSECLOSE2:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.userlog,s,w"
50050 SYS8216:O$="{cyan}":A$="":IFU$(5)="A"THENO$="{white}"
50060 PRINT#2,USINGO$+"{reverse on}########{reverse off}  {reverse on}#######{reverse off}-{reverse on}#######{reverse off} {reverse on}####{reverse off} {reverse on}###{reverse off} {reverse on}################{reverse off} {reverse on}################{reverse off}";O$(3),O$(1),I$,BA,ID,U$(1),U$(3)
50070 FORI=1TOP0:PRINT#2,P0$(I):P0$(I)="":NEXTI:CLOSE2:CLOSE1:A$="":OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.userfiles":RECORD#2,ID:A$=""
50080 IFO(19)<>2THENMID$(U$(8),6,1)=MID$(STR$(O(19)),2,1)
50090 FORI=1TO10:A$=A$+U$(I)+R$:NEXTI:FORI=1TO8:A$=A$+STR$(U(I))+R$:NEXTI:RECORD#2,ID:PRINT#2,A$:CLOSE2
50100 OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.misc data":RECORD#2,1:A$="":FORI=2TO6:A$=A$+STR$(O(I))+R$:NEXTI:PRINT#2,A$+O$(12):CLOSE2:P0=1
50500 POKE2896,0:GOSUB300:IFO(15)=0THENGOSUB13:GOTO30100:ELSE30100
55555 A=PEEK(186):OPEN1,A,15,"s0:prg.logon":CLOSE1:SAVE"prg.logon",A
