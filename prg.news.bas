!--------------------------------------------------
!- Wednesday, May 17, 2017 12:21:26 AM
!- Import of : 
!- c:\src\zelch128next\prg.news.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625:REM ============== NEWSFILE MODULE V3.0 ============= 08/12/94 =
30005 IFO$(10)="REP"THEN50000
30010 ON(W1-500)GOTO31000,32000,33000,34000,35000,36000,37000:GOTO920
30020 OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":RETURN
30100 GOSUB4:IFW6$<>""THENC$=CHR$(20)+R$:GOSUB32:IFI=2THENO$=A$:GOSUB9:RETURN:ELSEIFW6$<>""THENFORX=1TOLEN(W6$):O$=CHR$(20):GOSUB9:NEXTX
30200 X=A:GOSUB5:IFI$=""THENRETURN:ELSEW6$=I$:RETURN
30300 O$=T$(105):GOSUB770:IFI>0ANDI<27THENRETURN:ELSEI=0:RETURN
30999 REM ----- CREATE/EDIT NEWSFILE
31000 GOSUB8030:IFETHEN920:ELSEGOSUB760:IFI<1ORI>26THENGOSUB30300
31010 W2=I-1:IFW2<0ORW2>25THEN920
31020 O(12)=2:O(10)=W2:OPEN1,U,15:GOSUB30020:INPUT#1,I:IFITHEN31030:ELSEIFW2>0THENFORI=1TOW2:SYS8213:NEXTI:IFPEEK(253)=0THEN31040
31025 IFW2=0THEN31040
31030 O$=T$(106):GOSUB4:O(12)=0:GOSUB400:W1$=O$(2):W2$="9912312359":W3$="SUBJECT":W5$="11111111111111111111111111":O(9)=0:GOTO31050
31040 O(9)=1:SYS8222:W1$=I$:SYS8222:W2$=I$:SYS8222:W3$=I$:SYS8222:W5$=I$:SYS8222:L=1:O$(5)="":GOSUB8350
31050 CLOSE2:CLOSE1:O$="{black}{ct k}New until date YYMMDDHHMM{ct k}             : {white}"+W1$+"{ct c}":W6$=W1$:A=10:GOSUB30100:W1$=W6$:IFLEN(W1$)<>10THEN31050
31060 O$="{black}{ct k}Deletion date  YYMMDDHHMM{ct k}             : {white}"+W2$+"{ct c}":W6$=W2$:A=10:GOSUB30100:W2$=W6$:IFLEN(W2$)<>10THEN31060
31070 O$="{black}{ct k}Subject      : {white}"+W3$+"{ct c}":W6$=W3$:A=20:GOSUB30100:W3$=W6$
31080 GOSUB41700:O(11)=0:O$(5)=W1$+R$+W2$+R$+W3$+R$+W5$:GOSUB1000:GOTO940
31999 REM -------- DELETE NEWSFILE
32000 GOSUB8030:IFETHEN920:ELSEGOSUB760:IFI<1ORI>26THENGOSUB30300
32010 I=I-1:IFI<0ORI>25THEN920:ELSEO$="{ct k}{black}Deleting...":GOSUB4:GOSUB40000:GOTO940
32999 REM -------- LIST NEWSFILE
33000 GOSUB8030:IFETHEN920:ELSEGOSUB760:X=0:IFI>0ANDI<27THENX=I-1:SY$="*":IFVAL(SY$)>0THENSY$="#"
33010 O$=R$:GOSUB9:GOSUB30020:IFX>0THENFORI=1TOX:SYS8213:NEXTI
33020 X=X+1:SYS8222:W1$=I$:SYS8222:SYS8222:W2$=I$:SYS8222:IFPEEK(253)THEN33060:ELSEIFMID$(I$,ASC(U$(5))-192,1)<>"1"THEN33050
33025 A$=CHR$(X+192):IFSY$="#"THENA$=RIGHT$(STR$(X),2)
33030 O$="{black}"+A$+") "+LEFT$(W2$+SP$,20)+"{f7}   New Until: ":W3$=U$(6):U$(6)=W1$:GOSUB400:U$(6)=W3$:O$=O$+O$(4):GOSUB4
33050 SYS8213:GOSUB8:IFA$<>" "THEN33020
33060 CLOSE2:CLOSE1:GOTO940
33999 REM -------- READ NEWSFILES
34000 GOSUB8030:IFETHEN920:ELSEGOSUB760:IFI<1ORI>26THENGOSUB30300
34010 W1=I-1:IFW1<0ORW1>25THEN920
34020 GOSUB30020:IFW1>0THENFORI=1TOW1:SYS8213:NEXTI
34030 FORI=1TO5:SYS8222:NEXTI:SYS8210:CLOSE2:GOSUB27:GOTO940
34999 REM -------- READ NEW NEWSFILES
35000 GOSUB8030:IFETHEN920
35010 GOSUB35060:GOTO940
35060 X=0:OPEN1,U,15:GOSUB30020:INPUT#1,I:IFI>20THENCLOSE1:CLOSE2:O$=T$(107):GOSUB4:RETURN
35080 SYS8222:IFU$(6)>I$THEN35120:ELSEA$=I$:SYS8222:SYS8222:SYS8222:IFMID$(I$,ASC(U$(5))-192,1)<>"1"THEN35120
35100 SYS8210:X=X+1:O$="RETURN>{ct c}":GOSUB4:C$=R$:GOSUB28:IFPEEK(255)THEN35080:ELSE35140
35120 SYS8213:IFPEEK(253)THEN35140:ELSE35080
35140 CLOSE1:CLOSE2:IFX=0THENO$=T$(108):GOSUB4
35150 RETURN
35999 REM -------- NETWORK NEWSFILE SEND
36000 GOSUB990:W8=VAL(SY$):IFSY$="*"THENO$="{ct k}{black}Number of days to stay new: {ct c}":GOSUB4:GOSUB10:W8=I:IFI$=""THEN920
36010 GOSUB990:W9=VAL(SY$):IFSY$="*"THENO$="{ct k}{black}Number of days till deletion: {ct c}":GOSUB4:GOSUB10:W9=I:IFI$=""THEN920
36020 F$="":GOSUB8125:IFO(11)ORL=1THEN920:ELSEU=D(5,0):D=D(5,1)
36030 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":net.newsfiles,s,w":INPUT#1,E:IFETHENCLOSE2:OPEN2,U,2,MID$(STR$(D),2)+":net.newsfiles,s,a":PRINT#2,CHR$(1)
36040 PRINT#2,STR$(W8)+R$+STR$(W9)+R$+"{white}{f4}":FORI=1TOL-1:PRINT#2,TT$(I):NEXT:CLOSE2:CLOSE1
36050 GOSUB400:I=W8:GOSUB36060:A$=I$:I=W9:GOSUB36060:O$(5)=A$+R$+I$+R$+"NEWS"+R$+O$(24):U=D(1,0):D=D(1,1):F$="sys.news":GOSUB1210:GOTO940
36060 W1=VAL(MID$(O$(2),1,2)):W2=VAL(MID$(O$(2),3,2)):W3=VAL(MID$(O$(2),5,2)):IFI=0THEN36090
36070 FORW4=1TOI:W3=W3+1:IFW3>PEEK(2880+W2)THENW3=1:W2=W2+1:IFW2>12THENW2=1:W1=W1+1
36080 NEXTW4
36090 I$=RIGHT$(STR$(W1),2)+RIGHT$(STR$(W2),2)+RIGHT$(STR$(W3),2)+"9999":DO:I=INSTR(I$," "):IFITHENMID$(I$,I,1)="0"
36095 LOOPUNTILI=0:RETURN
36999 REM -------- EXECUTE A SCRIPT FILE
37000 GOSUB8030:IFETHEN920:ELSE51000
40000 IFF$=""THENRETURN:ELSEX=0:OPEN1,U,15,"s"+MID$(STR$(D),2)+":sys.work":GOSUB30020:INPUT#1,E:IFETHENCLOSE1:CLOSE2:RETURN
40100 OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,w":INPUT#1,E:IFETHEN40700
40200 IFX=ITHENSYS8213:IFPEEK(253)THEN40500
40300 IFX>0THENPRINT#3,CHR$(1)
40400 GOSUB31:X=X+1:IFPEEK(253)THEN40500:ELSE40200
40500 INPUT#1,E:CLOSE3:CLOSE2:IFE>0THEN40700:ELSEPRINT#1,"s"+MID$(STR$(D),2)+":"+F$:PRINT#1,"r"+MID$(STR$(D),2)+":"+F$+"=sys.work"
40600 IFX=0THENPRINT#1,"s"+MID$(STR$(D),2)+":"+F$:CLOSE1:RETURN:ELSECLOSE1:RETURN
40700 O$="Disk error, clearing...":GOSUB4:PRINT#1,"s"+MID$(STR$(D),2)+":sys.work":PRINT#1,"v"+MID$(STR$(D),2):CLOSE1:RETURN
41700 IFLEN(W5$)<26THENW5$="00000000000000000000000000"
41705 O$="":FORX=1TO26:IFMID$(W5$,X,1)="1"THENA$=CHR$(X+192):ELSEA$=" "
41710 O$=O$+A$:NEXTX:O$="{ct k}{black}Access: {white}"+O$+"{ct c}":GOSUB4
41715 C$=CHR$(20)+R$:GOSUB32:IFI=2THENO$=A$:GOSUB9:RETURN
41720 FORX=1TO28:O$=CHR$(20):GOSUB9:NEXTX:O$=" Toggle: {ct c}":GOSUB4:X=26:GOSUB16:IFI$=""THENRETURN
41730 FORX=1TOLEN(I$):A=ASC(MID$(I$,X,1))-192:IFA<1ORA>26THEN41750
41740 MID$(W5$,A,1)=MID$(STR$(ABS(VAL(MID$(W5$,A,1))-1)),2)
41750 NEXTX:GOTO41705
42010 I$=MID$(STR$(VAL(I$)),2):RETURN
49999 REM ----------- WELCOME THE LOSER
50000 SYS8216:O$(1)=I$:GOSUB400:X=ASC(U$(5))-192:POKE2915,VAL(MID$(U$(8),2,1)):POKE2984,U(7)-2:IFLEFT$(O$(2),6)<>LEFT$(U$(6),6)THENU(6)=1:U(8)=CD(X,3)
50010 POKE2825,CD(X,1):POKE2983,U(8):IFCD(X,1)>U(8)THENPOKE2825,U(8)
50020 O$(17)=O$(2):O$(15)="":POKE2824,1:IFU(8)<1THENO$="{ct k}{black}Sorry, you have used your max{f7}amount of time for today!":GOSUB4:GOTO600
50030 IFPEEK(2823)THENPOKE2915,SGN(PEEK(215))
50040 IFU(6)>CD(X,0)THENO$=T$(11):GOSUB4:GOTO600
50050 O$="Sub:":GOSUB250:GOSUB100:U=D(1,0):D=D(1,1):F$="sys.logon":GOTO51000
50160 IFBA>=U(3)ORU(3)=0ORU(3)>1199ORBA>1199THENRETURN:ELSEO$="{ct k}{black}Change back to"+STR$(U(3))+" baud (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THENRETURN
50180 O$="{ct k}{black}Set your term for"+STR$(BA)+" baud,{f7}and press return.":GOSUB4:I=U(3):GOSUB450:C$=R$:GOSUB28:GOSUB100:RETURN
50200 OPEN1,D(5,0),15:OPEN2,D(5,0),2,MID$(STR$(D(5,1)),2)+":mail."+STR$(ID)+",s,r":INPUT#1,I:IFI>20THENCLOSE2:CLOSE1:O$=T$(12):GOSUB4:RETURN
50220 CLOSE1:CLOSE2:O$=T$(13):GOSUB4:C$="YN":GOSUB28:IFI=2THENRETURN
50240 U0=D(5,0):D0=D(5,1):F0$="mail."+STR$(ID):OPEN1,U0,15,"s"+MID$(STR$(D0),2)+":mail.work":GOTO8130
50260 O$(15)=O$(19):F$=O$(19)
50290 O(21)=0:OPEN1,D(9,0),15:OPEN2,D(9,0),2,MID$(STR$(D(9,1)),2)+":"+O$(22)+",s,r":INPUT#1,E:IFETHENCLOSE2:CLOSE1:GOTO900
50300 SYS8213:FORI=1TO4:SYS8222:NEXTI:IFPEEK(253)THENCLOSE1:CLOSE2:GOTO900
50310 O(21)=O(21)+1:FORI=0TO4:SYS8222:M$(O(21),I)=I$:NEXTI
50320 IFPEEK(253)=0THEN50310
50330 CLOSE2:CLOSE1:GOTO900
51000 X=-1:OPEN1,U,15:GOSUB30020:INPUT#1,A:IFATHENCLOSE1:CLOSE2:GOTO51020
51010 X=X+1:SYS8222:VT$(X)=I$:IFPEEK(253)=0THEN51010:ELSEVT$(X+1)="{pound}":CLOSE2:CLOSE1:GOTO51040
51020 IFO$(15)<>""THEN920:ELSEVT$(0)="display {f5}sys.welcome{f5}":VT$(1)="display {f5}sys.automessage{f5}":VT$(2)="news":VT$(3)="baud":VT$(4)="mail":VT$(5)="{pound}"
51030 REM ----------- CMDS TO LOWERCASE
51040 FORI=0TOX:C=LEN(VT$(I)):IFC<2ORLEFT$(VT$(I),1)=";"THENVT$(I)="":GOTO51090
51050 A=0:FORY=1TOC:A$=MID$(VT$(I),Y,1):IFA$="{f5}"THENA=ABS(I-1):GOTO51070:ELSEIFA=0THENMID$(VT$(I),Y,1)=CHR$(ASC(A$)AND127)
51070 NEXT
51090 NEXT:SY(7)=-1:TT$(0)="":VT(0)=0
51100 REM ----------- NEXT SCRIPT CMD
51110 CLOSE1:CLOSE15:CLOSE2:CLOSE3:CLOSE4:SY(7)=SY(7)+1:I$=VT$(SY(7)):U=0:D=0
51120 IFI$="{pound}"ANDO$(15)=""THEN50260:ELSEIFI$="{pound}"THEN940:ELSEIFI$=""THEN51110
51140 X=INSTR(I$,"{f5}"):IFX>0THENF$=MID$(I$,X+1)+"{f5}":F$=LEFT$(F$,INSTR(F$,"{f5}")-1):ELSEF$=""
51160 O$=F$:A=INSTR(I$,","):IFA>0THENU=VAL(MID$(I$,A-2)):D=VAL(MID$(I$,A+1))
51180 IFX>0THENA$=LEFT$(I$,X-1):GOTO51200:ELSEA$=I$
51200 X=0:RESTORE:DO:X=X+1:READC$:A=INSTR(A$,C$):LOOPUNTIL(A>0)ORC$="*":IFC$="*"THENX=0
51210 IFX<20THENONXGOSUB50160,50200,51600,53500,9080,51700,51850,52000,52300,52400,52500,52600,52700,52800,52900,53200,53300,53400,53600:GOTO51110
51220 IFX>19THENONX-19GOTO53700,53000,53100,53800,600,53900:GOTO51110:ELSE51110
51400 DATA BAUD,MAIL,NEWS,PRINT,LIST,DISPLAY,DOS,BRANCH,JUMP,CHECK,MOVE,GETKEY,INPUT,MATH,SETVAR,POKE,FILE,APPEND,TYPE,COMMAND,EXECUTE,RUN,MENU,LOGOFF,END,"*"
51500 REM ------------ COMMAND ROUTINES
51600 GOSUB51800:IFF$=""THENF$="sys.news":GOTO35060:ELSE35060
51700 GOSUB51800:GOTO26
51800 IFU<8THENU=D(1,0):D=D(1,1):RETURN:ELSERETURN
51830 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$:INPUT#1,E:CLOSE2:CLOSE1:RETURN
51850 GOSUB51800:OPEN1,U,15,F$:CLOSE1:RETURN
51900 IFU<0ORU>50THENU=0
51950 IFD<0ORD>50THEND=0:RETURN:ELSERETURN
52000 GOSUB51900:X=INSTR("$#",MID$(A$,A+6,1)):Y=INSTR("><=x",MID$(A$,A+7,1)):IFX=0ORY=0THENRETURN:ELSEIFX=2THEN52200:ELSEC=(TT$(U)=F$):A=(TT$(U)<F$)
52100 IF(C=0ANDY=3)OR(C<0ANDY=4)OR((A<0ORC<0)ANDY=1)OR(A=0ANDY=2)THENRETURN
52150 IFD<SY(7)+1THENSY(7)=D-2:RETURN:ELSEDO:SY(7)=SY(7)+1:LOOPUNTILVT$(SY(7))="{pound}"ORSY(7)=D-1:SY(7)=SY(7)-1:RETURN
52200 A=0:IFINSTR(F$,"e")=0THENA=VAL(F$):C=(A=VT(U)):A=(VT(U)<A):GOTO52100:ELSERETURN
52300 GOSUB51900:GOTO52150
52400 GOSUB51950:IFU<0ORU>1THENRETURN:ELSEX=INSTR("af",MID$(A$,A+5,1)):Y=ASC(F$+CHR$(0))-192:IFY<1ORY>26THENRETURN
52450 IF(X=1ANDU$(5)=F$)OR(X=2ANDMID$(U$(9),Y,1)=MID$(STR$(U),2))THEN52150:ELSERETURN
52500 GOSUB51900:X=INSTR("ou",MID$(A$,A+4,1)):Y=INSTR("$#",MID$(A$,A+5,1)):IFX+Y<2THENRETURN:ELSEIFX+Y=2THENTT$(U)=O$(D):RETURN
52550 IFX+Y=4THENVT(U)=U(D):RETURN:ELSEIFX=1ANDY=2THENVT(U)=O(D):RETURN:ELSEIFX=2ANDY=1THENTT$(U)=U$(D):RETURN:ELSERETURN
52600 GOSUB51900:IFF$=""THENRETURN:ELSEFORI=1TOLEN(F$):A=ASC(MID$(F$,I,1)):IFA>64ANDA<91THENMID$(F$,I,1)=CHR$(AOR128)
52650 NEXTI:C$=F$:GOSUB28:TT$(U)=A$:VT(D)=I:RETURN
52700 GOSUB51900:O$=F$:GOSUB4:GOSUB6:TT$(U)=I$:VT(D)=LEN(I$):IFINSTR(I$,"e")=0THENVT(D)=VAL(I$):RETURN:ELSERETURN
52800 GOSUB51900:X=INSTR("$#",MID$(A$,A+4,1)):IFX=1THENTT$(D)=TT$(U)+TT$(D):RETURN:ELSEIFX<2THENRETURN:ELSEX=INSTR("*+-/",MID$(A$,A+5,1)):IFX=0THENRETURN
52850 IFX=1THENVT(U)=VT(U)*VT(D):ELSEIFX=2THENVT(U)=VT(U)+VT(D):ELSEIFX=3THENVT(U)=VT(U)-VT(D):ELSEIFX=4ANDVT(D)>0THENVT(U)=VT(U)/VT(D)
52870 RETURN
52900 GOSUB51900:A=0:TT$(U)=F$:VT(D)=0:IFINSTR(F$,"e")=0THENVT(D)=VAL(F$):RETURN:ELSERETURN
53000 GOSUB51800:IFF$=""THEN51110:ELSEGOSUB51830:I$=F$:IFE=0THEN23:ELSE51100
53100 GOSUB51800:IFF$=""THEN51110:ELSEGOSUB51830:I$=F$:IFE=0THEN8940:ELSE51100
53200 IFU<0ORD<0ORD>255THENRETURN:ELSEPOKEU,D:RETURN
53300 GOSUB51800:X=INSTR("awr",MID$(A$,A+4,1)):IFX=3THEN51700:ELSEIFX=0ORF$=""THENRETURN:ELSEO(10)=0:O(12)=X-1:O(7)=0:O(9)=0:O(11)=0:GOTO1000
53400 GOSUB51800:OPEN1,U,15:IFF$=""THENRETURN
53420 OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,a":INPUT#1,E:IFETHENCLOSE2:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,w":INPUT#1,E:IFETHENCLOSE2:CLOSE1:RETURN
53450 X=INSTR(I$,"$"):Y=INSTR(I$,"#"):IFX+Y=0THEN53575:ELSEI=X:IFX=0OR(X>YANDY>0)THENI=Y
53470 I$=MID$(I$,I+1):A=VAL(I$):IFA<0ORA>50THEN53450:ELSEIFI=XTHENO$=TT$(A):GOTO53550:ELSEIFI=YTHENO$=STR$(VT(A)):GOTO53550:ELSE53450
53500 E=1:GOTO53550
53550 IFO$=""THENRETURN:ELSEIFE=1THENO$=O$+"{ct c}":GOSUB4:GOTO53450:ELSEPRINT#2,O$;:GOTO53450
53575 IFE=1THENRETURN:ELSEPRINT#2,R$;:CLOSE2:CLOSE1:PRINT"{up}":RETURN
53600 IFU<2ORU>6THENU=4
53650 OPEN2,U,D:E=0:GOTO53450
53700 IFF$=""THEN51110:ELSEO$(13)=F$:IFO$(15)=""THEN50260:ELSE920
53800 IFF$=""THEN51110:ELSEIFO$(15)=""THENO$(15)=F$:GOTO50270:ELSE900
53900 VT$(SY(7)+1)="{pound}":GOTO51110
55555 A=PEEK(186):OPEN1,A,15,"s0:prg.news":CLOSE1:DSAVE"prg.news",U(A):STOP
