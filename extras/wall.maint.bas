!--------------------------------------------------
!- Saturday, May 20, 2017 1:40:03 AM
!- Import of : 
!- c:\src\zelch128\extras\wall.maint.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:U1=PEEK(186):D1=4:FORI=1TO26:VT$(I)="":VT(I)=0:MR(I)=0:NEXTI
30010 O$="Wall Street z128 vII maint...":GOSUB250:GOSUB400
30020 GOTO31000
30030 REM ****************************************************************
30040 REM ***** MAKE SURE YOU RUN THIS EVERY DAY BEFORE MESSAGE WEED *****
30050 REM ****************************************************************
30060 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.mbases":RETURN
30070 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.mdata":RETURN
30080 OPEN2,U1,2,MID$(STR$(D1),2)+":wall.records":RETURN
35466 RUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNRUNUOPEN2,U1,2,MID$(STR$(D1),2)+":wall.seats":RETURN
31000 GOSUB30080
31010 ##################2,27:INPUT#2,A$:IFLEFT$(A$,6)=LEFT$(O$(2),6)THEN50000
31020 ##################2,27:PRINT#2,O$(2):CLOSE2
32000 GOSUB30060:W9=0
32010 FORX=1TO26:W5=0:W6=0:##################2,X
32020 FORY=1TO7:SYS8222:TT$(150+Y)=I$:NEXTY
32030 IFVAL(TT$(150+7))=0ORLEFT$(TT$(150+6),1)<>"{sh @}"THEN39999:ELSEVT$(X)="p"
32040 W9=W9+VAL(TT$(150+3)):CLOSE2
59624 SCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRSCNCLRENDGOSUB30070
33010 ##################2,X*51:INPUT#2,W4:W5=W4:W6=W4
33020 FORY=1TOW4:##################2,((X-1)*51)+Y:SYS8222:IFVAL(I$)=0THEN33050
33030 INPUT#2,A
33040 W5=W5+A:IFA>=VAL(TT$(150+4))THENW6=W6+VAL(TT$(150+5)):ELSEW6=W6+A
33050 NEXTY:CLOSE2
34000 GOSUB30080
34010 ##################2,X:INPUT#2,W2,W3,I,I:W7=W5-W2:IFW7<0THENW7=0
34020 W4=(W3*.8)+(W7*.2):W4=INT(W4*100)/100:MR(X)=W4
34030 ##################2,X:PRINT#2,STR$(W6)+R$+STR$(W4)+R$+STR$(W3)+R$+STR$(I)
34040 CLOSE2:GOSUB30060
39999 NEXTX
40000 CLOSE2:GOSUB30090
40010 ##################2,1:##################2,1:SYS8222:SYS8222:SYS8222:W1=VAL(I$)
40020 SYS8222:W9=W9*VAL(I$)
40030 SYS8222:SYS8222:SYS8222:W2=VAL(I$)
40040 ##################2,1:A$="":FORI=1TO5:SYS8222:A$=A$+I$+R$:NEXTI:CLOSE2
40050 GOSUB30080
40055 W0=0:FORI=1TO26:IFVT$(I)<>""THEN##################2,I:##################2,I:SYS8222:SYS8222:W0=(W0+(VAL(I$)*W1))
40060 NEXTI:##################2,29:FORI=0TO4:SYS8222:VT(I)=VAL(I$):NEXTI:##################2,30:FORI=5TO9:SYS8222:VT(I)=VAL(I$):NEXTI:W3=VAL(I$):VT(10)=W0
40070 C$="":FORI=1TO5:C$=C$+STR$(VT(I))+R$:NEXTI:##################2,29:##################2,29:PRINT#2,C$
40075 C$="":FORI=6TO10:C$=C$+STR$(VT(I))+R$:NEXTI:##################2,30:##################2,30:PRINT#2,C$:CLOSE2
40080 GOSUB30090
40090 ##################2,1:W4=W3-W0:WS$="Zelch stocks ":IFW4<=0THENWS$=WS$+"gained":ELSEWS$=WS$+"lost"
40100 W4=INT(W4*100)/100:WS$=WS$+STR$(ABS(W4))+" points{f7}yesterday in "
40110 W5=W2/W9:IFW5<=.01THENWS$=WS$+"light":ELSEIFW5<=.25THENWS$=WS$+"moderate":ELSEIFW5<=.5THENWS$=WS$+"heavy":ELSEWS$=WS$+"an incredible amount of"
40120 WS$=WS$+" trading.":##################2,1:PRINT#2,A$+WS$+R$+"0"+R$:CLOSE2
41000 GOSUB30090
41010 ##################2,1:SYS8222:W1=VAL(I$):FORI=1TO26:VT(I)=0:NEXTI
41020 FORX=2TOW1+1:##################2,X:SYS8222:IFVAL(I$)=0THEN41070
41030 I=VAL(I$):IFUI$(I)<>""ANDUI$(I)<>"^"THEN41040:ELSEFORY=1TO26:SYS8222:VT(Y)=VT(Y)+VAL(I$):NEXTY
41035 A$="":FORY=1TO27*2:A$=A$+"0"+R$:NEXTY:GOTO41060
41040 A$=I$+R$:FORY=1TO26:SYS8222:IFMR(Y)<1ANDVAL(I$)>0THENVT(
