!--------------------------------------------------
!- Saturday, May 20, 2017 1:36:20 AM
!- Import of : 
!- c:\src\zelch128\extras\gam.trip.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
5 DIM IN$(20)
10 PRINT"{clear}":A$(1)="{blue}Voyage To Atlantis ":A$(2)="{light blue}By ":A$(3)="{light blue}Greg Hassett "
11 A$(4)="{down}{cyan}Converted to Pet by John O'Hare"
12 FORI=1TO4:PRINTTAB(20-(LEN(A$(I))/2));A$(I):NEXT
13 NW$="There is no writing there."
14 CO$="The clam flies open and something falls"+CHR$(13)+"out, but it snaps shut again!!!"
15 LM$="I know not how to load such a thing."
16 SH$="and eats me up!!!  {reverse on}I'm dead.{reverse off}"
19 SC$="the spear then turns to platinum!!!":PS$=">>>platinum spear<<<"
20 M0$="I don't see it here.":M1$="I'm not holding it.":M2$=" won't let me."
21 M3$="Don't be ridiculous.":M5$="Don't be funny.":M6$="okay."
22 D1$="I don't know what "+CHR$(34):D2$=CHR$(34)+" is."
23 D O$="Please supply a direct object."
24 NA$="{down*4}{right*7}{green}{reverse on}Help! No air!!! Croak.{reverse off}"
25 SV$="The spear vanished in midwater!"
26 OH$="The spear plunges into the octopus'"+CHR$(13)+"heart and then vanishes along"
27 OH$=OH$+" with the  octopus!!!!"
28 MH$="The spear hits the minotaur,"+CHR$(13)+"and he vanishes!!!":GOTO1720
29 GOSUB170
30 GOSUB70:IFNO<9ANDNO<>0AND(VB=0ORVB=1ORVB=27)THENVB=1
40 IF(VB-15)*(VB-16)*(VB-5)*(VB-6)*(LEN(N1$)>0)*(NO=0)THENPRINTD1$;N1$;D2$:GOTO30
50 IFN1$=""AND(VB>8ORVB=2)ANDVB<>22ANDVB<>15ANDVB<>30THENPRINTDO$:GOTO30
60 GOTO350
70 T=T+1:INPUT"{down*2}{pink}---> What should I do";CM$:PRINT"{white}"
75 IFCM$="{sh space}"THENPRINT"{up*2}":GOTO70
80 VB$="":NO$="":VB=0:NO=0
90 LC=LEN(CM$):FORI=1TOLC:A$=MID$(CM$,I,1):IFA$<>" "THENVB$=VB$+A$:NEXTI
100 IFLEN(VB$)+1>LEN(CM$)THENNO=0:GOTO120
110 NO$=RIGHT$(CM$,LC-I)
120 N1$=NO$:V1$=VB$:VB$=LEFT$(VB$,3):NO$=LEFT$(NO$,3)
121 FORI=1TONV:IFVB$=VB$(I)THENVB=I:GOTO150
122 NEXTI:VB=0
130 IFN1$=""THENNO$=VB$
140 VB=0:GOTO160
150 IFVB$=CM$THENNO=0:NO$="":RETURN
160 FORI=1TONN:IFNO$=NO$(I)THENNO=I:RETURN
161 NEXTI:NO=0:NO$="":RETURN
170 PRINT"{clear}":II=0:IFLEFT$(P$(CP),1)="*"THENP$=RIGHT$(P$(CP),LEN(P$(CP))-1):II=1
180 IFCP=29THENF1=1:GOTO190
182 IFCP=31THENF2=1
190 IFCP=51THENF4=1:GOTO200
195 IFCP=6THENF3=1
197 IFII=1THEN210
200 P$="{cyan}I'm in "+P$(CP)
210 IFCP-1ANDOB(31,0)<>-1THENPRINT"{clear}";NA$:FORI=1TO1000:NEXTI:GOTO1480
220 PRINTP$".":K=0:FORI=1TOLO:IFOB(I,0)<>CPTHEN260
230 IFK=0THENPRINT"{down}{yellow}Visible items:{white} ";
240 IF3+POS(0)+LEN(OB$(I))>39THENPRINT
250 PRINTOB$(I)".  ";:K=K+1
260 NEXTI:IFK>0THENPRINT
270 IFCP=31THENPRINT"{light green}{sh asterisk*39}":RETURN
280 K=0:PRINT"{down}{yellow}Obvious exits are: {white}";:FORI=0TO3:IFP(CP,I)=0THEN310
285 IF2+POS(0)+LEN(D$(I))>39THENPRINT:PRINTTAB(19);:GOTO300
290 IFK>0THENPRINT", ";
300 PRINTD$(I);:K=K+1
310 NEXTI:PRINT".":IFZZ<2ORCP<>5THEN340
320 FORI=1TOLO:IFOB(I,0)=-1ANDI<>31THENOB(I,0)=29
330 NEXTI:PRINT"The whirlpool sucked all my belongings down!!!":ZZ=1
340 PRINT"{sh asterisk*39}":RETURN
350 IFVB=0THEN360
353 ONVBGOTO370,440,29,560,600,660,710,730,740,800,810,930,940,1040,1050,1070
355 ONVB-16GOTO1480,1080,1120,1190,1210,2200,1270,1310,1350,440,370,1380,1410,1440
360 PRINT"I never learned how to ";CHR$(34);V1$;CHR$(34);" something":GOTO30
370 IFNO=0THENPRINT"I need a direction.":GOTO30
380 IFNO>8THEN1270
390 IFNO>4THENNO=NO-4
400 NO=NO-1:IFP(CP,NO)=0THENPRINT"There is no way to go in that direction.":GOTO30
410 IFCP=30ANDGF=0THENPRINT"The gate is locked.":GOTO30
420 IFCP=25ANDNO=0ANDGF=0THENPRINT"There's a gate that bars my way.":PRINT"It's locked.":GOTO30
430 REM PRINT"okay, I went"D$(NO)".":CP=P(CP,NO):GOTO29
431 CP=P(CP,NO):GOTO29
440 IFCP<>OB(NO,0)THENPRINTM0$:GOTO30
450 IFNO=10ORNO=13ORNO=14ORNO=16ORNO=18ORNO=22ORNO=36ORNO=42THENPRINTM5$:GOTO30
460 IFNO=27ORNO=29THENPRINT"It's too heavy.":GOTO30
470 IFNO=17ANDOB(16,0)=CPTHENPRINT"manta";M2$:GOTO30
480 IFNO=19ANDOB(18,0)=CPTHENPRINT"squid";M2$:GOTO30
490 IFNO=35ANDOB(36,0)=CPTHENPRINT"octopus";M2$:GOTO30
500 IFOB(10,0)=CPTHENPRINT"eel";M2$:GOTO30
510 IFO=44ANDOB(42,0)=CPTHENPRINT"minotaur";M2$:GOTO30
520 IFNO=32THENPRINT"It is beyond my reach.":GOTO30
530 IFZZ+1>7THENPRINT"I'm carrying too much.":GOTO30
540 IFOB(NO,1)>0ANDCP=1THENTS=TS-1
550 ZZ=ZZ+1:OB(NO,0)=-1:PRINTM6$:GOTO30
560 IFZZ=0THENPRINT"I'm not carrying anything.":GOTO30
565 PRINT"{yellow}Currently I'm carrying:{white} ";:FORI=1TOLO:IFOB(I,0)<>-1THEN590
570 IF3+POS(0)+LEN(OB$(I))>39THENPRINT
580 PRINTOB$(I)",  ";
590 NEXTI:PRINT:GOTO30
600 REM
610 PRINT"{clear}":PRINT"saving..."
620 A$="":OPEN1,1,1:FORI=1TOLO:PRINT#1,OB(I,0):NEXTI
630 PRINT#1,CP:PRINT#1,GF:PRINT#1,ZZ:PRINT#1,F1:PRINT#1,F2:PRINT#1,F3:PRINT#1,F4:PRINT#1,T:PRINT#1,OB(34,1)
635 PRINT#1,OB(37,1):PRINT#1,NO$(22):PRINT#1,OB$(34):PRINT#1,OB$(37)
640 REM
650 GOTO 30
660 REM
670 PRINT"{clear}":PRINT"restoring.....":FORI=1TOLO:INPUT#1,OB(I,0):NEXTI
680 INPUT#1,CP,GF,ZZ,F1,F2,F3,F4,T,OB(34,1),OB(37,1),NO$(22),OB$(34),OB$(37)
690 REM
700 GOTO 30
710 SC=0:FORI=1TOLO:IFOB(I,0)=1THENSC=SC+OB(I,1)
720 NEXTI:PRINT"{pink}You have"SC"points out of a maximum of"
721 PRINT"170. plus, you can get a bonus up to 30 points when you quit, making";
722 PRINT" the actual":PRINT"maximum 200.":GOTO30
730 GOTO1480
740 IFOB(NO,0)<>-1THENPRINTM1$:GOTO30
750 IFNO<>34THENPRINT"Sorry, I can only throw the spear.":GOTO30
760 IFOB(9,0)<>-1OR(OB(36,0)-CPANDCP-OB(42,0))THENPRINTSV$:ZZ=ZZ-1:OB(34,0)=0:GOTO30
770 IFCP-4THEN790
780 PRINTOH$:OB(36,0)=0:OB(34,0)=51:ZZ=ZZ-1:GOTO30
790 PRINTMH$:OB(42,0)=0:PRINTSC$:OB$(34)=PS$:OB(34,1)=11:OB(34,0)=CP:ZZ=ZZ-1:GOTO30
800 PRINT"You'll have to be more specific.":GOTO30
810 IFOB(NO,0)<>-1ANDOB(NO,0)<>CPTHENPRINTM0$:GOTO30
820 IF(NO-43)*(NO-11)*(NO-12)*(NO-17)*(NO-21)*(NO-28)*(NO-32)*(NO-38)THENPRINTNW$:GOTO30
830 PRINT"{yellow}It says:{white}"
840 IFNO=11THENPRINT"What is thought to be, isn't what you see! nori"
850 IFNO=12THENPRINT"Captain Ahab was here."
860 IFNO=17THENPRINTR1$:PRINTR2$:PRINT"Scrape iron. nori"
870 IFNO=21THENPRINT"Lee said pow and died."
880 IFNO=28THENPRINT"Use crust toothpaste for sharper teeth. (snap!)"
885 IFNO=28THENPRINT"Squids hate loud noises (w o p t o n)"
890 IFNO=32THENPRINT"Bring >>>treasures<<< here & drop them. Say score."
900 IFNO=43THENPRINT"Beware the fierce minotaur! Minos was an evil king!!"
910 IFNO=38THENPRINT"Put shot in gun."
920 GOTO30
930 PRINT"Use compass points, please.":GOTO30
940 IF(NO-40)*(NO-35)*(NO-14)THENPRINT"I don't know how to open such a thing.":GOTO30
950 IFNO=40THENPRINT"Try:  unlock gate.":GOTO30
960 IFNO<>35THEN1010
970 IFOB(26,0)<>-1THENPRINT"You don't have the necessary resources.":GOTO30
980 IFOB(36,0)=CPTHENPRINT"octopus"M2$:GOTO30
990 IFOB(38,0)<>0THENPRINT"Ok. It's empty.":GOTO30
1000 PRINT"Ok. Two things fall out!":OB(38,0)=CP:OB(39,0)=CP:GOTO30
1010 IFOB(33,0)<>-1THENPRINT"You don't have the right tools!":GOTO30
1020 IFOB(37,0)<>0THENPRINT"The clam opens and shuts. It's empty.":GOTO30
1030 PRINTCO$:OB(37,0)=CP:GOTO30
1040 PRINT"I'm not the destructive type myself...":GOTO30
1050 IFOB(18,0)<>CPTHENPRINT"Nothing happened.":GOTO30
1060 PRINT"The squid was so startled he ran away!!!":OB(18,0)=0:GOTO30
1070 PRINT"Okay..."N1$:GOTO30
1080 IFNO<>29THENPRINTLM$:PRINT"Say restore to start up a saved game.":GOTO30
1090 IFCP<>12THENPRINTM0$:GOTO30
1100 IFOB(20,0)<>-1THENPRINT"I have nothing to load it with!!":GOTO30
1110 PRINT"ok.":OB(20,0)=-2:ZZ=ZZ-1:GOTO30
1120 IF(NO-10)*(NO-14)*(NO-16)*(NO-18)*(NO-22)*(NO-23)*(NO-36)THENPRINTM3$:GOTO30
1130 IF(NO-22)*(NO-16)THENPRINT"It's not hungry.":GOTO30
1140 IFNO=16THEN1170
1150 IFOB(30,0)<>-1THENPRINT"I have no food!!!":GOTO30
1160 PRINT"The paranahs gulp down the cup and......";
1162 PRINT"much to their suprise...their teeth fall";
1165 PRINT"out!!! They are now rendered helpless."
1167 OB(22,0)=0:OB(23,0)=CP:NO$(22)="'":OB(30,0)=0:ZZ=ZZ-1:OB(24,0)=CP:GOTO30
1170 IFOB(23,0)<>-1THENPRINT"He likes the  idea...";SH$:FORI=1TO1500:NEXTI:GOTO1480
1180 PRINT"The manta swallows up the paranhas and  swims away."
1185 ZZ=ZZ-1:OB(16,0)=0:OB(23,0)=0:GOTO30
1190 IFOB(25,0)<>-1THENPRINT"I have no scissors.":GOTO30
1200 PRINT"The scissors are too dull to cut anything.":GOTO30
1210 IF(NO-40)*(NO-35)THENPRINT"How?":GOTO30
1220 IFNO=35THENPRINT"Try:  open.":GOTO30
1230 IF(CP-25)*(CP-30)THENPRINTM0$:GOTO30
1240 IFGF=1THENPRINT"It is already open!!!":GOTO30
1250 IFOB(26,0)<>-1THENPRINT"You don't have the key.":GOTO30
1260 PRINTM6$:GF=1:GOTO30
1270 IFNO<>27THENPRINT"How?":GOTO30
1280 IFCP<>9ANDCP<>31THENPRINTM0$:GOTO30
1290 IFCP=9THENCP=31:GOTO1300
1295 CP=9
1300 GOTO29
1310 IFNO<>29THENPRINT"How?":GOTO30
1320 IFCP<>12THENPRINTM0$:GOTO30
1330 IFOB(20,0)<>-2THENPRINT"It's not loaded.":GOTO30
1340 PRINTM6$;"..pow!!!!":OB(20,0)=29:OB(10,0)=0:GOTO30
1350 IFNO<>30THENPRINT"Come now...be serious.":GOTO30
1360 IFOB(30,0)<>-1THENPRINTM1$:GOTO30
1370 PRINT"Smak! Good!":ZZ=ZZ-1:OB(30,0)=0:GOTO30
1380 IFOB(NO,0)<>-1THENPRINTM1$:GOTO30
1390 ZZ=ZZ-1:PRINTM6$:OB(NO,0)=CP:IFCP=1ANDOB(NO,1)>0THENTS=TS+1
1400 GOTO30
1410 IFOB(NO,0)<>-1ANDOB(NO,0)<>CPTHENPRINTM0$:GOTO30
1420 IFNO<>37THENPRINTM6$" nothing happened.":GOTO30
1430 PRINT"Wait a minute...this statuette isn't"
1432 PRINT"iron...it's gold!!":OB$(37)=">>>a gold statuette<<<":OB(37,1)=16:GOTO30
1440 IFCP<>31THENPRINT"Gee! Fun!":GOTO30
1450 X=INT(RND(1)*4)+1:IFX=2THEN1470
1460 CP=9:GOTO29
1470 PRINT"Whoooooooa...Thud. I'm dead.":FORI=1TO1000:NEXTI:GOTO1480
1480 PRINT"{clear}":GOSUB1670:FORI=1TOLO:IFABS(OB(I,0))=1THENFS=FS+OB(I,1)
1490 NEXTI:IFT<500THENFS=FS+5
1500 IFT<400THENFS=FS+5
1510 IFT<310THENFS=FS+10
1515 IFFS>200THENFS=200
1520 PRINT"{pink}You scored"FS"points out of 200."
1525 IFFS=0THENPRINT"You are a pee wee class adventurer (the lowest rank)":GOTO1610
1530 IFFS<30THENPRINT"Are you vegetable or mineral? rank 8":GOTO1610
1540 IFFS<50THENPRINT"Not too good, pal! rank 7":GOTO1610
1550 IFFS<90THENPRINT"You have had a taste of adventure.      ---rank 6":GOTO1610
1560 IFFS<110THENPRINT"You are a master adventurer class c     ---rank 5":GOTO1610
1570 IFFS<150THENPRINT"You are a master adventurer class b     ---rank 4":GOTO1610
1580 IFFS<170THENPRINT"You are a master adventurer class a     ---rank 3":GOTO1610
1590 IFFS<190THENPRINT"Wowee! You are great! You'll soon be an"
1595 IFFS<190THENPRINT"adventurer grandmaster! One rank away...---rank 2":GOTO1610
1600 IFFS<201THENPRINT"Tum tum-tum tum...tum te tum te dum de"
1605 IFFS<201THENPRINT"tum...a real adventurer grandmaster..."
1607 IFFS<201THENPRINT"Boy oh boy! Can I shake your hand???"
1608 IFFS<201THENPRINT"You should:":PRINTR1$:PRINTR2$:PRINT:PRINT
1610 PRINT:END
1620 REM
1630 REM
1640 PRINTA$:IFA$="y"THENRUN
1650 PRINTR1$:PRINTR2$:END
1660 PRINT"{clear}":END
1670 IFF1THENFS=FS+2
1680 IFF2THENFS=FS+2
1690 IFF3THENFS=FS+2
1700 IFF4THENFS=FS+4
1710 RETURN
1720 CP=1:NP=51:LO=44:NN=44:NV=30:DIMP$(NP),P(NP,3),OB(LO,1),OB$(LO),NO$(NN)
1725 DIM VB$(NV):FORI=1TO31:FORJ=0TO3:READP(I,J):NEXTJ:NEXTI
1730 A$="{white}New improved version !! ":PRINT:PRINTTAB(21-(LEN(A$)/2));:FORI=1TOLEN(A$)
1735 PRINTMID$(A$,I,1);:X=SQR(9999):NEXTI
1740 P$(1)="my submarine docked in the city{f7} of Atlantis"
1742 P$(2)="a corridor filled with water"
1744 P$(3)="an alcove"
1746 P$(4)="a coral reef"
1748 DATA 0,0,2,0,8,0,3,1,9,0,4,2,10,0,5,3
1750 P$(5)="a whirlpool"
1752 P$(6)="the hall of spirits (more"+CHR$(13)+"commonly called a graveyard)"
1754 P$(7)="*{cyan}Dead end"
1756 P$(8)="a dining room"
1758 DATA 11,0,0,4,13,0,7,0,0,8,0,0,7,2,9,0
1760 P$(9)="*{cyan}I'm on the street"
1762 P$(10)="*{cyan}I'm at the end of the street"
1764 P$(11)="a dark cave"
1766 P$(12)="the fortress of Atlantis"
1768 DATA 15,3,10,8,0,4,11,9,0,5,12,10,0,0,0,11
1770 P$(13)="captain Ahab's quarters"
1772 P$(14)="a barren chamber"
1774 P$(15)="a barber shop"
1776 P$(16)="an olympic field"
1778 DATA 16,6,0,0,17,0,15,0,0,9,0,14,22,13,17,0
1780 P$(17)="a supply room"
1782 P$(18)="the squid's chamber"
1784 P$(19)="the drawing room"
1786 P$(20)="the royal colliseum"
1788 DATA 23,14,18,16,24,0,19,17,25,0,20,18,0,0,21,19
1789 P$(21)="a temple"
1792 P$(22)="a hallway"
1794 P$(23)="an old library"
1796 P$(24)="the clam room. the walls are made of clamshell"
1798 DATA 26,0,0,20,27,16,0,0,0,17,24,0,29,18,0,23
1800 P$(25)="a rail station (so >this< is how they got around!)"
1802 P$(26)=P$(24)
1804 P$(24)="the town hall"
1806 P$(27)="the kitchen"
1808 P$(28)="the dining hall"
1809 DATA 30,19,0,0,0,21,0,0,0,22,28,0,0,0,0,27
1810 P$(29)="the electric eel's room"
1812 P$(30)="the jail. There is a gate to the south"
1814 P$(31)="at the top of a post. Looking"+CHR$(13)+"down I see only the street. The"
1815 P$(31)=P$(31)+" water is too misty to see far away"
1816 DATA 0,0,30,0,0,25,0,0,0,0,0,0
1818 REM
1820 DATA N,S,E,W,NOR,SOU,EAS,WES,THR,EEL,BOO,PAP,TRA,CLA,MED,MAN,PLA,SQU,COI
1822 DATA SHO,JOU,PAR,PAR,TEE,SCI,KEY,POS,NEW,CAN,CUP,TAN,SIG,PIC,SPE,CHE,OCT
1824 DATA STA,NOT,PEA,GAT,GO,GET,LOO,INV,"{ct c}","{ct c}",SCO,QUI,THR,KIL,REA,ENT,OPE
1826 DATA HIT,YEL,SAY,[,LOA,FEE,CUT,UNL,HEL,CLI,FIR,EAT
1828 REM
1830 FORI=1TO40:READNO$(I):NEXTI:FORI=1TONV:READVB$(I):NEXTI:DATA TAK,SWI,DRO
1832 DATA SCR,JUM
1834 REM
1836 REM
1838 REM
1840 DATAA SPEAR THROWER,AN ELECTRIC EEL,A SMALL BOOK,A PAPER WITH WRITING ON IT
1842 DATA A,A GIANT CLAM,>>>A JADE MEDALIAN<<<,A BLACK MANTA
1844 DATA>>>A PLATINUM PLAQUE<<<,A GIANT SQUID,>>>MANY COINS<<<,AN IRON SHOTPUT
1846 DATA CAPTAIN AHAB'S JOURNAL
1848 REM
1850 DATA SOME FIERCE PARANHAS,SOME HELPLESS PARAHNAS
1852 DATA >>>SOME VALUABLE PARANAH TEETH<<<,>>>A PAIR OF GOLD SCISSORS<<<
1854 DATA >>>A SILVER KEY<<<,A TALL POST,AN OLD NEWSPAPER,AN OLD CANNON
1856 DATA A PEANUT BUTTER CUP,AN AIR TANK,A SIGN,>>>A PLATINUM PICK<<<
1858 DATA A STEEL SPEAR
1860 DATA A TREASURE CHEST,A FIERCE OCTOPUS,AN IRON STATUETTE,A NOTE
1862 DATA >>>A GLISTENING PEARL<<<
1864 DATA 27,0,29,0,23,0,24,0,0,0,26,0,20,10,19,0,19,15,18,00,18,20,16,0,13,0
1866 DATA 14,0,0,0,0,15,15,5,8,5,9,0,11,0,12,0,1,0,1,0,1,0,3,7,3,0,4,0,4
1868 DATA 0,0,0,0,0,00,12
1870 FORI=9TO39:READOB$(I):NEXTI:FORI=9TO39:READOB(I,0),OB(I,1):NEXTI
1872 REM
1874 REM
1876 REM
1878 REM
1880 D$(0)="north":D$(1)="south":D$(2)="east":D$(3)="west"
1890 REM
1900 P$(32)="the pillars of Hercules"
1902 P(26,0)=32:DATA 0,26,0,33
1904 :
1906 :
1908 :
1910 P$(33)="Prometheus' chamber in Olympia"
1912 P$(34)="a strange room with walls that seem to come alive as I move about"
1914 P$(35)="*{cyan}I'm on the edge of a cliff. The water below me is too misty to"
1916 P$(35)=P$(35)+" see far down.  There might be life down there..."
1918 :
1920 P$(36)="a deep, dark, corrodor. I can seeno ceiling from here, only murky"
1922 P$(36)=P$(36)+" water. The water seems to be moving east of me."
1924 DATA 0,34,32,0,33,36,37,35,0,0,34,0,34,0,5,0
1926 :
1928 :
1930 P$(37)="the hall of mirrors. All directions look the same"
1932 P$(38)=P$(37):P$(39)=P$(37)
1934 P$(40)="an awkward corrodor"
1936 DATA 37,38,39,34,37,38,38,38,40,39,39,37,42,39,0,0
1938 :
1940 FORI=41TO50:P$(I)="a labyrinth of passages obviously designed by king"
1942 P$(I)=P$(I)+CHR$(13)+"Minos.  It is rumoured that the minotaur is near...":NEXTI
1944 DATA 43,41,42,41,44,40,42,41,47,41,43,43,48,42,45,44,49,45,45,44,50,51,0,0
1946 DATA 47,43,48,47,48,44,48,47,0,45,50,0,0,46,0,49
1948 :
1950 P$(51)="*{cyan}Dead end":DATA 46,0,0,0
1960 FORI=32TONP:FORJ=0TO3:READP(I,J):NEXTJ:NEXTI
1970 FORI=41TONN:READNO$(I),OB$(I),OB(I,0),OB(I,1):NEXTI
1980 DATA APP,>>>A GOLDEN APPLE<<<,33,10,MIN,A FIERCE MINOTAUR,51,0
1982 DATA SCR,AN ANCIENT SCROLL,40,0,FLE,>>>A GOLDEN FLEECE<<<,51,44
1990 R1$="Try some other adventures by Greg"+CHR$(13)+"Hassett! They are:"+CHR$(13)
1992 R1$=R1$+"-Journey to the center of the earth"+CHR$(13)+"-The house of seven"
1994 R1$=R1$+" gables"+CHR$(13)+"-Entry into king Tut's tomb"+CHR$(13)+"-Sorc"
1996 R1$=R1$+"erer's castle"+CHR$(13)+"-Enchanted island"
1997 R2$="The above available for Trs-80 & Apple."+CHR$(13)
1998 R2$=R2$+"also available for Pet from John O'Hare."
2000 FORI=1TO17:READIN$(I):NEXT
2010 GOSUB2020:GOTO29
2020 PRINT"{clear}";
2030 DATA "{yellow}***{pink}Adventure version 6.5{yellow}***","*","{pink}-By Greg Hassett-
2035 DATA "{yellow}***************"
2040 DATA,,"{green}Welcome to the wonderful world","{light green}of","{white}Adventure
2042 DATA "{yellow}{cm @*9}","{up}{cm p*9}","{up}{cm i*9}","{up}{sh asterisk*9}","{up}{cm u*9}"
2043 DATA "{up}{cm y*9}","{up}{cm t*9}","{up}         "
2045 FORI=1TO17:PRINTTAB(20-(LEN(IN$(I))/2));IN$(I)
2046 IFI>9THENFORD=1TO125:NEXTD
2047 NEXTI
2050 PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT
2060 PRINT"{white}         {reverse on}Hit return to continue{reverse off}";
2065 GETA$:IFA$<>CHR$(13)THEN2065
2067 PRINT:PRINT"{clear}"
2070 Q$=CHR$(34)
2075 PRINT"In this "Q$"adventure"Q$" you are to"
2080 PRINT"explore the lost city of Atlantis in"
2085 PRINT"search of treasures. I will be your eyes"
2090 PRINT"and hands during the adventure. Direct"
2095 PRINT"me with ordinary english sentences of"
2100 PRINT"one or two words. Some examples:"
2105 PRINTQ$"get tank"Q$" , "Q$"inventory"Q$" , "Q$"kill manta"Q$
2130 PRINT
2140 PRINT"Use any noun/verb combination you can"
2145 PRINT"think of, because in this game, "
2150 PRINT"*anything* goes! If this adventure is"
2155 PRINT"taking a long time to solve, don't"
2160 PRINT"fret. It was designed to do so. To end"
2165 PRINT"a game, type "Q$"quit"Q$"!"
2170 PRINT
2175 PRINT
2180 PRINT"Press the space bar to begin...";
2190 GETA$:IFA$<>" "THEN2190
2195 return
2200 print"i can only repeat the instructions."
2205 print"would you like that";:input"  y{left}{left}{left}";qq$
2210 ifleft$(qq$,1)="n"thenprint"okay.":goto30
2222 gosub2020:goto2
