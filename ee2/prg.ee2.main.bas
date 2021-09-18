!--------------------------------------------------
!- Thursday, September 16, 2021 2:57:20 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.ee2.main.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
1 REM *** EMPIRE MAIN MODULE ****************************************
2 ON JP GOTO 500,1050
3 FORX=0TO9:READMP$(X):NEXTX
90 PRINT"{clear}"
93 R$="{cyan}E{space*3}m{space*3}p{space*3}i{space*3}r{space*3}e{space*6}E{space*3}d{space*3}i{space*3}t{space*3}i{space*3}o{space*3}n{space*6}I{space*3}I":GOSUB7600:PRINT:R$="{white}Version 1.3a -- 08/31/91":GOSUB7600:PRINT
94 PRINT:PRINT"{gray}-->{light gray}Loading array..."
120 GOSUB 6030:REM ** LOAD ARRAY **
150 P$=PA$(1):PRINT "{gray}-->{light gray}Checking for status...":GOSUB 6000:REM -->SEE IF THE USER IS A PLAYER
160 IF R<>99 THEN PL=R:GOTO 304
170 XA=0:YA=0:PL=0:FOR X=1 TO 20:FOR Y=1 TO 20
172 IF AR%(X,Y,0)=1 AND AR%(X,Y,1)=0 THEN XA=X:YA=Y
173 IF AR%(X,Y,1)>PL THEN PL=AR%(X,Y,1)
174 NEXTY:NEXTX:PL=PL+1
188 IF PL>9 THEN PRINT "{red}{reverse on} {reverse off}{pink}All player slots filled.{space*2}Sorry.{reverse on}{red} {reverse off}":END
190 PRINT:AR%(XA,YA,1)=PL:AR%(XA,YA,10)=1:REM *GIVE THE NEW GUY A SUPPLY CENTER*
195 PRINT "{light gray}New Player:"
235 PRINT"{blue}{space*5}Empire name({light blue}4 letters or more{blue}):{light gray}";:P=2:L=20:GOSUB 5000
237 IF LEN(R$)<4 THEN PRINT "{light blue}That name is too short!{space*2}Think of another.":GOTO 235
240 P$(1,1)=PA$(1):P$(1,2)=R$:PRINT:PRINT"{light gray}Hello, "P$(1,2)"."
245 REM ** SET NEW PLAYER STATS **
250 P$(1,3)=PA$(2):P(1,19)=181
251 P$(1,4)="XXX":P$(1,5)="XXX"
252 AR%(XA,YA,2)=100:AR%(XA,YA,3)=250:AR%(XA,YA,4)=250:AR%(XA,YA,5)=10
254 P(1,1)=2000:P(1,2)=2000:P(1,3)=2000:P(1,4)=500:P(1,5)=1
270 PRINT "You are player #"MID$(STR$(PL),2):PRINT"(lucky you)":PRINT
275 PRINT"Saving sectors...":GOSUB6150
280 P=1:P2=PL:GOSUB 5800:GOSUB 6050
290 IF R=99 THEN PRINT "ERROR: Record not saved.{space*2}Aborting.":END
299 GOTO310
304 PRINT "{gray}-->{light gray}Now loading player statistics and sectors...":P=R:P2=1:GOSUB 5700:P=PL:GOSUB6200
305 IF R=99 THEN PRINT "ERROR: Record not loaded, aborting.":END
310 PRINT"{light gray}Welcome back, "P$(1,2):PRINT
315 PRINT "[{white}Empire Bulletin{light gray}]":P$="ee2.message":GOSUB7000:IFR=99THENPRINT"-->No bulletin file present."
330 PRINT:PRINT "{light gray}Empire News since "P$(1,3)":"
333 P=PL:GOSUB7050
335 P$=R$+".news":GOSUB 7000
340 IF R=99 THEN PRINT "{green}-->No news file present."
345 GOTO 500
400 REM ----- MAIN TRAP ROUTINE -----------------------------------------------
410 DCLOSE:IF(PEEK(56577)AND16)<>16ANDPEEK(7513)<>1THENPRINT"{white}{reverse on}{ct o}CARRIER DROPPED":GOTO1050
415 IFPEEK(7273)<1THENPRINT"{white}{ct o}System time limit exceeded!":GOTO1050
420 TRAP400:CLOSE2:PRINT"{white}BASIC error: "ERR$(ER)" @"EL:GOSUB450:GOTO500
450 PRINT"{light gray}Press any key to continue":GETKEYA$:RETURN
500 PRINT:PRINT "{light gray}Empire Command({gray}? for menu{light gray}):{white}";
505 L=20:P=1:P2=1:GOSUB 5000
510 IF R$="?" THEN BEGIN
511 REM -----------------------------
515 PRINT
520 PRINT "{blue}E m p i r e{space*2}E d i t i o n{space*2}I I {light blue}--{space*2}{blue}Main Command Menu":PRINT
530 PRINT "{space*2}{light gray}A{gray}ttack{space*14}{light gray}C{gray}ensus"
531 PRINT "{space*2}{light gray}D{gray}esignate{space*11}{light gray}H{gray}elp"
535 PRINT "{space*2}{light gray}I{gray}nformation{space*9}{light gray}M{gray}ap"
536 PRINT "{space*2}{light gray}N{gray}ews{space*16}{light gray}Q{gray}uit"
540 PRINT "{space*2}{light gray}P{gray}roduction change{space*3}{light gray}PO{gray}wer report"
545 PRINT "{space*2}{light gray}T{gray}ransport goods"
550 GOTO 500
560 REM -----------------------------
570 BEND
572 IF R$="PO" THEN PRINT:P$="empire.power":GOSUB7000:GOTO500
580 IF R$="M" THEN BEGIN
590 REM -----------------------------
600 PRINT "{light gray}Upper left corner[{gray}X,Y{light gray}]:{white}";:GOSUB7200:P1=RA:A=RB:PRINT"{light gray}Lower right corner[{gray}X,Y,RETURN for 20,20{light gray}]:{white}";:GOSUB7200:P3=RA:P4=RB:P2=A:PRINT
605 IF P1<>99 AND P3=99 THEN P3=20:P4=20
610 IF P3<P1 OR P4<P2 THEN PRINT "{red}Invalid.":GOTO500
613 IF P1=99 OR P2=99 OR P3=99 OR P4=99 THEN PRINT "{red}Invalid.":GOTO500
615 GOSUB 7300
760 REM -------------------------------
770 BEND
780 IF R$="D" THEN BEGIN
790 REM ------------------------------
810 PRINT "{light gray}Enter sector[{gray}X,Y{light gray}]:{white}";:GOSUB7200
820 IF RA=99 THEN 810
840 IF AR%(RA,RB,1)<>PL THEN PRINT "You don't own that sector!":GOTO 500
842 IF AR%(RA,RB,0)=9 THEN PRINT "Nuked sectors cannot be redesignated.":GOTO500
845 PRINT "{light gray}Change to what type[{gray}.,S,M,F,X,#,E,A,T ?,Quit{light gray}]:{white}";:P2=1:P=1:L=1:GOSUB5000
850 X=INSTR(".SMFX#EAT?Q",R$)
851 IF X=10 THEN P$="hlp.Designate":GOSUB7000:GOTO 845
852 IF X=11 THEN GOTO 500
853 IF X=0 THEN PRINT "Invalid designation.":GOTO500
854 IF AR%(RA,RB,0)=X-1 THEN GOTO 500
855 AR%(RA,RB,0)=(X-1):AR%(RA,RB,2)=0:AR%(RA,RB,6)=0:AR%(RA,RB,7)=0
860 GOTO 500
865 REM -------------------------------
870 BEND
897 REM --------------------------------
900 REM What's this line for?
915 IF R$="A" THEN BEGIN
917 REM ---------------------------------
925 PRINT "{light gray}Attack sector:{white}";:GOSUB7200:IFRA=99THEN500:ELSE XA=RA:YA=RB
930 PRINT "{space*2}{light gray}From sector:{white}";:GOSUB7200:IF RA=99 THEN500:ELSE XB=RA:YB=RB
940 IF XA<1 OR XA>20 OR YA<1 OR YA>20 OR YB<1 OR YB>20 OR XB<1 OR XB>20 THEN PRINT "{red}Invalid.":GOTO500
942 IF AR%(XA,YA,1)=PL THEN PRINT"You already own that sector!":GOTO500
945 IF AR%(XB,YB,1)<>PL THEN PRINT "You don't own that sector!":GOTO500
947 IF (((XB-XA)^2)+((YB-YA)^2))>2 THEN PRINT "Too far away!":GOTO500
950 P=XA:P2=YA:GOSUB 7700
955 PRINT "{light gray}Attack with how many troops[{gray}max:"STR$(AR%(XB,YB,4))"{light gray}]:{white}";:L=3:P=3:GOSUB5000
957 A=VAL(R$):IF A=0 THEN PRINT"Abort.":GOTO500
958 C=5*A:PRINT "{red}ENERGY COST{pink}:{pink}"+STR$(C):IF C>P(1,3) THEN PRINT "Not enough energy at supply center for attack.":GOTO 500
959 D=6*A:PRINT "{space*2}{red}FOOD COST{pink}:{pink}"+STR$(D):IFD>P(1,2) THEN PRINT "Not enough food for attack.":GOTO 500
960 IF A>AR%(XB,YB,4) THEN PRINT "You don't have that many troops!":GOTO 500
970 YO=AR%(XB,YB,4)-A:X=AR%(XA,YA,4):Y=A:M=(X+1)/(Y+1):REM ** XA/YA DEFENDERS, XB/YB ATTACK**
972 AT=PL:DF=AR%(XA,YA,1):AT$=P$(1,2):IF DF<>0 THEN P=DF:P2=2:GOSUB5700:DF$=P$(2,2):P=XA:GOSUB7050:S$=R$:P=YA:GOSUB7050:S$=S$+","+R$
975 IF X=0 THEN X=1
977 P(1,3)=P(1,3)-C:P(1,2)=P(1,2)-D
980 XC=INT((Y+RND(Y))/2)+1:YC=INT((X+RND(X))/2)+1:X=X-XC:Y=Y-YC:REM **LOSSES = # OF ATTACKERS/DEFENDERS**
990 IF X<0 THEN X=0
995 IF Y<0 THEN Y=0
996 IF X>0 AND Y>0 THEN PRINT ".":GOTO 980
997 PR$(2)="":PR$(3)=""
1000 IF Y>0 AND X=0 THEN PRINT "{red}Victory!":AR%(XA,YA,4)=1:AR%(XA,YA,1)=PL:AR%(XB,YB,4)=YO+(Y-1):AR%(XA,YA,10)=1:P=3:P2=3:GOTO 1022
1005 IF Y=0 THEN PRINT "Defeat!"
1007 P=0:PR$(1)=DT$+":"+AT$+"'s empire fails to capture a sector.":GOSUB7650
1008 IFDF<>0THENP=DF:PR$(1)=DT$+":"+AT$+"'s empire failed to capture your sector "+S$+".":GOSUB7650
1010 AR%(XA,YA,4)=X:AR%(XB,YB,4)=YO
1020 GOTO 500
1022 PRINT"{light gray}Occupy with how many troops[{gray}Max"STR$(AR%(XB,YB,4))"{light gray}]:{white}";:GOSUB5000:IF VAL(R$)>AR%(XB,YB,4) THEN 1022
1023 A=VAL(R$):IF(A*6)>P(1,2) THEN PRINT"{red}Not enough food.":GOTO1024:ELSE D=A*6:AR%(XA,YA,4)=AR%(XA,YA,4)+A:AR%(XB,YB,4)=AR%(XB,YB,4)-A:P(1,3)=P(1,3)-C
1024 P(1,2)=P(1,2)-D:P=0:PR$(1)=DT$+":"+AT$+"'s empire attacks and captures a sector.":GOSUB7650:PRINT"{space*2}{red}FOOD COST:{pink}"D
1025 IF DF<>0 THEN P=DF:PR$(1)=DT$+":"+AT$+"'s empire took sector "+S$+" from you.":GOSUB7650
1027 BEND
1030 REM ---------------------------------
1040 IF R$="Q" THEN BEGIN
1045 REM ---------------------------------
1050 P=1:P2=PL:PRINT"Please wait, saving.":GOSUB 5800
1060 GOSUB6050
1070 GOSUB6150
1075 DOPEN#1,"@ee2.data",D(DV),U(U),W:PRINT#1,PA$(1),DT$,DT$:DCLOSE#1
1080 PRINT:PRINT"{blue}Elite Empire Edition II {light blue}v1.3a {blue}Copyright 1991 by J. MacNish{black}";
1082 END
1085 REM ---------------------------------
1090 BEND
1100 IF R$="I" THEN BEGIN
1110 REM -------------------------------
1115 PRINT
1120 R$="{white}Empire Status":GOSUB7600
1130 PRINT"-->{light gray}Empire Name: "P$(1,2)
1150 PRINT
1160 A$="{white}-->{light blue}Money{space*6}:"+STR$(P(1,1))
1165 B$="{white}-->{blue}Planes{space*5}:"+STR$(P(1,9)):GOSUB7800
1170 A$="{white}{space*2}>{light blue}Food{space*7}:"+STR$(P(1,2))
1175 B$="{white}{space*2}>{blue}Bombs{space*6}:"+STR$(P(1,11)):GOSUB7800
1180 A$="{white}{space*2}>{light blue}Energy{space*5}:"+STR$(P(1,3))
1185 B$="{white}{space*2}>{blue}Nukes{space*6}:"+STR$(P(1,12)):GOSUB7800
1190 A$="{white}{space*2}>{light blue}Ore{space*8}:"+STR$(P(1,4))
1195 B$="{white}{space*2}>{blue}ChemBombs{space*2}:"+STR$(P(1,13)):GOSUB7800
1196 A$="{white}{space*16}"
1197 B$="{white}{space*2}>{blue}Missles{space*4}:"+STR$(P(1,10)):GOSUB7800
1210 A$="{white}-->{gray}Tech{space*7}:"+STR$(P(1,5))
1215 Z=0:FORX=1TO20:FORY=1TO20:IFAR%(X,Y,1)=PLTHENZ=Z+1
1217 NEXTY:NEXTX:PRINT:B$="{white}-->{green}Sectors{space*4}:"+STR$(Z):GOSUB7800
1260 GOTO500
1270 REM ---------------------------
1280 BEND
1350 IF R$="C" THEN BEGIN
1360 REM -----------------------------
1380 PRINT "{light gray}Top left corner[{gray}X,Y{light gray}]:{white}";:GOSUB 7200
1390 XA=RA:YA=RB:PRINT "{light gray}Bottom right corner[{gray}X,Y,RETURN for same sector{light gray}]:{white}";:GOSUB7200:XB=RA:YB=RB
1395 IF RA=99 THEN XB=XA:YB=YA
1400 IF XA=99 OR YA=99 OR XB=99 OR YB=99 THEN PRINT "{red}Invalid.":GOTO500
1490 PRINT:PRINT "{light blue}[SType] [Effic] [Wrkrs] [Sldrs] [Guns ] [Produ] [PType] [X,Y ]
1495 PRINT "{cyan}-----------------------------------------------------------------------{white}"
1497 MK$(0)="None"
1500 FOR Y=YA TO YB:FOR X=XA TO XB
1505 IF AR%(X,Y,1)<>PL THEN 1540
1512 A$=" "+MID$(".SMFX#EAT*",(AR%(X,Y,0)+1),1)
1520 FORZ=2TO6:P=AR%(X,Y,Z):GOSUB7050:PR$(Z)=R$:NEXTZ:P=X:GOSUB7050:PR$(8)=R$:P=Y:GOSUB7050:PR$(8)=PR$(8)+","+R$
1524 MK$=MK$(AR%(X,Y,7))
1525 P=AR%(X,Y,0):IF P=2 THEN MK$="Ore":ELSE IF P=3 THEN MK$="Food":ELSE IF P=6 THEN MK$="Energy":ELSE IF P=7 THEN MK$="Planes":ELSEIFP=8THENMK$="Tech"
1527 IF P=9 THEN MK$="(Nuked)":PR$(2)="(Nuked)"
1530 PRINT A$;LEFT$(SP$,(9-POS(1)));PR$(2);LEFT$(SP$,(17-POS(1)));PR$(3);LEFT$(SP$,(25-POS(1)));PR$(4);
1534 PRINT LEFT$(SP$,(33-POS(1)));PR$(5);LEFT$(SP$,(41-POS(1)));PR$(6);LEFT$(SP$,(49-POS(1)));MK$;LEFT$(SP$,(57-POS(1)));PR$(8)
1540 NEXTX:NEXTY
1545 GOTO 500
1630 BEND
1635 REM ------------------------------------------------------------
1650 IF R$="T" THEN BEGIN
1652 REM >> A=ITEM #, B=DISTANCE TO MOVE, C=AMOUNT TO MOVE
1655 REM ------------------------------------------------------
1660 A=0:B=0:C=0:PRINT "{light gray}Item to move[{gray}Workers,Soldiers,Guns{light gray}]:{white}";:L=1:P2=1:P=1:GOSUB5000:A=INSTR("WSG",R$):IF A=0 THEN 1660:ELSE A=A+2
1665 PRINT "{light gray}Sector to move from:{white}";:GOSUB 7200:IFRA=99 THEN GOTO 500
1666 IF AR%(RA,RB,1)<>PL THEN PRINT "{red}Not your sector.":GOTO500
1667 XA=RA:YA=RB
1668 IF AR%(XA,YA,A)=0 THEN PRINT "Nothing to move in that sector.":GOTO500
1670 PRINT "{light gray}Sector to move to:{white}";:GOSUB7200:IFRA=99THENPRINT"{red}Invalid.":GOTO500:ELSE IF AR%(RA,RB,1)<>PL THEN PRINT "Not your sector.":GOTO500
1675 XB=RA:YB=RB
1680 B=(((XB-XA)^2+(YB-YA)^2))
1690 PRINT "{light gray}Move how much[{gray}max:"STR$(AR%(XA,YA,A))"{light gray}]:{white}";
1700 L=3:P=3:GOSUB5000:C=VAL(R$):IF C>AR%(XA,YA,A) THEN PRINT "{red}You don't own that much.":GOTO500
1705 IF C=0 THEN PRINT "{red}Abort.{space*2}Not moving anything.":GOTO500
1710 IF B>1.5 THEN PRINT "{green}MOVING:{light green} Distance too far to truck.{space*2}Airlifting.{space*2}";:D=INT(C*7*(B/2))
1715 IF B<=1.5 THEN PRINT "{green}MOVING:{light green} Trucking items.{space*2}";:D=INT(C*2*B)
1720 IF (P(1,3)-D)<0 THEN PRINT "{light gray}Move canceled from lack of fuel.":P=D:GOSUB7050:PRINT"{light gray}Cost:"R$:GOTO500
1725 P(1,3)=P(1,3)-D:PRINT "{light gray}Items arrived at location.":P=D:GOSUB7050:PRINT "Cost:"R$"{cyan} -- {light gray}";:P=P(1,3):GOSUB7050:PRINT"Energy Left:"R$
1730 AR%(XB,YB,A)=AR%(XB,YB,A)+C:AR%(XA,YA,A)=AR%(XA,YA,A)-C
1735 IF (A=3 OR A=4) AND AR%(XB,YB,A)>250 THEN PRINT "Not enough space.{space*2}Some people return.":AR%(XA,YA,A)=AR%(XA,YA,A)+AR%(XB,YB,A)-500:AR%(XB,YB,A)=500
1736 IF A=4 AND AR%(XB,YB,A)>250 THEN PRINT "Not enough space.{space*2}Some workers return.":AR%(XA,YA,A)=AR%(XA,YA,A)+AR%(XB,YB,A)-500:AR%(XB,YB,A)=500
1737 IF A=5 AND AR%(XB,YB,A)>250 THEN PRINT "Not enough space.{space*2}Some guns return.":AR%(XA,YA,A)=AR%(XA,YA,A)+AR%(XB,YB,A)-100:AR%(XB,YB,A)=100
1740 GOTO 500
1750 BEND
1760 REM -----------------------------------------------------------------
1770 IF R$="S" THEN PRINT:PRINT "{blue}-->{light blue}Switching to strategic module...please wait.":DLOAD (SR$),U(U),D(DV)
2600 IF R$="N" THEN BEGIN
2605 PRINT:R$="{cyan}World News as of "+LD$:GOSUB7600:PRINT "{white}-----------------------------------------------------------------------------"
2620 P$="empire.news":GOSUB7000:IFR=99THEN PRINT "-->No world news at this time."
2630 PRINT:R$="{cyan}"+P$(1,2)+" Empire News as of "+LD$:GOSUB7600:PRINT"{white}-----------------------------------------------------------------------------"
2632 P=PL:GOSUB7050:P$=R$+".news":GOSUB7000
2635 IF R=99 THEN PRINT "-->No news at this time."
2637 PRINT "{light gray}Reset your news file[{gray}Yes, No{light gray}]:{white}";:GETKEYA$:IFA$="y"ORA$="Y"THENPRINT"Yes":DOPEN#1,("@"+P$),D(DV),U(U),W:PRINT#1,"(News reset)":DCLOSE#1
2638 IF A$<>"y" AND A$<>"Y" THEN PRINT "No"
2640 BEND:REM ------END OF NEWS---------
2700 IF R$="P" THEN BEGIN
2701 REM --------------------------------------
2710 PRINT "{light gray}Change production of which factory sector:{white}";:GOSUB7200
2720 IF RA=99 THEN GOTO 500:ELSE IF AR%(RA,RB,1)<>PL THEN PRINT "You don't own that sector.":GOTO 2710
2725 IF AR%(RA,RB,0)<>5 THEN PRINT "Not a factory.":GOTO 2710
2730 PRINT "{light gray}Production type[{gray}COnventional, NUclear, CHemical[warheads], Missles, Guns{light gray}]:{white}";
2735 L=2:P2=1:P=1:GOSUB5000:IF R$<>"CO" AND R$<>"NU" AND R$<>"CH" AND R$<>"M" AND R$<>"G" THEN GOTO 2730
2740 IF R$="CO" THEN Y=2:ELSE IF R$="NU" THEN Y=3:ELSE IF R$="CH" THEN Y=4:ELSE IF R$="M" THEN Y=1:ELSE IF R$="G" THEN Y=5
2745 AR%(RA,RB,7)=Y:PRINT "New production set."
2750 BEND
2770 IF R$="H" THEN BEGIN
2780 PRINT:PRINT "{light gray}-->{blue}Loading help directory...";
2785 X=1:DOPEN#1,"ee2.helpmenu",D(DV),U(U),R
2790 INPUT#1,PR$(X):IF ST<>0 THEN 2792:ELSE X=X+1:GOTO 2790
2792 DCLOSE#1:C$="":FOR Y=1 TO X:A$(Y)=LEFT$(PR$(Y),1):C$=C$+A$(Y):NEXTY:PR$(X+1)=""
2795 PRINT "{left*28}{light gray}Help Topics:{space*16}":PRINT
2800 FOR Y=1 TO X STEP 3
2805 PRINT PR$(Y);SPC(26-LEN(PR$(Y)));PR$(Y+1);SPC(26-LEN(PR$(Y+1)));PR$(Y+2):NEXT Y
2810 PRINT:PRINT "{light gray}Help System({gray}";:FOR Y=1 TO X:PRINT A$(Y)",";:NEXTY:PRINT"eXit{light gray}):{white}";
2820 L=1:P=1:P2=1:GOSUB 5000:IF R$="X" THEN GOTO 500
2825 B=INSTR(C$,R$):IF B=0 THEN PRINT "{red}No help file for that topic.":GOTO 2810
2830 P$="hlp."+PR$(B):PRINT:GOSUB 7000:GOTO 2810
2840 BEND
4997 GOTO 500
4998 END
4999 REM **GET LINE OF LENGTH L, ALLOWING ONLY CHARACTERS IN C$(P)**
5000 R$=""
5001 A$="":GETA$:IFA$="" THEN 5001
5010 IF LEN(R$)=L AND A$<>CHR$(20) AND A$<>CHR$(13) THEN 5001
5020 IF A$=CHR$(13) THEN PRINT:P2=0:RETURN
5025 IF A$=CHR$(20) AND LEN(R$)>0 THEN R$=LEFT$(R$,(LEN(R$)-1)):PRINT A$;:GOTO 5001
5030 IF INSTR(C$(P),A$)=0 THEN 5001
5032 IF P2<>0 AND ASC(A$)>64 AND ASC(A$)<128 THEN A$=CHR$(ASC(A$)+128)
5035 PRINT A$;:R$=R$+A$:GOTO 5001
5697 REM **LOAD PLAYER P INTO P$(P2,##) AND P(P2,##) SLOT**
5698 REM **RECORD LENGHT OF 150 BYTES, 30 RECORDS IN FILE**
5699 REM **LOAD PLAYER P INTO P$(P2) AND P(P2) SLOT**
5700 IF P<1 OR P>20 OR P2>20 OR P2<1 THEN R=99:RETURN
5705 DOPEN#1,"empires.dat",L150,D(DV),U(U)
5710 RECORD#1,(P):FOR X=1 TO 5:INPUT#1,P$(P2,X):NEXTX:FORX=1TO20:INPUT#1,A$:P(P2,X)=VAL(A$):NEXTX:RECORD#1,(P)
5730 DCLOSE#1:RETURN
5799 REM **SAVE PLAYER FROM P$(P,##) AND P(P,##) INTO P2 SLOT**
5800 IF P<1 OR P>20 OR P2>20 OR P2<1 THEN R=99:RETURN
5810 PR$="":DOPEN#1,"empires.dat",L150,D(DV),U(U)
5820 FOR X=1 TO 5:PR$=PR$+P$(P,X)+CHR$(13):NEXTX
5825 FOR X=1 TO 20:PR$=PR$+STR$(P(P,X))+CHR$(13):NEXT X
5830 IF LEN(PR$)>150 THEN R=99:PRINTPR$::PRINT LEN(PR$):DCLOSE#1:RETURN
5840 RECORD#1,(P2):PRINT#1,PR$:RECORD#1,(P2)
5850 DCLOSE#1:R=0:RETURN
5999 REM **SEARCH FOR PLAYER NAME P$, RETURN PLAYER # IN R**
6000 DOPEN#1,"empires.dat",L150,D(DV),U(U):C=0
6010 R=99:FOR X=1 TO 9:RECORD#1,(X):INPUT#1,X$:RECORD#1,(X):IF X$=P$ THENR=X:DCLOSE#1:RETURN
6020 NEXT X:DCLOSE#1
6024 RETURN
6025 REM **LOAD 40X40 ARRAY**
6030 DOPEN#1,"sectors1.dat",D(DV),U(U),R
6035 INPUT#1,A$(1),A$(2),A$(3),A$(4),A$(5),A$(6),A$(7),A$(8),A$(9),A$(10),A$(11),A$(12),A$(13),A$(14),A$(15),A$(16),A$(17),A$(18),A$(19),A$(20)
6036 DCLOSE#1
6037 FORX=1TO20:Z=1:FORY=1TO20:AR%(X,Y,0)=VAL(MID$(A$(X),Z,1)):AR%(X,Y,1)=VAL(MID$(A$(X),(Z+1),1)):Z=Z+2:NEXTY:NEXTX
6040 DCLOSE#1
6042 RETURN
6049 REM **SAVE ARRAY**
6050 DOPEN#1,"@sectors1.dat",D(DV),U(U),W
6051 FORX=1TO20:PR$(X)="":FORY=1TO20
6053 A$=STR$(AR%(X,Y,0)):B$=STR$(AR%(X,Y,1))
6054 A$=RIGHT$(A$,1):B$=RIGHT$(B$,1)
6055 PR$(X)=PR$(X)+A$+B$:NEXTY:NEXTX
6057 FORX=1TO20:PRINT#1,PR$(X):NEXTX:DCLOSE#1
6060 RETURN
6149 REM **SAVE ALL CHANGED SECTORS**
6150 C=0:PR$="":DOPEN#1,"sectors2.dat",L26,D(DV),U(U)
6155 FOR X=1TO20:FORY=1TO20
6160 IF AR%(X,Y,10)=1 THEN C=C+1:S(C)=((X-1)*20)+Y:PR$(C)="":FORZ=2TO9:PR$(C)=PR$(C)+STR$(AR%(X,Y,Z))+CHR$(13):NEXTZ
6161 NEXTY:NEXTX:IFC=0THEN DCLOSE#1:RETURN:ELSE FORD=1TOC:RECORD#1,(S(D)):PRINT#1,PR$(D):RECORD#1,(S(D)):NEXT D:DCLOSE#1:R=0:RETURN
6198 REM**LOAD ALL SECTORS OWNED BY PLAYER P**
6199 REM**FILLER**
6200 DOPEN#1,"sectors2.dat",L26,D(DV),U(U)
6205 C=0:FORX=1TO20:FORY=1TO20
6220 IF AR%(X,Y,1)=P THEN C=C+1:S(C)=((X-1)*20)+Y:XC(C)=X:YC(C)=Y
6221 NEXTY:NEXTX:IF C=0 THEN DCLOSE#1:RETURN
6222 FORD=1 TO C:RECORD#1,(S(D)):INPUT#1,PR$(2),PR$(3),PR$(4),PR$(5),PR$(6),PR$(7),PR$(8),PR$(9):RECORD#1,(S(D)):FORZ=2TO9:AR%(XC(D),YC(D),Z)=VAL(PR$(Z))
6223 NEXTZ:AR%(XC(D),YC(D),10)=1:NEXTD:DCLOSE#1:RETURN
6999 REM **LOAD FILE P$, THEN PRINT**
7000 DOPEN#1,(P$),D(DV),U(U)
7005 INPUT#1,A$:GG=ST:PRINTA$:IFGG=0THENGOTO7005:ELSEDCLOSE#1:PRINT"{green}End of file.{white}":RETURN
7049 REM **STRIP:RETURNS A STRIPPED STR$ VALUE FOR P IN R$**
7050 P$=STR$(P):R$=RIGHT$(P$,(LEN(P$)-1)):RETURN
7099 REM ** FIND LAST PLAYER **
7100 DCLOSE#1:DOPEN#1,"empires.dat",L150,D(DV),U(U)
7110 R=99:FOR X=1 TO 20:RECORD#1,(X):INPUT#1,X$:IF LEN(X$)<3 THENR=X:DCLOSE#1:RETURN
7120 RECORD#1,(X):NEXT X:RECORD#1,(X):DCLOSE#1
7124 RETURN
7199 REM ** GET SECTOR(ONE) **
7200 L=5:P=5:GOSUB5000
7210 Y=0:Z=LEN(R$):FORX=1TOZ:IFMID$(R$,X,1)="," THEN Y=X
7212 NEXT X
7215 IF Y=0 THEN RA=99:RB=99:RETURN
7220 RA=VAL(LEFT$(R$,(Y-1))):RB=VAL(RIGHT$(R$,(Z-Y)))
7225 IF RA<1 OR RA>20 OR RB<1 OR RB>20 THEN RA=99:RB=99:REM ++++++++++++
7230 RETURN
7299 REM **MAP ROUTINE **
7300 PRINT "{space*3}"MID$(XM$(1),((P1*2)+1),(((P3-P1)*2)+1)):PRINT "{space*3}"MID$(XM$(2),((P1*2)+1),(((P3-P1)*2)+1)):FORY=P2TOP4:P=Y:GOSUB7050:IFLEN(R$)=1THENR$="0"+R$
7302 PRINT "{white}"R$" ";:FOR X=P1 TO P3
7305 PRINT MP$(AR%(X,Y,0));
7307 NEXTX:PRINT:NEXTY:RETURN
7499 REM ** BOMB/MISSLE DAMAGE 1=CONV. 2=NUKE 3=CHEM **
7599 REM **CENTER R$ AND PRINT IT*****
7600 X=40-(LEN(R$)/2):PRINT LEFT$(SP$,X)+R$:RETURN
7649 REM **ADD LINES P$(1-3) TO FILE P$******
7650 A=P:GOSUB7050:FI$=R$+".news":IF A=0 THEN FI$="empire.news"
7653 APPEND#1,(FI$),D(DV),U(U):FORX=1TO3:IFPR$(X)<>""THEN PR$(X)=CHR$(34)+PR$(X):PRINT#1,PR$(X)
7654 PR$(X)="":NEXTX:DCLOSE#1:RETURN
7699 REM ** LOAD SINGLE SECTOR P=X, P2=Y **
7700 IF P<1 OR P>20 OR P2<1 OR P2>20 THEN R=99:RETURN
7705 X=P:Y=P2:DOPEN#1,"sectors2.dat",L26,D(DV),U(U):S=((X-1)*20)+Y:RECORD#1,(S):INPUT#1,PR$(2),PR$(3),PR$(4),PR$(5),PR$(6),PR$(7),PR$(8),PR$(9):RECORD#1,(S)
7710 FORZ=2TO9:AR%(X,Y,Z)=VAL(PR$(Z)):NEXTZ:AR%(X,Y,10)=1:DCLOSE#1:RETURN
7799 REM ** TAB ROUTINE**
7800 PRINT A$;LEFT$(SP$,(40-POS(1)))+B$:RETURN
7899 REM *** ERROR CATCHER ****
8000 R=0:Y=0:FORX=1TOLEN(P$):IFMID$(P$,X,1)=" " THEN Y=Y+1:A(Y)=X:NEXTX:ELSE NEXTX
8005 FORX=1TO10:A$(X)="":NEXTX
8007 A(Y+1)=LEN(P$)
8010 FORX=1 TO Y:A$(X)=MID$(P$,(A(X-1)+1),(A(X)-A(X-1)-1)):NEXTX
8014 A$(Y+1)=MID$(P$,(A(Y)+1)):RA=Y+1
8020 IF INSTR(A$(2),",")<>0 AND INSTR(A$(3),",")<>0 THEN R=3
8022 IF INSTR(A$(3),",")=0 AND INSTR(A$(2),":")<>0 AND INSTR(A$(2),",")<>0 THEN R=2:RETURN
8024 IF INSTR(A$(2),",")<>0 AND INSTR(A$(2),":")=0 AND INSTR(A$(3),",")=0 THEN R=1:RETURN
8026 R=99:RETURN
8029 REM **BREAK SINGLE SECTOR STRING INTO RA,RB**
8030 X=INSTR(A$(2),","):RA=VAL(LEFT$(P$,(X-1))):RB=VAL(MID$(P$,(X+1))
8040 IF RA<1 OR RB<1 OR RA>20 OR RB>20 THEN RA=99:RB=99:RETURN:ELSE RETURN
8050 REM ** BREAK RANGE INTO P1,P2-P3,P4**
8052 C=0:FORX=1TOLEN(A$(2)):IF MID$(A$(2),X,1)="," OR MID$(A$(2),X,1)=":" THEN C=C+1:NEXTX:ELSE NEXTX
8053 IF C<>3 THEN R=99:RETURN
8055 A$=MID$(A$(2),1,(INSTR(A$(2),":")-1)):B$=MID$(A$(2),(INSTR(A$(2),":")+1))
8057 IF INSTR(A$,",")=0 OR INSTR(B$,",")=0 THEN RETURN
8060 P1=VAL(MID$(A$,1,(INSTR(A$,",")-1))):P2=VAL(MID$(A$,(INSTR(A$,",")+1))):P3=VAL(MID$(B$,1,(INSTR(B$,",")-1))):P4=VAL(MID$(B$,(INSTR(B$,",")+1)))
8065 IF P1<1 OR P1>20 OR P2<1 OR P2>20 OR P3<1 OR P3>20 OR P4<1 OR P4>20 THEN R=99:RETURN:ELSE RETURN
8999 END
9000 DOPEN#1,"empire.news",D(DV),U(U)
9005 GET#1,A$:PRINTA$;:GOTO9005
9200 DATA "{gray}. ","{light blue}s ","{white}m ","{white}f ","{white}x ","{white}# ","{white}e ","{white}a ","{white}t ","{red}* "
