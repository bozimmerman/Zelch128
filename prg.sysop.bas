!--------------------------------------------------
!- Tuesday, May 16, 2017 10:31:56 PM
!- Import of : 
!- c:\src\zelch128next\prg.sysop.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:REM ================= SYSOP MODULE V3.0 ============= 09/10/92 =
30010 U=D(1,0):D=D(1,1)
30011 ON(W1-400)GOTO31000,31000,32000,33000,40000,34000,35000,36000,37000
30012 GOTO940
30020 OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":RETURN
30030 OPEN2,U,2,MID$(STR$(D),2)+":sys."+F$:RETURN
30050 OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":RETURN
30099 REM------MAIN PROMPT ROUTINE------
30100 E=0:IFLEFT$(O$,1)="@"THENO$=MID$(O$,2):E=1
30150 O$="{black}"+O$+": {white}"+VT$(A)+"{ct c}":GOSUB4:IFW1=401THENO$=R$:GOSUB9:E=0:GOTO30375
30200 IFVT$(A)<>""THENC$=CHR$(20)+R$:GOSUB32:IFI=2THENO$=R$:GOSUB9:E=0:GOTO30375
30250 IFVT$(A)<>""THENFORX=1TOVT(A):O$=CHR$(20):GOSUB9:NEXTX
30300 IFETHENRETURN:ELSEX=L:GOSUB5:L=0:IFI$=""THEN30375
30350 VT$(A)=I$:VT(A)=LEN(I$)
30375 I=VAL(VT$(A)):RETURN
30400 I$=MID$(STR$(VAL(I$)),2):RETURN
30499 REM----SELECT SUBBOARD ROUTINE----
30500 GOSUB990:W9=0:W9$=W1$:IFSY(4)THENW9=SY(4):SY(4)=0:RETURN
30550 IFSY$="#"THENW9=W1:RETURN:ELSEIFSY$<>"*"THEN30650
30600 GOSUB4:X=12:GOSUB16:SY$="/"+I$
30650 IFLEFT$(SY$,1)="/"THENW9$="":SY$=MID$(SY$,2)
30700 X=0:DO:X=X+1:A$=MID$(SY$,X,1):A=ASC(A$)-192:IFA$="/"THEN30900
30750 IFA>0ANDA<27THEN30850:ELSEA=VAL(MID$(SY$,X))
30800 IFA<1ORA>26ORVAL(A$)=0THEN30900:ELSEX=X+1:A$=CHR$(A+192):IFA>9THENX=X+1
30850 W9$=W9$+A$
30900 LOOPUNTILX>LEN(SY$):IFW9$=""THENW=1:RETURN
30950 W9=ASC(RIGHT$(W9$,1))-192:W9$=LEFT$(W9$,LEN(W9$)-1):RETURN
30999 REM*******************EDIT LOSER*********************
31000 GOSUB31110:GOTO940
31110 IFSY(4)THENA=SY(4):SY(4)=0:ELSEGOSUB8060:IFA=0THENRETURN
31120 IFA=IDTHENRETURN:ELSEGOSUB31400:GOTO31500
31150 IFE=0THENRETURN:ELSEO$="Change which: {ct c}":GOSUB4:C$="E8DS?X#RBC"+R$:GOSUB32:O$=A$:GOSUB9:Y=I:IFI=11THENE=0:RETURN
31160 IFY<9THENA$=MID$(STR$(ABS(VAL(MID$(VT$(8),Y,1))-1)),2):O$=CHR$(20)+CHR$(20)+"{ct c}":GOSUB4:GOTO31185
31170 FORI=1TO15:O$=CHR$(20):GOSUB9:NEXT:O$="Change to: {ct c}":GOSUB4:DO:POKE2831,1:GOSUB8:LOOPUNTILA$<>"":IFA$=R$THENRETURN:ELSEO$=A$+" {ct c}":GOSUB4
31180 IFY=9ANDINSTR("0123456789",A$)=0THEN31190
31185 MID$(VT$(8),Y,1)=A$
31190 FORI=1TO13:O$=CHR$(20):GOSUB9:NEXTI:O$=VT$(8)+"{ct c}":GOSUB4:C$=CHR$(20)+R$:GOSUB32:IFI=2THENO$=A$:GOSUB9:E=0:RETURN
31195 FORI=1TO10:O$=CHR$(20):GOSUB9:NEXTI:GOTO31150
31200 IFLEN(W1$)<26THENW1$=W1$+"0":GOTO31200
31210 O$="":FORX=1TO26:IFMID$(W1$,X,1)="1"THENA$=CHR$(X+192):ELSEA$=" "
31220 O$=O$+A$:NEXTX:O$=W2$+O$:IFW1=401THENGOSUB4:RETURN:ELSEO$=O$+"{ct c}":GOSUB4
31230 C$=CHR$(20)+R$:GOSUB32:IFI=2THENO$=A$:GOSUB9:RETURN
31240 FORX=1TO28:O$=CHR$(20):GOSUB9:NEXTX:O$=" Toggle: {white}{ct c}":GOSUB4:X=26:GOSUB16:IFI$=""THENRETURN
31250 FORX=1TOLEN(I$):A=ASC(MID$(I$,X,1))-192:IFA<1ORA>26THEN31270
31260 MID$(W1$,A,1)=MID$(STR$(ABS(VAL(MID$(W1$,A,1))-1)),2)
31270 NEXTX:GOTO31210
31400 W2=A:U=D(4,0):D=D(4,1):CLOSE2:F$="userfiles":GOSUB30030:RECORD#2,W2
31450 FORI=1TO10:SYS8222:VT$(I)=I$:VT(I)=LEN(I$):NEXTI:FORI=11TO18:SYS8222:GOSUB30400:VT$(I)=I$:VT(I)=LEN(I$):NEXTI:CLOSE2:IFVT$(1)="{pound}"THENVT$(1)="^"
31475 RETURN
31500 O$="{ct k}":GOSUB9
31550 A=1::L=16:O$="Handle       ":GOSUB30100
31560 A=3::L=16:O$="Real Name    ":GOSUB30100
31570 A=4::L=14:O$="Phone number ":GOSUB30100
31580 A=7::L=8::O$="Birthdate    ":GOSUB30100
31590 A=2::L=10:O$="Password     ":GOSUB30100
31600 A=5::L=1::O$="Access level ":GOSUB30100
31610 A=6::L=10:O$="Last call    ":GOSUB30100
31620 A=16:L=4::O$="Calls today  ":GOSUB30100
31630 A=18:L=3::O$="Mins today   ":GOSUB30100
31640 A=13:L=4::O$="Default baud ":GOSUB30100
31650 A=17:L=2::O$="Lines/screen ":GOSUB30100
31660 A=11:L=6::O$="Block creds  ":GOSUB30100
31670 A=12:L=6::O$="System creds ":GOSUB30100
31680 A=14:L=4::O$="Posts/replies":GOSUB30100
31690 A=15:L=4::O$="Private mail ":GOSUB30100
31700 A=8::L=0:O$="@Info Flags   : {white}E8DS?X#RBC{ct k}             ":GOSUB30100:GOSUB31150
31710 W2$="{black}Flags : {white}":W1$=VT$(9):GOSUB31200:VT$(9)=W1$
31750 IFW1=401THENRETURN
31800 O$="{ct k}{black}S)ave, E)dit, D)elete, A)bort: {white}{ct c}":GOSUB4:C$="SEDA":GOSUB28:O$=R$:GOSUB9:ONIGOTO31900,31500,31850:RETURN
31850 O$="{black}Delete, are you sure (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN31800:ELSEOPEN1,D(5,0),15,"s"+MID$(STR$(D(5,1)),2)+":mail."+STR$(W2):CLOSE1:I=4
31900 IFI=4THENO$="{ct k}{black}Deleting...{ct c}":VT$(1)="^":GOSUB4:ELSEO$="{ct k}{black}Saving...{ct c}":GOSUB4
31950 F$="userfiles":GOSUB30030:RECORD#2,W2:A$="":FORI=1TO18:A$=A$+VT$(I)+R$:NEXTI:UI$(W2)=VT$(1):RECORD#2,W2:PRINT#2,A$:CLOSE2
31970 FORI=1TO6:O$=CHR$(20):GOSUB9:NEXTI:O$="ed!   ":GOSUB4:RETURN
31975 GOSUB31970:GOTO940
31999 REM****************EDIT MSG BASES********************
32000 W1=MB(1):W1$=MB$(3):O$=T$(57):VT$(49)="":GOSUB30500:IFE>0THEN920
32025 OPEN1,U,15:F$="mbases"+W9$:GOSUB30030:INPUT#1,E:IFE>0THENCLOSE2:CLOSE1:GOTO920
32050 RECORD#2,W9:FORX=1TO14:SYS8222:VT$(X)=I$:IFX=7ORX=8THEN32090:ELSEIFX=6THENVT$(0)=LEFT$(I$,1):VT$(6)=MID$(VT$(6),2)
32075 IFVAL(VT$(X))>0ORX=2THENGOSUB30400:VT$(X)=I$
32090 VT(X)=LEN(VT$(X)):NEXTX:CLOSE2:CLOSE1:GOTO32500
32100 O$="Msg base {ct c}":IFVT$(0)="$"THENO$="Directory{ct c}":ELSEIFVT$(0)="@"THENO$="Alt base {ct c}"
32110 GOSUB4:C$=CHR$(20)+R$:GOSUB32:IFA$=R$THENO$=A$:GOTO9:ELSEFORI=1TO9:O$=CHR$(20):GOSUB9:NEXTI
32120 O$="New type (M,D,A): {ct c}":GOSUB4:C$="MDA":GOSUB28:W2$=VT$(0):VT$(0)=MID$("{sh @}$@",I,1)
32130 IFI<>2ANDW2$="$"THEN32140:ELSEIFI=2ANDW2$<>"$"THEN32160:ELSERETURN
32140 O$="{ct k}{black}Remove directory (Y/N)? {ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THENO$=R$:GOTO9
32150 OPEN1,U,15,"s"+MID$(STR$(D),2)+":sys.mbases"+W9$+CHR$(W9+192):PRINT#1,"s"+MID$(STR$(D),2)+":sys.mdata"+W9$+CHR$(W9+192):CLOSE1:O$=R$:GOTO9
32160 O$="{ct k}{black}Create directory (Y/N)? {ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THENO$=R$:GOTO9:ELSEO$="{ct k}{black}Working...{ct c}":GOSUB4
32170 OPEN2,U,2,MID$(STR$(D),2)+":sys.mbases"+W9$+CHR$(W9+192)+",l,"+CHR$(253):RECORD#2,26:PRINT#2,"burp!"
32180 A$=STR$(U)+R$+STR$(D)+R$+" 10^ 20^ 10^{sh @}(none)^00000000000000000000000000^{right}1^ 2^*^N^ 3^ 2^Y":A=LEN(A$)-1:DO:MID$(A$,A,1)=R$:A=INSTR(A$,"^"):LOOPUNTILA=0
32190 FORI=1TO26:RECORD#2,I:O$=".":GOSUB9:PRINT#2,A$:NEXTI:CLOSE2:A$="0000000000"+R$+" 0"
32200 OPEN2,U,2,MID$(STR$(D),2)+":sys.mdata"+W9$+CHR$(W9+192)+",l,"+CHR$(15):RECORD#2,1327:PRINT#2,"burp!":FORI=1TO1327:IFI/51=INT(I/51)THENO$=".":GOSUB9
32210 RECORD#2,I:PRINT#2,A$:NEXTI:FORI=51TO1327STEP51:RECORD#2,I:PRINT#2,"0"+R$+"1":NEXTI:CLOSE2:CLOSE1:O$=R$:GOTO4
32250 O$="Subboard name":IFVT$(0)="@"THENO$="@Alt sub path/":ELSEIFVT$(0)="$"THENO$="Dir. name    "
32260 RETURN
32300 IFE>0THENGOSUB16:VT$(6)=I$:VT(6)=LEN(I$):IFI$=""THEN32350
32310 F$="mbases"+LEFT$(VT$(6),LEN(VT$(6))-1):A=ASC(RIGHT$(VT$(6),1))-192
32320 OPEN1,U,15:GOSUB30030:INPUT#1,E:IFE>0ORA<1ORA>26THEN32350
32330 RECORD#2,A:FORI=1TO6:SYS8222:NEXTI:CLOSE2:CLOSE1:VT$(49)=I$:E=0:IFLEFT$(I$,1)="{sh @}"THENRETURN
32350 CLOSE2:CLOSE1:E=1:O$="{ct k}{black}Invalid Alt-base!{ct k}":GOTO4
32500 O$="{ct k}":GOSUB9
32510 O$="{black}Subboard type: {white}{ct c}":GOSUB4:GOSUB32100:IFVT$(0)<>"@"THENVT$(49)=""
32520 A=6::L=20:GOSUB32250:GOSUB30100:IFVT$(0)="@"THENGOSUB32300:IFE=1THEN32510:ELSEIFVT$(0)="@"THEN32550
32530 A=1::L=2:O$="Device number":GOSUB30100:IFI<8ORI>30THEN32530
32540 A=2::L=1:O$="LU/Drive     ":GOSUB30100:IFI<0ORI>255THEN32540
32550 IFVT$(0)<>"{sh @}"THEN32650
32560 A=3::L=2:O$="Max msgs (50)":GOSUB30100:IFI<1ORI>50THEN32560
32570 A=4::L=2:O$="Max responses":GOSUB30100:IFI<1THEN32570
32580 A=5::L=2:O$="Min responses":GOSUB30100:IFI>VAL(VT$(4))THEN32580
32590 A=9::L=2:O$="Posts/call   ":GOSUB30100
32600 A=12:L=4:O$="SysCreds/post":GOSUB30100
32610 A=13:L=4:O$="SysCreds/resp":GOSUB30100
32620 A=8:L=30:O$="SubOp ID#s   ":GOSUB30100
32630 A=14:L=1:O$="Anon? (y/n/a)":GOSUB30100:IFINSTR("YNA",VT$(A))=0THEN32630
32640 A=11:L=1:O$="Network (y/n)":GOSUB30100:IFINSTR("YN",VT$(A))=0THEN32640
32650 W2$="{black}Access : {white}":W1$=VT$(7):GOSUB31200:VT$(7)=W1$
32660 A=10:L=26:O$="Extra masks  ":GOSUB30100:IFVT$(10)=""THENVT$(10)="*"
32800 O$="{ct k}{black}S)ave, E)dit, A)bort, D)elete: {white}{ct c}":GOSUB4:C$="ASED":GOSUB28:O$=R$:GOSUB9:O$="Sav":ONIGOTO940,32825,32500,32950
32825 O$=O$+"ing...{ct c}":GOSUB4:F$="mbases"+W9$:GOSUB30030:RECORD#2,W9
32850 A$="":VT$(6)=VT$(0)+VT$(6):FORI=1TO14:A$=A$+VT$(I)+R$:NEXTI:IFVT$(0)="@"THENA$=A$+VT$(49)
32900 RECORD#2,W9:PRINT#2,A$:CLOSE2:CLOSE1:GOSUB31975:GOTO940
32950 O$="{black}Delete, are you sure (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN32800
32975 VT$(0)="{sh @}":VT$(6)="(none)":VT$(7)="00000000000000000000000000":O$="{ct k}Delet":GOTO32825
32999 REM****************EDIT U/D BASES********************
33000 W1=UB(1):W1$="":O$=T$(65):GOSUB30500:IFW1<0ORW1>26THEN920
33050 F$="u/d bases":GOSUB30030:RECORD#2,W9
33100 FORX=1TO2:SYS8222:GOSUB30400:VT$(X)=I$:NEXT:FORX=3TO5:SYS8222:VT$(X)=I$:NEXT:FORX=6TO8:SYS8222:GOSUB30400:VT$(X)=I$:NEXT:FORX=1TO8:VT(X)=LEN(VT$(X)):NEXT
33150 CLOSE2:GOTO33500
33500 O$=R$:GOSUB9
33510 A=3:L=20:O$="Subboard name":GOSUB30100
33520 A=1:L=2:O$="Device number":GOSUB30100:IFI<8ORI>30THEN33520
33530 A=2:L=2::O$="LU/drive     ":GOSUB30100:IFI<0ORI>99THEN33530
33540 IFDR$(1)=""THENVT$(8)="0":GOTO33560
33550 A=8:L=4::O$="Max files    ":GOSUB30100:IFI<0THEN33550
33560 A=7:L=2::O$="Blkcreds/blk ":GOSUB30100:IFI<0THEN33560
33570 A=5:L=30:O$="Subop ID#s   ":GOSUB30100
33580 W2$="{black}Access : {white}":W1$=VT$(4):GOSUB31200:VT$(4)=W1$
33800 O$="{ct k}{black}S)ave, E)dit, D)elete, A)bort: {white}{ct c}":GOSUB4:C$="ASED":GOSUB28:O$=R$:GOSUB9:O$="Sav":ONIGOTO940,33850,33500,33950
33850 O$=O$+"ing...{ct c}":GOSUB4:F$="u/d bases":GOSUB30030:RECORD#2,W9:A$="":FORI=1TO8:A$=A$+VT$(I)+R$:NEXTI
33900 RECORD#2,W9:PRINT#2,A$:CLOSE2:GOTO31975
33950 O$="{black}Delete, are you sure (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN33800
33975 VT$(3)="(none)":VT$(4)="00000000000000000000000000":O$="{ct k}Delet":GOTO33850
33999 REM****************EDIT TIME/DATE********************
34000 O$="{ct k}{black}Enter time {white}(HH:MM format): {ct c}":GOSUB4:X=5:GOSUB5:IFLEN(I$)<5THEN920
34050 O$="{black}AM or PM (A/P): {white}{ct c}":GOSUB4:C$="AP":GOSUB28
34100 I=VAL(LEFT$(I$,2)):IFI=12ANDA$="A"THENA$="P":ELSEIFI=12THEN34200
34150 IFA$="P"THENI=I+80
34200 POKE56587,DEC(STR$(I)):POKE56586,DEC(RIGHT$(I$,2)):POKE56585,1:POKE56584,1:I=PEEK(56584)
34250 O$="{ct k}{black}Enter date {white}(MM/DD/YY format): {ct c}":GOSUB4:X=8:GOSUB5:IFLEN(I$)<8THEN920
34300 POKE2879,VAL(LEFT$(I$,2)):POKE2880,VAL(MID$(I$,4,2)):POKE2863,VAL(RIGHT$(I$,2)):GOSUB400:O$="{ct k}{black}Set: {white}"+O$(3):GOSUB4:GOTO940
34999 REM****************ADD A NEW USER********************
35000 O$=T$(51):GOSUB4:X=0
35050 DO:X=X+1:LOOPUNTILUI$(X)="^"ORUI$(X)=""ORX>M(14):IFX>M(14)THENO$=T$(43):GOSUB4:GOTO920
35100 A=X:GOSUB31400:GOSUB31500:GOTO940
35999 REM****************NEW USER APPLICATIONS*************
36000 W5=0:OPEN1,U,15,"s"+MID$(STR$(D),2)+":sys.work":CLOSE1
36025 OPEN1,U,15:F$="sys.new user":GOSUB30020:INPUT#1,I:IFI>0THENO(6)=0:CLOSE2:CLOSE1:GOTO36900
36050 IFW5>0THENFORI=1TOW5:SYS8213:NEXTI:IFPEEK(253)THEN36900
36075 SYS8222:SY(7)=VAL(I$):O$="{clear}{ct k}{black}Application #"+STR$(W5+1)+"{ct k*2}{yellow}New User    : {white}"+UI$(SY(7))+" {yellow}(ID#{white}"+I$+"{yellow})":GOSUB4
36100 SYS8222:O$="{yellow}Date filed  :{white} "+I$:GOSUB4
36110 SYS8222:O$="{yellow}Real name   :{white} "+I$:GOSUB4
36120 SYS8222:O$="{yellow}Phone number:{white} "+I$:GOSUB4
36130 SYS8222:O$="{yellow}Password    :{white} "+I$:GOSUB4
36140 SYS8222:O$="{yellow}Birthdate   :{white} "+I$+"{ct k}":GOSUB4
36150 SYS8210:CLOSE2:CLOSE1
36200 O$="{ct k}{black}A)gain, D)elete, E)dit, H)old,{f7}Q)uit, M)ail, V)alidate: {white}{ct c}":GOSUB4:C$="ADEHQMV":GOSUB28
36210 ONIGOTO36025,36300,36400,36500,36600,36250,36700:GOTO36200
36250 O(12)=0:U=D(6,0):D=D(6,1):F$="mail."+STR$(SY(7)):GOSUB400:IFID=0THENO$(5)=UI$(1)+R$+" 1"+R$+O$(3):ELSEO$(5)=U$(1)+R$+STR$(ID)+R$+O$(3)
36260 GOSUB1000:U=D(1,0):D=D(1,1):GOTO36200
36299 REM------DELETE USER COMMAND------
36300 O$="{ct k}{black}Delete, are you sure (Y/N)? {ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN36025
36310 OPEN1,D(5,0),15,"s"+MID$(STR$(D(5,1)),2)+":mail."+STR$(SY(7)):CLOSE1
36320 A=SY(7):GOSUB31400:I=4:GOSUB31900:W5=W5+1:O(6)=O(6)-1:U=D(1,0):D=D(1,1):GOTO36025
36399 REM------EDIT A USER COMMAND------
36400 A=SY(7):GOSUB31400:GOSUB31500:GOTO36200
36450 OPEN1,U,15:F$="sys.new user":GOSUB30020:IFW5>0THENFORI=1TOW5:SYS8213:NEXTI
36460 OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,w":INPUT#1,E:IFE>0THENCLOSE3:OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,a":PRINT#3,"{ct a}":RETURN:ELSERETURN
36499 REM------HOLD AN APPLICATION------
36500 O$="{ct k}{black}Holding application...{ct c}":GOSUB4:GOSUB36450
36520 GOSUB31:CLOSE2:CLOSE3:CLOSE1:O$=R$:GOSUB9:W5=W5+1:GOTO36025
36599 REM-------QUIT AND SAVE APPS------
36600 IFW5=0THENCLOSE2:CLOSE3:CLOSE1:GOTO36950
36610 O$="{ct k}{black}Closing applications...{ct c}":GOSUB4:GOSUB36450
36620 GOSUB31:IFPEEK(253)THENCLOSE2:CLOSE3:CLOSE1:O$=R$:GOSUB9:GOTO36900
36630 PRINT#3,"{ct a}":GOTO36620
36699 REM-------VALIDATE THE USER-------
36700 A=SY(7):GOSUB31400:IFVT$(5)<>"A"THENO$="{ct k}{black}User is already validated!":GOSUB4:O(6)=O(6)-1:W5=W5+1:GOTO36025
36725 O$="{ct k}{black}Access level: {white}{ct c}":GOSUB4:X=1:GOSUB5:A=ASC(I$+CHR$(0))-192:IFI<1ORI>26ORI$=""THENO$=R$:GOSUB9:U=D(1,0):D=D(1,1):GOTO36200
36750 VT$(5)=CHR$(A+192):W2$="{ct k}{black}Flags : {white}":W1$=VT$(9):GOSUB31200:VT$(9)=W1$
36775 O$="{black}":GOSUB4:GOSUB31900:W5=W5+1:O(6)=O(6)-1:U=D(1,0):D=D(1,1):GOTO36025
36900 CLOSE2:CLOSE3:CLOSE1:OPEN1,U,15,"s"+MID$(STR$(D),2)+":sys.new user":PRINT#1,"r"+MID$(STR$(D),2)+":sys.new user=sys.work":INPUT#1,E:CLOSE1
36950 IFID>0THEN940:ELSEI$="prg.logon":U=D(0,0):D=D(0,1):GOTO23
36999 REM****************EDIT ONE LINERS*******************
37000 F$="sys.one liners":O(12)=1:GOSUB8330:IFO(11)THEN920
37050 O(12)=1:GOSUB1000:IFO(11)THEN920
37100 O$="{ct k}{black}Reloading one-liners...{ct c}":GOSUB4
37150 GOSUB30020:I=1
37200 SYS8222:OL$(I)=I$:IFPEEK(253)=0THENI=I+1:GOTO37200
37250 CLOSE2:CLOSE1:OL$(0)=STR$(I):O$=R$:GOSUB9:GOTO940
39999 REM******************ZOS INTERFACE*******************
40000 O$="{ct k}{black}Z-DOS interface v3.0":GOSUB4:GOSUB990:IFSY$="*"THENU=8:D=0:GOSUB990:GOTO40500:ELSEU=VAL(SY$):GOSUB990:D=VAL(SY$):GOTO40500
40099 REM------REMOVE NUMERIC DATA------
40100 X=LEN(I$):C$=""
40110 A$=MID$(I$,X,1):IFA$=";"THEN40150
40120 IFINSTR("0123456789,",A$)=0THENRETURN
40130 IFA$=","THENA$="."
40140 C$=A$+C$:X=X-1:IFX>2THEN40110:ELSERETURN
40150 D0=0:IFINSTR(C$,".")THEND0=INT(VAL(MID$(C$,INSTR(C$,".")+1)))
40160 I=VAL(C$):U0=INT(I):C=0:IFC$="0"ORI>0THENC=1
40170 I$=LEFT$(I$,X-1):RETURN
40499 REM------MAIN PROMPT ROUTINE------
40500 CLOSE1:CLOSE15:E=0:O$="{ct k}{cyan}{ct n}"+MID$(STR$(U),2)+","+MID$(STR$(D),2)+">{ct c}":GOSUB4:GOSUB6
40550 I=0:F$="":C=0:A$=":":IFI$=""THEN940:ELSEIFI$="@"THENOPEN1,U,15:GOTO40950
40600 A=INSTR(I$,A$):IFA>1THENIFINSTR("0123456789",MID$(I$,A,1))=0THENI$=LEFT$(I$,A-1)+MID$(STR$(D),2)+":"+MID$(I$,A+1)
40650 IFD>0ANDINSTR(I$,"0:")>0THENA$="0:":GOTO40600
40700 A=INSTR(I$,";"):IFA>2ANDA>=LEN(I$)-6THENGOSUB40100
40725 IFINSTR(I$,"e")=0THENIFVAL(I$)>0THEN48500
40750 A$=LEFT$(I$,1):IFLEN(I$)>2THENF$=MID$(I$,INSTR(I$,":")+1)
40800 ONINSTR("?@we$%p^!scudb#*",A$)GOTO41000,41200,42000,42500,43000,43500,43700,43900,44000,45000,46000,47000,47500,8940,48000,49000
40850 REM (DO I REALLY NEED THIS)
40900 OPEN1,U,15,I$
40950 INPUT#1,W1,I$,W2,W3:CLOSE1
40975 O$="{cyan}"+MID$(STR$(W1),2)+", "+I$+","+MID$(STR$(W2),2)+","+MID$(STR$(W3),2):GOSUB4:GOTO40500
40999 REM------VIEW THE HELP FILE-------
41000 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.z-dos help,s,r":SYS8210:CLOSE2:GOTO40500
41199 REM------VIEW A FILE W/LINK-------
41200 IFF$=""THEN40500
41250 CLOSE2:CLOSE1:OPEN1,U,15:GOSUB30020:A=0:INPUT#1,W1,I$,W2,W3:IFW1>0THENCLOSE2:GOTO40975
41300 IFITHENFORX=1TOI:SYS8213:NEXT:A=X:IFPEEK(253)THENO$="{cyan}81, link not found,0,0":GOSUB4:CLOSE2:CLOSE1:GOTO40500
41350 C$="":SYS8210:IFPEEK(253)=0THENCLOSE2:CLOSE1:GOTO40500
41400 O$="{ct k}{cyan}{ct n}link #"+MID$(STR$(A),2)+"{ct k}j)ump, q)uit, or (return): {ct c}":GOSUB4:C$="JQ"+R$:GOSUB28
41450 IFI=1THENO$="{ct k}jump to link #{ct c}":GOSUB4:GOSUB10:GOTO41250
41500 IFI=2THENCLOSE2:GOTO40500:ELSEA=A+1:GOTO41350
41999 REM------WRITE A  SEQ  FILE-------
42000 IFF$=""THEN40500
42050 OPEN1,U,15:GOSUB30020:INPUT#1,E:CLOSE2:CLOSE1:IFE>0THENGOTO42200
42100 O$="{ct k}{cyan}s)cratch or a)ppend: {ct c}":GOSUB4:C$="AS"+R$:GOSUB28:O(12)=I-1
42200 IFI=3THEN40500:ELSEGOSUB1000:GOTO40500
42499 REM------EDIT  A  SEQ  FILE-------
42500 IFF$=""THEN40500
42550 O(12)=2:O(10)=I:GOSUB8330:IFO(11)ORO(12)<>2THEN40500
42600 GOSUB1000:GOTO40500
42999 REM------VIEW THE DIRECTORY-------
43000 IFI$="$"THENI$=I$+MID$(STR$(D),2)+":*"
43100 POKE253,0:OPEN2,U,0,I$:SYS8219:CLOSE2:O$=R$:GOSUB9:GOTO40500
43499 REM------COUNT   THE  FILES-------
43500 MID$(I$,INSTR(I$,"%"),1)="$"
43550 IFI$="$"THENI$=I$+MID$(STR$(D),2)+":*"
43600 POKE253,0:OPEN2,U,0,I$:SYS8228:CLOSE2
43650 O$="{cyan}7, files counted,"+MID$(STR$(PEEK(2858)+256*PEEK(2859)),2)+",0":GOSUB4:GOTO40500
43699 REM------POKE OR  PEEK BYTE-------
43700 IFINSTR(I$,"e")THEN40500
43750 I$=MID$(I$,2):IFC=0THENO$="{cyan}6, value peeked,"+I$+","+MID$(STR$(PEEK(VAL(I$))),2):GOSUB4:GOTO40500
43800 IFI<0ORI>255THEN40500
43850 POKEVAL(I$),I:O$="{cyan}5, value poked,"+I$+","+MID$(STR$(I),2):GOSUB4:GOTO40500
43899 REM------LOAD A  Z/S MODULE-------
43900 IFF$=""THEN40500:ELSEOPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",p,r":INPUT#1,W1,I$,W2,W3:CLOSE2:CLOSE1:IFW1>0THEN40975
43950 I$=F$:W1=9999:GOTO23
43999 REM------REL FILE  OPERATOR-------
44000 IFF$=""THEN40500
44100 IFI>0THENOPEN2,U,2,MID$(STR$(D),2)+":"+F$:RECORD#2,I:GOTO44500
44200 OPEN1,U,15
44300 OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,a"
44400 INPUT#1,E:IFE>0THENCLOSE2:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,w"
44500 POKE2850,0:POKE2895,1:O$="{ct k}{ct n}{cyan}:{ct c}":GOSUB4:POKE2847,120:GOSUB6:A$="":IFI$=""THENCLOSE2:CLOSE1:GOTO40500
44600 IFI$=""THEN44900
44625 X=INSTR(I$,"("):Y=INSTR(I$,")")
44650 IFX>1ANDY>X+1ANDY<X+5THENA$=A$+LEFT$(I$,X-1):I$=MID$(I$,X):GOTO44600
44675 IFX=1ANDY>2ANDY<6THENA=VAL(MID$(I$,2,Y-2)):IFA>0THENA$=A$+CHR$(A):I$=MID$(I$,Y+1):GOTO44600
44700 IFXANDYTHENI=X:X=INSTR(MID$(I$,I+1),"("):IFX>ITHEN44650
44750 A$=A$+I$
44900 PRINT#2,A$:CLOSE2:CLOSE1:GOTO40500
44999 REM------SCRATCH  COMMAND---------
45000 X=0:Y=0:IFC=0ORF$=""THEN40900
45025 OPEN1,U,15,"s"+MID$(STR$(D),2)+":sys.work":GOSUB30020:INPUT#1,W1,I$,W2,W3:IFW1>0THENCLOSE2:CLOSE1:GOTO40975
45050 OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,w":INPUT#1,E:IFE>0THEN45900
45100 IFX=ITHENY=1:SYS8213:IFPEEK(253)THEN45500
45150 IFX>0THENPRINT#3,"{ct a}"
45200 GOSUB31:X=X+1:IFPEEK(253)=0THEN45100
45500 INPUT#1,E:CLOSE3:CLOSE2:IFE>0THEN45900
45600 PRINT#1,"s"+MID$(STR$(D),2)+":"+F$:PRINT#1,"r"+MID$(STR$(D),2)+":"+F$+"=sys.work"
45700 IFX=0THENPRINT#1,"s"+MID$(STR$(D),2)+":"+F$:CLOSE1:GOTO40500
45800 CLOSE1:IFY>0THENO$="{cyan}82, link scratched,0,0":GOSUB4:GOTO40500:ELSEO$="{cyan}81,link not found,"+MID$(STR$(I),2)+",0":GOSUB4:GOTO40500
45900 CLOSE2:CLOSE3:O$="disk error, standby...{ct c}":GOSUB4:PRINT#1,"s"+MID$(STR$(D),2)+":sys.work":PRINT#1,"v"+MID$(STR$(D),2):CLOSE1:O$=R$:GOSUB9:GOTO40500
45999 REM------COPY  FILE COMMAND-------
46000 IFI=0THEN40900:ELSEGOSUB46050:IFETHEN40500:ELSE46100
46050 E=0:IFINSTR(F$,",")<>LEN(F$)-1THENE=1:O$="{cyan}80, missing file type,0,0":GOTO4:ELSERETURN
46100 IFU=U0THEN40500
46150 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",r":INPUT#1,E
46175 IFETHENCLOSE2:CLOSE1:O$="{cyan}78, source file error,"+MID$(STR$(E),2)+",0":GOSUB4:GOTO40500
46200 OPEN15,U0,15:OPEN3,U0,3,MID$(STR$(D0),2)+":"+F$+",w":INPUT#15,E
46225 IFE>0THENCLOSE3:CLOSE1:O$="{cyan}79,destination file error,"+MID$(STR$(E),2)+",0":GOSUB4:GOTO40500
46300 A=PEEK(2974):POKE2974,0:POKE255,0:SYS8255:POKE2974,A
46325 CLOSE2:CLOSE3:CLOSE1:CLOSE15:O$="4, copy complete,0,0":GOSUB4:GOTO40500
46999 REM------UPLOAD   A   FILE--------
47000 GOSUB47300:IFE>0THEN40500
47100 O$="{ct k}{cyan}"+O$(23)+" upload: {white}"+F$:GOSUB4:GOSUB500:SLEEP5:GOTO40500
47300 IFI=O(19)ORI>1ORC=0THEN47400
47350 O(19)=I:BLOAD(MID$("px",I+1,1)+"-xfer 1300"),U(D(0,0)),D(D(0,1)):O$(23)="Punter":IFO(19)=1THENO$(23)="Xmodem"
47400 GOSUB46050:IFE>0THENRETURN
47450 I=1:X=INSTR(F$,","):IFX>1THENI$=LEFT$(F$,X-1):I=INSTR("psw",RIGHT$(F$,1)):F$=I$:RETURN:ELSEE=1:RETURN
47499 REM------DOWNLOAD   A  FILE-------
47500 GOSUB47300:IFE>0THEN40500
47600 O$="{ct k}{cyan}"+O$(23)+" download: {white}"+F$:GOSUB4:GOSUB550:GOTO40500
47999 REM------CHANGE  DRIVE NUMS-------
48000 MID$(I$,INSTR(I$,"#"),1)=";":I$="  "+I$:GOSUB40100:IFI<8ORI>30THEN40500
48100 REM
48200 OPEN2,U0,15:SYS8264:A=PEEK(2848):CLOSE2
48300 IFA=0THENO$="{cyan}83, drive exists,"+MID$(STR$(U0),2)+","+MID$(STR$(D0),2):GOSUB4:GOTO40500
48400 O$="{cyan}7, drive number changed,"+MID$(STR$(U0),2)+","+MID$(STR$(D0),2):GOSUB4:OPEN1,U,15,"u0>"+CHR$(U0):CLOSE1:U=U0:D=D0:GOTO40500
48500 I$="  ;"+I$:GOSUB40100:IFI<8ORI>30THEN40500
48600 OPEN2,U0,15:SYS8264:A=PEEK(2848):CLOSE2
48700 IFA>0THENO$="{cyan}84, drive not found,"+MID$(STR$(U0),2)+","+MID$(STR$(D0),2):GOSUB4:GOTO40500
48800 O$="{cyan}9, drive changed,"+MID$(STR$(U0),2)+","+MID$(STR$(D0),2):GOSUB4:U=U0:D=D0:GOTO40500
48999 REM------VIEW RELATIVE  BITS------
49000 IFI=0ORF$=""THEN40500
49100 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$:INPUT#1,W1,I$,W2,W3:CLOSE1:CLOSE2:IFW1>0THEN40975
49200 OPEN2,U,2,"$"+MID$(STR$(D),2):O$=F$:SYS8261:CLOSE2:O$="{ct k}{cyan}record #"+STR$(I)+", bits/record:"+STR$(PEEK(2977)):GOSUB4:POKE2925,0
49300 OPEN2,U,2,MID$(STR$(D),2)+":"+F$:RECORD#2,I:O$=R$:GOSUB4:O$="":W1$="":X=0
49400 DO:GET#2,A$:A=ASC(A$+CHR$(0)):X=X+1:IFA<26ANDST=0THENA$="{reverse on}"+CHR$(A+64)+"{reverse off}"
49500 IFLEN(O$)>200THENW1$=W1$+A$:ELSEO$=O$+A$:IFLEN(O$)=200THENO$=O$+"{ct c}"
49600 LOOPUNTIL(ST):CLOSE2:GOSUB4:IFW1$>""THENO$=W1$:GOSUB4
49700 GOSUB1475:O$="{cyan}8, bits read,"+MID$(STR$(X),2)+",0":GOSUB4:GOTO40500
55555 U=PEEK(186):OPEN1,U,15,"s0:prg.sysop":CLOSE1:DSAVE"prg.sysop",U(U)
