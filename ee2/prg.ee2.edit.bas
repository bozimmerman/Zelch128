!--------------------------------------------------
!- Thursday, September 16, 2021 2:56:59 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.ee2.edit.prg
!- Unknown Machine
!--------------------------------------------------
0 TRAP 400:FAST
1 REM *** EMPIRE EDITOR ****************************************
5 CLR:FAST:DIM M$(25):DIM P$(5,10):DIM P(5,26):DIM AR%(21,21,11):DIM PR$(401):DIMA$(31):DIM XC(401):DIM YC(401):DIM S(401)
6 DOPEN#1,"ee2.config,s":INPUT#1,A$,B$,C$:DCLOSE#1:U=VAL(A$):DV=VAL(B$)
7 SP$="{space*60}{sh space*5}"
8 BS$="{left*53}"
9 C$(1)="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz?"
10 C$(3)="1234567890"
11 C$(5)="1234567890,"
12 DIM VL$(26)
90 PRINT"{clear}"
93 R$="{cyan}E{space*3}m{space*3}p{space*3}i{space*3}r{space*3}e{space*6}E{space*3}d{space*3}i{space*3}t{space*3}i{space*3}o{space*3}n{space*6}I{space*3}I":GOSUB7600:PRINT:R$="{white}Game Editor v1.02":GOSUB7600:PRINT
120 PRINT:PRINT"Loading sector map...":GOSUB6030:PRINT"Loading sector data...":GOSUB8010
345 GOTO 500
400 REM ----- MAIN TRAP ROUTINE -----------------------------------------------
410 DCLOSE:IF(PEEK(56577)AND16)<>16ANDPEEK(7513)<>1THENPRINT"{white}{reverse on}{ct o}CARRIER DROPPED":GOTO1050
415 IFPEEK(7273)<1THENPRINT"{white}{ct o}System time limit exceeded!":GOTO1050
420 TRAP400:CLOSE2:PRINT"{white}BASIC error: "ERR$(ER)" @"EL:GOSUB450:GOTO500
450 PRINT"{light gray}Press any key to continue":GETKEYA$:RETURN
500 PRINT:PRINT "{light gray}Empire Command({gray}? for menu{light gray}):{white}";
505 L=20:P=1:P2=1:GOSUB 5000:R$=LEFT$(R$+" ",1)
510 IF R$="?" THEN BEGIN
511 REM -----------------------------
515 PRINT
520 PRINT "{blue}E m p i r e{space*2}E d i t i o n{space*2}I I {light blue}--{space*2}{blue}Sector Manipulation Menu":PRINT
530 PRINT "{space*2}{light gray}E{gray}dit Sector{space*9}{light gray}C{gray}ensus(all seeing, all knowing)
535 PRINT "{space*2}{light gray}M{gray}ap{space*17}{light gray}P{gray}layer edit(still under construction)"
540 PRINT "{space*2}{light gray}Q{gray}uit"
550 GOTO 500
560 REM -----------------------------
570 BEND
580 IF R$="M" THEN BEGIN
590 REM -----------------------------
600 PRINT "{light gray}Upper left corner[{gray}X,Y{light gray}]:{white}";:GOSUB7200:P1=RA:A=RB:PRINT"{light gray}Lower right corner[{gray}X,Y{light gray}]:{white}";:GOSUB7200:P3=RA:P4=RB:P2=A:PRINT
610 IF P3<P1 OR P4<P2 THEN PRINT "{red}Invalid.":GOTO500
613 IF P1=99 OR P2=99 OR P3=99 OR P4=99 THEN PRINT "{red}Invalid.":GOTO500
615 GOSUB 7300
760 REM -------------------------------
770 BEND
1040 IF R$="Q" THEN BEGIN
1045 REM ---------------------------------
1050 P=1:P2=PL:GOSUB 5800
1060 GOSUB6050
1070 GOSUB6150
1075 DOPEN#1,"@ee2.data,s",D0,U8,W:PRINT#1,PA$(1),DT$,DT$:DCLOSE#1
1080 PRINT "done.":END
1085 REM ---------------------------------
1090 BEND
1350 IF R$="C" THEN BEGIN
1360 REM -----------------------------
1380 PRINT "{light gray}Top left corner[{gray}X,Y{light gray}]:{white}";:GOSUB 7200
1390 XA=RA:YA=RB:PRINT "{light gray}Bottom right corner[{gray}X,Y{light gray}]:{white}";:GOSUB7200:XB=RA:YB=RB
1400 IF XA=99 OR YA=99 OR XB=99 OR YB=99 THEN PRINT "{red}Invalid.":GOTO500
1405 FL=0:PRINT "{light gray}Show even blank sectors[{gray}Y,N{light gray}]:{white}";:P=1:P2=1:L=1:GOSUB5000:IFR$="Y" THEN FL=1
1490 PRINT:PRINT "{light blue}[SType] [Effic] [Wrkrs] [Sldrs] [Guns ] [Produ] [PType] [X,Y ] [Player#]"
1495 PRINT "{cyan}-----------------------------------------------------------------------{white}"
1497 MK$(0)="None"
1500 FOR Y=YA TO YB:FOR X=XA TO XB
1505 IF FL=0 AND AR%(X,Y,1)=0 THEN 1540
1512 A$=" "+MID$(".SMFX#EAT*",(AR%(X,Y,0)+1),1)
1520 FORZ=2TO6:P=AR%(X,Y,Z):GOSUB7050:PR$(Z)=R$:NEXTZ:P=X:GOSUB7050:PR$(8)=R$:P=Y:GOSUB7050:PR$(8)=PR$(8)+","+R$
1522 P=AR%(X,Y,1):GOSUB7050:PR$(9)=R$
1524 MK$=MK$(AR%(X,Y,7))
1525 P=AR%(X,Y,0):IF P=2 THEN MK$="Ore":ELSE IF P=3 THEN MK$="Food":ELSE IF P=6 THEN MK$="Energy":ELSE IF P=7 THEN MK$="Planes":ELSEIFP=8THENMK$="Tech"
1527 IF P=9 THEN MK$="(Nuked)":PR$(2)="(Nuked)"
1530 PRINT A$;LEFT$(SP$,(9-POS(1)));PR$(2);LEFT$(SP$,(17-POS(1)));PR$(3);LEFT$(SP$,(25-POS(1)));PR$(4);
1534 PRINT LEFT$(SP$,(33-POS(1)));PR$(5);LEFT$(SP$,(41-POS(1)));PR$(6);LEFT$(SP$,(49-POS(1)));MK$;LEFT$(SP$,(57-POS(1)));PR$(8);LEFT$(SP$,(64-POS(1)));PR$(9)
1540 NEXTX:NEXTY
1545 GOTO 500
1630 BEND
1640 IF R$="E" THEN BEGIN
1645 PRINT "{light gray}Edit which sector[{gray}X,Y{light gray}]:{white}";:GOSUB7200:IFRA=99THENGOTO500
1650 P=RA:GOSUB7050:X$=R$:P=RB:GOSUB7050:Y$=R$:X=RA:Y=RB
1655 PRINT "Sector ";X$;",";Y$;"...":PRINT"...is sectortype";STR$(AR%(X,Y,0))
1660 A=1:B=0:GOSUB8500:PRINT"...is owned by player";STR$(AR%(X,Y,1)):A=1:B=1:GOSUB8500
1665 PRINT "...is";STR$(AR%(X,Y,2));" efficient.":A=3:B=2:GOSUB8500:PRINT"...has";STR$(AR%(X,Y,3));" workers.":A=3:B=3:GOSUB8500
1670 PRINT"...has";STR$(AR%(X,Y,4));" soldiers.":A=3:B=4:GOSUB8500:PRINT "...has";STR$(AR%(X,Y,5));" guns.":A=3:B=5:GOSUB8500
1680 PRINT "...has";STR$(AR%(X,Y,6));" units of production.":A=3:B=6:GOSUB8500
1690 PRINT "...is production type";STR$(AR%(X,Y,7));".":A=1:B=7:GOSUB8500
1700 BEND
1750 IF R$="P" THEN BEGIN
1770 PRINT "{light gray}Edit which player[{gray}1...9{light gray}]:{white}";:P=3:L=1:GOSUB5000:IFVAL(R$)<1 OR VAL(R$)>9 THEN GOTO500
1772 PL=VAL(R$):P=PL:P2=1:GOSUB5700
1775 RESTORE:FORX=1TO25:READ VL$(X):NEXTX
1780 FORX=1TO25:P=X:GOSUB7050:N$=R$:P=P(1,X):GOSUB7050:VL=P(1,X):PRINT "{blue}Value #";N$;"({light blue}";VL$(X);"{blue})[{white}Defualt ";R$;"{blue}]:{white}":GOSUB8600:P(1,X)=VL
1785 NEXTX
1790 P2=PL:P=1:GOSUB5800
1795 GOTO500
1800 BEND
3000 DATA"Money","Food","Energy","Ore","Tech","Unused","Unused","Unused","Planes","Missles"
3005 DATA "Conven. bombs","Nukes","Chemical bombs","Unused","Unused","Unused","Unused","Unused","Unused","Unused"
3010 DATA "Unused","Unused","Unused","Unused","Unused"
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
5705 DOPEN#1,"ee2.empires.dat",L150
5710 RECORD#1,(P):FOR X=1 TO 5:INPUT#1,P$(P2,X):NEXTX:FORX=1TO20:INPUT#1,A$:P(P2,X)=VAL(A$):NEXTX:RECORD#1,(P)
5730 DCLOSE#1:RETURN
5799 REM **SAVE PLAYER FROM P$(P,##) AND P(P,##) INTO P2 SLOT**
5800 IF P<1 OR P>20 OR P2>20 OR P2<1 THEN R=99:RETURN
5810 PR$="":DOPEN#1,"ee2.empires.dat",L150
5820 FOR X=1 TO 5:PR$=PR$+P$(P,X)+CHR$(13):NEXTX
5825 FOR X=1 TO 20:PR$=PR$+STR$(P(P,X))+CHR$(13):NEXT X
5830 IF LEN(PR$)>150 THEN R=99:PRINTPR$::PRINT LEN(PR$):DCLOSE#1:RETURN
5840 RECORD#1,(P2):PRINT#1,PR$:RECORD#1,(P2)
5850 DCLOSE#1:R=0:RETURN
5999 REM **SEARCH FOR PLAYER NAME P$, RETURN PLAYER # IN R**
6000 DOPEN#1,"ee2.empires.dat",L150,D(DV),U(U):C=0
6010 R=99:FOR X=1 TO 9:RECORD#1,(X):INPUT#1,X$:RECORD#1,(X):IF X$=P$ THENR=X:DCLOSE#1:RETURN
6020 NEXT X:DCLOSE#1
6024 RETURN
6025 REM **LOAD 40X40 ARRAY**
6030 DOPEN#1,"ee2.sectors1.dat,s",D(DV),U(U),R
6035 INPUT#1,A$(1),A$(2),A$(3),A$(4),A$(5),A$(6),A$(7),A$(8),A$(9),A$(10),A$(11),A$(12),A$(13),A$(14),A$(15),A$(16),A$(17),A$(18),A$(19),A$(20)
6036 DCLOSE#1
6037 FORX=1TO20:Z=1:FORY=1TO20:AR%(X,Y,0)=VAL(MID$(A$(X),Z,1)):AR%(X,Y,1)=VAL(MID$(A$(X),(Z+1),1)):Z=Z+2:NEXTY:NEXTX
6040 DCLOSE#1
6042 RETURN
6049 REM **SAVE ARRAY**
6050 DOPEN#1,"@ee2.sectors1.dat,s",D(DV),U(U),W
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
7000 R=0:DOPEN#1,(P$),D(DV),U(U),R:IF DS<>0 THEN R=99:DCLOSE#1:DCLEAR:RETURN
7020 INPUT#1,A$:IF ST<>0 AND ST<>64 THEN PRINT "{red}File Error...":DCLOSE#1:RETURN
7023 PRINT A$
7025 IF ST=0 THEN GOTO 7020
7027 PRINT "{green}End of file.":DCLOSE#1:RETURN
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
7307 NEXTX:PRINT:NEXTY:RETURN
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
7599 REM **CENTER R$ AND PRINT IT*****
7600 X=40-(LEN(R$)/2):PRINT LEFT$(SP$,X)+R$:RETURN
7649 REM **ADD LINES P$(1-3) TO FILE P$******
7650 A=P:GOSUB7050:FI$="ee2."+R$+".news,s":IF A=0 THEN FI$="ee2.news,s"
7653 APPEND#1,(FI$),D(DV),U(U):FORX=1TO3:IFPR$(X)<>""THEN PR$(X)=CHR$(34)+PR$(X):PRINT#1,PR$(X)
7654 PR$(X)="":NEXTX:DCLOSE#1:RETURN
7699 REM ** LOAD SINGLE SECTOR P=X, P2=Y **
7700 IF P<1 OR P>20 OR P2<1 OR P2>20 THEN R=99:RETURN
7705 X=P:Y=P2:DOPEN#1,"ee2.sectors2.dat",L26,D(DV),U(U):S=((X-1)*20)+Y:RECORD#1,(S):INPUT#1,PR$(2),PR$(3),PR$(4),PR$(5),PR$(6),PR$(7),PR$(8),PR$(9):RECORD#1,(S)
7710 FORZ=2TO9:AR%(X,Y,Z)=VAL(PR$(Z)):NEXTZ:AR%(X,Y,10)=1:DCLOSE#1:RETURN
7799 REM ** TAB ROUTINE**
7800 PRINT A$;LEFT$(SP$,(40-POS(1)))+B$:RETURN
7899 REM *** ERROR CATCHER ****
8000 REM **LOAD ALL SECTORS OWNED**
8010 DOPEN#1,"ee2.sectors2.dat",L26,D(DV),U(U):C=0:FORX=1TO20:FORY=1TO20:IFAR%(X,Y,1)>0THENC=C+1:S(C)=((X-1)*20)+Y:XC(C)=X:YC(C)=Y
8020 NEXTY:NEXTX:FOR D=1 TO C:RECORD#1,(S(D)):INPUT#1,PR$(2),PR$(3),PR$(4),PR$(5),PR$(6),PR$(7),PR$(8),PR$(9):RECORD#1,(S(D)):FOR Z=2 TO 9
8030 AR%(XC(D),YC(D),Z)=VAL(PR$(Z)):AR%(XC(D),YC(D),10)=1:NEXTZ:NEXTD:DCLOSE#1:RETURN
8300 A=POS(1):PRINT "{up}";LEFT$(BS$,POS(1));SP$;LEFT$(BS$,POS(1));
8305 RETURN
8500 PRINT "{light gray}Change to[{gray}RETURN for default{light gray}]:{white}";:P=3:L=A:GOSUB5000:IFR$<>"" THENAR%(X,Y,B)=VAL(R$)
8510 RETURN
8600 PRINT "{light gray}Change to[{gray}RETURN for default{light gray}]:{white}";:P=3:L=5:GOSUB5000:IFR$<>""THEN VL=VAL(R$)
8605 IF VL>99999 THEN VL=99999
8610 RETURN
8999 END
9000 DOPEN#1,"ee2.news"
9005 GET#1,A$:PRINTA$;:GOTO9005
