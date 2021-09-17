!--------------------------------------------------
!- Thursday, September 16, 2021 2:56:39 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.ee2.amaint.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
20 REM **MAINTENANCE.PRG**
40 CLR:FAST:DIM M$(25):DIM P$(11,10):DIM P(11,26):DIM AR%(21,21,11):DIM PR$(401):DIMA$(31):DIM XC(401):DIM YC(401):DIM S(401):DIM SX(11):DIM SY(11):DIMPD(11)
50 DIM VC(16,33),VL(16,8),A(14),MT$(13)
51 DIM VC%(0,0):DIMVL%(0,0),BF$(11,11)
53 CN=0:REM -->CNET COMPATIBILTY FLAG.  SET TO 1 IF USING CNET.
54 DV=0:U=8:REM -->DEVICE AND UNIT THAT THE EE2 FILES ARE ON.  CHANGE AS NEEDED
55 SP$="{space*48}"
56 FOR X=1TO12:READ MT$(X):NEXTX
57 A=PEEK(2880):B=PEEK(2879):C=PEEK(2863):LD$=MT$(B)+STR$(A)+", 19"+MID$(STR$(C),2)
80 PRINT"{clear}":P$="{green}E m p i r e{space*2}E d i t i o n{space*2}I I":GOSUB7210:P$="{light green}Daily Game Maintenence v2.00":GOSUB7210
90 PRINT:PRINT "Now updating for "LD$
100 PRINT "{blue}-->{light blue}Loading sector file 1...":GOSUB 4900
120 PL=0:FOR X=1TO20:FORY=1TO20:IF AR%(X,Y,1)>PL THEN PL=AR%(X,Y,1)
125 NEXTY:NEXTX
140 GOSUB6500:PRINT "{red}-->{pink}Loading sector file 2...":GOSUB5840
180 GOSUB6500:PRINT "{green}-->{light green}Loading players...{space*12}"
210 FOR CO=1TOPL:P=CO:GOSUB 4540:NEXTCO
215 GOSUB6500:PRINT"{gray}-->{light gray}Checking supply centers...{space*6}":FORX=1TO20:FORY=1TO20:IF AR%(X,Y,0)=1 AND AR%(X,Y,2)>75 THEN P=AR%(X,Y,1):SX(P)=X:SY(P)=Y
220 NEXTY:NEXTX
225 GOSUB6500:PRINT"{dark gray}-->{cyan}Updating sectors...{space*13}"
300 FOR XA=1 TO 20:FORYA=1 TO 20:PN=AR%(XA,YA,1)
360 ON (AR%(XA,YA,0)+1) GOTO 400,440,480,520,560,700,740,780,820,860
380 REM **WILDERNESS**
400 P=10:GOSUB 4020:GOTO 900
420 REM **SUPPLY CENTER**
440 P=5:GOSUB 4020:P=10:GOSUB 4060:P=5:GOSUB 4100:GOTO 900
460 REM **ORE MINE**
480 P=5:GOSUB 4020:P=10:GOSUB4060:P=6:GOSUB4100:GOSUB4140:GOSUB 4180:GOTO900
500 REM ** FARM **
520 P=5:GOSUB 4020:P=5:GOSUB 4060:P=5:GOSUB 4100:P=2:GOSUB4140:GOSUB4180:GOTO900
540 REM ** EXCHANGE **
560 P=4:GOSUB 4020:GOSUB 4100:P=10:GOSUB 4060:IF SX(PN)<>0 AND SY(PN)<>0 THEN BEGIN
580 IF P(PN,2)>100 THEN P(PN,2)=P(PN,2)-100:P(PN,1)=P(PN,1)+50:VC(PN,15)=VC(PN,15)+50
600 IF P(PN,3)>100 THEN P(PN,3)=P(PN,3)-100:P(PN,1)=P(PN,1)+150:VC(PN,15)=VC(PN,15)+150
620 IF P(PN,4)>100 THEN P(PN,4)=P(PN,4)-100:P(PN,1)=P(PN,1)+250:VC(PN,15)=VC(PN,15)+250
640 BEND
660 GOTO 900
680 REM ** FACTORY **
700 P=3:GOSUB 4020:GOSUB 4060:GOSUB4100:GOSUB4140:GOSUB4180:GOTO900
720 REM ** ENERGY PLANT **
740 P=6:GOSUB4020:GOSUB4060:GOSUB4100:P=7:GOSUB4140:P=5:GOSUB4180:GOTO900
760 REM ** AIRPORT **
780 P=3:GOSUB 4020:GOSUB 4060:GOSUB4100:GOSUB4140:P(PN,1)=P(PN,1)-250:IFP(PN,1)<0 THEN AR%(XA,YA,6)=0:P(PN,1)=0:GOTO900:ELSE GOSUB4180:GOTO900
800 REM ** TECH CENTER**
820 P=10:GOSUB4020:GOSUB4060:GOSUB4100:GOSUB4140:P(PN,1)=P(PN,1)-50:IF P(PN,1)<0 THEN AR%(XA,YA,2)=0:GOTO900:ELSE GOSUB4180:GOTO 900
840 REM **NUKED AREA**
860 P=25:GOSUB 4020:P=2:GOSUB4140:GOSUB4180:GOTO 900
880 P=7:GOSUB 4020:GOSUB4060:GOSUB4100:GOSUB4140:GOSUB4180:GOTO900
900 IF AR%(XA,YA,2)>100 THEN AR%(XA,YA,2)=100
920 IF AR%(XA,YA,3)>250 THEN VC(PN,10)=VC(PN,10)-(AR%(XA,YA,3)-250):AR%(XA,YA,3)=250
940 IF AR%(XA,YA,4)>250 THEN VC(PN,11)=VC(PN,11)-(AR%(XA,YA,4)-250):AR%(XA,YA,4)=250
960 IF AR%(XA,YA,5)>90 THEN VC(PN,12)=VC(PN,12)-(AR%(XA,YA,5)-90):AR%(XA,YA,5)=90
980 IF AR%(XA,YA,6)>999 THEN VC(PN,13)=VC(PN,13)-(AR%(XA,YA,6)-999):AR%(XA,YA,6)=999
981 REM **ADD UP VICTORY COUNTERS**
982 VC(PN,1)=VC(PN,1)+1:VC(PN,2)=VC(PN,2)+AR%(XA,YA,3):VC(PN,3)=VC(PN,3)+AR%(XA,YA,4):VC(PN,4)=VC(PN,4)+AR%(XA,YA,5)
985 VC(PN,5)=VC(PN,5)+AR%(XA,YA,6):REM IFPN<>0 THEN PRINT USING"PN:## Totalprod:######";PN,VC(PN,5)
990 NEXT YA:NEXTXA:REM **END OF SECTOR UPDATE**
994 GOSUB6500:PRINT "{purple}-->{cyan}Adding up food and money consumption..."
995 FORA=1TOPL:VC(A,31)=VC(A,2)+INT(VC(A,3)*1.33):P(A,2)=P(A,2)-VC(A,31):VC(A,32)=VC(A,30):P(A,1)=P(A,1)-VC(A,32)
997 IF P(A,2)<0 THEN BEGIN
998 P2=ABS(P(A,2)):P=A:GOSUB6750:P(A,2)=0:IF R=99 THEN P=A:P$="{space*3}{red}RIOTING:{pink} You don't have enough food to feed your population.":GOSUB6900:GOSUB7100
1000 BEND
1005 IF P(A,1)<0 THEN BEGIN
1007 P2=ABS(P(A,1)):P=A:GOSUB6700:P(A,1)=0:IF R=99 THEN P=A:P$="{space*3}{red}SHUTDOWNS:{pink} You don't have enough money to operate your sectors.":GOSUB6900:GOSUB7200
1009 BEND
1010 NEXTA
1020 GOSUB6500:PRINT "{light gray}-->{red}Checking victory conditions...{space*15}"
1040 FORX=1TOPL:VL(X,1)=P(X,1)+INT(P(X,2)/5)+P(X,3)+P(X,4)*4:VL(X,2)=(P(X,9)*800)+(P(X,10)*400)+(P(X,11)*200)+(P(X,12)*1000)+(P(X,13)*250)
1045 VL(X,3)=(INT((VC(X,2)+VC(X,3))*.75)+VC(X,5))*3:VL(X,4)=VL(X,1)+VL(X,2)+VL(X,3):VL(X,5)=VC(X,1):VL(X,6)=INT((VC(X,1)/400)*100):VL(X,7)=X:NEXTX
1050 FORY=1TOPL:FORX=1 TO PL:IF VL(X,4)<VL((X+1),4) THEN FORZ=1TO7:T(Z)=VL(X,Z):VL(X,Z)=VL((X+1),Z):VL((X+1),Z)=T(Z):NEXTZ
1055 NEXTX:NEXTY
1057 DOPEN#1,"@empire.power",D(DV),U(U),W:A$="{white}Empire Edition II {light gray}-- {white}Power report for "+LD$:PRINT:PRINT A$:PRINT#1,CHR$(34);A$
1058 A$="Rank{space*2}Empire{space*11}Resource Tactical Populace TotalPower Sectors %ofmap":PRINTA$:PRINT#1,A$
1059 A$="{light gray}----------------------------------------------------------------------------{cyan}":PRINT#1,CHR$(34);A$:PRINTA$
1060 FORX=1TOPL:FORZ=1TO6:P=VL(X,Z):GOSUB7050:T$(Z)=R$:NEXTZ:T$(6)=T$(6)+"%"
1077 X$="#"+MID$(STR$(X),2)
1080 PRINT USING "###{space*3}###############{space*2}>####### >####### >####### >######### >######{space*3}>###";X$,P$(VL(X,7),2),T$(1),T$(2),T$(3),T$(4),T$(5),T$(6)
1085 PRINT#1,USING "###{space*3}###############{space*2}>####### >####### >####### >######### >######{space*3}>###";X$,P$(VL(X,7),2),T$(1),T$(2),T$(3),T$(4),T$(5),T$(6)
1090 NEXTX::DCLOSE#1
1130 FORX=1TO PL
1140 IF VC(X,1)>200 THEN BEGIN:REM **SOMEBODY DID IT!!**
1150 PRINT "{yellow}VICTORY ACHIEVED:{white}Player {light gray}"P$(X,2)" wins with"STR$(VC(X,1)) SECTORS."
1155 A$=RIGHT$(STR$(X),1):SCRATCH(A$+".news"),D(DV),U(U):COPY D(DV),"ee2.winfile" TO D(DV),(A$+".news"),U(U)
1160 APPEND#1,"empire.news",D(DV),U(U):PRINT#1,CHR$(34)"{red}VICTORY!{light gray}:"PN$(X)" wins the game by controlling a majority of the sectors."
1170 PRINT#1,"Inform your sysop!":DCLOSE#1
1180 BEND
1200 PRINT:PRINT "{yellow}-->{gray}Updating news files...{space*7}"
1210 FORCT=1TOPL
1280 P=CT:GOSUB7050:FI$=R$+".news":APPEND#1,(FI$),D(DV),U(U):A$=CHR$(34)+"{white}-->{light gray}Empire Update Summary for {cyan}"+LD$:PRINT#1,A$
1281 PRINT#1,CHR$(34)"{space*3}{light gray}Produced this turn:
1282 PRINT#1,CHR$(34);:PRINT#1,USING"{cyan}{space*3}Workers{space*3}:#####{space*2}Soldiers{space*2}:#####{space*2}Guns{space*6}:#####";VC(CT,10),VC(CT,11),VC(CT,12)
1284 PRINT#1,CHR$(34);:PRINT#1,USING"{space*3}Production:#####{space*2}Money{space*5}:#####{space*2}Food{space*6}:#####";VC(CT,30),VC(CT,15),VC(CT,16)
1286 PRINT#1,CHR$(34);:PRINT#1,USING"{space*3}Energy{space*4}:#####{space*2}Ore{space*7}:#####";VC(CT,17),VC(CT,18)
1288 PRINT#1,CHR$(34)"{space*3}{light gray}Empire totals:"
1290 PRINT#1,CHR$(34);:PRINT#1,USING"{cyan}{space*3}Workers{space*3}:#####{space*2}Soldiers{space*2}:#####{space*2}Guns{space*6}:#####";VC(CT,2),VC(CT,3),VC(CT,4)
1292 PRINT#1,CHR$(34);:PRINT#1,USING"{space*3}Production:#####{space*2}Food Used :#####{space*2}Money Used:#####";VC(CT,5),VC(CT,31),VC(CT,32)
1300 X=1:DO UNTIL BF$(CT,X)="":A$=CHR$(34)+BF$(CT,X):PRINT#1,A$:X=X+1:LOOP:DCLOSE#1
1320 NEXTCT
1900 GOSUB6500:PRINT"{orange}-->{red}All done!{space*2}Saving...{space*11}":GOSUB 5040:GOSUB5200:FORP=1TOPL:GOSUB4640:NEXTP:IF CN THEN POKE 7268,0
1901 END
4000 REM ** ADD CITIZENS: P=MULTIPLIER**
4020 X=INT(LOG(AR%(XA,YA,3)+1)^2)+P:AR%(XA,YA,3)=AR%(XA,YA,3)+X:VC(PN,10)=VC(PN,10)+X:RETURN
4040 REM ** ADD SOLDIERS: P=MULTIPLIER**
4060 X=INT(LOG(AR%(XA,YA,4)+1)):AR%(XA,YA,4)=AR%(XA,YA,4)+X:VC(PN,11)=VC(PN,11)+X:RETURN
4080 REM ** ADD EFFICIENTCY P = MULTIPLIER**
4100 AR%(XA,YA,2)=AR%(XA,YA,2)+INT(10*AR%(XA,YA,3)/83)+P:RETURN
4120 REM ** ADD PRODUCTION P = BONUS **
4140 A=INT((AR%(XA,YA,2))/6)+INT(7*AR%(XA,YA,3)/75)+P+6:AR%(XA,YA,6)=AR%(XA,YA,6)+A:VC(PN,30)=VC(PN,30)+A:REM PRINTUSING"PN:## Newprod:#####";PN,VC(PN,30)
4145 RETURN
4160 REM **CONVERT PRODUCTION INTO ORE/FOOD/WHATEVER**
4180 IF AR%(XA,YA,6)=0 THEN RETURN:ELSE P=AR%(XA,YA,6):ON (AR%(XA,YA,0)+1) GOTO 4200,4200,4220,4240,4200,4260,4400,4420,4440,4460
4200 RETURN
4220 X=P:P(PN,4)=P(PN,4)+X:VC(PN,18)=VC(PN,18)+X:AR%(XA,YA,6)=0:RETURN:REM MINE
4240 X=P*50:P(PN,2)=P(PN,2)+X:VC(PN,16)=VC(PN,16)+X:AR%(XA,YA,6)=0:RETURN
4260 T=AR%(XA,YA,7):IF T=1 AND P>100 THEN X=INT(P/100):P(PN,10)=P(PN,10)+X:P=P-(100*X):VC(PN,21)=VC(PN,21)+X
4280 IF T=2 AND P>50 THEN X=INT(P/50):P(PN,11)=P(PN,11)+X:VC(PN,22)=VC(PN,22)+X:P=P-(50*X)
4300 IF T=3 AND P>250 THEN X=INT(P/250):P(PN,12)=P(PN,12)+X:VC(PN,23)=VC(PN,23)+X:P=P-(250*X)
4320 IF T=4 AND P>60 THEN X=INT(P/60):P(PN,13)=P(PN,13)+X:VC(PN,24)=VC(PN,24)+X:P=P-(60*X)
4340 IF T=5 AND P>15 THEN X=INT(P/15):AR%(XA,YA,5)=AR%(XA,YA,5)+X:VC(PN,12)=VC(PN,12)+X:P=P-(15*X)
4360 AR%(XA,YA,6)=P
4380 RETURN
4400 X=P*5:P(PN,3)=P(PN,3)+X:VC(PN,17)=VC(PN,17)+X:AR%(XA,YA,6)=0:RETURN
4420 IF P>200 THEN X=INT(P/200):P(PN,9)=P(PN,9)+X:P=P-(200*X):VC(PN,20)=VC(PN,20)+X:AR%(XA,YA,6)=P:RETURN:ELSE RETURN
4440 X=INT(P/10):P(PN,5)=P(PN,5)+X:VC(PN,19)=VC(PN,19)+X:AR%(XA,YA,6)=0:RETURN
4460 IF P>500 THEN AR%(XA,YA,0)=0:AR%(XA,YA,6)=0:RETURN
4465 RETURN
4480 REM **LOAD PLAYER P INTO P$(P,##) AND P(P,##) SLOT**
4500 REM **RECORD LENGHT OF 150 BYTES, 30 RECORDS IN FILE**
4520 REM **LOAD PLAYER P INTO P$(P2) AND P(P2) SLOT**
4540 REM **LOADPLAYER
4560 DOPEN#1,"empires.dat",L150,D(DV),U(U)
4580 RECORD#1,(P):FOR X=1 TO 5:INPUT#1,P$(P,X):NEXTX:FORX=1TO20:INPUT#1,A$:P(P,X)=VAL(A$):NEXTX:RECORD#1,(P)
4600 DCLOSE#1:RETURN
4620 REM **SAVE PLAYER FROM P$(P,##) AND P(P,##) INTO P SLOT**
4640 IF P<1 OR P>20 THEN R=99:RETURN
4660 PR$="":DOPEN#1,"empires.dat",L150,D(DV),U(U)
4680 FOR X=1 TO 5:PR$=PR$+P$(P,X)+CHR$(13):NEXTX
4700 FOR X=1 TO 20:PR$=PR$+STR$(P(P,X))+CHR$(13):NEXT X
4720 IF LEN(PR$)>150 THEN R=99:PRINTPR$::PRINT LEN(PR$):DCLOSE#1:RETURN
4740 RECORD#1,(P):PRINT#1,PR$:RECORD#1,(P)
4760 DCLOSE#1:R=0:RETURN
4780 REM **SEARCH FOR PLAYER NAME P$, RETURN PLAYER # IN R**
4800 DOPEN#1,"empires.dat",L150,D(DV),U(U):C=0
4820 R=99:FOR X=1 TO 20:RECORD#1,(X):INPUT#1,X$:RECORD#1,(X):IF X$=P$ THENR=X:DCLOSE#1:DCLEAR D0,U(U):RETURN
4840 NEXT X:DCLOSE#1:DCLEAR D0,U(U)
4860 RETURN
4880 REM **LOAD 40X40 ARRAY**
4900 DOPEN#1,"sectors1.dat",D(DV),U(U),R
4920 INPUT#1,A$(1),A$(2),A$(3),A$(4),A$(5),A$(6),A$(7),A$(8),A$(9),A$(10),A$(11),A$(12),A$(13),A$(14),A$(15),A$(16),A$(17),A$(18),A$(19),A$(20)
4940 DCLOSE#1
4960 FORX=1TO20:Z=1:FORY=1TO20:AR%(X,Y,0)=VAL(MID$(A$(X),Z,1)):AR%(X,Y,1)=VAL(MID$(A$(X),(Z+1),1)):Z=Z+2:NEXTY:NEXTX
4980 DCLOSE#1
5000 RETURN
5020 REM **SAVE ARRAY**
5040 DOPEN#1,"@sectors1.dat",D(DV),U(U),W
5060 FORX=1TO20:PR$(X)="":FORY=1TO20
5080 A$=STR$(AR%(X,Y,0)):B$=STR$(AR%(X,Y,1))
5100 A$=RIGHT$(A$,1):B$=RIGHT$(B$,1)
5120 PR$(X)=PR$(X)+A$+B$:NEXTY:NEXTX
5140 FORX=1TO20:PRINT#1,PR$(X):NEXTX:DCLOSE#1
5160 RETURN
5180 REM **SAVE ALL CHANGED SECTORS**
5200 C=0:PR$="":DOPEN#1,"sectors2.dat",L26,D(DV),U(U)
5220 FOR X=1TO20:FORY=1TO20
5240 IF AR%(X,Y,10)=1 THEN C=C+1:S(C)=((X-1)*20)+Y:PR$(C)="":FORZ=2TO9:PR$(C)=PR$(C)+STR$(AR%(X,Y,Z))+CHR$(13):NEXTZ
5260 NEXTY:NEXTX:IFC=0THEN DCLOSE#1:RETURN:ELSE FORD=1TOC:RECORD#1,(S(D)):PRINT#1,PR$(D):RECORD#1,(S(D)):NEXT D:DCLOSE#1:R=0:RETURN
5280 REM**LOAD ALL SECTORS OWNED BY PLAYER P**
5300 REM**FILLER**
5320 DOPEN#1,"sectors2.dat",L26,D(DV),U(U)
5340 C=0:FORX=1TO20:FORY=1TO20
5360 IF AR%(X,Y,1)=P THEN C=C+1:S(C)=((X-1)*20)+Y:XC(C)=X:YC(C)=Y
5380 NEXTY:NEXTX:IF C=0 THEN DCLOSE#1:RETURN
5400 FORD=1 TO C:RECORD#1,(S(D)):INPUT#1,PR$(2),PR$(3),PR$(4),PR$(5),PR$(6),PR$(7),PR$(8),PR$(9):RECORD#1,(S(D)):FORZ=2TO9:AR%(XC(D),YC(D),Z)=VAL(PR$(Z))
5420 NEXTZ:AR%(XC(D),YC(D),10)=1:NEXTD:DCLOSE#1:RETURN
5440 REM **SECTOR STACK: P=X COORD, P2=Y COORD.  CALL STACK LOAD     **
5460 REM **TO LOAD ALL OF STACK'S CONTENTS                           **
5480 FOR X=1 TO 100:IF S(X)=0 THEN 5520
5500 NEXTX:R=99:PRINT "ERROR: Sector stack full":RETURN
5520 S=((P-1)*20)+P2:S(X)=S:RETURN
5540 REM **LOAD FILE P$, THEN PRINT**
5560 DOPEN#1,(P$),D(DV),U(U):IF DS<>0 THEN R=99:DCLOSE#1:DCLEAR:RETURN
5580 GET#1,A$(0),A$(1),A$(2),A$(3),A$(4),A$(5),A$(6),A$(7),A$(8),A$(9),A$(10),A$(11),A$(12),A$(13),A$(14),A$(15),A$(16),A$(17),A$(18),A$(19),A$(20),A$(21)
5600 FOR X=0 TO 21:PRINT A$(X);:NEXTX
5620 IF ST<>0 THEN 5640:ELSE 5580
5640 DCLOSE#1
5660 PRINT R$" ";:FORX=P1 TO P3
5680 REM **STRIP:RETURNS A STRIPPED STR$ VALUE FOR P IN R$**
5700 P$=STR$(P):R$=RIGHT$(P$,(LEN(P$)-1)):RETURN
5720 REM ** FIND LAST PLAYER **
5740 DCLOSE#1:DOPEN#1,"empires.dat",L150,D(DV),U(U)
5760 R=99:FOR X=1 TO 20:RECORD#1,(X):INPUT#1,X$:IF LEN(X$)<3 THENR=X:DCLOSE#1:RETURN
5780 RECORD#1,(X):NEXT X:RECORD#1,(X):DCLOSE#1
5800 RETURN
5820 REM **LOAD ALL SECTORS OWNED**
5840 DOPEN#1,"sectors2.dat",L26,D(DV),U(U):C=0:FORX=1TO20:FORY=1TO20:IFAR%(X,Y,1)>0THENC=C+1:S(C)=((X-1)*20)+Y:XC(C)=X:YC(C)=Y
5860 NEXTY:NEXTX:FOR D=1 TO C:RECORD#1,(S(D)):INPUT#1,PR$(2),PR$(3),PR$(4),PR$(5),PR$(6),PR$(7),PR$(8),PR$(9):RECORD#1,(S(D)):FOR Z=2 TO 9
5880 AR%(XC(D),YC(D),Z)=VAL(PR$(Z)):AR%(XC(D),YC(D),10)=1:NEXTZ:NEXTD:DCLOSE#1:RETURN
5900 AR%(XC(X),YC(X),Y)=VAL(A$(Y)):NEXTY:NEXTX
5920 DCLOSE#1:RETURN
5940 FORX=1TO20:FORY=1TO20
5960 IF AR%(X,Y,1)<>0 THEN BEGIN
5965 P=X:GOSUB7050:A$=R$:P=Y:GOSUB7050:B$=R$:P=AR%(X,Y,3):GOSUB7050:C$=R$:P=AR%(X,Y,2):GOSUB7050:D$=R$:P=AR%(X,Y,4):GOSUB7050:E$=R$
5970 P=AR%(X,Y,1):GOSUB7050:F$="Player #"+R$:G$=MID$(".SMFX#AT*",(AR%(X,Y,0)+1),1):P=AR%(X,Y,5):GOSUB7050:H$=R$:P=AR%(X,Y,6):GOSUB7050:I$=R$
5980 PRINT"{white}Sector ";A$;",";B$;"[Stype '"+G$+"'{white}]:";C$;" Wrks.{light gray}{reverse on} {reverse off}{white}";E$;" Slds.{light gray}{reverse on} {reverse off}{white}";H$;" Guns{light gray}{reverse on} {reverse off}{white}";D$;" Effc.{light gray}{reverse on} {reverse off}{white}";I$;" Prod.{reverse on}{light gray} {white}{reverse off}";F$
6000 BEND
6020 NEXT Y:NEXTX:RETURN
6040 END
6060 DOPEN#1,"e.config",D0,U8,W
6080 PRINT#1,"8":PRINT#1,"0":PRINT#1,"Date":DCLOSE#1
6100 END
6120 OPEN 4,4,7:PRINT#4,CHR$(27);"a":PRINT#4,CHR$(29):PRINT#4,CHR$(27);"h":PRINT#4,CHR$(27);"8":CMD4:LIST:CLOSE4
6140 PRINTTI$:FORX=1TO20:FORY=1TO20:NEXTY:NEXTX:PRINTTI$
6160 DOPEN#1,"array":INPUT#1,A$:PRINTLEN(A$)
6180 DOPEN#1,"maintlist",D0,U8,W:CMD1:LIST:DCLOSE#1:END
6200 SCRATCH"empire20":SCRATCH"empire21":SCRATCH"empire22":SCRATCH"empire23":SCRATCH"empire24":SCRATCH"empire25":SCRATCH"empire26":SCRATCH"empire26"
6220 S=400
6240 Y=(S/21-INT(S/21))*21:X=INT(S/21)+1
6260 PRINT X,Y,S
6500 RETURN:X=POS(1):PRINTLEFT$("{left*21}",X);"{up}";:RETURN
6505 RETURN
6699 REM ** GENERATE MONEY!:P=PLAYER, P2=AMOUNT NEEDED**
6700 A=P:P$="{space*3}{red}WARNING:{pink} Resources sold off for emergency money.":GOSUB6900
6702 P2=P2*3:REM !!!HOW MUCH TO PUNISH EMPIRES WITH NOT ENUF MONEY!!!
6705 IF P2>P(A,4)THEN P2=P2-P(A,4):ELSE P(A,4)=P(A,4)-P2:P2=0:RETURN
6710 IF P2>INT(P(A,3)/5)THEN P2=P2-INT(P(A,3)/5):ELSEP(A,3)=P(A,3)-INT(P2*5):P2=0:RETURN
6715 IF P2>INT(P(A,2)/40) THEN R=99:RETURN:ELSE P(A,2)=P(A,2)-(P2*40):RETURN
6749 REM ** GENERATE FOOD!:P=PLAYER, P2=AMOUNT NEEDED**
6750 A=P:P$="{space*3}{red}WARNING:{pink} Resources sold off for emergency food.":GOSUB6900
6752 P2=P2*3:REM !!!HOW MUCH TO PUNISH EMPIRES WITH NOT ENUF FOOD!!!
6755 IF P2>P(A,1)*40 THEN P2=P2-(P(A,1)*40):ELSE P(A,1)=P(A,1)-INT(P2/40):RETURN
6760 IF P2>P(A,4)*40 THEN P2=P2-(P(A,4)*40):ELSE P(A,4)=P(A,4)-INT(P2/40):RETURN
6765 IF P2>P(A,3)*8 THEN R=99:RETURN:ELSE P(A,3)=P(A,3)-INT(P2/8):RETURN
6899 REM **PRINTLINE TO PLAYER P**
6900 X=1:DO UNTIL BF$(A,X)="":X=X+1:LOOP:BF$(A,X)=P$:RETURN
7050 REM **STRIP:RETURNS A STRIPPED STR$ VALUE FOR P IN R$**
7055 P$=STR$(P):R$=RIGHT$(P$,(LEN(P$)-1)):RETURN
7099 REM **HALVEPOP:HALVES THE POPULATION OF EVERY SECTOR OWNED BY P**
7100 FORX=1TO20:FORY=1TO20:IFAR%(X,Y,1)=P THEN AR%(X,Y,3)=INT(AR%(X,Y,3)/2)
7105 NEXTY:NEXTX:RETURN
7199 REM **ZEROPROD/HALFEFF:ZEROS THE PRODUCTION/HALVES EFFICIENTCY**
7200 FORX=1TO20:FORY=1TO20:IFAR%(X,Y,1)=P THEN AR%(X,Y,6)=0:AR%(X,Y,2)=INT(AR%(X,Y,2)/2)
7205 NEXTY:NEXTX:RETURN
7210 PRINT SPC(INT(40-LEN(P$)/2))P$:RETURN
8000 DATA "January","Febuary","March","April","May","June","July","August","September","October","November","December"
8500 FORX=1TO9:FI$="@"+MID$(STR$(X),2)+".news":DOPEN#1,(FI$),D0,U8,W:PRINT#1,"(ha ha)":DCLOSE#1:NEXTX:END
9000 INPUTFI$:DOPEN#1,(FI$):DO:INPUT#1,A$:PRINTA$:LOOPUNTILST:DCLOSE:END
9500 DOPEN#1,"1.news":DO:GET#1,A$:PRINTA$;:LOOPUNTILST