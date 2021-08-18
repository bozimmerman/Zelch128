!--------------------------------------------------
!- Tuesday, August 17, 2021 11:56:52 PM
!- Import of : 
!- c:\tmp\newproject\bnk.first.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:REM*************** BANKING MODULE 1.0 ***********************
30010 U1=U:D1=D:BO=1:F$="bnk.welcome":GOSUB25:FORI=0TO50:VT$(I)="":VT(I)=0:NEXTI
30020 O$="{ct k}Reviewing the records...":GOSUB4
30030 OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.accounts":RECORD#2,ID:
30040 FORI=0TO14:SYS8222:VT$(I)=I$:NEXTI:CLOSE2
30050 OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.records":RECORD#2,1
30060 FORI=1TO11:SYS8222:VT(I)=VAL(I$):NEXTI:I=1:DO:SYS8222:IFPEEK(253)=0THENVT(30+I)=ASC(I$)-192:SYS8222:VT(40+I)=VAL(I$)
30070 I=I+1:LOOPUNTILPEEK(253)ORI$=""ORI=10:CLOSE2
30080 GOTO30500
30090 GOSUB30900
30099 O$="{ct k*2}{purple}o.k.{ct k}":GOSUB4
30100 O$="{ct k}{yellow}Credits:{white}"+STR$(U(2))+"{ct k}{yellow}Your Selection? {white}{ct c}":GOSUB4:GOSUB10:IFI$="0"THENI=10:ELSEIFI$="Q"THEN920:ELSEIFI=0ORI$="?"THEN30500
30110 ONIGOTO31000,32000,33000,34000,35000,36000,37000,38000,30500,40000
30500 F$="bnk.menu":U=U1:D=D1:GOSUB25:GOTO30100
30900 OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.accounts":A$="":FORI=0TO14:A$=A$+VT$(I)+R$:NEXTI:RECORD#2,ID:RECORD#2,ID:PRINT#2,A$:CLOSE2:RETURN
30999 X=9:GOSUB5:I=ABS(INT(VAL(I$))):RETURN
31000 O$="{cyan}{ct k*2}<W>ithdrawl Accounts{ct k}(No withdrawl limits)":GOSUB4
31005 O$="{ct k}{cyan}Interest payed:{white}"+STR$(VT(1))+"%/mn {cyan}(compounded daily)":GOSUB4
31010 O$="{ct k}{cyan}In Your Account:{white}"+STR$(INT(VAL(VT$(1))))+"{cyan} system credits":GOSUB4
31020 O$="{ct k*2}{light blue}Would you like to:{ct k} 1. Remove credits{ct k} 2. Deposit credits{ct k*2}: {white}{ct c}":GOSUB4:GOSUB10:ONIGOTO31030,31500:GOTO30100
31030 O$="{light blue}{ct k}Amount to withdraw ("+STR$(INT(VAL(VT$(1))))+" ): {white}{ct c}":GOSUB4:GOSUB30999:IFI<1ORI>VAL(VT$(1))THEN30100
31040 U(2)=U(2)+I:VT$(1)=STR$(VAL(VT$(1))-I):GOTO30090
31500 O$="{light blue}{ct k}Amount to deposit ("+STR$(U(2))+" ): {white}{ct c}":GOSUB4:GOSUB30999:IFI<1ORI>U(2)THEN30100
31510 U(2)=U(2)-I:VT$(1)=STR$(VAL(VT$(1))+I):GOTO30090
32000 O$="{light blue}{ct k*2}Savings Accounts{ct k}(Daily withdrawl limits)":GOSUB4
32005 O$="{ct k}{light blue}Interest payed:{white}"+STR$(VT(2))+"%/mn {light blue}(compounded daily)":GOSUB4
32010 O$="{ct k}{light blue}In Your Account:{white}"+STR$(INT(VAL(VT$(2))))+"{light blue} system credits":GOSUB4
32020 O$="{ct k*2}{blue}Would you like to:{ct k} 1. Withdraw credits{ct k} 2. Deposit credits{ct k*2}: {white}{ct c}":GOSUB4:GOSUB10:ONIGOTO32030,32500:GOTO30100
32030 A=((INT(VAL(VT$(2))/100)*5)+5)-VAL(VT$(3)):IFA<0THENA=0
32035 O$="{blue}{ct k}Amount to withdraw ("+STR$(INT(A))+" ): {white}{ct c}":GOSUB4:GOSUB30999:IFI<1ORI>ATHEN30100
32040 U(2)=U(2)+I:VT$(2)=STR$(VAL(VT$(2))-I):VT$(3)=STR$(VAL(VT$(3))+I):GOTO30090
32500 O$="{blue}{ct k}Amount to deposit ("+STR$(U(2))+" ): {white}{ct c}":GOSUB4:GOSUB30999:IFI<1ORI>U(2)THEN30100
32510 U(2)=U(2)-I:VT$(2)=STR$(VAL(VT$(2))+I):GOTO30090
33000 O$="{light green}{ct k*2}Savings Bonds{ct k}":GOSUB4
33010 O$="{light green}Price per bond:{white}"+STR$(VT(3)):GOSUB4
33020 O$="{light green}Interest payed:{white}"+STR$(VT(4))+"%/period":GOSUB4
33030 O$="{light green}Holding period:{white}"+STR$(VT(5))+" days":GOSUB4:IFVAL(VT$(12))>0THEN33500
33060 IFVT(3)>0THENA=INT(U(2)/VT(3)):ELSEA=U(2)
33065 O$="{ct k*2}{green}Puchase how many ("+STR$(A)+" ): {white}{ct c}":GOSUB4:GOSUB30999:IFI<1ORI>ATHEN30100
33070 VT$(12)=STR$(VAL(VT$(12))+I):VT$(13)=STR$(VT(5)):VT$(14)=STR$(VT(3)):U(2)=U(2)-(I*VT(3)):GOTO30090
33500 O$="{green}Total bonds owned{space*4}:{white}"+VT$(12):GOSUB4
33510 O$="{green}Days left/this period:{white}"+VT$(13):GOSUB4
33515 O$="{ct k}{white}* {light green}Subsequent purchases resets period!":GOSUB4
33520 IFVAL(VT$(13))<>0THENO$="{ct k}{green}Buy more (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:ONIGOTO33060,30100
33530 O$="{ct k}{green}Period expired!{ct k}Sell back to the system (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN30100
33540 U(2)=U(2)+INT(VAL(VT$(12))*VAL(VT$(14))):VT$(12)="0":VT$(13)="0":VT$(14)="0":GOTO30090
34000 O$="{ct k*2}{green}Credit Exchange{ct k}":GOSUB4
34010 O$="{green}System Credits:{white}"+STR$(U(2)):GOSUB4
34020 O$="{green}Block Credits :{white}"+STR$(U(1)):GOSUB4
34030 O$="{ct k}{green}Exchange Rate :{f7}{white}"+STR$(VT(6))+" {green}Block credits/ {white}1 {green}System credit":GOSUB4
34040 O$="{ct k*2}{light gray}Would you like to:":GOSUB4
34050 O$=" 1. Change SysCreds to BlkCreds":GOSUB4
34060 O$=" 2. Change BlkCreds to SysCreds":GOSUB4
34070 O$=" 3. Send credits to another user":GOSUB4
34080 O$="{ct k}: {white}{ct c}":GOSUB4:GOSUB30999:ONIGOTO34100,34200,34500:GOTO30100
34100 O$="{ct k}{light gray}Change how many? {white}{ct c}":GOSUB4:GOSUB30999:IFI<1ORI>U(2)THEN30100
34110 U(2)=U(2)-I:U(1)=U(1)+INT(I*VT(6)):GOTO30099
34200 O$="{ct k}{light gray}Change how many? {white}{ct c}":GOSUB4:GOSUB30999:IFI<1ORI>U(1)THEN30100
34210 IFVT(6)>0THENU(1)=U(1)-I:U(2)=U(2)+INT(I/VT(6)):GOTO30099:ELSE30099
34500 O$="":GOSUB4:GOSUB8060:IFA=0THEN30100
34510 O$="{ct k}{light gray}Send how many SysCreds? {white}{ct c}":GOSUB4:GOSUB30999:IFI<1ORI>U(2)THEN30100
34520 X=I:U(2)=U(2)-X
34530 OPEN2,D(4,0),2,MID$(STR$(D(4,1)),2)+":sys.userfiles":RECORD#2,A
34540 A$="":FORI=1TO6:SYS8222:A$=A$+I$+R$:NEXTI
34550 FORI=1TO4:GET#2,I$:A$=A$+CHR$(ASC(I$+CHR$(0))):NEXTI
34560 FORI=1TO2:SYS8222:A$=A$+I$+R$:NEXTI
34570 FORI=1TO4:GET#2,I$:A$=A$+CHR$(ASC(I$+CHR$(0))):NEXTI
34580 SYS8222:A$=A$+I$+R$:SYS8222:A$=A$+STR$(VAL(I$)+X)+R$
34590 FORI=1TO4:SYS8222:A$=A$+I$+R$:NEXTI
34600 RECORD#2,A:RECORD#2,A:PRINT#2,A$:CLOSE2:GOTO30099
35000 O$="{ct k*2}{light gray}Appropriations Office":GOSUB4
35010 IFVAL(VT$(4))=0THENO$="{ct k}(No system set up currently)":GOSUB4:GOTO35100
35020 O$="{ct k*2}ID numbers: {white}"+VT$(4):GOSUB4
35030 O$="{light gray}From{space*6}: {white}":IFLEFT$(VT$(5),1)="0"THENO$=O$+"Personal Credits":ELSEIFLEFT$(VT$(5),1)="1"THENO$=O$+"W-Account":ELSEO$=O$+"Savings Account"
35040 GOSUB4:O$="{light gray}Amount{space*4}:{white}"+VT$(6)+" {light gray}credits":GOSUB4
35050 O$="{light gray}Frequency :{white}"+VT$(7)+" {light gray}days":GOSUB4
35100 O$="{ct k}{pink}Would you like to:{ct k} 1. Set up a new appropriation{ct k} 2. Remove any existing system{ct k} 3. See appropriation help file{ct k*2}: {white}{ct c}":GOSUB4
35110 GOSUB30999:ONIGOTO35200,35700,35120:GOTO30100
35120 F$="bnk.apphelp":GOSUB25:GOTO35100
35200 O$="{ct k*2}{pink}Enter the ID numbers of the users to{f7}send credits to (remember the ';'s).{ct k}: {white}{ct c}":GOSUB4:X=250:GOSUB5:IFI$=""ORVAL(I$)=0THEN30100:ELSEVT$(4)=I$
35210 O$="{ct k}{pink}Send credits from your P)erson,{f7}W)Account, or S)avings (P/W/S)? {white}{ct c}":GOSUB4:C$="PWS":GOSUB28:VT$(5)=MID$(STR$(I-1),2,1)
35220 O$="{ct k}{pink}Amount (in system credits) to send: {white}{ct c}":GOSUB4:GOSUB30999
35225 IFI<1THEN30100:ELSEIFI>5ANDVT$(5)="2"THENO$="{red}Max 5 cred app. for Savings.":GOSUB4:GOTO35220:ELSEVT$(6)=STR$(I)
35230 O$="{ct k}{pink}How often (in days) does this happen? {white}{ct c}":GOSUB4:GOSUB10:IFI<1ORI>900THEN30100:ELSEVT$(7)=STR$(I)
35240 GOTO30090
35700 O$="{ct k*2}{pink}Remove your appropriation (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN35100:ELSEVT$(4)="0":VT$(5)="0":VT$(6)="0":VT$(7)="0":GOTO30090
36000 O$="{ct k}{pink}For Sale:{ct k*2}":GOSUB4
36010 IFVT(8)THENO$="{pink}System Newsfile{space*5}:{white}{ct c}"+STR$(VT(8))+" {pink}credits":GOSUB4
36020 IFVT(9)THENO$="{pink}System time{space*9}:{white}"+STR$(VT(9))+"{pink} creds/min":GOSUB4
36030 IFVT(10)THENO$="{pink}Another call/today{space*2}:{white}"+STR$(VT(10))+" {pink}credits":GOSUB4
36040 IFVT(11)THENO$="{pink}Your own vote topic :{white}"+STR$(VT(11))+" {pink}credits":GOSUB4
36050 X=1
36060 IFVT(30+X)THENO$="{ct k}{pink}Access: {white}"+CHR$(VT(30+X)+192)+"{space*10}{pink}Cost:{white}"+STR$(VT(40+X))+" {pink}credits":GOSUB4
36070 IFVT(30+X)THENO$="{pink}Time/call:{white}"+STR$(CD(VT(30+X),1))+"{space*6}{pink}Calls/day:{white}"+STR$(CD(VT(30+X),0)):GOSUB4
36080 X=X+1:IFX<9THEN36060
36100 O$="{ct k*2}{purple}Would you like a:{ct k}":GOSUB4
36110 IFVT(8)THENO$="N)ewsfile":GOSUB4
36120 IFVT(9)THENO$="T)ime increase/this call":GOSUB4
36130 IFVT(10)THENO$="C)all for use today":GOSUB4
36140 IFVT(11)THENO$="V)ote topic of your own":GOSUB4
36150 O$="A)n access level change":GOSUB4
36160 O$=": {white}{ct c}":GOSUB4:C$="NTCVA"+R$:GOSUB28:IFI<5ANDVT(7+I)=0THEN30100:ELSEIFI<5ANDU(2)<VT(7+I)THENO$="{ct k}{red}You do not have enough credits!":GOSUB4:GOTO30100
36170 ONIGOTO36200,36300,36400,36500,36600,30100
36200 O$="{ct k}{purple}Purchase a newsfile (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN30100
36210 U(2)=U(2)-VT(8):O$="newsfile":GOSUB36900:GOTO36800
36300 O$="{ct k}{purple}Purchase how much time: {white}{ct c}":GOSUB4:GOSUB10:IFI<1ORI>INT(U(2)/VT(9))THEN30100:ELSEIFPEEK(2825)+I>255THEN36300
36310 POKE2825,PEEK(2825)+I:U(2)=U(2)-(VT(9)*I):GOTO30099
36400 O$="{ct k}{purple}Purchase how many calls: {white}{ct c}":GOSUB4:GOSUB10:IFI<1ORI>INT(U(2)/VT(10))THEN30100
36410 U(2)=U(2)-(VT(10)*I):U(6)=U(6)-I:GOTO30099
36500 O$="{ct k}{purple}Purchase a vote topic (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN30100
36510 U(2)=U(2)-VT(11):O$="vote topic":GOSUB36900:GOTO36800
36600 O$="{ct k}{purple}Purchase which access level (A-Z): {white}{ct c}":GOSUB4:X=1:GOSUB5:IFI$=""THEN30100
36610 Y=0:FORI=1TO9:IFVT(30+I)=ASC(I$)-192THENY=I
36620 NEXTI:IFY=0THENO$="{ct k}{red}That access level is not for sale!":GOSUB4:GOTO30100
36630 IFU(2)<VT(40+Y)THENO$="{ct k}{red}You do not have enough credits!":GOSUB4:GOTO30100
36640 U(2)=U(2)-VT(40+Y):U$(5)=I$:GOTO30099
36800 O$="{ct k*2}{purple}{space*2}The bank operator has been notified{f7}of your purchase.":GOSUB4
36810 O$="You will be contacted when the Bank{f7}Operator is able to arrange":GOSUB4
36820 O$="the products delivery with the{f7}SysOp(s).":GOSUB4
36830 GOTO30100
36900 GOSUB400:OPEN1,D(5,0),15:OPEN2,D(5,0),2,MID$(STR$(D(5,1)),2)+":mail."+STR$(BO)+",s,w":INPUT#1,E
36910 IFETHENCLOSE2:OPEN2,D(5,0),2,MID$(STR$(D(5,1)),2)+":mail."+STR$(BO)+",s,a":PRINT#2,"{ct a}"
36920 PRINT#2,"BANK USER"+R$+STR$(ID)+R$+O$(3)+R$+"{white}"
36930 PRINT#2,R$+"Bank system user "+U$(1)+" {f7}(ID#"+STR$(ID)+") has paid in full"
36940 PRINT#2,"the sum necessary to purchase{f7}one (1) "+O$+" for his use."
36950 PRINT#2,R$+"Subject to SysOp approval, it is your{f7}duty to acquire the specifics of the"
36960 PRINT#2,O$+" from the user, and make sure{f7}it is delivered exactly as specified."
36970 PRINT#2,R$+"You may hit (R) now to ask the user{f7}about the said specifics and inform"
36980 PRINT#2,"the user that the product is soon to{f7}be delivered."
36990 CLOSE2:CLOSE1:RETURN
37000 O$="{ct k}{purple}Feedback to the Bank Operator (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN30100
37010 A=BO:GOSUB8120:GOTO30100
38000 O$="{ct k*2}{pink}Loans Office.{ct k*2}":GOSUB4
38005 IFVAL(VT$(8))<>0THEN38500
38010 U=U1:D=D1:W5=INT(U(2)+(U(4)*2)+(U(5)*2)+VAL(VT$(0))+VAL(VT$(1))+VAL(VT$(2)))
38020 O$="{pink}Your credit rating:{white}"+STR$(W5):GOSUB4
38025 O$="{pink}Loan interest rate:{white}"+STR$(VT(7))+"%":GOSUB4
38030 O$="{ct k}{pink}Apply for a loan (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN30100
38040 OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.blacklist,s,r":Y=0:DO:SYS8222:IFI$=U$(3)THENY=1:EXIT
38050 LOOPUNTILPEEK(253):CLOSE2:IFYTHENO$="{ct k*2}{pink}Sorry, you have been blacklisted{f7}by the Bank Operator.":GOSUB4:GOTO30100
38070 F$="bnk.loanapp":GOSUB25
38080 O$="{ct k*2}{pink}Amount to apply for: {white}{ct c}":GOSUB4:GOSUB30999:IFI<1THEN30100
38090 W1=I:O$="{pink}{ct k}Payment plan (not including interest):{ct k} 1. 17% payed monthly{ct k} 2. 9% payed bi-monthly{ct k} 3. 5% payed weekly{ct k} 4. 1% payed daily{ct k}: {white}{ct c}":GOSUB4
38100 GOSUB10:IFI<1ORI>4THEN30100:ELSEW2=I
38120 O$="{ct k}{purple}Amount to receive:{white}"+STR$(W1):GOSUB4
38130 O$="{purple}Payment plan numb:{white}"+STR$(W2):GOSUB4
38140 O$="{purple}Total interest{space*3}:{white}"+STR$(VT(7))+"%":GOSUB4:ONW2GOSUB38151,38152,38153,38154
38145 O$="{purple}Payments due{space*5}:{white} "+A$:GOSUB4
38150 O$="{purple}Payment amount(s):{white}"+STR$(INT(A*W1)):GOSUB4:GOTO38160
38151 A$="On the 1st of every month":A=.17:RETURN
38152 A$="The 1st and 15th monthly":A=.09:RETURN
38153 A$="The 1st,8th,17th,24th monthly":A=.05:RETURN
38154 A$="Every day":A=.01:RETURN
38160 O$="{ct k}{red}* {pink}Payments automatically withdrawn.":GOSUB4
38170 O$="{red}* {pink}Severe penalties for insufficient funds.":GOSUB4
38180 O$="{ct k*2}{purple}Accept these terms (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN30100
38200 IFW1<=W5THENU(2)=U(2)+W1:VT$(8)=STR$(W1)
38205 VT$(9)="0":VT$(10)=RIGHT$(STR$(W2),1)+"; 0":VT$(11)="0":IFW1<=W5THEN30090
38210 O$="{ct k}{dark gray}!!Amount over credit! Subject to{f7}Bank Operator Approval!":GOSUB4
38220 O$="{purple}Your loan will automatically begin{f7}after BankOp approves.":GOSUB4
38230 OPEN2,U1,2,MID$(STR$(D2),2)+":bnk.records":Y=1:DO:Y=Y+1:RECORD#2,Y
38240 SYS8222:LOOPUNTILI$="^"ORI$="{pound}"
38250 RECORD#2,Y:RECORD#2,Y
38260 O$="{ct k}{purple}Enter a one line reason for this loan:{ct k}: {white}{ct c}":GOSUB4:X=80:GOSUB5
38270 PRINT#2,STR$(ID)+R$+STR$(W1)+R$+STR$(W5)+R$+STR$(U(4))+R$+STR$(U(5))+R$+U$(6)+R$+U$(5)+R$+I$+R$:CLOSE2:GOTO30090
38500 O$="{ct k}{purple}Amount received{space*3}:{white}"+VT$(8):GOSUB4
38510 O$="{purple}Debts currently{space*3}:{white}"+VT$(9)
38520 ONVAL(VT$(10))GOSUB38151,38152,38153,38154
38530 O$="{purple}Payments due{space*6}:{white} "+A$:GOSUB4
38540 O$="{purple}Payed to date{space*5}:{white}"+STR$(INT(VAL(MID$(VT$(10),INSTR(VT$(10),";")+1)))):GOSUB4
38550 GOTO30100
40000 IFID<>BOTHEN30100:ELSE40600
40010 O$="{ct k*2}{yellow}Bank Operator{ct k}":GOSUB4
40020 O$="{yellow}1. Checking interest{space*3}:{white}"+STR$(VT(1))+"%":GOSUB4
40030 O$="{yellow}2. Savings interest{space*4}:{white}"+STR$(VT(2))+"%":GOSUB4
40040 O$="{yellow}3. Bonds data{space*10}:{white}"+STR$(VT(3))+"/"+STR$(VT(4))+"%/"+STR$(VT(5))+" days":GOSUB4
40050 O$="{yellow}4. Credit exchange rate:{white}"+STR$(VT(6))+" blks per 1 SysCred":GOSUB4
40060 O$="{yellow}5. Loans interest rate :{white}"+STR$(VT(7))+"%":GOSUB4
40070 O$="{yellow}6. Price- Newsfile{space*5}:{white}":I=VT(8):GOSUB40075:GOTO40080
40075 IFI=0THENO$=O$+" NOT FOR{sh space}SALE":GOTO4:ELSEO$=O$+STR$(I):GOTO4
40080 O$="{yellow}7. Price- TIME/MIN{space*5}:{white}":I=VT(9):GOSUB40075
40090 O$="{yellow}8. Price- CALL/DAY{space*5}:{white}":I=VT(10):GOSUB40075
40100 O$="{yellow}9. Price- Vote Topic{space*3}:{white}":I=VT(11):GOSUB40075
40110 FORI=30TO39:IFVT(I)=0THEN40130
40120 O$="{yellow}"+CHR$(VT(I)+192)+". Access. Price{space*7}:{white}"+STR$(VT(I+10)):GOSUB4
40130 NEXTI:O$="{yellow}*. Add an access level":GOSUB4
40135 O$="{yellow}{ct k}Option: {white}{ct c}":GOSUB4:GOSUB10:IFI$=""ORLEN(I$)>1THEN40500
40140 IFI>0ANDI<10THENONIGOTO40200,40210,40220,40280,40290,40300,40310,40320,40330
40150 Y=0:FORI=30TO39:IFCHR$(VT(I)+192)=I$THENY=I
40160 NEXTI:IFYORI$="*"THEN40400:ELSE40010
40170 O$="{ct k}{light green}New interest: {white}{ct c}":GOSUB4:GOSUB10:IFI<0THENI=0:RETURN:ELSERETURN
40180 O$="{ct k}{light green}New price (0=not for sale): {white}{ct c}":GOSUB4:GOSUB30999:IFI<0THENI=0:RETURN:ELSERETURN
40200 GOSUB40170:VT(1)=I:GOTO40010
40210 GOSUB40170:VT(2)=I:GOTO40010
40220 O$="{ct k}{light green}New bond price: {white}{ct c}":GOSUB4:GOSUB30999:IFI<0THEN40010:ELSEVT(3)=I
40230 GOSUB40170:VT(4)=I
40240 O$="{light green}{ct k}Number of days to hold: {white}{ct c}":GOSUB4:GOSUB10:IFI<0THEN40010:ELSEVT(5)=I:GOTO40010
40280 O$="{light green}{ct k}BlkCred exchange rate/SysCred: {white}{ct c}":GOSUB4:GOSUB10:IFI<0THEN40010:ELSEVT(6)=I:GOTO40010
40290 GOSUB40170:VT(7)=I:GOTO40010
40300 GOSUB40180:VT(8)=I:GOTO40010
40310 GOSUB40180:VT(9)=I:GOTO40010
40320 GOSUB40180:VT(10)=I:GOTO40010
40330 GOSUB40180:VT(11)=I:GOTO40010
40400 IFI$="*"THENY=0:FORI=30TO39:IFVT(I)=0THENY=I
40410 IFI$="*"THENNEXTI:IFY=0THENO$="{ct k}No room for more.":GOSUB4:GOTO40010
40420 O$="{ct k}{light green}New access level (A-Z,!=delete): {white}{ct c}":GOSUB4:X=1:GOSUB5:IFI$=""THEN40010:ELSEIFI$="!"THENVT(Y)=0:GOTO40010
40425 I=ASC(I$):IFI<193ORI>218THEN40010:ELSEVT(Y)=I-192
40430 O$="{light green}New price: {white}{ct c}":GOSUB4:GOSUB30999:IFI<0THEN40010:ELSEVT(Y+10)=I:GOTO40010
40500 O$="{ct k*2}{yellow}Save changes (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN30100
40510 OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.records":RECORD#2,1
40520 A$="":FORI=1TO11:A$=A$+STR$(VT(I))+R$:NEXTI:FORI=30TO39:IFVT(I)>0THENA$=A$+CHR$(VT(I)+192)+R$+STR$(VT(I+10))+R$
40530 NEXTI:RECORD#2,1:PRINT#2,A$:CLOSE2:GOTO30100
40600 O$="{ct k*2}{yellow}Checking records...":GOSUB4:Y=2
40610 OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.records"
40620 RECORD#2,Y:SYS8222:IFVAL(I$)THENX=VAL(I$):SYS8222:ELSEY=Y+1:IFPEEK(253)ORI$="{pound}"THENCLOSE2:GOTO40010:ELSE40620
40625 IFVAL(I$)<0THEN40800
40630 O$="{ct k}{yellow}Loan Application.{ct k}Handle: {white}"+UI$(X)+" {yellow}ID#"+STR$(X):GOSUB4:W1=VAL(I$)
40640 :::::::O$="{ct k}{yellow}Amount involved :{white}"+I$:GOSUB4
40650 SYS8222:O$="{yellow}Credit rating{space*3}:{white}"+I$:GOSUB4
40660 SYS8222:O$="{yellow}Posts total{space*5}:{white}"+I$:GOSUB4
40670 SYS8222:O$="{yellow}Email total{space*5}:{white}"+I$:GOSUB4
40680 SYS8222:O$="{yellow}Last called{space*5}: {white}"+I$:GOSUB4
40690 SYS8222:O$="{yellow}Access level{space*4}: {white}"+I$:GOSUB4
40700 SYS8222:O$="{yellow}Reason: {white}"+I$:GOSUB4
40710 O$="{ct k}{yellow}A)pprove, D)ecline, B)lacklist: {white}{ct c}":GOSUB4:C$="ADE":GOSUB28
40720 IFI=2THENRECORD#2,Y:RECORD#2,Y:PRINT#2,"^":Y=Y+1:GOTO40620
40730 IFI=1THENRECORD#2,Y:RECORD#2,Y:PRINT#2,"^":Y=Y+1:CLOSE2:GOTO40760
40740 O$="{ct k}{yellow}Enter real name EXACTLY{ct k}: {white}{ct c}":GOSUB4:X=16:GOSUB5:OPEN1,U1,15:OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.blacklist,s,w":INPUT#1,E:IFE=0THEN40750
40745 CLOSE2:OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.blacklist,s,a"
40750 PRINT#2,I$:CLOSE2:GOTO40620
40760 OPEN2,U1,2,MID$(STR$(D1),2)+":bnk.accounts":RECORD#2,X:SYS8222:A$=I$+R$:SYS8222:A$=A$+STR$(VAL(I$)+W1)+R$:FORI=2TO7:SYS8222:A$=A$+I$+R$:NEXTI
40770 SYS8222:A$=A$+STR$(W1)+R$:FORI=9TO14:SYS8222:A$=A$+I$+R$:NEXTI:RECORD#2,X:RECORD#2,X:PRINT#2,A$:CLOSE2:GOTO40610
40800 O$="{ct k*2}{yellow}Announcement.{ct k}Handle: {white}"+UI$(X)+" {yellow}ID#"+STR$(X)":gosub4
40810 O$="{ct k}Has gone into debt to the bank for the sum of:{white}"+STR$(ABS(VAL(I$))):GOSUB4
40820 O$="{ct k*2}{yellow}H)old, or E)rase: {white}{ct c}":GOSUB4:C$="HE":GOSUB28:IFI=1THENY=Y+1:GOTO40620:ELSERECORD#2,Y:RECORD#2,Y:PRINT#2,"^":Y=Y+1:GOTO40620
55554 PRINTCHR$(27)"s";:GOTO30010
55555 U=PEEK(186):OPEN1,U,15,"s0:bnk.first":CLOSE1:DSAVE"bnk.first",U(U)
