!--------------------------------------------------
!- Thursday, September 16, 2021 2:46:00 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.wm.p2.prg
!- Unknown Machine
!--------------------------------------------------
0 IFEN$="0"THENKL$=" turned TRAITOR and died.":FL=0:PRINT"Please wait....Disk Access...":GOSUB2800:GOTO2620
1 IFEN$="1"THENKL$=" imprisoned BeezleBubba!":FL=0:PRINT"Please wait....Disk Access..":GOSUB2800:DD$(1)="> "+DD$(1):GOSUB800:END
10 IFPP$="{ct y}"THEN20:ELSE100
20 IFDD(15)>0THENDD(15)=DD(15)-1:DD(11)=DD(10):FL=0:KL$=" was ALMOST{sh space}killed in a maze":HS$="":GOSUB2800:GOTO100
30 OPEN2,DV,2,""+LU$+":wm.players"
40 RECORD#2,RR
50 A$="none"+R$+"0"+R$:FORX=2TO19:A$=A$+STR$(DD(X))+R$:NEXT
60 PRINT#2,A$:CLOSE2:FL=0:KL$=" was killed in a maze":HS$="":GOSUB2800:PRINT"Unfortunately, you died...Better luck next time.":END
100 GOTO3300
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
715 IFPEEK(2824)=0THENPRINTR$R$"{white}{reverse on}{ct o}CARRIER DROPPED":GOSUB800:END
720 TRAP700:CLOSE2:PRINTR$"{white}BASIC error: "ERR$(ER)" @"EL;R$:GOSUB650:GOTO3300
800 REM ----- SAVE PLAYER -----------------------------------------------------
810 A$=""
820 OPEN2,DV,2,""+LU$+":wm.players":DD$(1)=DD$(1)+DT$
830 A$=DD$(1)+R$:FORX=1TO19:A$=A$+STR$(DD(X))+R$:NEXT
840 RECORD#2,RR:PRINT#2,A$:CLOSE2
850 DD$(1)=LEFT$(DD$(1),LEN(DD$(1))-6):RETURN
950 REM ----- SEQ READER ------------------------------------------------------
951 CLOSE2:PRINT:OPEN2,DV,2,""+LU$+":"+F$+",s,r":TRAP954:IFDS>0THEN954
952 INPUT#2,A$:SS=ST:PRINTA$:FORX=1TO9:GETA$:IFA$<>" "THENNEXTX:GETA$:IFSS<1THEN952
954 TRAP700:CLOSE2:RETURN
1400 REM ----- ENTER THE APOTHECARY -------------------------------------------
1410 PRINT"{clear}":PRINT"{light gray}You enter a low slung room with colorful vapors floating at different levels{space*4}around the room.{space*2}The pharmacist comes{space*2}out and eyes you with a ";
1420 PRINT"twinkle in his{space*2}eyes.{space*2}'Who gets it now?!!'
1430 PRINT:PRINT"{light gray}{cm @*39}"
1431 PRINT"{reverse on}{pink}Effect{space*26}Cost{space*3}{reverse off}"
1432 PRINT"{light gray}{cm t*39}"
1435 GOSUB500:PRINTA$"1) Poison 10% of hit points........500"
1440 GOSUB500:PRINTA$"2) Poison 25% of hit points......1,500"
1445 GOSUB500:PRINTA$"3) Poison 50% of hit points......5,000"
1450 GOSUB500:PRINTA$"4) Poison 75% of hit points.....20,000"
1455 GOSUB500:PRINTA$"5) Regeneration Implant..........5,000"
1460 PRINT:PRINT"{light gray}Choose: ";:MAX=2:GOSUB200:RT=VAL(I$)
1461 IFRT<0ORRT>5THEN1460
1465 IFRT=5THEN1540
1466 PRINT:PRINTR$"{light gray}What is the NUMBER of the player you wish to poison (0 to quit)? ";:MAX=3:GOSUB200:HH=VAL(I$):IFHH<1ORHH>50THEN3300
1470 IFHH=RRTHENPRINT:PRINT"Sorry!{space*2}You can't poison yourself!":GOSUB650:GOTO3300
1471 Q=VAL(MID$(CK$,HH,1)):IF(QAND2)THENPRINT"{light gray}Sorry, you have already poisoned that poor soul today!":GOSUB650:GOTO3300
1472 IF(QAND1)THENMID$(CK$,HH,1)="3":ELSEMID$(CK$,HH,1)="2"
1475 OPEN2,DV,2,""+LU$+":wm.players"
1476 RECORD#2,HH:INPUT#2,BS$(1):FORX=1TO19:INPUT#2,BS(X):NEXT:CLOSE2
1480 HS$=LEFT$(BS$(1),LEN(BS$(1))-6):GOSUB500:M$=A$+R$+"Is {white}"+HS$+A$+" the player you want to poison? ":GOSUB600:IFSS=0THEN1466
1485 IFDD(12)>500ANDRT=1THENDD(12)=DD(12)-500:BS(11)=BS(11)-INT((BS(11)*.10)):GOTO1510
1490 IFDD(12)>1500ANDRT=2THENDD(12)=DD(12)-1500:BS(11)=BS(11)-INT((BS(11)*.25)):GOTO1510
1495 IFDD(12)>5000ANDRT=3THENDD(12)=DD(12)-5000:BS(11)=BS(11)-INT((BS(11)*.50)):GOTO1510
1500 IFDD(12)>20000ANDRT=4THENDD(12)=DD(12)-20000:BS(11)=BS(11)-INT((BS(11)*.75)):GOTO1510
1505 PRINT:PRINT"{light gray}Sorry, you don't have enough money.":GOSUB650:GOTO3300
1510 GOSUB500:PRINTA$"{clear}The pharmacist takes your order and promises to get it done by midnight.":GOSUB650:OPEN2,DV,2,""+LU$+":wm.players"
1520 RECORD#2,HH:PRINT#2,BS$(1):FORX=1TO19:PRINT#2,BS(X):NEXT:CLOSE2
1530 GOSUB500:PRINTA$"The Pharmacist leaks!":FL=0:KL$=" poisoned ":GOSUB2800:GOTO3300
1540 PRINT"{clear}This operation will implant a magical device near your heart.{space*2}The operation{space*4}will take the entire day...":M$=R$+"Do you wish to do this? "
1545 GOSUB600:IFSS=0THEN3300:ELSEIFDD(12)<5000THENGOSUB500:PRINTA$R$"Sorry, you don't have enough money for the operation.":GOSUB650:GOTO3300
1550 DD(12)=DD(12)-5000:GOSUB500:PRINTA$R$"You are put to sleep and the operation is performed...":DD(15)=DD(15)+1
1560 PRINT"{red}Saving statistics--please wait...":GOSUB800:END
1600 REM ----- GO TO THE EDGE OF TOWN -----------------------------------------
1610 GOSUB500:PRINTA$"Please wait....Switching Modules":OO$="{ct y}":DLOAD"prg.wm.p1",U(D2),D(L2)
1700 REM ----- FIGHT IN THE ARENA ---------------------------------------------
1710 FC=FC+1:IFFC>10THENPRINT"{clear}{light gray}You have been in the Arena too much today! Go rest at the {pink}Red Dragon Inn":GOSUB650:GOTO1600
1720 MA$=STR$(MA):MP=(VAL(MM$)*10)+((INT(RND(TI)*6)+1)*VAL(MM$)):MT=MP:XX=INT(RND(TI)*10)+1:UH(1)=0:UH(2)=0:UU(1)=0:UU(2)=0
1730 OA1=DD(2)*2.77+DD(5)*5:OD1=DD(3)*2.77+DD(6)*6
1740 MO=(OA1-DQ(XX))+50:MM=(AA(XX)-OD1)+50:IFMM>100THENMM=100:ELSEIFMM<0THENMO=1
1750 IFMO>100THENM=100:ELSEIFMO<0THENMO=1
1760 DTH(1)=INT(MO/.95):DTH(2)=INT(MM/.95)
1765 PRINT"{clear}":SP(1)=INT((18-LEN(DD$(1)))/2):SP(2)=INT((18-LEN(NN$(XX)))/2):IFAC=0THEN1800
1770 PRINT"{home}{cyan}{cm a}{sh asterisk*18}{cm r}{sh asterisk*18}{cm s}":PRINT"{sh -}"SPC(SP(1))DD$(1)TAB(19)"{sh -}"SPC(SP(2))NN$(XX)TAB(38)"{sh -}"
1775 PRINT"{cm z}{sh asterisk*18}{cm e}{sh asterisk*18}{cm x}":PRINT"{cyan}{cm a}{sh asterisk*18}{cm r}{sh asterisk*18}{cm s}"
1780 PRINT"{cyan}{sh -}{green}{reverse on}Shield pts{space*3}:{space*4}{reverse off}{cyan}{sh -}{green}{reverse on}Shield pts{space*3}:{space*4}{cyan}{reverse off}{sh -}":PRINT"{cm q}{sh asterisk*18}{sh +}{sh asterisk*18}{cm w}"
1785 PRINT"{cyan}{sh -}{blue}{reverse on}Hit Points{space*3}:{space*4}{reverse off}{cyan}{sh -}{blue}{reverse on}Hit Points{space*3}:{space*4}{cyan}{reverse off}{sh -}":PRINT"{cm q}{sh asterisk*18}{sh +}{sh asterisk*18}{cm w}"
1790 PRINT"{cyan}{sh -}{purple}{reverse on}Hit Ratio (%):{space*4}{reverse off}{cyan}{sh -}{purple}{reverse on}Hit Ratio (%):{space*4}{cyan}{reverse off}{sh -}":PRINT"{cm z}{sh asterisk*3}{cm r}{sh asterisk*10}{cm r}{sh asterisk*3}{cm e}{sh asterisk*3}{cm r}{sh asterisk*10}{cm r}{sh asterisk*3}{cm x}":PRINT"{space*4}{sh -}{space*10}{sh -}{space*7}{sh -}{space*10}{sh -}"
1795 PRINT"{space*4}{cm z}{sh asterisk*10}{cm x}{space*7}{cm z}{sh asterisk*10}{cm x}"
1800 UU(1)=UU(1)+1:X=INT(RND(TI)*100)+1:IFX>=DTH(1)THENHC$(1)="{space*3}Miss{space*3}":GOTO1815
1805 DM=DM(DD(5)):X=INT(RND(TI)*DM)+1:PP=DD(11)/DD(10):AD=INT(PP*X):MT=MT-AD
1810 HC$(1)="Hit for"+STR$(AD):IFAD<10THENHC$(1)=HC$(1)+" "
1811 UH(1)=UH(1)+1:IFMT<1THENHC$(2)="{space*8}":GOTO1830
1815 UU(2)=UU(2)+1:X=INT(RND(TI)*100)+1:IFX>=DTH(2)THENHC$(2)="{space*3}Miss{space*3}":GOTO1830
1820 DM=DM(MA(XX)):X=INT(RND(TI)*DM)+1:PP=MT/MP:AF=INT(PP*X):IFAF=0THEN1825:ELSEIFDD(7)>0THENGOSUB1885
1825 HC$(2)="Hit for"+STR$(AF):IFAF<10THENHC$(2)=HC$(2)+" "
1826 UH(2)=UH(2)+1:DD(11)=DD(11)-AF
1830 IFAC=0THENGOSUB4300:IFRF$="1"THEN1815
1831 IFRF$="0"ANDAC=0THEN1800
1832 PRINT"{home}{down*4}"TAB(16)"{reverse on}{green}{space*2}{left*3}"STR$(DD(9))TAB(35)"{space*2}{left*3}0"
1835 PRINT"{down}"TAB(16)"{reverse on}{blue}{space*2}{left*3}"STR$(DD(11))TAB(35)"{space*2}{left*3}"STR$(MT)
1840 IFUH(1)=0THENRR(1)=0:ELSERR(1)=INT((UH(1)/UU(1))*100)
1845 IFUH(2)=0THENRR(2)=0:ELSERR(2)=INT((UH(2)/UU(2))*100)
1850 PRINT"{down}"TAB(16)"{reverse on}{purple}{space*3}{left*4}"STR$(RR(1))TAB(35)"{space*3}{left*4}"STR$(RR(2))
1855 PRINT"{pink}{down}"TAB(5)HC$(1)TAB(24)HC$(2)
1860 IFDD(11)<=0THENGOTO2600
1865 IFMT<=0THENGOSUB2700:GOTO1720
1870 PRINT"{cyan}{down*2}{space*15}{left*15}{reverse on}R{reverse off}un or {reverse on}F{reverse off}ight? ";:MAX=1:GOSUB200:IFI$="F"THEN1800:ELSEIFI$<>"R"THEN1870
1875 X=INT(RND(TI)*100)+1:IFX<=35THENPRINT"You succeed!":GOSUB650:GOTO3300
1880 HC$(1)=" Blocked! ":GOTO1815
1885 REM ----- PLAYER SHIELD ----------------------------------------------
1890 SF=DD(7):IFSF>AFTHENSF=AF
1895 AF=AF-SF
1900 IFDD(9)<=0THENDD(7)=0:ELSEDD(9)=DD(9)-1
1905 RETURN
2000 REM ----- SEE STATISTICS -------------------------------------------------
2010 PRINT"{clear}Character Statistics{white}"R$R$DD$(1)R$:I=40
2030 A$="{yellow}Weapon{space*6}: {white}"+WW$(DD(5))+"{ct i}{yellow}Armour{space*6}: {white}"+AA$(DD(6)):GOSUB550
2035 A$="{yellow}Shield{space*6}: {white}"+SS$(DD(7))+" ("+STR$(DD(9))+" )"+"{ct i}{yellow}Hit points{space*2}:{white}"+STR$(DD(11))+" /"+STR$(DD(10)):GOSUB550
2040 A$="{yellow}Strength{space*4}:{white}"+STR$(DD(2))+"{ct i}{yellow}Dexterity{space*3}:{white}"+STR$(DD(3)):GOSUB550
2042 A$="{yellow}Constitution:{white}"+STR$(DD(4))+"{ct i}{yellow}Gold{space*8}:{white}"+STR$(DD(12)):GOSUB550
2045 A$="{yellow}Experience{space*2}:{white}"+STR$(DD(13))+"{ct i}{yellow}Level{space*7}:{white}"+STR$(DD(14)):GOSUB550
2046 A$="{yellow}Regeneration:{white}"+STR$(DD(15))+"{ct i}{yellow}Staff Pieces:{white}"+STR$(DD(8)):GOSUB550
2047 PRINT"{yellow}Time Left{space*3}:{white}"+STR$(PEEK(2825))+" min."+R$
2050 GOSUB650:GOTO3300
2600 REM ----- YOU DIE (ARENA) ------------------------------------------------
2610 GOSUB500:PRINTR$R$A$"Uh-Oh!{space*2}You have died!{space*2}Better Luck next time!"
2615 IFDD(15)>0THENPRINT"But, you have been ressurected by magic!!":DD(15)=DD(15)-1:DD(11)=DD(10):GOTO3300
2620 OPEN2,DV,2,""+LU$+":wm.players"
2630 RECORD#2,RR
2640 A$="none"+R$+"0"+R$:FORX=2TO19:A$=A$+STR$(DD(X))+R$:NEXT
2650 PRINT#2,A$:CLOSE2:END
2700 REM ----- YOU KILL MONSTER -----------------------------------------------
2710 GOSUB500:PRINTR$R$R$R$A$NN$(XX)" is dead!"
2715 GOSUB500:PRINTA$"You get{white}"EE(XX);A$"experiece points.":DD(13)=DD(13)+EE(XX)
2720 GOSUB500:PRINTA$"You get{white}"GG(XX);A$"gold pieces.":DD(12)=DD(12)+GG(XX):GOSUB500:PRINTA$"Your total is now{white}"DD(12)
2730 PRINTR$"{light gray}{reverse on}F{reverse off}ight or {reverse on}E{reverse off}xit the Arena? {white}";:MAX=1:GOSUB200:IFI$="F"THENRETURN:ELSEIFI$<>"E"THEN2730
2740 GOTO3300
2800 REM ----- SEQ FILE FOR KILLS ---------------------------------------------
2810 OPEN2,DV,2,""+LU$+":wm.kills,s,a"
2820 IFFL=1THENA$=HS$+KL$+DD$(1):ELSEA$=DD$(1)+KL$+HS$
2830 PRINT#2,CHR$(34)+A$:CLOSE2:RETURN
3220 PRINT"{white} {ct o}{cm @*14}"
3230 PRINT"{ct o}{cm m}{143}{reverse on}{light gray} {cm a}{sh asterisk*2}{sh -} {cm r}{sh asterisk}{cm r}{sh asterisk}{cm a}{sh asterisk*2} {white}{reverse off}{ct o}{cm g}{143} {cyan}Warriors and Monsters"
3240 PRINT"{white}{ct o}{cm m}{143}{reverse on}{light gray} {cm q}{sh asterisk} {sh -} {sh -} {sh -} {cm q}{sh asterisk}{space*2}{white}{reverse off}{ct o}{cm g}{143} {cyan}by: Cpt. Cockroach"
3250 PRINT"{white}{ct o}{cm m}{143}{reverse on}{light gray} {cm z}{sh asterisk*2}{cm z}{sh asterisk}{cm e} {sh -} {cm z}{sh asterisk*2} {white}{reverse off}{ct o}{cm g}{143} {cyan}and Mr. Bill"
3260 PRINT"{white} {ct o}{cm t*14}{143}"
3270 PRINT"{light green} CALL THE ELITE BBS -- (602)/742-7319{cyan}"
3280 END
3300 REM ----- TOWN MENU ------------------------------------------------------
3310 C$="AEFGHPSTWY"
3320 HH$="{f7}":M$(1)="{clear}{ct c}Town Menu"+R$:M$(2)=R$+"{ct c}[A]rmoury{space*31}[E]dge of Town
3330 M$(3)=R$+"{ct c}[F]ight in the Arena{space*20}[G]ambling Hall
3340 M$(4)=R$+"{ct c}[H]ealers Hut{space*27}[P]othecary
3350 M$(5)=R$+"{ct c}[S]hield Shop{space*27}[T]raining Hall"
3355 M$(6)=R$+"{ct c}[W]eapon Shop{space*27}[Y]our Statistics{ct c}"
3360 M$=R$+R$+"Choose: ":GOSUB400
3370 ONINSTR(C$,A$)GOTO3500,1600,1700,3800,4200,1400,3600,4000,3400,2000:GOTO3360
3400 REM ----- WEAPON ---------------------------------------------------------
3410 GOSUB500:PRINTA$"{clear}The Weapons Shop"R$KK$:I=30
3430 FORX=1TO10:GOSUB500:A$=A$+STR$(X)+" "+WW$(X)+"{ct i}"+STR$((2^X)*75):GOSUB550:NEXTX:PRINTR$"{cyan}You have{yellow}"DD(12)"{cyan}pieces of gold."
3440 PRINT"You currently have a(n) {light green}"WW$(DD(5))"{cyan}."
3450 FF=1:GOSUB3700:IFVV<1ORVV>10THENGOTO3300:ELSEDD(5)=VV:GOTO3300
3500 REM ----- ARMOURY --------------------------------------------------------
3510 GOSUB500:PRINTA$"{clear}The Armoury"R$KK$:I=30
3530 FORX=1TO10:GOSUB500:A$=A$+STR$(X)+" "+AA$(X)+"{ct i}"+STR$((2^X)*75):GOSUB550:NEXTX:PRINTR$"{cyan}You have{yellow}"DD(12)"{cyan}pieces of gold."
3540 PRINT"You currently have a(n) {light green}"AA$(DD(6));"{cyan}."
3550 FF=2:GOSUB3700:IFVV<1ORVV>10THENGOTO3300:ELSEDD(6)=VV:GOTO3300
3600 REM ----- SHIELD ---------------------------------------------------------
3610 GOSUB500:PRINTA$"{clear}The Shield Shop"R$KK$:I=30
3630 FORX=1TO10:GOSUB500:A$=A$+STR$(X)+" "+SS$(X)+" ("+STR$(X*50)+"){ct i}"+STR$((2^X)*75):GOSUB550:NEXTX
3631 RC=DD(7)*10:GOSUB500:A$=A$+R$+"-->[R]epair Shield{ct i} "+STR$(RC):GOSUB550
3632 PRINTR$"{cyan}You have{yellow}"DD(12)"{cyan}pieces of gold."
3640 PRINT"You currently have a(n) {light green}"SS$(DD(7))" ("+STR$(DD(9))+" )"
3650 FF=3:GOSUB3700:IFI$="R"THEN3655
3651 IFVV<1ORVV>10THEN3300
3652 DD(7)=VV:DD(9)=(VV*50):GOTO3300
3655 IFDD(7)=0THENGOSUB500:PRINTA$"No Shield!":GOSUB650:GOTO3600:ELSEGOSUB500:M$=A$+"Repair Shield? ":GOSUB600:IFSS=0THEN3600
3660 IF(DD(12)-RC)<=0THENPRINT"{light gray}Sorry, want exceeds coin!":GOSUB650:GOTO3600
3661 DD(12)=DD(12)-RC:DD(9)=(DD(7)*50):GOSUB500:PRINTA$"Shield Repaired!":GOSUB650:GOTO3300
3700 REM ----- INPUT FOR SHOPS ------------------------------------------------
3710 PRINTR$"{white}Choose (0 to quit):{sh space}";:MAX=2:GOSUB200
3720 VV=VAL(I$):IFI$="R"THENRETURN
3725 IFVV<1ORVV>10THENRETURN
3730 PRINT"Purchase {light blue}";
3740 IFFF=1THENPRINTWW$(VV);:ELSEIFFF=2THENPRINTAA$(VV);:ELSEIFFF=3THENPRINTSS$(VV);
3750 M$="{white}? ":GOSUB600:IFSS=0THEN3710
3760 TC=(2^VV)*75:IFTC>DD(12)THENPRINT"Sorry, wants exceed coin!":GOTO3710:ELSEPRINT"Sold!"R$:DD(12)=DD(12)-TC:GOSUB650:RETURN
3800 REM ----- GAMBLING HALL --------------------------------------------------
3810 QQ=QQ+1:IFQQ>4THENPRINT"{clear}The bouncers recognize your ugly face and kick you out!"R$:GOSUB650:GOTO3300:ELSEPRINT"{light gray}{clear}Gambling Hall"
3820 GOSUB500:PRINTR$A$"You have{yellow}"DD(12);A$;"pieces of gold."
3830 GOSUB500:PRINTR$A$"How much gold would you like to wager (0 to quit)? ";:MAX=6:GOSUB200:B=VAL(I$):IFB<=0THEN3300
3840 IFB>DD(12)THENPRINT"{white}Sorry! You don't have that much!":GOTO3820
3850 NO=INT(RND(TI)*10)+1
3860 PRINT"{white}The numbers range from {light blue}1{white} to{light blue}"NO"{white}"
3870 CG=INT(RND(TI)*(NO/2))+1:CG=CG+INT(RND(TI)*(NO/2))+1
3880 PRINTR$"{white}What is your guess? ";:MAX=2:GOSUB200:G=VAL(I$)
3890 IFCG=GTHENPRINTR$"Yes! You won{light blue}";B*NO;"{cyan}pieces of gold!":ELSEPRINTR$"No, Sorry!{space*2}Better luck next time!":NO=-1:PRINT"You lost{light blue}"B"{white}pieces of gold."
3900 DD(12)=DD(12)+(NO*B):PRINT:GOSUB650
3910 GOTO3810
4000 REM ----- TRAINING HALL --------------------------------------------------
4010 GOSUB500:PRINTA$"Please wait...Switching Modules":DLOAD"prg.wm.p3",U(D2),D(L2)
4200 REM ----- HEALERS HUT ----------------------------------------------------
4210 PRINT"{clear}{light gray}You enter the hut of Angarak the Healer"
4220 GOSUB500:PRINTA$R$"It will cost{white}"(DD(14)*2)A$"gold per hit point."
4230 GOSUB500:PRINTA$R$"You have lost{white}"(DD(10)-DD(11))A$"hit points."
4240 PRINT"How many would you like healed (0 to quit)? ";:MAX=3:GOSUB200:A=VAL(I$):IFA=0THEN3300:ELSEIFA<0THEN4210
4250 TM=((DD(14)*2)*A):IFDD(12)<TMTHENGOSUB500:PRINTA$R$"You don't have enough money for that!":GOTO4220
4260 IFA+DD(11)>DD(10)THENGOSUB500:PRINTR$A$"Thats over your max hit points!":GOTO4220
4270 DD(11)=DD(11)+A:DD(12)=DD(12)-TM
4280 GOSUB500:PRINTR$A$"Total gold spent:{space*2}{white}";TM:PRINTA$"Gold left in purse:{white}"DD(12)
4290 PRINTA$"Points healed:{space*5}{white}";A:PRINT:GOSUB650:GOTO3300
4300 REM ----- ASCII COMBAT ---------------------------------------------------
4310 IFRF$="1"THEN4340:ELSEPRINT"{yellow}You attack "NN$(XX)" and ";:IFLEFT$(HC$(1),1)<>"H"THENPRINT"Miss!":GOTO4330
4320 PRINT"HIT! for"+STR$(AD)
4330 PRINT"{yellow}He has"+STR$(MT)+" hit points remaining.":PRINT:IFMT<1THENGOSUB2700:GOTO1720
4340 PRINT"{blue}"NN$(XX)" attacks you and ";:IFLEFT$(HC$(2),1)<>"H"THENPRINT"Miss!":GOTO4360
4350 PRINT"HIT! for"+STR$(AF):IFAD=0THEN4360:ELSEIFDD(7)>0THENPRINT"{blue}Your shield absorbs"+STR$(SF)+" ("+STR$(DD(9))+" )."
4360 PRINT"{blue}You have"+STR$(DD(11))+" hit points remaining.":IFDD(11)<1THEN2600
4370 PRINT:PRINT"{cyan}{reverse on}R{reverse off}un or {reverse on}F{reverse off}ight?";:MAX=1:GOSUB200:PRINT:IFI$="F"THENRF$="0":RETURN
4380 X=INT(RND(TI)*100)+1:IFX<=35THENPRINT"You succeed!"R$:GOSUB650:GOTO3300
4385 PRINT"Your opponent blocked you!":RF$="1":RETURN
