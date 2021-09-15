!--------------------------------------------------
!- Wednesday, May 17, 2017 12:21:18 AM
!- Import of : 
!- c:\src\zelch128next\prg.new user.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:REM ============= NEW USER MODULE V2.5 ============= 07/18/92 =
30010 IFO(1)=1THENO(1)=0:GOTO32750:ELSEO$="New User Login":GOSUB250:F$="sys.new msg":U=D(1,0):D=D(1,1):GOSUB25:GOSUB400:O$(17)=O$(2):POKE2825,10:POKE2824,1
30100 U$(8)=RIGHT$(STR$(M(1)),1)+"0"+RIGHT$(STR$(M(12)),1)+"001008O":U(4)=0:U(5)=0:U(6)=1:U(7)=25
30200 X=M(14)+1:DO:X=X-1:LOOPUNTILUI$(X)=""ORUI$(X)="^"ORX=1:IFX=1THENO$=T$(43):GOSUB4:GOTO600
30300 GOSUB30400:GOSUB30700:GOSUB30900:GOSUB31100:GOSUB31300:GOSUB34400:GOSUB34200:GOSUB34300
30305 IFINSTR("CD",MID$(U$(8),10,1))THENO$(23)=PR$(1,0):O(19)=1:ELSEO$(23)=PR$(2,0):O(19)=2
30310 BLOAD(PR$(O(19),1)),U(D(0,0)),D(D(0,1))
30399 GOTO31500
30400 O$=T$(44):GOSUB4:X=16:GOSUB5:IFLEN(I$)<2ORI$="NEW"ORI$="New"ORVAL(I$)>0THEN30400:ELSEU$(1)=I$
30450 IFRIGHT$(U$(1),1)=" "THENU$(1)=LEFT$(U$(1),LEN(U$(1))-1):GOTO30450
30500 O$=T$(45):GOSUB4:I=1:DOUNTILI$=UI$(I)ORUI$(I)="":I=I+1:LOOP:IFUI$(I)=I$THENO$=T$(46):GOSUB4:GOTO30400
30600 O$=R$:GOSUB9:RETURN
30700 O$=T$(47):GOSUB4:X=16:GOSUB5:IFI$=""THEN30700:ELSEU$(3)=I$
30800 RETURN
30900 O$=T$(48):GOSUB4:W7$="(XXX)/XXX-XXXX":GOSUB40000:U$(4)=I$:RETURN
31100 O$=T$(49):GOSUB4:X=10:GOSUB5:IFI$=""THEN31100
31200 U$(2)=I$:RETURN
31300 O$=T$(50):GOSUB4:C$="YN":GOSUB28:IFI=2THENI=0
31400 MID$(U$(8),2,1)=RIGHT$(STR$(I),1):POKE2915,I:RETURN
31500 U$(5)="A":U$(6)="199001010530":U$(9)="00000000000000000000000000":U(1)=M(10):U(2)=M(11):U(3)=BA:U$(10)="11111111111111111111111111"
31600 O$="{clear}{ct k}{black}A) Handle      : {white}"+U$(1)+"{ct k}{black}B) Real name   : {white}"+U$(3)+"{ct k}{black}C) Phone number:{white} "+U$(4):GOSUB4
31700 O$="{black}D) Password    : {white}"+U$(2)+"{ct k}{black}E) Columns     :{white}"+STR$(40+(40*VAL(MID$(U$(8),2,1)))):GOSUB4
31720 I=VAL(MID$(U$(8),5,1)):O$="{black}F) Auto-Pause  : {white}o"+MID$("ffn ",I*2+1,2):GOSUB4
31730 X=INSTR("ACDEIMTPO",MID$(U$(8),10,1))-1:IFX<0THENX=8
31740 O$="{black}G) Computer    : {white}"+MID$("Amiga     C=64      C=128     Apple     IBM/Clone Macintosh Atari     CP/M      Other     ",(X*10)+1,10):GOSUB4
31750 O$="{black}H) Birthdate   : {white}"+U$(7)+"{ct k}{black}I){right}Lines/Screen:{white}"+STR$(U(7)):GOSUB4
31790 O$=T$(95):GOSUB4:POKE2959,I
31800 C$="ABCDEFGHI"+R$:GOSUB28:IFI=10THEN31900:ELSEONIGOSUB30400,30700,30900,31100,31300,33900,34200,34300,34400:GOTO31600
31900 O$=T$(51):GOSUB4:I=0:DO:I=I+1:LOOPUNTILUI$(I)="^"ORUI$(I)="":W0=I:FORI=0TO50:TT$(I)="":NEXTI
32000 ID=W0:O$=T$(52):GOSUB4:C$=R$:GOSUB28:ID=0
32100 W2=0:W1=W2:OPEN1,D(1,0),15:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.new app,s,r":INPUT#1,I:IFI>19THENCLOSE2:CLOSE1:GOTO32600
32200 W2=W2+1:SYS8222:W1=PEEK(253):O$=I$+" {ct c}":GOSUB4:X=40:GOSUB5:IFI$=""THENI$="(no answer)"
32300 A=INSTR(O$,"{ct c}"):IFATHENMID$(O$,A,1)="{reverse off}":GOTO32300
32400 TT$(W2)=O$+I$:IFW1=0THEN32200
32500 CLOSE2:CLOSE1:O$=T$(53):GOSUB4:C$="YN":GOSUB28:IFI=2THEN32100:ELSEO$=T$(54):GOSUB4:OPEN1,D(1,0),15
32600 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.new user,s,w":INPUT#1,I:IFI>19THENCLOSE2:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.new user,s,a":PRINT#2,"{ct a}"
32700 ID=W0:UI$(ID)=U$(1):GOSUB400:PRINT#2,STR$(ID)+R$+O$(3)+R$+U$(3)+R$+U$(4)+R$+U$(2)+R$+U$(7):IFW2THENFORI=1TOW2:PRINT#2,TT$(I):NEXTI:ELSEPRINT#2,R$R$
32710 CLOSE2:CLOSE1:O(6)=O(6)+1:GOTO2000
32750 GOSUB990:I=INSTR("ABCDEFGHI",CHR$(ASC(SY$)OR128)):IFITHEN32760:ELSEI=VAL(SY$):IFI=0THEN32800
32760 ONIGOSUB30400,31100,31300,33100,33900,34000,34200,34100,34400:UI$(ID)=U$(1):GOSUB100:GOTO940
32800 O$="{ct k}{black}A) Handle      : {white}"+U$(1)+"{ct k}{black}B) Password    : {white}"+U$(2)+"{ct k}{black}C) Columns     :{white}"+STR$(40+(40*VAL(MID$(U$(8),2,1))))+"{ct k}{black}D) Last call   : {white}"+O$(4):GOSUB4
32820 O$="{black}E) Auto-Pause  : {white}o"+MID$("ffn ",VAL(MID$(U$(8),5,1))*2+1,2)+"{ct k}{black}F) Line #s     : {white}o"+MID$("ffn ",VAL(MID$(U$(8),7,1))*2+1,2):GOSUB4
32830 X=INSTR("ACDEIMTPO",MID$(U$(8),10,1))-1:IFX<0THENX=8
32840 O$="{black}G) Computer    : {white}"+MID$("Amiga     C=64      C=128     Apple     IBM/Clone Macintosh Atari     CP/M      Other     ",(X*10)+1,10):GOSUB4
32845 O$=" N/A":IFBA=2400THENO$=STR$(PEEK(2582)-160)
32850 O$="{black}H) 2400Timing  :{white}"+O$:GOSUB4
32860 O$="{black}I) Lines/Screen:{white}"+STR$(U(7)):GOSUB4
32900 O$=T$(95):GOSUB4:C$="ABCDEFGHI"+R$:GOSUB28
32910 ONIGOSUB30400,31100,31300,33100,33900,34000,34200,34100,34400:UI$(ID)=U$(1)
33000 IFI=10THENGOSUB100:GOTO940:ELSE32800
33100 O$=T$(55):GOSUB4:GOSUB10:A=SGN(I):IFI=0THENRETURN
33200 W1=VAL(MID$(U$(6),3,2)):W2=VAL(MID$(U$(6),5,2)):W3=VAL(MID$(U$(6),7,2)):FORX=1TOABS(I):W3=W3+(A):IFW3>PEEK(2880+W2)THENW2=W2+1:W3=1
33300 IFW3<1THENW2=W2-1:W3=PEEK(2880+W2)
33400 IFW2>12THENW2=1:W1=W1+1:W3=1:ELSEIFW2<1THENW2=12:W1=W1-1:W3=31
33500 IFW1>99THENW1=0:ELSEIFW1<0THENW1=99
33600 NEXTX:U$(6)=RIGHT$(STR$(W1),2)+RIGHT$(STR$(W2),2)+RIGHT$(STR$(W3),2)+RIGHT$(U$(6),4)
33610 IFLEFT$(U$(6),1)>"8"THENU$(6)="19"+U$(6):ELSEU$(6)="20"+U$(6)
33700 X=INSTR(U$(6)," "):IFX>0THENMID$(U$(6),X,1)="0":GOTO33700
33800 GOSUB400:RETURN
33900 MID$(U$(8),5,1)=MID$(STR$(ABS(VAL(MID$(U$(8),5,1))-1)),2):I=VAL(MID$(U$(8),5,1)):POKE2959,I:O$="ff":IFITHENO$="n"
33910 O$="{black}{ct k}Auto-pause function is now o"+O$+".{ct k}":GOSUB4:RETURN
34000 MID$(U$(8),7,1)=MID$(STR$(ABS(VAL(MID$(U$(8),7,1))-1)),2,1):I=VAL(MID$(U$(8),7,1)):O$="ff":IFITHENO$="n"
34010 O$="{black}{ct k}Message Maker line numbers are o"+O$+".{ct k}":GOSUB4:RETURN
34100 IFBA<>2400THENO$="{ct k}{black}2400 baud only!":GOTO4
34105 O$="{ct k}{black}2400bps timing value is:{ct k*2}{black}      [0123456789]{ct k}      ["+RIGHT$(LEFT$(".........^.........",179-PEEK(2582)),10)+"]":GOSUB4
34110 O$="{ct k}{black}Enter new setting (0-9): {ct c}":GOSUB4:GOSUB10:IFI<0ORI>9ORI$=""THENRETURN:ELSEPOKE2582,160+I:MID$(U$(8),9,1)=MID$(STR$(I),2):RETURN
34200 O$="{ct k}{black}Computer type:{ct k*2}{black}A) Commodore Amiga{ct k}{black}C) Commodore 64{ct k}{black}D) Commodore 128{ct k}{black}E) Apple 8-bit{ct k}{black}I) IBM or Clone":GOSUB4
34210 O$="{black}M) Apple Macintosh{ct k}{black}T) Atari{ct k}{black}P) CP/M based machine{ct k}{black}O) Other/Unlisted{ct k*2}{black}What computer are you using? {ct c}":GOSUB4
34220 C$="ACDEIMTPO":GOSUB28:MID$(U$(8),10,1)=A$:RETURN
34300 O$="{ct k}{black}Enter your birthdate in MM/DD/YY format{ct k}: {ct c}":GOSUB4:W7$="XX/XX/XX":GOSUB40000:U$(7)=I$:RETURN
34400 O$="{ct k}{black}How many lines per screen can your{f7}terminal display? {ct c}":GOSUB4:GOSUB10:IFI<10ORI>100THENRETURN:ELSEU(7)=I:POKE2984,I-2:RETURN
40000 W7=1:I$=W7$:DO:A$=MID$(W7$,W7,1):IFA$<>""ANDA$<>"X"THENO$=A$:GOSUB9:W7=W7+1:I=0:GOTO40040
40010 C$="0123456789"+R$+CHR$(20):GOSUB32:IFI<11ANDW7<=LEN(W7$)THENO$=A$:GOSUB9:MID$(I$,W7,1)=A$:W7=W7+1:GOTO40040
40020 IFI=12ANDW7>1THENDO:W7=W7-1:O$=A$:GOSUB9:LOOPUNTILMID$(W7$,W7,1)="X"ORW7=1
40040 LOOPUNTILI=11ANDW7=LEN(W7$)+1:O$=R$:GOTO9
55555 A=PEEK(186):OPEN1,A,15,"s0:prg.new user":CLOSE1:DSAVE"prg.new user",U(A)
