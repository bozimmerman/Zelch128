!--------------------------------------------------
!- Monday, May 15, 2017 3:02:58 AM
!- Import of : 
!- c:\src\zelch128\prg.network.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:REM ============== NETWORK MODULE V1.0 ============== 09/02/91 =
30010 IFW1=9E9THEN50000:ELSEON(W1-700)GOTO31000,32000,33000,34000,35000:GOTO920
30020 I$="":TI$="000000"
30030 GET#5,A$:IFA$=""ANDVAL(TI$)<30THEN30030:ELSEIFA$=""THEN30050
30040 IFA$=R$ORLEN(I$)>50THENRETURN:ELSEI$=I$+A$:GOTO30030
30050 GOSUB13:I$="prg.logon":U=D(0,0):D=D(0,1):GOTO23
30060 O$=T$(119):GOSUB4:X=1:GOSUB5:IFI$=""THENI=0:RETURN:ELSEI=ASC(I$)-192:IFI<1ORI>26THENI=0:RETURN
30070 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.network":RECORD#2,I:SYS8222:IFLEN(I$)<2THENCLOSE2:I=0:RETURN:ELSESYS8222:SYS8222:M4$=I$
30080 SYS8222:W1$=I$:RECORD#2,27:FORX=1TO3:SYS8222:NEXTX:CLOSE2:W2$=I$:RETURN
31000 GOSUB400:GOSUB30060:IFI=0THEN920:ELSEO$=T$(120):GOSUB4:X=16:GOSUB5:IFI$=""THEN920:ELSEF$="net."+MID$(W1$,2):U=D(5,0):D=D(5,1)
31010 O$(5)=MID$(M4$,2)+R$+MID$(W2$,2)+R$+"1"+I$+R$+U$(1)+R$+STR$(ID)+R$+O$(3):GOSUB8125:IFO(11)THEN920:ELSE940
32000 GOSUB400:GOSUB30060:IFI=0THEN920:ELSEF$="net."+MID$(W1$,2):U=D(5,0):D=D(5,1)
32010 O$(5)=MID$(M4$,2)+R$+MID$(W2$,2)+R$+"2"+R$+U$(1)+R$+STR$(ID)+R$+O$(3):GOSUB8125:IFO(11)THEN920:ELSE940
33000 O$="":GOSUB4:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.network":X=0:DO:X=X+1:RECORD#2,X:SYS8222:IFLEN(I$)<2THEN33050:ELSEW1$=I$:SYS8222:SYS8222
33010 O$="{black}"+CHR$(192+X)+") "+W1$+LEFT$(SP$,22-LEN(W1$))+I$:GOSUB4
33050 GOSUB8:IFA$=" "ORI$="{pound}"THENEXIT
33060 LOOPUNTILX=26:CLOSE2
33070 IFA$=" "THEN920:ELSE940
34000 A$="":FORI=1TOLEN(N$):A=ASC(MID$(N$,I,1)):IFA>64ANDA<91THENA$=A$+CHR$(AOR128):ELSEA$=A$+CHR$(A)
34001 NEXTI:O$="{ct k}{black}Enter {f5}"+A$+"{f5} as the system{f7}name to re-enter your host data.":GOSUB4
34006 O$="{ct k}{black}System name: {ct c}":GOSUB4:X=20:GOSUB5:TT$(1)=I$:Y=0:IFTT$(1)=A$THENY=1
34010 O$="{black}Incoming password: {ct c}":GOSUB4:X=10:GOSUB5:TT$(2)=I$
34020 O$="{ct k}{black}Actual phone number:":GOSUB4:GOSUB34500:TT$(3)=W1$
34030 O$="{ct k}{black}Network to number:":GOSUB4:GOSUB34500:TT$(4)=W1$
34040 O$="{ct k}{black}Baud rate: {ct c}":GOSUB4:X=4:GOSUB5:IFI$<>"300"ANDI$<>"1200"ANDI$<>"2400"THEN34040:ELSETT$(5)=MID$(STR$(VAL(I$)/300),2)
34050 O$="{ct k}{black}S)ave, E)dit, A)bort: {white}{ct c}":GOSUB4:C$="SEA":GOSUB28:O$=A$:GOSUB4:ONIGOTO34060,34000,920
34060 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.network":X=27:IFY=0THENX=0:DO:X=X+1:RECORD#2,X:SYS8222:IFLEN(I$)>2THEN34100
34070 A$="":FORI=1TO5:A$=A$+TT$(I)+R$:NEXTI:RECORD#2,X:PRINT#2,A$;:IFYTHENCLOSE2:GOTO34110:ELSEEXIT
34100 LOOPUNTILX>26:CLOSE2
34110 IFX>26ANDY=0THENO$="{ct k}Sorry, no open record slots!":GOSUB4:GOTO920:ELSE940
34500 W1$="":O$="{black}Area code (XXX): {white}{ct c}":GOSUB4:GOSUB10:IFI<100ORI>999THEN34500:ELSEA=I
34510 O$="{black}Phone number (XXXYYYY): {white}{ct c}":GOSUB4:X=7:GOSUB5:IFLEN(I$)<>7ORINSTR(I$,"-")THEN34510:ELSEW2$=I$
34520 O$="{black}Is this a local call (y/n)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:W1$=MID$("L1",I,1)+MID$(STR$(A),2)+W2$:RETURN
35000 GOSUB30060:IFI=0THEN920:ELSEOPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.network":O$="{ct k}Deleting "+M4$:GOSUB4
35010 RECORD#2,I:PRINT#2,"^"+R$+"{ct c}"+R$+" 0000000000"+R$+" 0000000000"+R$+"1":CLOSE2:GOTO940
50000 DO:GET#5,A$:LOOPUNTILA$="":Y=1:O(19)=0:O$(23)="Punter":BLOAD"p-xfer 1300",U(D(0,0)),D(D(0,1)):PRINT#5,"GGGGGG";
50005 GOSUB30020:W1$=I$:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.network":FORX=1TO27:FORI=0TO4:SYS8222:M$(X,I)=I$:NEXTI:NEXTX:CLOSE2
50010 W1=0:DO:W1=W1+1:LOOPUNTILW1>26ORW1$=M$(W1,1):IFW1>26THENPRINT#5,"BBBBBB";:Y=Y+1:IFY<5THEN50005
50020 IFY>4THEN30050:ELSEPRINT"{clear}";:O$="Networking with "+M$(W1,2):GOSUB250
50022 U=D(1,0):D=D(1,1):OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":sys.userlog,s,w":INPUT#1,E:IFETHENCLOSE2:OPEN2,U,2,MID$(STR$(D),2)+":sys.userlog,s,a"
50025 PRINT#2,"{reverse on}{light blue}NETWORKED WITH "+M$(W1,2)+R$:CLOSE2:CLOSE1
50030 PRINT#5,"GGGGGGGG";:U=D(5,0):D=D(5,1):F$="net."+MID$(M$(27,2),2):GOSUB590:SYS4885:SYS4873:IFPEEK(512)=1THEN30050
50040 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,a":PRINT#2,"{ct a}":INPUT#1,E:IFE>19THENCLOSE2:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,w"
50050 SLEEP1:SYS59074:SYS4885:SYS4867:SLEEP1:POKE2585,PEEK(2584):CLOSE2
50060 IFPEEK(215)THENFAST
50070 F$="net."+MID$(M$(W1,2),2):SLEEP7:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":INPUT#1,E:CLOSE2:CLOSE1:IFETHENPRINT#5,"BBBBBBBBBB";:GOTO30050
50080 PRINT#5,"GGGGGGG";:I=2:SLEEP1:GOSUB550:OPEN1,U,15,"s"+MID$(STR$(D),2)+":"+F$:CLOSE1:GOTO30050
55555 U=PEEK(186):OPEN1,U,15,"s"+MID$(STR$(D),2)+":prg.network":CLOSE1:DSAVE"prg.network",U(U),D(0):STOP
