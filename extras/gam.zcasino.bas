!--------------------------------------------------
!- Wednesday, August 18, 2021 1:05:36 AM
!- Import of : 
!- c:\tmp\newproject\gam.zcasino.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625
30010 U=PEEK(186):D=0:W2$=MID$(STR$(D),2):F$="cas.opener":GOSUB25:IFPEEK(215)THENFAST
30020 O$="{ct k*2}{pink}Zelch 128 Credit Casino{ct k}By Elite Software":GOSUB4:L=1:FORX=1TO60:TT$(X)="":NEXTX
30030 IFPEEK(2825)<7THENO$="{ct k*2}{yellow}You're running short on time,{f7}come back tomorrow!{ct k*2}":GOSUB4:GOTO920
30040 FORX=1TO4:FORY=2TO14:A$=RIGHT$(STR$(Y),2):IFY>10THENA$=" "+MID$("JQKA",Y-10,1)
30050 TT$(Y+((X-1)*13))=A$+"-"+MID$(STR$(X),2):NEXTY:NEXTX
30060 OPEN2,U,2,W2$+":cas.player,s,r":INPUT#2,I$:INPUT#2,W1$:X=0:FORI=1TO7:INPUT#2,VT(I):X=X+VT(I):NEXTI:CLOSE2:W0=(U$(1)=I$)AND(W1$=LEFT$(O$(2),6))
30070 IFW0ANDX>30THENO$="{ct k}Let other people have a chance!!":GOSUB4:GOTO920:ELSEIFNOT(W0)THENFORI=1TO7:VT(I)=0:NEXTI:GOTO30090:ELSE30090
30080 OPEN1,U,15,"s"+W2$+":cas.player":CLOSE1:OPEN2,U,2,W2$+":cas.player,s,w":PRINT#2,U$(1)+R$+LEFT$(O$(2),6):FORI=1TO7:PRINT#2,VT(I):NEXTI:CLOSE2:GOTO920
30090 RESTORE:FORI=1TO51:X=INT(RND(TI)*51)+1:A$=TT$(X):TT$(X)=TT$(I):TT$(I)=A$:NEXTI:FORI=1TO6:READVT$(I):NEXTI:FORI=11TO16:READVT$(I):NEXTI
30095 DATA"{space*4}o{space*4}","o{space*7}o","o{space*3}o{space*3}o","o o{space*3}o o","o o o o o","o oo oo o"
30096 DATA "cherry{space*2}","plum{space*4}","apple{space*3}","grapes{space*2}","jackpot ","orange{space*2}"
30097 W5$="Craps{space*5}High/Low{space*2}Roulette{space*2}Black JackCut High{space*2}Slots{space*5}"
30100 GOSUB30160:O$="{yellow}Casino Main: {white}{ct c}":GOSUB4
30110 W7=0:C$="?CHRBTSQ":GOSUB28:IFI>1ANDI<8THENO$="":GOSUB4:IFVT(I)>=5THENVT(I)=5:O$="{pink}Sorry, your plays are up for{f7}that area.":GOSUB4:GOTO30100
30120 W9=I-1:ONIGOTO30140,31000,32000,33000,34000,35000,36000,30130
30130 O$="{ct k}{cyan}Quit to BBS (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:ONIGOTO30080,30100
30140 O$="{clear}{ct k*2}{light gray}Casino Main Menu{ct k}":GOSUB4:A$=" {white}-{yellow}={cyan}":I$="{yellow}={white}-{cyan}{space*4}":X=1:W8=0
30150 O$=A$+MID$(C$,X+1,1)+I$+MID$(W5$+"Quit{space*6}",((X-1)*10)+1,10):GOSUB4:X=X+1:IFX<8THEN30150:ELSEO$="{ct k*2}":GOSUB4:GOTO30100
30160 O$="{yellow}{ct k}Credits: {white}"+STR$(U(2)):GOSUB4:RETURN
30170 IFVT(W9+1)=5THENO$="{ct k*2}{pink}Your plays for this part of the{f7}Casino are up, go somewhere else.":GOSUB4:GOTO30100
30175 W7=0:C$="?PHQ":GOSUB28:ONIGOTO30180,30220,30200:O$="{ct k}":GOSUB4:GOTO30100
30180 O$="{clear}{ct k*2}{light gray}"+MID$(W5$,((W9-1)*10)+1,10)+"{ct k*2} {white}-{yellow}={cyan}Play{yellow}={white}-{ct k} {white}-{yellow}={cyan}Help{yellow}={white}-{ct k} {white}-{yellow}={cyan}Quit to main{yellow}={white}-{ct k*2}":GOSUB4:I=W9+1:GOTO30120
30200 F$="cas.help"+STR$(W9):GOSUB25:I=W9+1:GOTO30120
30220 I=W9+1:W7=1:VT(I)=VT(I)+1:GOTO30120
30230 O$="{ct k*2}{light green}"+A$+": {white}{ct c}":GOSUB4:GOSUB10:IFI<1THENI=0:RETURN
30240 IFI>U(2)THENO$="{ct k}{red}You only have "+MID$(STR$(U(2)),2)+" credits remaining":GOSUB4:I=0:RETURN:ELSEW6=I:RETURN
30250 O$="{ct k}{white}{space*3}{cm d}{cm i*3}{cm f}":GOSUB4:FORX=1TO9STEP3:O$="{space*3}{reverse on}{cm k}"+MID$(VT$(I),X,3)+"{reverse off}{cm k}":GOSUB4:NEXTX:O$="{space*3}{cm c}{reverse on}{cm i*3}{reverse off}{cm v}":GOSUB4:RETURN
30260 O$="{ct k}{yellow}You've won"+STR$(W6*A)+" credits!":GOSUB4:U(2)=U(2)+(W6*A):I=W9+1:GOTO30120
30270 IFY>=51ORLEN(TT$(Y))<3THENGOSUB30280
30272 O$="{ct k}{white}"+LEFT$(TT$(Y),2)+" of ":O$=O$+MID$("DiamondsClubs{space*3}Hearts{space*2}Spades{space*2}",((VAL(RIGHT$(TT$(Y),1))-1)*8)+1,8):GOSUB4:W0=VAL(LEFT$(TT$(Y),2))
30273 IFW0=0THENW0=10:IFMID$(TT$(Y),2,1)="A"ANDW8=0THENW0=11
30275 IFW8=1THENW8=0:IFMID$(TT$(Y),2,1)="A"THENO$="{ct k}An ace!{ct k}Count it as (a) 1 or (b) 11? {ct c}":GOSUB4:C$="AB":GOSUB28:W0=I:IFI=2THENW0=11
30276 RETURN
30280 IFL>=51THENFORI=1TO51:A$=TT$(I):Y=INT(RND(TI)*51)+1:TT$(I)=TT$(Y):TT$(Y)=A$:NEXTI:L=1
30290 Y=L:L=L+1:RETURN
30300 A$=LEFT$(TT$(A),2):A=VAL(A$):IFA$=" J"THENA=11:ELSEIFA$=" Q"THENA=12:ELSEIFA$=" K"THENA=13:ELSEIFA$=" A"THENA=14
30310 RETURN
30320 SLEEP1:O$="Click!...{ct c}":GOSUB4:RETURN
31000 IFW7=0THENGOSUB30160:O$="{light green}Craps menu: {white}{ct c}":GOSUB4:GOTO30170
31010 W7=0:A$="Throw for how much":GOSUB30230:IFI=0THEN31000
31020 O$="{ct k*2}{light blue}Rolling the dice...":GOSUB4
31030 W2=INT(RND(TI)*6)+1:I=W2:GOSUB30250
31040 W3=INT(RND(TI)*6)+1:I=W3:GOSUB30250:W4=W2+W3:IFW4=7ORW4=11THENA=1:GOSUB30260:GOTO31000:ELSEIFW4=2THEN31000
31050 O$="{ct k}{cyan}You must throw a(n)"+STR$(W4)+"...":GOSUB4:SLEEP2
31060 W2=INT(RND(TI)*6)+1:I=W2:GOSUB30250:W3=INT(RND(TI)*6)+1:I=W3:GOSUB30250
31070 W5=W2+W3:IFW5=7ORW5=11ORW5=2THEN31080:ELSEIFW4=W5THENA=1:GOTO30260:ELSEO$="{ct k}{white}{cyan}No dice, rolling again...":GOSUB4:SLEEP1:GOTO31060
31080 O$="{ct k*2}{red}CRAPS!!!":GOSUB4:U(2)=U(2)-W6:GOTO31000
32000 IFW7=0THENGOSUB30160:O$="{cyan}High/Low menu: {white}{ct c}":GOSUB4:GOTO30170
32010 W7=0:A$="Bet how much on this round":GOSUB30230:IFI=0THEN32000
32020 X=1:GOSUB30280:GOSUB30270
32025 IFX=4THENA=1:GOTO30260
32030 O$="{ct k}{green}H)igher or L)ower: {white}{ct c}":GOSUB4:C$="HL":GOSUB28
32040 A=Y:GOSUB30300:W2=A:W5=I:GOSUB30280:GOSUB30270:A=Y:GOSUB30300:IF(A>W2ANDW5=1)OR(A<W2ANDW5=2)THENX=X+1:GOTO32025
32050 O$="{ct k}{red}Loser!":GOSUB4:U(2)=U(2)-W6:GOTO32000
33000 IFW7=0THENGOSUB30160:O$="{light green}Roulette menu: {white}{ct c}":GOSUB4:GOTO30170
33010 W7=0:A$="Bet how much":GOSUB30230:IFI=0THEN33000
33020 O$="{ct k}{cyan}Do you want to play {pink}Field{cyan} or {yellow}Number{cyan}: {white}{ct c}":GOSUB4:C$="FN":GOSUB28:ONIGOTO33060
33030 O$="{ct k}{yellow}What number do you want (1-36)? {white}{ct c}":GOSUB4:GOSUB10:IFI<1ORI>36THEN33000
33040 W2=INT(RND(TI)*36)+1:O$="{ct k*2}{light blue}The ball is off...{ct c}":GOSUB4:SLEEP3:O$="{ct k*2}{blue}It falls on number"+STR$(W2)+"{ct k*2}":GOSUB4:IFI=W2THENA=36:GOTO30260
33050 O$="{ct k}{pink}Sorry, you lose!":GOSUB4:U(2)=U(2)-W6:GOTO33000
33060 O$="{ct k}{cyan}A {white}1-18{ct k}{cyan}B {white}19-36{ct k}{cyan}C {white}Red{ct k}{cyan}D {white}Black{ct k}{cyan}E {white}Even{ct k}{cyan}F {white}Odd{ct k}{cyan}G {white}Left col{ct k}{cyan}H {white}Mid col{ct k}{cyan}I {white}Right col{ct k}{cyan}{ct k}Which will it be? {white}{ct c}":GOSUB4
33070 C$="ABCDEFGHI":GOSUB28:W2=INT(RND(TI)*36)+1:O$="{ct k}{light blue}The ball is off...{ct c}":GOSUB4:SLEEP3:O$="{ct k*2}{blue}It falls on number"+STR$(W2)+"{ct k*2}":GOSUB4
33080 A=1:IFI=1ANDW2>0ANDW2<19THEN30260
33090 IFI=2ANDW2>18ANDW2<37THEN30260
33100 IFI=3ORI=5THENIF(INT(W2/2)=(W2/2))THEN30260
33110 IFI=4ORI=6THENIF(INT(W2/2)<>(W2/2))THEN30260
33120 IFI>6THENBEGIN:E=0:FORX=(I-6)TO36STEP3:IFW2=XTHENE=1
33130 NEXTX:BEND:IFI>6ANDE=1THEN30260
33140 GOTO33050
34000 IFW7=0THENGOSUB30160:O$="{light gray}Blackjack menu: {white}{ct c}":GOSUB4:GOTO30170
34010 W7=0:A$="Amount to anti":GOSUB30230:IFI=0THEN34000
34020 W2=0:GOSUB30280:O$="{ct k}{yellow}Facing up, I have a: ":GOSUB4:GOSUB30270:W1=W0:X=Y
34030 GOSUB30280:O$="{ct k*2}{yellow}Your cards:":GOSUB4:W8=1:GOSUB30270:W2=W2+W0
34040 GOSUB30280:W8=1:GOSUB30270:W2=W2+W0
34050 IFW2=21THENO$="{ct k}{pink}Blackjack!{ct k}":GOSUB4:A=1:GOTO30260
34060 IFW2>21THENO$="{ct k}You're over!":GOSUB4:U(2)=U(2)-W6:GOTO34000
34070 O$="{ct k}{pink}Points:{white}"+STR$(W2)+"{ct k}{pink}Hit {cyan}or {yellow}Stay{cyan} (H/S)? {white}{ct c}":GOSUB4:C$="HS":GOSUB28:ONIGOTO34040,34080
34080 O$="{ct k*2}{yellow}Ok, my turn:":GOSUB4:Y=X:GOSUB30270
34090 GOSUB30280:GOSUB30270:W1=W1+W0
34100 IFW1=21THENO$="{ct k}{pink}Blackjack!{ct k}You lose!":GOSUB4:U(2)=U(2)-W6:GOTO34000
34110 IFW1>21THENO$="{ct k}{cyan}I'm over...":GOSUB4:A=1:GOTO30260
34120 IFW1<17THENSLEEP1:O$="{ct k}{yellow}I must take a card...":GOSUB4:GOTO34090
34130 O$="{ct k}{cyan}My total:"+STR$(W1)+" points{ct k}Your total:"+STR$(W2)+" points{ct k*2}":GOSUB4
34140 IFW1>=W2THENO$="{ct k}You lose!":GOSUB4:U(2)=U(2)-W6:GOTO34000
34150 A=1:GOTO30260
35000 IFW7=0THENGOSUB30160:O$="{light green}Cut High menu: {white}{ct c}":GOSUB4:GOTO30170
35010 W7=0:A$="How much will you bet":GOSUB30230:IFI=0THEN34000
35020 O$="{ct k}{light blue}Rolling dice...{ct c}":GOSUB4:SLEEP1:O$="...My roll:{ct k}":GOSUB4
35030 W2=INT(RND(TI)*6)+1:I=W2:GOSUB30250:W0=INT(RND(TI)*6)+1:I=W0:GOSUB30250:W0=W0+W2
35040 SLEEP1:O$="{ct k}{blue}{space*12}Your roll:{ct k}":GOSUB4
35050 W2=INT(RND(TI)*6)+1:I=W2:GOSUB30250:W1=INT(RND(TI)*6)+1:I=W1:GOSUB30250:W1=W1+W2
35060 IFW1=W0THENO$="{ct k}{yellow}It's a tie!":GOSUB4:GOTO35000
35070 IFW1>W0THENA=1:GOTO30260:ELSEO$="{ct k}{cyan}You're a loser!":GOSUB4:U(2)=U(2)-W6:GOTO35000
36000 IFW7=0THENGOSUB30160:O$="{light gray}Slot machine: {white}{ct c}":GOSUB4:GOTO30170
36005 I=5:GOSUB30240:IFI=0THEN36000
36010 W7=0:O$="{ct k}{purple}You pop 5 credits in,{ct k}Hit {red}<SPACE>{purple} to pull the arm,{f7}or {green}<RETURN>{purple} to abort: {white}{ct c}":GOSUB4:C$=" "+R$:GOSUB28:ONIGOTO36020,36000
36020 O$="{ct k}{light blue}Spinning...{ct c}":GOSUB4:GOSUB30320:GOSUB30320:GOSUB30320:SLEEP1
36030 W0=INT(RND(TI)*6)+1:W1=INT(RND(TI)*6)+1:W2=INT(RND(TI)*6)+1
36040 O$="{ct k*2}"+VT$(10+W0)+VT$(10+W1)+VT$(10+W2):A=0:GOSUB4
36050 A=0:IFW0=1THENA=1:IFW1=1THENA=2:IFW2=1THENA=4
36060 IFW0=5ANDW1=5ANDW2=5THENA=5:GOTO30260
36070 IFW0=W1ANDW1=W2THENA=2:GOTO30260
36080 IFATHEN30260:ELSEO$="{ct k}{pink}Nothing! Oh well...":GOSUB4:U(2)=U(2)-5:GOTO36000
55555 A=PEEK(186):OPEN1,A,15,"s0:gam.zcasino":CLOSE1:SAVE"gam.zcasino",A
