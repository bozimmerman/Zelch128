!--------------------------------------------------
!- Thursday, September 16, 2021 2:57:44 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.ee2.str..prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
0 TRAP 400:GOTO1790
400 REM ----- MAIN TRAP ROUTINE -----------------------------------------------
410 DCLOSE:IF(PEEK(56577)AND16)<>16ANDPEEK(7513)<>1THENPRINT"{white}{reverse on}{ct o}CARRIER DROPPED":JP=2:DLOAD"prg.ee2.main",D(DV),U(U)
415 IFPEEK(7273)<1THENPRINT"{white}{ct o}System time limit exceeded!":JP=2:DLOAD"prg.ee2.main",D(DV),U(U)
420 TRAP400:CLOSE2:PRINT"{white}BASIC error: "ERR$(ER)" @"EL:GOSUB450:GOTO1790
450 PRINT"{light gray}Press any key to continue":GETKEYA$:RETURN
1790 PRINT:PRINT "{light gray}IN SUPPLY CENTER:"
1800 PRINT "{space*2}Delivery Systems:"
1810 PRINTUSING "{space*5}Planes:##";P(1,9):PRINT USING "{space*5}Missles:##";P(1,10)
1820 PRINT "{space*2}Payloads:"
1830 P=P(1,11):GOSUB7050:PRINT"{space*4}Conventional:"R$:P=P(1,12):GOSUB7050:PRINT "{space*4}Nuclear:"R$:P=P(1,13):GOSUB7050:PRINT"{space*4}Chemical:"R$
1840 PRINT:PRINT "{light gray}[{gray}FLY{light gray}] Mission, [{gray}FIRE{light gray}] Missles, [{gray}ABORT{light gray}] Strategic forces:{white}";
1850 L=5:P=2:P2=1:GOSUB5000
1860 IF R$="ABORT" THEN PRINT:PRINT "{blue}-->{light blue}Please wait, switching to main module...":JP=1:DLOAD (EP$),D(DV),U(U)
1870 IF R$<>"FLY" THEN 2400
1875 REM >> A=HOW MANY PLANES, B=HOW MANY C.BOMBS, C=HOW MANY NUCLEAR BOMBS
1877 REM >> D=HOW MANY CHEM BOMBS E=FUEL COST/MOVE FU=FUEL
1880 PRINT "{light gray}Fly how many planes[{gray}Max"STR$(P(1,9))"{light gray}]:{white}";:L=3:P=3:GOSUB5000:IF VAL(R$)>P(1,9) THEN PRINT "You don't have that many planes.":GOTO1790
1885 A=VAL(R$):IF A=0 THEN PRINT "No planes to fly.":GOTO1790
1886 G=A
1887 PRINT "{light gray}Fly from which airfield sector:{white}";:GOSUB7200:IF RA=99 THEN PRINT "{red}Invalid.":GOTO 1790
1888 IF AR%(RA,RB,0)<>7 OR AR%(RA,RB,1)<>PL THENPRINT"Can't fly from there.":GOTO1790:ELSE XA=RA:YA=RB
1890 PRINT "{light gray}Load how many conventional bombs[{gray}Max"STR$(P(1,11))"{light gray}]:{white}";:GOSUB5000:IF VAL(R$)>P(1,11) THEN PRINT "Aborted.":GOTO1790
1895 B=VAL(R$)
1900 PRINT "{light gray}Load how many nuclear bombs[{gray}Max"STR$(P(1,12))"{light gray}]:{white}";:GOSUB5000:IF VAL(R$)>P(1,12) THEN PRINT "Aborted.":GOTO1790
1905 C=VAL(R$)
1910 PRINT "{light gray}Load how many chemical bombs[{gray}Max"STR$(P(1,13))"{light gray}]:{white}";:GOSUB5000:IF VAL(R$)>P(1,13) THEN PRINT "Aborted.":GOTO1790
1915 D=VAL(R$)
1920 IF B+C+D=0 THEN PRINT "No bombs loaded.":GOTO1790
1922 P(1,11)=P(1,11)-B:P(1,12)=P(1,12)-C:P(1,13)=P(1,13)-D
1925 FU=(100*A):IF FU>P(1,3) THEN FU=P(1,3):PRINT "{red}WARNING:{white} All energy at supply center used up."
1927 P(1,3)=P(1,3)-FU
1928 PRINT "Fuel left at supply center:"STR$(P(1,3))
1930 E=INT((10*A)+((B+C+D)/A)):PRINT "Fuel cost"STR$(E)" per sector moved."
1940 P=XA:GOSUB7050:XA$=R$:P=YA:GOSUB7050:YA$=R$:P=A:GOSUB7050:A$=R$:P=B:GOSUB7050:B$=R$:P=C:GOSUB7050:C$=R$:P=D:GOSUB7050:D$=R$
1945 P=FU:GOSUB7050:FU$=R$
1950 PRINT "{light gray}IN FLIGHT[{gray}At "XA$","YA$":"A$" PL/"FU$" FU/"B$" CO/"C$" NU/"D$" CH{light gray}]{white}:";
1955 L=2:P=2:P2=1:GOSUB5000
1957 IF (R$="N" OR R$="S" OR R$="W" OR R$="E") AND FU<E THEN PRINT "Not enough fuel.":GOTO 1940
1958 IF (R$="NE" OR R$="SE" OR R$="SW" OR R$="NW") AND FU<(E*1.5) THEN PRINT "Not enough fuel.":GOTO 1940
1960 IF R$="N" AND YA>1 THEN YA=YA-1:FU=FU-E
1965 IF R$="S" AND YA<20 THEN YA=YA+1:FU=FU-E
1970 IF R$="E" AND XA<20 THEN XA=XA+1:FU=FU-E
1975 IF R$="W" AND XA>1 THEN XA=XA-1:FU=FU-E
1980 IF R$="NW" AND YA>1 AND XA>1 THEN YA=YA-1:XA=XA-1:FU=FU-(E*1.5)
1985 IF R$="SE" AND YA<20 AND XA<20 THEN YA=YA+1:XA=XA+1:FU=FU-(E*1.5)
1990 IF R$="SW" AND YA<20 AND XA>1 THEN YA=YA+1:XA=XA-1:FU=FU-(E*1.5)
1995 IF R$="NE" AND YA>1 AND XA<20 THEN YA=YA-1:XA=XA+1:FU=FU-(E*1.5)
2000 IF R$="CO" AND B>0 THEN PRINT "Conventional bomb dropped on sector "XA$","YA$:P=1:GOSUB 7500:B=B-1
2010 IF R$="NU" AND C>0 THEN PRINT "Nuclear bomb dropped on sector "XA$","YA$:P=2:GOSUB 7500:C=C-1
2020 IF R$="CH" AND D>0 THEN PRINT "Chemical bomb dropped on sector "XA$","YA$:P=3:GOSUB 7500:D=D-1
2030 IF R$="LD" THEN BEGIN
2040 PRINT "Attempting to land at sector "XA$","YA$
2050 IF AR%(XA,YA,0)<>7 THEN PRINT "Not an airfield!{space*2}All planes crash.":P(1,9)=P(1,9)-A:GOTO 1790
2060 IF AR%(XA,YA,1)<>PL THEN PRINT"Not your sector.{space*2}Ditching planes.":P(1,9)=P(1,9)-A:GOTO 1790
2070 PRINT STR$(A)" planes landed successfully.":P(1,9)=P(1,9)-(G-A):P(1,11)=P(1,11)+B:P(1,12)=P(1,12)+C:P(1,13)=P(1,13)+D:GOTO 1790
2080 BEND
2090 IF R$="RA" THEN BEGIN
2100 PRINT "Plane Radar:"
2110 XB=XA-1:YB=YA-1:XC=XA+1:YC=YA+1:IF XB<1 THEN XB=1
2115 IF YB<1 THEN YB=1
2120 IF XC>20 THEN XC=20
2125 IF YC>20 THEN YC=20
2130 P1=XB:P2=YB:P3=XC:P4=YC:GOSUB7300
2135 BEND
2140 IF AR%(XA,YA,1)<>PL AND AR%(XA,YA,5)>0 THEN 2145:ELSE GOTO 1940
2145 DM=INT(AR%(XA,YA,5)/10):A=A-DM:PRINT"{red}AA fire hits some planes.":IF A<0 THEN A=0
2150 IF A=0 THEN PRINT "All planes destroyed!":P(1,9)=P(1,9)-A:GOTO 1790
2155 GOTO 1940
2170 REM --END OF FLY
2399 REM >> NUMBER OF MISSLES TO FIRE  B=WHAT KIND OF WARHEAD  C=HOW MANY
2400 PRINT "{light gray}Fire how many missles[{gray}Max"STR$(P(1,10))"{light gray}]:{white}";:L=3:P=3:GOSUB5000:IF VAL(R$)>P(1,10) THEN PRINT "You don't have that many missles.":GOTO1790
2403 A=VAL(R$):IF A<1 THEN 1790
2405 PRINT "{light gray}Load with what kind of warhead[{gray}CO,NU,CH{light gray}]:{white}";:P=2:P2=1:GOSUB5000:IF R$<>"CO" AND R$<>"NU" AND R$<>"CH" THEN 2405
2407 IF R$="CO" THEN B=1
2408 IF R$="NU" THEN B=2
2409 IF R$="CH" THEN B=3
2420 IF P(1,(B+10))=0 THEN PRINT "{red}You have no warheads of that kind.":GOTO1790
2500 IF A>P(1,(B+10)) THEN M=A:ELSE M=P(1,(B+10))
2505 PRINT "{light gray}Load"STR$(A)" missles with how many warheads[{gray}Max"STR$(M)"{light gray}]:{white}";:P=3:GOSUB5000:IF VAL(R$)>M THEN 2505
2507 IF VAL(R$)<1 THEN 1790
2510 C=VAL(R$):PRINT "{light gray}Fire at what sector:{white}";:GOSUB7200:IFRA=99 OR RB=99 THEN PRINT "Invalid sector.":GOTO2510:ELSE XA=RA:YA=RB
2515 P=XA:P2=YA:GOSUB 7700:D=A-INT((AR%(XA,YA,5)/5)):IFD<0THEND=0
2517 IF D=0 THEN PRINT "{red}All missles shot down by air defenses.":GOTO2550
2519 E=INT(D/A*C):IF E=0 THEN PRINT "{red}No missles with warheads reached target.":GOTO2550
2520 P=B:FOR F=1 TO E:PRINT "{red}-->{pink}Missle impacting...":GOSUB7500:NEXTF
2550 P(1,10)=P(1,10)-A:P(1,(B+10))=P(1,(B+10))-C:GOTO 1790
2560 REM ---END OF MISSLE---
2561 REM ---END OF STRATEGIC--
2565 DLOAD (EP$),U(U),DV(DV)
4999 REM **GET LINE OF LENGTH L, ALLOWING ONLY CHARACTERS IN C$(P)**
5000 R$=""
5001 A$="":GETA$:IFA$="" THEN 5001
5010 IF LEN(R$)=L AND A$<>CHR$(20) AND A$<>CHR$(13) THEN 5001
5020 IF A$=CHR$(13) THEN PRINT:P2=0:RETURN
5025 IF A$=CHR$(20) AND LEN(R$)>0 THEN R$=LEFT$(R$,(LEN(R$)-1)):PRINT A$;:GOTO 5001
5030 IF INSTR(C$(P),A$)=0 THEN 5001
5032 IF P2<>0 AND ASC(A$)>64 AND ASC(A$)<128 THEN A$=CHR$(ASC(A$)+128)
5035 PRINT A$;:R$=R$+A$:GOTO 5001
5799 REM **SAVE PLAYER FROM P$(P,##) AND P(P,##) INTO P2 SLOT**
5800 IF P<1 OR P>20 OR P2>20 OR P2<1 THEN R=99:RETURN
5810 PR$="":DOPEN#1,"ee2.empires.dat",L150,U(U),D(DV)
5820 FOR X=1 TO 5:PR$=PR$+P$(P,X)+CHR$(13):NEXTX
5825 FOR X=1 TO 20:PR$=PR$+STR$(P(P,X))+CHR$(13):NEXT X
5830 IF LEN(PR$)>150 THEN R=99:PRINTPR$::PRINT LEN(PR$):DCLOSE#1:RETURN
5840 RECORD#1,(P2):PRINT#1,PR$:RECORD#1,(P2)
5850 DCLOSE#1:R=0:RETURN
6049 REM **SAVE ARRAY**
6050 DOPEN#1,"@ee2.sectors1.dat",D(DV),U(U),W
6051 FORX=1TO20:PR$(X)="":FORY=1TO20
6053 A$=STR$(AR%(X,Y,0)):B$=STR$(AR%(X,Y,1))
6054 A$=RIGHT$(A$,1):B$=RIGHT$(B$,1)
6055 PR$(X)=PR$(X)+A$+B$:NEXTY:NEXTX
6057 PRINT"Writing...":FORX=1TO20:PRINT#1,PR$(X):NEXTX:DCLOSE#1
6060 RETURN
6149 REM **SAVE ALL CHANGED SECTORS**
6150 C=0:PR$="":DOPEN#1,"ee2.sectors2.dat",L26,D(DV),U(U)
6155 FOR X=1TO20:FORY=1TO20
6160 IF AR%(X,Y,10)=1 THEN C=C+1:S(C)=((X-1)*20)+Y:PR$(C)="":FORZ=2TO9:PR$(C)=PR$(C)+STR$(AR%(X,Y,Z))+CHR$(13):NEXTZ
6161 NEXTY:NEXTX:IFC=0THEN DCLOSE#1:RETURN:ELSE FORD=1TOC:RECORD#1,(S(D)):PRINT#1,PR$(D):RECORD#1,(S(D)):NEXT D:DCLOSE#1:R=0:RETURN
6198 REM**LOAD ALL SECTORS OWNED BY PLAYER P**
6199 REM**FILLER**
6200 DOPEN#1,"ee2.sectors2.dat",L26,D(DV),U(U)
6205 C=0:FORX=1TO20:FORY=1TO20
6220 IF AR%(X,Y,1)=P THEN C=C+1:S(C)=((X-1)*20)+Y:XC(C)=X:YC(C)=Y
6221 NEXTY:NEXTX:IF C=0 THEN DCLOSE#1:RETURN
6222 FORD=1 TO C:RECORD#1,(S(D)):INPUT#1,PR$(2),PR$(3),PR$(4),PR$(5),PR$(6),PR$(7),PR$(8),PR$(9):RECORD#1,(S(D)):FORZ=2TO9:AR%(XC(D),YC(D),Z)=VAL(PR$(Z))
6223 NEXTZ:AR%(XC(D),YC(D),10)=1:NEXTD:DCLOSE#1:RETURN
6999 REM **LOAD FILE P$, THEN PRINT**
7000 DOPEN#1,(P$),D(DV),U(U):IF DS<>0 THEN R=99:DCLOSE#1:DCLEAR:RETURN
7020 GET#1,A$(0),A$(1),A$(2),A$(3),A$(4),A$(5),A$(6),A$(7),A$(8),A$(9),A$(10),A$(11),A$(12),A$(13),A$(14),A$(15),A$(16),A$(17),A$(18),A$(19),A$(20),A$(21)
7025 FOR X=0 TO 21:PRINT A$(X);:NEXTX
7027 IF ST<>0 THEN 7030:ELSE 7020
7030 DCLOSE#1
7032 PRINT R$" ";:FORX=P1 TO P3
7049 REM **STRIP:RETURNS A STRIPPED STR$ VALUE FOR P IN R$**
7050 P$=STR$(P):R$=RIGHT$(P$,(LEN(P$)-1)):RETURN
7099 REM ** FIND LAST PLAYER **
7100 DCLOSE#1:DOPEN#1,"ee2.empires.dat",L150,D(DV),U(U)
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
7305 ON (AR%(X,Y,0)+1) GOSUB 7310,7315,7320,7325,7330,7335,7340,7345,7350,7355
7307 NEXTX:PRINT:NEXTY:PRINT:RETURN
7310 PRINT "{gray}. ";:RETURN
7315 PRINT "{light blue}s ";:RETURN
7320 PRINT "{white}m ";:RETURN
7325 PRINT "{white}f ";:RETURN
7330 PRINT "{white}x ";:RETURN
7335 PRINT "{white}f ";:RETURN
7340 PRINT "{white}e ";:RETURN
7345 PRINT "{white}a ";:RETURN
7350 PRINT "{white}t ";:RETURN
7355 PRINT "{red}* ";:RETURN
7499 REM ** BOMB/MISSLE DAMAGE 1=CONV. 2=NUKE 3=CHEM **
7500 TP=P:P=XA:P2=YA:GOSUB7700
7502 PR$(2)="":PR$(3)=""
7505 IF TP=1 THEN BEGIN
7510 DM=(10*RND(10))+10
7520 AR%(XA,YA,2)=AR%(XA,YA,2)-(DM*2):IFAR%(XA,YA,2)<0 THEN AR%(XA,YA,2)=0
7525 AR%(XA,YA,3)=AR%(XA,YA,3)-DM:IFAR%(XA,YA,3)<0 THEN AR%(XA,YA,3)=0
7530 AR%(XA,YA,4)=AR%(XA,YA,4)-DM:IFAR%(XA,YA,4)<0 THEN AR%(XA,YA,4)=0
7540 BEND
7550 IF TP=2 THEN AR%(XA,YA,0)=9:AR%(XA,YA,1)=0
7570 IF TP=3 THEN AR%(XA,YA,3)=0:AR%(XA,YA,4)=INT((AR%(XA,YA,4))/2)
7580 IF B=1 THEN X$="conventional":ELSE IF B=2 THEN X$="nuclear":ELSE X$="chemical"
7582 P=XA:GOSUB7050:Y$=R$:P=YA:GOSUB7050:Y$=Y$+","+R$
7585 P=0:PR$(1)=DT$+":Satellites report that "+X$+" devices were used on sector "+Y$+"."
7587 GOSUB 7650:RETURN
7599 REM **CENTER R$ AND PRINT IT*****
7600 X=40-(LEN(R$)/2):PRINTSPC(X)R$:RETURN
7649 REM **ADD LINES PR$(1-3) TO FILE P$******
7650 FL=P:GOSUB7050:FI$="ee2."+R$+".news":IF FL=0 THEN FI$="ee2.news"
7653 APPEND#1,(FI$),D(DV),U(U):FORX=1TO3:IFPR$(X)<>""THEN PR$(X)=Q$+PR$(X):PRINT#1,PR$(X)
7654 NEXT X
7655 FORX=1TO3:PR$(X)="":NEXTX:DCLOSE#1:RETURN
7699 REM ** LOAD SINGLE SECTOR P=X, P2=Y **
7700 IF P<1 OR P>20 OR P2<1 OR P2>20 THEN R=99:RETURN
7705 X=P:Y=P2:DOPEN#1,"ee2.sectors2.dat",L26,D(DV),U(U):S=((X-1)*20)+Y:RECORD#1,(S):INPUT#1,PR$(2),PR$(3),PR$(4),PR$(5),PR$(6),PR$(7),PR$(8),PR$(9):RECORD#1,(S)
7710 FORZ=2TO9:AR%(X,Y,Z)=VAL(PR$(Z)):NEXTZ:AR%(X,Y,10)=1:DCLOSE#1:RETURN
7799 REM ** TAB ROUTINE**
7800 PRINT A$;SPC(40-POS(1));B$:RETURN
8999 END
