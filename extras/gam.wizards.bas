!--------------------------------------------------
!- Saturday, May 20, 2017 1:36:40 AM
!- Import of : 
!- c:\src\zelch128\extras\gam.wizards.prg
!- Commodore 128 BASIC 7/7.1
!- ***************NOT CONVERTED -- USING POKES FOR MAP -- FIX THIS!
!--------------------------------------------------
5 X=RND(-TI)
10 CLR
20 DIMC$(34),I$(34),R$(4),W$(8),E$(8)
30 DIMC(3,4),T(8),O(3),R(3):PRINT"{clear}"
40 REM E0 = PEEK(4624)+256*PEEK(4625):E0=E0+511
45 DIM E0%(513):REME0=1024:E0=E0+511
50 DEFFND(Q)=Q*64+X*8+Y+(-72):DEFFNE(Q)=Q+100*(Q>99):GOTO60
55 A=PEEK(186):OPEN1,A,15,"s0:gam.wizards":CLOSE1:SAVE"gam.wizards",A:STOP
60 Y$=CHR$(13)+"{white}** Answer YES or NO "+CHR$(13)
70 DEFFNA(Q)=1+INT(RND(1)*Q):DEFFNB(Q)=Q+8*((Q=9)-(Q=0))
80 Q=RND(-TI):RESTORE:FORQ=1TO34:READC$(Q),I$(Q):NEXT
90 FORQ=1TO513:E0%(Q)=101:NEXT:FORQ=1TO8:READW$(Q),E$(Q):NEXT
100 FORQ=1TO4:READR$(Q):NEXT:DEFFNC(Q)=-Q*(Q<19)-18*(Q>18)
110 PRINT"{clear}{cyan}":GOSUB3270:PRINTTAB(10)"{light blue}The Wizard's Castle"
120 PRINTTAB(10)"by Joseph Power{cyan}":GOSUB3270:PRINT
130 PRINT"{light blue}Last revised - 07/09/80  12:30 am":PRINT
135 PRINT"Converted to PET by - John O'Hare":PRINT
136 PRINT"Codes:{purple}"
137 FORI=1TO11STEP2:PRINTI$(I)"="C$(I);TAB(20)I$(I+1)"="C$(I+1):NEXT
138 PRINT"v=vendor";TAB(20);"m=any monster"
139 PRINT"t=any treasure";TAB(20);I$(34)"=unexplored"
140 PRINT:PRINT"{light green}Please be patient - ";:X=1:Y=4
150 E0%(FND(1))=2:PRINT"in";:FORZ=1TO7:FORQ1=1TO2:Q=104:GOSUB3200
160 E0%(FND(Z+1))=103:NEXTQ1:NEXTZ:PRINT"i";
170 FORZ=1TO8:FORQ=113TO124:GOSUB3200:NEXTQ:FORQ1=1TO3
180 FORQ=105TO112:GOSUB3200:NEXTQ:Q=125:GOSUB3200:NEXTQ1:READO$:PRINTO$;
185 NEXT
190 FORQ=126TO133:Z=FNA(8):GOSUB3200:NEXTQ:PRINT"g";
200 Q=101:FORA=1TO3:Z=FNA(8):GOSUB3200:C(A,1)=X:C(A,2)=Y:C(A,3)=Z:C(A,4)=0
210 READO$:PRINTO$;:NEXT:PRINT"s";:RC=0:SG=2:DX=14:R$(3)="man"
220 Q=112+FNA(12):Z=FNA(8):GOSUB3200:R(1)=X:R(2)=Y:R(3)=Z
230 Q=109:Z=FNA(8):GOSUB3200:O(1)=X:O(2)=Y:O(3)=Z:PRINT"tle"
240 BF=0:OT=8:AV=0:HT=0:T=1:VF=0:LF=0:TC=0:GP=60:RF=0:OF=0:BL=0
245 GOSUB3500
250 IQ=8:SX=0:FORQ=1TO8:T(Q)=0:NEXT:PRINT"{clear}{pink}All right bold one"
260 PRINT"{pink}You may be an Elf, Dwarf, Man, or Hobbit":GOSUB3280
270 FORQ=1TO4:IFLEFT$(R$(Q),1)=O$THENRC=Q:SG=SG+2*Q:DX=DX-2*Q
280 NEXT:PRINT:OT=OT+4*(RC=1):IFRC>0THENR$(3)="Human":GOTO300
290 PRINT"{red}** That was incorrect. Please type E, D,M or H.":GOTO260
300 PRINT"Sex ";:GOSUB3290:IFO$="m"THENSX=1:GOTO320
310 IFO$<>"f"THENPRINT:PRINT"{yellow}** Cute ";R$(RC);", real cute. Try M or F":GOTO300
320 PRINT"{clear}{yellow}":PRINT"Ok ";R$(RC);", you have these statistics:":PRINT
330 PRINT"Strength= ";SG;" Intelligence= ";IQ:PRINT"Dexterity =";DX:PRINT
340 PRINT"{white}And"OT"other points to allocate":PRINT"as you wish.":PRINT
350 Z$="Intelligence ":GOSUB3300:IQ=IQ+Q:IFOT=0THEN370
360 Z$="Strength ":GOSUB3300:SG=SG+Q:IFOTTHENZ$="Dexterity ":GOSUB3300:DX=DX+Q
370 PRINT"{clear}{cyan}":PRINT"Ok, ";R$(RC);" you have 60 gold pieces.":PRINT
380 Z$="{light gray}Armor{white}":GOSUB3390:AV=0:WV=0:FL=0:WC=0
390 PRINT"{light gray}Plate  Chainmail  Leather  Nothing"
395 PRINT"<30>     <20>       <10>     <0>"
400 GOSUB3280:IFO$="n"THEN440
410 AV=-3*(O$="p")-2*(O$="c")-(O$="l"):IFAV>0THEN440
420 PRINT:PRINT"{white}** Are you a ";R$(RC);" or ";C$(FNA(12)+12);
430 PRINT"{white} ? Type P,C,L, or N":PRINT:GOTO380
440 AH=AV*7:GP=GP-AV*10:PRINT"{clear}"
450 PRINT:PRINT"{cyan}Ok, bold ";R$(RC);", you have":PRINTGP"gp's left":PRINT
460 Z$="{light blue}Weapons{white}":GOSUB3390
470 PRINT"{light blue}Sword  Mace  Dagger  Nothing"
475 PRINT"<30>   <20>   <10>     <0>":GOSUB3280:IFO$="n"THEN500
480 WV=-3*(O$="s")-2*(O$="m")-(O$="d"):IFWV>0THEN500
490 PRINT:PRINT"{white}** Is your iq really"IQ:PRINT"? Type S, M, D, or N":PRINT:GOTO460
500 GP=GP-WV*10:PRINT"{clear}":IFGP<20THEN540
510 PRINT"WANT TO BUY A LAMP FOR 20 GP'S ";:{141}3290
520 IFO$="y"THENLF=1:GP=GP-20:GOTO540
530 IFO$<>"n"THENPRINT:PRINTY$:PRINT:GOTO510
540 PRINT"{clear}":IFGP<1THENQ=0:GOTO600
550 PRINT:PRINT"{light green}Ok, "R$(RC)", you have ";GP;" gold":PRINT"pieces left":PRINT
560 INPUT"{light green}Flares cost 1 gp each. How many do you  want";O$
570 Q=VAL(O$):PRINT:IFQ>0ORASC(O$)=48THEN590
580 PRINT"{white}** If you don't want any just type '0'":PRINT:GOTO560
590 IFQ>GPTHENPRINT"{white}** You can only afford ";GP:PRINT:GOTO560
600 FL=FL+Q:GP=GP-Q:PRINT"{clear}{red}":X=1:Y=4:Z=1
610 PRINT"Ok "R$(RC)", You enter the castle ":PRINT"and begin.":PRINT:GOTO1670
620 T=T+1:IFRF+OF>0THEN690
630 IFC(1,4)>T(1)THENT=T+1
640 IFC(2,4)>T(3)THENGP=GP-FNA(5):IFGP<0THENGP=0
650 IFC(3,4)<=T(5)THEN680
660 A=X:B=Y:C=Z:X=FNA(8):Y=FNA(8):Z=FNA(8)
670 E0%(FND(Z))=FNE(E0%(FND(Z)))+100:X=A:Y=B:Z=C
680 IFE0%(FND(Z))<>1THEN690
681 FORQ=1TO3
682 IFC(Q,4)THEN684
683 C(Q,4)=-(C(Q,1)=X)*(C(Q,2)=Y)*(C(Q,3)=Z)
684 NEXT
685 FORQ=1TO3:IF-(C(Q,1)=X)*(C(Q,2)=Y)*(C(Q,3)=Z)THENPRINT"{down}{red}{reverse on}a curse!{reverse off}{white}"
686 NEXT
690 IFFNA(5)>1THEN790
700 PRINT:PRINTMID$("{white}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}",INT(RND(TI)*15)+1,1);:PRINT"you ";:Q=FNA(7)+BL:IFQ>7THENQ=4
710 ONQGOSUB750,730,740,720,760,770,780:GOTO790
720 PRINT"stepped on a frog":RETURN
730 PRINT"hear ";MID$("a scream footstepsa wumpus thunder",FNA(4)*9-8,9):RETURN
740 PRINT"sneezed":RETURN
750 PRINT"see a bat fly by":RETURN
760 PRINT"smell ";C$(12+FNA(13));" frying":RETURN
770 PRINT"feel like you're being watched":RETURN
780 PRINT"are playing wizard's castle":RETURN
790 IFBL+T(4)=2THENPRINT:PRINTC$(29);" {reverse on}cures your blindness{reverse off}":BL=0
800 IFBF+T(6)=2THENPRINT:PRINTC$(31);" {reverse on}dissolves the book{reverse off}":BF=0
810 PRINT:INPUT"{white}Your move";O$:O$=LEFT$(O$,2):IFO$="dr"THEN1180
820 O$=LEFT$(O$,1):IFO$="n"THEN940
825 IFO$=""THENPRINT"{up*3}":GOTO810
830 IF(O$="s")OR(O$="w")OR(O$="e")THEN950
840 IFO$="u"THEN970
850 IFO$="d"THEN990
860 IFO$="m"THEN1010
870 IFO$="f"THENON1+BLGOTO1070,1010
880 IFO$="l"THENON1+BLGOTO1110,1010
890 IFO$="o"THEN1310
900 IFO$="g"THENON1+BLGOTO1480,1010
910 IFO$="t"THENPRINT:ON1+RFGOTO1590,1600
920 IFO$="q"THEN1640
930 PRINT:PRINT"{white}** Stupid ";R$(RC);" that wasn't a":PRINT"valid command.":INPUT"** See a menu (y/n) ";O$:IFO$<>"y"THENO$="":GOTO620
931 PRINT"{down*2}{cyan}Move: n)orth, s)outh, e)ast, w)est,{f7} u)p, d)own.":PRINT"{down}{light blue}Other: d)rink, m)ap, f)lare, l)amp, q)uit,{f7} o)pen, g)aze, and t)eleport":GOTO620
940 IFE0%(FND(Z))=2THEN2900
950 X=X+(O$="n")-(O$="s"):Y=Y+(O$="w")-(O$="e")
960 X=FNB(X):Y=FNB(Y):GOTO1670
970 IFE0%(FND(Z))=3THENZ=Z-1:GOTO1670
980 Z$="Up":GOTO1000
990 Z$="Down":IFE0%(FND(Z))=4THENZ=Z+1:GOTO1670
1000 PRINT:PRINT"{white}** Oh ";R$(RC);" no stairs going ";Z$:PRINT"in here.":GOTO620
1010 IFBL=1THENPRINT:PRINT"{white}** You can't see anything, dumb ";R$(RC):GOTO620
1020 PRINT:PRINT:A=X:B=Y:FORX=1TO8:FORY=1TO8:Q=E0%(FND(Z)):IFQ>99THENQ=34
1030 IFX=AANDY=BTHENPRINT"<";I$(Q);">";:GOTO1050
1040 PRINT" ";I$(Q);" ";
1050 NEXTY:PRINT:PRINT:NEXTX:X=A:Y=B:GOTO1100
1060 PRINT")level ";Z:GOTO620
1070 IFFL=0THENPRINT:PRINT"{white}** Hey bright one, you're out  of flares":GOTO620
1080 PRINT:FL=FL-1:A=X:B=Y:FORQ1=A-1TOA+1:X=FNB(Q1):FORQ2=B-1TOB+1:Y=FNB(Q2)
1090 Q=FNE(E0%(FND(Z))):E0%(FND(Z))=Q:PRINTI$(Q);" ";:NEXTQ2:PRINT:PRINT:NEXTQ1:X=A:Y=B
1100 GOSUB3400:GOTO620
1110 IFLF=0THENPRINT"{white}** You don't have a lamp, ";R$(RC):GOTO620
1120 PRINT:PRINT"{yellow}Where do you want to shine the lamp     (n,s,e, or w) ";:GOSUB3290
1130 A=X:B=Y:X=FNB(X+(O$="n")-(O$="s")):Y=FNB(Y+(O$="w")-(O$="e"))
1140 IFA-X+B-Y=0THENPRINT"{white}** Turkey! That's not a direction":GOTO620
1150 PRINT:PRINT"{yellow}The lamp shines into (";X;",";Y;")":PRINT"level ";Z:PRINT
1160 E0%(FND(Z))=FNE(E0%(FND(Z))):PRINT"There you will find ";C$(E0%(FND(Z)))
1170 X=A:Y=B:GOTO620
1180 IFE0%(FND(Z))<>5THENPRINT:PRINT"{white}** If you want a drink, find a pool":GOTO620
1190 Q=FNA(8):PRINT:PRINT"{light blue}You take a drink and ";:IFQ<7THENPRINT"feel ";
1200 ONQGOTO1210,1220,1230,1240,1250,1260,1270,1290
1210 SG=FNC(SG+FNA(3)):PRINT"stronger":GOTO620
1220 SG=SG-FNA(3):PRINT"weaker":ON1-(SG<1)GOTO620,2840
1230 IQ=FNC(IQ+FNA(3)):PRINT"smarter":GOTO620
1240 IQ=IQ-FNA(3):PRINT"dumber":ON1-(IQ<1)GOTO620,2840
1250 DX=FNC(DX+FNA(3)):PRINT"nimbler":GOTO620
1260 DX=DX-FNA(3):PRINT"clumsier":ON1-(DX<1)GOTO620,2840
1270 Q=FNA(4):IFQ=RCTHEN1270
1280 RC=Q:PRINT"become ";R$(RC):GOTO620
1290 SX=1-SX:PRINT"turn into a ":IFSX=0THENPRINT"fe";
1300 PRINT"male ";R$(RC):GOTO620
1310 IFE0%(FND(Z))=6THENPRINT:PRINT"{purple}You open the chest and...":PRINT:GOTO1430
1320 IFE0%(FND(Z))=12THENPRINT:PRINT"{purple}You open the book and...":PRINT:GOTO1340
1330 PRINT:PRINT"{white}** The only thing you opened was"+CHR$(13)+"your big mouth":GOTO620
1340 ONFNA(6)GOTO1350,1360,1370,1380,1390,1400
1350 PRINT"{yellow}FLASH! Oh no! You're now blind!{sh space}";R$(RC):BL=1:GOTO1420
1360 PRINT"{green}Its another volume of zot's poetry!     - yeech!":GOTO1420
1370 PRINT"{green}Its an old copy of play ";R$(FNA(4)):GOTO1420
1380 PRINT"{green}Its a manual of dexterity!":DX=DX+1:GOTO1420
1390 PRINT"{green}Its a manual of strength !":SG=SG+1:GOTO1420
1400 PRINT"{green}The book sticks to your hands .":PRINT
1410 PRINT"now you can't draw your weapon!":BF=1
1420 E0%(FND(Z))=1:GOTO620
1430 ONFNA(4)GOTO1440,1450,1460,1450
1440 PRINT"{pink}{reverse on}KABOOM!{reverse off} it explodes!":Q=FNA(6):GOSUB2800:ON1-(SG<1)GOTO1420,2840
1450 Q=FNA(1000):PRINT"{white}Find"Q"{yellow}gold{white} pieces":GP=GP+Q:GOTO1420
1460 PRINT"{light green}GAS!{gray} You stagger from the room"
1470 E0%(FND(Z))=1:T=T+20:O$=MID$("nsew",FNA(4),1):GOTO950
1480 IFE0%(FND(Z))<>11THENPRINT"{white}** No ORB - No gaze":GOTO620
1490 PRINT:PRINT"{light gray}You see ";:ONFNA(7)GOTO1500,1510,1530,1540,1560,1575,1580
1500 PRINT"yourself in a {red}bloody{light gray} heap":SG=SG-FNA(2):ON1-(SG<1)GOTO620,2840
1510 PRINT"yourself drinking from a {light blue}pool"+CHR$(13)+"{light gray}and becoming ";C$(12+FNA(13))
1520 GOTO620
1530 PRINTC$(12+FNA(13));" gazing back at you":GOTO620
1540 A=X:B=Y:C=Z:X=FNA(8):Y=FNA(8):Z=FNA(8):Q=FNE(E0%(FND(Z))):E0%(FND(Z))=Q
1550 PRINTC$(Q):PRINT" at (";X;",";Y;") level"Z:X=A:Y=B:Z=C:GOTO620
1560 A=FNA(8):B=FNA(8):C=FNA(8):IFFNA(8)<=4THENA=O(1):B=O(2):C=O(3)
1570 PRINT"the orb of zot at":PRINT"(";A;",";B;") level"C:GOTO620
1575 PRINT"the runestaff on level";R(3):GOTO620
1580 PRINT"a soap opera rerun":GOTO620
1590 IFRF=0THENPRINT"{white}** You can't teleport without the"+CHR$(13)+"runestaff!":GOTO620
1600 Z$="X-coord (1=far north  8=far south) ":GOSUB3350:X=Q
1610 Z$="Y-coord (1=far west   8=far east)  ":GOSUB3350:Y=Q
1620 Z$="Level   (1=top        8=bottom)    ":GOSUB3350:Z=Q
1630 O$="t":GOTO1670
1640 PRINT:PRINT"{cyan}Do you really want to quit ";:GOSUB3290:PRINT
1650 IFO$<>"y"THENPRINT"{white}** then don't say you do":GOTO620
1660 PRINT:PRINT:GOTO2940
1670 PRINT"{white}------------------------------":IFBL=0THENGOSUB3400
1680 PRINT"{pink}ST=";SG;" IQ=";IQ;" DX=";DX:PRINT"{yellow}Flares=";FL;" gp's=";GP
1690 PRINT"{white}";W$(WV+1);" /";W$(AV+5);:IFLF=1THENPRINT" / a lamp";
1700 PRINT:WC=0:Q=FNE(E0%(FND(Z))):E0%(FND(Z))=Q:Z$="{cyan}You have "
1710 PRINT"{light blue}Here you find ";C$(Q):IF(Q<7)OR(Q=11)OR(Q=12)THEN620
1720 IFQ=7THENGP=GP+FNA(10):PRINT:PRINTZ$;GP:GOTO1420
1730 IFQ=8THENFL=FL+FNA(5):PRINT:PRINTZ$;FL:GOTO1420
1740 IFQ>9THEN1770
1750 PRINT:IF(O(1)=X)AND(O(2)=Y)AND(O(3)=Z)THENON1-(O$="t")GOTO950,3050
1760 X=FNA(8):Y=FNA(8):Z=FNA(8):GOTO1670
1770 IFQ=10THENZ=FNB(Z+1):GOTO1670
1780 IFQ>25ANDQ<34THENPRINT:PRINT"Its yours":T(Q-25)=1:TC=TC+1:GOTO1420
1790 A=E0%(FND(Z))-12:WC=0:IF(A<13)OR(VF=1)THEN2300
1800 PRINT:PRINT"{blue}You may trade with, Attack, or Ignore"+CHR$(13)+"the vendor"
1810 GOSUB3280:IFO$="i"THEN620
1820 IFO$="a"THENVF=1:PRINT:PRINT"{white}You'll be sorry you did that":GOTO2300
1830 IFO$<>"t"THENPRINT:PRINT"{white}** Nice shot, ";R$(RC):GOTO1800
1840 PRINT:FORQ=1TO8:A=FNA(Q*1500):IFT(Q)=0THEN1880
1850 PRINT:PRINT"{yellow}Do you want to sell ";C$(Q+25):PRINT"for ";A;" gp's";
1860 GOSUB3290:IFO$="y"THENTC=TC-1:T(Q)=0:GP=GP+A:GOTO1880
1870 IFO$<>"n"THENPRINTY$:GOTO1850
1880 NEXTQ
1890 IFGP<1E3THENPRINT:PRINT"{blue}You're too POOR to trade, ";R$(RC):GOTO620
1900 IFGP<1250THEN2130
1910 PRINT:PRINT"{light blue}Ok, ";R$(RC);", you have";GP;" gold":PRINT"pieces and ";W$(AV+5)
1920 PRINT:Z$="Armor":GOSUB3390:PRINT"{light gray}Nothing<0> Leather<1250> "
1930 IFGP>1499THENPRINT"Chainmail<1500> ";:IFGP>1999THENPRINT"Plate<2000>";
1940 PRINT:GOSUB3280:PRINT:IFO$="n"THEN2010
1950 IFO$="l"THENGP=GP-1250:AV=1:AH=7:GOTO2010
1960 IFO$="c"ANDGP<1500THENPRINT"{white}** You haven't got that much cash":GOTO1920
1970 IFO$="c"THENGP=GP-1500:AV=2:AH=14:GOTO2010
1980 IFO$="p"ANDGP<2000THENPRINT"{white}** You can't afford plate":GOTO1920
1990 IFO$="p"THENGP=GP-2000:AV=3:AH=21:GOTO2010
2000 PRINT:PRINT"{white}** Don't be silly. Choose a selection":GOTO1940
2010 IFGP<1250THEN2130
2020 PRINT:PRINT"{yellow}You have"GP"gp's left with ";W$(WV+1):PRINT" in hand":PRINT
2030 PRINT:Z$="Weapon":GOSUB3390:PRINT"{light gray}Nothing<0> Dagger<1250> "
2040 IFGP>1499THENPRINT"Mace<1500> ";:IFGP>1999THENPRINT"Sword<2000>";
2050 PRINT:GOSUB3280:PRINT:IFO$="n"THEN2130
2060 IFO$="d"THENGP=GP-1250:WV=1:GOTO2130
2070 IFO$="m"ANDGP<1500THENPRINT"{white}** Sorry sir, I don't give credit":GOTO2030
2080 IFO$="m"THENGP=GP-1500:WV=2:GOTO2130
2090 IFO$="s"ANDGP<2000THENPRINT"{white}** dungeon express card -"
2100 IFO$="s"ANDGP<2000THENPRINT"   you left home without it!":GOTO2030
2110 IFO$="s"THENGP=GP-2000:WV=3:GOTO2130
2120 PRINT"{white}** try choosing a selection":GOTO2050
2130 IFGP<1000THEN620
2140 Z$="Strength":GOSUB3370:IFO$<>"y"THEN2160
2150 GP=GP-1E3:SG=FNC(SG+FNA(6)):Q=SG:GOSUB3380:GOTO2130
2160 IFO$<>"n"THENPRINTY$:GOTO2140
2170 IFGP<1000THEN620
2180 Z$="Intelligence":GOSUB3370:IFO$<>"y"THEN2200
2190 GP=GP-1E3:IQ=FNC(IQ+FNA(6)):Q=IQ:GOSUB3380:GOTO2170
2200 IFO$<>"n"THENPRINTY$:GOTO2180
2210 IFGP<1000THEN620
2220 Z$="dexterity":GOSUB3370:IFO$<>"y"THEN2240
2230 GP=GP-1E3:DX=FNC(DX+FNA(6)):Q=DX:GOSUB3380:GOTO2210
2240 IFO$<>"n"THENPRINTY$:GOTO2220
2250 IF(GP<1000)OR(LF=1)THEN620
2260 PRINT:PRINT"{yellow}Want a lamp for 1000 gp's ";:GOSUB3290:IFO$<>"y"THEN2280
2270 GP=GP-1000:LF=1:PRINT:PRINT"{white}Its guaranteed to outlive you!":GOTO620
2280 IFO$<>"n"THENPRINTY$:GOTO2260
2290 GOTO620
2300 Q1=1+INT(A/2):Q2=A+2:Q3=1
2310 IF(C(1,4)>T(1))OR(BL=1)OR(DX<FNA(9)+FNA(9))THEN2690
2320 PRINT:PRINT"{red}You're facing ";C$(A+12):PRINT:PRINT"You may attack or retreat";
2330 IFQ3=1THENPRINT", or bribe":IFIQ>14THENPRINT"or cast a spell"
2340 PRINT:PRINT"{pink}Your STRENGTH is"SG"and DEXTERITY is"DX:PRINT:GOSUB3280
2350 IFO$<>"a"THEN2480
2360 IFWV=0THENPRINT:PRINT"{white}** Pounding on ";C$(12+A);" won't hurt it":GOTO2690
2370 IFBF=1THENPRINT:PRINT"{white}** You can't beat it to death with a book":GOTO2690
2380 IFDX<FNA(20)+(BL*3)THENPRINT:PRINT"{light blue}  Drat! Missed!":GOTO2690
2390 PRINT:PRINT"{yellow}  You HIT the lousy ";MID$(C$(A+12),3):Q2=Q2-WV
2400 IF(A=9ORA=12)ANDFNA(8)=1THENPRINT:PRINT"{white}OH{sh space}NO! Your ";W$(WV+1);" broke":WV=0
2410 IFQ2>0THEN2690
2420 PRINT:MC=MC-1:PRINT"{pink}";C$(A+12);" lies dead at your feet":IFH>T-60THEN2440
2430 PRINT:PRINT"You spend an hour eating":PRINTC$(A+12);E$(FNA(8)):H=T
2440 IFX<>R(1)ORY<>R(2)ORZ<>R(3)THENON1-(A=13)GOTO2460,3220
2450 PRINT:PRINT"{cyan}GREAT ZOT! You've found the runestaff!":R(1)=0:RF=1
2460 Q=FNA(1000):PRINT:PRINT"{light blue}You now get his hoard of"Q"gp's"
2470 GP=GP+Q:GOTO1420
2480 IFO$="r"THEN2690
2490 IF(O$<>"c")THEN2610
2500 IFIQ<15ORQ3>1THENPRINT:PRINT"{white}** You can't cast a spell now!":GOTO2320
2510 PRINT:PRINT"{yellow}Which (Web, Fireball, or Deathspell)":GOSUB3290
2520 IFO$<>"w"THEN2540
2530 SG=SG-1:WC=FNA(8)+1:ON1-(SG<1)GOTO2690,2840
2540 IFO$<>"f"THEN2580
2550 Q=FNA(7)+FNA(7):SG=SG-1:IQ=IQ-1:IF(IQ<1)OR(SG<1)THEN2840
2560 PRINT"{purple}  It does"Q"points of damage.":PRINT
2570 Q2=Q2-Q:GOTO2410
2580 IFO$<>"d"THENPRINT:PRINT"{white}** Try one of the options given":GOTO2320
2590 PRINT"death - - - ";:IFIQ<15+FNA(4)THENPRINT"yours":IQ=0:GOTO2840
2600 PRINT"his":PRINT:Q2=0:GOTO2420
2610 IFO$<>"b"ORQ3>1THENPRINT"{white}Choose one of the listed options":GOTO2320
2620 IFTC=0THENPRINT:PRINT"{light green}'all i want is your life!'":GOTO2690
2630 Q=FNA(8):IFT(Q)=0THEN2630
2640 PRINT:PRINT"{light gray}I want ";C$(Q+25);", will you give":PRINT"it to me ";
2650 GOSUB3290:IFO$="n"THEN2690
2660 IFO$<>"y"THENPRINTY$:GOTO2640
2670 T(Q)=0:TC=TC-1:PRINT:PRINT"{light green}Ok, just don't tell anyone"
2680 VF=VF+(E0%(FND(Z))=25):GOTO620
2690 Q3=2:IFWC>0THENWC=WC-1:IFWC=0THENPRINT:PRINT"{blue}THE{sh space}WEB{sh space}JUST{sh space}BROKE!"
2700 Z$=MID$(C$(12+A),3):IFWC<=0THEN2720
2710 PRINT:PRINT"{light blue}The ";Z$;" is stuck and can't attack":GOTO2750
2720 PRINT:PRINT"{light green}The ";Z$;" attacks":IFDX<FNA(7)+FNA(7)+FNA(7)+BL*3THEN2740
2730 PRINT:PRINT"{light blue}  HAH! He missed you":GOTO2750
2740 PRINT:PRINT"{red}  OUCH! He hit you":Q=Q1:GOSUB2800:IFSG<1THEN2840
2750 IFO$<>"r"THEN2320
2760 PRINT:PRINT"{white}You have escaped":PRINT
2770 PRINT"Do you go North,South,East, or West";:GOSUB3290
2780 IF(O$="n")OR(O$="s")OR(O$="e")OR(O$="w")THEN950
2790 PRINT:PRINT"{white}** Don't press your luck ";R$(RC):PRINT:GOTO2770
2800 IFAV=0THEN2830
2810 Q=Q-AV:AH=AH-AV:IFQ<0THENAH=AH-Q:Q=0
2820 IFAH<0THENAH=0:AV=0:PRINT:PRINT"{light gray}Your armor is destroyed - good luck"
2830 SG=SG-Q:RETURN
2840 FORQ=1TO1250:NEXT:PRINT"{clear}":GOSUB3270
2850 PRINT"{blue}A noble effort, oh formerly"+CHR$(13)+"living ";R$(RC):PRINT
2860 PRINT"You died from lack of ";:IFSG<1THENPRINT"strength"
2870 IFIQ<1THENPRINT"intelligence"
2880 IFDX<1THENPRINT"dexterity"
2890 PRINT:PRINT:Q3=1:PRINT"{purple}When you died you had:":PRINT:GOTO2970
2900 Q3=0:PRINT:PRINT"{purple}You left the castle with";:IFOF=0THENPRINT"out"
2910 PRINT" the orb of zot":PRINT:IFOF=0THEN2940
2920 PRINT"a glorious victory!":PRINT
2930 PRINT"You also got out with the following:":PRINT:GOTO2960
2940 PRINT:PRINT"A less than awe-inspiring defeat."
2950 PRINT:PRINT"When you left the castle you had:":PRINT
2960 IFQ3=0THENPRINT"your miserable life"
2970 FORQ=1TO8:IFT(Q)=1THENPRINTC$(Q+25)
2980 NEXT:PRINTW$(WV+1):PRINTW$(AV+5):IFLF=1THENPRINT"a lamp"
2990 PRINTFL"flares":PRINTGP"gold pieces":IFRF=1THENPRINT"the runestaff"
3000 PRINT:PRINT"It took you"T"turns!":PRINT
3010 PRINT:PRINT:END
3020 IFO$="y"THENPRINT"{gray}Some ";R$(RC);"'s never learn":PRINT:PRINT:GOTO80
3030 IFO$<>"n"THENPRINTY$:GOTO3010
3040 PRINT"{blue}Maybe dumb ";R$(RC);" not so":PRINT"dumb after all":PRINT:END
3050 PRINT:PRINT"{yellow}GREAT UNMITIGATED ZOT!"
3060 PRINT:PRINT"You just found the orb of zot!":PRINT
3070 PRINT"The runestaff is gone":RF=0:OF=1:O(1)=0:GOTO1420
3080 DATA AN EMPTY ROOM,"+",THE ENTRANCE,"{reverse on}E{reverse off}",STAIRS GOING UP,U
3090 DATA STAIRS GOING DOWN,D,A POOL,"W",A CHEST,"{cm pound}",GOLD PIECES,$
3100 DATA FLARES,"'",A WARP,W,A SINKHOLE,S,A CRYSTAL ORB,"O"
3110 DATA A BOOK,B,A KOBOLD,M,AN ORC,M,A WOLF,M,A GOBLIN,M,AN OGRE,M
3120 DATA A TROLL,M,A BEAR,M,A MINOTAUR,M,A GARGOYLE,M,A CHIMERA,M
3130 DATA A BALROG,M,A DRAGON,M,A VENDOR,V,THE RUBY RED,T
3140 DATA THE NORN STONE,T,THE PALE PEARL,T,THE OPAL EYE,T
3150 DATA THE GREEN GEM,T,THE BLUE FLAME,T,THE PALANTIR,T,THE SILMARIL,T
3160 DATA X,.,NO WEAPON,WICH
3170 DATA DAGGER," stew",MACE," soup",SWORD," burger",NO ARMOR," roast"
3180 DATA LEATHER," munchy",CHAINMAIL," tacos",PLATE," pie"
3190 DATA HOBBIT,ELF,MAN,DWARF,T,I,A,L,I,Z,I,N," ",C,A
3200 X=FNA(8):Y=FNA(8):IFE0%(FND(Z))<>101THEN3200
3210 E0%(FND(Z))=Q:RETURN
3220 PRINT:PRINT"{yellow}You get all his wares:":PRINT:PRINT"Plate armor":AV=3:AH=21
3230 PRINT"A sword":WV=3:PRINT"A strength potion":SG=FNC(SG+FNA(6))
3240 PRINT"An intelligence potion":IQ=FNC(IQ+FNA(6))
3250 PRINT"A dexterity potion":DX=FNC(DX+FNA(6)):IFLF=0THENPRINT"A lamp":LF=1
3260 GOTO2460
3270 FORQ=1TO40:PRINT"{sh asterisk}";:NEXT:PRINT:RETURN
3280 PRINT"{yellow}Your choice";
3290 INPUTO$:O$=LEFT$(O$,1)
3291 ON(O$="")+2GOTO3290,3292
3292 RETURN
3300 PRINT"{white}How many pts. do you add to ";Z$:INPUTO$:PRINT
3310 Q=VAL(O$):IF(Q=0)AND(ASC(O$)<>48)THENQ=-1
3320 IF(Q<0)OR(Q>OT)OR(Q<>INT(Q))THENPRINT"** re-enter":GOTO3300
3330 OT=OT-Q:RETURN
3340 INPUTO$:Q=INT(VAL(O$)):RETURN
3350 PRINT:PRINTZ$;:INPUTO$:Q=INT(VAL(O$)):IF(Q>0)AND(Q<9)THENRETURN
3360 PRINT"{white}** Try a number from 1 to 8":GOTO3350
3370 PRINT:PRINT"{purple}Want to but a potion of ";Z$:PRINT"for 1000 gp's";:GOTO3290
3380 PRINT:PRINT"Your ";Z$;" is now"Q:RETURN
3390 PRINT"{white}Here is a list of ";Z$;" you can"+CHR$(13)+"buy (with cost in <>)":PRINT:RETURN
3400 x7$=mid$(str$(x),2):y7$=mid$(str$(y),2):l7$="("+x7$+","+y7$+")"
3410 print"you are at ";l7$;" - level";z:return
3500 print"hit any key to begin"
3510 geta$:ifa$<>""then3510:REM poke158,0
3520 geta$:on(a$="")+2goto3520,3530
3530 return

