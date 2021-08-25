!--------------------------------------------------
!- Saturday, May 20, 2017 1:33:59 AM
!- Import of : 
!- c:\src\zelch128\extras\emp.main.prg
!- Unknown Machine
!- *************** CURRPT -- MISSING BOTTOM STUFF AND JUST CORRUPT -- SAVE ME!!
!--------------------------------------------------
10 REM*********** CLASSIC EMPIRE -- AUTHOR UNKNOWN.
20 REM*********** CONVERTED TO ZELCH 128 FORMAT BY ELITE SOFTWARE.
30 REM*********** WILL WORK ONLY WITH ZELCH 128 IF THIS PROGRAM IS BOOTED
40 REM*********** FROM THE ZELCH SPECIFIC MODULE "emp.boot".
50 U=PEEK(186):D=0:CLOSE2:OPEN2,U,2,STR$(D)+":sys.work,s,r":INPUT#2,DT$,ID,NM$,AC$:CLOSE2:R$=CHR$(13):SCRATCH"sys.work",U(U),D(D):GOTO200
60 I$=""
70 GETA$:IFA$=CHR$(13)THENPRINT:RETURN
80 IFA$<>CHR$(20)THEN110
90 IFLEN(I$)=0THEN70
100 I$=LEFT$(I$,LEN(I$)-1):PRINTA$;:GOTO70
110 IFLEN(I$)=5THEN70
120 IFINSTR("0123456789?YySs",A$)=0THEN70
130 I$=I$+A$:PRINTA$;:GOTO70
140 PRINT:#############2,(FL$),U(UU):IFDS>0THENPRINT:CLOSE2:RETURN:ELSESYS8210:CLOSE2:RETURN
150 PRINT"{ct k}{black}{reverse on}  Hit any key to continue  ";:GETKEYA$:PRINT:RETURN
160 CO=0:PRINTQ$" (y/n) --> ";:DO:GETKEYA$:LOOPUNTILINSTR("YyNn",A$)>0
170 PRINTA$:IFA$="y"ORA$="Y"THENCO=1:RETURN:ELSERETURN
180 X=INT(RND(0)*5)+1:PRINT"{black}{ct k}"C$(X):RETURN
190 X=INT(RND(0)*5)+1:PRINTC$(X):RETURN
200 TRAP4790:CLOSE2:#############2,"emp.config",U(U):INPUT#2,M3:INPUT#2,M2:INPUT#2,UU:CLOSE2:DIMAR$(500)
210 DR$="0":FL$="emp.reqs":GOSUB140:FL$="emp.emps":GOSUB140:BQ=0
220 CLOSE2:#############2,"emp.req",U(UU):FORI=1TO10:INPUT#2,EM(I):NEXTI:CLOSE2
230 CLOSE2:#############2,"emp.players",U(UU)
240 YU=0:AC=0
250 YU=YU+1:IFYU>M2THEN290:ELSE##################2,YU,1:INPUT#2,N$
260 IF(N$="empty")AND(AC=0)THENAC=YU
270 IFN$=NM$ THEN AC=YU:GOTO330
280 GOTO250
290 IFAC=0THENPRINT"{ct k}{black}Sorry, no room for you!{ct k}Try again tomorrow!":END
300 PRINT"{ct k}{black}Welcome, new warlord!{ct k}Setting up your *EMPIRE* ..."
310 CLOSE2:LA=5000:WA=20:SF=INT(RND(0)*1000)+2000:NB=2:GR=10000:TR=15:PN=1000:I1=0:I2=0:I3=0:I4=0:I5=0:I6=0:I7=0:I8=0:Q0=0:I9=0:Q1=0:Q2=0:Q3=0:GOSUB1540:E2=E2-1
320 PRINT"{ct k}{black}Welcome to EMPIRE!{ct k}":GOTO420
330 C$(1)="Opening the Gates...":C$(2)="Entering your realm...":C$(3)="Rolling out the red carpet...":C$(4)="Crossing into unknown territory..."
340 C$(5)="This might be your lucky day...":GOSUB180
350 IFAC$="Z"THENPRINT"{ct k}{white}* {cyan}Sysop access recognized,{ct k}  Press [Z] at main menu to reset game."
360 ##################2,YU,1:INPUT#2,N$,LA,WA,SF,NB,GR,TR,PN,I1,I2,I3,I4,I5,LD$,E2,I6,I7,I8,Q0,I9,Q1,Q2,Q3
370 CLOSE2:IFE2>M3THENPRINT"{ct k*2}{black}No more plays left today!":END
380 GOSUB4570
390 CLOSE2:OPEN2,UU,2,"emp.msg":IFDSTHENCLOSE2:GOTO420
400 INPUT#2,M1$:SYS8222:CLOSE2:PRINT"{ct k*2}{black}Message from "M1$":{ct k}{f5}"I$"{f5}"
410 CLOSE2:OPEN2,UU,2,"emp.news":INPUT#2,DA$:CLOSE2:IFRIGHT$(DA$,8)=LEFT$(DT$,8)THEN440
420 CLOSE15:OPEN15,UU,15,"s0:emp.news":CLOSE15:CLOSE2:OPEN2,UU,2,"emp.news,s,w":PRINT#2,"Activity Recorded On "+LEFT$(DT$,8)
430 PRINT#2," ":CLOSE2
440 PRINT"{ct k*2}{black}What Now M'Lord "NM$"> <{left*2}";:GOSUB4810
450 IFI$="?"THENFL$="emp.menu1":GOSUB140:GOTO440
460 IFI$="Y"THENGOSUB1590:GOTO440
470 IFI$="O"THENGOSUB650:GOTO440
480 IFI$="N"THENFL$="emp.news":GOSUB140:GOTO440
490 ONINSTR("GRCZQ",I$)GOTO510,610,710,4600,4660
500 GOTO440
8857 {ct k}{ct k}STOP{reverse on}  VALRCLRRDOTRIGHT$HEX$VAL RGRJOYINSTRINSTRVALHEX$TROFF  {ct k}":og{cm r}{cm j}({cm f}(0){cm d}3{cm n}3):{light green}"{ct k}JOYSTR$STR$ERR$ ATNHEX$VAL:"D(og){cm n}"-1"
520 PRINT"{black}You currently have $"STR$(PN)
530 PRINT"{ct k}{black}Wager How Much (0=Quit):";:GOSUB60:W=ABS(INT(VAL(I$))):IFW=0THEN440
540 IFW>5000THENPRINT"{ct k}{black}$5000 maximum bet.":GOTO510
550 IFW>PNTHENPRINT"{ct k}{black}You Only have $"STR$(PN):GOTO510
560 IFPN>100000THENPRINT"{ct k}{black}$100,000 ceiling on winnings!":GOTO440
570 RE=INT(RND(TI)*OG)+1
580 PRINT"{ct k}{black}Pick a number from 1 to"STR$(OG)":";:GETKEYI$:PRINTI$:G=VAL(I$):IFG<1ORG>OGTHEN580
590 PRINT"{ct k}{black}Winning Number:"STR$(RE):IFRE=GTHENPN=PN+W*OG:PRINT"{ct k}{black}{reverse on}{ct g}You{sh space}WIN $"STR$(W*OG):GOTO510
600 PRINT"{ct k}{black}You can't win 'em all...":PN=PN-W:GOTO510
610 PRINT"{ct k*2}{black}{reverse on}  CHANGE TAX RATE  {ct k}"
620 PRINT"{ct k}{black}Current Tax Rate     ="STR$(TR)"%"
630 PRINT"New Tax Rate (max=50)? ";:GOSUB60:W=VAL(I$):IFW>50THENPRINT"{ct k}{black}50% is the maximum tax rate!{ct k}":GOTO610
640 TR=W:PRINT"{ct k}{black}Tax rate now"+STR$(TR)+"%":GOTO440
650 PRINT"{ct k*2}{black}{reverse on}  OTHER WARLORDS  {ct k}"
660 CLOSE2:#############2,"emp.players",U(UU)
670 FOR PL = 1 TO M2:##################2,PL,1:INPUT#2,N$:IFN$="empty"THEN700
680 ##################2,PL,1:INPUT#2,N$,LN
690 IFN$<>"empty"THENPRINT"{black}#"RIGHT$(STR$(PL),LEN(STR$(PL))-1)"  "N$" has"STR$(LN)" acres.":IFAB=1THENCLOSE2:GOSUB150:PL=M2+1:GOSUB150:RETURN
700 NEXTPL:CLOSE2:GOSUB150:RETURN
710 HV=INT(LA*2.7*RND(0)+SF*7.5*RND(0)+I3*99*RND(0)):IFHV>(LA+SF)*4THENHV=(LA+SF)*4
720 GR=GR+HV:PRINT"{ct k*2}{black}This years harvest was"STR$(HV)" bushels."
730 PRINT"{ct k*2}{black}You have"STR$(LA)" acres."
740 PRINT"[B]uy, [S]ell, [C]ontinue =>";:GOSUB4810:ONINSTR("BCS",I$)GOTO770,860,810
750 IFI$="Y"THENGOSUB1590
760 GOTO730
770 PRINT"{ct k}{black}The highlanders will sell their land{f7}for $25 per acre."
780 PRINT"{ct k}Buy how many? ";:GOSUB60:W=VAL(I$)
790 IFW=<0THEN730:ELSEIF(W*25)>PNTHENPRINT"{ct k}{ct g}{black}You dont have enough money.":GOTO770
800 PN=PN-(W*25):LA=LA+W:PRINT"{ct k}{black}Bought!":GOTO730
810 PRINT"{ct k}{black}The highlanders will buy your land{f7}for $10 per acre."
820 PRINT"{ct k}Sell how many? ";:GOSUB60:W=VAL(I$)
830 IFW<1THEN810
840 IFW+1>LATHENPRINT"{ct k}{ct g}{black}You do not have that many acres":GOTO810
850 PN=PN+(W*10):LA=LA-W:PRINT"{ct k}{black}Sold!":GOTO730
860 PRINT"{ct k*2}{black}You have"STR$(GR)" bushels."
870 PRINT"[B]uy, [S]ell, [C]ontinue =>";:GOSUB4810:ONINSTR("BCS",I$)GOTO900,1000,950
880 IFI$="Y"THENGOSUB1590
890 GOTO860
900 PRINT"{ct k}{black}The highlanders will sell you grain for{f7}$1.00 a bushel."
910 PRINT"{ct k}Buy how many? ";:GOSUB60:W=VAL(I$)
920 IFW=<0THEN860
930 IFW>PNTHENPRINT"{ct k}{black}You do not have enough money.":GOTO910
940 GR=GR+W:PN=PN-W:PRINT"{ct k}{black}Bought!":GOTO1000
950 PRINT"{ct k}{black}The highlanders buy your grain for{f7}$.50 a bushel."
960 PRINT"{ct k}Sell how many? ";:GOSUB60:W=VAL(I$)
970 IFW=<0THEN860
980 IFW>GRTHENPRINT"{ct k}{black}You do not have enough grain.":GOTO960
990 GR=GR-W:PN=PN+INT(W*.5):PRINT"{ct k}{black}Sold!":GOTO860
1000 PR=(SF*5):AR=(WA*8+1):PRINT"{ct k*2}{black}Press [RETURN] to give the{ct k}requested amount."
1010 PRINT"{ct k}{black}Your people need"STR$(PR)" bushels.{ct k}Give them how many: ";:GOSUB60
1020 IFI$=""THENGP=PR:GOTO1060
1030 IFI$="y"THENGOSUB1590:GOTO1010
1040 IFVAL(I$)<0THEN1010
1050 GP=VAL(I$)
1060 IFGP>GRTHENPRINT"{ct k}{black}You do not have enough grain":GOTO1010
1070 GR=GR-GP
1080 PRINT"{ct k}{black}Your army needs"STR$(AR)" bushels.{ct k}Give them how many: ";:GOSUB60
1090 IFI$=""THENGA=AR:GOTO1130
1100 IFI$="y"THENGOSUB1590:GOTO1080
1110 IFVAL(I$)<0THEN1080
1120 GA=VAL(I$)
1130 IFGA>GRTHENPRINT"{ct k}{black}You do not have enough grain":GOTO1080
1140 GR=GR-GA
1150 DN=INT(RND(0)*(SF/10)+30):BB=INT(RND(0)*(SF/12)+10):PI=(INT(RND(0)*(SF/15)+10)):AF=0
1160 PRINT"{ct k*3}{black}{reverse on}STATUS REPORT:{reverse off} "NM$R$
1170 GD=GP/PR:AD=GA/AR:PZ=.
1180 IFGD<1THENPZ=INT((PR-GP)/5)-INT(RND(0)*(PR-GP)/5+30)
1190 PZ=PZ*ABS(PZ>.):ON-(GD>.8 OR GD>RND(0))GOTO1230
1200 PRINT"{ct k*2}{black}EMPIRE Ransacked by Starving Serfs!":AP$=NM$+" attacked by starving serfs.":GOSUB1630
1210 I1=I1-INT(RND(0)*I1):I2=I2-INT(RND(0)*I2):I3=I3-INT(RND(0)*I3):I3=I3-INT(RND(0)*I3):I4=I4-INT(RND(0)*I4):I5=I5-INT(RND(0)*I5):WA=.:PN=.
1220 GR=.:NB=INT(RND(0)*(NB*.5)):SF=INT(RND(0)*(SF*.5)):LA=1+INT(RND(0)*(LA*.5)):GOTO1280
1230 TP=BB+PI-PZ-DN:KG$="Gained":IFTP<0THENKG$="Lossed"
1240 SF=SF+TP:SF=SF*ABS(SF>.)
1250 PRINT"{black}Serfs Starved .......{white}"STR$(PZ)"{ct k}{black}Babies Born .........{white}"STR$(BB)"{ct k}{black}Peons Died ..........{white}"STR$(DN)"{ct k}{black}People Immigrated ...{white}"STR$(PI)
1260 PRINT"{black}Vassels "KG$" ......{white}"STR$(ABS(TP))"{ct k}{black}Total Population ....{white}"STR$(SF)
1270 TX=INT(((GP-PR)*(TR/100))/2):IFTX>0THENPRINT"{ct k}{black}Taxes Generated Were {white}$"STR$(TX)"!":PN=PN+TX
1280 AF=0:IFGA<ARTHENPRINT"{ct k}{black}Your army is on strike!":AF=1
1290 GOSUB150
1300 PRINT"{ct k*2}{black}Which Investment [0=None,?=List] =>";:GOSUB4810:W=VAL(I$)
1310 IFI$="?"THENFL$="emp.menu3":GOSUB140:GOTO1300
1320 IFI$="Y"THENGOSUB1590:GOTO1300
1330 IFI$="S"THEN1450
1340 IFI$="0"THEN1660:ELSEIFW=0THEN1300
1350 A$="{ct k}{black}You now have":ONWGOTO1360,1370,1380,1390,1400,1410,1420,1430,1440
1360 IV$="Soldier":PC=10:GOSUB1460:IFW=0THEN1300:ELSEWA=WA+W:PRINTA$;WA;IV$:GOTO1300
1370 IV$="Market":PC=1000:GOSUB1460:IFW=0THEN1300:ELSEI1=I1+W:PRINTA$;I1;IV$:GOTO1300
1380 IV$="Mill":PC=2000:GOSUB1460:IFW=0THEN1300:ELSEI2=I2+W:PRINTA$;I2;IV$:GOTO1300
1390 IV$="Palace":PC=10000:GOSUB1460:IFW=0THEN1300:ELSEI3=I3+W:NB=NB+W:PRINTA$;I3;"0% palace{ct k}and"NB" warlords.":GOTO1300
1400 IV$="Foundry":PC=7000:GOSUB1460:IFW=0THEN1300:ELSEI4=I4+W:PRINTA$;I4;IV$:GOTO1300
1410 IV$="Shipyards":PC=8000:GOSUB1460:IFW=0THEN1300:ELSEI5=I5+W:PRINTA$;I5;IV$" (capacity is"I5*2")":GOTO1300
1420 IV$="Brothels":PC=50000:GOSUB1460:IFW=0THEN1300:ELSEI6=I6+W:PRINTA$;I6;IV$:GOTO1300
1430 IV$="Warlords":PC=25000:GOSUB1460:IFW=0THEN1300:ELSENB=NB+W:PRINTA$;NB;IV$:GOTO1300
1440 IV$="Trap/Detector":PC=75000:GOSUB1460:IFW=0THEN1300:ELSEI7=I7+W:I8=I8+W:PRINTA$;I7;" traps{ct k}and"I8" detectors.":GOTO1300
1450 IV$="Ship":PC=5000:GOSUB1460:IFW=0THEN1300:ELSEQ0=Q0+W:PRINTA$;Q0;IV$:GOTO1300
1460 MA=INT(PN/PC):IFIV$="Soldier"THENIFMA+WA>NB*20 THEN MA=NB*20-WA
1470 IFIV$="Palace"THENIFMA+I3>10THENMA=10-I3
1480 IFIV$="Ship"THENIFMA>((I5*2)-Q0)THENMA=(I5*2)-Q0
1490 IFMA<0THENMA=0
1500 PRINT"{ct k*2}{black}Investment: {white}"IV$"{ct k*2}{black}Buy how many [Max ="MA"] =>";:GOSUB60
1510 IFI$=""THENW=0:RETURN
1520 W=VAL(I$):IFW>MATHENPRINT"{ct k}{black}You cannot buy that many!":GOTO1460
1530 PN=PN-(W*PC):IV$=IV$+"s.":RETURN
1540 CLOSE2:#############2,"emp.players",L150,U(UU):##################2,AC,1:Z$=","
1550 I$=NM$+Z$+STR$(LA)+Z$+STR$(WA)+Z$+STR$(SF)+Z$+STR$(NB)+Z$+STR$(GR)+Z$+STR$(TR)+Z$+STR$(PN)+Z$+STR$(I1)+Z$+STR$(I2)+Z$+STR$(I3)+Z$+STR$(I4)+Z$+STR$(I5)
1560 IFLD$<>DT$THENE2=0
1570 E2=E2+1:LD$=DT$:I$=I$+Z$+DT$+Z$+STR$(E2)+Z$+STR$(I6)+Z$+STR$(I7)+Z$+STR$(I8)+Z$+STR$(Q0)+Z$+STR$(I9)+Z$+STR$(Q1)+Z$+STR$(Q2)+Z$+STR$(Q3)
1580 PRINT#2,I$:CLOSE2:I$="":RETURN
1590 PRINT"{ct k*2}{black}{reverse on} "NM$" {ct k}"
1600 PRINT"{black}Land      :{white}"LA" Acres     $"PN"{ct k}{black}Serfs     :{white}"SF"{ct k}{black}Soldiers  :{white}"WA"{ct k}{black}Bushels   :{white}"GR"{ct k}{black}Tax Rate  :{white}"TR"%{ct k}{black}Warlords  :{white}"NB"{ct k}{black}Markets   :{white}"I1
1610 PRINT"{black}Mills     :{white}"I2"{ct k}{black}Palace    :{white}"I3*10"%{ct k}{black}Foundries :{white}"I4"{ct k}{black}Shipyards :{white}"I5"{ct k}{black}Brothels  :{white}"I6"{ct k}{black}Traps     :{white}"I7"{ct k}{black}Detectors :{white}"I8"{ct k}{black}Ships     :{white}"Q0
1620 PRINT"{black}Colonies  :{white}"I9:RETURN
1630 C$(1)="Spreading the news...{ct k}":C$(2)="Printing the news...{ct k}":C$(3)="Lettin' everyone know about this!{ct k}"
1640 C$(4)="The town crier is tellin' everyone!!{ct k}":C$(5)="The others will be excited to hear this!{ct k}":GOSUB180
1650 CLOSE8:OPEN8,UU,8,"emp.news,s,a":PRINT#8,AP$:CLOSE8:RETURN
1660 RW=0:Q4=0:Q5=0:IFQ0=0THENPRINT"{ct k*2}{black}You have no ships, you cannot sail to{f7}colonies during this turn...":22222222222:GOTO3120
1670 Q$="{ct k}{black}Take a trip to colonies":GOSUB160:IFCO=0THEN3120
1680 FL$="emp.colony":GOSUB140
1690 GOTO1720
1700 PRINT"{ct k}{black}Colony Stats:{ct k}{black}Cash           {white}$"PN"{ct k}{black}Colony grain   :{white}"Q1"{ct k}{black}Serfs          :{white}"Q2+RW"{ct k}{black}Ships          :{white}"Q0"{ct k}{black}Navigators     :{white}"Q5
1710 PRINT"{black}Warlords       :{white}"Q4"{ct k}{black}Exports        :{white}"Q3"{ct k}{black}Colonies       :{white}"I9"{ct k}":RETURN
1720 PRINT"{ct k}{black}You Have"Q0" ships."
1730 PRINT"Manifest [?=List,0=Done] =>";:GOSUB4810
1740 IFI$="Y"THENGOSUB1700:GOTO1720
1750 IFI$="?"THENFL$="emp.manif":GOSUB140:GOTO1720
1760 IFI$="0"THEN2050
1770 I=VAL(I$):IF(I<1)OR(I>4)THEN1720
1780 ON(I)GOTO1800,1860,1950,2000
35209 GOTOGOTOGOTOGOTO1720
1800 MG=25000-Q1:IFMG<0 THEN MG=0
1810 IFMG>GRTHENMG=GR
1820 PRINT"{ct k}{black}Load Grain [Max ="MG"] =>";:GOSUB60
1830 IFI$=""THEN1720
1840 LG=VAL(I$):IFLG>MGTHENPRINT"{ct k}{black}You may bring only"MG" bushels!":GOTO1820
1850 Q1=Q1+LG:GR=GR-LG:PRINT"{ct k}{black}You now have"Q1" bushels.":GOTO1720
1860 MG=Q0*50-RW:IFMG<0 THEN MG=0:GOTO1900
1870 IF MG>(I9*100)-RW-Q2 THEN MG=(I9*100)-RW-Q2
1880 IFI9=0THENMG=50-RW-Q2:IFMG<0THENMG=0
1890 IFMG<0THENMG=0
1900 PRINT"{ct k}{black}Load Serfs [Max ="MG"] =>";:GOSUB60
1910 IFI$=""THEN1720
1920 LG=VAL(I$):IFLG>MGTHENPRINT"{ct k}{black}You may bring only"MG" serfs!":GOTO1900
1930 RW=RW+LG:GOTO1720
1940 IFI9=0THENMG=50
1950 MG=NB-Q4:IFMG<0THENMG=0
1960 PRINT"{ct k}{black}Bring Warlords [Max ="MG"] =>";:GOSUB60
1970 IFI$=""ORVAL(I$)=0THEN1720
1980 LG=VAL(I$):IF(LG<1)OR(LG>MG)THENPRINT"{ct k}{black}The maximum is"MG" warlords":GOTO1960
1990 NB=NB-LG:Q4=Q4+LG:PRINT"{ct k}{black}You now have"Q4" warlords.":GOTO1720
2000 MG=INT(PN/2000)
2010 PRINT"{ct k}{black}Bring Navigators [Max ="MG"] =>";:GOSUB60
2020 IFI$=""ORVAL(I$)=0THEN1720
2030 LG=VAL(I$):IF(LG<1)OR(LG>MG)THENPRINT"{ct k}{black}The maximum is"MG" navigators.":GOTO2010
2040 Q5=Q5+LG:PN=PN-2000*LG:PRINT"{ct k}{black}You now have"Q5" navigators.":GOTO1720
2050 PRINT"{ct k*2}{black}Setting sail for colonies...":11111111111:GOSUB4830
2060 11111111111:PRINT"{ct k}{black}Docking at colony(s)...":11111111111
2070 CP=INT(INT(RND(0)*5500*(I9))):IF(Q2<>0)AND(I9<>0)THENCP=CP*(Q2/(I9*100))
2080 CP=CP+INT(RND(0)*20000):IFCP+Q1>100000THENCP=INT(100000-Q1)
2090 CP=INT(CP):Q1=Q1+CP:Q2=Q2+RW:RW=0
2100 PRINT"{ct k}{black}Colony(s) produce"STR$(CP)" bushels{ct k}of grain."
2110 PRINT"{ct k}{black}Bushels can be converted into exports{ct k}to be sold back at empire for cash!"
2120 33333333333:GOSUB1700
2130 PRINT"{ct k}{black}You have"STR$(Q3)" tons of exports."
2140 PRINT"[A]quire  [T]rade  [C]ontinue =>";:GOSUB4810:ONINSTR("CAT",I$)GOTO2270,2170,2220
2150 IFI$="Y"THENGOSUB1700
2160 GOTO2130
2170 PRINT"{ct k}{black}Aquire Exports{ct k}(2000 bushels = 1 ton)"
2180 PRINT"Aquire how many? ";:GOSUB60:IFI$=""THEN 2130
2190 IFVAL(I$)=0THEN2130
2200 X=VAL(I$):XX=X*2000:IF(XX)>(Q1)THENPRINT"{ct k}{black}You only have"STR$(Q1)" bushels...":GOTO2130
2210 Q3=Q3+X:Q1=Q1-X*2000:GOTO2130
2220 PRINT"{ct k}{black}Trade Exports{ct k}(Indians offer 800 bushels of grain/ton)"
2230 PRINT"{black}Trade how many tons? ";:GOSUB60:IFI$=""THEN2130
2240 IFVAL(I$)=0THEN2130
2250 X=VAL(I$):IFX>Q3THENPRINT"{ct k}{black}You only have"STR$(Q3)" tons...":GOTO2130
2260 Q3=Q3-X:Q1=Q1+X*800:GOTO2130
2270 IFQ0<2 THEN 2410
2280 PRINT"{ct k}{black}You have"STR$(Q0)" ships at colony"
2290 PRINT"[M]ake  [B]each  [C]ontinue =>";:GOSUB4810:ONINSTR("MBC",I$)GOTO2320,2370,2410
2300 IFI$="Y"THENGOSUB1700
2310 GOTO2280
2320 PRINT"{ct k}{black}Make ships from colonies{ct k}(One colony creates 2 ships)"
2330 PRINT"{ct k}{black}Dismantle how many colonies? ";:GOSUB60:IFI$=""THEN2280
2340 X=VAL(I$):IFX=0THEN2280
2350 IFX>I9THENPRINT"{ct k}{black}You only have"STR$(I9)" colonies...":GOTO2280
2360 Q0=Q0+2*X:I9=I9-X:GOTO2280
2370 PRINT"{ct k}{black}Beach ships to create colonies{ct k}(5 ships creates 1 colony...)"
2380 PRINT"{ct k}{black}Build how many colonies? ";:GOSUB60:IFI$=""ORVAL(I$)=0THEN2280
2390 X=VAL(I$):IFX*5>Q0THENPRINT"{ct k}{black}You only have"STR$(Q0)" ships...":GOTO2280
2400 Q0=Q0-5*X:I9=I9+X:GOTO2280
2410 GOSUB1700:PR=INT((10+Q2)*RND(0)*5):WR=INT((Q4)*RND(0)*150+1):IR=INT(RND(0)*(I9+1)*125)*2
2420 PRINT"{ct k}{black}Press [RETURN] to give{ct k}the requested amount."
2430 PRINT"{ct k}{black}People want"STR$(PR)" bushels."
2440 PRINT"Give how many? ";:GOSUB60:IFI$=""THENGP=PR:GOTO2470
2450 IFI$="y"THENGOSUB1700:GOTO2430
2460 GP=VAL(I$):IFGP<0THEN2430
2470 IFGP>Q1THENPRINT"{ct k}{black}You only have"STR$(Q1)" bushels...":GOTO2430
2480 Q1=Q1-GP
2490 PRINT"{ct k}{black}Warlords want"STR$(WR)" Bushels."
2500 PRINT"Give how many? ";:GOSUB60:IFI$=""THENGW=WR:GOTO2530
2510 IFI$="y"THENGOSUB1700:GOTO2490
2520 GW=VAL(I$):IFGW<0THEN2490
2530 IFGW>Q1THENPRINT"{ct k}{black}You only have"STR$(Q1)" bushels..":GOTO2490
2540 Q1=Q1-GW:XZ=INT(RND(0)*2)+1
2550 IFXZ=1THENPRINT"{ct k}{black}Indian peace offering!!":IG=IR:PRINT"They give you"STR$(IG)" bushels!":GI=IR:GOTO2620
2560 PRINT"{ct k*2}{black}Indians want"STR$(IR)" bushels..."
2570 PRINT"Give how many? ";:GOSUB60:IFI$=""THENGI=IR:GOTO2600
2580 IFI$="y"THENGOSUB1700:GOTO2560
2590 GI=VAL(I$):IFGI<0THEN2560
2600 IFGI>Q1THENPRINT"{ct k}{black}You only have"STR$(Q1)" bushels...":GOTO2560
2610 Q1=Q1-GI
2620 IFGP=>PRTHEN2690
2630 PRINT"{ct k*2}{black}People revolt!"
2640 CC=INT(RND(0)*(I9/2)):PRINT"{ct k}{black}They have destroyed"STR$(CC)" colonies...":I9=I9-CC
2650 CC=INT(RND(0)*I9*100):Q2=Q2-CC:IFQ2=<0 THEN Q2=INT(RND(0)*50)
2660 PRINT"{black}Only"STR$(Q2)" serfs escape starvation..."
2670 PRINT"All of your exports have been stolen!":Q3=0
2680 22222222222:GOTO2690
2690 IFGW=>WRTHEN2770
2700 PRINT"{ct k*2}{black}Warlords declare mutiny!"
2710 CC=INT(RND(0)*(I9/2)):PRINT"They attack & destroy"STR$(CC)" colonies...":I9=I9-CC
2720 PRINT"{black}All of your exports are being thrown{ct k}overboard!!"
2730 Q3=0:Q4=INT(RND(0)*(Q4/2))
2740 IFQ4=0THENPRINT"{black}All of your warlords have deserted you!":GOTO2760
2750 PRINT"{black}All but"STR$(Q4)" warlord(s) desert you!"
2760 11111111111
2770 IFGI=>IRTHEN2820
2780 PRINT"{ct k*2}{black}Indians mount a raid on you..."
2790 CC=INT(RND(0)*(I9/2)):PRINT"{black}They take over"STR$(CC)" colonies...":I9=I9-CC
2800 WK=INT(RND(0)*(Q4/3)):PRINT"{black}They've killed"STR$(WK)" warlords...":Q4=Q4-WK
2810 PRINT"{black}They steal every bit of grain and every{ct k}ton of export they can find...":Q1=0:Q3=INT(RND(0)*(Q3/2))
2820 11111111111:PRINT"{ct k}{black}Loading ship(s) for return voyage..."
2830 ZZ=I9*2000:IFQ2>ZZTHENQ2=I9*1000
2840 PRINT"{ct k}{black}Your"STR$(Q0)" ships can{ct k}hold"STR$(Q0*2)" tons..."
2850 RE=Q3:IFRE>Q0*2THENRE=Q0*2
2860 11111111111
2870 PRINT"{ct k*2}{black}Tonage Loaded =>"STR$(Q3)" tons."
2880 11111111111
2890 IFRE<>Q3THENPRINT"{ct k}{black}Indians steal"STR$(Q3-RE)" tons!":Q3=RE
2900 PRINT"{ct k}{black}Your ships leave with"STR$(Q3)" tons{ct k}in their hulls."
2910 PRINT"{black}Setting sail for empire...":11111111111:GOSUB4830
2920 IFQ3>Q0*2THENQ3=INT(RND(0)*Q3)+1
2930 11111111111:NB=NB+Q4:PRINT"{black}{ct k*2}Docking at the Market..."
2940 22222222222:PRINT"{black}Crew unloads ships, {ct k}and"STR$(Q3)" tons survived the voyage.":LD=0
2950 IFQ3=0THENPRINT"{ct k}{black}No Exports?!?  The market master laughs!":22222222222:GOTO3090
2960 IA=INT(RND(0)*9500)+500
2970 LD=LD+1:IFLD>3THENPRINT"{ct k*2}{black}Market master closes up shop...":22222222222:GOTO3090
2980 PRINT"{ct k}{black}Market Master offers $"STR$(IA)"."
2990 PRINT"[S]ell  [B]arter  [H]old  =>";:GOSUB4810:ONINSTR("BSH",I$)GOTO2960,3020,3090
3000 IFI$="Y"THENGOSUB1700
3010 GOTO2980
3020 PRINT"{ct k}{black}Sell how many tons{ct k}(You have"Q3" tons){ct k}>";:GOSUB60:IFI$=""THEN2980
3030 AX=VAL(I$):IFAX=<0THEN2980
3040 IFAX>Q3THENPRINT"{ct k}{black}You only have"STR$(Q3)" tons.":GOTO2980
3050 PRINT"{ct k}{black}Gross Profit  : {white}$"STR$(AX*IA):IQ=INT(RND(0)*15)+21:IQ=IQ/100
3060 PRINT"{black}Import Taxes  : {white}$"STR$(INT(AX*IA*IQ))"    ("STR$(IQ)"% )"
39321 PRINTPRINTPRINTPRINTPRINTPRINTPRINTPRINTPRINT"{black}Net Profit    : {white}$"STR$(AX*IA-INT(AX*IA*IQ))
3080 11111111111:Q3=Q3-AX:PN=PN+(AX*IA-INT(AX*IA*IQ)):GOTO3090
3090 AX=INT(RND(0)*Q3+5):IFAX>Q3THEN3110
3100 PRINT"{ct k}{black}Spoilage consumes"STR$(AX)" ton(s).":Q3=Q3-AX
3110 22222222222:PRINT"{ct k}{black}Warlords are returning to battlefield...":22222222222
3120 BT=0:FF=0:IF(AF=1)OR(WA<1)THENPRINT"{ct k}{black}Your army is immobilized!":GOTO4210
3130 PRINT"{ct k*2}{black}Attack Whom [0=None, ?=List] =>";:GOSUB60
3140 IFI$="0"THENC$(1)="Coward!!":C$(2)="The townfolks laugh..":C$(3)="Other warlords chuckle...":C$(4)="King George thinks you're a wimp!"
3150 IFI$="0"THENC$(5)="Your girlfriend deserts you...":GOSUB180:GOTO4210
3160 IFI$="y"ORI$="Y"THENGOSUB1590:GOTO3130
3170 IFI$="?"THENGOSUB650:GOTO3120
3180 AT=VAL(I$):IF(AT<1)OR(AT>24)THENGOTO3240
3190 CLOSE2:#############2,"emp.players",U(UU):##################2,AT,1:INPUT#2,N$:IFN$="empty"THENCLOSE2:GOTO3240
3200 ##################2,AT,1:INPUT#2,EN$,EA,EW,EP,EN,EG,ET,EM,V1,V2,V3,V4,V5,AD$,AD,V6,V7,V8,K0,V9,K1,K2,K3
3210 CLOSE2:PRINT"{ct k}{black} => Enemy: "EN$" <={ct k} => Land:"STR$(EA)" acres"
3220 Q$="{ct k}Is this correct":GOSUB160
3230 IFCO=0THEN3120:ELSE3250
3240 PRINT"{ct k}{black}Invalid #!":GOTO3120
3250 IFEN$=NM$THENPRINT"{ct k}{black}You cannot fight yourself!":GOTO3120
3260 II=0
3270 II=II+1:IFII>BQTHENBQ=BQ+1:AR$(BQ)=EN$:GOTO3300
3280 IFAR$(II)=EN$THENPRINT"{ct k}{black}You fought them already!":GOTO3120
3290 GOTO3270
3300 IFV7<1 THEN 3360
3310 PRINT"{ct k*2}{black}You hit a trap!":22222222222
3320 IFI8<1THENPRINT"{black}{ct k}Theres nothing you can do!":N1=INT(LA/(RND(0)*3+2)):N2=INT(SF/(RND(0)*3+2)):N3=INT(WA/(RND(0)*3+2)):N4=INT(GR/(RND(0)*3+2))
3330 IFI8<1THENLA=LA-N1:SF=SF-N2:WA=WA-N3:GR=GR-N4:EA=EA+N1:EP=EP+N2:EW=EW+N3:EG=EG+N4:PRINT"{ct k}{black}Your enemy confiscated some of your{ct k}posessions..."
3340 IFI8<1THENAP$=NM$+" HITS TRAP OF "+EN$:GOSUB1630:V7=V7-1:22222222222:GOTO3360
3350 PRINT"{ct k}{black}Your detector gave early enough{ct k}warning to save your army.":I8=I8-1:V7=V7-1:AP$=NM$+" DETECTS TRAP OF "+EN$:GOSUB1630
3360 IF(AF=1)OR(WA<1)THENPRINT"{ct k}You are unable to employ your army.":GOTO4170
3370 PRINT"{ct k}{black}Battle Command [?=List] =>";:GOSUB4810:IFI$="?"THENFL$="emp.menu2":GOSUB140:GOTO3370:ELSEW=VAL(I$):IFI$="Y"THENGOSUB1590:GOTO3370
3380 ONWGOTO3390,3620,3680,3780,4170:GOTO3370
3390 IF FF=1 THEN PRINT"{ct k}{black}Only one battle!":GOTO3360
3400 PRINT"{ct k*2}{black}*Attack Army*"
3410 A=(WA+LA)/(EW+EA):IF(A>1)OR(RND(0)<A)THEN3440
3420 PRINT"{ct k}{ct g}{black}You suprised them!"
3430 A=INT(RND(0)*EW):EW=EW-A:PRINT"And"STR$(A)" enemy soldiers died!":GOTO3470
3440 A=(EW+EA)/(WA+LA):IF(A>1)OR(RND(0)<A)THEN3470
3450 PRINT"{ct k}{ct g}{black}You're AMBUSHED!"
3460 A=INT(RND(0)*WA):WA=WA-A:PRINT"And"STR$(A)" of your soldiers died!":GOTO3470
3470 PRINT"{ct k}{black}[+PLUS]=Enemy Death  [-MINUS]=Your Death{ct k}{white}":FORW1=1TO38:PRINT"{sh asterisk}";:NEXT:PRINT
3480 FF=1:PV=1:SR=EW:SG=WA
3490 IFRND(0)*50+(WA*.05)+(LA*.002)>RND(0)*50+(EW*.+05)+(EA*.002)THEN3520
3500 PRINT"{black}-    Your {reverse on}DEATH":WA=WA-1:IFWA<1THENPV=1:EW=INT(EW+RND(0)*(SR-EW)):GOTO3590
3510 GOTO3490
3520 PRINT"{red}+   {black}Enemy DEATH":EW=EW-1:IFEW>.THEN 3490
3530 AP$=NM$+" DEFEATS "+EN$:PRINT"{ct k*2}{black}Your army has come out victorious!":LT=ABS(INT(WA*.9+265+RND(0)*300+RND(0)*200+EA*.04)):IFLT>EATHENLT=EA
3540 PRINT"{black}Your"STR$(WA)" remaining soldiers manage to{ct k}claim"STR$(LT)" enemy acres.":LA=INT(LA+LT):EA=INT(EA-LT):GOSUB1630
3550 PRINT"{ct k}{black}You now control"STR$(LA)" acres!"
3560 IFWATHENEW=INT(EN*20/2+RND(0)*(EN*20/2))
3570 IFEA<1THENPRINT"{ct k*2}{black}"EN$" has DIED!":GOTO3610
3580 PRINT"{black}{ct k}"EN$" has"STR$(EA)" acres left":GOTO4170
3590 AP$=NM$+" IS DEFEATED BY "+EN$:PRINT"{ct k*2}{black}Defeated!  But your remaining warlords":LT=(ABS(SR-EW))
3600 LT=ABS(INT(LT*RND(0)*4)+100):PRINT"manage to claim"STR$(LT)" enemy acres.":LA=(LA+LT):EA=INT(EA-LT):GOSUB1630:GOTO3560
3610 AP$=NM$+" KILLS "+EN$:GOSUB1630:CLOSE2:OPEN2,UU,2,"emp.players":##################2,AT,1:PRINT#2,"empty":CLOSE2:SF=SF+EP:PN=PN+EM:GOTO4210
3620 PRINT"{ct k}{black}*Attack Palace*":
3630 IFV3<1THENPRINT"{ct k}{black}They don't have a palace!":GOTO3360
3640 IFRND(0)*WA<RND(0)*EW*2 THEN 3750
3650 V3=V3+(V3>.):EN=EN+(EN>.):IFEW>EN*20THENEW=EN*20
3660 PRINT"{ct k}{black}You destroy 10% Of Their Palace, But"
3670 SL=INT(RND(0)*WA*.3):GOTO3770
3680 PRINT"{ct k}{black}Attack Warlord{ct k}"
3690 IFINT(RND(0)*WA)<INT(RND(0)*EW*1.7)THEN 3750
3700 IFEN<2THENPRINT"{ct k}{black}You cannot find any Warlords!":GOTO3360
3710 IFNB>INT(LA/1000)THENPRINT"{ct k*2}{black}Your other nobles threaten to strike!!":GOTO3360
3720 C$(1)="You have beheaded an enemy warlord!":C$(2)="You've bribed an enemy warlord!":C$(3)="You capture an enemy warlord!"
3730 C$(4)="You snuck up on a warlord and{ct k}mutilated his body!":C$(5)="An enemy warlord surrenders to you...":GOSUB180
3740 EN=EN-1:NB=NB+1:SL=INT(RND(0)*WA*.3)+1:GOTO3780
3750 SL=INT(RND(0)*(WA*.3))+2:IFWA<1THENWA=.
3760 PRINT"Guards appear out of no where and halt{ct k}your attack."
3770 PRINT"You lost"STR$(SL)" soldiers in the process":WA=WA-SL:GOTO3360
3780 IFBT=1THENPRINT"{ct k}{black}One hand to hand combat per battle...":22222222222:GOTO3360
3790 IFEN=<0THENPRINT"{ct k}{black}No Warlords!!":22222222222:GOTO3360
3800 FL$="emp.hand":GOSUB140:GOSUB150
3810 RZ=0:AW=0:AE=0:BT=1
3820 RZ=RZ+1:IFRZ>5THEN4070
3830 SW=INT(RND(0)*3)+1:SS=INT(RND(0)*3)+1
3840 PRINT"{ct k}{black}Press [Q] to Quit{ct k}{black}Round:"STR$(RZ)
3850 PRINT"{black}You:"STR$(AW)"{black}{ct k}"EN$":"STR$(AE)" "
3860 PRINT"{ct k}{black}Attack{ct k}[1] Knife{ct k}[2] Sword{ct k}[3] Staff"
3870 PRINT"{ct k}{black}Choose -=>";:GOSUB4810
3880 IFI$="Q"THEN3360
3890 IFVAL(I$)<1ORVAL(I$)>3THEN3870
3900 B1=VAL(I$)
3910 PRINT"{ct k}{black}Defense{ct k}[1] Shield{ct k}[2] Armor{ct k}[3] Magic"
3920 PRINT"{ct k}{black}Choose -=>";:GOSUB4810
3930 IFI$="Q"THEN3360
3940 IFVAL(I$)<1ORVAL(I$)>3THEN3920
3950 B2=VAL(I$)
3960 IFB1<>SWTHEN3990
3970 AW=AW+1:C$(1)="An excellent strike, you draw blood!":C$(2)="You've bashed his jewels!!":C$(3)=EN$+" keels over...":C$(4)=EN$+" coughs up blood..."
3980 C$(5)="A strike to the head! Temporary{ct k}confusion but "+EN$+" recovers...":GOSUB180:GOTO4010
3990 C$(1)="A valiant effort, but you missed!":C$(2)="A miss by a mile... serfs hiss...":C$(3)="You weren't even close, King George{ct k}Has a good laugh!"
4000 C$(4)="You strike, yet you do no damage..":C$(5)="You jump at him, he dodges you...":GOSUB180
4010 IFB2=SSTHEN4040
4020 C$(1)="He jumps at you, you dodge...":C$(2)="You successfully fend off his attack...":C$(3)=EN$+"'s attack is lame{ct k}and you easily move out of the way"
4030 C$(4)=EN$+" misses by a mile...":C$(5)="Your wise choice in defense has worked!":GOSUB180:GOTO4060
4040 AE=AE+1:C$(1)="He bashes you with his staff!":C$(2)="His sword severs your arm!":C$(3)="His knife pierces your skin..."
4050 C$(4)="He jumps on you and strikes in the neck!":C$(5)="His sword slices your chest...":GOSUB180
4060 GOSUB150:GOTO3820
4070 PRINT"{black}The battle draws to a close...{ct k*2}"
4080 IFAE=AWTHENPRINT"{ct k}{black}A draw...  no winner!":GOTO4160
4090 IFAW>AETHEN4130
4100 PRINT"{ct k}{black}"EN$" has defeated you."
4110 PRINT"{ct k}{black}He takes a warlord{ct k}and 20 soldiers!":EN=EN+1:EW=EW+1:NB=NB-1:WA=WA-20:IFWA<0THENWA=0
4120 GOTO4160
4130 PRINT"{ct k}{black}You have defeated "EN$"."
4140 PRINT"{ct k}{black}You take a warlord{ct k}and 20 Soldiers!":EN=EN-1:EW=EW-1:IFEW<1THENEW=0
4150 NB=NB+1:WA=WA+20
4160 PRINT"{ct k*2}{black}Returning to battle...":22222222222:GOTO3360
4170 CLOSE2:OPEN2,UU,2,"emp.players":##################2,AT,1
4180 Z$=","
4190 I$=EN$+Z$+STR$(EA)+Z$+STR$(EW)+Z$+STR$(EP)+Z$+STR$(EN)+Z$+STR$(EG)+Z$+STR$(ET)+Z$+STR$(EM)+Z$+STR$(V1)+Z$+STR$(V2)+Z$+STR$(V3)+Z$+STR$(V4)+Z$+STR$(V5)
4200 I$=I$+Z$+AD$+Z$+STR$(AD)+Z$+STR$(V6)+Z$+STR$(V7)+Z$+STR$(V8)+Z$+STR$(K0)+Z$+STR$(V9)+Z$+STR$(K1)+Z$+STR$(K2)+Z$+STR$(K3):PRINT#2,I$:I$="":CLOSE2
4210 PRINT"{ct k*3}"
4220 A=INT(RND(0)*13)+1:ON-(A>7)GOTO4390
4230 ONAGOTO4240,4290,4300,4310,4320,4350,4360:GOTO4390
4240 A=INT(RND(0)*(I4/2)):B=INT(RND(0)*(I5/2)):IF(A=0)AND(B=0)THENPRINT"{ct k}{black}Worker's strike narrowly avoided!":GOTO4390
4250 IFA<>0THENPRINT"{ct g}{black}Foundry workers strike!{ct k}They close"STR$(A)" foundries":I4=I4-A
4260 IFB<>0THENPRINT"{ct g}{black}Shipyard workers strike!{ct k}They close"STR$(B)" shipyards!":I5=I5-B
4270 IF(B<>0)AND((I5*2)<Q0)THENPRINT"{ct k}{black}Workers sunk"STR$(Q0-I5*2)" ships!":Q0=I5*2
4280 GOTO4390
4290 PRINT"{ct k}{ct g}{black}A PLAGUE Strikes!":A=INT(RND(0)*(SF*.2)):PRINT"And"STR$(A)" people keel over!!":SF=SF-A:GOTO4390
4300 PRINT"{ct k}{ct g}{black}A fire in the fields!":A=INT(RND(0)*(LA/3)):PRINT"And"STR$(A)" acres of land burn!":LA=LA-A:GOTO4390
4310 PRINT"{ct k}{ct g}{black}Thieves have a field day at the palace!{ct k}":A=INT(RND(0)*(PN*.6)):PRINTI$"And They Steal $"STR$(A):PN=PN-A:GOTO4390
4320 A=INT(RND(0)*(LA/3)):PRINT"{ct k}{black}King George rewards you with"STR$(A):LA=LA+A
4330 C$(1)="Acres for not banging his daughter!!":C$(2)="Acres cuz he says you have a cute butt!":C$(3)="Acres for murdering one of his{ct k}unwanted relatives
4340 C$(4)="Acres for the hell of it...":C$(5)="Acres because his daughter is still a{ct k}virgin.... he checked himself!":GOSUB190:GOTO4390
17733 EEEEEEEEEEEEEE2=E2-1:PRINT"{ct k}{black}King George Rewards You With 1 Extra{ct k}Play Today!":GOTO4390
4360 IFI6<1THEN4390
4370 PRINT"{ct k*2}{black}VD Epidemic Strikes Your Military Camp!"
4380 N1=INT(WA/((RND(0)*6)+3)):PRINT"{ct k}{black}Soldiers Killed ..."STR$(N1):WA=WA-N1:GOTO4390
4390 IF(LA<50)THENPRINT"{ct k}{black}You dont have enough land to continue.{ct k}You gone...":GOTO4690
12336 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000{down}IF(SF<99)THENPRINT"{ct k}{black}Not enough people to continue.{ct k}You gone...":GOTO4690
4410 PRINT"{ct k*2}{black}{reverse on}  Treasury Report  {ct k*2}":P1=INT(((RND(0)*75)+25)*91):P2=INT(((RND(0)*100)+50)*I2):P3=INT(((RND(0)*175)+125)*I4):P4=INT(((RND(0)*200)+150)*I5)
4420 P5=INT(((RND(0)*500)+200)*I6):P6=INT(((RND(0)*1500)+220)*I9):TP=P1+P2+P3+P4+P5+P6:PN=PN+TP
4430 PRINT"{black}Markets       :"P1"{ct k}{black}Mills         :"P2"{ct k}{black}Foundries     :"P3"{ct k}{black}Shipyards     :"P4"{ct k}{black}Brothels      :"P5"{ct k}{black}Colonies      :"P6"{ct k}{black}Total Profit  :"TP
4440 GOSUB4700
4450 GOSUB150:GOSUB1590
4460 IFWA=>(NB*20)THEN4540
4470 AA=INT(RND(0)*25)+4:PRINT"{ct k}{black}Buy recruits to protect the throne..."
4480 PRINT"Recruits cost $"STR$(AA)" each."
4490 MA=INT((NB*20)-WA):IF(MA*AA)>PNTHENMA=INT(PN/AA)
4500 IFMA<=0THENMA=0:GOTO4540
4510 PRINT"{ct k}{black}Buy How Many [MAX="+STR$(MA)+"] ?";:GOSUB60
4520 IFI$="0"THEN4540
4530 W=VAL(I$):IFW<1ORW>MATHEN4510:ELSEWA=WA+W:PN=PN-(AA*W):PRINT"{ct k}You now have"STR$(WA)" Soldiers!"
4540 GOSUB1540:GOSUB4570:IF(M3-E2)=<0THEN4660
4550 IFPEEK(2825)<8THENPRINT"{ct k}{black}Not enough time remaining{ct k}to play another round...":GOTO4660
4560 PRINT"{ct k}{black}Time left:"STR$(PEEK(2825))" mins.":Q$="{ct k}Play Empire again":GOSUB160:IFCO=0THEN4660:ELSEGOTO440
4570 IFLD$<>DT$THENLD$=DT$:E2=0
4580 IF(M3-E2)<=0THENPRINT"{ct k}{black}No more plays left today!":GOTO4660
4590 PRINT"{ct k}{white}* {cyan}You have"STR$(M3-E2)" plays left.":RETURN
4600 IFAC$<>"Z"THEN440
4610 Q$="{ct k}{black}Reset the Empire":GOSUB160:IFCO=0THEN440
4620 PRINT"{ct k}{black}Clearing all accounts...":CLOSE2:#############2,"emp.players",U(UU):FORX=1TOM2:##################2,X,1:PRINT#2,"empty":NEXT X:CLOSE2
4630 PRINT"{black}Resetting news...":CLOSE15:OPEN15,UU,15,"s0:emp.news":CLOSE15:OPEN2,UU,2,"emp.news,s,w":PRINT#2,"Activity Recorded On: "+DT$
4640 CLOSE 2
4650 GOTO230
4660 PRINT"{ct k}{black}Good Bye 'O Mighty Warlord!{ct k*2}Enter 1 line msg to next warlord":INPUTI$
4670 IFI$=""THENEND
4680 CLOSE15:OPEN15,UU,15,"s0:emp.msg":CLOSE15:CLOSE2:OPEN2,UU,2,"emp.msg,s,w":PRINT#2,CHR$(34)+NM$:PRINT#2,I$:CLOSE2:END
4690 CLOSE2:#############2,"emp.players",U(UU):##################2,AC,1:PRINT#2,"empty":CLOSE2:END
4700 IFLA<EM(1)ORSF<EM(2)ORNB<EM(3)ORI1<EM(4)ORI2<EM(5)OR(I3*10)<EM(9)ORI4<EM(6)ORI5<EM(7)ORI6<EM(8)ORI9<EM(10)THENRETURN
4710 PRINT"{ct k*3}{black}A NEW EMPEROR!  You have conquered"
4720 PRINT"all others... a job well done!"
4730 AP$=NM$+" BECAME AN EMPEROR TODAY!":GOSUB1630
4740 PRINT"{ct k}{black}Inscribing your name in marble..."
4750 CLOSE2:OPEN2,UU,2,"emp.emps,s,a":IFDSTHENCLOSE2:RETURN
4760 PRINT#2,USING"{yellow}#################   ########  ########";NM$,DT$,LA
4770 PRINT#2,"{pink}{cm t*17}   {cm t*8}  {cm t*8}":CLOSE2
4780 PRINT"{ct k*3}{black}You must now start your quest again!":GOTO4690
4790 IFER=30ANDAC>0THENGOSUB1540:PRINT"Break Error":END
4800 PRINTERR$(ER)"in"EL:END
4810 GETKEYI$:
4830 REM **** MISSING