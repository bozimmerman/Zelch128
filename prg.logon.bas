!--------------------------------------------------
!- Monday, May 15, 2017 12:17:11 AM
!- Import of : 
!- c:\src\zelch128\prg.logon.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:REM =============== LOGON MODULE V1.0 =============== 09/22/90 =
30010 ID=0:SYS15634:CLR:SYS15637:IFO(15)THENGOSUB35400:O$="{ct c}":GOTO34500:ELSEI=M(9):GOSUB450:GOSUB13:IFM(0)>2THEN30200:ELSEPRINT#5,R$R$R$:A$=O$(14):GOSUB2
30200 POKE2822,0:POKE2823,1:POKE2824,0:POKE2825,0:POKE2827,0:POKE2829,0:POKE2830,0:POKE2831,0:POKE2844,0:POKE2845,1:POKE2850,1
30300 POKE2895,0:POKE2896,0:POKE2915,0:POKE2917,0:POKE2603,8:POKE2925,M(3):FORI=7TO15:O(I)=0:NEXTI
30400 O$="Waiting for call":GOSUB250:GOSUB300:TRAP360
30500 PRINTCHR$(27)"f";:PRINTR$"{clear}{light gray}{reverse on}{ct n}{cm t*29}":O$="{reverse on}                             "+R$+"{up}{reverse on} "
30600 PRINTO$TAB(13-(INT(LEN(N$)/2)))LEFT$(N$,27):PRINTO$R$O$R$O$R$O$"Total calls"TAB(20)":"O(4)
30700 PRINTO$"Calls since boot"TAB(20)":"O(0):PRINTO$"Number of feedback"TAB(20)":"O(2):P0=1:O(1)=0:O(7)=0:O(9)=0
30800 PRINTO$"Logged errors"TAB(20)":"O(5):PRINTO$"New users"TAB(20)":"O(6):PRINT"{reverse on}{cm @*29}"
30900 SYS8216:O$="{reverse on}"+MID$(STR$(PEEK(2879)),2)+"/"+MID$(STR$(PEEK(2880)),2):POKE2862,7:POKE2861,1:SYS15631:POKE2861,21:O$="{reverse on}"+I$:SYS15631
31000 A=VAL(I$):A$="":IFA=12THENA=A-12
31100 IFRIGHT$(I$,2)="pm"THENA=A+12
31200 IFPEEK(2916)=1ANDA=M(2)+1THENPOKE2916,0:ELSEIFPEEK(2916)=0ANDA=M(2)THENPOKE2916,1:I$="prg.monster":U=D(0,0):D=D(0,1):GOTO23
31300 IF(PEEK(56577)AND8)=8ORM(0)<3THEN31600:ELSEI=0:GOSUB18
31400 IF(PEEK(56577)ANDM(4))=0THEN34100:ELSEIFI<11THENI=I+1:SLEEP1:GOTO31400
31500 GOSUB13
31600 GETA$:IFA$=CHR$(27)THENX=1:GOTO32000
31610 IF(PEEK(211)AND8)THENO(16)=ABS(O(16)-1):IFO(16)=0THENGOSUB35900
31620 IFO(16)THENGOSUB35800
31700 A$="":GET#5,A$:IFA$<>"1"ANDA$<>CHR$(177)THEN31800:ELSEGET#5,A$:IFA$="0"ORA$=CHR$(176)THENI=2400:GOSUB450:GOTO34100:ELSEI=300:GOSUB450:GOTO34100
31800 IFA$="5"ORA$=CHR$(181)THENI=1200:GOSUB450:GOTO34100
31900 GOTO30900
32000 I$="{reverse off}":GOSUB35900:GOSUB32100:GOTO32800
32100 PRINT"{home}{down*4}":TT$(0)=" Local Mode Options ":TT$(1)=" Local logon        ":TT$(2)=" SysOp logon        ":TT$(3)=" Zapterm            "
32200 TT$(4)=" Read feedback      ":TT$(5)=" View userlog       ":TT$(6)=" Check errorlog     ":TT$(7)=" New user apps      ":TT$(8)=" Unleash monster    "
32300 Y=-3:A$="{left} {cm @*20} ":GOSUB32600:A$="                    ":GOSUB32600:A$=TT$(0):GOSUB32600:A$="                    ":GOSUB32600
32400 FORI=1TO8:A$=TT$(I):GOSUB32600:NEXT:A$="                    ":GOSUB32600:A$="{cm t*20}":GOSUB32600:RETURN
32500 PRINT"{home}{down*8}";:FORI=1TOY:PRINT"{down}";:NEXTI
32600 I$="{reverse on}"+CHR$(PEEK(2835+X)):IFY=-3ORY=10THENPRINTSPC((SGN(PEEK(215))*40));"{right*4}{reverse off}"A$:Y=Y+1:RETURN:ELSEIFY<>XTHENI$="{reverse on}{light gray}"
32700 Y=Y+1:PRINTSPC((SGN(PEEK(215))*40));"{right*3}{reverse off}{light gray}{cm m}"I$A$"{reverse off}{light gray}{cm g}":RETURN
32800 ID=0:A=0:DOUNTILA$=CHR$(13):GETA$:IFA$="{up}"THENA=X:X=X-1:IFX=0THENX=8
32900 IFA$="{down}"THENA=X:X=X+1:IFX=9THENX=1
33000 IFA$="{down}"ORA$="{up}"THENY=A:A$=TT$(A):GOSUB32500:Y=X:A$=TT$(X):GOSUB32500:ELSEIFA$=CHR$(27)THENEXIT
33100 LOOP:IFA$=CHR$(27)ANDPEEK(215)>1THENPRINT"{home}{down*4}":FORI=1TO14:A$="{left}                      ":Y=-3:GOSUB32600:NEXT:GOTO30900:ELSEIFA$=CHR$(27)THEN30500
33200 U=D(0,0):D=D(0,1):IFX=1THENPOKE2823,1:BA=9600:GOSUB35300:GOTO34200:ELSEIFX=2THENI=1:BA=9600:GOSUB35300:GOTO35100
33300 IFX=3THENI$="prg.zapterm":PRINTCHR$(27)"e";:POKE2603,0:GOTO23:ELSEIFX=8THENI$="prg.monster":GOTO23:ELSEU=D(1,0):D=D(1,1)
33400 IFX=4THEN35500:ELSEIFX=5THENF$="sys.userlog":ELSEIFX=6THENF$="sys.errorlog":ELSEF$="sys.new user"
33500 POKE2829,1:POKE2823,1:POKE2825,255:POKE2824,1:POKE2827,0:OPEN1,U,15:OPEN2,U,U,STR$(D)+":"+F$+",s,r":PRINT"{clear}{ct n}";:INPUT#1,I:IFITHENCLOSE1:CLOSE2:GOTO33700
33600 SYS8210:IFPEEK(253)=0THEN33650:ELSEPRINT"{ct n}"+CHR$(13)+"RETURN>";:DO:GETKEYA$:LOOPUNTILA$=CHR$(13):GOTO33600
33650 CLOSE2:CLOSE1:PRINT"DELETE{sh space}(Y/N)? ";:C$="YN":GOSUB28:PRINTA$:IFI=2THEN30200
33700 OPEN1,U,15,"s"+STR$(D)+":"+F$:CLOSE1:IFMID$(F$,10)="log"ANDO(5)THENO(5)=0:GOTO35700
33800 IFMID$(F$,9)="user"ANDO(6)THENO(6)=0:GOTO35700:ELSE30200
34100 POKE2823,0:GOSUB35300:SYS8216:O$="Connect:"+STR$(BA)+" baud   /   On at: "+I$:GOSUB250
34200 SLEEP1:FORI=0TO50:GET#5,A$:NEXTI:O$=T$(35):GOSUB4:C$=R$+CHR$(10):GOSUB28:O$=T$(36):GOSUB4
34300 O$=T$(21):POKE2845,0:DO:GOSUB8:LOOPUNTILA$>""ANDA$<>CHR$(13):IFA$<>CHR$(20)THENPOKE2829,0:O$=T$(22):POKE2845,1
34350 GOSUB4:O$="{ct c}":IFPEEK(2829)THEN34500
34400 O$=T$(37):GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THENO$=T$(24):POKE2845,0:ELSEO$=T$(23)
34500 GOSUB4:POKE2825,4:F$="sys.title":U=D(1,0):D=D(1,1):IFPEEK(2829)=0THENF$=F$+"/a":GOSUB25:ELSEGOSUB25
34600 ID=0:O$=T$(38):GOSUB4:POKE2831,1:POKE2895,1:POKE2847,16:GOSUB10:IFI$="NEW"THEN34800:ELSEIFI>0ANDI<501THEN34900
34700 IFI$<>""THENX=0:DO:X=X+1:LOOPUNTIL(UI$(X)="")OR(X>M(14))OR(UI$(X)=I$):IFUI$(X)=I$THENI=X:GOTO34900
34800 O$=T$(39):GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=1THENI$="prg.new user":U=D(0,0):D=D(0,1):GOTO23:ELSE34600
34900 IFUI$(I)=""ORUI$(I)="^"THEN34700:ELSEO$=T$(40):GOSUB4:POKE2844,1:X=8:GOSUB5:IFI$=""THEN34600
35000 O$=I$:OPEN2,D(4,0),2,STR$(D(4,1))+":sys.userfiles":RECORD#2,I:SYS8222:SYS8222:CLOSE2:IFI$<>O$THENO$=T$(41):GOSUB4:GOTO34600
35100 ID=I:O$=T$(42):GOSUB4:OPEN2,D(4,0),2,STR$(D(4,1))+":sys.userfiles":RECORD#2,ID:FORI=1TO9:INPUT#2,U$(I):NEXTI
35200 FORI=1TO3:INPUT#2,U(I):NEXTI:CLOSE2:GOSUB400:U$(9)=STR$(VAL(U$(9))+1):GOTO2000
35300 POKE2603,0:ID=0:PRINTCHR$(27)"e{clear}{white}"CHR$(27)"s";:POKE2825,3:POKE2824,1:POKE2827,0:O(1)=0:POKE2829,1:POKE2845,1
35400 O(15)=0:GOSUB35900:RETURN
35500 F1$="sys.feedback":U1=D(6,0):D1=D(6,1):GOSUB35300:POKE2823,1:POKE2825,255:OPEN1,U1,15,"s"+STR$(D1)+":mail.work":CLOSE1
35600 PRINT"{clear}{ct n}";:U$(1)=UI$(1):ID=1:GOSUB8130:O(2)=W7:IFO(2)<0THENO(2)=0
35700 OPEN2,D(4,0),2,STR$(D(4,1))+":sys.userfiles":RECORD#2,M(14)+1:A$="":FORI=2TO6:A$=A$+STR$(O(I))+CHR$(13):NEXTI:PRINT#2,A$;:CLOSE2:GOTO30200
35800 SYS52684,1,34:SYS52684,1,35:FAST:RETURN
35900 SYS52684,125,34:SYS52684,100,35:IFPEEK(215)THENRETURN:ELSESLOW:RETURN
55555 OPEN1,8,15,"s0:prg.logon":CLOSE1:SAVE"prg.logon",8
