!--------------------------------------------------
!- Wednesday, August 18, 2021 12:26:14 AM
!- Import of : 
!- c:\tmp\newproject\wall.create.prg
!- Unknown Machine
!--------------------------------------------------
10 PRINT"{clear}{down*2}{ct n}Wall Street z128 vII":DIMOT(26)
20 PRINT"{down}By{space*2}Bo Zimmerman"
30 PRINT"For Elite Software"
40 PRINT"{down}System data creation program{down*2}":R$=CHR$(13):A$="":FORI=1TO(28*2):A$=A$+" 0"+R$:NEXTI
100 INPUT"Create files on what drive{space*2}8,0{left*5}";U,D
105 INPUT"Convert 1.0 to version II{space*3}n{left*3}";CY$::IFCY$="y"THEN130
110 INPUT"Reset Wall Street prices{space*4}y{left*3}";CP$
120 INPUT"Clear out occupied seats{space*4}y{left*3}";CS$
130 INPUT"Create how many seats{space*7}50{left*4}";HS
140 INPUT"Price per seat{space*14}200{left*5}";PS
150 INPUT"Stock price multiplier{space*6}1{left*3}";SM
160 INPUT"Stock issue/sig: MAX MSGS X 100{left*5}";SI
170 INPUT"Use trade restrictions{space*6}y{left*3}";TR$
999 INPUT"{down*2}Begin file access (y/n){space*2}y{left*3}";YN$:IFYN$<>"y"THEN10
1000 IFCY$="y"THEN10000:ELSEPRINT"{down}Writing seats file..."
1010 OPEN2,U,2,MID$(STR$(D),2)+":wall.seats,l,"+CHR$(253)
1020 IFCS$="y"THENRECORD#2,HS+2:PRINT#2,"burp!"
1030 RECORD#2,1:PRINT#2,STR$(HS)+R$+STR$(PS)+R$+STR$(SM)+R$+STR$(SI)+R$+TR$+R$+"System access-- no WS report"+R$+" 0"
1040 IFCS$="y"THENFORI=2TOHS+1:RECORD#2,I:PRINT#2,A$:NEXTI:ELSEPRINT"{down}Leaving seat records untouched."
1050 CLOSE2
2000 IFCP$<>"y"THEN3000:ELSEPRINT"{down}Creating price file..."
2010 OPEN2,U,2,MID$(STR$(D),2)+":wall.records,l,"+CHR$(253)
2020 RECORD#2,30:PRINT#2,"burp!"
2030 FORI=1TO30:RECORD#2,I:PRINT#2,A$:NEXTI
2040 CLOSE2
3000 END
10000 PRINT"{down*6}Working..."
10010 OPEN2,U,2,MID$(STR$(D),2)+":wall.seats"
10020 RECORD#2,1:PRINT#2,STR$(HS)+R$+STR$(PS)+R$+STR$(SM)+R$+STR$(SI)+R$+TR$+R$+"System access-- no WS report"+R$+" 0"
10030 FORX=2TOHS+1:RECORD#2,X:A$="":INPUT#2,A$
10040 A$=A$+R$:FORY=1TO26:INPUT#2,I$:OT(Y)=OT(Y)+VAL(I$):A$=A$+I$+R$:NEXTY
10050 FORY=1TO26:A$=A$+"0"+R$:NEXTY:RECORD#2,X:RECORD#2,X:PRINT#2,A$
10060 NEXTX:CLOSE2
11000 OPEN2,U,2,MID$(STR$(D),2)+":wall.records"
11010 RECORD#2,30:A$="":FORI=1TO10:A$=A$+"0"+R$:NEXTI
11020 RECORD#2,30:PRINT#2,A$
11030 FORX=1TO26:RECORD#2,X:A$="":FORI=1TO3:INPUT#2,I$:A$=A$+I$+R$:NEXTI
11040 A$=A$+STR$(OT(X))+R$:RECORD#2,X:RECORD#2,X:PRINT#2,A$
11050 NEXTX:CLOSE2:END
11060 OPEN2,9,2,"4:wall.seats":RECORD#2,1:FORI=1TO5:INPUT#2,A:PRINTA:NEXTI:CLOSE2
