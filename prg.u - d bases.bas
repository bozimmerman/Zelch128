!--------------------------------------------------
!- Wednesday, May 17, 2017 12:22:04 AM
!- Import of : 
!- c:\src\zelch128next\prg.u - d bases.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:REM ============ TRANSFER BASE MODULE V3.0 =========== 01/13/95
30010 ON(W1-200)GOTO31000,32000,33000,34000,35000,36000,37000,38000,39000,40000,41000:GOTO940
30050 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.ubases"+UB$(3):RETURN
30070 OPEN2,D(8,0),2,MID$(STR$(D(8,1)),2)+":sys.dir-"+UB$(3)+UB$(2):RETURN
30080 OPEN2,D(8,0),2,MID$(STR$(D(8,1)),2)+":sys.dir-"+UB$(3)+UB$(2)+",l,"+CHR$(39+UB(5)):RECORD#2,1:PRINT#2,"{pound}":RECORD#2,1:RETURN
30099 REM ------ >>> * MISC. ROUTINES * <<< ------
30100 RECORD#2,Y:SYS8222:O$=I$:SYS8222:C$=I$:SYS8222
30150 E=0:IFI$=""ORI$="*"THEN30300:ELSEIFINSTR(";"+I$+";",";"+MID$(STR$(ID),2)+";")THEN30300
30200 E=1:X=0:DO:X=X+1:Y=ASC(MID$(I$,X,1))-192:IFY>1ANDY<26THENIFMID$(U$(9),Y,1)="1"THENE=0
30250 LOOPUNTILX=LEN(I$)ORE=0
30300 IFMID$(C$,ASC(U$(5))-192,1)<>"1"THENE=1:RETURN:ELSERETURN
30350 O$="{ct k}{black}No transfer base selected.":GOTO4
30400 UB$(1)="(none)":UB$(2)="?":UB$(5)="$":UB$(9)="":FORI=1TO9:UB(I)=0:NEXTI:RETURN
30420 GOSUB30750:W2=PEEK(2856)+256*PEEK(2857):CLOSE2
30440 E=0:IFW1>0ANDW2<UB(2)ANDW2>0ANDD1THENE=1:RETURN:ELSEIFW1=0ORW2=0THENO$=T$(72):GOSUB4:OPEN1,U,15,"v"+MID$(STR$(D),2):CLOSE1:E=1:RETURN
30460 IFD1=0THENRETURN:ELSEU(1)=INT(U(1)+(W1*UB(3))):IFUB$(5)<>"{sh @}"THENRETURN:ELSEOPEN1,D(8,0),15:GOSUB30070:INPUT#1,E:IFETHENCLOSE2:GOSUB30080
30470 X=1:IFETHENX=UB(9)
30480 RECORD#2,X:PRINT#2,F$R$MID$("psp",I,1)R$MID$(STR$(W1),2)R$MID$(STR$(ID),2)R$LEFT$(O$(3),8)R$UB$(8)R$;:RECORD#2,X:CLOSE2:CLOSE1:E=0:RETURN
30499 REM --- *** FILENAME
30500 GOSUB990:W1$="":W2=16:D1=(SY$="#"):IFD1ANDUB$(5)="$"THENF$="":GOTO30350:ELSEIFO(19)=5THENF$="{black}":GOSUB990:Y=1:GOTO30660
30510 IFSY$<>"*"ANDSY$<>"#"THENI$=SY$:GOTO30600
30520 IFD1THENU=D(8,0):D=D(8,1):FORI=1TO3:GOSUB990:NEXTI:IFUB$(5)="0"THENW1$=UB$(2):W2=15
30540 O$=T$(68):GOSUB4:X=W2:GOSUB16:FORI=1TO6:IFINSTR(I$,MID$("*?:,$;",I,1))THENI$=""
30550 NEXTI:F$=I$:IFF$=""THEN30680:ELSEIFD1=0ORUB$(5)<>"{sh @}"ORW1=203THEN30600
30560 OPEN1,D(8,0),15:GOSUB30070:INPUT#1,E:IFETHEN30680:ELSEY=VAL(I$):X=Y:IFX=0THENX=1:GOSUB30690:F$=I$
30565 RECORD#2,X:C=ST:IFC=0ANDDS<>50THENSYS8222
30570 IF(C)ORDS=50ORI$="{pound}"OR(I$="^"ANDX=Y)THENO$=T$(16):GOSUB4:F$="":GOTO30680
30575 IFX<>YTHENGOSUB30690:IFF$=I$THENY=X
30580 IFX=YTHENF$=I$:SYS8222:Y=INSTR("psw",I$):GOTO30680
30590 X=X+1:IFX<UB(4)ORUB(4)<1THEN30565:ELSEO$=T$(16):GOSUB4:F$="":GOTO30680
30600 GOSUB30690:F$=W1$+I$:IFD1=0THENGOSUB990:IFSY$<>"*"THENY=VAL(SY$):GOTO30660
30640 O$=T$(69):GOSUB4:C$="PSW"+R$:GOSUB28:Y=I:IFI=4THENY=0:GOTO30680
30660 IFD1=0THENGOSUB8010:ELSEU=D(8,0):D=D(8,1)
30680 I=Y:E=0:CLOSE2:CLOSE1:RETURN
30690 FORI=1TOLEN(I$):A=ASC(MID$(I$,I,1)):IFA>192ANDA<219THENMID$(I$,I,1)=CHR$(AAND127)
30695 NEXTI:RETURN
30699 REM ---- ** CHECK THE FILE
30700 E=0:OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+","+MID$("psp",I,1)+",r":INPUT#1,E,E$:GET#2,A$:IFST>0ANDE=0THENE=63
30720 CLOSE2:CLOSE1:RETURN
30730 O$="{ct k}{black}ERROR: "+E$+"!":GOSUB4
30740 IFO(1)=1THENO(1)=0:GOTO600:ELSE940
30750 OPEN2,U,0,"$"+MID$(STR$(D),2)+":"+F$:SYS8225:W1=PEEK(2854)+256*PEEK(2855):RETURN
30800 A=I:O$=T$(78):GOSUB4:C$="XL"+R$:GOSUB28
30820 X=0:IFI=1THENO$=T$(71):X=1:ELSEIFI=2THENO$=T$(115):GOSUB4:O(1)=1
30840 I=1:RETURN
30850 PRINTCHR$(27)"@{yellow}Upload: {white}"F$","MID$("psp",I,1):O$="    Upload: "+F$:GOSUB7:GOTO500
30860 PRINTCHR$(27)"@{yellow}Download: {white}"F$","MID$("psp",I,1):O$="  Download: "+F$:GOSUB7:GOTO550
30870 O$=T$(71):GOSUB4:OPEN1,U,15,"s"+MID$(STR$(D),2)+":"+F$:CLOSE1
30880 IFO(1)THENO(1)=0:GOTO600:ELSEIFETHEN920:ELSE940
30999 REM ------ >>> * SELECT UBASE OPCODE * <<< ------
31000 GOSUB990:IFSY(4)>0ANDSY(4)<27THENW0$=CHR$(SY(4)+192):SY(4)=0:GOTO31050:ELSEIFSY$<>"*"THENW0$=SY$:GOTO31050
31025 O$=T$(65):GOSUB4:X=12:GOSUB16:IFI$=""THEN920:ELSEW0$=I$
31050 GOSUB31150:IFE>0THENO$=T$(66):GOSUB4:GOTO920:ELSEO$=O$(10)+":UD"+W0$:GOSUB7:GOTO940
31100 REM ---- SELECT A BASE ----
31150 E=0:IFLEFT$(W0$,1)="/"ORW0$=""THENUB$(3)="":UB$(4)="TRANSFER BASES":GOSUB30400:W0$=MID$(W0$,2)
31200 IFW0$=""THEN31650:ELSEOPEN1,D(1,0),15
31250 W0=0:DO:W0=W0+1:W5$=MID$(W0$,W0,1):IFW5$="/"THEN31600
31300 W5=ASC(W5$)-192:IFW5>0ANDW5<27THEN31350:ELSEW5=VAL(MID$(W0$,W0)):IFW5<1ORW5>26ORVAL(W5$)=0THEN31600:ELSEW5$=CHR$(W5+192):IFW5>9THENW0=W0+1
31350 GOSUB30050:RECORD#2,W5:FORI=1TO10:SYS8222:VT$(I)=I$:VT(I)=VAL(I$):NEXT:W1$=LEFT$(VT$(1),1):VT$(1)=MID$(VT$(1),2)
31400 C$=VT$(2):I$=VT$(3):GOSUB30150:IFE>0THEN31600
31450 IFINSTR("0{sh @}",W1$)THENUB$(5)=W1$:EXIT:ELSEIFW1$<>"$"THENE=1:GOTO31600
31500 CLOSE2:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.ubases"+UB$(3)+W5$:INPUT#1,E:IFE>0THEN31600
31550 UB$(3)=UB$(3)+W5$:UB$(4)=VT$(1):GOSUB30400
31600 CLOSE2:LOOPUNTILW0>=LEN(W0$)ORE>0ORUB$(5)<>"$":CLOSE2:CLOSE1
31650 IFE>0THENRETURN:ELSEIFUB$(5)="$"THENW5$=UB$(3):GOTO31750
31700 UB(1)=W5:UB$(1)=VT$(1):UB$(2)=W5$:D(8,0)=VT(4):D(8,1)=VT(5):UB(2)=VT(9):UB(3)=VT(7):UB(4)=VT(6):UB(5)=VT(8):W5$=UB$(3)+W5$
31750 IFUB$(3)>""ORUB$(2)<>"$"THENO$=T$(67):GOSUB4:F$="sys.u/d "+W5$:U=D(8,0):D=D(8,1):GOSUB26
31800 UB$(9)="":IFINSTR(";"+VT$(10)+";",";"+MID$(STR$(ID),2)+";")ORMID$(U$(8),4,1)="1"THENUB$(9)="{sh @}"
31850 IFUB$(5)="$"THEN30350:ELSERETURN
31999 REM ------ >>> * LIST UDS OPCODE * <<< ------
32000 W7$="":IFSY(4)>0THENW7$="{sh @}"
32050 W1=0:GOSUB760:IFI>0ANDI<27THENW1=I-1:IFVAL(SY$)THENW7$="{sh @}"
32100 W9=26:GOSUB760:IFI>W1ANDI<27THENW9=I
32150 GOSUB30050:O$=R$:GOSUB9:DO:W1=W1+1:Y=W1:GOSUB30100:W1$=O$
32200 O$="{ct c}":A$=CHR$(W1+192):IFW7$="{sh @}"THENA$=RIGHT$(STR$(W1),2)
32250 IFETHEN32400:ELSEO$="{black}"+A$+") "
32300 IFW1<>UB(1)THENO$=O$+" "+MID$(W1$,2)+" ":GOTO32350:ELSEO$=O$+"<"+MID$(W1$,2)+">"
32350 IFLEFT$(W1$,1)="$"THENO$=O$+" {white}[DIR]"
32400 GOSUB4:GOSUB8:LOOPUNTILW1=W9ORA$=" ":CLOSE2:IFA$=" "THEN920:ELSE940
32999 REM ------ >>> * UPLOAD FILE(S) * <<< ------
33000 GOSUB30500:IFF$=""ORI=0THEN920:ELSEIFO(19)<>5THENGOSUB30700:IFE<>62THEN30730
33050 IFD1=0ORUB(4)=0THEN33300:ELSEW1$="*":IFUB$(5)="0"THENW1$=UB$(2)+"*":ELSEIFUB$(5)="{sh @}"THEN33150
33100 POKE253,0:OPEN2,U,0,"$"+MID$(STR$(D),2)+":"+W1$:SYS8228:CLOSE2:W1=PEEK(2858)+256*PEEK(2859):GOTO33300
33150 OPEN1,U,15:GOSUB30070:INPUT#1,E:IFETHENCLOSE2:GOSUB30080
33160 UB(9)=0:W1=0:X=1:DO:RECORD#2,X:SYS8222:IFPEEK(253)=0ANDI$<>"{pound}"THENW1=W1+1:IFI$="^"THENW1=W1-1:IFUB(9)=0THENUB(9)=X
33200 X=X+1:LOOPUNTILPEEK(253)ORI$="{pound}":INPUT#1,E:CLOSE2:CLOSE1:IFUB(9)=0THENUB(9)=X-1
33250 IFW1>=UB(4)THENO$=T$(109):GOSUB4:GOTO920
33300 IFO(19)=5THEN33500:ELSEIFD1ANDUB$(5)="{sh @}"THENO$=T$(110):GOSUB4:X=UB(5):GOSUB5:UB$(8)=I$:IFI$=""THENUB$(8)="(none)"
33350 GOSUB30800:IFXTHENO(1)=0:GOTO920:ELSEO$=T$(70):GOSUB4:GOSUB30850
33400 SLEEP5:IFETHEN30870
33420 GOSUB30700:IFETHEN30870
33440 GOSUB30420:IFETHEN30870:ELSE30880
33499 REM ----- MULTI-UPLOAD
33500 GOSUB30800:IFXTHEN33997:ELSEO$=T$(75):GOSUB4:D0=W1
33550 TI$="000000
33600 GET#5,A$:GETB$:IFA$="{ct x}"ORB$="{ct x}"ORVAL(TI$)>40ORPEEK(2827)THENO$=T$(71):GOSUB4:GOTO33997
33650 IFA$<>"{ct i}"THEN33600:ELSEF$="":TI$="000000":IFPEEK(2827)THEN600
33670 GET#5,A$:GETB$:IFA$="{ct x}"ORB$="{ct x}"ORVAL(TI$)>40ORPEEK(2827)THENO$=T$(71):GOSUB4:GOTO33997
33690 IFA$="{ct i}"ORA$=""THEN33670:ELSEIFA$="{ct d}"THENSLEEP5:GOTO30880
33700 IFA$<>R$THENF$=F$+A$:GOTO33670:ELSEIFINSTR(F$,",")<>LEN(F$)-1)THEN30880
33770 UB$(8)="(none)":IFD1ANDUB$(5)="0"THENF$=UB$(2)+F$
33800 GOSUB30700:IFE=0ORE=63THEN30870
33820 GOSUB30850:IFETHEN30870
33840 GOSUB30420:IFETHEN30870
33860 D0=D0+1:IFD0>UB(4)THEN30870
33880 IFD1=0ORUB$(5)<>"{sh @}"THEN33550:ELSEOPEN1,U,15:GOSUB30070:INPUT#1,E:IFETHENCLOSE2:GOSUB30080
33885 X=UB(9):UB(9)=0:DO:RECORD#2,X:SYS8222:IFPEEK(253)=0ANDI$="^"ANDUB(9)=0THENUB(9)=X
33890 X=X+1:LOOPUNTILPEEK(253)ORI$="{pound}"ORUB(9):INPUT#1,E:CLOSE2:CLOSE1:IFUB(9)=0THENUB(9)=X-1
33900 GOTO33550
33997 O(1)=0:GOTO920
33999 REM ------ >>> * DOWNLOAD FILE(S) * <<< ------
34000 GOSUB30500:IFF$=""ORI=0THEN920:ELSEIFO(19)=5THEN34500:ELSEGOSUB30700:IFETHEN30730
34050 GOSUB30750:CLOSE2:CLOSE1:IFD1ANDU(1)<W1THENO$=T$(73):GOSUB4:GOTO920
34100 IFD1=0ORUB$(5)<>"{sh @}"THEN34300
34150 OPEN1,U,15:GOSUB30070:INPUT#1,E:IFETHEN34300
34200 X=1:DO:RECORD#2,X:SYS8222:X=X+1:LOOPUNTILPEEK(253)ORI$=F$ORI$="{pound}"
34250 IFI$=F$THENSYS8222:SYS8222:SYS8222:O$="{ct k}{black}Filename: "+F$+"{ct k}{black}Sent/ID#: "+I$:SYS8222:O$=O$+"{ct k}{black}Date Upl: "+I$:SYS8222:O$=O$+"{ct k}{black}Descript: "+I$+"{ct k}":GOSUB4
34300 CLOSE2:CLOSE1:GOSUB30800:IFXTHENO(1)=0:GOTO920
34350 O$=T$(74):GOSUB4:GOSUB30860:IFETHENO$=T$(71):GOSUB4:GOTO30880
34400 IFD1THENU(1)=U(1)-W1:GOTO30880:ELSE30880
34499 REM ----- MULTI-DOWNLOAD
34500 GOSUB8640:O$=T$(76):GOSUB4:W2=0:W4=0:W6=(D1ANDUB$(5)="{sh @}"):W7=(D1ANDUB$(5)="0"):OPEN1,U,15:IFW7THENW1$=UB$(2)+W1$
34520 IFW6THENX=0:GOSUB30070:IFRIGHT$(W1$,1)="*"THENW1$=LEFT$(W1$,LEN(W1$)-1)
34540 IFW6=0THENOPEN2,U,2,"$"+MID$(STR$(D),2)+":"+W1$:GET#2,A$:GET#2,A$:SYS8258
34560 IFW6THENI=0:X=X+1:RECORD#2,X:SYS8222:IFPEEK(253)ORI$="{pound}"THEN34700:ELSEIFI$="^"ORLEFT$(I$,LEN(W1$))<>W1$THEN34560:ELSEA$=I$:SYS8222:I$=A$+","+I$
34580 IFW6=0THENI=0:POKE253,0:SYS8258:IFPEEK(254)THEN34700
34600 W5$=I$:IFW7THENW5$=MID$(W5$,2)
34620 O$="{cyan}"+W5$+" {white}(Y/N/D/A)? {ct c}":GOSUB4:C$="YNDA":GOSUB28:ONIGOTO34640,34560:GOTO34700
34640 IFW6THENA$=I$:SYS8222:W3=VAL(I$):I$=A$:GOTO34660:ELSEIFW6=0THENW3=PEEK(2975)+256*PEEK(2976)
34660 W4=W4+W3:IFW4>U(1)THENO$=T$(73):GOSUB4:CLOSE2:CLOSE1:GOTO920
34680 W2=W2+1:VT$(W2)=I$:VT(W2)=W3:IFW2<50THEN34560:ELSEO$=T$(111):GOSUB4
34700 INPUT#1,E:CLOSE2:CLOSE1:IFW2=0ORI=4THENO$=T$(112):GOSUB4:FORI=1TO50:VT$(I)="":VT(I)=0:NEXTI:GOTO920
34720 GOSUB30800:IFXTHEN34900:ELSEO$=T$(77):GOSUB4:SLEEP15:Y=1
34740 F$=VT$(Y):I=INSTR("psr",RIGHT$(F$,1)):F$=LEFT$(F$,LEN(F$)-2):IFW7THENVT$(Y)=MID$(VT$(Y),2)
34760 FORX=1TO15+LEN(VT$(Y)):PRINT#5,MID$("{ct i*15}"+VT$(Y),X,1);:NEXTX:PRINT#5,R$;:SLEEP2
34780 GOSUB30860:IFETHEN34900:ELSEIFD1THENU(1)=U(1)-VT(Y)
34800 SLEEP2:IFY<W1THENY=Y+1:GOTO34740
34820 PRINT#5,"{ct i*10}{ct d*15}":SLEEP3:O$=T$(113):GOSUB4
34840 FORI=1TO50:VT$(I)="":VT(I)=0:NEXTI:A=FRE(1):GOTO30880
34900 PRINT#5,"{ct i*10}{ct d*15}":SLEEP5:O$=T$(114):GOSUB4:GOTO34840
34999 REM ------ >>> * ADD FILENAME TO DIR * <<< ------
35000 GOSUB8000:IFETHEN920:ELSEU=D(8,0):D=D(8,1):IFUB$(5)="$"THEN30350
35100 GOSUB990:IFSY$<>"*"THENY=VAL(SY$):GOTO35200:ELSEO$=T$(69):GOSUB4:C$="PSW"+R$:GOSUB28:Y=I:IFI=4THEN920
35200 GOSUB30700:CLOSE2:CLOSE1:IFETHENO(1)=0:GOTO30730:ELSEGOSUB30750:CLOSE2
35300 OPEN1,U,15:IFUB$(5)="0"THENPRINT#1,"r"+MID$(STR$(D),2)+":"+UB$(2)+F$+"="+F$:GOTO35800:ELSEIFUB$(5)<>"{sh @}"THEN30730
35400 O$=T$(110):GOSUB4:X=UB(5):GOSUB5:UB$(8)=I$:IFI$=""THENUB$(8)="(none)"
35500 GOSUB30070:INPUT#1,E:IFETHENCLOSE2:GOSUB30080
35600 X=0:DO:X=X+1:RECORD#2,X:SYS8222:LOOPUNTILPEEK(253)ORI$="^"ORI$="{pound}":I=Y:GOSUB30480
35800 O$="{ct k}{black}File successfully added.":GOSUB4:CLOSE2:CLOSE1:GOTO940
35999 REM ------ >>> * DELETE FILENAME/DIR * <<< ------
36000 GOSUB8000:IFETHEN920:ELSEU=D(8,0):D=D(8,1):OPEN1,U,15:IFUB$(5)="$"THEN30350
36100 IFUB$(5)="0"THENPRINT#1,"r"+MID$(STR$(D),2)+":"+F$+"="+UB$(2)+F$:INPUT#1,E,E$:CLOSE1:ONSGN(E)+1GOTO36500,30730:ELSEIFUB$(5)<>"{sh @}"THEN920
36200 GOSUB30070:X=0:DO:X=X+1:RECORD#2,X:SYS8222:LOOPUNTILI$=F$ORPEEK(253)ORI$="{pound}":IFI$<>F$THENINPUT#1,E:CLOSE1:CLOSE2:E$="file not found":GOTO30730
36300 A$="":FORI=1TO9:A$=A$+"^"+R$:NEXTI:RECORD#2,X:PRINT#2,A$:CLOSE2:CLOSE1
36500 O$="{ct k}{black}File removed, scratch "+F$+" (Y/N)? {white}{ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN920
36600 OPEN1,U,15,"s"+MID$(STR$(D),2)+":"+F$:CLOSE1:GOTO940
36999 REM ------ >>> * CHECK SUBOP FLAG * <<< ------
37000 IFUB$(9)<>""THEN920:ELSE940
37999 REM ------ >>> * DISPLAY BLOCKS FREE * <<< ------
38000 U=D(8,0):D=D(8,1):F$="zu%":GOSUB30750:CLOSE2:O$="{ct k}":GOSUB9
38100 O$="{black}Commodore blocks:"+STR$(W1):GOSUB4
38200 O$="{black}Xmodem blocks   :"+STR$(W1*2):GOSUB4
38300 O$="{black}Kilobytes free  :"+STR$(INT(W1/4)):GOSUB4:GOTO940
38999 REM ------ >>> * EDIT SUB INTRO FILE * <<< ------
39000 W5$=UB$(3):IFUB$(5)<>"$"THENW5$=UB$(3)+UB$(2)
39100 O(12)=1:O(10)=0:F$="sys.u/d "+W5$:U=D(8,0):D=D(8,1):GOSUB8330:O(8)=50:GOSUB1010:GOTO940
39999 REM ------ >>> * CHANGE PROTOCOLS * <<< ------
40000 GOSUB990:A=VAL(SY$):A=VAL(SY$):IFSY$="#"THEN40200:ELSEIFSY$="*"THEN40300
40100 IFA=0THEN920:ELSEIFA>5ORO(19)=ATHEN940:ELSEO(19)=A:GOTO40500
40200 O(19)=O(19)+A:IFO(19)=6THENO(19)=0:GOTO40200:ELSE40500
40300 O$="{ct k}":GOSUB9:C$="PXCKM"+R$:FORI=1TO5:O$="{black}"+MID$(C$,I,1)+") "+PR$(I,0):GOSUB4:NEXTI:O$=T$(116):GOSUB4:GOSUB28:IFI=6ORO(19)=ITHEN940:ELSEO(19)=I
40500 O$(23)=PR$(O(19),0):BLOAD(PR$(O(19),1)),U(D(0,0)),D(D(0,1)):GOTO940
40999 REM ------ >>> * LIST U/D FILES * <<< ------
41000 O$="{ct k}":GOSUB9:IFUB$(5)="$"THENGOSUB30350:GOTO920:ELSEU=D(8,0):D=D(8,1):IFUB$(5)="0"THENW1$=UB$(2)+"*":I=ASC(UB$(2)):GOTO8630:ELSEIFUB$(5)<>"{sh @}"THEN920
41100 F$="zu%":GOSUB30750:CLOSE2:OPEN1,U,15:X=1:GOSUB30070:INPUT#1,E:Y=0:IFETHEN41550
41200 RECORD#2,X:SYS8222:IFI$="^"THENX=X+1:GOTO41200:ELSEIFI$<>"{pound}"ANDPEEK(253)=0THEN41300:ELSEINPUT#1,E:IFY=0THEN41550:ELSE41500
41300 F$=I$:SYS8222:W0$=I$:SYS8222:W1$=I$:SYS8222:SYS8222:SYS8222:W2$="SEQ":IFW0$<>"s"THENW2$="PRG"
41400 O$="{black}"+RIGHT$("00"+MID$(STR$(X),2),3)+") {f5}"+F$+"{f5} "+LEFT$(SP$,17-LEN(F$))+W2$+"/"+W1$+" BLKS  "+I$:GOSUB4:X=X+1:Y=1
41450 GOSUB8:IFA$="{home}"THENDO:GOSUB8:LOOPUNTILA$<>"":GOTO41200:ELSEIFA$<>" "THEN41200
41500 CLOSE2:CLOSE1:O$="{ct k}{black}Blocks free:"+STR$(W1):GOSUB4:GOTO940
41550 O$="{ct k}{black}No files":GOSUB4:GOTO41500
55555 U=PEEK(186):SCRATCH"prg.u/d bases",U(U):DSAVE"prg.u/d bases",U(U):STOP
