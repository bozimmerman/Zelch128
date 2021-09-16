!--------------------------------------------------
!- Thursday, September 16, 2021 2:47:02 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.wm.utilities.prg
!- Unknown Machine
!--------------------------------------------------
5 PRINTPEEK(2961)
10 DV=8:LU=0:LU$=MID$(STR$(LU),2)
20 R$=CHR$(13):DIMA$(20),DD$(20),DD(20),MM$(50):WW$(0)="none":AA$(0)="none":SS$(0)="none":DIMXX(25),YY(25),OP(25),DT$(25),DU$(25),MX(16),M(12),K$(100)
30 CK$="00000000000000000000000000000000000000000000000":KT$="...................................."
40 FORX=1TO10:READAA$(X):NEXT:FORX=1TO10:READSS$(X):NEXT:FORX=1TO10:READWW$(X):NEXT
50 FORX=1TO16:READMX(X):NEXT
60 R$=CHR$(13):Z$="0"+R$:AZ$="none"+R$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$+Z$
70 FORX=1TO12:READM(X):NEXT
80 PRINTCHR$(14)CHR$(27)+"f"
85 IFPEEK(2961)=2THENGOTO3000:REM AUTO-MAINT
90 GOTO1470
100 REM ----- MONSTER EDITOR ---------------------------------------------------
110 INPUT"{cyan}{clear}What monster level would you like to load";L$:IFVAL(L$)<1ORVAL(L$)>10THEN110
120 PRINTR$"Loading Monster Level "L$;:OPEN2,DV,2,""+LU$+":wm.ml "+L$+",s,r"
130 FORX=1TO10:PRINT".";:
140 INPUT#2,NN$(X),AA(X),DD(X),GG(X),EE(X),DM(X):NEXT
150 FORX=1TO26:INPUT#2,MM$(X):PRINT".";:NEXT
160 X=0
170 X=X+1:INPUT#2,XX(X),YY(X),OP(X),DT$(X),DU$(X):PRINT".";
180 IFST=0THEN170
190 CLOSE2:PRINT:PL=X
200 PRINT"{clear}";
210 PRINT"{light gray}{reverse on}";:FORX=1TO77:PRINT" ";:NEXT:PRINT
220 PRINT"{light gray}{reverse on} {reverse off}{white}Name"TAB(17)" {light gray}{reverse on} {reverse off}"TAB(19)"{cyan}Attack{space*2}{light gray}{reverse on} {reverse off}"TAB(27)"{purple}Defense{space*3}{light gray}{reverse on} {reverse off}"TAB(36)"{yellow}Gold {sh space}{space*2}{light gray}{reverse on} {reverse off}"TAB(42)"{orange}Experience {light gray}{reverse on} {reverse off}"TAB(54)"{pink}Dam Var";
230 PRINT" {light gray}{reverse on} {reverse off}{green}Num"TAB(76)"{light gray}{reverse on} {reverse off}"
240 PRINT"{reverse on}{light gray}";:FORX=1TO77:PRINT" ";:NEXT:PRINT
250 FORX=1TO10
260 PRINT"{light gray}{reverse on} {reverse off}{white}"LEFT$(NN$(X),16)TAB(17)" {light gray}{reverse on} {reverse off}{cyan}"AA(X)TAB(27)"{light gray}{reverse on} {reverse off}{purple}"DD(X)TAB(38)"{light gray}{reverse on} {reverse off}{yellow}"GG(X)TAB(47)"{light gray}{reverse on} {reverse off}{orange}"EE(X);
270 PRINTTAB(59)"{light gray}{reverse on} {reverse off}"TAB(50)"{pink}"DM(X)TAB(68)"{light gray}{reverse on} {reverse off}{green}"XTAB(76)"{light gray}{reverse on} {reverse off}"
280 NEXT
290 PRINT"{reverse on}{light gray}";:FORX=1TO77:PRINT" ";:NEXT:PRINT
300 PRINT"{reverse on}{light gray}";:FORX=1TO77:PRINT" ";:NEXT:PRINT:PRINT"{up}{reverse on} Level:"L$
310 PRINTCHR$(27)+"f":PRINT:PRINT"{light green}<{reverse on}E{reverse off}> Edit{space*2}<{reverse on}L{reverse off}> Load 'nother Level{space*2}<{reverse on}Q{reverse off}> Quit to Main:{pink}";
320 GETKEYA$:IFA$="e"ORA$="E"ORA$="l"ORA$="L"ORA$="q"ORA$="Q"THEN330:ELSE320
330 IFA$="E"ORA$="e"THENPRINT" Edit":GOSUB660
340 IFA$="L"ORA$="l"THENGOTO110
350 IFA$="Q"ORA$="q"THENPRINT" Quit to Main":PRINT"{white}Save changes before quitting? ";:GETKEYA$:IFA$="n"THENPRINT"No":GOTO1470
360 PRINT"Yes":GOSUB550
370 REM ----- INPUT ROUTINE (ALL CAPS) ----------------------------------------
380 I$=""
390 GETA$:IFA$=""THEN390
400 IFA$=CHR$(13)THENPRINT:RETURN
410 IFA$<>CHR$(20)THENI=ASC(A$):GOTO440
420 IFLEN(I$)<1THENPRINT"{ct g}";:GOTO390
430 I$=LEFT$(I$,LEN(I$)-1):PRINTA$;:GOTO390
440 IFLEN(I$)=MAXTHENPRINT"{ct g}";:GOTO390
450 GOSUB480:IFI=0THEN390
460 I$=I$+CHR$(I):PRINTCHR$(I);
470 IFMAX=1THENPRINT:RETURN:ELSEGOTO390
480 IF(I>47ANDI<58)OR(I>192ANDI<219)OR(I=32)THENRETURN
490 IFI>64ANDI<91THENI=I+128:ELSEIFI<>63THENI=0
500 RETURN
510 REM ----- YES/NO PROMPTS (PROMPT IS M$, SS=FLAG) --------------------------
520 PRINTM$;:GETKEYA$:IFA$="Y"ORA$="y"THENPRINT"Yes":SS=1:ELSEPRINT"No":SS=0
530 RETURN
540 END
550 REM ----- SAVE MONSTER LEVEL ---------------------------------------------
560 PRINT:PRINT:PRINT"{purple}Saving...";
570 OPEN2,DV,2,"@"+LU$+":wm.ml "+L$+",s,w"
580 FORX=1TO10:PRINT"{red}.";:
590 PRINT#2,NN$(X):PRINT#2,AA(X):PRINT#2,DD(X):PRINT#2,GG(X):PRINT#2,EE(X):PRINT#2,DM(X):NEXT
600 FORX=1TO26:PRINT"{purple}.";:
610 PRINT#2,MM$(X):NEXT
620 FORX=1TOPL:PRINT"{blue}.";:
630 PRINT#2,XX(X):PRINT#2,YY(X):PRINT#2,OP(X):PRINT#2,DT$(X):PRINT#2,DU$(X):NEXT
640 CLOSE2
650 GOTO1470
660 REM ----- EDIT A MONSTER -------------------------------------------------
670 A$="":B$="":C$="":D$="":E$="":F$="":G$=""
680 PRINTCHR$(27)+"f"
690 PRINTCHR$(27)+"f":PRINT"{cyan}What 'Num' do you wish to edit? ";:INPUTA$:A=VAL(A$)
700 PRINT:PRINT"{reverse on}{white}{space*2}Name{space*2}"TAB(20),"{space*2}Att{space*2}","{space*2}Def{space*2}","{space*2}Gold{space*2}","{space*2}Exp{space*2}","{space*2}DamV{space*3}"
710 A$="":PRINT"{dark gray}"NN$(A)TAB(20),AA(A),DD(A),GG(A),EE(A),DM(A)
720 PRINT"Go through and make the change, press return if there are no changes"
730 B$="":PRINTCHR$(27)+"f"
740 GETKEYF$:PRINTF$;:A$=A$+F$:IFF$=CHR$(13)ANDLEN(A$)=1THENPRINT"No Change":GOSUB930:GOTO770
750 IFF$=CHR$(13)THENA$=LEFT$(A$,(LEN(A$)-1)):GOSUB930:GOTO770
760 GOTO 740
770 GETKEYA$:PRINTA$;:B$=B$+A$:IFA$=CHR$(13)ANDLEN(B$)=1THENPRINT"No Change":GOSUB950:GOTO800
780 IFA$=CHR$(13)THENB$=LEFT$(B$,(LEN(B$)-1)):GOSUB950:GOTO800
790 GOTO 770
800 GETKEYA$:PRINTA$;:C$=C$+A$:IFA$=CHR$(13)ANDLEN(C$)=1THENPRINT"No Change":GOSUB970:GOTO830
810 IFA$=CHR$(13)THENC$=LEFT$(C$,(LEN(C$)-1)):GOSUB970:GOTO830
820 GOTO 800
830 GETKEYA$:PRINTA$;:D$=D$+A$:IFA$=CHR$(13)ANDLEN(D$)=1THENPRINT"No Change":GOSUB990:GOTO860
840 IFA$=CHR$(13)THEND$=LEFT$(D$,(LEN(D$)-1)):GOSUB990:GOTO860
850 GOTO 830
860 GETKEYA$:PRINTA$;:E$=E$+A$:IFA$=CHR$(13)ANDLEN(E$)=1THENPRINT"No Change":GOSUB1010:GOTO890
870 IFA$=CHR$(13)THENE$=LEFT$(E$,(LEN(E$)-1)):GOSUB1010:GOTO890
880 GOTO 860
890 GETKEYA$:PRINTA$;:G$=G$+A$:IFA$=CHR$(13)ANDLEN(G$)=1THENPRINT"No Change":GOSUB1030:GOTO200
900 IFA$=CHR$(13)THENG$=LEFT$(G$,(LEN(G$)-1)):GOSUB1030:GOTO200
910 GOTO 890
920 REM ----- CHECK FOR CHR$(13) ---------------------------------------------
930 IFA$=CHR$(13)THENNN$(A)=NN$(A):RETURN
940 NN$(A)=A$:RETURN
950 IFB$=CHR$(13)THENAA(A)=AA(A):RETURN
960 AA(A)=VAL(B$):RETURN
970 IFC$=CHR$(13)THENDD(A)=DD(A):RETURN
980 DD(A)=VAL(C$):RETURN
990 IFD$=CHR$(13)THENGG(A)=GG(A):RETURN
1000 GG(A)=VAL(D$):RETURN
1010 IFE$=CHR$(13)THENEE(A)=EE(A):RETURN
1020 EE(A)=VAL(E$):RETURN
1030 IFG$=CHR$(13)THENDM(A)=DM(A):RETURN
1040 DM(A)=VAL(G$):RETURN
1050 REM ----- SEE STATISTICS -------------------------------------------------
1060 PRINT"{clear}{yellow}What player number would you like to look at (0 to quit)";:INPUTA$:R=VAL(A$):IFR=0THEN1470
1070 PRINT"{cyan}Loading Character...":OPEN2,DV,2,""+LU$+":wm.players"
1080 PRINTCHR$(27)+"f":RECORD#2,R:RECORD#2,R
1090 INPUT#2,DD$(1):INPUT#2,DD(1):IFDD(1)=0THENPRINT"No character in that record.":PRINT:CLOSE2:GOTO1050:ELSEFORX=2TO19:INPUT#2,DD(X):NEXT:CLOSE2
1100 FORX=2TO19:DD$(X)=MID$(STR$(DD(X)),2):NEXT:DT$=RIGHT$(DD$(1),6):DD$(1)=LEFT$(DD$(1),LEN(DD$(1))-6)
1110 J$="":C$="":PRINT"{clear}{light gray}Character Statistics{space*2}{yellow}ID #{white}"DD(1):PRINT
1120 PRINT"{yellow}A> {cyan}Name{space*9}: {white}"DD$(1)TAB(40)"{yellow}B> {cyan}Last Played{space*2}: {white}"DT$
1130 PRINT"{yellow}C> {cyan}Strength{space*5}: {white}"DD$(2)TAB(40)"{yellow}D> {cyan}Dexterity{space*4}: {white}"DD$(3)
1140 PRINT"{yellow}E> {cyan}Constitution : {white}"DD$(4)TAB(40)"{yellow}F> {cyan}Weapon #{space*5}: {white}"DD$(5)
1150 PRINT"{yellow}G) {cyan}Armour #{space*5}: {white}"DD$(6)TAB(40)"{yellow}H) {cyan}Shield #{space*5}: {white}"DD$(7)
1160 PRINT"{yellow}I> {cyan}Staff Pieces : {white}"DD$(8)TAB(40)"{yellow}J> {cyan}Shield Pts{space*3}: {white}"DD$(9)
1170 PRINT"{yellow}K> {cyan}Max Hit Pts{space*2}: {white}"DD$(10)TAB(40)"{yellow}L> {cyan}Actual Hp's{space*2}: {white}"DD$(11)
1180 PRINT"{yellow}M> {cyan}Gold{space*9}: {white}"DD$(12)TAB(40)"{yellow}N> {cyan}Exp. Points{space*2}: {white}"DD$(13)
1190 PRINT"{yellow}O> {cyan}Level{space*8}: {white}"DD$(14)TAB(40)"{yellow}P> {cyan}Ressurect's{space*2}: {white}"DD$(15)
1200 PRINT:PRINT"Press a letter to edit a category or 'Q' to Quit: ";
1210 MAX=1:GOSUB370:M=ASC(I$):IFI$<>"Q"THEN1220:ELSEPRINT"{white}Save before Quitting? ";:GOSUB510:IFSS=0THENCLOSE2:GOTO1470:ELSEGOSUB1290:GOTO1470
1220 B=(ASC(I$)/2):C=INT(B):D=B-C:IFD=0THENTB=58:M=INT((M-189)/2):ELSETB=18:M=((M-189)/2)
1230 PRINT"{home}";
1240 FORX=1TOM:PRINT"{down}";:NEXT:PRINTTAB(TB)"{pink}";
1250 IFI$="A"THENMAX=MX(1):GOSUB370:DD$(1)=I$:GOTO1280
1260 IFI$="B"THENMAX=MX(2):GOSUB370:DT$=I$:GOTO1280
1270 CN=ASC(I$)-193:MAX=MX(CN):GOSUB370:DD$(CN)=I$
1280 GOTO1110
1290 REM --------------------------- SAVE PLAYER -------------------------
1300 OPEN2,DV,2,""+LU$+":wm.players"
1310 F$="":PRINT:PRINT"{white}Saving...";
1320 DD$(1)=DD$(1)+DT$:F$=DD$(1)+R$+STR$(DD(1))+R$:FORX=2TO19:F$=F$+DD$(X)+R$:NEXT
1330 RECORD#2,R:PRINT#2,F$:CLOSE2
1340 PRINT"{purple}{left*9}{light green}Saved....":PRINT:PRINT"{light gray}Press any key to continue":GETKEYA$:RETURN
1350 REM ----- SEE LIST OF PLAYERS --------------------------------------------
1360 R$=CHR$(13):PRINTR$"{light gray}List of players"R$R$"Press space to abort"
1370 PRINT"{pink}{cm @*40}"
1380 PRINT"{reverse on}{yellow}## Name{space*28}Level"
1390 PRINT"{pink}{cm t*40}{cyan}"
1400 OPEN2,DV,2,""+LU$+":wm.players"
1410 FORQ=1TO50:RECORD#2,Q:INPUT#2,H$:INPUT#2,A$:A=VAL(A$):IFA<1THENNEXTQ:GOTO1460
1420 FORX=2TO13:INPUT#2,A$:NEXTX:INPUT#2,A$:Q$=MID$(STR$(Q),2):IFLEN(Q$)<2THENQ$="0"+Q$
1430 TT$=LEFT$(H$,LEN(H$)-6)
1440 IFA$="10"THENC$=RIGHT$(KT$,35-LEN(TT$))+A$:ELSEC$=RIGHT$(KT$,36-LEN(TT$))+A$
1450 PRINTQ$+" "+TT$+C$:FORX=1TO9:GETA$:IFA$<>" "THENNEXTX:GETA$:NEXTQ
1460 CLOSE2:PRINT:PRINT"{light gray}Press any key to continue.":GETKEYA$
1470 REM ----- MAIN MENU ------------------------------------------------------
1480 PRINT"{clear}{light blue}Warriors and Monsters Utilities"
1490 PRINT:PRINT"{cyan}[A] {white}Monster Editor"TAB(40)"{cyan}[B] {white}List of Players"
1500 PRINT"{cyan}[C] {white}Reset Player File"TAB(40)"{cyan}[D] {white}Delete Inactive Players"
1510 PRINT"{cyan}[E] {white}Edit Player"TAB(40)"{cyan}[F] {white}Battle Log Maintenance"
1520 PRINT"{cyan}[G] {white}Quit"
1530 PRINT:PRINT"{light gray}Choose:";:
1540 MAX=1:GOSUB370:ONINSTR("ABCDEFG",I$)GOTO110,1350,1580,1740,1050,2100,1560
1550 GOTO1530
1560 REM ----- END ------------------------------------------------------------
1570 PRINT"{clear}{yellow}Warrior and Monsters Programmed by Mathew Beall (C) 1991":END
1580 REM ----- RESET PLAYER FILE ----------------------------------------------
1590 M$="{yellow}Are you sure you want to reset the file? ":GOSUB510:IFSS=0THEN1470
1600 Z$=" 0"+R$:OPEN2,DV,2,""+LU$+"{ct b}:wm.players,l,"+CHR$(125):PRINT"{down}{blue}Opening file status:",DS$
1610 PRINT:PRINT"{light gray}Record","{cyan}Check","{yellow}Drive status"
1620 FORT=1TO50:PRINT"{light gray}"T,;:RECORD#2,T:RECORD#2,T
1630 PRINT#2,AZ$
1640 IFDS=50THEND$="Expanding File":ELSED$=DS$
1650 PRINT"{cyan}{sh @}","{yellow}{space*20}{left*20}"D$"{up}":NEXTT:PRINT
1660 PRINT"End status",DS$:PRINT:CLOSE2:PRINT"Close file status",DS$:PRINT:PRINT"{light gray}Press any key to continue.":GETKEYB$:GOTO1470
1670 REM ----- DATA STATEMENTS -----------------------------------------------
1680 DATA "Cloth","Leather","Studded Leather","Ring Mail","Scale Mail","Chain Mail","Banded Mail","Plate Armour","Armour of Tomas","Carapace Armour"
1690 DATA "Small Club","Large Club","Dagger","Scimitar","Longsword","Broadsword","War-Hammer","Two-Handed Sword","Halberd of Power","Sword of Riva"
1700 DATA "Small Shield","Large Shield","Studded Shield","Great Shield","Body Shield","Dragon Protector","Shield of Aragon","Artemis's Shield","God Shield"
1710 DATA "Carapace Shield"
1720 DATA 15,6,2,2,2,2,2,2,2,3,4,4,6,6,2,2
1730 DATA 31,28,31,30,31,30,31,31,30,31,30,31
1740 REM ----- YEAR MODULE ---------------------------------------------------
1750 PRINT"{clear}{yellow}{reverse on}Auto-Delete Inactive Users{reverse off}"
1760 PRINT"{green}Module for Warriors & Monsters v3.00"
1770 PRINT"{cyan}How many days maximum can they be non-active?"
1780 PRINT"EX: 2 weeks = 14 days{purple}":PRINT":";
1790 MAX=4:GOSUB370:DY=VAL(I$):OD=DY
1800 PRINT"{cyan}Date today{space*2}(Year/Month/Day)?"
1810 PRINT"Ex: 900731 (July 31st, 1990).{purple}":PRINT":";
1820 MAX=6:GOSUB370:DT$=I$:IFLEN(DT$)<6THENPRINT"{white}?date error- please reenter":SLEEP1:GOTO1800
1830 PRINT:PRINT"{pink}Working...":GOSUB1950:PRINTDT$:PRINTDT$(1):PRINT
1840 OPEN2,DV,2,""+LU$+":wm.players"
1850 FORX=1TO50
1860 RECORD#2,X:RECORD#2,X
1870 PRINT"{yellow}Reading character #"MID$(STR$(X),2)" ";
1880 INPUT#2,B$:AS$=RIGHT$(B$,6):A=LEN(B$)-6:IFA=>0THENBS$=LEFT$(B$,A)
1890 IFB$="none"THENPRINT"{cyan}Empty Record.{space*12}":GOTO1920
1900 IFVAL(DT$(1))>VAL(AS$)THENPRINT"{purple}Deleting "+BS$+"{space*9}":RECORD#2,X:RECORD#2,X:PRINT#2,AZ$:PRINT:GOTO1920
1910 PRINT"{white}Character is Active."
1920 PRINT"{up*2}":NEXTX
1930 CLOSE2:IFPEEK(2961)=2THENRETURN
1940 GOTO1470
1950 ZZ$="0"
1960 A$=LEFT$(DT$,2):B$=MID$(DT$,3,2):C$=RIGHT$(DT$,2)
1970 A=VAL(A$):B=VAL(B$):C=VAL(C$)
1980 IFC>DYTHENC=C-DY:GOTO2030
1990 DY=(C-DY)*-1
2000 IFB=1THENB=12:A=A-1:ELSEB=B-1
2010 C=M(B)
2020 GOTO1980
2030 AA$=STR$(A):BB$=STR$(B):CC$=STR$(C)
2040 A$=MID$(AA$,2,LEN(AA$)):B$=MID$(BB$,2,LEN(BB$)):C$=MID$(CC$,2,LEN(CC$))
2050 IFVAL(A$)<10THENA$=ZZ$+A$
2060 IFVAL(B$)<10THENB$=ZZ$+B$
2070 IFVAL(C$)<10THENC$=ZZ$+C$
2080 DT$(1)=A$+B$+C$
2090 RETURN
2100 REM ----- BATTLE LOG MAINTENANCE ----------------------------------------
2110 PRINT"{clear}{light blue}Reading File..."
2120 OPEN2,DV,2,""+LU$+":wm.kills,s,r"
2130 X=1
2140 INPUT#2,K$(X)
2150 IFST<>0THENCLOSE2:GOTO2155:ELSEX=X+1:GOTO2140
2155 IF PEEK(2961)=2THENI$=BM$:GOTO2170
2160 PRINT:PRINT"{cyan}What is the current date? (10/25/90 form)?":INPUT"{purple}";I$
2170 K2$=CHR$(34)
2180 K$(2)=K2$+"List as of "+I$+""
2190 PRINT:PRINT"{yellow}Saving File..."
2200 OPEN2,DV,2,"@"+LU$+":wm.kills,s,w"
2210 FORT=1TO3:PRINT#2,K$(T):PRINTK$(T):NEXT
2220 XX=X-9
2230 FORT=XXTOX:PRINT#2,K$(T):PRINTK$(T):NEXTT
2240 CLOSE2:IFPEEK(2961)=2THENRETURN
2250 PRINT:PRINT"{light gray}Press any key to continue.":GETKEYA$:GOTO 1470
3000 REM AUTO-MAINT
3010 OD=14:DY=14
3050 A$=STR$(PEEK(2863)):B$=STR$(PEEK(2879)):C$=STR$(PEEK(2880)):A$=RIGHT$(A$,2):B$=RIGHT$(B$,2):C$=RIGHT$(C$,2):DT$=A$+B$+C$
3055 A=INSTR(DT$," "):IFATHENMID$(DT$,A,1)="0":GOTO3055
3060 BM$=B$+"/"+C$+"/"+A$
3070 GOSUB1830:GOSUB2100:END
