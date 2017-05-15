!--------------------------------------------------
!- Monday, May 15, 2017 3:02:30 AM
!- Import of : 
!- c:\src\zelch128\prg.misc.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625:REM ================== MISC OP-CODES =============== 07/05/91 =
30010 W1=W1-600:IFW1=9E9-600THEN50000:ELSEONW1GOTO30012,40000,44000:GOTO940
30012 RESTORE:W2=1
30015 READX,Y:A$="":IFXTHENFORI=XTOY:READA:A$=A$+CHR$(A):NEXTI:TT$(99+W2)=A$:W2=W2+1:W6=I:GOTO30015
30020 O$="{ct k}{black}Menu to edit: {ct c}":GOSUB4:GOSUB6:IFI$=""ORLEN(I$)>16THEN920:ELSEO$(6)=I$:U=D(9,0):D=D(9,1):FORI=0TO30:FORY=0TO4:M$(I,Y)="":NEXTY:NEXTI
30050 U0=0:O$="{ct k*2}{black}Menu Text: {ct c}":GOSUB4:F$=O$(6):O(12)=2:O(10)=0:GOSUB8330:O(12)=0:IFI>20THENO$="{ct k*2}New Menu!":GOSUB4:GOTO30080
30060 O$="{ct k*2}{black}Menu Cmds: {ct c}":GOSUB4:OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r"
30065 SYS8213:IFPEEK(253)THEN30080:ELSEO$=T$(18):GOSUB4:FORI=0TO30:M$(I,0)="":NEXTI
30070 FORI=0TO3:SYS8222:VT$(I)=I$:NEXTI:IFPEEK(253)THEN30100:ELSEDO:U0=U0+1:FORI=0TO4:SYS8222:M$(U0,I)=I$:NEXTI:LOOPUNTILPEEK(253)
30080 CLOSE1:CLOSE2:O$="{ct k*2}{black}"+STR$(U0)+" commands in memory.{ct k}":GOSUB4
30100 O$="{ct k}{light green}("+MID$(STR$(U0),2)+"){white}<?>{yellow}Edit: {white}{ct c}":GOSUB4:C$="?QSVTCIEPDL":GOSUB28:O$=A$:GOSUB4
30105 ONIGOTO30110,31000,32000,33000,34000,35000,36000,37000,38000,39000,34500
30110 GOSUB39900:GOTO30100
31000 E=0:O$="{black}{ct k}Quit: Confirm (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THEN30100:ELSEO(12)=0:O(9)=0:FORI=0TO200:TT$(I)="":NEXT:O$(15)=O$(16):GOTO8990
32000 O$="{black}{ct k}Save: Confirm (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THEN30100:ELSEO$="{ct k}Saving...":GOSUB4
32100 OPEN1,U,15,"s"+MID$(STR$(D),2)+":"+O$(6):OPEN2,U,2,MID$(STR$(D),2)+":"+O$(6)+",s,w":FORI=0TOL-1:PRINT#2,TT$(I):NEXTI:PRINT#2,CHR$(1)
32110 FORI=0TO3:PRINT#2,VT$(I):NEXTI:IFU0=0THEN32120:ELSEFORX=1TOU0:FORY=0TO4:PRINT#2,M$(X,Y):NEXTY:NEXTX
32120 CLOSE2:CLOSE1:GOTO30100
33000 O$="{clear}{ct k}":GOSUB4:FORI=0TOL-1:O$=TT$(I):GOSUB4:NEXTI:GOTO30100
34000 F$="":O(9)=1:O(12)=0:GOSUB1000:GOTO30100
34500 I=0:DO:I=I+1:O$="{ct k}{black}Command: "+M$(I,0)+"{f7}Access: "+M$(I,1):GOSUB4:O$="Description: "+M$(I,2):GOSUB4:GOSUB8:LOOPUNTILI=U0ORA$=" ":GOTO30100
35000 O$="{ct k}{black}(Current mode is "+MID$("non {reverse off*4}",(VAL(LEFT$(VT$(0),1))*4)+1,4)+"display.)":GOSUB4:O$="Display text before menu (y/n)? {ct c}":GOSUB4:C$="NY":GOSUB28
35005 O$=A$:GOSUB4:MID$(VT$(0),1,1)=MID$(STR$(I-1),2,1)
35010 O$="{ct k}{black}(Current autocommand is {f5}":IFASC(MID$(VT$(0),2,1))=0THENO$=O$+"NONE{f5}.":GOSUB4:ELSEO$=O$+MID$(VT$(0),2,1)+"{f5}.":GOSUB4
35020 O$="Enter autocommand: {ct c}":GOSUB4:GOSUB6:IFI$=""THENI$=CHR$(0):ELSEIFLEN(I$)>1THENO$="{ct k}One letter only!{ct k}":GOSUB4:GOTO35020
35030 VT$(0)=LEFT$(VT$(0),1)+I$:GOTO30100
36000 O$="{ct k}{black}Current menu ID is {f5}"+VT$(1)+"{f5}.":GOSUB4:O$="Enter new 3 letter ID: {ct c}":GOSUB4:X=3:GOSUB5:IFLEN(I$)=3THENVT$(1)=I$:GOTO30100:ELSE30100
37000 O$="{ct k}{black}Enter command letter: {ct c}":GOSUB4:X=1:GOSUB5:IFI$=""THEN30100
37010 GOSUB39500:I=1:DO:IFM$(I,0)=I$THENEXIT:ELSEI=I+1:LOOPUNTILI>U0:IFI>U0THENI=U0+1:U0=U0+1:M$(I,0)=I$
37020 D0=I:O$="{black}{ct k}Description: "+M$(D0,2):GOSUB4:O$="        Now: {ct c}":GOSUB4:GOSUB6:IFI$<>""THENM$(D0,2)=I$
37025 W2$="{black}{ct k}Access: {ct c}":W1$=M$(D0,1):GOSUB39700:M$(D0,1)=W1$
37030 X=0:A$=M$(D0,3):IFA$=""THENY=0:GOTO37100
37040 X=X+1:VT(X)=VAL(A$):IFINSTR(A$,"{f4}")THENA$=RIGHT$(A$,LEN(A$)-INSTR(A$,"{f4}")):GOTO37040
37050 A$=M$(D0,4):Y=0
37060 Y=Y+1:IFINSTR(A$,"{f4}")THENVT$(Y+5)=LEFT$(A$,INSTR(A$,"{f4}")-1):A$=RIGHT$(A$,LEN(A$)-INSTR(A$,"{f4}")):GOTO37060:ELSEVT$(Y+5)=A$
37100 O$="{clear}{ct k}{white}{reverse on}##  Opcode    #data":GOSUB4:IFX=0THEN37200:ELSEE=0:FORI=1TOX:A=VT(I):W1=INT(A/100)
37110 O$="{white}{reverse on}"+RIGHT$(SP$+STR$(I),2)+"{reverse off}{black}"+RIGHT$(SP$+STR$(A),6):W2=ASC(MID$(TT$(W1+100),A-(W1*100),1)):E=E+W2:O$=O$+RIGHT$(SP$+STR$(W2),10):GOSUB4:NEXTI
37120 IFE<>YTHENO$="{ct k}Datafield error!":GOSUB4
37200 O$="{ct k}{black}Q)uit, A)dd, E)dit, I)nsert, D)elete: {ct c}":GOSUB4:C$="QAEID":GOSUB28:O$=A$:GOSUB4:ONIGOTO37210,37300,37400,37500,37600:GOTO37200
37210 A$="":FORI=1TOX:A$=A$+MID$(STR$(VT(I)),2)+"{f4}":NEXTI:A$=LEFT$(A$,LEN(A$)-1):M$(D0,3)=A$
37220 A$="":FORI=1TOY:A$=A$+VT$(I+5)+"{f4}":NEXTI:A$=LEFT$(A$,LEN(A$)-1):M$(D0,4)=A$:GOTO30100
37300 O$="{ct k}{black}Enter new op-code #{ct c}":GOSUB4:GOSUB10:IFI=0ORI>W6THEN37100:ELSEX=X+1:VT(X)=I:A=I:W1=INT(A/100):W1=ASC(MID$(TT$(W1+100),A-(W1*100),1))
37310 IFW1=0THEN37100:ELSEFORI=1TOW1:O$="Enter datafield "+CHR$(I+192)+"{ct k}:{ct c}":GOSUB4:GOSUB6:IFI$=""THENI$="*"
37320 VT$(Y+6)=I$:Y=Y+1:NEXTI:GOTO37100
37400 O$="{ct k}{black}Which one? {ct c}":GOSUB4:GOSUB10:IFI=0ORI>XTHEN37100:ELSEA=VT(I):W1=INT(A/100):W1=ASC(MID$(TT$(W1+100),A-(W1*100),1)):IFW1=0THEN37100
37405 W7=PEEK(2925):POKE2925,0:W2=0:IFI=1THEN37410:ELSEFORW3=1TOI-1:A=VT(W3):W4=INT(A/100):W2=W2+ASC(MID$(TT$(W4+100),A-(W4*100),1)):NEXTW3
37410 FORI=1TOW1:O$="{ct k}Datafield "+CHR$(I+192)+": "+VT$(W2+I+5)+"{ct k}Enter new datafield "+CHR$(I+192)+"{ct k}:{ct c}":GOSUB4:GOSUB6:IFI$=""THENI$=VT$(W2+I+5)
37420 VT$(W2+I+5)=I$:NEXTI:POKE2925,W7:GOTO37100
37500 O$="{ct k}{black}Insert at which? {ct c}":GOSUB4:GOSUB10:IFI=0ORI>XTHEN37100:ELSEW2=I:O$="{ct k}{black}Insert op-code : {ct c}":GOSUB4:GOSUB10:IFI=0ORI>709THEN37100:ELSEA=I
37510 W1=INT(A/100):W1=ASC(MID$(TT$(W1+100),A-(W1*100),1)):FORI=X+1TOW2+1STEP-1:VT(I)=VT(I-1):NEXTI:VT(W2)=A:X=X+1
37515 W3=0:IFW1=0THEN37100:ELSEIFW2=1THEN37520:ELSEFORW4=1TOW2-1:A=VT(W4):W5=INT(A/100):W3=W3+ASC(MID$(TT$(W5+100),A-(W5*100),1)):NEXTW4
37520 FORW4=Y+W1TOW3+W1STEP-1:VT$(W4+5)=VT$(W4-W1+5):NEXTW4:Y=Y+W1:FORW4=W3+1TOW3+W1:VT$(W4+5)="*":NEXTW4:W2=W3:GOTO37410
37600 O$="{ct k}{black}Delete which? {ct c}":GOSUB4:GOSUB10:IFI=0ORI>XTHEN37100:ELSEA=VT(I):W5=I:W1=INT(A/100):W1=ASC(MID$(TT$(W1+100),A-(W1*100),1))
37610 FORI=W5TOX+1:VT(I)=VT(I+1):NEXTI:X=X-1
37615 W2=0:IFW5=1THEN37620:ELSEFORW3=1TOW5-1:A=VT(W3):W4=INT(A/100):W2=W2+ASC(MID$(TT$(W4+100),A-(W4*100),1)):NEXTW3:IFW1=0THEN37100
37620 FORI=W2+1TOY+W1:VT$(I+5)=VT$(I+W1+5):NEXTI:Y=Y-W1:GOTO37100
38000 O$="{ct k}{black}Current ASCII prompt is:{ct k}"+VT$(2):GOSUB4:O$="{ct k}Enter ASCII prompt:":GOSUB4:GOSUB6:IFI$=""THEN30100:ELSEVT$(2)=I$
38010 O$="{ct k}{black}Current COLOR prompt is:{ct k}"+VT$(3):GOSUB4:O$="{ct k}Enter COLOR prompt:":GOSUB4:GOSUB6:IFI$=""THEN30100:ELSEVT$(3)=I$:GOTO30100
39000 O$="{ct k}{black}Enter command letter: {ct c}":GOSUB4:X=1:GOSUB5:IFI$=""ORU0=0THEN30100
39010 GOSUB39500:I=1:DO:IFM$(I,0)=I$THENEXIT:ELSEI=I+1:LOOPUNTILI>U0:IFI>U0THENO$="{ct k}Command not found!":GOSUB4:GOTO30100
39020 FORX=ITOU0+1:FORY=0TO4:M$(X,Y)=M$(X+1,Y):NEXTY:NEXTX:U0=U0-1:IFU0=0THENM$(0,0)=0:GOTO30100:ELSE30100
39500 O$="{ct k}Is this a op-code subroutine (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THENRETURN:ELSEI$=CHR$(ASC(I$)AND127):RETURN
39700 IFLEN(W1$)<26THENW1$="00000000000000000000000000"
39705 O$="":FORX=1TO26:IFMID$(W1$,X,1)="1"THENA$=CHR$(X+192):ELSEA$=" "
39710 O$=O$+A$:NEXTX:O$=W2$+O$:IFW1=401THENGOSUB4:RETURN:ELSEO$=O$+"{ct c}":GOSUB4
39715 C$=CHR$(20)+R$:GOSUB28:IFI=2THENO$=A$:GOSUB9:RETURN
39720 FORX=1TO28:O$=CHR$(20):GOSUB9:NEXTX:O$=" Toggle: {white}{ct c}":GOSUB4:X=26:GOSUB5:IFI$=""THENRETURN
39730 FORX=1TOLEN(I$):A=ASC(MID$(I$,X,1))-192:IFA<1ORA>26THEN39750
39740 MID$(W1$,A,1)=MID$(STR$(ABS(VAL(MID$(W1$,A,1))-1)),2)
39750 NEXTX:GOTO39705
39800 DATA 1,41
39801 DATA 1,3,0,1,0,0,0,4,4,2
39802 DATA 1,0,0,1,1,1,1,3,4,1
39803 DATA 1,0,0,0,1,1,0,3,0,1
39804 DATA 2,1,1,1,1,3,0,4,2,1
39805 DATA 0
39810 DATA 101,112
39811 DATA 1,2,1,0,1,0,1,0,0,0
39812 DATA 0,0
39820 DATA 201,212
39821 DATA 1,2,4,4,3,3,0,0,0,1
39822 DATA 0,0
39830 DATA 301,306
39831 DATA 2,1,1,1,1,2
39840 DATA 401,409
39841 DATA 0,0,1,1,2,0,0,0,0
39850 DATA 501,505
39851 DATA 4,4,3,4,3
39860 DATA 601,603
39861 DATA 0,0,0
39870 DATA 701,705
39871 DATA 0,0,0,0,0
39899 DATA 0,0
39900 O$="{clear}{ct k}{cyan}Menu Editor 1.0":GOSUB4
39905 O$="{ct k}{yellow}<{white}?{yellow}> {cyan}Menu":GOSUB4
39910 O$="{yellow}<{white}Q{yellow}> {cyan}Quit":GOSUB4
39915 O$="{yellow}<{white}S{yellow}> {cyan}Save menu":GOSUB4
39920 O$="{yellow}<{white}V{yellow}> {cyan}View text":GOSUB4
39925 O$="{yellow}<{white}T{yellow}> {cyan}Edit text":GOSUB4
39930 O$="{yellow}<{white}C{yellow}> {cyan}Menu codes":GOSUB4
39935 O$="{yellow}<{white}I{yellow}> {cyan}Menu ID code":GOSUB4
39940 O$="{yellow}<{white}E{yellow}> {cyan}Edit/Add Commands":GOSUB4
39945 O$="{yellow}<{white}P{yellow}> {cyan}Edit menu prompts":GOSUB4
39950 O$="{yellow}<{white}L{yellow}> {cyan}List commands":GOSUB4
39955 O$="{yellow}<{white}D{yellow}> {cyan}Delete command":GOSUB4:RETURN
40000 FORI=0TO50:VT$(I)="":NEXTI
40005 O$="{clear}{ct k}{cyan}User Searcher/Changer 1.0{ct k}":GOSUB4:GOTO40010
40008 GOSUB28:O$=A$:GOTO4
40009 IFVT$(I)=""THENO$=O$+"None":GOSUB4:RETURN:ELSEO$=O$+VT$(I):GOSUB4:RETURN
40010 O$="{yellow}<{white}A{yellow}> {cyan}Handle      : {white}":I=1:GOSUB40009
40020 O$="{yellow}<{white}B{yellow}> {cyan}Real name   : {white}":I=2:GOSUB40009
40030 O$="{yellow}<{white}C{yellow}> {cyan}Phone number: {white}":I=3:GOSUB40009
40040 O$="{yellow}<{white}D{yellow}> {cyan}Access level: {white}":I=4:GOSUB40009
40050 O$="{yellow}<{white}E{yellow}> {cyan}Access flags: {white}":I=5:GOSUB40009
40060 O$="{yellow}<{white}F{yellow}> {cyan}System flags: {white}":I=6:GOSUB40009
40070 O$="{yellow}<{white}G{yellow}> {cyan}Join/Unjoin : {white}":I=7:GOSUB40009
40080 O$="{yellow}<{white}H{yellow}> {cyan}Blocks      : {white}":I=8:GOSUB40009
40090 O$="{yellow}<{white}I{yellow}> {cyan}System crdts: {white}":I=9:GOSUB40009
40100 O$="{yellow}<{white}J{yellow}> {cyan}Default baud: {white}":I=10:GOSUB40009
40110 O$="{yellow}<{white}K{yellow}> {cyan}Num of posts: {white}":I=11:GOSUB40009
40120 O$="{yellow}<{white}L{yellow}> {cyan}Num of Email: {white}":I=12:GOSUB40009
40130 O$="{yellow}<{white}Q{yellow}> {cyan}Quit!":GOSUB4:O$="{yellow}<{white}*{yellow}> {cyan}Execute searcher/changer":GOSUB4
40140 O$="{ct k}{light green}Option: {ct c}":GOSUB4:C$="ABCDEFGHIJKL*Q?":GOSUB28:O$=A$:GOSUB4
40150 Y=I:ONIGOSUB40200,40300,40400,40500,40600,40700,40800,40900,41000,41100,41200,41300,41400:IFI=14THENFORI=0TO50:VT$(I)="":GOTO920:ELSE40005
40200 O$="{ct k}{black}Comparison (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB40008:IFI=2THENVT$(Y)="":RETURN:ELSEVT$(Y)="Compare":RETURN
40300 O$="{ct k}{black}Compare, Search, None (c/s/n)? {ct c}":GOSUB4:C$="CSN":GOSUB40008:IFI=1THENVT$(Y)="Compare":RETURN:ELSEIFI=3THENVT$(Y)="":RETURN
40310 O$="Enter search pattern: {ct c}":GOSUB4:X=16:GOSUB5:VT$(Y)=I$:RETURN
40399 IFW0THENPRINT#4,O$:GOTO4:ELSE4
40400 O$="{ct k}{black}Compare, Search, None (c/s/n)? {ct c}":GOSUB4:C$="CSN":GOSUB40008:IFI=1THENVT$(Y)="Compare":RETURN:ELSEIFI=3THENVT$(Y)="":RETURN
40410 O$="Enter search number: {ct c}":GOSUB4:X=14:GOSUB5:VT$(Y)=I$:RETURN
40500 O$="{ct k}{black}Search, or None (s/n)? {ct c}":GOSUB4:C$="SN":GOSUB40008:IFI=2THENVT$(Y)="":RETURN
40510 O$="Enter search accesses: {ct c}":GOSUB4:X=26:GOSUB5:VT$(Y)=I$:RETURN
40600 O$="{ct k}{black}Search, Change, Toggle, None (s/c/t/n)? {ct c}":GOSUB4:C$="SCTN":GOSUB40008:IFI=4THENVT$(Y)="":RETURN
40610 O$="Enter affected flags: {ct c}":GOSUB4:X=26:GOSUB5:VT$(Y)=I$:VT$(Y)=MID$("SearchChangeToggle",(I*6)-5,6)+"  "+VT$(Y):IFI=3THENRETURN
40620 O$="Change to/Search for 0 or 1{sh space}(0/1)? {ct c}":GOSUB4:C$="01":GOSUB40008:MID$(VT$(Y),7,1)=A$:RETURN
40700 O$="{ct k}{black}Search, Change, None (s/c)? {ct c}":GOSUB4:C$="SCN":GOSUB40008:IFI=3THENVT$(Y)="":RETURN
40710 VT$(Y)=MID$("SearchChange",(I*6)-5,6):O$="Which flag (E/8/D/S/?/X/#/R/B/C)? {ct c}":GOSUB4:C$="E8DS?X#RBC":GOSUB40008:VT$(Y)=VT$(Y)+MID$(STR$(I),2)
40720 O$="Enter pattern: {ct c}":GOSUB4:X=1:GOSUB5:VT$(Y)=VT$(Y)+I$:RETURN
40800 O$="{ct k}{black}Search, Change, Toggle, None (s/c/t/n)? {ct c}":GOSUB4:C$="SCTN":GOSUB40008:IFI=4THENVT$(Y)="":RETURN
40810 O$="Enter affected sigs: {ct c}":GOSUB4:X=26:GOSUB5:VT$(Y)=I$:VT$(Y)=MID$("SearchChangeToggle",(I*6)-5,6)+"  "+VT$(Y):IFI=3THENRETURN
40820 O$="Change to/Search for 0 or 1{sh space}(0/1)? {ct c}":GOSUB4:C$="01":GOSUB40008:MID$(VT$(Y),7,1)=A$:RETURN
40900 O$="{ct k}{black}Search, Change, None (s/c/n)? {ct c}":GOSUB4:C$="SCN":GOSUB40008:IFI=3THENVT$(Y)="":RETURN
40910 VT$(Y)=MID$("SearchChange",(I*6)-5,6):O$="Number of blocks: {ct c}":GOSUB4:GOSUB10:A=I:O$="Flag on + or - (+/-)? {ct c}":GOSUB4:C$="+-":GOSUB40008
40920 VT$(Y)=VT$(Y)+MID$("><",I,1)+STR$(A):RETURN
41000 O$="{ct k}{black}Search, Change, None (s/c/n)? {ct c}":GOSUB4:C$="SCN":GOSUB40008:IFI=3THENVT$(Y)="":RETURN
41010 VT$(Y)=MID$("SearchChange",(I*6)-5,6):O$="Number of credits: {ct c}":GOSUB4:GOSUB10:A=I:O$="Flag on + or - (+/-)? {ct c}":GOSUB4:C$="+-":GOSUB40008
41020 VT$(Y)=VT$(Y)+MID$("><",I,1)+STR$(A):RETURN
41100 O$="{ct k}{black}Search, Change, None (s/c/n)? {ct c}":GOSUB4:C$="SCN":GOSUB40008:IFI=3THENVT$(Y)="":RETURN
41110 VT$(Y)=MID$("SearchChange",(I*6)-5,6):O$="Baud rate: {ct c}":GOSUB4:GOSUB10:A=I:O$="Flag on + or - (+/-)? {ct c}":GOSUB4:C$="+-":GOSUB40008
41120 VT$(Y)=VT$(Y)+MID$("><",I,1)+STR$(A):RETURN
41200 O$="{ct k}{black}Search, Change, None (s/c/n)? {ct c}":GOSUB4:C$="SCN":GOSUB40008:IFI=3THENVT$(Y)="":RETURN
41210 VT$(Y)=MID$("SearchChange",(I*6)-5,6):O$="Number of posts: {ct c}":GOSUB4:GOSUB10:A=I:O$="Flag on + or - (+/-)? {ct c}":GOSUB4:C$="+-":GOSUB40008
41220 VT$(Y)=VT$(Y)+MID$("><",I,1)+STR$(A):RETURN
41300 O$="{ct k}{black}Search, Change, None (s/c/n)? {ct c}":GOSUB4:C$="SCN":GOSUB40008:IFI=3THENVT$(Y)="":RETURN
41310 VT$(Y)=MID$("SearchChange",(I*6)-5,6):O$="Number of e-mail: {ct c}":GOSUB4:GOSUB10:A=I:O$="Flag on + or - (+/-)? {ct c}":GOSUB4:C$="+-":GOSUB40008
41320 VT$(Y)=VT$(Y)+MID$("><",I,1)+STR$(A):RETURN
41400 O$="{ct k*2}{black}Start at user #{ct c}":GOSUB4:GOSUB10:W1=I:IFI=0ORI>500THENRETURN
41410 O$="End with user #{ct c}":GOSUB4:GOSUB10:W2=I:IFI<=W1ORI>500THENRETURN
41420 W0=0:IFPEEK(2823)THENO$="{ct k}Output to printer also (y/n)? {ct c}":GOSUB4:C$="NY":GOSUB28:O$=A$:GOSUB4:W0=I-1:IFW0THENOPEN4,4,7
41430 IFVT$(1)<>""THENO$="{ct k}{black}Handle compare...":GOSUB4:A=W1+1:ELSE41460
41440 A$=UI$(A):FORI=W1TOA-1:IFUI$(I)=A$ANDA$<>"^"ANDA$<>"{pound}"ANDA$<>""THENO$="ID#"+STR$(A)+"'s handle matched with ID#"+STR$(I):GOSUB40399
41450 NEXTI:A=A+1:IFA<=W2THEN41440
41460 O$="{ct k}{black}Executing Search/Change routines.{ct k}Please wait patiently...{white}":GOSUB4:A=W1:OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.userfiles"
41470 DO:RECORD#2,A:E=0:IFUI$(A)="^"ORUI$(A)="{pound}"ORUI$(A)=""THEN41540
41480 FORI=21TO26:SYS8222:VT$(I)=I$:NEXTI:GOSUB690:VT$(27)=I$:FORI=28TO29:SYS8222:VT$(I)=I$:NEXTI:GOSUB690:VT$(30)=I$:FORI=31TO35:SYS8222:VT$(I)=I$:NEXTI
41490 RECORD#2,A:TT$(A)=LEFT$(VT$(23)+SP$,20)+VT$(24)
41500 FORX=1TO12:A$=VT$(X):IFVT$(X)<>""THENONXGOSUB42100,42200,42300,42400,42500,42600,42700,42800,42900,43000,43100,43200
41510 NEXTX:IFE=0THEN41540
41520 A$="":FORI=21TO26:A$=A$+VT$(I)+R$:NEXTI:I$=VT$(27):GOSUB670:FORI=28TO29:A$=A$+VT$(I)+R$:NEXTI:I$=VT$(30):GOSUB670:FORI=31TO35:A$=A$+VT$(I)+R$:NEXTI
41530 RECORD#2,A:PRINT#2,A$;
41540 A=A+1:LOOPUNTILA>W2ORUI$(A)="":CLOSE2:FORI=0TO501:TT$(I)="":NEXTI:I=FRE(1):CLOSE4:CLOSE1:O$="{ct k}Hit return:{ct c}":GOSUB4:C$=R$:GOSUB28:RETURN
42100 RETURN
42200 IFLEFT$(A$,7)<>"Compare"THEN42250
42210 IFA=W1THENRETURN:ELSEFORI=W1TOA-1:IFINSTR(TT$(I),VT$(23))=1THENO$="ID#"+STR$(I)+"'s name matched with ID#"+STR$(A):GOSUB40399
42220 NEXTI:RETURN
42250 IFA$=VT$(23)THENO$="Name: "+A$+" found at ID#"+STR$(A):GOSUB40399:RETURN:ELSERETURN
42300 IFLEFT$(A$,7)<>"Compare"THEN42350
42310 IFA=W1THENRETURN:ELSEFORI=W1TOA-1:IFINSTR(TT$(I),VT$(24))>1THENO$="ID#"+STR$(I)+"'s phone# matched with ID#"+STR$(A):GOSUB40399
42320 NEXTI:RETURN
42350 IFA$=VT$(24)THENO$=A$+" found at ID#"+STR$(A):GOSUB40399:RETURN:ELSERETURN
42400 IFINSTR(A$,VT$(25))THENO$="ID#"+STR$(A)+" has access "+VT$(25):GOSUB40399:RETURN:ELSERETURN
42500 IFLEFT$(A$,6)="Change"THEN42530:ELSEIFLEFT$(A$,6)="Toggle"THEN42550
42510 FORI=9TOLEN(A$):I$=MID$(A$,I,1):IFMID$(VT$(27),ASC(I$)-192,1)=MID$(A$,7,1)THENO$="ID#"+STR$(A)+" has flag "+I$+" set to "+MID$(A$,7,1):GOSUB40399
42520 NEXTI:RETURN
42530 FORI=9TOLEN(A$):I$=MID$(A$,I,1):IFMID$(VT$(27),ASC(I$)-192,1)<>MID$(A$,7,1)THENMID$(VT$(27),ASC(I$)-192,1)=MID$(A$,7,1):E=1
42540 NEXTI:RETURN
42550 FORI=9TOLEN(A$):I$=MID$(A$,I,1):MID$(VT$(27),ASC(I$)-192,1)=MID$(STR$(ABS(VAL(MID$(A$,7,1))-1),2,1)):E=1
42560 NEXTI:RETURN
42600 IFLEFT$(A$,6)="Change"THEN42620
42610 IFMID$(VT$(28),VAL(MID$(A$,7,1)),1)=MID$(A$,8)THENO$="ID#"+STR$(A)+" has info flag "+MID$(A$,7,1)+" set at "+MID$(A$,8):GOSUB40399:RETURN:ELSERETURN
42620 MID$(VT$(28),VAL(MID$(A$,7,1)),1)=MID$(A$,8):E=1:RETURN
42700 IFLEFT$(A$,6)="Change"THEN42730:ELSEIFLEFT$(A$,6)="Toggle"THEN42750
42710 FORI=9TOLEN(A$):I$=MID$(A$,I,1):IFMID$(VT$(30),ASC(I$)-192,1)=MID$(A$,7,1)THENO$="ID#"+STR$(A)+" has sig "+I$+" set to "+MID$(A$,7,1):GOSUB40399
42720 NEXTI:RETURN
42730 FORI=9TOLEN(A$):I$=MID$(A$,I,1):IFMID$(VT$(30),ASC(I$)-192,1)<>MID$(A$,7,1)THENMID$(VT$(30),ASC(I$)-192,1)=MID$(A$,7,1):E=1
42740 NEXTI:RETURN
42750 FORI=9TOLEN(A$):I$=MID$(A$,I,1):MID$(VT$(30),ASC(I$)-192,1)=MID$(STR$(ABS(VAL(MID$(A$,7,1))-1),2,1)):E=1
42760 NEXTI:RETURN
42800 W5$=" blocks."
42810 W3=X+23:W4=VAL(MID$(A$,8)):W4$="ID#"+STR$(A)+" has "+VT$(W3)+W5$:W3$=MID$(A$,7,1):IFLEFT$(A$,6)="Change"THEN42830
42820 IFW3$=">"ANDVAL(VT$(W3))>=W4THENO$=W4$:GOSUB40399:RETURN:ELSEIFW3$="<"ANDVAL(VT$(W3))<=W4THENO$=W4$:GOSUB40399:RETURN:ELSERETURN
42830 E=1:IFW3$="<"THENW4=-W4
42840 VT$(W3)=STR$(VAL(VT$(W3))+W4):RETURN
42900 W5$=" Credits.":GOTO42810
43000 W5$=" Baud.":GOTO42810
43100 W5$=" Posts.":GOTO42810
43200 W5$=" E-mails.":GOTO42810
44000 GOSUB400:O$="{ct k}Fix which sig (A-Z)? {ct c}":GOSUB4:X=1:GOSUB5:IFI$=""ORASC(I$)<193ORASC(I$)>218THEN920:ELSEW2$=I$
44010 U0=D(1,0):D0=D(1,1):OPEN2,U0,2,MID$(STR$(D0),2)+":sys.msg bases":RECORD#2,ASC(W2$)-192:INPUT#2,U,D:FORI=3TO6:SYS8222:NEXTI:W1$=I$:SYS8222:M3$=I$:CLOSE2
44020 IFMID$(M3$,ASC(U$(5))-192,1)<>"1"THENO$="{ct k}{black}Access denied!":GOSUB4:GOTO920
44030 O$="{ct k}Fix {pound}?w1${pound} (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB40008:IFI=2THEN920
44040 O$="{ct k*2}Working...{ct c}":GOSUB4
44050 OPEN1,U,15:OPEN3,U0,3,MID$(STR$(D0),2)+":sys.msg data":RECORD#3,51*(ASC(W2$)-192):INPUT#3,W1,W2:O$="{ct k}"+STR$(W1)+" registered messages":GOSUB4:X=0
44060 FORI=1TO50:VT$(I)="0":VT(I)=0:RECORD#3,(51*((ASC(W2$)-192)-1))+I
44070 OPEN2,U,2,MID$(STR$(D),2)+":msg."+CHR$(ASC(W2$)AND127)+STR$(I)+",s,r":INPUT#1,E:IFETHEN44100:ELSEX=X+1:SYS8213:IFPEEK(253)THENVT$(I)=O$(2):GOTO44100
44080 VT(I)=VT(I)+1:SYS8222:VT$(I)=I$
44090 SYS8213:IFPEEK(253)=0THEN44080
44100 CLOSE2:A$=VT$(I)+R$+STR$(VT(I))+R$:RECORD#3,(51*((ASC(W2$)-192)-1))+I:PRINT#3,A$;:NEXTI
44110 O$="{ct k}"+STR$(X)+" actual messages.":GOSUB4:RECORD#3,51*(ASC(W2$)-192):PRINT#3,STR$(W1)+R$+STR$(W2)+R$;:CLOSE3:CLOSE2:CLOSE1:GOTO920
50000 X=INT(PEEK(238)/2-9):WINDOWX,5,X+22,21
50010 PRINT"{cyan}{clear} {cm i*22}"
50020 PRINT"{light blue}{reverse on}  Zelch 128 Calc 1.0  {cyan} "
50030 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
50040 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
50050 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
50060 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
50070 PRINT"{light blue}{reverse on} {reverse off}                    {reverse on} {cyan} "
50080 PRINT"{light blue}{reverse on}                      {cyan} "
50090 PRINT"{light blue}{reverse on}  {cyan}{cm g}7{cm m}{light blue}  {cyan}{cm g}8{cm m}{light blue}  {cyan}{cm g}9{cm m}{light blue}  {cyan}{cm g}+{cm m}{light blue}  {cyan} "
50100 PRINT"{light blue}{reverse on}                      {cyan} "
50110 PRINT"{light blue}{reverse on}  {cyan}{cm g}4{cm m}{light blue}  {cyan}{cm g}5{cm m}{light blue}  {cyan}{cm g}6{cm m}{light blue}  {cyan}{cm g}-{cm m}{light blue}  {cyan} "
50120 PRINT"{light blue}{reverse on}                      {cyan} "
50130 PRINT"{light blue}{reverse on}  {cyan}{cm g}1{cm m}{light blue}  {cyan}{cm g}2{cm m}{light blue}  {cyan}{cm g}3{cm m}{light blue}  {cyan}{cm g}/{cm m}{light blue}  {cyan} "
50140 PRINT"{light blue}{reverse on}                      {cyan} "
50150 PRINT"{light blue}{reverse on}  {cyan}{cm g}0{cm m}{light blue}  {cyan}{cm g}.{cm m}{light blue}  {cyan}{cm g}*{cm m}{light blue}  {cyan}{cm g}={cm m}{light blue}  {cyan} "
50160 PRINT"{light blue}{reverse on}                      {cyan}{cm i}"
50170 WINDOWX+1,7,X+20,11
50180 I=0:X=0:Y=0:O$=" ":PRINT"{white}{clear}";
50190 GOSUB50310:A=A-19:IFA=7THENX=INT(PEEK(238)/2-9):WINDOWX,5,X+22,21,1:I$="prg.logon":GOTO23
50200 IFA$="{ct h}"THENPRINT">HEX: "HEX$(I):O$=" ":Y=0:GOTO50190
50210 IFA$="{ct d}"THENPRINT">DEC:"DEC(I$):O$=" ":Y=0:GOTO50190
50220 IFO$=" "THENY=I:O$=A$:GOTO50240
50230 ONINSTR("+-*/^",O$)GOSUB50260,50270,50280,50290,50300:O$=A$
50240 IFA=6THENPRINTO$+MID$(STR$(Y),2):O$=" "
50250 GOTO50190
50260 Y=Y+I:RETURN
50270 Y=Y-I:RETURN
50280 Y=Y*I:RETURN
50290 Y=Y/I:RETURN
50300 Y=Y^I:RETURN
50310 PRINTO$"0{left}";:I$="":I=0
50320 GETKEYA$:A$=CHR$(ASC(A$)AND127):IFA$=CHR$(13)THENA$="="
50330 A=INSTR(CHR$(20)+"{home}abcdef.0123456789+-*/^="+CHR$(27)+"{ct h}{ct d}",A$):IFA=0THEN50320
50340 IFA<20THENONAGOTO50400,50180:GOTO50420
50350 IFI$=""ANDA<25THENO$=A$:PRINT"{left}";:GOTO50310
50360 IFO$=" "THENY=0
50370 PRINT:TRAP50380:I=VAL(I$):RETURN
50380 I=0:RETURN
50390 ONAGOTO50400,50180:GOTO50420
50400 IFI$<>""THENI$=LEFT$(I$,LEN(I$)-1):PRINT"{left} {left}";:IFI$=""THENPRINT"0{left}";
50410 GOTO50320
50420 IFLEN(I$)>18THENPRINT"{ct g}";:GOTO50320
50430 I$=I$+A$:PRINTA$;:GOTO50320
55555 A=PEEK(186):SCRATCH"prg.misc",U(A):DSAVE"prg.misc",U(A):STOP
