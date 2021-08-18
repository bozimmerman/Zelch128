!--------------------------------------------------
!- Saturday, May 20, 2017 1:35:39 AM
!- Import of : 
!- c:\src\zelch128\extras\gam.sorceror.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
0 SR$="You have no sword to do it with. oh my! The sorcerer has just"
1 GB$="A gold bar falls out!"
2 D1$="Okay. Gulp gulp gulk. Something seems different now..."
3 DI$="You're not holding it, hence it is impossible to drink it."
4 CM$=CHR$(44)
5 X=RND(-TI):X=0
6 NW$(1)="Nice weather we've been having lately."
7 NW$(2)="Hello"
8 QT$=CHR$(34)
9 VT$="The movement of the painting reveals a vault in the wall. The vault is"
10 PRINT"{clear}{down}{pink}       Sorcerer's Castle Adventure":PRINT"{down*3}{yellow}              By Greg Hassett":PRINT"{down*3}{white}     Converted to Pet by John O'Hare"
11 VT$=VT$+" locked."
12 PRINT:GT$(1)="Wheeee!":GT$(2)="Are you enjoying yourself?"
13 SR$=SR$+" killed you!"
14 PRINT"{down*3}{cyan}    To play, supply the computer with":PRINT"    simple verb, noun combinations."
15 PRINT:SK$="The sorcerer died and then vanished. His septor remains."
16 PRINT"{down}{light blue}    Enter "CHR$(34)"quit"CHR$(34)" to quit at any time.":FORI=1TO2000:NEXTI
17 DB$="You must supply a direct object."
18 DEFFNR(Q)=INT(RND(1)*Q)+1
19 CP=49:S1$="I don't see it here.":S2$="Don't be ridiculous.":GOTO1700
20 GOTO1500
30 IFFNR(85)=20THEN1170
40 IFZZ>2ANDFNR(100)=50THEN1240
50 IFFNR(27)=8THEN1330
54 GOTO60
55 A=PEEK(186):OPEN1,A,15,"s0:gam.sorceror":CLOSE1:SAVE"gam.sorceror",A
56 END
60 T=T+1:GOSUB1430:IFVB$="ala"THENIFCP=32THENCP=17:GOTO20
65 IFVB$="ala"THENPRINT"Nothing happened.":GOTO60
70 IFVB=-1AND(NO>21ANDNO<30)THENVB=1
80 IFNO$="jes"THENPRINT"I see no jester here.":GOTO60
90 IFVB$="cro"THENIF(CP=52ORCP=53)THENIFCP=53THENCP=52:GOTO20
95 IF VB$="cro"THENIF(CP=52ORCP=53)THEN20
100 IFVB$="tur"THENPRINT"You have used"T"turns so far.":GOTO60
110 IFVB<>30AND(VB>10ORVB=20ORVB=6)ANDNO$=""THENPRINTDB$:GOTO60
120 IFVB$="hi"THENPRINTNW$(FNR(2)):GOTO60
130 IFNO$="gun"THENNO=1
140 IFVB=30THEN1070
150 IFNO$="bag"THENNO=5
160 IFVB=-1ANDNO<>0AND(NO<22ORNO>29)THENPRINT"You must supply a verb.":GOTO60
170 IFVB<1ANDNO=0THENPRINT"I don't know how to "QT$N1$QT$" anything.":GOTO60
180 IFVB=6AND(NO$="eve"ORNO$="all")THEN200
190 IFNO=0ANDVB>10THENPRINT"I don't know what a "QT$N1$QT$" is.":GOTO60
200 ONVBGOTO210,280,20,350,380,400,460,470,480,490,510,520,550,640,660,740,770
205 ONVB-17GOTO830,840,840,550,920,920,940,950,980,1010,1040,1050,1070
210 IF(NO<22ORNO>29)ANDNO$<>""THENPRINT"I don't know how to do that.":GOTO60
220 IFNO$=""THENPRINT"Where?":GOTO60
230 IFNO>25THENNO=NO-4
240 NO=NO-22:IFP(CP,NO)=0THENPRINT"There is no way to go in that direction.":GOTO60
250 IFCP=1ANDNO=1ANDDF=0THENPRINT"The castle door is locked.":GOTO60
260 IFCP=17ANDNO=1ANDCF=0THENPRINT"The crack is too small for you to follow":GOTO60
270 CP=P(CP,NO):GOTO20
280 IFOB(NO,0)=-1THENPRINT"You've already got it!":GOTO60
290 IFNO=0THENPRINT"Whats a "N1$"?":GOTO60
300 IFOB(NO,0)<>CPTHENPRINTS1$:GOTO60
310 IFNO=17ORNO=21ORNO=20ORNO=16THENPRINTS2$:GOTO60
320 IFZZ+1>7THENPRINT"You are unable to carry any more.":GOTO60
330 IFNO=9ANDPF=0THENPRINTVT$:PF=1:OB(16,0)=CP:OB(9,0)=-1:ZZ=ZZ+1:GOTO60
340 PRINT"okay.":ZZ=ZZ+1:OB(NO,0)=-1:GOTO60
350 IFZZ=0THENPRINT"You are emptyhanded.":GOTO60
360 PRINT"You are holding the following:":FORI=1TOLO:IFOB(I,0)=-1THENPRINTOB$(I)
370 NEXTI:GOTO60
380 J=0:FORI=1TOLO:IFOB(I,0)=1THENJ=J+OB(I,1)
385 NEXTI
390 PRINT"Out of a maximum of 225 points, you have";J;"points.":GOTO60
400 IFNO<>0ANDOB(NO,0)<>-1THENPRINT"You're not carrying it!":GOTO60
410 IFNO$<>"eve"ANDNO$<>"all"THEN440
420 IFZZ=0THENPRINT"You're not carrying anything!":GOTO60
425 FORI=1TOLO:IFOB(I,0)=-1THENOB(I,0)=CP
430 NEXTI:ZZ=0:PRINT"ok.":GOTO60
440 IFNO=0THENPRINT"I've never heard of a "N1$".":GOTO60
450 OB(NO,0)=CP:PRINT"dropped.":ZZ=ZZ-1:GOTO60
460 PRINT"Sorry, this is your adventure, no mine!":GOTO60
470 GOTO20
480 GOTO20
490 GOTO1370
495 PRINT"Alright...":GOTO60
500 GOTO1370
520 IFOB(NO,0)<>-1THENPRINTDI$:GOTO60
530 IFNO<>7THENPRINTS2$:GOTO60
540 PRINTD1$:ZZ=ZZ-1:OB(7,0)=0:CF=1:GOTO60
550 IFNO<>31ANDNO<>16ANDNO<>30THENPRINT"I don't know how to open such a thing.":GOTO60
560 IFNO=16ANDOB(16,0)<>CPTHENPRINT"What vault?":GOTO60
570 IFNO=16ANDOB(2,0)<>-1THENPRINT"You don't have the key.":GOTO60
580 IFNO=16THENPRINT"The vault is open":VF=1:IFOB(15,0)=0THENPRINTGB$:OB(15,0)=CP
590 IFNO=16THEN60
600 IFNO=31THEN1140
610 IFCP<>1THENPRINT"What door?":GOTO60
620 IFOB(2,0)<>-1THENPRINT"You don't seem to have the key.":GOTO60
630 PRINT"The door is open.":DF=1:GOTO60
640 IFOB(NO,0)<>-1THENPRINT"You are not carrying it.":GOTO60
650 PRINT"I've known strange people, but attacking"OB$(NO);"?":GOTO60
660 IFNO=20THEN710
670 IFNO=17THENPRINT"What knight ?":GOTO60
680 IFNO=21THENPRINT"I see no pirate here.":GOTO60
690 IFOB(I,0)<>-1THENPRINT"You are not currently holding that.":GOTO60
700 PRINT"It isn't alive!":GOTO60
710 IFCP<>32THENPRINT"What sorcerer?":GOTO60
720 IFOB(8,0)<>-1THENPRINTSR$:FORI=1TO3000:NEXTI:GOTO1370
730 PRINTSK$:OB(14,0)=CP:OB(20,0)=0:GOTO60
740 IFOB(NO,0)<>-1THENPRINT"You don't have that right now.":GOTO60
750 IFNO<>3THENPRINT"How do you expect to read ";OB$(NO);"?":GOTO60
760 PRINT"It says:  magic word:  alakazam.":GOTO60
770 IFOB(NO,0)<>-1ANDOB(NO,0)<>CPTHENPRINT"I don't see that here.":GOTO60
780 IFOB(1,0)<>-1THENPRINT"You don't have a gun!":GOTO60
790 IFNO=17THENPRINT"The bullet dissolves as it hits the armor.":GOTO60
800 PRINT"The golden bullet from the golden pistol vaporizes that."
810 IFOB(NO,0)=-1THENZZ=ZZ-1
820 OB(NO,0)=0:GOTO60
830 IFOB(NO,0)=-1THENPRINTS2$
835 PRINT"You're not holding it.":GOTO60
840 IFNO=16ORNO=30ORNO=31THEN870
850 IFOB(NO,0)<>-1THENPRINT"You're not holding that to my knowledge.":GOTO60
860 PRINT"I don't know how to close such a thing.":GOTO60
870 IFNO=16ANDOB(16,0)<>CPTHENPRINT"What vault?":GOTO60
880 IFNO=16THENPRINT"The vault is closed and locked.":VF=0:GOTO60
890 IFNO=31THEN1110
900 IFCP<>1THENPRINT"What door?":GOTO60
910 PRINT"The door is closed and locked.":DF=0:GOTO60
920 IFOB(NO,0)<>-1THENPRINT"You're not holding it.":GOTO60
930 PRINT"No, these items have to be used on the  next adventure, too.":GOTO60
940 PRINT"The value of that is"OB(NO,1)"points.":GOTO60
950 IFOB(NO,0)<>-1THENPRINT"You don't seem to have it.":GOTO60
960 IFNO<>8THENPRINT"Wow is this fun!":GOTO60
970 PRINT"Whoosh!":GOTO60
980 IFOB(NO,0)<>-1THENPRINT"You're not currently carrying it.":GOTO60
990 IFNO<>8THENPRINTS2$:GOTO60
1000 PRINT"It is already razor sharp.":GOTO60
1010 IFOB(NO,0)<>-1THENPRINT"tu ne le portes pas(you're not carrying it.":GOTO60
1020 ifno<>19thenprint"how?":goto60
1030 PRINT"Very good! Now you can go to the second grade!":GOTO60
1040 PRINT"Try drop.":GOTO60
1050 PRINT"I can only tell you what is in the room with you, sorry."
1060 PRINT"I cannot find anything.":GOTO60
1070 IFCP<>44THENPRINTGT$(FNR(2))
1080 IFCP<>44THEN60
1090 IFWF=0THENPRINT"The window is only slightly ajar.":GOTO60
1100 PRINT"Okay...you fall safely in the pile of leaves.":CP=48
1101 PRINT"You seem to be lost in a forest of spruce trees.":GOTO60
1110 IFCP<>44THENPRINT"What window? I don't see a window!":GOTO60
1120 IFWF=0THENPRINT"It is already closed.":GOTO60
1130 PRINT"Having opened it earlier, you find it impossible to close.":GOTO60
1140 IFCP<>44THENPRINT"What window?":GOTO60
1150 IFWF=1THENPRINT"It is already open.":GOTO60
1160 PRINT"Through a great effort, you open the"
1161 PRINT"window, there is a pile of leaves outside the window.":WF=1:GOTO60
1170 PRINT"Holy moly! A black knight walked in to  kill you!":GOSUB1430
1180 IFVB<>17ORNO<>17THEN1210
1190 IFOB(1,0)<>-1THENPRINT"You have no gun!":GOTO1210
1200 PRINT"The knight disintigrated.":GOTO60
1210 PRINT"The knight is running towards you.......";
1220 IFFNR(5)=2THENPRINT"It kills you!":FORI=1TO3000:NEXTI:GOTO1370
1230 PRINT"It misses you
1232 PRINT"and crashes into a wall...wait! He has disappeared!":GOTO60
1240 PRINT"A pirate just appeared and chartled,"
1250 PRINT"well shiver me timbers! not another one!";
1255 PRINT"har har har, I'll just snatch all this"
1260 PRINT"booty and hide it deep in the maze."
1270 REM
1280 PRINT"With that he takes all of your treasure!"
1290 FORI=1TOLO:IFOB(I,0)<>-1THEN1320
1300 IFOB(I,1)=0THEN1320
1310 OB(I,0)=FNR(6)+34:ZZ=ZZ-1
1320 NEXTI:GOTO60
1330 PRINT"Jingle jingle jingle!":PRINT"Chester the Jester pops up and chants,-"
1340 PRINTC$(FNR(8)-1):PRINT" tee hee hee!"
1350 PRINT"and then vanishes in a cloud of pink smoke."
1360 GOTO60
1370 PRINT"{clear}":J=0:FORI=1TOLO:IFOB(I,0)=1THENJ=J+OB(I,1)
1380 NEXTI
1390 PRINT"{pink}Out of a maximum of 225 points, you have scored"J" points.":IFJ>=224THENPRINT"Perfect game!"
1400 PRINT"{down}Hope you had fun!":END
1410 PRINT"{yellow}Whazzat?"
1420 STOP
1430 INPUT"{down*2}{light green}What do you want to do  {sh space}{left*3}";CM$:PRINT"{white}"
1435 IF CM$="{sh space}"THEN1430
1440 N1$="":V1$="":NO=0:VB=0:NO$="":VB$=""
1450 CM=LEN(CM$):FORI=1TOCM:IFMID$(CM$,I,1)<>" "THENV1$=V1$+MID$(CM$,I,1):NEXTI
1460 VB$=LEFT$(V1$,3):FORI=1TONV:IFVB$(I)=VB$THENVB=I:GOTO1480
1465 NEXTI
1470 VB=-1:N1$=V1$:GOTO1490
1480 IFLEN(V1$)+1>LEN(CM$)THENNO=0:RETURN
1485 N1$=RIGHT$(CM$,LEN(CM$)-1-LEN(V1$))
1490 NO$=LEFT$(N1$,3):FORI=1TONN:IFNO$(I)=NO$THENNO=I:RETURN
1493 NEXTI
1495 RETURN
1500 PRINT"{clear}":PRINT"{down}{light blue}You're ";P$(CP):FORI=1TOLO
1510 IFOB(I,0)=CPTHENPRINT"{cyan}There is ";OB$(I)" here."
1520 NEXTI
1530 IFCP=1ANDDF=0THENPRINT"The door is locked."
1540 IFCP=18ANDVF=0ANDOB(16,0)=18THENPRINT"The vault is locked."
1550 IFCP=17ANDCF=0THENPRINT"A small crack leads southward."
1560 IFCP=1ANDDF=1THENPRINT"The door is open."
1570 IFCP=18ANDVF=1ANDOB(16,0)=18THENPRINT"The vault is open."
1580 IFCP=44ANDWF=0THENPRINT"The window is slightly ajar."
1590 IFCP=17ANDCF=1THENPRINT"A towering hole leads southward."
1600 IFCF=0THENP(17,1)=0
1610 IFCP=44ANDWF=1THENPRINT"The window is wide open.  There is a"
1615 IFCP=44ANDWF=1THENPRINT"rather large pile of leaves outside the window."
1620 K=0:PRINT"{down}{yellow}You can go ";:FORI=0TO3:IFP(CP,I)=0THEN1650
1630 IFK=1THENPRINT", ";
1640 PRINTD$(I);:K=1
1650 NEXTI:IFK=0THENPRINT"nowhere!"
1660 IFK=1THENPRINT
1670 P(17,1)=18
1680 PRINT"{down}{white}=======================================":GOTO30
1690 O=0:RETURN
1700 NP=53:LO=35:NN=31:NV=30:DIMP(NP,3),P$(NP),VB$(NV),NO$(NN),OB(LO,1),OB$(LO)
1710 P$(1)="Outside a medieval castle, the pavement has an inscription:"
1711 P$(1)=P$(1)+CHR$(13)+"leave all treasure here say 'score'."
1715 DATA 5,8,3,2,4,7,1,0,6,7,0,1
1720 P$=" side of the castle.":P$(2)="at the west"+P$:P$(3)="at the east"+P$
1730 P$(4)="in a vast forest stretching out  of sight.":DATA4,2,4,4,53,0,6,1
1740 P$(5)=P$(4):P$(6)=P$(4):DATA6,6,6,5
1750 P$(7)="at the south"+P$+" there is a tower with a small window in"
1755 P$(7)=P$(7)+" the far, far distance.":DATA2,0,0,0
1760 P$(8)="in a splendid chamber 30 feet high.":DATA1,11,0,10
1770 P$(9)="in a damp, musty library.":DATA0,10,0,0
1780 P$(10)="in the master bedroom.":DATA9,0,8,0
1790 p$="in a vast corridor stretching outof sight to the ":p$(11)=p$+"south."
1795 DATA 8,12,14,0
1800 P$(12)=P$+"north and south.":DATA11,13,15,0
1810 P$(13)=P$+"north.":DATA12,0,16,17
1820 P$="in a bedroom with a ":P$(14)=P$+"stone floor.":P$(15)=P$+"wooden floor
1825 P$(16)=P$+"dirt floor.":DATA0,0,0,11,0,0,0,12,0,33,0,13
1830 P$(17)="in a dusty pantry. markings in the dust read, go south to dungeon.
1835 DATA 0,18,13,0
1840 P$(18)="in a primitive art gallery.":DATA17,19,0,19
1850 P$(19)="in a maze of twisty little passages."
1860 P$(20)="in a twisty maze of little passages."
1870 P$(21)="in a little maze of twisty passages."
1880 P$(22)="in a twisting maze of little passages."
1890 P$(23)="in a little twisty maze of passages."
1900 DATA0,20,18,0,20,22,20,19,21,21,22,23,21,22,20,22,21,24,23,23
1910 P$(24)="in the kitchen.":DATA23,27,25,0,0,27,26,24,29,28,30,25
1920 P$(25)="in the dining room.":P$(26)="in the alcove to the study."
1925 P$(27)="in the office of the sorcerer (?)":DATA24,0,28,0
1930 P$(28)="in the drawing room.":DATA0,0,0,27,0,26,0,0,0,31,0,26
1940 P$(29)="in the parlor.":P$(30)="in the study.":P$(31)="in the sitting room."
1950 P$(32)="in the dungeon!":DATA0,0,0,0,0,0,0,0
1960 FORI=1TONP:FORJ=0TO3:READP(I,J):NEXTJ:NEXTI:P(31,FNR(4)-1)=32
1970 P$(33)="in a primeval conference room.":DATA16,0,35,0
1980 P$(34)="in the tower. it overlooks a huge"
1981 P$(34)=P$(34)+"kingdom down a monsterous mountain, the grass is greener "
1982 P$(34)=P$(34)+"than green itself.":DATA0,0,36,0
1990 P$(35)="in a maze of twisty little passages, all alike."
1995 FORI=36TO40:P$(I)=P$(35):NEXTI:DATA36,35,35,33,38,34,37,35,36,0,39,0,40,39
1996 DATA39,36,38,37,39,38,41,38,0,0,42,40,0,0
2000 P$(41)="at the brink of a huge pit."
2001 P$(43)="in a barren cubical, with  passages leading off to the"
2002 P$(43)=P$(43)+" north and south.":P$(42)="in the pit. a good passage"
2003 P$(42)=P$(42)+" exits to the north."
2010 P$(44)="at the end of the castle. you cansee a forest out a small window."
2015 DATA43,0,41,0,44,42,0,0,0,0,0,0
2020 P$(45)="lost in a dark forest made up chiefly of spruce trees."
2025 FORI=46TO48:P$(I)=P$(45):NEXTI:DATA45,46,45,49,45,47,46,50,45,51,47,48,50
2026 DATA48,47,48
2030 P$(49)="on an old path made by horses in mideval times."
2035 P$(51)="in the middle of a clearing, to  the south is a bridge."
2037 P$(52)="on the north side of the bridge."
2038 P$(53)="on the south side of the bridge."
2039 DATA 0,50,45,0,49,48,46,0,0,52,47,0,51,53
2040 DATA0,0,52,5,0,0,PIS,KEY,BOO,RUG,COI,SAP,LIQ,SWO,PAI,OPA,SIL,PEN,PIL,SEP
2045 DATA BAR,VAU,KNI,CUP,CRO,SOR,PIR,NOR,SOU,EAS,WES,N,S,E,W,DOO,WIN
2050 DATAGO,GET,LOO,INV,SCO,DRO,HEL,"{ct c*2}",LOA,QUI,SAY,DRI,OPE,HIT,KIL,REA,SHO,EAT
2055 DATACLO,LOC,UNL,DES,BRE,VAL,SWI,SHA,WEA,THR,FIN,JUM
2060 FORI=1TONN:READNO$(I):NEXTI:FORI=1TONV:READVB$(I):NEXTI
2070 DATA A GOLD PISTOL,4,10,A SET OF KEYS,2,0,A BOOK ON SORCERY,9,0
2072 DATA A PERSIAN RUG,10,15,A BAG OF COINS,3,15,A PRICELESS SAPHIRE,14,10
2074 DATA A FLASK OF LIQUID,15,0,A GOLDEN SWORD,42,10,A PRICELESS PAINTING,18,15
2080 DATA A GIANT OPAL,22,15,A SET OF SILVERWARE,24,15,A PLATINUM PEN,27,5
2082 DATA A VELVET PILLOW,43,20,THE SORCERER'S SEPTOR,0,50,A GOLD BAR,0,20
2084 DATA A VAULT IN THE WALL,0,0,A BLACK KNIGHT,0,0,A PEWTER CUP,25,15
2086 DATA A KINGS CROWN,30,10,XXX
2090 DATA32,0,AN EVIL PIRATE,0,0
2100 FORI=1TO21:READOB$(I),OB(I,0),OB(I,1):NEXTI
2110 DATA NORTH,SOUTH,EAST,WEST
2120 FORI=0TO3:READD$(I):NEXTI
2130 P$(19)=P$(19)+CHR$(13)+"a note on the wall reads: this is not {sh space} the maze"
2135 P$(19)=P$(19)+" where the pirate hides his treasure. --gh"
2140 OB$(20)="an evil high sorcerer just waiting to cast a spell on you."
2150 P$(50)="at the end of the path, with forest surrounding you in all"
2155 P$(50)=P$(50)+CHR$(13)+" directions except north, where you were before."
2160 P(50,3)=48:P$(47)=P$(47)+CHR$(13)+"to the south there seems to be light."
2170 FORI=52TO53:P$(I)=P$(I)+CHR$(13)+"across the bridge is more forest.":NEXT
2180 P(36,2)=37
2190 C$(0)="pay attention in the maze, to the wording of the phrase! "
2195 C$(0)=C$(0)+"if you do you'll be un-mazed."
2200 C$(1)="gulp gulp gulp, drink it down, I'm not  such a stupid clown!"
2210 C$(2)="out a window you may fall, just look out, that is all!"
2220 c$(3)="the knights can't be killed, as far as iknow, if you find they can"
2225 C$(3)=C$(3)+" please tell  me so!"
2230 C$(4)="don't bring the sword to the sorcerers  place.  if you do, he might"
2235 C$(4)=C$(4)+" confront youface to face!"
2240 C$(5)="hocus pocus, alakazam! don't read the book or you'll be sorry!"
2250 C$(6)="passages that all seem alike can seem quite different, just hope"
2255 c$(6)=c$(6)+" you're right!"
2260 c$(7)="not all treasure lies under a roof, some might be under a tree!"
2270 goto2

