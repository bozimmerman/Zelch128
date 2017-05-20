!--------------------------------------------------
!- Saturday, May 20, 2017 1:37:48 AM
!- Import of : 
!- c:\src\zelch128\extras\mdr.motel.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
5 U=PEEK(186):D=0:PRINT"{ct n}":R$=CHR$(13):TRAP11000
10 DIMW$(100),W(100),D(100),D$(100),PL(30,8),PL$(30),M$(99,6),TT$(10),FF(30),TT(10)
20 TW=7:TD=7:F$="mdr.title":GOSUB30:GOTO100
30 OPEN2,U,2,"0:"+F$+",s,r"
31 SYS8210
33 CLOSE2:PRINT"{ct n}":RETURN
54 GOTO56
55 U=PEEK(186):OPEN1,U,15,"s0:mdr.motel":CLOSE1:DSAVE"mdr.motel",U(U):STOP
56 REM
60 OPEN3,U,3,"0:mdr.losers":##################3,1:RETURN
70 OPEN4,U,4,"0:mdr.stuff":##################4,1:RETURN
100 PRINT"{yellow}Murder Motel"+R$+"Zelch 128 version"+R$+"(c)1991 Elite Software"+R$+"{white}{down}Written by Bo Zimmerman"+R$+"Structure by Sean D Wagle"
101 RESTORE102:FORI=1TO6:READDR$(I):NEXTI
102 DATA EAST,NORTH,WEST,SOUTH,UP,DOWN
103 RESTORE104:FORI=1TO5:READAA$(I):NEXTI
104 DATA"You draw back your glinting blade","You take careful aim","You fill thetanks, aim,","You light the weapon, aim,","You load your sprayer, aim,"
105 RESTORE106:FORI=1TO5:READDC$(I):NEXTI
106 DATA"it bounces off his shield!","Phump! Right into his flak jacket!","he quickly uses his gas mask!","he extinguishes your weapon!","his lye protects him!"
107 RESTORE108:FORI=1TO6:READKK$(I):NEXTI
108 DATA"relieve him of his head!","bullets penetrate his flesh!","watch him chokes from the fumes!","quickly overcook him!","melt him to a bubbling mass!"
110 PRINT"{down*2}{pink}Opening the gates...";
120 OPEN1,U,15
130 OPEN2,U,2,"0:mdr.rooms":FORI=1TO99:##################2,I:IFI/2=INT(I/2)THENPRINT".";
135 FORX=0TO6:INPUT#2,M$(I,X):NEXTX:NEXTI:CLOSE2:PRINT
140 PRINT"{down}Making the beds...";:GOSUB70
150 FORI=1TOTW:RESTORE160:FORX=1TO10:READW$(((I-1)*10)+X):##################4,((I-1)*10)+X:INPUT#4,W(((I-1)*10)+X):NEXTX:PRINT".";:NEXTI
160 DATA AXE HANDLE,PISTOL,CHLORINE GAS,FLAME THROWER,INDUSTRIAL ACID,AXE BLADE,BULLETS,GAS SPRAYER,LIGHTER FLUID,ACID SPRAYER
170 FORI=1TOTD:RESTORE180:FORX=1TO5:READD$(((I-1)*10)+X):A=((I-1)*10)+X:##################4,A+100:INPUT#4,D(A):NEXTX:PRINT".";:NEXTI:##################4,100:PRINT
171 RESTORE172:FORI=1TO3:FORX=6TO8:D=((I-1)*10)+X:READD$(D):##################4,100+D:INPUT#4,D(D):NEXTX:NEXTI:CLOSE4
172 DATA A ROTTEN BANANA,A DIRTY MAGAZINE,ICKY SMURFGUTS,YELLOW TOEFUZZ,POCKET LINT,AN EYEBALL,MEATLOAF SURPRISE,A DEAD SQUIRREL,SOME BROWN MUSHY STUFF
180 DATA RIOT SHIELD,FLAK JACKET,GAS MASK,FIRE EXTINGUISHER,LYE
190 PRINT"{down}Counting the bodies...";:GOSUB60
200 FORI=1TO30:##################3,I:INPUT#3,PL(I,1),PL$(I):FORX=2TO7:INPUT#3,PL(I,X):NEXTX:PRINT".";:NEXTI
210 ##################3,31:INPUT#3,ID,NA$,DT:##################3,1:CLOSE3:PRINT:CD=0:FORI=1TO30:IFPL(I,1)=IDTHENCD=I
220 NEXTI:GOSUB70:IFCDANDDT>PL(CD,5)THENPL(CD,5)=DT:PL(CD,4)=40
230 PRINT:PRINT:F$="mdr.menu":GOSUB30
1000 D=0:PRINT:PRINT"{cyan}Time:{white}"+STR$(PEEK(2825)):PRINT"{cyan}<?>Register: {white}";:
1010 GETKEYA$:IFA$="?"THENPRINTA$:GOTO230:ELSEIFVAL(A$)<1ORVAL(A$)>8THEN1010:ELSEPRINTA$
1020 A=VAL(A$):ONAGOSUB3000,2000,1500,1100,1300,3999,1200,9999:GOTO1000
1100 PRINT"{clear}{down}{yellow}Murder Motel Help files"
1105 PRINT"{down}{yellow}<{white}1{yellow}> {cyan}Murder Motel intro"
1110 PRINT"{yellow}<{white}2{yellow}> {cyan}Weapons and playing"
1115 PRINT"{yellow}<{white}3{yellow}> {cyan}Squealing"
1120 PRINT"{yellow}<{white}4{yellow}> {cyan}Inside the motel"
1125 PRINT"{yellow}<{white}5{yellow}> {cyan}Previous winners"
1130 PRINT"{yellow}<{white}6{yellow}> {cyan}Go back to the lobby"
1140 PRINT"{down}{cyan}Help command: {white}";
1150 GETKEYA$:IFVAL(A$)<1ORVAL(A$)>6THEN1150:ELSEA=VAL(A$):PRINTA$:IFA=6THENRETURN
1160 PRINT:PRINT:F$="mdr.help"+STR$(A):GOSUB30:PRINT:PRINT"Hit a key";:GETKEYA$:PRINT:GOTO1100
1200 PRINT"{down*2}{cyan}Status ({white}Player number"+STR$(CD)+"{cyan})":IFCD=0THENPRINT"{down}Unregistered player.":FORI=1TO1:GOTO1290
1210 PRINT"{cyan}Name: {white}"+NA$+"{cyan} (ID#"+STR$(ID)+")"
1220 PRINT"{cyan}Status: {white}";:A$="Dead.":IFPL(CD,3)THENA$="Alive!"
1230 PRINTA$:PRINT"{cyan}Plays remaining: {white}"+STR$(PL(CD,4))
1240 QP=0:PRINT"{cyan}Total kills: {white}"+STR$(PL(CD,7))
1260 PRINT"{cyan}{down}Items carried:{white}"
1270 FORI=1TO100:IFW(I)=CD+100THENPRINT" "+W$(I)+" {cyan}#{white}"+STR$(I)
1280 NEXTI:FORI=1TO100:IFD(I)=CD+100THENPRINT" "+D$(I)+" {cyan}#{white}"+STR$(I+100)
1290 NEXTI:IFQPTHENRETURN
1293 IFPL(CD,6)THENPRINT"{white} An urge to kill "+PL$(PL(CD,6))+" {cyan}#{white}"+STR$(PL(CD,6))
1295 PRINT:RETURN
1300 PRINT"{clear}{down}{yellow}Murder Motel Floor plans"
1305 PRINT"{down}{yellow}<{white}1{yellow}> {cyan}Map to floor one"
1310 PRINT"{yellow}<{white}2{yellow}> {cyan}Map to floor two"
1315 PRINT"{yellow}<{white}3{yellow}> {cyan}Map to floor three"
1320 PRINT"{yellow}<{white}4{yellow}> {cyan}Map to floor four"
1325 PRINT"{yellow}<{white}5{yellow}> {cyan}Go back to the lobby"
1340 PRINT"{down}{cyan}Maps command: {white}";
1350 GETKEYA$:IFVAL(A$)<1ORVAL(A$)>5THEN1350:ELSEA=VAL(A$):PRINTA$:IFA=5THENRETURN
1360 PRINT:PRINT:F$="mdr.map"+STR$(A):GOSUB30:PRINT:PRINT"Hit a key";:GETKEYA$:PRINT:GOTO1300
1500 PRINT"{cyan}{down*2}Top ten players:":C=999:FORI=0TO10:TT(I)=0:NEXTI
1510 FORE=1TO10:B=0:D=B:L=D:FORI=1TO30:W=PL(I,7):IF W<D OR W>C OR W=0 THEN1520:ELSEL=0:FORZ=1TO10:IFTT(Z)=ITHENL=1
1513 NEXTZ:IFL=0THEND=PL(I,7):B=I:TT(E)=I
1520 NEXTI:IFD>0ANDPL$(B)<>"empty"THENPRINT"{cyan}"+STR$(E)+" {white}"+PL$(B)+" {cyan}"+STR$(D)+" Kills":C=D:NEXTE
1530 PRINT:RETURN
2000 IFPL(CD,3)THENPRINT"Go away! You're registered already!":RETURN
2005 PRINT:PRINT"Finding a key for you...":IFCDTHEN2200
2010 F=0:FORI=1TO30:IFPL(I,1)=0THENF=I
2015 NEXTI:IFFTHENCD=F:GOTO2100
2020 DT$=MID$(STR$(DT),2):YR=VAL(MID$(DT$,1,2)):MO=VAL(MID$(DT$,3,2)):DA=VAL(MID$(DT$,5,2)):DA=DA-10:IFDA<1THENDA=29+(DA):MO=MO-1:IFMO=0THENMO=12:YR=YR-1
2030 FORI=1TO30:IFPL(I,3)=0THENA$=MID$(STR$(PL(I,5)),2):IFVAL(MID$(A$,1,2))<YRORVAL(MID$(A$,3,2))<MOORVAL(MID$(A$,5,2))<DATHENF=I
2040 NEXTI:IFFTHENCD=F:GOTO2100:ELSEPRINT"Sorry! No inactive players{f7}at this time!":RETURN
2100 PL(CD,1)=ID:PL$(CD)=NA$:PL(CD,7)=0
2200 PL(CD,2)=10:PL(CD,4)=40:PL(CD,5)=DT:GOSUB2500:PRINT
2250 PRINT"..ah, here we go! The ";:RESTORE2300:I=INT(RND(TI)*7)+1:FORX=1TOI:READA$:NEXTX:PRINTA$+" suite!":RETURN
2300 DATA "Frankenstein","Presidential","{f5}Police Line-do{f7}not cross{f5}","Sugar","Naught-sew","Honeymoon","Run-Down"
2500 F=0:FORI=1TO30:IFPL(I,3)=-2ANDI<>CDTHENF=I
2505 NEXTI:IFFTHENPL(CD,3)=1:PL(F,3)=1:PL(CD,6)=F:PL(F,6)=CD:WH=F:GOSUB14000:RETURN:ELSEFORI=1TO30:FF(I)=0:NEXTI
2510 F=0:FORI=1TO30:IFPL(I,1)>0ANDPL(I,3)<>0ANDI<>CDTHENF=I
2515 NEXTI:IFF=0THENPL(CD,3)=-2:PL(CD,6)=0:PRINT"{cyan}No living players yet, so{f7}you'll have to wait for a target...":RETURN
2520 F=0:FORI=1TO30:IFPL(I,3)=-1ANDI<>CDTHENF=I
2530 NEXTI:IFFTHENPL(F,3)=1:PL(F,6)=CD:WH=F:GOSUB14000
2540 FORI=1TO30:FF(I)=0:NEXTI
2550 FORI=1TO30:IFPL(I,1)=0ORPL(I,3)=0THENFF(I)=1:ELSEFF(PL(I,6))=1
2560 NEXTI:F=0:FORI=1TO30:IFFF(I)=0ANDI<>CDTHENF=I
2570 NEXTI:IFFTHENPL(CD,3)=1:PL(CD,6)=F:RETURN
2580 PL(CD,3)=-1:DO:F=INT(RND(TI)*30)+1:LOOPUNTILPL(F,1)>0ANDPL(F,3)<>0:IFF=CDTHEN2580:ELSEPL(CD,6)=F:RETURN
3000 IFCD=0ORPL(CD,1)=0THENPRINT:PRINT"{cyan}Go away! You must register first!":RETURN
3010 IFPL(CD,4)<1THENPRINT"You're ALL OUTTA PLAYS! HAHAHAHAH!":RETURN
3020 IFPL(CD,3)=0THENPRINT"Yer DEAD! Go Register!":RETURN
3030 LO=PL(CD,2)
3100 PRINT"{clear}{down}{cyan}You are now {white}"+M$(LO,0):PRINT" {cyan}(ROOM #{white}"+STR$(LO)+"{cyan})"
3110 PRINT"{down}Exits are: {white}";:FORI=1TO6:IFVAL(M$(LO,I))>0THENPRINTDR$(I)+", ";
3120 NEXTI:PRINT"{left*2}  ":PL(CD,2)=LO:SP$="          "
3150 GOSUB3800:FORI=1TO30:IFPL(I,2)<>LOORI=CD ORPL$(I)="empty"THEN3170:ELSEPRINTPL$(I)+" {cyan}#{white}"+STR$(I)+"{cyan}  >{white}";:A$="Dead.":IFPL(I,3)THENA$="Alive!"
3160 PRINTA$
3170 NEXT:IFX=12THENPRINT"{down*2}{yellow}Commands: {white}N){cyan}orth{white}, S){cyan}outh{ct k}"SP$"{white}E){cyan}ast{white}, W){cyan}est{white}, U){cyan}p{ct k}"SP$"{white}D){cyan}own{white}, K){cyan}ill{white}, Q){cyan}uit{ct k}"SP$"{white}T){cyan}ake{white}, L){cyan}eave{white}, I){cyan}nventory"
3200 PRINT:PRINT"{yellow}Time left:{white}"+STR$(PEEK(2825))
3205 IFPL(CD,4)<1THENPRINT:PRINT"{purple}Your play's for today are up!":GOTO1000
3210 PRINT"{yellow}Moves<{white}"+MID$(STR$(PL(CD,4)),2)+"{yellow}> Command: {white}";
3220 X=0:GETKEYA$:A=INSTR("enwsudtlkqi?",A$):IFA=0THEN3220
3230 IFA<7THENIFVAL(M$(LO,A))=0THEN3220
3240 PRINTA$:IFA>6THEN3250:ELSEPL(CD,4)=PL(CD,4)-1:LO=VAL(M$(LO,A)):GOTO3100
3250 IFA<>12ANDA<>10THEN3299:ELSEIFA=12THENX=12:GOTO3100:ELSEPRINT:GOTO1000
3299 ONA-6GOTO3300,3400,3500,3250,3900,3100:GOTO3220
3300 PRINT:IN$="":IN=0:INPUT"{white}<?>{yellow}Take what item #";IN$:IFIN$="?"THENGOSUB3800:GOTO3300
3305 IN=VAL(IN$):IFIN=0ORIN>199THEN3200:ELSEIFIN<100THENIFW(IN)<>LOTHENPRINT"{pink}{down}Huh?!?!":GOTO3200
3310 IFIN>100THENIFD(IN-100)<>LOTHENPRINT"{pink}{down}Huh?!?!":GOTO3200
3320 O=0:D=0:FORI=1TO100:IFW(I)=CD+100THENO=O+1
3330 IFD(I)=CD+100THEND=D+1
3340 NEXTI:IFO+D>=4THENPRINT"{cyan}You may carry up to four items!":GOTO3200
3345 IFD>=2ANDIN>100THENPRINT"{cyan}You may only carry 2 defenses!":GOTO3200
3350 IFIN>100THEN3360:ELSEW(IN)=CD+100:##################4,IN:PRINT#4,W(IN):GOTO3390
3360 D(IN-100)=CD+100:##################4,IN:PRINT#4,D(IN-100):GOTO3390
3390 ##################4,1:PRINT:PRINT"{light green}Taken!":GOTO3200
3400 PRINT:IN$="":IN=0:INPUT"{white}<?>{yellow}Leave what item #";IN$:IFIN$="?"THENQP=1:GOSUB1260:GOTO3400
3405 IN=VAL(IN$):IFIN=0ORIN>199THEN3200:ELSEIFIN<100THENIFW(IN)<>CD+100THENPRINT"{pink}{down}Huh?!?!":GOTO3200
3410 IFIN>100THENIFD(IN-100)<>CD+100THENPRINT"{pink}{down}Huh?!?!":GOTO3200
3450 IFIN>100THEN3460:ELSEW(IN)=LO:##################4,IN:PRINT#4,W(IN):GOTO3490
3460 D(IN-100)=LO:##################4,IN:PRINT#4,D(IN-100):GOTO3490
3490 ##################4,1:PRINT:PRINT"{light green}Dropped!":GOTO3200
3500 PRINT:KH$="":KH=0:INPUT"{cyan}Kill whom #";KH$:KH=VAL(KH$):IFKH=0ORKH>30THEN3200:ELSEIFPL(KH,2)<>LOTHENPRINT"{pink}Say What?!?!":GOTO3200
3510 IFPL(CD,6)<>KHTHENPRINT"{pink}You may only slay your target!":GOTO3200
3520 PRINT"{down}{cyan}1- Axe":PRINT"2- Pistol":PRINT"3- Gas Sprayer":PRINT"4- Flame Thrower":PRINT"5- Acid Sprayer":INPUT"{down}Kill him with what";KW$
3530 KW=VAL(KW$):IFKW=0ORKW>5THEN3200
3540 A=0:FORI=1TO10:IFW(((I-1)*10)+KW)=CD+100THENA=(A OR 128)
3545 IFW(((I-1)*10)+KW+5)=CD+100THENA=(A OR 1)
3550 NEXTI:IFA<>129THENPRINT"{pink}{down}You must have both parts of{f7}that weapon to use it!":GOTO3200
3560 PRINTAA$(KW);
3570 F=0:FORI=1TO100:IFRIGHT$(STR$(I),1)=MID$(STR$(KW),2)ANDD(I)=KH+100THENF=1
3580 NEXTI:IFFTHENPRINT" but-":PRINTDC$(KW):PRINT"{down*2}{cyan}Whoosh! You're off!":LO=INT(RND(TI)*99)+1:GOTO3200
3590 PRINT" and-":PRINTKK$(KW):PL(KH,3)=0:PL(CD,7)=PL(CD,7)+1:WH=KH:GOSUB14000:FORI=1TO100:IFW(I)=KH+100THEN##################4,I:PRINT#4,INT(RND(TI)*99)+1
3592 NEXTI:FORI=1TO100:IFD(I)=KH+100THEN##################4,I+100:PRINT#4,INT(RND(TI)*99)+1
3594 NEXTI:CLOSE4:GOSUB60:F=0:FORI=1TO30:IFPL(I,1)ANDPL(I,3)ANDCD<>ITHENF=1
3595 FORD=1TO30:IFPL(D,6)=KHANDPL(D,3)ANDPL(D,1)ANDCD<>DTHENDO:QQ=INT(RND(TI)*30)+1:LOOPUNTILPL(QQ,1)ANDPL(QQ,3):PL(D,6)=QQ:PL(D,3)=-1:WH=D:GOSUB15000
3596 NEXTD
3600 NEXTI:CLOSE3:GOSUB70:IFF=0THEN3610:ELSEGOSUB2500:GOTO3200
3610 PRINT"{down*2}{purple}You've won the game!!!!!":R$=CHR$(13)
3620 PRINT"{down}Adding your name...":OPEN2,U,2,"0:mdr.help 5,s,w":INPUT#1,E:IFETHENCLOSE2:OPEN2,U,2,"0:mdr.help 5,s,a":ELSEPRINT#2,"{clear}{down*2}{cyan}Previous champs:":PRINT#2,R$
3630 PRINT#2,"{cyan}"+PL$(CD)+"   {white}Kills: {cyan}"+STR$(PL(CD,7))
3640 DT$=MID$(STR$(DT),2):PRINT#2,"{cyan}Date: {white}"+MID$(DT$,3,2)+"/"+MID$(DT$,5,2)+"/"+MID$(DT$,1,2):PRINT#2,R$:CLOSE2
3650 CLOSE4:GOSUB60:PRINT"{down}Killing the players...":FORD=1TO30:PL$(D)="empty":PL(D,1)=0:PL(D,3)=0:WH=D:GOSUB15000:NEXTD:CD=0:CLOSE3:GOSUB70
3660 PRINT"{down}Reshuffling the items...":FORI=1TO200:##################4,I:PRINT#4,INT(RND(TI)*99)+1:NEXTI:GOTO10000
3800 PRINT"{down}{cyan}Visible items:{white}":FORI=1TO100:IFW(I)=LOTHENPRINTW$(I)+" {cyan}#{white}"+STR$(I)
3810 IFD(I)=LOTHENPRINTD$(I)+" {cyan}#{white}"+STR$(I+100)
3820 NEXT:RETURN
3900 GOSUB1200:GOTO3200
3999 CLOSE4:GOSUB4000:GOSUB70:RETURN
4000 PRINT"{cyan}":IFCD>0ORPL(CD,3)<>0THEN4010:ELSEPRINT:PRINT"Go register first!":RETURN
4010 PRINT"{down*2}Would you like to add to{f7}or read the Squeal file (a/r)? ";:GETKEYYN$:IFINSTR("ar"+R$,YN$)=0THENPRINT:GOTO4010:ELSEPRINTYN$:IFYN$="a"THEN4060
4020 IFYN$=R$THENRETURN
4050 IFPL(CD,4)<10THENPRINT"Not enough moves left! Try tomorrow!":RETURN:ELSEPL(CD,4)=PL(CD,4)-10:PRINT:PRINT"{cyan}Last 10 squeals:"
4060 OPEN2,U,2,"0:mdr.squeals"
4070 FORI=1TO10:##################2,I:INPUT#2,TT$(I):IFYN$="r"THENPRINTLEFT$(TT$(I),INSTR(TT$(I),"{ct x}"))
4080 NEXTI:CLOSE2:IFYN$="r"THENRETURN
4090 PN=0:INPUT"{yellow}{down}Squeal on player number";PN:IFPN=0ORPN=CDTHENRETURN
4100 IFPL(PN,1)THEN4110:ELSEPRINT"{down}Unregistered player!":RETURN
4110 PR=0:INPUT"Player is in which room";PR:IFPR=0ORPR>99THENPRINT"{down}Unrecognized room":RETURN
4113 A$="Dead":IFPL(PN,3)THENA$="Alive!"
4115 TT$="{cyan}"+PL$(PN)+" ("+STR$(PN)+")  is "+A$+" in room #"+STR$(PR)+"{ct x}"+STR$(CD)
4120 RR=0:FORI=1TO10:IFTT$=TT$(I)THENPRINT"You've said that before!":RR=1
4123 NEXTI:IFRRTHENRETURN
4125 IFPL(PN,2)=PRTHENPL(CD,4)=PL(CD,4)+10:GOTO4140
4130 PRINT"{cyan}{down*2}Liar!!!":IFPL(CD,4)>5THENPL(CD,4)=PL(CD,4)-5:ELSEPRINT"You must have at least 5 plays to lie!":RETURN
4140 OPEN2,U,2,"0:mdr.squeals"
4150 FORI=1TO9:##################2,I:PRINT#2,TT$(I+1):NEXTI:##################2,10:PRINT#2,TT$:CLOSE2:RETURN
9999 PRINT:PRINT"Are you sure (y/n)? ";:
