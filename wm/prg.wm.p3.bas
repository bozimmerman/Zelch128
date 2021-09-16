!--------------------------------------------------
!- Thursday, September 16, 2021 2:46:43 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.wm.p3.prg
!- Unknown Machine
!--------------------------------------------------
100 CC=0:TRAP700:GOTO1000
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
310 IFI>47ANDI<58THENRETURN
320 IFI>192ANDI<219ORI=32THENRETURN
325 IFI>64ANDI<91THENI=I+128:ELSEIFI<>63THENI=0
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
660 PRINT"{light gray}Press SPACE BAR to continue."
661 GETKEYB$:IFB$<>CHR$(32)THEN661:ELSERETURN
700 REM ----- MAIN TRAP ROUTINE -----------------------------------------------
710 IFPEEK(2824)=0THENPRINTR$R$"{white}{ct o}System time limit exceeded!":GOSUB800:GOTO3220
715 IFPEEK(2827)=1THENR$R$"{white}{reverse on}{ct o}CARRIER DROPPED":GOSUB800:END
720 TRAP700:CLOSE2:PRINTR$"{white}BASIC error: "ERR$(ER)" @"EL;R$:GOSUB650:GOTO1000
800 REM ----- SAVE PLAYER -----------------------------------------------------
810 A$=""
820 OPEN2,DV,2,""+LU$+":wm.players":DD$(1)=DD$(1)+DT$
830 A$=DD$(1)+R$:FORX=1TO19:A$=A$+STR$(DD(X))+R$:NEXT
840 RECORD#2,RR:PRINT#2,A$:CLOSE2
850 DD$(1)=LEFT$(DD$(1),LEN(DD$(1))-6):RETURN
950 REM ----- SEQ FILE READER -------------------------------------------------
951 CLOSE2:PRINT:OPEN2,DV,2,""+LU$+":"+F$+",s,r":TRAP954:IFDS>0THEN954
952 INPUT#2,A$:SS=ST:PRINTA$:IFSS=0THEN953:ELSE954
953 FORX=1TO9:GETA$:IFA$<>" "THENNEXTX:GETA$:GOTO952
954 TRAP700:CLOSE2:RETURN
1000 REM ----- TRAINING HALL --------------------------------------------------
1001 OPEN2,DV,2,""+LU$+":wm.ml"+STR$(DD(14))+",s,r"
1002 FORX=1TO10:PRINT".";
1003 INPUT#2,NN$(X),AA(X),DQ(X),GG(X),EE(X),MA(X):NEXT
1004 FORX=1TO26:INPUT#2,MM$(X):PRINT".";:NEXT
1005 X=0
1006 PRINT".";:X=X+1:INPUT#2,XX(X),YY(X),OP(X),DT$(X),DU$(X)
1007 IFST=0THEN1006
1008 CLOSE2:PRINT
1009 IFCC=1THENRETURN
1010 M$="":PRINT"{clear}{light gray}You enter an antechamber with a man sitting behind a small, wooden desk."
1020 PRINT"He looks up, '"DD$(1)"' eh?{space*2}Just a sec, lemme get your record."
1030 GOSUB500:PRINTR$A$"You have a total of{white}"STR$(DD(13))A$" experience points now."
1040 FORX=10TO(DD(14)-1)STEP-1
1050 IFDD(13)>((2^X)*100)THEN1065
1060 NEXT:GOSUB500:PRINTR$A$"Sorry, you are not eligible for a level yet.":GOSUB650:GOSUB500:PRINT:PRINTA$"You trudge back to town!":DLOAD"prg.wm.p2",U(D2),D(L2)
1065 GOSUB500:PRINTA$R$"Ahhhh! It appears that the council wants to see you.":GOSUB650
1070 IFDD(14)=1ANDDD(8)=0THEN5000
1071 IFDD(14)=2ANDDD(8)=1THEN5100
1072 IFDD(14)=3ANDDD(8)=2THEN5200
1073 IFDD(14)=4ANDDD(8)=3THEN5300
1074 IFDD(14)=5ANDDD(8)=4THEN5400
1075 IFDD(14)=6ANDDD(8)=5THEN5500
1076 IFDD(14)=7ANDDD(8)=6THEN5600
1077 IFDD(14)=8ANDDD(8)=7THEN5700
1078 IFDD(14)=9ANDDD(8)=8THEN5800
1079 IFDD(14)=10ANDDD(8)=9THEN5900
1080 IFDD(14)=10ANDDD(8)=10THEN6000
1081 IFDD(14)=10ANDDD(8)=0THEN7000
1125 REM ----- DO ALL OF THE OP-CODE SHIT -------------------------------------
1126 PRINT"{clear}":GOTO4500
1130 E=0:PRINT"{ct g}"
1135 E=E+1:IFSY=YY(E)ANDSX=XX(E)THEN1140:ELSE1135
1140 C=OP(E):ONCGOTO1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2100,2100,2100,2300,2400,2500,2600,2700
1145 END
1200 REM ----- PIECE OF STAFF -------------------------------------------------
1205 PRINTDT$(E):PRINTDU$(E):MID$(MP$(SY),SX,1)=" ":DD(8)=DD(8)+1:HP=(INT(RND(TI)*10)+1)+(INT((DD(4))/3))*2:DD(10)=DD(10)+HP:GOSUB650
1210 IFDD(14)=10THENDD(14)=10:ELSEDD(14)=DD(14)+1
1220 CC=1:GOTO1126
1300 REM ----- EXIT TO TOWN ---------------------------------------------------
1305 PRINT"{light gray}"DT$(E):M$="Do you wish to enter? ":GOSUB600:IFSS<>1THENSX=SX-1:GOTO1126
1310 IFCC=1THENGOSUB500:PRINTA$"Loading New Monster Level.":GOSUB1000:PRINT"You trudge back to town.":DLOAD"prg.wm.p2",U(D2),D(L2)
1320 IFCC=0THENPRINT"Sorry, you must get the piece before you can leave!":SX=SX-1:GOSUB650:GOTO1126
1400 REM ----- RAISE STATS ----------------------------------------------------
1405 PRINTDT$(E):DD(VAL(DU$(E)))=DD(VAL(DU$(E)))+2
1410 MID$(MP$(SY),SX,1)=" ":GOSUB650:GOTO1126
1500 REM ----- RAISE GOLD -----------------------------------------------------
1510 PRINTDT$(E):PRINT"{light gray}You get:{white}"VAL(DU$(E)):DD(12)=DD(12)+VAL(DU$(E)):GOSUB650
1515 MID$(MP$(SY),SX,1)=" ":GOTO1126
1600 REM ----- FREE ANSWER ----------------------------------------------------
1605 PRINTDT$(E):PRINT">";:MAX=20:GOSUB200:IFDU$(E)=I$THEN1610:ELSESX=SX-1:PRINT"Wrong...":GOSUB650:PRINT"{clear}":GOTO1126
1610 MID$(MP$(SY),SX,1)=" ":PRINT"Right!!!":GOSUB650:GOTO1126
1700 REM ----- YES/NO RESPONSE ------------------------------------------------
1705 PRINTDT$(E),DU$(E):GOSUB600:IFSS=1THENSX=SX+1:GOSUB650:GOTO1126
1710 IFSS=0THENSX=SX-1:GOSUB650:GOTO1126
1800 REM ----- PRINT SOMETHING ------------------------------------------------
1805 PRINTDT$(E):PRINTDU$(E):GOSUB650:MID$(MP$(SY),SX,1)=" ":GOTO1126
1900 REM ----- CHANGE SQUARE --------------------------------------------------
1905 PRINTDT$(E):A=VAL(DU$(E)):B=INT(A):C=A-B+.005:D=INT(C*100)
1910 MID$(MP$(D),B,1)=" ":MID$(MP$(SY),SX,1)=" ":GOSUB650:GOTO1126
2000 REM ----- TAKE DAMAGE ----------------------------------------------------
2010 PRINTDT$(E):DD(11)=DD(11)-VAL(DU$(E)):IFDD(11)<=0THENPP$="{ct y}":PRINT"Disk access...Please wait":DLOAD"wm.p2
2020 PRINT"You take:"VAL(DU$(E)):GOSUB650:MID$(MP$(SY),SX,1)=" ":GOTO1126
2100 REM ----- PRINT SOMETHING NO ERASE ---------------------------------------
2105 PRINTDT$(E):PRINTDU$(E):GOSUB650
2110 IFOP(E)=10THENGOSUB3300
2120 IFOP(E)=12THENGOSUB3600
2130 IFOP(E)=13THENGOSUB3400
2140 IFOP(E)=14THENGOSUB3500
2150 PRINT"{clear}":GOTO1126
2200 REM ----- FREE ANSWER SX=SX+1 --------------------------------------------
2205 PRINTDT$(E):PRINT">";:MAX=20:GOSUB200:IFDU$(E)=I$THEN1610:ELSESX=SX+1:PRINT"Wrong...":GOSUB650:PRINT"{clear}":GOTO1126
2210 MID$(MP$(SY),SX,1)=" ":PRINT"Right!!!":GOSUB650:GOTO1126
2300 REM ----- TAKE DAMAGE.PERM.SX=SX-1 ---------------------------------------
2310 PRINTDT$(E):DD(11)=DD(11)-VAL(DU$(E)):IFDD(11)<=0THENPP$="{ct y}":PRINT"Disk access...Please wait":DLOAD"wm.p2
2320 PRINT"You take:"VAL(DU$(E)):GOSUB650:SX=SX-1:GOTO1126
2400 REM ----- TAKE DAMAGE.PERM.SX=SX+1 ---------------------------------------
2410 PRINTDT$(E):DD(11)=DD(11)-VAL(DU$(E)):IFDD(11)<=0THENPP$="{ct y}":PRINT"Disk access...Please wait":DLOAD"wm.p2
2420 PRINT"You take:"VAL(DU$(E)):GOSUB650:SX=SX+1:GOTO1126
2500 REM ----- DROP STATS -----------------------------------------------------
2505 PRINTDT$(E):DD(VAL(DU$(E)))=DD(VAL(DU$(E)))-2
2510 MID$(MP$(SY),SX,1)=" ":GOSUB650:GOTO1126
2600 REM ----- FREE ANSWER SY=SY+1 --------------------------------------------
2605 PRINTDT$(E):PRINT">";:MAX=20:GOSUB200:IFDU$(E)=I$THEN1610:ELSESY=SY+1:PRINT"Wrong...":GOSUB650:PRINT"{clear}":GOTO1126
2610 MID$(MP$(SY),SX,1)=" ":PRINT"Right!!!":GOSUB650:GOTO1126
2700 REM ----- FREE ANSWER SY=SY-1 --------------------------------------------
2705 PRINTDT$(E):PRINT">";:MAX=20:GOSUB200:IFDU$(E)=I$THEN1610:ELSESY=SY-1:PRINT"Wrong...":GOSUB650:PRINT"{clear}":GOTO1126
2710 MID$(MP$(SY),SX,1)=" ":PRINT"Right!!!":GOSUB650:GOTO1126
3220 PRINT"{white} {ct o}{cm @*14}"
3230 PRINT"{ct o}{cm m}{143}{reverse on}{light gray} {cm a}{sh asterisk*2}{sh -} {cm r}{sh asterisk}{cm r}{sh asterisk}{cm a}{sh asterisk*2} {white}{reverse off}{ct o}{cm g}{143} {cyan}Warriors and Monsters"
3240 PRINT"{white}{ct o}{cm m}{143}{reverse on}{light gray} {cm q}{sh asterisk} {sh -} {sh -} {sh -} {cm q}{sh asterisk}{space*2}{white}{reverse off}{ct o}{cm g}{143} {cyan}by: Cpt. Cockroach"
3250 PRINT"{white}{ct o}{cm m}{143}{reverse on}{light gray} {cm z}{sh asterisk*2}{cm z}{sh asterisk}{cm e} {sh -} {cm z}{sh asterisk*2} {white}{reverse off}{ct o}{cm g}{143} {cyan}and Mr. Bill"
3260 PRINT"{white} {ct o}{cm t*14}{143}"
3270 PRINT"{light green} CALL THE ELITE BBS -- (602)/742-7319{cyan}"
3280 END
3300 REM ----- SX=SX+1 --------------------------------------------------------
3310 SX=SX+1:RETURN
3400 REM ----- SY=SY+1 --------------------------------------------------------
3410 SY=SY+1:RETURN
3500 REM ----- SX=SX-1 --------------------------------------------------------
3510 SX=SX-1:RETURN
3600 REM ----- SY=SY-1 --------------------------------------------------------
3610 SY=SY-1:RETURN
3999 END
4300 REM ----- ENDING MAZE ----------------------------------------------------
4310 TRAP10000:PRINT"{clear}"
4320 PRINT"These are the commands:{space*2}N for north"
4330 PRINT"{space*25}S for south"
4340 PRINT"{space*25}E for east"
4350 PRINT"{space*25}W for west"
4360 PRINTR$"That's all!...{space*2}Good Luck!"R$:GOSUB650:PRINT"{clear}":GOTO4500
4400 GETKEYA$:I=FRE(0):I=ASC(A$):GOSUB310:A$=CHR$(I)
4410 IFA$="N"THENSY=SY-1
4420 IFA$="S"THENSY=SY+1
4430 IFA$="E"THENSX=SX+1
4440 IFA$="W"THENSX=SX-1
4450 IFMID$(MM$(SY),SX,1)="#"THENPRINTR$"{ct g*2}{cyan}{reverse on}You smash into a {pink}VERY{cyan} obvious wall!!":GOSUB650:PRINT"{clear}":ELSEGOTO4500
4460 IFA$="N"THENSY=SY+1
4470 IFA$="S"THENSY=SY-1
4480 IFA$="E"THENSX=SX-1
4490 IFA$="W"THENSX=SX+1
4500 SS=3:A$=""
4510 B$=MID$(MM$(SY),(SX-2),5)
4520 C$=LEFT$(B$,2)
4530 D$=RIGHT$(B$,2)
4540 E$="!"
4550 BB$=C$+E$+D$
4560 MID$(MM$(SY),(SX-2),5)=BB$
4600 REM ----- DRAW MAP -------------------------------------------------------
4605 PRINT"{home}{light gray}{cm a}{sh asterisk*5}{cm s}"
4610 FORX=-2TO2
4611 YY=SY+X:XX=SX-2
4612 A$=MID$(MM$(YY),(XX),5)
4613 PRINT"{sh -}";A$;"{sh -}"
4614 NEXT
4615 PRINT"{cm z}{sh asterisk*5}{cm x}"
4620 FORX=1TO26:MM$(X)=MP$(X):NEXT
4700 REM ----- CHECK FOR SPECIAL SQUARE ---------------------------------------
4710 IFASC(MID$(MM$(SY),SX,1))=160THENPRINT"{ct g}":GOTO1130:ELSEGOTO4400
5000 REM ----- GET 1ST PIECE OF STAFF -----------------------------------------
5010 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}":F$="wm.maze/1":GOSUB950
5020 SY=15:SX=15
5030 GOSUB500:M$=A$+"Do you accept this quest? ":GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5040 PRINTR$R$"{light gray}The men knod their heads in respect.{space*2}They join there hands, and cast a spell.{space*2}You feel your guts wrench, and....":GOSUB650
5050 GOTO4300
5100 REM ----- GET 2ND PIECE OF STAFF -----------------------------------------
5110 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5120 SY=21:SX=21:PRINT"The men stand and the leader asks 'Ready to get the second piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5130 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
5200 REM ----- GET 3RD PIECE OF STAFF -----------------------------------------
5210 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5220 SY=8:SX=19:PRINT"The men stand and the leader asks 'Ready to get the third piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5230 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
5300 REM ----- GET 4TH PIECE OF STAFF -----------------------------------------
5310 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5315 PRINT"The men stand and the leader asks 'Ready to get the fourth piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5320 SX=13:SY=6:PRINT"The men stand up at your answer and the leader says:"
5321 PRINT"'Becuase of your continued devotion to our cause we have decided to reward you."
5322 PRINT"We are going to add 100 points to your current shield by means of a layer of"
5323 PRINT"Mithril....Use it wisely...":DD(9)=DD(9)+100
5330 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
5400 REM ----- GET 5TH PIECE OF STAFF -----------------------------------------
5410 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5420 SX=21:SY=13:PRINT"The men stand and the leader asks 'Ready to get the fifth piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5430 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
5500 REM ----- GET 6TH PIECE OF STAFF -----------------------------------------
5510 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5520 SX=13:SY=12:PRINT"The men stand and the leader asks 'Ready to get the sixth piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5530 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
5600 REM ----- GET 7TH PIECE OF STAFF -----------------------------------------
5610 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5620 SX=14:SY=13:PRINT"The men stand and the leader asks 'Ready to get the seventh piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5630 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
5700 REM ----- GET 8TH PIECE OF STAFF -----------------------------------------
5710 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5720 SX=6:SY=21:PRINT"The men stand and the leader asks 'Ready to get the eighth piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5730 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
5800 REM ----- GET 9TH PIECE OF STAFF -----------------------------------------
5810 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5820 SX=9:SY=21:PRINT"The men stand and the leader asks 'Ready to get the ninth piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5830 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
5900 REM ----- GET 10TH PIECE OF STAFF -----------------------------------------
5910 FORX=1TO26:MP$(X)=MM$(X):NEXT:PRINT"{clear}"
5920 SX=13:SY=21:PRINT"The men stand and the leader asks 'Ready to get the last piece?";:GOSUB600:IFSS=0THENDLOAD"prg.wm.p2",U(D2),D(L2)
5930 PRINT"Once again the men cast the teleport spell.":GOSUB650:GOTO4300
6000 REM ----- END OF GAME ----------------------------------------------------
6010 F$="wm.end 1":GOSUB950
6020 PRINT"<y/n>: ";:MAX=2:GOSUB200:IFI$="N"THEN6070
6025 IFI$="Y"THEN6030:ELSE6070
6030 PRINT"Ah, you are a traitor and scum just like the last one, switching sides
6040 PRINT"when you are losing.{space*2}I respect you not!'{space*2}With that he bounds over and
6050 PRINT"crushes your head.{space*2}Sorry.
6060 PRINT:PRINT"The end!{space*2}Maybe not such a right choice eh?":EN$="0":PRINT"Please wait....Disk Access...":DLOAD"prg.wm.p2",U(D2),D(L2)
6070 F$="wm.end 2":GOSUB950
6080 DD(8)=0:EN$="1":PRINT"Please wait....Disk Access...":DLOAD"prg.wm.p2",U(D2),D(L2)
7000 REM SEE ENDING AGAIN
7010 PRINT"{cyan}Would you like to see the ending again?":GOSUB600:IFSS=0THENPRINT"You trudge back to town...":DLOAD"prg.wm.p2",U(D2),D(L2)
7020 F$="wm.end 1":GOSUB950
7030 F$="wm.end 2":GOSUB950:GOSUB650:PRINT"Disk Access...":DLOAD"prg.wm.p2",U(D2),D(L2)
10000 REM SECOND TRAP
10001 IFPEEK(2824)=0THENPRINTR$R$"{white}{ct o}System time limit exceeded!":GOSUB800:GOTO3220
10002 IFPEEK(2827)=1THENPRINTR$R$"{white}{reverse on}{ct o}CARRIER DROPPED":GOSUB800:END
10010 TRAP10000:GOTO4600
