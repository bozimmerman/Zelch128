!--------------------------------------------------
!- Sunday, May 14, 2017 12:05:09 AM
!- Import of : 
!- c:\tmp\delme\prg.dating.prg
!- Unknown Machine
!--------------------------------------------------
5 D1=26:DIMM1(D1),U2(D1),M2(D1):DP=0:NR%=0:CR$=CHR$(13):PRINT"{clear}{f6}{cyan}Dating subsystem:":HD$(1)="":CLOSE2:CLOSE15
6 U=PEEK(2932):D=PEEK(2933)
10 OPEN2,U,2,MID$(STR$(D),2)+":sys.work,s,r":INPUT#2,NA$,ID,AX,U2,D2,UR:CLOSE2
30 OPEN15,U,15:GOSUB3260:INPUT#15,A:CLOSE2:CLOSE15:IFA<>0THENPRINT"{f6}{white}Dating files not yet created.":GOTO400
40 IFID=0THENPRINT"{f6}{white}Sorry, you must have an account to participate.":END
50 GOSUB3260:X=ID:RECORD#2,X:INPUT#2,I$:CLOSE2:IFI$="^"THEN70:ELSE60
55 U=PEEK(186):SCRATCH"prg.dating",U(U):DSAVE"prg.dating",U(U):STOP
60 FORY=1TOD1:M1(Y)=VAL(MID$(I$,Y,1)):NEXTY:GOTO450
70 PRINT"{f6}{yellow}A new participant!"
80 GOSUB3050:PRINT"{f6}{yellow}Do you wish to continue (y/n)? ";:GETKEYAN$:AN$=CHR$(ASC(AN$)OR128):IFAN$<>"Y"THENPRINT"No":GOTO2780:ELSEPRINT"Yes"
90 PRINT"{f6}{cyan}* Dating Application *":GOSUB100:GOTO370
100 A$="{f6}Physical gender:{f6*2}{ct i}1.  Female{f6}{ct i}2.  Male{f6*2}:":C=2:GOSUB2550:U2(1)=B
110 A$="{f6}Color of eyes:{f6*2}{ct i}1.  Blue{f6}{ct i}2.  Grey{f6}{ct i}3.  Green{f6}{ct i}4.  Hazel{f6}{ct i}5.  Brown{f6}{ct i}6.  Other{f6*2}:":C=6:GOSUB2550:U2(2)=B
120 A$="{f6}Color of hair:{f6*2}{ct i}1.  Black{f6}{ct i}2.  Brown{f6}{ct i}3.  Red{f6}{ct i}4.  Blonde{f6}{ct i}5.  Other{f6*2}:":C=5:GOSUB2550:U2(3)=B
130 A$="{f6}Height:{f6*2}{ct i}1.  Under 5 feet{f6}{ct i}2.  5ft - 5ft 4in{f6}{ct i}3.  5ft 5in -5ft 8in{f6}{ct i}4.  5ft 9in - 6ft{f6}{ct i}5.  Over 6 feet{f6*2}:":C=5:GOSUB2550:U2(4)=B
140 A$="{f6}Weight:{f6*2}{ct i}1.  Under 100{f6}{ct i}2.  100-124 lb{f6}{ct i}3.  125-149 lb{f6}{ct i}4.  150-174 lb{f6}{ct i}5.  175-200 lb{f6}{ct i}6.  Over 200 lb{f6*2}:":C=6:GOSUB2550:U2(5)=B
150 A$="{f6}Sexual preference:{f6*2}{ct i}1.  Opposite{f6}{ct i}2.  Homosexual{f6}{ct i}3.  Bi-sexual{f6*2}:":C=3:GOSUB2550:U2(6)=B
160 A$="{f6}Age:{f6*2}{ct i}1.  Under 18{f6}{ct i}2.  18-25{f6}{ct i}3.  26-35{f6}{ct i}4.  36-45{f6}{ct i}5.  Over 45{f6*2}:":C=5:GOSUB2550:U2(7)=B
170 A$="{f6}Income:{f6*2}{ct i}1.  Under 10k{f6}{ct i}2.  10k-20k{f6}{ct i}3.  20k-30k{f6}{ct i}4.  30k-40k{f6}{ct i}5.  Over 40k{f6*2}:":C=5:GOSUB2550:U2(8)=B
180 A$="{f6}Education:{f6*2}{ct i}1.  Elementary{f6}{ct i}2.  High school{f6}{ct i}3.  College{f6}{ct i}4.  Graduate school{f6}{ct i}5.  Medical doctor{f6*2}:":C=5:GOSUB2550:U2(9)=B
190 A$="{f6}Status:{f6*2}{ct i}1.  Single{f6}{ct i}2.  Married, but...{f6}{ct i}3.  Divorced{f6}{ct i}4.  Desperate{f6}{ct i}5.  Other{f6*2}:":C=5:GOSUB2550:U2(10)=B
200 A$="{f6}Prefer to live:{f6*2}{ct i}1.  City{f6}{ct i}2.  Suburbs{f6}{ct i}3.  Country{f6}{ct i}4.  Europe{f6}{ct i}5.  Other{f6*2}:":C=5:GOSUB2550:U2(11)=B
210 A$="{f6}Books:{f6*2}{ct i}1.  Rarely read{f6}{ct i}2.  Science fiction{f6}{ct i}3.  Romance{f6}{ct i}4.  Mystery{f6}{ct i}5.  All{f6*2}:":C=5:GOSUB2550:U2(12)=B
220 A$="{f6}Travel:{f6*2}{ct i}1.  Like to stay at home{f6}{ct i}2.  Car ride{f6}{ct i}3.  Back-pack{f6}{ct i}4.  Train ride{f6}{ct i}5.  Airplane{f6*2}:":C=5:GOSUB2550:U2(13)=B
230 A$="{f6}Times per month to go to movies:{f6*2}{ct i}1.{f6}{ct i}2.{f6}{ct i}3.{f6}{ct i}4.{f6}{ct i}5.{f6*2}:":C=5:GOSUB2550:U2(14)=B
240 A$="{f6}Hours you like to watch TV per day:{f6*2}{ct i}1.  0{f6}{ct i}2.  1 hr.{f6}{ct i}3.  2 hrs.{f6}{ct i}4.  3 hrs.{f6}{ct i}5.  4 hrs.{f6*2}:":C=5:GOSUB2550:U2(15)=B
250 A$="{f6}Sports activities:{f6*2}{ct i}1.  Water{f6}{ct i}2.  Running{f6}{ct i}3.  Nautilus{f6}{ct i}4.  Other{f6}{ct i}5.  Never{f6*2}:":C=5:GOSUB2550:U2(16)=B
260 A$="{f6}Watch TV sports:{f6*2}{ct i}1.  Hate to{f6}{ct i}2.  Sometimes{f6}{ct i}3.  Baseball{f6}{ct i}4.  Football{f6}{ct i}5.  Love to{f6*2}:":C=5:GOSUB2550:U2(17)=B
270 A$="{f6}1st Date:{f6*2}{ct i}1.  Restaurant/Show{f6}{ct i}2.  Park{f6}{ct i}3.  Quiet dinner{f6}{ct i}4.  McDonalds{f6}{ct i}5.  Other{f6*2}:":C=5:GOSUB2550:U2(18)=B
280 A$="{f6}Attitude:{f6*2}{ct i}1.  Psycho{f6}{ct i}2.  Aggressive{f6}{ct i}3.  Possessive{f6}{ct i}4.  Easy going{f6}{ct i}5.  Shy{f6*2}:":C=5:GOSUB2550:U2(19)=B
290 A$="{f6}Music:{f6*2}{ct i}1.  Rock{f6}{ct i}2.  Jazz{f6}{ct i}3.  Classical{f6}{ct i}4.  All{f6}{ct i}5.  You are a musician{f6*2}:":C=5:GOSUB2550:U2(20)=B
300 A$="{f6}Sex on first date if in mood:{f6*2}{ct i}1.  Yes{f6}{ct i}2.  Maybe{f6}{ct i}3.  No{f6}{ct i}4.  Partial{f6}{ct i}5.  Don't know{f6*2}:":C=5:GOSUB2550:U2(21)=B
310 A$="{f6}Racial Preference:{f6*2}{ct i}1.  Black{f6}{ct i}2.  Doesn't matter{f6}{ct i}3.  White{f6}{ct i}4.  Other{f6*2}:":C=4:GOSUB2550:U2(22)=B
320 A$="{f6}Times a week you prefer to make love:{f6*2}{ct i}1.  Virgin{f6}{ct i}2.  1{f6}{ct i}3.  2{f6}{ct i}4.  3{f6}{ct i}5.  4 or more{f6*2}:":C=5:GOSUB2550:U2(23)=B
330 A$="{f6}Sexual arousal threshold{f6*2}{ct i}1.  VERY easy{f6}{ct i}2.  Easy{f6}{ct i}3.  Moderate{f6}{ct i}4.  Slow{f6}{ct i}5.  Hard{f6*2}:":C=5:GOSUB2550:U2(24)=B
340 A$="{f6}Looking for:{f6*2}{ct i}1.  Good relationship{f6}{ct i}2.  Fun{f6}{ct i}3.  Sex{f6}{ct i}4.  Marriage{f6}{ct i}5.  Other{f6*2}:":C=5:GOSUB2550:U2(25)=B
350 A$="{f6}Your location:{f6*2}{ct i}1.  West coast{f6}{ct i}2.  Mid-west{f6}{ct i}3.  Great lakes{f6}{ct i}4.  South East{f6}{ct i}5.  Mid-Atlantic coast{f6}{ct i}6.  New England{f6*2}:":C=6:GOSUB2550
360 U2(26)=B:PRINT"{f6}{white}Are you certain your answers are correct (y/n)? ";:GETKEYAN$:AN$=CHR$(ASC(AN$)OR128):IFAN$<>"Y"THENPRINT"No":GOTO100:ELSEPRINT"Yes"
365 RETURN
370 DA$="":FORX=1TO26:M1(X)=U2(X):DA$=DA$+MID$(STR$(M1(X)),2):NEXTX
380 GOSUB3260:X=ID:RECORD#2,X:PRINT#2,DA$:CLOSE2:PRINT"{f6}{cyan}Your stats are now on file!":GOTO450
390 PRINT"{f6}{pink}Sorry, you don't have enough time.":GOTO2780
400 PRINT"{f6}{yellow}Reset dating system (y/n)? ";:GETKEYAN$:AN$=CHR$(ASC(AN$)OR128)
410 IFAN$<>"Y"THENPRINT"No":GOTO2780:ELSEPRINT"Yes"
420 PRINT"{f6}{cyan}Please wait...";
430 D$=MID$(STR$(D),2):CLOSE15:OPEN15,U,15:PRINT#15,"s"+D$+":sys.dating":OPEN2,U,2,D$+":sys.dating,l,"+CHR$(35)
440 FORX=1TOUR:PRINT".";:RECORD#2,X:PRINT#2,"^":NEXT:PRINT:CLOSE2:A$=DS$:GOTO30
450 IFPEEK(2825)<6THEN390
460 PRINT"{f6}{white}Welcome, "NA$"."
470 PRINT"{f6}{cyan}Dating: ";:MAX=1:GOSUB3140:IFPEEK(2825)=1THEN2780
480 ONINSTR("MVQ?LRK",A$)GOTO2900,700,2780,2970,2790,490,2580:GOTO470
490 CLOSE2:GOSUB100:GOTO370
500 FORX=1TOD1:M2(X)=M1(X):NEXT
510 PRINT"{clear}{f6}Enter the lowest percentage desired{f7}for a match: ";:MAX=3:GOSUB3140:D=INT(VAL(AN$)):IFD<10ORD>100THEN470
520 TT$(1)="Under 18":TT$(2)="18-25":TT$(3)="26-35":TT$(4)="36-45":TT$(5)="Over 45"
530 GOSUB3260:N1%=0:X=1:RECORD#2,X
540 AN$=" ":IFNR%THENAN$=" more "
550 FORZ=1TOUR:INPUT#2,N$:IFN$="^"ORZ=IDTHEN580
560 FORY=1TOD1:U2(Y)=VAL(MID$(N$,Y,1)):NEXT
570 GOSUB610:PRINT".";:IFRC>0ORPEEK(2825)=1THENZ=UR:GOTO590
580 AN$=" ":IFN1%THENAN$=" more "
590 NEXTZ:PRINT"{f6}No"+AN$+"matches found!"
600 CLOSE2:GOTO2900
610 NR%=0:IFM2(1)=U2(1)THENIFM2(6)=1ORU2(6)=1THENRETURN
620 IFM2(1)<>U2(1)THENIFM2(6)=2ORU2(6)=2THENRETURN
630 FORA=2TOD1:IFM2(A)=U2(A)THENNR%=NR%+2:ELSEIFABS(M2(A)-U2(A))=1THENNR%=NR%+1
640 NEXT:N2%=INT((NR%/(2*(D1-1)))*100)
650 IFN2%<DTHENRETURN
660 IFN1%=0THENPRINT"{f6}A match found!"
670 N1%=N1%+1:CLOSE2:GOSUB3270:X=Z:RECORD#2,X:SYS8222:CLOSE2:GOSUB3260:X=Z+1:RECORD#2,X
680 PRINT"{f6}UserID#:  "+STR$(Z)+"{f6}Handle:    "+I$+"{f6}Age group: "+TT$(U2(7))+"{f6}% match:  "+STR$(N2%)
690 RETURN
700 GOSUB2690:IFCTHEN470
710 FORY=1TOD1:U2(Y)=VAL(MID$(A$,Y,1)):NEXT
720 B$=NN$:PRINT"{f6}"+B$+","STR$(B)
730 IFAXTHENPRINT"Name : "DT$(3)"{ct k}Phone: "DT$(4)
750 PRINT:ONU2(1)GOTO760,770
760 AN$="Female":GOTO780
770 AN$="Male"
780 MN$="Physical sex:   "+AN$:GOSUB3220
790 ONU2(2)GOTO800,810,820,830,840,850
800 AN$="Blue":GOTO860
810 AN$="Grey":GOTO860
820 AN$="Green":GOTO860
830 AN$="Hazel":GOTO860
840 AN$="Brown":GOTO860
850 AN$="Other"
860 MN$="Color of eyes:  "+AN$:GOSUB3220
870 ONU2(3)GOTO880,890,900,910,920
880 AN$="Black":GOTO930
890 AN$="Brown":GOTO930
900 AN$="Red":GOTO930
910 AN$="Blonde":GOTO930
920 AN$="Other"
930 MN$="Color of hair:  "+AN$:GOSUB3220
940 ONU2(4)GOTO950,960,970,980,990
950 AN$="Under 5ft":GOTO1000
960 AN$="5ft - 5ft 4in":GOTO1000
970 AN$="5ft 5in - 5ft 8in":GOTO1000
980 AN$="5ft 9in - 6ft":GOTO1000
990 AN$="Over 6ft"
1000 MN$="Height:         "+AN$:GOSUB3220
1010 ONU2(5)GOTO1020,1030,1040,1050,1060,1070
1020 AN$="Under 100lbs":GOTO1080
1030 AN$="100lbs-124lbs":GOTO1080
1040 AN$="125lbs-149lbs":GOTO1080
1050 AN$="150lbs-174lbs":GOTO1080
1060 AN$="175lbs-200lbs":GOTO1080
1070 AN$="Over 200lbs"
1080 MN$="Weight:         "+AN$:GOSUB3220
1090 TT$(3)="Bi-sexual":TT$(1)="Opposite":TT$(2)="Homosexual"
1100 MN$="Sex Preference: "+TT$(U2(6)):GOSUB3220
1110 ONU2(7)GOTO1120,1130,1140,1150,1160
1120 AN$="Under 18":GOTO1170
1130 AN$="18-25":GOTO1170
1140 AN$="26-35":GOTO1170
1150 AN$="36-45":GOTO1170
1160 AN$="Over 45"
1170 MN$="Age Range:      "+AN$:GOSUB3220
1180 ONU2(8)GOTO1190,1200,1210,1220,1230
1190 AN$="Under 10k":GOTO1240
1200 AN$="10k-20k":GOTO1240
1210 AN$="20k-30k":GOTO1240
1220 AN$="30k-40k":GOTO1240
1230 AN$="Over 40k"
1240 MN$="Yearly income:  "+AN$:GOSUB3220
1250 ONU2(9)GOTO1260,1270,1280,1290,1300
1260 AN$="Elementary":GOTO1310
1270 AN$="High school":GOTO1310
1280 AN$="College":GOTO1310
1290 AN$="Graduate school":GOTO1310
1300 AN$="Medical doctor"
1310 MN$="Education:      "+AN$:GOSUB3220
1320 ONU2(10)GOTO1330,1340,1350,1360,1370
1330 AN$="Single":GOTO1380
1340 AN$="Married, but...":GOTO1380
1350 AN$="Divorced":GOTO1380
1360 AN$="Desperate":GOTO1380
1370 AN$="Other"
1380 MN$="Status:         "+AN$:GOSUB3220
1390 ONU2(11)GOTO1400,1410,1420,1430,1440
1400 AN$="City":GOTO1450
1410 AN$="Suburbs":GOTO1450
1420 AN$="Country":GOTO1450
1430 AN$="Europe":GOTO1450
1440 AN$="Other"
1450 MN$="Prefer to live: "+AN$:GOSUB3220
1460 ONU2(12)GOTO1470,1480,1490,1500,1510
1470 AN$="Rarely read":GOTO1520
1480 AN$="Science Fiction":GOTO1520
1490 AN$="Romance":GOTO1520
1500 AN$="Mystery":GOTO1520
1510 AN$="All"
1520 MN$="Books:          "+AN$:GOSUB3220
1530 ONU2(13)GOTO1540,1550,1560,1570,1580
1540 AN$="Like to stay at home":GOTO1590
1550 AN$="Car-Ride":GOTO1590
1560 AN$="Back-pack":GOTO1590
1570 AN$="Train ride":GOTO1590
1580 AN$="Airplane"
1590 MN$="Travel:         "+AN$:GOSUB3220
1600 ONU2(14)GOTO1610,1620,1630,1640,1650
1610 AN$="1":GOTO1660
1620 AN$="2":GOTO1660
1630 AN$="3":GOTO1660
1640 AN$="4":GOTO1660
1650 AN$="5"
1660 MN$="Movies / month: "+AN$:GOSUB3220
1670 ONU2(15)GOTO1680,1690,1700,1710,1720
1680 AN$="None":GOTO1730
1690 AN$="1hr.":GOTO1730
1700 AN$="2hrs.":GOTO1730
1710 AN$="3hrs.":GOTO1730
1720 AN$="4hrs."
1730 MN$="TV/hrs per day: "+AN$:GOSUB3220
1740 ONU2(16)GOTO1750,1760,1770,1780,1790
1750 AN$="Water":GOTO1800
1760 AN$="Running":GOTO1800
1770 AN$="Nautilus":GOTO1800
1780 AN$="Other":GOTO1800
1790 AN$="Never"
1800 MN$="Athletics:      "+AN$:GOSUB3220
1810 ONU2(17)GOTO1820,1830,1840,1850,1860
1820 AN$="Hate to":GOTO1870
1830 AN$="Sometimes":GOTO1870
1840 AN$="Baseball":GOTO1870
1850 AN$="Football":GOTO1870
1860 AN$="Love to"
1870 MN$="Watch TV sport: "+AN$:GOSUB3220
1880 ONU2(18)GOTO1890,1900,1910,1920,1930
1890 AN$="Restaurant/Show":GOTO1940
1900 AN$="Park":GOTO1940
1910 AN$="Quiet Dinner":GOTO1940
1920 AN$="McDonalds":GOTO1940
1930 AN$="Other"
1940 MN$="1st Date:       "+AN$:GOSUB3220
1950 ONU2(19)GOTO1960,1970,1980,1990,2000
1960 AN$="Psycho":GOTO2010
1970 AN$="Aggressive":GOTO2010
1980 AN$="Possessive":GOTO2010
1990 AN$="Easy going":GOTO2010
2000 AN$="Shy"
2010 MN$="Attitude:       "+AN$:GOSUB3220
2020 ONU2(20)GOTO2030,2040,2050,2060,2070
2030 AN$="Rock":GOTO2080
2040 AN$="Jazz":GOTO2080
2050 AN$="Classical":GOTO2080
2060 AN$="All":GOTO2080
2070 AN$="Is a musician"
2080 MN$="Music:          "+AN$:GOSUB3220
2090 ONU2(21)GOTO2100,2110,2120,2130,2140
2100 AN$="Yes":GOTO2150
2110 AN$="Maybe":GOTO2150
2120 AN$="No":GOTO2150
2130 AN$="Partial":GOTO2150
2140 AN$="Don't know"
2150 MN$="Sex / 1st date: "+AN$:GOSUB3220
2160 ONU2(22)GOTO2170,2180,2190,2200
2170 AN$="Black":GOTO2210
2180 AN$="Doesn't matter":GOTO2210
2190 AN$="White":GOTO2210
2200 AN$="Other"
2210 MN$="Race prefered:  "+AN$:GOSUB3220
2220 ONU2(23)GOTO2230,2240,2250,2260,2270
2230 AN$="Virgin":GOTO2280
2240 AN$="1":GOTO2280
2250 AN$="2":GOTO2280
2260 AN$="3":GOTO2280
2270 AN$="3 or more"
2280 MN$="Sex times/week: "+AN$:GOSUB3220
2290 ONU2(24)GOTO2300,2310,2320,2330,2340
2300 AN$="VERY easy":GOTO2350
2310 AN$="Easy":GOTO2350
2320 AN$="Moderate":GOTO2350
2330 AN$="Slow":GOTO2350
2340 AN$="Hard"
2350 MN$="Sexual arousal: "+AN$:GOSUB3220
2360 ONU2(25)GOTO2370,2380,2390,2400,2410
2370 AN$="Good relationship":GOTO2420
2380 AN$="Fun":GOTO2420
2390 AN$="Sex":GOTO2420
2400 AN$="Marriage":GOTO2420
2410 AN$="Other"
2420 MN$="Looking for:    "+AN$:GOSUB3220:GOSUB3240
2430 GOTO700
2450 IFPEEK(2825)<2THENCLOSE2:GOTO2780:ELSERETURN
2460 ONU2(26)GOTO2470,2480,2490,2500,2510,2520
2470 AN$="West coast":GOTO2530
2480 AN$="Mid-West":GOTO2530
2490 AN$="Great Lakes":GOTO2530
2500 AN$="South East":GOTO2530
2510 AN$="Mid-Atlantic Coast":GOTO2530
2520 AN$="New England"
2530 MN$="Location:       "+AN$:GOSUB3220
2540 GOTO3240
2550 D$=A$:GOSUB2450
2560 PRINTA$;:MAX=1:GOSUB3140:B=ABS(VAL(AN$)):IF(B>0ANDB<=C)ORPEEK(2825)=1THENRETURN
2570 PRINT"{f6}Please try again!{f6}":A$=D$:GOTO2560
2580 IF(AX)=0THEN2670
2590 A=INT(VAL(MID$(AN$,2,9))):IFATHEN2620
2600 PRINT"{f6}Enter ID# of the user to{f7}remove from dating: ";:MAX=16:GOSUB3140:A=INT(VAL(AN$))
2610 IFA=0THEN2660
2620 IFA<1ORA>URTHEN2660:ELSE2630
2630 GOSUB3260:X=A:RECORD#2,X:PRINT#2,"^":CLOSE2:PRINT"{f6}Account"+STR$(X)+" removed from dating system."
2640 IFID=ATHEN30
2650 GOTO470
2660 GOSUB2770:GOTO470
2670 PRINT"{f6}Remove yourself from the dating system (y/n)? ";:GETKEYAN$:AN$=CHR$(ASC(AN$)OR128):IFAN$="Y"THENPRINT"Yes":A=ID:GOTO2630
2680 PRINT"No":GOTO470
2690 C=0:A=INT(VAL(MID$(AN$,2,9))):IFATHEN2720
2700 PRINT"{f6}Enter ID# of the user to{f7}profile: ";:MAX=16:GOSUB3140:A=INT(VAL(AN$))
2710 IFA=0ORPEEK(2825)=1THENC=1:RETURN
2720 IFA<1ORA>URTHEN2760:ELSEB=A:GOTO2730
2730 GOSUB3270:X=B:RECORD#2,X:FORT=1TO4:SYS8222:DT$(T)=I$:NEXT:CLOSE2:NN$=DT$(1):IFNN$="^"THENPRINT"{f6}That account is deleted.":GOTO2700
2740 GOSUB3260:X=B:RECORD#2,X:INPUT#2,A$:CLOSE2:IFA$="^"THENB$=NN$:PRINT"{f6}"+B$+" is not a dating participant.":GOTO2700
2750 RETURN
2760 GOSUB2770:GOTO2700
2770 PRINT"{f6}Can't find that user's account.":RETURN
2780 END
2790 PRINT"{f6}Dating participants:{f6}":T=0:C=0
2800 GOSUB3260:X=1:RECORD#2,X
2810 FORZ=1TOUR:INPUT#2,I$:GETB$:GET#5,C$:IFB$=" "ORC$=" "ORPEEK(2825)=1THENZ=UR:GOTO2850
2820 IFI$="^"THEN2840
2830 T=T+1:C=C+1:BS%(C)=Z
2840 IFZ/10=INT(Z/10)THENGOSUB2860
2850 NEXTZ:GOSUB2860:PRINT"{f6}"+MID$(STR$(T),2)+" members listed.":CLOSE2:GOTO470
2860 IFC=0THENRETURN
2870 CLOSE2:GOSUB3270:FORY=1TOC:X=BS%(Y):RECORD#2,X:INPUT#2,B$:PRINTRIGHT$(" "+STR$(BS%(Y)),3)+" "+B$
2880 NEXTY:CLOSE2:GOSUB3260:X=Z+1:RECORD#2,X:C=0:RETURN
2900 PRINT"{f6}{white}Design, Match, Perfect match, Quit, ?=Menu"
2910 PRINT"{f6}{cyan}Match: ";:MAX=1:GOSUB3140:IFPEEK(2825)=1THEN2780
2920 ONINSTR("DMQ?P",A$)GOTO2940,500,470,3080,2930:GOTO2900
2930 FORX=1TOD1:M2(X)=M1(X):NEXT:D=100:GOTO530
2940 PRINT"{f6}* DESIGN-A-MATCH *":GOSUB100:FORX=1TOD1:M2(X)=U2(X):NEXT:M2(1)=M1(1):GOTO510
2970 PRINT"{ct k}{white}{reverse on} K {reverse off} {yellow}Remove a dating file                {white}{reverse on} L {reverse off} {yellow}List dating participants"
2990 PRINT"{white}{reverse on} M {reverse off} {yellow}Find yourself a match               {white}{reverse on} Q {reverse off} {yellow}Quit to Main"
3010 PRINT"{white}{reverse on} R {reverse off} {yellow}Re-enter your stats                 {white}{reverse on} V {reverse off} {yellow}View another user's stats"
3040 GOTO470
3050 PRINT"{white}{f6}    Welcome to the Dating and{f7}Matchmaking system. The questions"
3060 PRINT"that you will be required to answer{f7}will be of a personal nature. Please"
3070 PRINT"abort now if you do not wish to{f7}participate.":RETURN
3080 PRINT"{ct k}{white}{reverse on} D {reverse off} {light green}Design a match                      {white}{reverse on} M {reverse off} {light green}Find yourself a match"
3100 PRINT"{white}{reverse on} P {reverse off} {light green}Your IDEAL match                    {white}{reverse on} Q {reverse off} {light green}Quit to Dating system"
3120 PRINT"{white}{reverse on} ? {reverse off} {light green}This Menu"
3130 GOTO2900
3140 I$=""
3150 GETA$:GOSUB2450:IFA$=""THEN3150
3160 IFA$=CHR$(13)THENPRINT:A$=I$:AN$=I$:RETURN
3170 IFA$<>CHR$(20)THEN3200
3180 IFI$=""THEN3150
3190 I$=LEFT$(I$,LEN(I$)-1):PRINTA$;:GOTO3150
3200 IFLEN(I$)=MAXTHEN3150
3205 IFASC(A$)>64ANDASC(A$)<92THENA$=CHR$(ASC(A$)OR128)
3210 PRINTA$;:I$=I$+A$:IFMAX=1THENPRINT:A$=I$:AN$=I$:RETURN:ELSE3150
3220 IFPOS(1)>38THENMN$=MN$+CHR$(13):ELSEMN$=MN$+LEFT$("                              ",40-LEN(MN$))
3230 PRINTMN$;:RETURN
3240 IFPEEK(236)THENPRINT
3250 PRINT:RETURN
3260 OPEN2,U,2,MID$(STR$(D),2)+":sys.dating":RETURN
3270 OPEN2,U2,2,MID$(STR$(D2),2)+":sys.userfiles":RETURN
