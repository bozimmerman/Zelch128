!--------------------------------------------------
!- Wednesday, August 18, 2021 12:28:06 AM
!- Import of : 
!- c:\tmp\newproject\gal.empire.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 U1=9:A=RND(-TI):R$=CHR$(13):ZC$="{red}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{light green}{light blue}":GOTO1000
20 PRINT#1,"p"CHR$(98)CHR$(I)CHR$(0)CHR$(0):RETURN
30 GOTO500
40 IFEN$<>" "ANDEN$<>"{home}"THENGETEN$
50 RETURN
55 U=PEEK(186):OPEN1,U,15,"s0:gal.empire":CLOSE1:SAVE"gal.empire",U:STOP
60 A$="":FORI=0TO3:A$=A$+EM$(X,I)+R$:NEXTI:PRINT#2,A$;:RETURN
70 A$="":FORI=0TO4:A$=A$+STR$(PL(X,I))+R$:NEXTI:PRINT#2,PL$(X)+R$+A$;:RETURN
80 OPEN1,U1,15:OPEN8,U1,8,"0:gal.news,s,r":INPUT#1,E:IFE>0THEN100
90 INPUT#8,B$:IFRIGHT$(B$,LEN(DT$))=DT$THEN110
100 CLOSE8:PRINT#1,"s0:gal.news":OPEN8,U1,8,"gal.news,s,w":PRINT#8,"Record-"+DT$
110 CLOSE8:CLOSE1:OPEN8,U1,8,"0:gal.news,s,a":PRINT#8,I$:CLOSE8:CLOSE1:RETURN
120 A=PEEK(186):PRINTA:OPEN1,A,15,"s0:gal.game":CLOSE1:SAVE"gal.game",A:STOP
130 LN=0:OPEN1,U1,15:OPEN2,U1,2,"0:"+F$+",s,r":INPUT#1,I:IFI>0THEN160
140 LN=LN+1:GET#2,I$:IFSTTHENPRINTI$:GOTO160
145 A$="":GETA$:IFA$=" "THENPRINT:PRINT:GOTO160
147 IFA$="{home}"THEN166
150 PRINTI$;:GOTO140
160 CLOSE2:IFLN>99ANDF$<>"gal.rules"THENPRINT#1,"s0:"+F$
165 CLOSE1:RETURN
166 GETA$:IFA$=""ORA$="{home}"THEN166
167 GOTO150
170 FORI=1TO25:IFPL(I,0)=RDTHENPL(I,4)=PL(I,4)+PL(I,3):GOTO190
180 PL(I,4)=PL(I,4)+INT(PL(I,3)*.1)
190 NEXTI:RETURN
200 PRINT"{down*2}{white}{light blue}You have played your max 10 years"
210 PRINT"{right*4}for today. See you tomorrow!"
220 PRINT"{down*2}{cyan}Saving data...";
230 OPEN1,U1,15:OPEN2,U1,2,"0:gal.galaxy":A$=""
240 EM$(RD,1)=DT$:FORI=1TO10:A$="":GOSUB20:FORX=0TO4:A$=A$+EM$(I,X)+R$:NEXTX
250 PRINT#2,A$;:NEXTI:FORI=11TO35:A$=PL$(I-10)+R$:GOSUB20:FORX=0TO4
260 A$=A$+STR$(PL(I-10,X))+R$
270 NEXTX:PRINT#2,A$;:NEXTI:CLOSE2:OPEN2,U1,2,"0:gal.missions":I=1:X=1
280 IFMS(X,0)=0THEN295
290 GOSUB20:A$="":FORY=0TO5:A$=A$+STR$(MS(X,Y))+R$:NEXTY:PRINT#2,A$;:I=I+1
295 X=X+1:IFX<101THEN280
296 GOSUB20:PRINT#2,"0"
297 CLOSE2:CLOSE1:PRINTR$:END
300 CP=VAL(EM$(RD,4))
310 CP=CP/5000:BU=0:IFCP>.005THENCP=.005
320 FORI=1TO25:IFPL(I,0)<>RD ORI=VAL(EM$(RD,3))THEN340
330 IFRND(TI)<CPANDPL(I,4)<700THENPRINTPL$(I)" declares independence.":GOTO350
340 NEXTI:RETURN
350 PL(I,0)=-1:GX(PL(I,1),PL(I,2))=-1:CP=CP+.0001
360 EM$(RD,4)=STR$(VAL(EM$(RD,4))-1):GOTO340
400 A=1:B=200
410 IFMS(A,0)THENIFMS(A,0)<6THENIFX=MS(A,2)THENRETURN
420 A=A+1:IFA<BTHEN410
430 A=.:RETURN
440 FORB=0TO5:MS(A,B)=0:NEXTB:RETURN
450 IFMS(A,0)THENIFMS(A,0)>5ANDMS(A,0)<9THENIFX=MS(A,4)THENRETURN
460 A=A+1:IFA<BTHEN450
470 A=.:RETURN
499 REM ****GALAXY MAP
500 PRINT"{clear}{cyan} Space - Abort / (0) Independent world";
510 EN$="":OT$="":FORY=1TO20:IFEN$=" "THENOT$=R$:GOTO570
520 PRINTR$"{white}{space*2}";:FL=0:FORX=1TO35:IFFLTHENFL=0:GOTO565
525 IFGX(X,Y)=0THENPR$=".":GOTO560
530 C$=CHR$(64+G2(X,Y)):FL=1
550 ZZ=GX(X,Y):PR$="{cyan}0"+C$+"{white}":IFZZ>0THENPR$=MID$(ZC$,ZZ,1)+CHR$(192+ZZ)+C$+"{white}"
560 PRINTPR$;
565 NEXTX:GETEN$
570 NEXTY:PRINTOT$;:GOSUB5000:RETURN
600 OPEN1,U1,15:OPEN2,U1,2,"0:gal.spy."+STR$(C)+",s,a":INPUT#1,E
610 IFETHENCLOSE2:OPEN2,U1,2,"0:gal.spy."+STR$(C)+",s,w"
620 PRINT#2,"----------------------------------------"
630 PRINT#2,OU$:CLOSE2:CLOSE1:RETURN
640 IN$="":PC$="0123456789":IFTTTHENPC$=PC$+"abcdefghijklmnopqrstuvwxyz!?* .'/-"
643 PC$=PC$+CHR$(20)+R$:IFMA=0THENMA=80
645 GETZN$:IFZN$=""THEN645
650 ZN$=CHR$(ASC(ZN$)AND127):IFINSTR(PC$,ZN$)=0THEN645
655 IFZN$=R$THENIN=VAL(IN$):TT=1:MA=0:PRINT:RETURN
660 IFZN$<>CHR$(20)THEN675
665 IFLEN(IN$)=0THEN645
670 PRINTZN$;:IN$=LEFT$(IN$,LEN(IN$)-1):GOTO645
675 IFLEN(IN$)=MATHEN645
677 IFASC(ZN$)<65ORASC(ZN$)>90THEN680
678 IFLEN(IN$)=0ORRIGHT$(IN$,1)=" "THENZN$=CHR$(ASC(ZN$)OR128)
680 PRINTZN$;:IN$=IN$+ZN$:IFMA>1THEN645
685 ZN$=R$:GOTO655
690 MA=1:TT=1:GOSUB640:IN=ASC(IN$+CHR$(0)):IN=IN-192:IFIN<1ORIN>26THENIN=0
695 A$=IN$:RETURN
997 REM *******************************
998 REM *********SETUP + LOAD *********
999 REM *******************************
1000 DIMGX(35,20),PL$(25),PL(25,4),EM$(10,4),RD,TL(20,4),G2(35,20),MS(201,5)
1003 F$="gal.prevs":GOSUB130
1005 TT=1:PRINT"{down*2}{pink}{ct n}Creating the universe...";
1010 OPEN1,U1,15:OPEN2,U1,2,"0:gal.galaxy"
1020 FORI=1TO10:GOSUB20:FORX=0TO4:INPUT#2,EM$(I,X):NEXTX:NEXTI
1030 FORI=11TO35:GOSUB20:X=I-10
1040 INPUT#2,PL$(X):FORY=0TO4:INPUT#2,PL(X,Y):NEXTY
1050 NEXTI:I=36:GOSUB20:INPUT#2,ID,DT$:V1=0:REMGOSUB10200 ***FOR TESTING
1054 CLOSE2:CLOSE1:OPEN1,U1,15:OPEN2,U1,2,"0:gal.missions":I=1
1055 GOSUB20:INPUT#2,A:IFA=0ORI>199THENCLOSE2:CLOSE1:GOTO1060
1057 MS(I,0)=A:FORY=1TO5:INPUT#2,MS(I,Y):NEXTY:I=I+1:GOTO1055
1060 FORI=1TO25:GX(PL(I,1),PL(I,2))=PL(I,0):G2(PL(I,1),PL(I,2))=I
1070 NEXTI:RD=0:FORI=1TO10:IFID=VAL(EM$(I,0))THENRD=I
1080 NEXTI
1090 IFRDTHEN1270
1100 PRINTR$"{down}{yellow}-- New emperor --":RD=0
1110 FORI=1TO10:IFVAL(EM$(I,0))=0ANDRD=0THENRD=I
1120 NEXTI:IFRD=0THENPRINT"{down*2}{light green}Sorry, all slots full. Try again later.":END
1130 A=0:FORI=1TO25:IFPL(I,0)=-1THENA=1
1140 NEXTI:IFA=0THENPRINT"{down*2}{light green}Sorry, no free planets. Try again later.":END
1150 A=INT(RND(TI)*25)+1:IFPL(A,0)<>-1THEN1150
1160 PRINT"{down*2}{light green}Your capitol planet is "PL$(A)R$"{down*2}Enter your empire's name:"
1170 EM$(RD,0)=STR$(ID):EM$(RD,3)=STR$(A):EM$(RD,2)="":GOSUB640:PL(A,0)=RD
1180 EM$(RD,2)=IN$:IFLEN(EM$(RD,2))<2THENPRINTR$"{red}You no wanna play...":END
1190 GX(PL(A,1),PL(A,2))=RD:EM$(RD,4)="1":G2(PL(A,1),PL(A,2))=A:XD$=CHR$(192+RD)
1195 IFLEN(EM$(RD,2))>15THENPRINT"{down*2}{white}-- less than 15 chars please --{light green}":GOTO1160
1200 PRINT"{down}Uppercase '"XD$"'s identify worlds with":EM$(RD,1)="91/01/01"
1210 PRINT"emperical loyalty to you. Lowercase"
1220 PRINT"letters on charts are entered to access"
1230 PRINT"individual planets.":PL(A,4)=PL(A,4)+(PL(A,3)*60)
1250 OPEN1,U1,15:OPEN2,U1,2,"gal.galaxy":I=RD:GOSUB20:X=I:GOSUB60
1260 I=VAL(EM$(RD,3)):I=I+10:GOSUB20:X=I-10:GOSUB70:CLOSE2:CLOSE1
1270 I=1:IFDT$=EM$(RD,1)ANDV1=0THENPRINTR$"{red} -- Only 1 play per day! --":END
1280 PRINT:OPEN1,U1,15:OPEN2,U1,2,"0:gal.spy."+STR$(RD)+",s,r"
1290 INPUT#1,E:CLOSE1:CLOSE2:IFETHEN1900
1300 PRINTR$"{cyan}Transmissions:":F$="gal.spy."+STR$(RD):GOSUB130
1900 YR=1:PRINTR$"{down*2}{yellow}Your capitol planet is "+PL$(VAL(EM$(RD,3)))
1910 T1=1
1915 IFMS(T1,0)THENIFMS(T1,0)=8THENIFMS(T1,4)=RDTHEN1930
1920 T1=T1+1:IFT1<200THEN1915
1925 GOTO2000
1930 MS$=STR$(MS(T1,1)):MS$=MID$(MS$,2,LEN(MS$))
1935 PRINTR$"{white}"EM$(MS(T1,5),2)"{light green} offers {white}"MS$"{light green} ships"R$"for a peace treaty."
1940 PRINT"{down}A)ccept, R)eject, or B)arter: {white}";
1945 GOSUB690:IFA$<>"A"ANDA$<>"R"ANDA$<>"B"THEN1930
1950 IFA$="A"THENX=7:P1=VAL(EM$(RD,3)):OU$="accepts your"
1960 IFA$="R"ORA$="B"THENX=0:P1=VAL(EM$(MS(T1,5),3)):OU$="rejects your"
1965 IFA$="B"THENOU$="wants more"+R$+"than"+STR$(MS(T1,1))+" ships for a"
1970 C=MS(T1,5):OU$=EM$(MS(T1,4),2)+" "+OU$+" peace treaty.":GOSUB600
1975 MS(T1,0)=X:PL(P1,4)=PL(P1,4)+MS(T1,1)
1980 IFA$<>"A"THENA=T1:GOSUB440:GOTO1920
1983 FORO1=1TO200:IFMS(O1,0)=5THENIFMS(O1,4)=RDANDM(O1,5)=MS(T1,5)THEN1990
1985 NEXTO1:GOTO1920
1990 P1=MS(O1,3):PL(P1,4)=PL(P1,4)+MS(O1,1)
1995 OU$="Containment Patrol arrives"+R$+"home from "+PL$(MS(O1,2))
1996 C=MS(O1,5):GOSUB600:A=O1:GOSUB440:GOTO1985
1997 REM ******************************
1998 REM ********MAIN ROUTINES*********
1999 REM ******************************
2000 A=FRE(1):S%=100:YR$=STR$(YR):YR$="0"+MID$(YR$,2,LEN(YR$)):IFYR=11THEN200
2010 PRINTR$R$"{white}Year[{yellow}"+RIGHT$(YR$,2)+"/10{white}]<{cyan}?{white}>{light green}Command:{white} ";
2020 GOSUB690:IFA$=""THEN3000
2040 IFA$="C"THENGOSUB30:GOTO2000
2050 IFA$<>"?"THEN2190
2060 PRINT"{clear}{down}{light gray}{reverse on} Galactic Empire Menu "
2070 PRINT"{purple}{cm y*22}"
2080 PRINT" {light gray}{reverse on} Y {reverse off} {red}Your empire!"
2090 PRINT" {light gray}{reverse on} C {reverse off} {pink}View galactic chart"
2100 PRINT" {light gray}{reverse on} S {reverse off} {yellow}Scout mission"
2110 PRINT" {light gray}{reverse on} L {reverse off} {white}List other Empires"
2120 PRINT" {light gray}{reverse on} E {reverse off} {cyan}Equip/Reinforce a planet"
2130 PRINT" {light gray}{reverse on} A {reverse off} {light blue}Attack a planet"
2140 PRINT" {light gray}{reverse on} G {reverse off} {blue}Galactic battle news"
2150 PRINT" {light gray}{reverse on} R {reverse off} {purple}Galactic Empire rules"
2155 PRINT" {light gray}{reverse on} P {reverse off} {red}Patrol fleets"
2156 PRINT" {light gray}{reverse on} I {reverse off} {pink}Intelligence mission"
2157 PRINT" {light gray}{reverse on} V {reverse off} {yellow}View transmissions"
2158 PRINT" {light gray}{reverse on} T {reverse off} {white}Make/Break treaties"
2160 PRINT" {light gray}{reverse on} M {reverse off} {cyan}Send a transmission"
2163 PRINT" {light gray}{reverse on} Q {reverse off} {light blue}Quit to the BBS"
2170 PRINT:PRINT"{light gray}{reverse on} RETURN {reverse off} {blue}End this year."
2180 GOTO2000
2190 IFA$="Q"THENPRINTR$"{yellow}Quit - positive (y/n)? {white}";:GOSUB690:IFA$="Y"THEN220
2200 IFA$="L"THENPRINT:GOSUB4000:GOTO2000
2210 IFA$="G"THENF$="gal.news":GOSUB130:GOTO2000
2220 IFA$="R"THENF$="gal.rules":GOSUB130:GOTO2000
2230 IFA$="S"THENTY=1:GOSUB4500:GOTO2000
2240 IFA$="A"THENTY=2:GOSUB4500:GOTO2000
2250 IFA$="E"THENTY=3:GOSUB4500:GOTO2000
2260 IFA$="Y"THENX=RD:GOSUB5500:GOTO2000
2270 IFA$="V"THENGOSUB6000:ONSGN(X)GOSUB5500:GOTO2000
2280 IFA$="P"THENGOSUB6200:ONSGN(TY)GOSUB4500:GOTO2000
2290 IFA$="I"THENTY=6:GOSUB4500:GOTO2000
2300 IFA$="T"THENGOSUB6300:ONSGN(TY)GOSUB4500:GOTO2000
2310 IFA$="M"THEN6400
2996 GOTO2000
2997 REM ******************************
2998 REM *******MISSION REPORTS********
2999 REM ******************************
3000 REM
3010 YR=YR+1:PO=0:F1=0:FORI=0TO20:IFTL(I,1)<>YRTHEN3985
3020 TY=TL(I,0):S=TL(I,3):D=TL(I,4):SH=TL(I,2)
3030 A$=CHR$(64+G2(PL(D,1),PL(D,2))):IFTY=0THEN3985
3040 PO=1:ONTYGOTO3100,3500,3300,3200,3200,3700,3800,3900,3200
3100 TL(I,0)=0:PRINT"{down}{pink}Scout ships reach {white}"PL$(D)" ("A$"){pink}"
3102 X=D:GOSUB400:X=RND(TI):Y=0:IFAANDMS(A,0)=4ANDMS(A,1)>=(SH*20)THENY=1
3110 IFX>.95ORYTHENPRINT"They were eliminated before transmission.":GOTO3980
3120 PRINT"Report: {light blue}Ships:"PL(D,4)R$"{space*9}Prod:"PL(D,3):GOTO3980
3200 PRINT"{down}{pink}Patrol ships reach {white}"PL$(D) " ("A$"){pink}"
3205 X=D:Y=0:GOSUB400:IFAANDTY<>9THENIFMS(A,5)=RDTHENY=A
3207 IFYTHENPRINT"Reinforcement acknowledged.":MS(Y,1)=MS(Y,1)+SH:GOTO3980
3208 IFA=0ANDTY=9THENPRINT"No patrol here to defeat!":X=0:GOTO3350
3210 IFATHEN3230
3215 PRINT"Your patrol takes position!":Z=0
3220 Z=Z+1:IFMS(Z,0)THEN3220
3225 MS(Z,0)=TY:MS(Z,1)=SH:MS(Z,2)=D:MS(Z,3)=S:MS(Z,4)=PL(D,0):MS(Z,5)=PL(S,0)
3226 GOTO3980
3230 PRINT"Patrol skirmishes commence!"R$TAB(5)"{pink}You"TAB(11)"{blue}Them"
3235 KK=INT(RND(TI)*INT((SH+MS(A,1))/25))+10
3240 PRINTTAB(5)"{pink}"SH;TAB(11)"{blue}"MS(A,1)"{space*2}";
3250 SH=SH-(INT(RND(TI)*KK)+8):IFSH<0ORSH*10<MS(A,1)THEN3280
3260 MS(A,1)=MS(A,1)-(INT(RND(TI)*KK)+8):IFMS(A,1)<0ORMS(A,1)*10<SHTHEN3290
3270 PRINTCHR$(20);:IFPOS(0)>5THEN3270
3275 GOTO3240
3280 PRINTR$R$"{pink}Your patrol is beaten off!":GOTO3980
3290 PRINTR$R$"{pink}You beat off the other patrol!"R$:IFTY<>9THENZ=A:GOTO3225
3295 GOSUB440:GOTO3980
3300 TL(I,0)=0:PRINT"{down}{yellow}Reinforcements reach {white}"PL$(D)" ("A$")":PL(D,4)=PL(D,4)+SH
3305 X=D:GOSUB400:IFAANDMS(A,0)=5ANDMS(A,1)>=1000THEN3330
3310 IFPL(D,0)=PL(S,0)THENPRINT"{yellow}Your generals acknowledge reception.":GOTO3980
3320 PRINT"{yellow}They radio their thanks for the gift.":GOTO3980
3330 X=INT(SH*.1):PRINT"{yellow}Patrol forces capture{white}"+STR$(X)+" {yellow}ships."
3335 PRINT"Reinforcement mission aborted."
3340 PL(D,4)=PL(D,4)-SH:MS(A,1)=MS(A,1)+X:SH=SH-X:X=0
3350 Y1=ABS(PL(D,1)-PL(S,1)):Y2=ABS(PL(D,2)-PL(S,2)):Y=YR+INT((Y1+Y2)/2)
3360 IFTL(X,0)>0THENX=X+1:GOTO3360
3365 IFYR-Y=0THENI=X:GOTO3300
3370 TL(X,0)=3:TL(X,1)=Y:TL(X,2)=SH:TL(X,3)=S:TL(X,4)=S:IFY<12THEN3980
3380 PL(S,4)=PL(S,4)+SH:TL(X,0)=0:GOTO3980
3500 TL(I,0)=0:AA=LEN(PL$(D)):IFPL(D,0)=PL(S,0)THEN3300
3502 X=D:GOSUB400:X=MS(A,1):IFA=0ORMS(A,0)<>4THEN3519
3505 IFX<=500THENGOSUB440:X=INT((.1*(500/X))*SH):SH=SH-X:GOTO3517
3507 IFX<=2000THENX=INT(SH*.15):SH=SH-X:GOTO3515
3510 IFX<=5000THENX=INT(SH*.3):SH=SH-X:GOTO3515
3513 X=INT(SH*(10000/X):SH=SH-X:IFSH<20THENSH=20
3515 MS(A,1)=MS(A,1)-INT(X+(X*.5)):IFMS(A,1)<500THENGOSUB440
3517 PRINT"{down}{yellow}Patrol forces clip{white}"+STR$(X):PRINT"{yellow}ships from your fleet."
3519 PRINT"{down}{red}"EM$(RD,2)" attack ships engage"R$"enemy defenses at {white}"PL$(D);
3520 PRINT" ("A$")"R$"{red}Battles commence:"R$TAB(5)"{pink}"PL$(D)TAB(6+AA)"{light blue}"EM$(RD,2)
3530 PRINTTAB(5)"{pink}"PL(D,4)TAB(6+AA)"{light blue}"SH;"{space*2}";
3540 KK=INT((SH+PL(D,4))/50)+8:K1=INT(RND(TI)*KK)+4:K2=INT(RND(TI)*KK)+6
3550 SH=SH-K2:IFSH<0ORSH*10<PL(D,4)THEN3590
3560 PL(D,4)=PL(D,4)-K1:IFPL(D,4)<0ORPL(D,4)*10<SHTHEN3610
3570 PRINTCHR$(20);:IFPOS(0)<>5THEN3570
3580 GOTO3530
3590 PRINTR$R$"{yellow}Your forces surrender in defeat.":PL(D,4)=PL(D,4)+ABS(SH)
3600 I$=EM$(RD,2)+" defeated at "+PL$(D):GOSUB80:GOTO3980
3610 PRINTR$R$"{yellow}Enemy forces surrender!":PRINT"You have annexed "PL$(D)".
3615 EM$(RD,4)=STR$(VAL(EM$(RD,4))+1):J=PL(D,0)
3620 I$=EM$(RD,2)+" annexes "+PL$(D):GOSUB80:IFJ<0THEN3680
3630 EM$(J,4)=STR$(VAL(EM$(J,4))-1):IFVAL(EM$(J,3))<>DTHEN3680
3640 PRINTR$"{light green}"EM$(J,2)" is dissolved!":FORA=1TO200
3645 IFMS(A,0)THENIFMS(A,4)=JORMS(A,5)=JTHENGOSUB440
3647 NEXTA:OPEN1,U1,15,"s0:gal.spy."+STR$(J):CLOSE1
3650 EM$(J,0)="0":EM$(J,1)="91/01/01":EM$(J,2)="^":EM$(J,3)=" -26":EM$(J,4)="0"
3660 FORW=1TO25:IFPL(W,0)=JTHENPL(W,0)=-1:GX(PL(W,1),PL(W,2))=-1
3670 NEXTW
3680 PL(D,4)=PL(D,4)+ABS(SH):PL(D,0)=RD:GX(PL(D,1),PL(D,2))=RD:GOTO3980
3700 TL(I,0)=0:PRINT"{down}{pink}Intelligence ships reach {white}"PL$(D)" ("A$"){pink}":A=1:B=200
3710 X=PL(D,0):GOSUB450:IFAANDMS(A,0)=6ANDMS(A,5)=PL(S,0)THEN3730
3720 IFATHENA=A+1:GOTO3710
3724 A=0
3725 A=A+1:IFMS(A,0)THEN3725
3727 IFSH<2200THENPRINT"You need at least 2200 ships to setup!":X=0:GOTO3350
3728 SH=SH-2000
3730 MS(A,0)=6:MS(A,1)=MS(A,1)+SH:MS(A,2)=D:MS(A,3)=S
3740 MS(A,4)=PL(D,0):MS(A,5)=PL(S,0):PRINT"{down}Espionage crews report:"
3750 X=VAL(EM$(PL(D,0),4))*200:P%=INT((SH/X)*100)
3760 PRINT"System currently working at {white}"+STR$(P%)+"{pink}%"
3770 IFP%<100THENPRINTSTR$(X)+" ships needed for 100% accuracy."
3780 GOTO3980
3800 TL(I,0)=0:PRINT"{down}{pink}Ambassador ships reach {white}"PL$(D)" ("A$"){pink}":A=1:B=200
3805 X=PL(D,0):GOSUB450:IFAANDMS(A,0)=7ANDMS(A,5)=PL(S,0)THEN3830
3810 IFATHENA=A+1:GOTO3805
3814 A=0
3815 A=A+1:IFMS(A,0)THEN3815
3820 MS(A,0)=8:MS(A,1)=SH:MS(A,2)=D:MS(A,3)=S:MS(A,4)=PL(D,0):MS(A,5)=PL(S,0)
3825 PRINT"Your offer is being considered; check"
3826 PRINT"your transmissions on your next play"
3827 PRINT"for a reply.":GOTO3980
3830 PRINT"{down}Your ambassadors acknowledge the gift."
3835 MS(A,1)=MS(A,1)+SH:GOTO3890
3900 TL(I,0)=0:PRINT"{down}{pink}Ambassador ships reach {white}"PL$(D)" ("A$"){pink}":A=1:B=200
3905 X=PL(S,0):GOSUB450:IFAANDMS(A,0)=7ANDMS(A,5)=PL(D,0)THEN3920
3910 IFATHENA=A+1:GOTO3905
3915 PRINT"{down}{yellow}You cannot break a treaty with them.":PL(D,4)=PL(D,4)+SH:GOTO3320
3920 MS(A,1)=MS(A,1)-SH:P1=MS(A,4):IFMS(A,1)<1THENGOSUB440:A=0
3930 IFATHENPRINT"{down}{yellow}You must send"+STR$(MS(A,1))+" more ships"
3935 IFATHENPRINT"to effectively break this treaty.":GOTO3980
3940 PRINT"{down}{yellow}Your treaty with {white}"+PL$(D)+R$+"{yellow}is now null and void.":GOTO3980
3980 IFF1THENF1=0:RETURN
3983 TL(I,0)=0
3985 NEXTI:IFPO=0THENPRINT"{down}{cyan}No mission completions reported."
3990 GOSUB170:GOSUB300:GOTO2000
3997 REM ******************************
3998 REM *******ASSIGN MISSIONS********
3999 REM ******************************
4000 FORI=1TO10:D=0:IFVAL(EM$(I,0))=0THEN4040
4010 PRINT"{cyan}"CHR$(192+I)">{white}"EM$(I,2);:Q=VAL(EM$(I,4))
4020 PRINTTAB(20)"{space*2}{light blue}Planets:{white}";Q
4030 IFQ=0THENEM$(I,0)=" 0":EM$(I,2)="^":EM$(I,4)="0"
4040 Q=0:NEXTI:PRINT:PRINT:RETURN
4300 PRINT"{cyan}"+P$+" {white}";
4310 GOSUB690
4320 IFA$="?"THENGOSUB30:GOTO4300
4330 IFA$="*"THENPRINT:GOSUB4000:GOTO4300
4340 IFA$="!"THENPRINT:X=RD:GOSUB5500:GOTO4300
4350 IFA$=""THENRETURN
4360 IFIN=0THEN4300
4370 RETURN
4500 FL=0:GOSUB30
4510 PRINTR$"{green}?) Galactic chart{space*3}{light green}*) Other Empires"
4520 PRINT"{white}!) Your Empire{space*6}{cyan}Note: Lowercase"
4530 PRINT"letters to the right identify worlds!"
4540 P$=R$+"(a-y) Source world:":GOSUB4300:IFA$=""THENRETURN
4550 A=IN:IFPL(A,0)<>RDTHENPRINT"{white} -- Not under your control!":GOTO4510
4560 PRINT"{down}{light blue}Planet {white}"+PL$(A):PRINT"{light blue}Ships:{white}"PL(A,4)"{light blue}/ Prod:{white}"PL(A,3):S=A
4570 P$=R$+"(a-y) Destination world:":GOSUB4300:IFA$=""THENRETURN
4580 D=IN
4585 IFS=DTHENIFTY<>4ANDTY<>9THENPRINT"{down}{pink}You can't do that to yourself!":RETURN
4590 SH=0:TT=0:PRINT"{down}{cyan}How many ships:{white} ";:GOSUB640:SH=IN:IFSH>PL(A,4)THEN4590
4595 IFTY=1THENIFSH<20THENPRINT:PRINT"At LEAST 20 ships!":RETURN
4600 I=0:IFSH<1THENRETURN
4610 Y1=ABS(PL(S,1)-PL(D,1)):Y2=ABS(PL(S,2)-PL(D,2)):Y=YR+INT((Y1+Y2)/2):I=1
4620 IFTL(I,0)THENI=I+1:GOTO4620
4630 TL(I,0)=TY:TL(I,1)=Y:TL(I,2)=SH:TL(I,3)=S:TL(I,4)=D:PL(S,4)=PL(S,4)-SH
4640 B$="to":IFTY=2THENA$="attack":B$="against"
4650 IFTY=3THENA$="reinforcement"
4651 IFTY=1THENA$="scouting"
4652 IFTY=4ORTY=5ORTY=9THENA$="patrol"
4653 IFTY=6THENA$="intellegence"
4654 IFTY=7ORTY=8THENA$="treaty":IFPL(D,0)=-1THEN4985
4658 IFY-YR=0ANDY<12THENF1=1:GOTO3020
4659 IFY<12THEN4685
4660 PRINT"{white} Sorry, a movement of that distance"
4670 PRINT"is a tactical impossibility at this"
4680 PRINT"time. (Not enough years left today.)":PL(S,4)=PL(S,4)+SH:RETURN
4685 X=S:GOSUB400:IFAANDMS(A,0)=5THEN4720
4690 OU$="Planet "+PL$(S)+" launches a"+R$+A$+" mission "+B$+" "+PL$(D)+"."
4691 O1$=R$+"{down}E.T.A."+STR$(Y-YR)+" years.":A=1:B=200
4700 X=PL(S,0):GOSUB450:C=VAL(EM$(X,4)):IFA=0THENPRINT"{down*2}{green}"OU$O1$:RETURN
4710 IFMS(A,0)=6THENC=MS(A,1)/(C*200):IFRND(TI)<CTHENC=MS(A,5):GOSUB600
4712 IFMS(A,0)=7ANDMS(A,4)=RDANDMS(A,5)=PL(D,0)THENIFTY=2ORTY=5THEN4980
4715 A=A+1:GOTO4700
4720 PRINT"{down*2}{yellow}Enemy Patrol orbits {white}"PL$(S)" ("+CHR$(S+64)+"){yellow}"
4730 ONTYGOTO4750,4800,4770,4790,4790,4761,4690,4690,4790
4750 PRINT"{yellow}Scout mission is turned back.":PL(S,4)=PL(S,4)+SH:TL(I,0)=0
4760 RETURN
4761 PRINT"{yellow}Intelligence mission is turned back.":PL(S,4)=PL(S,4)+SH:TL(I,0)=0
4762 RETURN
4770 X=INT(SH*.1):PRINT"{yellow}They capture{white}"+STR$(X)+" {yellow}reinforcement ships."
4780 PL(S,4)=PL(S,4)+SH-X:MS(A,1)=MS(A,1)+X:TL(I,0)=0:X=0:RETURN
4790 F1=1:TY=4:D=S:TL(I,0)=0:GOTO3230
4800 PRINT"Patrol skirmishes commence!"R$TAB(5)"{pink}You"TAB(11)"{blue}Patrol":TL(I,0)=0
4810 PRINTTAB(5)"{pink}"SH;TAB(11)"{blue}"MS(A,1);:KK=INT(RND(TI)*INT((SH+MS(A,1))/25))+4
4820 SH=SH-(INT(RND(TI)*5)+KK):IFSH<0ORSH*10<MS(A,1)THEN4860
4830 MS(A,1)=MS(A,1)-(INT(RND(TI)*5)+KK):IFMS(A,1)<0ORMS(A,1)*10<SHTHEN4870
4840 PRINTCHR$(20);:IFPOS(0)>5THEN4840
4850 GOTO4810
4860 PRINTR$R$"{pink}Your attack is beaten off!":RETURN
4870 PRINTR$R$"{pink}You beat off the other patrol!"R$:PL(S,4)=PL(S,4)+SH
4880 GOSUB440:RETURN
4980 PRINT"{red}{down}That is illegal due to your treaty"
4981 PRINT"with "EM$(PL(D,0),2)".":TL(I,0)=0:PL(S,4)=PL(S,4)+SH:RETURN
4985 PRINT"{down}{red}You may not hold a treaty with an"
4986 PRINT"independent planet.":TL(I,0)=0:PL(S,4)=PL(S,4)+SH:RETURN
4997 REM ******************************
4998 REM ********EMPORER/STATUS********
4999 REM ******************************
5000 A=0:FORI=1TO25:IFPL(I,0)<>RDTHENA=1
5010 NEXTI:IFA=1THENRETURN
5020 PRINT:PRINT"{down*3}{white}** {cyan}You are emperor of the Galaxy!!":FORI=1TO25:PL(I,0)=-1
5030 PL(I,4)=PL(I,3)*INT(RND(TI)*10)+1:NEXTI:OPEN1,U1,15,"s0:gal.news"
5035 FORA=0TO200:GOSUB440:NEXTA
5040 OPEN8,U1,8,"gal.prevs,s,r":INPUT#1,E:IFE=0THEN5060
5050 CLOSE8:OPEN8,U1,8,"gal.prevs,s,w":PRINT#8,"Previous Emperors-{down}"
5060 CLOSE8:CLOSE1:OPEN8,U1,8,"gal.prevs,s,a":PRINT#8,EM$(RD,2)+"{space*6}"+DT$
5070 CLOSE8:CLOSE1:I$=EM$(RD,2)+" controls the galaxy!":GOSUB80
5080 FORA=0TO4:EM$(RD,0)="0":NEXTA:GOTO220
5500 PRINTR$"{cyan}Planets in {white}"+EM$(X,2)+" ("+CHR$(X+192)+")"+R$
5505 PRINT"{light gray}{reverse on}{space*4}Planet{space*10}Ships{space*2}Prod. ":FORI=1TO25
5510 IFPL(I,0)<>X OR(INT(RND(TI)*100)+1)>S%THEN5540
5520 PRINT"{light gray}{reverse on} "CHR$(64+G2(PL(I,1),PL(I,2)))" {reverse off}"TAB(4)"{white}"PL$(I)"{yellow}"TAB(20)PL(I,4);
5530 PRINT"{pink}"TAB(27)PL(I,3)
5540 NEXTI:RETURN
6000 PRINT"{clear}";:F$="gal.spy."+STR$(RD):GOSUB130
6010 IFITHENPRINT:PRINT"{yellow}No Current reports.":X=0:GOTO6050
6020 X=0:PRINT:PRINT"{pink}File this report or keep it (f/k): {white}";:GOSUB690
6025 IFA$=""THENRETURN
6030 IFA$="K"THEN6050
6040 PRINT"{down}{red}Filing...":OPEN1,U1,15,"s0:"+F$:CLOSE1
6050 I$="":PRINT"{down}{purple}Intellegence Report (Empire A-J): {white}";:GOSUB690
6052 IFIN<1ORIN>10THENX=0:RETURN
6055 IFA$=""THENRETURN
6060 A=1:B=200:X=IN:IFVAL(EM$(X,0))=0ORX=RDTHENX=0:RETURN
6070 GOSUB450:IFAANDMS(A,0)=6ANDMS(A,5)=RDTHEN6100
6080 IFATHENA=A+1:GOTO6070
6090 X=0:PRINT"{down}{blue}No intellegence crew on that empire!":RETURN
6100 S%=VAL(EM$(X,4))*200
6110 IFS%=0THENPRINT"{down}{blue}Empire is dissolved!":X=0:RETURN
6120 S%=INT((MS(A,1)/S%)*100):RETURN
6200 PRINT:PRINT"{light blue}A D)efensive Patrol, C)ontainment Patrol,"
6201 PRINT"or A)nti-Patrol: {white}";:
6205 GOSUB690
6210 TY=0:IFA$="D"ORA$="d"THENTY=4
6220 IFA$="C"ORA$="c"THENTY=5
6225 IFA$="A"ORA$="a"THENTY=9
6230 IFTYTHENRETURN
6240 PRINT:RETURN
6300 PRINT:PRINT"{light blue}L)ist your treaties,"R$"M)ake or B)reak a treaty? {white}";
6305 GOSUB690
6310 TY=0:IFA$="M"ORA$="m"THENTY=7
6320 IFA$="B"ORA$="b"THENTY=8
6330 IFA$="L"ORA$="l"THEN6350
6340 IFTYTHENRETURN
6345 PRINT:RETURN
6350 PRINT"{down}{white}You have treaties with:"
6353 FORA=1TO200:IFMS(A,0)<>7THEN6390
6355 IFMS(A,4)<>RDANDMS(A,5)<>RDTHEN6390
6357 I=5:A$="Ships received":IFMS(A,5)=RDTHENA$="Ships sent":I=4
6360 PRINT"{down}{yellow}"+CHR$(MS(A,I)+192)+"{white}) {light green}"+EM$(MS(A,I),2)+"{space*3}{yellow}"A$":{white}";MS(A,1)
6370 IFA$="Ships received"THENPRINT"{yellow}This is a binding treaty."
6390 NEXTA:GOTO6300
6400 PRINT"{down}{light green}Send to which empire (A-J): {white}";
6410 GOSUB690:IFIN=0ORIN=RD ORVAL(EM$(IN,0))=0THEN2000
6420 C=IN:PRINTR$"{light green}Message to send"+R$+": {white}";
6430 GOSUB640:IFIN$=""THEN2000
6440 OU$="Message from "+EM$(RD,2)+R$+IN$:GOSUB600:GOTO2000
10200 FAST:PRINTCHR$(27)"s";:I=36:GOSUB20:IFID=1THENID=2:PRINT#2,ID;R$;"0":ELSEID=1:PRINT#2,ID;R$;"0"
10210 V1=1:RETURN
