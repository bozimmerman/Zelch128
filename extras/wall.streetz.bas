!--------------------------------------------------
!- Wednesday, August 18, 2021 12:26:38 AM
!- Import of : 
!- c:\tmp\newproject\wall.streetz.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625
30010 U1=PEEK(186):D1=0:M2$="L":M3$="1 - 26":IFM2$<>"#"THENM3$="A - Z"
30015 PRINTCHR$(27)"s";:O$="{down}{cyan}Wall Street z128 v2a":GOSUB4
30020 FORI=0TO50:VT(I)=0:VT$(I)="":NEXTI:FORI=0TO200:TT$(I)="":NEXTI
30030 O$="{down}Reading stockholder records...":GOSUB4
30040 OPEN2,U1,2,MID$(STR$(D1),2)+":wall.seats"
30050 RECORD#2,1:FORI=40TO43:INPUT#2,VT(I):NEXTI:SYS8222:IFI$="y"THENVT(44)=1
30060 SYS8222:WS$=I$:SYS8222:VT(45)=VAL(I$)
30100 X=2:DO:RECORD#2,X:INPUT#2,Y:IFY=0ORY>500THEN30150
30120 IFY<>IDTHEN30150
30130 VT(49)=X-1:VT(50)=VT(49)
30140 FORI=1TO26:SYS8222:TT$(50+I)=STR$(VAL(I$)):NEXT:FORI=1TO26:SYS8222:TT$(100+I)=STR$(VAL(I$)):NEXTI
30150 X=X+1:LOOPUNTIL(Y=ID)OR(X>VT(40)):CLOSE2
30160 O$="{ct k}You are not a registered stockholder":IFVT(50)THENO$="{ct k}Your seat number is z1282"+MID$(STR$(VT(50)),2)
30170 GOSUB4:O$="{ct k}Reading current prices...":GOSUB4
30200 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.mbases"
30210 FORX=1TO26:RECORD#2,X
30220 SYS8222:SYS8222:SYS8222:TT$(150+X)=STR$(VAL(I$)*VT(43))
30230 SYS8222:SYS8222:SYS8222:A$=I$:SYS8222:IFMID$(I$,ASC(U$(5))-192,1)="1"THENVT$(X)=MID$(A$,2)
30240 NEXTX:CLOSE2
30300 OPEN2,U1,2,MID$(STR$(D1),2)+":wall.records"
30310 FORX=1TO26:IFVT$(X)=""THEN30350
30320 RECORD#2,X:INPUT#2,I,VT(X),I,TT$(X):I=I*VT(42):VT(X)=VT(X)*VT(42)
30330 A=I-VT(X):A$=STR$(ABS(INT(A*100)/100)):A=VAL(A$)*SGN(A):VT(X)=ABS(INT(VT(X)*100)/100)
30340 IFA>0THENVT$(X)=VT$(X)+"*Down"+A$:ELSEIFA<0THENVT$(X)=VT$(X)+"*{space*2}Up"+A$:ELSEVT$(X)=VT$(X)+"*No Change"
30350 NEXTX:CLOSE2:GOTO31040
31000 O$="{ct k}{yellow}{space*4}Credits:{white}"+STR$(U(2))+"{ct k}{pink}<{white}?{pink}> {yellow}Wall Street: {white}{ct c}":GOSUB4
31010 C$="BSITLWOQRD?":GOSUB28
31020 IFI<5ANDVT(50)=0THENO$="{ct k}{pink}You do not yet own a{f7}seat on Wall Street!":GOSUB4:GOTO31000
31030 ONIGOTO32000,33000,34000,35000,36000,37000,38000,39000,40000,41000
31040 U=U1:D=D1:F$="wall.menu":GOSUB25:GOTO31000
31500 E=0:O$="{ct k}{cyan}Trade which stock ("+M3$+")? {white}{ct c}":GOSUB4:GOSUB10:IFI=0THENI=ASC(I$+CHR$(0))-192
31510 IFI<1ORI>26THENO$="{ct k}Nonexistant stock!":E=1:GOTO4:ELSEIFVT$(I)=""THENO$="{ct k}Nonexistant stock!":E=1:GOTO4
31520 IFVT(I)<1THENO$="{ct k}{cyan}You cannot invest in WORTHLESS stock.":E=1:GOTO4
31530 IFSGN(W0)=SGN(VAL(TT$(100+I)))THENO$="{ct k}{cyan}You cannot "+W0$+" this stock{f7}for ("+MID$(STR$(ABS(VAL(TT$(100+I)))),2)+") more day(s).":E=1:GOTO4
31540 X=I:I=INSTR(VT$(X),"*"):O$="{ct k}{cyan}Stock: {white}"+LEFT$(VT$(X),I-1)+"{space*3}{cyan}Price:{white}"+STR$(VT(X)):C=VAL(TT$(150+X))-VAL(TT$(X))
31550 IFW0<0THENO$=O$+"{space*2}{f7}{cyan}Available:{white}"+STR$(C)+" {cyan}Shares.":ELSEO$=O$+"{space*2}{f7}{cyan}You have:{white}"+STR$(VAL(TT$(50+X)))
31560 GOSUB4:RETURN
32000 W0$="buy":W0=-1:GOSUB31500:IFETHEN31000
32010 Y=INT(U(2)/VT(X)):IFY>CTHENY=C
32020 O$="{ct k}{cyan}Maximum purchase is:{white}"+STR$(Y)+"{ct k}{cyan}Buy how many shares: {white}{ct c}":GOSUB4:GOSUB10:IFI<1ORI>YTHEN31000
32030 TT$(X)=STR$(VAL(TT$(X))+I)
32040 TT$(50+X)=STR$(VAL(TT$(50+X))+I)
32050 IFVT(44)THENTT$(100+X)=STR$(INT((I/VAL(TT$(150+X)))*28))
32060 U(2)=U(2)-INT(VT(X)*I):VT(45)=VT(45)+I
32070 VT(X)=VT(X)+((I/VAL(TT$(150+X)))/2)*VT(X):VT(X)=INT(VT(X)*100)/100
32080 O$="{ct k}Bought!":GOSUB4:GOTO31000
33000 W0$="sell":W0=1:GOSUB31500:IFETHEN31000
33010 Y=VAL(TT$(50+X)):IFY<1THENO$="You have none of that stock!":GOSUB4:GOTO31000
33020 O$="{ct k}{cyan}Sell how many shares: {white}{ct c}":GOSUB4:GOSUB10:IFI<1ORI>YTHEN31000
33030 TT$(X)=STR$(VAL(TT$(X))-I)
33040 TT$(50+X)=STR$(VAL(TT$(50+X))-I)
33050 IFVT(44)THENTT$(100+X)=STR$(-INT((I/VAL(TT$(150+X)))*28))
33060 U(2)=U(2)+INT(VT(X)*I):VT(45)=VT(45)+I
33070 VT(X)=VT(X)-((I/VAL(TT$(150+X)))/2)*VT(X):VT(X)=INT(VT(X)*100)/100
33080 O$="{ct k}Sold!":GOSUB4:GOTO31000
34000 O$="{ct k*3}{cyan}Your investments:":GOSUB4
34010 O$="{ct k}STOCK{space*2}TITLE{space*13}SHARES{space*3}%":GOSUB4
34020 FORX=1TO26:IFVT$(X)=""ORVAL(TT$(50+X))=0THEN34050:ELSEI=INSTR(VT$(X),"*")-1
34030 O$="{white}{space*2}"+CHR$(X+192)+"{cyan}{space*4}"+LEFT$(VT$(X),I)+LEFT$(SP$,18-I)+" {white}"+TT$(50+X)+LEFT$(SP$,7-LEN(TT$(50+X)))+STR$(INT(VAL(TT$(50+X))/VAL(TT$(150+X))*100))
34040 GOSUB4
34050 NEXTX:GOTO31000
35000 O$="{ct k*2}{cyan}Enter the user's WSID#{white}{ct c}":GOSUB4:GOSUB10:IFI=0ORI>VT(40)THEN31000
35010 Y=I:OPEN2,U1,2,MID$(STR$(D1),2)+":wall.seats":RECORD#2,Y+1:INPUT#2,I:IFI=0ORI>500THENCLOSE2:O$="{ct k}User nonexistant!":GOSUB4:GOTO31000
35020 O$="{ct k}{cyan}Is "+UI$(I)+" correct (y/n)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN31000
35030 O$="{ct k*2}{cyan}Transfer which stock ("+M3$+"): {white}{ct c}":GOSUB4:GOSUB10:IFI=0THENI=ASC(I$+CHR$(0))-192
35040 X=I:IFX<1ORX>26THENO$="{ct k}Nonexistant stock!":GOSUB4:ELSEIFVAL(TT$(50+X))=0THENO$="{ct k}You have none of that stock!":GOSUB4:GOTO31000
35050 O$="{ct k}{cyan}How many shares ("+MID$(TT$(50+X),2)+"): {white}{ct c}":GOSUB4:GOSUB10:IFI<1ORI>VAL(TT$(50+X))THENO$="{ct k}You don't have that many shares!":GOSUB4:GOTO31000
35060 C=I:FORI=1TO26:SYS8222:NEXT:FORI=1TOX:SYS8222:NEXT:IFVAL(I$)<0THENO$="{ct k}Sorry, that user has a buying{f7}restriction at present: Try later.":GOSUB4:GOTO31000
35070 RECORD#2,Y+1:RECORD#2,Y+1:A$="":FORI=0TOX-1:SYS8222:A$=A$+I$+R$:NEXTI:SYS8222:A$=A$+STR$(VAL(I$)+C)+R$:VT(45)=VT(45)+C:IFX=26THEN35090
35080 FORI=X+1TO26:SYS8222:A$=A$+I$+R$:NEXTI
35090 IFVT(44)=0THENFORI=1TO26:SYS8222:A$=A$+I$+R$:NEXTI:GOTO35200
35100 FORI=1TOX-1:SYS8222:A$=A$+I$+R$:NEXTI
35110 SYS8222:A$=A$+STR$(INT((C/VAL(TT$(150+X)))*34))+R$:IFX=26THEN35200
35120 FORI=X+1TO26:SYS8222:A$=A$+I$+R$:NEXTI
35200 RECORD#2,Y+1:RECORD#2,Y+1:PRINT#2,A$:CLOSE2:O$="{ct k}Transferred.":GOSUB4:TT$(50+X)=STR$(VAL(TT$(50+X))-C):GOTO31000
36000 GOSUB400:O$="{clear}{down}{cyan}Wall Street Prices{f7}as of "+O$(3):GOSUB4
36010 O$="{ct k}{white}{space*3}TITLE{space*13}PRICE{space*2}CHANGE":GOSUB4
36020 FORX=1TO26:IFVT$(X)=""THEN36050:ELSEI=INSTR(VT$(X),"*")
36030 O$="{white} "+CHR$(X+192)+"{cyan} "+LEFT$(VT$(X),I-1)+LEFT$(SP$,19-I-1)
36040 IFVT(X)>=1THENO$=O$+"{white}"+STR$(VT(X))+LEFT$(SP$,8-LEN(STR$(VT(X))))+MID$(VT$(X),I+1):ELSEO$=O$+"{white} WORTHLESS"
36045 GOSUB4
36050 NEXTX:GOTO31000
37000 IFVT(50)=0THEN37500
37010 O$="{ct k}{cyan}Wall Street will buy your seat{f7}for"+STR$(INT(VT(41)/2))+" credits.":GOSUB4
37020 O$="Selling your seat FORFEITS ALL STOCK!":GOSUB4
37030 O$="{ct k}Sell your seat (y/n)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN31000
37040 VT(50)=0:U(2)=U(2)+INT(VT(41)/2)
37050 FORX=1TO26:TT$(X)=STR$(VAL(TT$(X))-VAL(TT$(50+X))):TT$(100+X)="0":NEXTX
37060 O$="Sold!":GOSUB4:GOTO31000
37500 O$="{ct k}{cyan}Checking records...":GOSUB4
37510 OPEN2,U1,2,MID$(STR$(D1),2)+":wall.seats"
37520 Y=2:DO:RECORD#2,Y:INPUT#2,I:IFI=0THENEXIT
37530 Y=Y+1:IFY>VT(40)THENO$="{ct k}Sorry, no empty seats available{f7}at this time.":GOSUB4:EXIT
37540 LOOP:CLOSE2:IFY>VT(40)THEN31000
37550 O$="{ct k}{cyan}Seat z1282"+MID$(STR$(Y-1),2)+" is open for"+STR$(VT(41))+" credits.":GOSUB4
37560 IFU(2)<VT(41)THENO$="{ct k}Sorry, you don't have enough credits!":GOSUB4:GOTO31000
37570 O$="{ct k}Purchase this seat (y/n)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN31000
37580 VT(49)=Y-1:VT(50)=Y-1:U(2)=U(2)-VT(41):O$="{ct k}{cyan}Bought!":GOSUB4:FORX=1TO26:TT$(50+X)="0":TT$(100+X)="0":NEXT:GOTO31000
38000 O$="{ct k}{cyan}WSID#{space*3}Stock owner{space*7}Total stock":GOSUB4
38010 OPEN2,U1,2,MID$(STR$(D1),2)+":wall.seats"
38020 FORX=2TOVT(40)+1:RECORD#2,X:INPUT#2,A$:A=VAL(A$):IFA=0THEN38050
38030 O$="{cyan} "+STR$(X-1)+LEFT$(SP$,8-LEN(STR$(X-1)))+UI$(A)
38040 Y=0:FORI=1TO26:SYS8222:Y=Y+VAL(I$):NEXTI:O$=O$+LEFT$(SP$,21-LEN(UI$(A)))+STR$(Y):GOSUB4
38050 NEXTX:CLOSE2:GOTO31000
39000 O$="{ct k}{cyan}Quit to the BBS (y/n)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN31000
39010 IFVT(49)=0ANDVT(50)=0THEN920
39020 A$=STR$(ID)+R$:IFVT(50)=0THENA$="0"+R$
39030 OPEN2,U1,2,MID$(STR$(D1),2)+":wall.seats":RECORD#2,VT(49)+1:FORI=1TO26:A$=A$+STR$(VAL(TT$(50+I)))+R$:NEXTI:PRINT#2,A$
39040 RECORD#2,1:A$="":FORI=40TO43:A$=A$+STR$(VT(I))+R$:NEXT:IFVT(44)THENA$=A$+"y"+R$:ELSEA$=A$+"n"+R$
39050 A$=A$+WS$+R$+STR$(VT(45))+R$:RECORD#2,1:RECORD#2,1:PRINT#2,A$:CLOSE2
39100 OPEN2,U1,2,MID$(STR$(D1),2)+":wall.records":FORX=1TO26:RECORD#2,X:VT(X)=VT(X)/VT(42):VT(X)=INT(VT(X)*100)/100
39110 SYS8222:A$=I$+R$:SYS8222:A$=A$+STR$(VT(X))+R$:SYS8222:A$=A$+I$+R$:SYS8222:A$=A$+TT$(X)+R$
39120 RECORD#2,X:RECORD#2,X:PRINT#2,A$:NEXTX:CLOSE2:GOTO920
40000 O$="{ct k}{cyan}Price trends: market for last 10 days.{ct k}":GOSUB4
40010 OPEN2,U1,2,MID$(STR$(D1),2)+":wall.records":RECORD#2,29
40015 VT(38)=0:VT(39)=0:FORI=1TO26:IFVT$(I)<>""THENVT(39)=VT(39)+VT(I)
40020 NEXTI:X=0:Y=0:FORI=28TO37:SYS8222:IFI=32THENRECORD#2,30
40027 VT(I)=INT(VAL(I$)):Y=Y+VT(I):IFVT(I)>XTHENX=VT(I)
40030 NEXTI:RECORD#2,1:CLOSE2:Y=INT(Y/10):Y=(X-Y)/6:X=X+Y:X=INT(X*100)/100
40040 FORI=1TO11:O$="{cyan}"+STR$(X)+LEFT$(SP$,8-LEN(STR$(X)))+"!{white}"
40060 FORC=28TO39:IFVT(C)>=(X-Y)THENO$=O$+" *":ELSEO$=O$+"{space*2}"
40070 NEXTC:GOSUB4:X=X-Y:X=INT(X*100)/100:NEXTI
40080 O$="{cyan}{space*8}!--------------------------":GOSUB4
40090 O$="{cyan}{space*8}!10 9 8 7 6 5 4 3 2 1 TODAY":GOSUB4
40100 GOTO31000
41000 O$="{ct k*2}{cyan} Report today :":GOSUB4:Y=0:FORI=1TO26:IFVT$(I)THENY=Y+VT(I)
41010 NEXTI:OPEN2,U1,2,MID$(STR$(D1),2)+":wall.records":RECORD#2,30:FORI=6TO10:SYS8222:NEXTI:X=VAL(I$):CLOSE2:C=Y-X:C=INT(C*100)/100
41100 O$="{ct k}Shares exchanged{space*3}:{white}"+STR$(VT(45)):GOSUB4
41110 O$="{cyan}Market currently at:{white}"+STR$(Y):GOSUB4
41120 O$="{ct k}{cyan}Currently ":IFC<0THENO$=O$+"down":ELSEO$=O$+"up"
41130 O$=O$+"{white}"+STR$(ABS(C))+" {cyan}points.":GOSUB4
41140 GOTO31000
55554 PRINTCHR$(27)"s";:GOTO31000
55555 U=PEEK(186):OPEN1,U,15,"s0:wall.streetz":CLOSE1:DSAVE"wall.streetz",U(U):END
