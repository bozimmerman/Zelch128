!--------------------------------------------------
!- Thursday, September 16, 2021 2:45:39 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.wm.p1.prg
!- Unknown Machine
!--------------------------------------------------
0 DV=8:LU=0:D2=8:L2=0:LU$=MID$(STR$(LU),2):REM D2 AND L2 ARE FOR PRG.*
1 IFOO$="{ct y}"THEN1600
10 CLOSE2:DIMMM$(26),DD(19),MP$(26),BS(19),M$(20),DT$(25),DU$(25),XX(25),YY(25),OP(25):MAX=10:R$=CHR$(13)
20 KK$="{sh asterisk*40}":CF=0:FC=0
30 AA$(0)="none":WW$(0)="none":SS$(0)="none":FORX=1TO10:READAA$(X):NEXT:FORX=1TO10:READWW$(X):NEXT:FORX=1TO10:READSS$(X):NEXT:FORX=1TO10:READDM(X):NEXT
50 REM ----- ID=CNET ID NUMBER - HH$= CNET HANDLE - DT$=DATE - AC=ASCII=0 AND COLOR =1
60 CK$="00000000000000000000000000000000000000000000000":KT$="...................................."
70 OPEN1,DV,15:OPEN2,DV,2,LU$+":wm.data,s,r":INPUT#1,I:IFITHENCLOSE2:CLOSE1:PRINTR$"{cyan}error in data transfer--leave feedback!":END
75 INPUT#2,ID,HH$,DT$,AC:CLOSE2:CLOSE1
80 OPEN2,DV,2,""+LU$+":wm.players":PRINT"{white}Finding player file, please wait";:AA(1)=0
90 FORT=1TO50:PRINT".";:RECORD#2,T:INPUT#2,DD$(1):INPUT#2,A$:A=VAL(A$):IFA<>0THENDD(1)=A:GOTO100:ELSEIFAA(1)=0THENAA(1)=T
100 IFDD(1)<>IDTHENNEXT:CLOSE2:GOTO1000
110 RR=T:FORT=2TO19:INPUT#2,DD(T):NEXT:CLOSE2
120 IFDT$=RIGHT$(DD$(1),6)THENPRINTR$"{light gray}You've already played today!":END
130 DD$(1)=LEFT$(DD$(1),LEN(DD$(1))-6):PRINT:MM$=STR$(DD(14)):ZZ$=STR$(DD(14)):GOSUB1400:TRAP700:GOTO1500
200 REM ----- INPUT ROUTINE (ALL CAPS) ----------------------------------------
210 I$=""
220 GETA$:IFA$=""THEN220
230 IFA$=CHR$(13)THENPRINT:RETURN
240 IFA$<>CHR$(20)THENI=ASC(A$):GOTO270
250 IFLEN(I$)<1THENPRINT"{ct g}";:GOTO220
260 I$=LEFT$(I$,LEN(I$)-1):PRINTA$;:GOTO220
270 IFLEN(I$)=MAXTHENPRINT"{ct g}";:GOTO220
280 GOSUB310:IFI=0THEN220
290 I$=I$+CHR$(I):PRINTCHR$(I);
300 IFMAX=1THENPRINT:RETURN:ELSEGOTO220
310 IF(I>47ANDI<58)OR(I>192ANDI<219)OR(I=32)THENRETURN
320 IFI>64ANDI<91THENI=I+128:ELSEIFI<>63THENI=0
330 RETURN
400 REM ----- HOT KEY MENU ROUTINES -------------------------------------------
410 FORI1=1TO20:IFM$(I1)=""THEN460
420 IFINSTR(M$(I1),"{ct c}")THENGOSUB500:MID$(M$(I1),(INSTR(M$(I1),"{ct c}")),1)=A$:GOTO420
430 FORI2=1TOLEN(M$(I1))STEP5:PRINTMID$(M$(I1),I2,5);
440 GETA$:IFA$>""THENI=ASC(A$):GOSUB310:IFITHENA$=CHR$(I):IFINSTR(C$,A$,1)THENPRINT:RETURN
450 NEXTI2:NEXTI1
460 PRINTM$;:MAX=1:GOSUB210:I=ASC(I$):GOSUB310:IFITHENI$=CHR$(I)
470 IFINSTR(C$,I$,1)THENA$=I$:RETURN
480 IFI$="?"THEN410:ELSEPRINTR$"Invalid command.":GOTO460
500 REM ----- RETURN NEXT COLOR FROM CYCLE AS A$ ------------------------------
510 IFKC>7THENKC=1:ELSEKC=KC+1
520 A$=MID$("{pink}{yellow}{white}{cyan}{light blue}{blue}{purple}{red}",KC,1):RETURN
550 REM ----- TAB ROUTINE -----------------------------------------------------
560 SS=INSTR(A$,"{ct i}"):IFSS<1THENRETURN:ELSEPRINTLEFT$(A$,SS-1);
580 FORA=1TOI-(POS(1)):PRINT" ";:NEXTA:PRINTRIGHT$(A$,LEN(A$)-SS):RETURN
600 REM ----- YES/NO PROMPTS (PROMPT IS M$, SS=FLAG) --------------------------
610 PRINTM$;:GETKEYA$:IFA$="Y"ORA$="y"THENPRINT"Yes":SS=1:ELSEPRINT"No":SS=0
620 RETURN
650 REM ----- PRESS ANY KEY PROMPT --------------------------------------------
660 PRINT"{light gray}Press any key to continue.":GETKEYB$:RETURN
700 REM ----- MAIN TRAP ROUTINE -----------------------------------------------
710 IFPEEK(2824)=0THENPRINTR$R$"{white}{ct o}System time limit exceeded!":GOSUB800:GOTO3220
715 IFPEEK(2827)=1THENPRINTR$R$"{white}{reverse on}{ct o}CARRIER DROPPED":GOSUB800:END
720 TRAP700:CLOSE2:PRINTR$"{white}BASIC error: "ERR$(ER)" @"EL;R$:GOSUB650:GOTO1600
800 REM ----- SAVE PLAYER -----------------------------------------------------
810 A$="":IFDD(14)=0THENDD(14)=1
820 OPEN2,DV,2,""+LU$+":wm.players":DD$(1)=DD$(1)+DT$
830 A$=DD$(1)+R$:FORT=1TO19:A$=A$+STR$(DD(T))+R$:NEXTT
840 RECORD#2,RR:PRINT#2,A$:CLOSE2
850 DD$(1)=LEFT$(DD$(1),LEN(DD$(1))-6):RETURN
900 REM ----- SAVE OPPONENT ---------------------------------------------------
910 A$="":OPEN2,DV,2,""+LU$+":wm.players":A$=BS$(1)+R$:FORX=1TO19:A$=A$+STR$(BS(X))+R$:NEXT
920 RECORD#2,HH:PRINT#2,A$:CLOSE2:RETURN
950 REM ----- SEQ FILE READER -------------------------------------------------
951 CLOSE2:PRINT:OPEN2,DV,2,""+LU$+":"+F$+",s,r":TRAP954:IFDS>0THEN954
952 INPUT#2,A$:SS=ST:PRINTA$:IFSS=0THEN953:ELSE954
953 FORX=1TO9:GETA$:IFA$<>" "THENNEXTX:GETA$:GOTO952
954 TRAP700:CLOSE2:RETURN
1000 REM ----- NEW PLAYER LOGON ------------------------------------------------
1010 IFAA(1)=0THENPRINTR$"{light gray}Sorry, all of the player files are full.":END
1020 DD(1)=ID:DD(2)=12:DD(3)=12:DD(4)=12:DD(5)=1:DD(6)=0:DD(7)=0:DD(8)=0:DD(9)=0:DD(12)=200:DD(13)=0:DD(14)=1:DD(15)=1:DD$(1)=HH$
1040 PRINT:F$="wm.information":GOSUB950:TRAP1200:GOTO1210
1100 REM ----- HELP FILE ------------------------------------------------------
1110 F$="wm.help":GOSUB950:PRINT:PRINT:GOSUB650:GOTO1600
1119 REM ----- NEW CHARACTER LOGON --------------------------------------------
1200 IFPEEK(2827)THENPRINTR$"{white}{reverse on}{ct o}CARRIER DROPPED":END:ELSETRAP1200
1210 MAX=2:X=12:FORA=2TO4:A$="STR":IFA=3THENA$="DEX":ELSEIFA=4THENA$="CON"
1220 PRINTR$"{light green}(You have{white}"X"{light green}points to distribute)"R$"Current "A$" ={yellow}"DD(A)"{light green}add how many? ";:MAX=2:GOSUB200
1230 I=VAL(I$):IFI>XTHENPRINT"You only have"X"points left!":GOTO1220:ELSEAA(A)=I:X=X-I:NEXTA
1270 PRINTR$"{yellow}New values"R$R$"{cyan}STR:{white}"(DD(2)+AA(2))R$"{cyan}DEX:{white}"(DD(3)+AA(3))R$"{cyan}CON:{white}"(DD(4)+AA(4))
1280 DD(10)=(INT(RND(TI)*10)+1)+(INT((12+(AA(4)+DD(4)))/3))*2:PRINTR$"{purple}Hit points:{white}"DD(10):DD(11)=DD(10)
1290 M$=R$+"{yellow}Are these acceptable? ":GOSUB600:IFSS=0THEN1210:ELSEFORX=2TO4:DD(X)=DD(X)+AA(X):NEXTX
1300 PRINTR$"{cyan}Enter a name for your player, or press"R$"RETURN to use "HH$R$":";:MAX=15:GOSUB200:IFI$=""THENI$=HH$
1310 IFLEN(I$)<2THENPRINTR$"{yellow}A player name must be atleast 2 characters long.":GOTO1300:ELSEDD$(1)=I$
1320 RR=AA(1):MM$=" 1":GOSUB1400:TRAP700:GOTO1600
1400 REM ----- LOAD MONSTER LEVEL ---------------------------------------------
1410 PRINTR$"Loading Monster Level"MM$;:OPEN2,DV,2,LU$+":wm.ml"+MM$+",s,r"
1420 FORX=1TO10:PRINT".";
1430 INPUT#2,NN$(X),AA(X),DQ(X),GG(X),EE(X),MA(X):NEXT
1431 FORX=1TO26:INPUT#2,MM$(X):PRINT".";:NEXT
1432 X=0
1433 X=X+1:INPUT#2,XX(X),YY(X),OP(X),DT$(X),DU$(X):GG=ST:PRINT".";
1434 IFGG=0THEN1433
1440 CLOSE2:PRINT:RETURN
1500 REM ----- LIST OF BATTLES ------------------------------------------------
1510 PRINTR$"{pink}List of Battles and Outcomes{cyan}":PRINTKK$
1530 OPEN2,DV,2,""+LU$+":wm.kills,s,r":IFDS>0THEN1550
1540 FORX=1TO10:GETA$:IFA$<>" "THENNEXTX:GOSUB500:INPUT#2,B$:GG=ST:PRINTA$B$:IFGG=0THEN1540
1550 CLOSE2:PRINT:GOSUB650
1600 REM ----- MAIN MENU ------------------------------------------------------
1610 C$="BCFHPRTY":R$=CHR$(13)
1620 HH$="":M$(1)="{clear}{ct c}Warriors & Monsters"+R$:M$(2)=R$+"{ct c}[B]attle Log{space*28}[C]hange Monster Level"
1630 M$(3)=R$+"{ct c}[F]ight Another Player{space*18}[H]elp File"
1640 M$(4)=R$+"{ct c}[P]layer List{space*27}[R]ed Dragon Inn (Quit)"
1650 M$(5)=R$+"{ct c}[T]own Menu{space*29}[Y]our Statistics{ct c}"+R$:M$(6)=""
1660 M$=R$+"Choose: "
1670 GOSUB400
1680 ONINSTR(C$,A$)GOTO1500,3100,2100,1100,2900,3200,3300,2000:GOTO1670
2000 REM ----- SEE STATISTICS -------------------------------------------------
2010 PRINT"{clear}Character Statistics{white}"R$R$DD$(1)R$:I=40
2030 A$="{yellow}Weapon{space*6}: {white}"+WW$(DD(5))+"{ct i}{yellow}Armour{space*6}: {white}"+AA$(DD(6)):GOSUB550
2035 A$="{yellow}Shield{space*6}: {white}"+SS$(DD(7))+" ("+STR$(DD(9))+" )"+"{ct i}{yellow}Hit points{space*2}:{white}"+STR$(DD(11))+" /"+STR$(DD(10)):GOSUB550
2040 A$="{yellow}Strength{space*4}:{white}"+STR$(DD(2))+"{ct i}{yellow}Dexterity{space*3}:{white}"+STR$(DD(3)):GOSUB550
2042 A$="{yellow}Constitution:{white}"+STR$(DD(4))+"{ct i}{yellow}Gold{space*8}:{white}"+STR$(DD(12)):GOSUB550
2045 A$="{yellow}Experience{space*2}:{white}"+STR$(DD(13))+"{ct i}{yellow}Level{space*7}:{white}"+STR$(DD(14)):GOSUB550
2046 A$="{yellow}Regeneration:{white}"+STR$(DD(15))+"{ct i}{yellow}Staff Pieces:{white}"+STR$(DD(8)):GOSUB550
2047 PRINT"{yellow}Time Left{space*3}:{white}"+STR$(PEEK(2825))+" min."+R$
2050 GOSUB650:GOTO1600
2100 REM ----- FIGHT ANOTHER PLAYER -------------------------------------------
2102 IFCF>2THENGOSUB500:PRINTA$"Sorry, you may only fight another player twice a day!!":GOSUB650:GOTO1600
2110 HH=0:PRINT:GOSUB500:PRINTA$;"{clear}What is the number of the player you wish to battle? ";:MAX=2:GOSUB200:HH=VAL(I$):IFHH<1ORHH>50THEN1600
2120 IFMID$(CK$,HH,1)="1"THENPRINTR$"Sorry, you have already fought him today!"R$:GOSUB650:GOTO1600
2130 IFHH=RRTHENPRINTR$"Sorry! You can't battle yourself!"R$:GOSUB650:GOTO1660
2140 OPEN2,DV,2,""+LU$+":wm.players"
2150 RECORD#2,HH:INPUT#2,BS$(1):FORX=1TO19:INPUT#2,BS(X):NEXT:CLOSE2:HK$=BS$(1)
2160 HS$=LEFT$(HK$,LEN(HK$)-6):GOSUB500:M$=R$+A$+"Is {white}"+HS$+A$+" the player you wish to battle? ":GOSUB600:IFSS=0THEN2100
2170 IFDD(14)<>BS(14)THENPRINT:GOSUB500:PRINTA$"Sorry, your levels must be the same to engage in combat.":GOSUB650:GOTO1600
2180 CF=CF+1:OA1=DD(2)*2.77+DD(5)*5:FD1=BS(3)*2.77+BS(6)*5:MID$(CK$,HH,1)="1"
2190 OD1=DD(3)*2.77+DD(6)*5:FA1=BS(2)*2.77+BS(5)*5
2200 MO=(OA1-FD1)+50:MM=(FA1-OD1)+50:IFMM>100THENMM=100:ELSEIFMO>100THENMO=100
2210 IFMO<1THENMO=1:ELSEIFMM<1THENMM=1
2220 DTH(1)=INT(MO/.95):DTH(2)=(MM/.95)
2221 PRINT"{clear}":SP(1)=INT((18-LEN(DD$(1)))/2):SP(2)=INT((18-LEN(HS$))/2):IFAC=0THEN2255
2225 PRINT"{home}{cyan}{cm a}{sh asterisk*18}{cm r}{sh asterisk*18}{cm s}":PRINT"{sh -}"SPC(SP(1))DD$(1)TAB(19)"{sh -}"SPC(SP(2))HS$TAB(38)"{sh -}"
2230 PRINT"{cm z}{sh asterisk*18}{cm e}{sh asterisk*18}{cm x}":PRINT"{cyan}{cm a}{sh asterisk*18}{cm r}{sh asterisk*18}{cm s}"
2235 PRINT"{cyan}{sh -}{green}{reverse on}Shield pts{space*3}:{space*4}{reverse off}{cyan}{sh -}{green}{reverse on}Shield pts{space*3}:{space*4}{cyan}{reverse off}{sh -}":PRINT"{cm q}{sh asterisk*18}{sh +}{sh asterisk*18}{cm w}"
2240 PRINT"{cyan}{sh -}{blue}{reverse on}Hit Points{space*3}:{space*4}{reverse off}{cyan}{sh -}{blue}{reverse on}Hit Points{space*3}:{space*4}{cyan}{reverse off}{sh -}":PRINT"{cm q}{sh asterisk*18}{sh +}{sh asterisk*18}{cm w}"
2245 PRINT"{cyan}{sh -}{purple}{reverse on}Hit Ratio (%):{space*4}{reverse off}{cyan}{sh -}{purple}{reverse on}Hit Ratio (%):{space*4}{cyan}{reverse off}{sh -}":PRINT"{cm z}{sh asterisk*3}{cm r}{sh asterisk*10}{cm r}{sh asterisk*3}{cm e}{sh asterisk*3}{cm r}{sh asterisk*10}{cm r}{sh asterisk*3}{cm x}":PRINT"{space*4}{sh -}{space*10}{sh -}{space*7}{sh -}{space*10}{sh -}"
2250 PRINT"{space*4}{cm z}{sh asterisk*10}{cm x}{space*7}{cm z}{sh asterisk*10}{cm x}"
2255 UU(1)=UU(1)+1:X=INT(RND(TI)*100)+1:IFX>=DTH(1)THENHC$(1)="{space*3}Miss{space*3}":GOTO2258
2256 DM=DM(DD(5)):X=INT(RND(TI)*DM)+1:PP=DD(11)/DD(10):AD=INT(PP*X):IFBS(7)>0THENGOSUB2500
2257 HC$(1)="Hit for"+STR$(AD):UH(1)=UH(1)+1:BS(11)=BS(11)-AD
2258 UU(2)=UU(2)+1:X=INT(RND(TI)*100)+1:IFX>=DTH(2)THENHC$(2)="{space*3}Miss{space*3}":GOTO2261
2259 DM=DM(BS(5)):X=INT(RND(TI)*DM)+1:PP=BS(11)/BS(10):AF=INT(PP*X):IFDD(7)>0THENGOSUB2400
2260 HC$(2)="Hit for"+STR$(AF):UH(2)=UH(2)+1:DD(11)=DD(11)-AF
2261 IFAC=0THENGOSUB4000:IFRF$="1"THENHC$(1)="{space*7}":GOTO2258
2262 IFRF$="0"THEN2255
2263 PRINT"{home}{down*4}"TAB(16)"{reverse on}{green}{space*2}{left*3}"STR$(DD(9))TAB(35)"{space*2}{left*3}"STR$(BS(9))
2264 PRINT"{down}"TAB(16)"{reverse on}{blue}{space*2}{left*3}"STR$(DD(11))TAB(35)"{space*2}{left*3}"STR$(BS(11))
2265 IFUH(1)=0THENRR(1)=0:ELSERR(1)=INT((UH(1)/UU(1))*100)
2266 IFUH(2)=0THENRR(2)=0:ELSERR(2)=INT((UH(2)/UU(2))*100)
2267 PRINT"{down}"TAB(16)"{reverse on}{purple}{space*3}{left*4}"STR$(RR(1))TAB(35)"{space*3}{left*4}"STR$(RR(2))
2268 PRINT"{pink}{down}"TAB(5)HC$(1)TAB(24)HC$(2)
2269 IFDD(11)<=0THENGOTO2600
2270 IFBS(11)<=0THENGOTO2700
2271 PRINT"{cyan}{down*2}{space*15}{left*15}{reverse on}R{reverse off}un or {reverse on}F{reverse off}ight? ";:MAX=1:GOSUB200:IFI$="F"THEN2255
2272 X=INT(RND(TI)*100)+1:IFX<=35THENPRINT"You succeed!"R$:GOSUB650:FL=0:KL$=" ran from ":GOSUB2800:GOTO1600
2273 HC$(1)=" Blocked! ":GOTO2258
2400 REM ----- PLAYER SHIELD --------------------------------------------------
2410 SF=DD(7):IFSF>AFTHENSF=AF
2420 AF=AF-SF:DD(9)=DD(9)-1:IFDD(9)=0THENDD(7)=0
2430 RETURN
2500 REM ----- OPPONENT SHIELD ------------------------------------------------
2510 SF=BS(7):IFSF>ADTHENSF=AD
2520 AD=AD-SF:BS(9)=BS(9)-1:IFBS(9)=0THENBS(7)=0
2530 RETURN
2600 REM ----- YOU DIE (PLAYERVSPLAYER) ---------------------------------------
2610 IFBS(5)<DD(5)THENBS(5)=DD(5):DD(5)=0
2620 IFBS(6)<DD(6)THENBS(6)=DD(6):DD(6)=0
2630 IFBS(7)<DD(7)THENBS(7)=DD(7):DD(7)=0
2640 BS(12)=BS(12)+DD(12):DD(12)=0:IFDD(15)<0THEN2650
2641 PRINT:PRINT:PRINTHS$" searches your body and leaves you for dead.{space*2}Five minutes later":PRINT"your ressurection implant activates and you get up and head back..."
2642 DD(15)=DD(15)-1:FL=1:KL$=" ALMOST killed ":GOSUB2800:DD(4)=DD(4)-1:GOSUB900:DD(11)=DD(10):GOSUB650:GOTO1600
2650 PRINT:PRINT:PRINTHS$" kills you....Better Luck next time...":PRINT"{red}Please wait..Disk Access"
2655 OPEN2,DV,2,""+LU$+":wm.players":RECORD#2,RR
2660 A$="none"+R$+"0"+R$:FORX=2TO19:A$=A$+STR$(DD(X))+R$:NEXT:PRINT#2,A$:CLOSE2
2665 FL=1:KL$=" killed ":GOSUB2800:GOSUB900:GOTO3220
2700 REM ---- HE DIES (PLAYERVSPLAYER) ----------------------------------------
2710 IFDD(5)<BS(5)THENDD(5)=BS(5):BS(5)=0
2720 IFDD(6)<BS(6)THENDD(6)=BS(6):BS(6)=0
2730 IFDD(7)<BS(7)THENDD(7)=BS(7):BS(6)=0
2740 DD(12)=DD(12)+BS(12):BS(12)=0:IFBS(15)<1THEN2745
2741 PRINT:PRINT:PRINT"You search the body and take everything you want, and as your back is turned":PRINT"Somehow he is ressurected and runs off!"
2742 BS(15)=BS(15)-1:FL=0:KL$=" ALMOST killed ":GOSUB2800:BS(4)=BS(4)-1:BS(11)=BS(10):GOSUB900:GOSUB650:GOTO1600
2745 PRINT"You search the body and take everything you want.":PRINT"Please wait..Disk Access"
2750 OPEN2,DV,2,""+LU$+":wm.players":RECORD#2,HH
2755 A$="none"+R$+"0"+R$:FORX=2TO19:A$=A$+STR$(BS(X))+R$:NEXT:PRINT#2,A4:CLOSE2
2780 FL=0:KL$=" killed ":GOSUB2800:GOTO1600
2800 REM ----- SEQ FILE FOR KILLS ---------------------------------------------
2810 OPEN2,DV,2,""+LU$+":wm.kills,s,a"
2820 IFFL=1THENA$=HS$+KL$+DD$(1):ELSEA$=DD$(1)+KL$+HS$
2830 PRINT#2,CHR$(34)+A$:CLOSE2:RETURN
2900 REM ----- SEE LIST OF PLAYERS --------------------------------------------
2910 R$=CHR$(13):PRINTR$"{light gray}List of other players"R$R$"Press space to abort"
2920 PRINT"{pink}{cm @*40}"
2930 PRINT"{reverse on}{yellow}## Name{space*28}Level"
2940 PRINT"{pink}{cm t*40}{cyan}"
2950 OPEN2,DV,2,""+LU$+":wm.players"
2970 FORQ=1TO50:RECORD#2,Q:INPUT#2,H$:INPUT#2,A$:A=VAL(A$):IFA<1THENNEXTQ:GOTO3000
2980 FORX=2TO13:INPUT#2,A$:NEXTX:INPUT#2,A$:Q$=MID$(STR$(Q),2):IFLEN(Q$)<2THENQ$="0"+Q$
2990 TT$=LEFT$(H$,LEN(H$)-6)
2991 IFA$="10"THENC$=RIGHT$(KT$,35-LEN(TT$))+A$:ELSEC$=RIGHT$(KT$,36-LEN(TT$))+A$
2995 PRINTQ$+" "+TT$+C$:FORX=1TO9:GETA$:IFA$<>" "THENNEXTX:GETA$:NEXTQ
3000 CLOSE2:PRINT:GOSUB650:GOTO1600
3100 REM ----- CHANGE MONSTER LEVEL -------------------------------------------
3105 PRINT"{clear}{cyan}Current level is:{reverse on}{yellow}"+MM$+"{cyan}{reverse off}"
3110 PRINT"{purple}What level would you like to change it to (max:10)? ";:MAX=2:GOSUB200:A=VAL(I$):IFA>10ORA<1THEN1600
3120 IFA<DD(14)THENGOSUB500:PRINTA$"Sorry, you may only RAISE the monster level"R$R$:GOSUB650:GOTO1600
3130 MM$=STR$(A):GOSUB1400:PRINT:GOSUB650:GOTO1600
3200 REM ----- EXIT TO BBS ----------------------------------------------------
3210 M$=R$+"Are you sure you want to return to the bbs? ":GOSUB600:IFSS=0THEN1600:ELSEPRINTR$"Standby: {pink}Saving Statistics.":GOSUB800
3220 PRINT"{white} {ct o}{cm @*14}"
3230 PRINT"{ct o}{cm m}{143}{reverse on}{light gray} {cm a}{sh asterisk*2}{sh -} {cm r}{sh asterisk}{cm r}{sh asterisk}{cm a}{sh asterisk*2} {white}{reverse off}{ct o}{cm g}{143} {cyan}Warriors and Monsters"
3240 PRINT"{white}{ct o}{cm m}{143}{reverse on}{light gray} {cm q}{sh asterisk} {sh -} {sh -} {sh -} {cm q}{sh asterisk}{space*2}{white}{reverse off}{ct o}{cm g}{143} {cyan}by: Cpt. Cockroach"
3250 PRINT"{white}{ct o}{cm m}{143}{reverse on}{light gray} {cm z}{sh asterisk*2}{cm z}{sh asterisk}{cm e} {sh -} {cm z}{sh asterisk*2} {white}{reverse off}{ct o}{cm g}{143} {cyan}and Mr. Bill"
3260 PRINT"{white} {ct o}{cm t*14}{143}"
3270 PRINT"{light green} CALL THE ELITE BBS -- (602)/742-7319{cyan}"
3280 END
3300 REM ----- TOWN MENU ------------------------------------------------------
3310 GOSUB500:PRINTA$"Please wait....Switching Modules":DLOAD"prg.wm.p2",U(D2),D(L2)
4000 REM ----- ASCII COMBAT ---------------------------------------------------
4010 IFRF$="1"THEN4040:ELSEPRINT"{yellow}You attack "HS$" and ";:IFLEFT$(HC$(1),1)<>"H"THENPRINT"Miss!":GOTO4030
4020 PRINT"HIT! for"+STR$(AD):IFBS(7)>0THENPRINT"{yellow}His shield absorbs"+STR$(SF)+" ("+STR$(BS(9))+")."
4030 PRINT"{yellow}He has"+STR$(BS(11))+" hit points remaining.":PRINT:IFBS(11)<1THEN2700
4040 PRINT"{blue}"HS$"attacks you and ";:IFLEFT$(HC$(2),1)<>"H"THENPRINT"Misses!":GOTO4060
4050 PRINT"HITS! for"+STR$(AF):IFDD(7)>0THENPRINT"{blue}Your shield absorbs"+STR$(SF)+" ("+STR$(DD(9))+")."
4060 PRINT"{blue}You have"+STR$(DD(11))+" hit points remaining.":IFDD(11)<1THEN2600
4070 PRINT:PRINT"{cyan}{reverse on}R{reverse off}un or {reverse on}F{reverse off}ight?":MAX=1:GOSUB200:PRINT:IFI$="F"THENRF$="0":RETURN
4080 X=INT(RND(TI)*100)+1:IFX<=35THENPRINT"You succeed!"R$:GOSUB650:FL=0:KL$=" ran from ":GOSUB2800:GOTO1600
5090 RF$="1":HC$(1)="{space*2}Blocked{space*2}":RETURN
5100 REM ----- DATA STATEMENTS -----------------------------------------------
5110 DATA "Cloth","Leather","Studded Leather","Ring Mail","Scale Mail","Chain Mail","Banded Mail","Plate Armour","Armour of Tomas","Carapace Armour"
5120 DATA "Small Club","Large Club","Dagger","Scimitar","Longsword","Broadsword","War-Hammer","Two-Handed Sword","Halberd of Power","Sword of Riva"
5130 DATA "Small Shield","Large Shield","Studded Shield","Great Shield","Body Shield","Dragon Protector","Shield of Aragon","Artemis's Shield","God Shield"
5140 DATA "Carapace Shield"
5150 DATA 4,6,7,10,14,18,22,28,35,50
