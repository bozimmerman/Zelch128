!--------------------------------------------------
!- Monday, May 15, 2017 3:03:42 AM
!- Import of : 
!- c:\src\zelch128\prg.sysop.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625:REM ================= SYSOP MODULE V1.0 ============= 07/26/91 =
30010 ON(W1-400)GOTO30400,30400,32700,34700,36600,40800,41400,43000,44000:GOTO940
30020 OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":RETURN
30030 OPEN2,U,2,MID$(STR$(D),2)+":sys."+F$:RETURN
30100 GOSUB4:IFW1=401THENO$=R$:GOSUB9:RETURN
30200 IFTT$(Y)<>""THENC$=CHR$(20)+R$:GOSUB28:IFI=2THENO$=A$:GOSUB9:RETURN:ELSEIFTT$(Y)<>""THENFORX=1TOMX(Y):O$=CHR$(20):GOSUB9:NEXTX
30300 X=A:GOSUB5:IFI$=""THENRETURN:ELSETT$(Y)=I$:MX(Y)=LEN(I$):RETURN
30400 GOSUB30450:GOTO940
30450 GOSUB8060:IFA=0THENRETURN:ELSEGOSUB30500:GOTO30700
30500 W2=A:U=D(4,0):D=D(4,1):CLOSE2:F$="userfiles":GOSUB30030:RECORD#2,A:FORX=1TO6:SYS8222:TT$(X)=I$:MX(X)=LEN(I$):NEXTX:GOSUB690:TT$(7)=I$:MX(7)=26
30600 FORX=8TO9:SYS8222:TT$(X)=I$:MX(X)=LEN(I$):NEXTX:GOSUB690:TT$(10)=I$:MX(10)=26:FORX=11TO15:SYS8222:GOSUB42010:TT$(X)=I$:MX(X)=LEN(I$):NEXTX:CLOSE2:RETURN
30700 Y=1:A=16:O$="{ct k}{black}Handle       : {white}"+TT$(1)+"{ct c}":GOSUB30100
30800 Y=3:A=16:O$="{black}Real name    : {white}"+TT$(3)+"{ct c}":GOSUB30100
30900 Y=2:A=10:O$="{black}Password     : {white}"+TT$(2)+"{ct c}":GOSUB30100
31000 Y=4:A=14:O$="{black}Phone number : {white}"+TT$(4)+"{ct c}":GOSUB30100
31100 Y=5:A=1:O$="{black}Access level : {white}"+TT$(5)+"{ct c}":GOSUB30100
31200 Y=6:A=10:O$="{black}Last call    : {white}YYMMDDHHMM{ct k}             : "+TT$(6)+"{ct c}":GOSUB30100
31300 Y=9:A=4:O$="{black}Calls today  :{white}"+TT$(9)+"{ct c}":GOSUB30100
31400 Y=11:A=6:O$="{black}Blocks       : {white}"+TT$(11)+"{ct c}":GOSUB30100
31500 Y=12:A=4:O$="{black}Credits      : {white}"+TT$(12)+"{ct c}":GOSUB30100
31510 Y=14:A=4:O$="{black}Posts/Replies: {white}"+TT$(14)+"{ct c}":GOSUB30100
31520 Y=15:A=4:O$="{black}Private mail : {white}"+TT$(15)+"{ct c}":GOSUB30100
31600 Y=13:A=4:O$="{black}Default baud : {white}"+TT$(13)+"{ct c}":GOSUB30100
31700 Y=8:A=10:O$="{black}Info flags   : {white}E8DS?X#RBC{ct k}             : "+TT$(8)+"{ct c}":GOSUB30100
31800 W2$="{black}Flags : {white}":W1$=TT$(7):GOSUB41700:TT$(7)=W1$
32300 IFW1=401THENRETURN:ELSEO$="{ct k}{black}A)bort, S)ave, D)elete, E)dit : {ct c}":GOSUB4:C$="SEDA":GOSUB28:O$=A$+R$:GOSUB4:ONIGOTO32400,30700,32350:RETURN
32350 O$="{black}Are you sure (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THEN32300:ELSEOPEN1,D(5,0),15,"s"+MID$(STR$(D(5,1)),2)+":mail."+STR$(W2):CLOSE1:I=4
32390 GOSUB32400:RETURN
32400 IFI=4THENO$="{ct k}Deleting...{ct c}":GOSUB4:TT$(1)="^":ELSEO$="Saving...{ct c}":GOSUB4
32500 F$="userfiles":GOSUB30030:RECORD#2,W2:A$="":FORX=1TO6:A$=A$+TT$(X)+R$:NEXTX:I$=TT$(7):GOSUB670:FORX=8TO9:A$=A$+TT$(X)+R$:NEXT:I$=TT$(10):GOSUB670
32550 FORX=11TO15:A$=A$+TT$(X)+R$:NEXTX
32600 UI$(W2)=TT$(1):PRINT#2,A$;:CLOSE2:FORI=1TO6:O$=CHR$(20):GOSUB9:NEXTI:O$="ed!":GOSUB4:RETURN
32700 GOSUB990:IFM3$="#"THEN32900:ELSEW9=ASC(M3$)-192:IFW9>0ANDW9<27THEN32900
32800 O$=T$(57):GOSUB4:X=1:GOSUB5:I=ASC(I$)-192:IFI<1ORI>26THEN920:ELSEW9=I
32900 U=D(1,0):D=D(1,1):F$="msg bases":GOSUB30030:RECORD#2,W9:FORX=1TO5:SYS8222:TT$(X)=MID$(STR$(VAL(I$)),2):MX(X)=LEN(TT$(X)):NEXTX
33000 FORX=6TO10:SYS8222:TT$(X)=I$:MX(X)=LEN(TT$(X)):NEXTX:CLOSE2
33100 Y=6:A=20:O$="{ct k}{black}Subboard Name: {white}"+TT$(6)+"{ct c}":GOSUB30100
33200 Y=1:A=2:O$="{black}Device number: {white}"+TT$(1)+"{ct c}":GOSUB30100
33300 Y=2:A=1:O$="{black}LU/Drive     : {white}"+TT$(2)+"{ct c}":GOSUB30100
33400 Y=3:A=2:O$="{black}Max Msgs (50): {white}"+TT$(3)+"{ct c}":GOSUB30100:IFVAL(TT$(3))<1ORVAL(TT$(3))>50THEN33400
33500 Y=4:A=2:O$="{black}Max Responses: {white}"+TT$(4)+"{ct c}":GOSUB30100:IFVAL(TT$(4))<1THEN33500
33600 Y=5:A=2:O$="{black}Min Responses: {white}"+TT$(5)+"{ct c}":GOSUB30100:IFVAL(TT$(5))<1THEN33600
33700 W2$="{black}Access: {white}":W1$=TT$(7):GOSUB41700:TT$(7)=W1$
34200 Y=8:A=30:O$="{black}Subops       : {white}"+TT$(8)+"{ct c}":GOSUB30100
34250 Y=9:A=3:O$="{black}Posts/call   : {white}"+TT$(9)+"{ct c}":GOSUB30100
34260 IFTT$(10)=""THENTT$(10)="*"
34270 Y=10:A=26:O$="{black}Extra masks  : {white}"+TT$(10)+"{ct c}":GOSUB30100
34300 O$="{ct k}{black}A)bort, D)elete, S)ave, E)dit : {ct c}":GOSUB4:C$="ASED":GOSUB28:O$=A$+R$:GOSUB4:ONIGOTO940,34400,33100,34600
34400 O$="Saving...{ct c}":GOSUB4:F$="msg bases":GOSUB30030:RECORD#2,W9:A$="":FORX=1TO10:A$=A$+TT$(X)+CHR$(13):NEXTX
34500 PRINT#2,LEFT$(A$,LEN(A$)-1):CLOSE2:FORI=1TO6:O$=CHR$(20):GOSUB9:NEXTI:O$="ed!":GOSUB4:GOTO940
34600 O$="{ct k}{black}Are you sure (y/n)?{ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THEN34300:ELSETT$(6)="(none)":TT$(7)="{pound}":GOTO34400
34700 GOSUB990:IFM3$="#"THEN34900:ELSEW9=ASC(M3$)-192:IFW9>0ANDW9<27THEN34900
34800 O$=T$(65):GOSUB4:X=1:GOSUB5:I=ASC(I$)-192:IFI<1ORI>26THEN920:ELSEW9=I
34900 U=D(1,0):D=D(1,1):F$="u/d bases":GOSUB30030:RECORD#2,W9:FORX=1TO2:SYS8222:TT$(X)=MID$(STR$(VAL(I$)),2):NEXTX:FORX=3TO5:SYS8222:TT$(X)=I$:NEXTX
35000 FORX=6TO8:SYS8222:TT$(X)=MID$(STR$(VAL(I$)),2):NEXTX:CLOSE2:FORX=1TO8:MX(X)=LEN(TT$(X)):NEXTX
35100 Y=3:A=20:O$="{ct k}{black}Subboard Name: {white}"+TT$(3)+"{ct c}":GOSUB30100
35200 Y=1:A=2:O$="{black}Device number: {white}"+TT$(1)+"{ct c}":GOSUB30100
35300 Y=2:A=1:O$="{black}LU/Drive     : {white}"+TT$(2)+"{ct c}":GOSUB30100
35400 IFDR$(1)=""THENTT$(8)="0":ELSEY=8:A=4:O$="{black}Max files    : {white}"+TT$(8)+"{ct c}":GOSUB30100:IFVAL(TT$(8))<1THEN35400
35450 Y=6:A=4:O$="{black}Min blks     : {white}"+TT$(6)+"{ct c}":GOSUB30100:IFVAL(TT$(6))<1THEN35450
35500 Y=7:A=2:O$="{black}Credits/blk  : {white}"+TT$(7)+"{ct c}":GOSUB30100:IFVAL(TT$(7))<1THEN35500
35600 W2$="{black}Access : {white}":W1$=TT$(4):GOSUB41700:TT$(4)=W1$
36100 Y=5:A=30:O$="{black}Subops       : {white}"+TT$(5)+"{ct c}":GOSUB30100
36200 O$="{ct k}{black}A)bort, D)elete, S)ave, E)dit : {ct c}":GOSUB4:C$="ASED":GOSUB28:O$=A$+R$:GOSUB4:ONIGOTO940,36300,35100,36500
36300 O$="Saving...{ct c}":GOSUB4:F$="u/d bases":GOSUB30030:RECORD#2,W9:A$="":FORX=1TO8:A$=A$+TT$(X)+CHR$(13):NEXTX
36400 PRINT#2,LEFT$(A$,LEN(A$)-1):CLOSE2:FORI=1TO6:O$=CHR$(20):GOSUB9:NEXTI:O$="ed!":GOSUB4:GOTO940
36500 O$="{ct k}{black}Are you sure (y/n)?{ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THEN36200:ELSETT$(3)="(none)":TT$(4)="{pound}":GOTO36300
36600 O$="{ct k}{black}ZOS interface v2.1":GOSUB4:GOSUB990:IFM3$="*"THENU=8:D=0:GOSUB990:GOTO36700:ELSEU=VAL(M3$):GOSUB990:D=VAL(M3$)
36700 CLOSE1:CLOSE15:E=0:O$="{ct k}{cyan}{ct n}"+MID$(STR$(U),2)+","+MID$(STR$(D),2)+">{ct c}":GOSUB4:GOSUB6:I=0:F$="":W1=0:IFI$="@"THENOPEN1,U,15:GOTO37200:ELSEIFI$=""THEN940
36750 IFDTHENA=INSTR(I$,"0:"):IFATHENI$=LEFT$(I$,A-1)+MID$(STR$(D),2)+MID$(I$,A+1):GOTO36750
36800 A$=LEFT$(I$,1):IFLEN(I$)>3ANDMID$(I$,2,1)=":"THENF$=MID$(I$,INSTR(I$,":")+1)
36900 ONINSTR("?#@we$%p^!scudb",A$)GOTO37280,37300,37600,37900,38200,38400,38600,38800,39000,39100,40000,45000,46000,46200,8940
37000 A=INSTR(I$,","):W1=VAL(I$):IFAANDW1>7ANDW1<30THENU=W1:D=VAL(MID$(I$,A+1)):O$="{cyan}3, drive selected,"+MID$(STR$(U),2)+","+MID$(STR$(D),2):GOSUB4:GOTO36700
37100 OPEN1,U,15,I$
37200 INPUT#1,W1,I$,W2,W3:CLOSE1
37250 O$="{cyan}"+MID$(STR$(W1),2)+", "+I$+","+MID$(STR$(W2),2)+","+MID$(STR$(W3),2):GOSUB4:GOTO36700
37280 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.zos help,s,r":SYS8210:CLOSE2:GOTO36700
37300 IFI$="#"THEN36700:ELSEI$=RIGHT$(I$,LEN(I$)-1):IFINSTR(LEFT$(I$,3),"e")ANDINSTR(I$,":")<>INSTR(I$,"e")+1THEN36700
37400 I=VAL(LEFT$(I$,3)):IFIORLEFT$(I$,1)="0"THENW1=1
37450 DO:I$=RIGHT$(I$,LEN(I$)-1):LOOPUNTILVAL(I$)=0ANDLEFT$(I$,1)<>"0"
37500 IFLEFT$(I$,1)=","THENI$=RIGHT$(I$,LEN(I$)-1):I=I+(VAL(I$)/100):GOTO37450:ELSE36800
37600 IFF$=""THEN36700:ELSEGOSUB30020:IFITHENFORX=1TOI:SYS8213:NEXT:IFPEEK(253)THENO$="{cyan}81, link not found,0,0":GOSUB4:CLOSE2:GOTO36700
37700 C$="":SYS8210:IFPEEK(253)=0THENCLOSE2:GOTO36700
37800 O$="{ct k}{cyan}{ct n}S)kip next or (Return)>{ct c}":GOSUB4:C$="S"+R$:GOSUB28:O$=A$:GOSUB4:IFI=1THENSYS8213:GOTO37800:ELSE37700
37900 IFF$=""THEN36700:ELSEIFI=0THENO(12)=1:GOTO38100:ELSEGOSUB30020:FORX=1TOI:SYS8213:NEXTX:CLOSE2:IFPEEK(253)=0THENO(12)=2:GOTO38100
38000 O$="{ct k}{cyan}Not found - Append (y/n)?{ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THEN36700:ELSEO(12)=0
38100 GOSUB1000:GOTO36700
38200 IFF$=""THEN36700:ELSEO(12)=2:O(10)=I:GOSUB8330
38300 IFO(11)THEN36700:ELSEGOSUB1000:GOTO36700
38400 IFI$="$"THENI$=I$+MID$(STR$(D),2)+":*"
38500 POKE253,0:OPEN2,U,0,I$:SYS8219:CLOSE2:O$=R$:GOSUB9:GOTO36700
38600 MID$(I$,INSTR(I$,"%"),1)="$":IFI$="$"THENI$=I$+MID$(STR$(D),2)+":*"
38700 POKE253,0:OPEN2,U,0,I$:SYS8228:CLOSE2:O$="{cyan}7, files counted,"+MID$(STR$(PEEK(2858)),2)+",0":GOSUB4:GOTO36700
38800 IFINSTR(I$,"e")THEN36700
38900 I$=MID$(I$,2):IFW1=0THENO$="{cyan}6, value peeked,"+I$+","+MID$(STR$(PEEK(VAL(I$))),2):GOSUB4:GOTO36700
38950 IFI<0ANDI>255THEN36700:ELSEPOKEVAL(I$),I:O$="{cyan}5, value poked,"+I$+","+MID$(STR$(I),2):GOSUB4:GOTO36700
39000 IFF$=""THEN36700:ELSEOPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",p,r":INPUT#1,W1,I$,W2,W3:CLOSE2:CLOSE1:IFW1THEN37250
39010 I$=F$:W1=9999:GOTO23
39100 IFF$=""THEN36700:ELSEIFI>0THENOPEN2,U,2,MID$(STR$(D),2)+":"+F$:RECORD#2,I:GOTO39300
39200 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,a":INPUT#1,E:IFETHENCLOSE2:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,w"
39300 POKE2850,0:POKE2895,1:O$="{ct k}{ct n}{white}:{ct c}":GOSUB4:GOSUB6:A$="":IFI$=""THENCLOSE1:CLOSE2:GOTO36700
39400 IFI$=""THEN39900:ELSEX=INSTR(I$,"("):Y=INSTR(I$,")")
39500 IFX>1ANDY>X+1ANDY<X+5THENA$=A$+LEFT$(I$,X-1):I$=RIGHT$(I$,LEN(I$)-LEN(LEFT$(I$,X-1))):GOTO39400
39600 IFX=1ANDY>2ANDY<6THENIFVAL(MID$(I$,2,Y-2))>0THENA$=A$+CHR$(VAL(MID$(I$,2,Y-2))):I$=RIGHT$(I$,LEN(I$)-Y):GOTO39400
39700 IFXANDYTHENI=X:X=INSTR(MID$(I$,I+1),"("):IFX>ITHEN39500
39800 A$=A$+I$
39900 PRINT#2,A$:CLOSE2:CLOSE1:GOTO36700
40000 IFW1=0THEN37000:ELSEIFF$=""THEN36700:ELSEX=0:OPEN1,U,15,"s"+MID$(STR$(D),2)+":sys.work":GOSUB30020:INPUT#1,W1,I$,W2,W3:IFW1THENCLOSE1:CLOSE2:GOTO37250
40100 OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,w":INPUT#1,E:Y=0:IFETHEN40700
40200 IFX=ITHENY=1:SYS8213:IFPEEK(253)THEN40500
40300 IFX>0THENPRINT#3,CHR$(1)
40400 GOSUB31:X=X+1:IFPEEK(253)THEN40500:ELSE40200
40500 INPUT#1,E:CLOSE3:CLOSE2:IFE>0THEN40700:ELSEPRINT#1,"s"+MID$(STR$(D),2)+":"+F$:PRINT#1,"r"+MID$(STR$(D),2)+":"+F$+"=sys.work"
40600 GOSUB30020:GET#2,A$:E=ST:CLOSE2:IFE>0THENPRINT#1,"s"+MID$(STR$(D),2)+":"+F$:GOTO36700
40650 CLOSE1:IFYTHENO$="{cyan}82, link scratched,0,0":GOSUB4:GOTO36700:ELSEO$="{cyan}81, link not found,0,0":GOSUB4:GOTO36700
40700 O$="Disk error, clearing...":GOSUB4:PRINT#1,"s"+MID$(STR$(D),2)+":sys.work":PRINT#1,"v"+MID$(STR$(D),2):GOTO36700
40800 O$="{ct k}{black}{ct k}Enter time {white}(HH:MM format): {ct c}":GOSUB4:X=5:GOSUB5:IFLEN(I$)<5THEN940:ELSEO$="{ct k}{black}AM or PM {white}(A/P): {ct c}":GOSUB4:C$="AP":GOSUB28:O$=A$:GOSUB4
40900 I=VAL(LEFT$(I$,2)):IFI=12ANDA$="A"THENA$="P":ELSEIFI=12THEN41100
41000 IFA$="P"THENI=I+80
41100 POKE56587,DEC(STR$(I)):POKE56586,DEC(RIGHT$(I$,2)):POKE56585,1:POKE56584,1:I=PEEK(56584)
41200 O$="{ct k}{black}Enter date {white}(MM/DD/YY format): {ct c}":GOSUB4:X=8:GOSUB5:IFLEN(I$)<8THEN940:ELSEPOKE2879,VAL(LEFT$(I$,2)):POKE2880,VAL(MID$(I$,4,2))
41300 POKE2863,VAL(RIGHT$(I$,2)):GOSUB400:O$="{ct k}{black}Now: {white}"+O$(3):GOTO940
41400 O$=T$(51):GOSUB4:X=0
41500 DO:X=X+1:LOOPUNTILUI$(X)="^"ORUI$(X)=""ORX>M(14):IFX>M(14)THENO$=T$(43):GOSUB4:GOTO920
41600 A=X:W1=402:GOSUB30500:GOSUB30700:GOTO940
41700 IFLEN(W1$)<26THENW1$="00000000000000000000000000"
41705 O$="":FORX=1TO26:IFMID$(W1$,X,1)="1"THENA$=CHR$(X+192):ELSEA$=" "
41710 O$=O$+A$:NEXTX:O$=W2$+O$:IFW1=401THENGOSUB4:RETURN:ELSEO$=O$+"{ct c}":GOSUB4
41715 C$=CHR$(20)+R$:GOSUB28:IFI=2THENO$=A$:GOSUB9:RETURN
41720 FORX=1TO28:O$=CHR$(20):GOSUB9:NEXTX:O$=" Toggle: {white}{ct c}":GOSUB4:X=26:GOSUB5:IFI$=""THENRETURN
41730 FORX=1TOLEN(I$):A=ASC(MID$(I$,X,1))-192:IFA<1ORA>26THEN41750
41740 MID$(W1$,A,1)=MID$(STR$(ABS(VAL(MID$(W1$,A,1))-1)),2)
41750 NEXTX:GOTO41705
42010 I$=MID$(STR$(VAL(I$)),2):RETURN
43000 W5=0:U=D(1,0):D=D(1,1):OPEN1,U,15,"s"+MID$(STR$(D),2)+":sys.work":CLOSE1
43100 OPEN1,U,15:F$="sys.new user":GOSUB30020:INPUT#1,I:IFI>0THENCLOSE2:CLOSE1:GOTO43990
43110 IFW5>0THENFORI=1TOW5:SYS8213:NEXTI:IFPEEK(253)THEN43990
43120 SYS8222:M6=VAL(I$):O$="{ct k}{clear}{ct k}{black}Application #"+STR$(W5+1)+"{ct k*2}{yellow}New User    :{white} "+UI$(M6)+" {yellow}(ID#{white}"+STR$(M6)+"{yellow})":GOSUB4:SYS8222
43130 O$="{yellow}Date Filed  :{white} "+I$:SYS8222:O$=O$+"{ct k}{yellow}Real Name   :{white} "+I$:SYS8222:O$=O$+"{ct k}{yellow}Phone Number:{white} "+I$:SYS8222:O$=O$+"{ct k}{yellow}Password    :{white} "+I$+"{ct k}":GOSUB4:SYS8210
43140 CLOSE2:CLOSE1:O$="{black}A)gain, D)elete, E)dit, H)old,{f7}Q)uit, M)ail, V)alidate: {white}{ct c}":GOSUB4:C$="ADEHQMV":GOSUB28:O$=A$:GOSUB4
43150 ONIGOTO43100,43200,43300,43400,43500,43600,43700:GOTO43140
43200 O$="{black}{ct k}Are you sure (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:O$=A$:GOSUB4:IFI=2THEN43140
43210 A=M6:GOSUB30500:I=4:GOSUB32400:W5=W5+1:O(6)=O(6)-1:GOTO43100
43300 A=M6:GOSUB30500:GOSUB30700:GOTO43140
43400 O$="{ct k}{black}Saving...":GOSUB4:OPEN1,U,15:F$="sys.new user":GOSUB30020:IFW5>0THENFORI=1TOW5:SYS8213:NEXTI
43410 OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,w":INPUT#1,I:IFI>0THENCLOSE3:OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,a":PRINT#3,CHR$(1)
43420 GOSUB31:CLOSE2:CLOSE3:CLOSE1:W5=W5+1:GOTO43100
43500 IFW5=0THEN43995:ELSEO$="{ct k}{black}Saving applications...":GOSUB4:OPEN1,U,15:F$="sys.new user":GOSUB30020:IFW5>0THENFORI=1TOW5:SYS8213:NEXTI
43510 OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,w":INPUT#1,I:IFI>0THENCLOSE3:OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,a":PRINT#3,CHR$(1)
43520 GOSUB31:IFPEEK(253)THENCLOSE1:CLOSE2:CLOSE3:GOTO43990:ELSEPRINT#3,CHR$(1):GOTO43520
43600 O(12)=0:U0=U:D0=D:U=D(6,0):D=D(6,1):F$="mail."+STR$(M6):GOSUB400:IFID=0THENO$(5)=UI$(1)+R$+STR$(1)+R$+O$(3):ELSEO$(5)=U$(1)+R$+STR$(ID)+R$+O$(3)
43620 GOSUB1000:U=U0:D=D0:GOTO43140
43700 A=M6:GOSUB30500:IFTT$(5)<>"A"THENO$="{ct k}{black}User is already validated":GOSUB4:O(6)=O(6)-1:W5=W5+1:GOTO43100
43710 O$="{ct k}{black}New access: {white}{ct c}":GOSUB4:X=1:GOSUB5:A=ASC(I$):IFA<193ORA>218THENO$="":GOSUB4:GOTO43140
43720 TT$(5)=CHR$(A):W2$="{ct k}{black}Flags : {white}":W1$=TT$(7):GOSUB41700:TT$(7)=W1$
43730 O$="{black}":GOSUB4:GOSUB32400:W5=W5+1:O(6)=O(6)-1:GOTO43100
43990 CLOSE1:CLOSE2:CLOSE3:OPEN1,U,15,"s"+MID$(STR$(D),2)+":sys.new user":PRINT#1,"r"+MID$(STR$(D),2)+":sys.new user=sys.work":CLOSE1
43995 IFID>0THEN940:ELSEI$="prg.logon":U=D(0,0):D=D(0,1):GOTO23
44000 U=D(1,0):D=D(1,1):F$="sys.one liners":O(12)=1:GOSUB8330:IFO(11)THEN920:ELSEO(12)=1:GOSUB1000:O$="{ct k}Loading one liners...":GOSUB4
44010 GOSUB30020:I=1
44020 SYS8222:OL$(I)=I$:IFPEEK(253)=0THENI=I+1:GOTO44020:ELSECLOSE1:CLOSE2:OL$(0)=STR$(I):GOTO940
45000 IFI=0THEN37100:ELSEGOSUB45900:IFETHEN36700:ELSEU0=INT(I):D0=I-(U0-.00001):D0=INT(D0*100):IFU=U0THEN36700
45010 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",r":INPUT#1,E:IFETHENCLOSE2:CLOSE1:O$="{cyan}78, source file error,"+MID$(STR$(E),2):GOSUB4:GOTO36700
45020 OPEN15,U0,15:OPEN3,U0,3,MID$(STR$(D0),2)+":"+F$+",w":INPUT#15,E:IFE>0THENCLOSE3:O$="{cyan}79, destination file error,"+MID$(STR$(E),2):GOSUB4:CLOSE2:GOTO36700
45030 A=PEEK(2974):POKE2974,0:POKE255,0:SYS8255:POKE2974,A
45040 CLOSE1:CLOSE15:CLOSE2:CLOSE3:O$="{cyan}4, copy complete,0,0":GOSUB4:GOTO36700
45900 E=0:IFINSTR(F$,",")<>LEN(F$)-1THENE=1:O$="{cyan}80, missing file type,0,0":GOSUB4:RETURN:ELSERETURN
46000 ONW1GOSUB46500:GOSUB45900:IFETHEN36700
46010 O$="{ct k}{yellow}"+O$(23)+" Upload: {white}"+F$:GOSUB4:I=1:X=INSTR(F$,","):IFX>1THENI$=LEFT$(F$,X-1):I=INSTR("psw",RIGHT$(F$,1)):F$=I$:ELSE36700
46020 GOSUB500:SLEEP5:GOTO36700
46200 ONW1GOSUB46500:GOSUB45900:IFETHEN36700
46210 O$="{ct k}{yellow}"+O$(23)+" Download: {white}"+F$:GOSUB4:I=1:X=INSTR(F$,","):IFX>1THENI$=LEFT$(F$,X-1):I=INSTR("psw",RIGHT$(F$,1)):F$=I$:ELSE36700
46220 GOSUB550:GOTO36700
46500 IFI=O(19)ORI>1THENRETURN
46510 O(19)=I:BLOAD(MID$("px",I+1,1)+"-xfer 1300"),U(D(0,0)),D(D(0,1)):O$(23)="Punter":IFO(19)=1THENO$(23)="Xmodem"
46520 RETURN
55555 A=PEEK(186):OPEN1,A,15,"s0:prg.sysop":CLOSE1:DSAVE"prg.sysop",U(A):END
