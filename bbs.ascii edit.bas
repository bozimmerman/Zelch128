!--------------------------------------------------
!- Tuesday, May 16, 2017 10:26:53 PM
!- Import of : 
!- c:\src\zelch128next\bbs.ascii edit.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 U=PEEK(186):D=0:PRINT"{ct n}{cyan}{clear}{down}{light blue}Would you like to load":PRINT"new ascii tables (y/n)? ";:GOSUB980:R$=CHR$(13)
20 GETKEYA$:IFINSTR("yn"+R$,A$)=0THEN20:ELSEPRINTA$:IFA$="y"THENGOSUB3000
30 PRINT"{down}{cyan}Loading data...";:DIMC$(255),A$(255):T=255:FORI=.TOT:READC$(I):NEXT:T=T-128:FORI=.TOT:READA$(I):NEXT:T$="Input":T=0:PRINT
100 PRINT:PRINT"{yellow}Current Table: {white}";T$
110 PRINT"{yellow}{down}S)ave, L)oad, H)unt,"
120 PRINT"E)dit, C)hange table, Q)uit: {white}";:GOSUB980
125 GETKEYCO$:CO$=CHR$(ASC(CO$)OR128):I=INSTR("CSLHQE",CO$):IFITHENPRINTCO$:ELSE125
130 ONIGOSUB1000,2000,3000,4000,999,5000:GOTO100
980 IFPEEK(2929)=0THENPRINTCHR$(27)"s";:RETURN:ELSERETURN
990 PRINT:PRINT"{purple}Ascii tables device,drive "U"{left},"MID$(STR$(D),2):PRINT"{up}"TAB(25);:INPUTU,D:IFU<7ORU>30ORD<0THEN990:ELSERETURN
998 GOSUB980:GETKEYA$:PRINTCHR$(ASC(A$)OR128):RETURN
999 END
1000 PRINT"{down}{pink}I)nput tables or O)utput tables: {white}";:GOSUB998:IFINSTR("io"+R$,A$)=0THEN1000:IFA$=R$THENRETURN:ELSET=INSTR("io",A$)-1
1010 T$="Input":IFTTHENT$="Output":RETURN:ELSERETURN
2000 GOSUB990:OPEN1,U,15,"s"+MID$(STR$(D),2)+":ascii 3b00":CLOSE1:BSAVE"ascii 3b00",U(U),D(D),P(15104)TOP(15617)
2010 RETURN
3000 GOSUB990:BLOAD"ascii 3b00",U(U),D(D),P(15104)
3010 RETURN
4000 PRINT:PRINT"{pink}A)scii or C)ommodore tables: {white}";:GOSUB998:IFINSTR("ac",A$)=0THENRETURN
4010 PRINT"{down}{purple}Enter searchkey or 'L' for list: {white}";
4020 GOSUB980:GETB$:IFB$=""THEN4020:ELSEIFB$="l"THEN4500
4030 POKE244,1:PRINTB$:IFA$="a"THEN4200
4040 F=-1:FORI=0TO255:IFB$=C$(I)THENF=I
4050 NEXT:IFF<0THEN4070
4060 PRINT"{cyan}Is code #";F:SLEEP1:RETURN
4070 PRINT"{cyan}Code not found (as-typed).":SLEEP1:RETURN
4200 F=-1:FORI=0TO128:IFB$=A$(I)THENF=I
4210 NEXT:IFF<0THEN4070:ELSE4060
4500 PRINT"{white}List":I=1:PRINT:F1=0
4510 PRINTUSING"{white}(###)  {yellow}Description: {cyan}";MID$(STR$(I),2);:IFA$="a"THENPRINTA$(I);:ELSEPRINTC$(I);
4515 IFPEEK(215)ANDF1=0THENPRINTTAB(40);:F1=1:ELSEPRINT:F1=0
4520 I=I+1:IFI=256THENPRINT:RETURN:ELSEGETC$:IFC$=" "THENPRINT:RETURN:ELSEIFC$<>"{home}"THEN4510
4530 GETC$:IFC$=""ORC$="{home}"THEN4530:ELSE4510
5000 CC=0:O1$="Received as   (A ) ":O3$="  Description: ":O2$="Translated to (C=) ":IFT$<>"Input"THENO1$="Code to send (C=) ":O2$="Sent as      (A ) "
5010 PRINT"{clear}{white}() {light gray}denote C= alternate codes"TAB(40)"{white} * {light gray}denote Zelch specific codes":PRINT"{down}{yellow}Table: {white}";T$:IFPEEK(215)=0THENO3$=R$+O3$
5020 PRINT"{down}{cyan}"O1$" #{white}"CC;TAB(40)"{cyan}"O3$;:D$=A$(CC):IFINSTR(O1$,"C=")THEND$=C$(CC)
5040 DD=PEEK(15104+CC+(T*256)):PRINT"{white}"D$;R$;"{cyan}"O2$" #{white}"DD;TAB(40);"{cyan}"O3$;:D$=A$(DD):IFINSTR(O2$,"C=")THEND$=C$(DD)
5050 PRINT"{white}"D$;R$;R$;"{yellow}[{white}Q{yellow},{white}C{yellow},{white}J{yellow},{white}+{yellow},{white}-{yellow}] Command: {white}";:GOSUB980
5060 GETKEYB$:IFB$="q"THENPRINT"Quit":PRINT:GOTO100
5070 IFB$="j"THENPRINT"Jump{light green}":GOTO5100:ELSEIFB$="c"THENPRINT"Change{light green}":GOTO5200
5075 IFB$="+"ANDCC<255THENPRINTB$:CC=CC+1:GOTO5020:ELSEIFB$="-"ANDCC>0THENPRINTB$:CC=CC-1:GOTO5020:ELSE5060
5090 IFF>-1THENPOKE15104+CC+(T*256),F:GOTO5020:ELSE5020
5100 INPUT"{down}Jump to what code";CC:GOTO5020
5200 INPUT"{down}Enter new translation";F:GOTO5090
10000 DATA "Null","*Filelink*","Underline-On","*Linelink*","Nothing","White
10010 DATA "Nothing","Bell","*40col mask*","Tab","Linefeed
10020 DATA "Enable-Change","Disable-mode","Enter/Return","Lowercase-On","Flash-On
10030 DATA "Nothing","Crsr Down","Reverse-On","Home","Delete/Backspace
10040 DATA "Nothing","Nothing","Nothing","Tab-Clear","Nothing"
10050 DATA "Nothing","Escape","Red","CrsrRight","Green
10060 DATA "Blue","Space","!","Quote","#
10070 DATA "$","%","&","'","("
10080 DATA ")","*","+",",","-"
10090 DATA ".","/","0","1","2"
10100 DATA "3","4","5","6","7"
10110 DATA "8","9",":",";","<"
10120 DATA "=",">","?","@","a"
10130 DATA "b","c","d","e","f"
10140 DATA "g","h","i","j","k"
10150 DATA "l","m","n","o","p"
10160 DATA "q","r","s","t","u"
10170 DATA "v","w","x","y","z"
10180 DATA "[","{pound}","]","^","{arrow left}"
10190 DATA "(@)","(A)","(B)","(C)","(D)"
10200 DATA "(E)","(F)","(G)","(H)","(I)"
10210 DATA "(J)","(K)","(L)","(M)","(N)"
10220 DATA "(O)","(P)","(Q)","(R)","(S)"
10230 DATA "(T)","(U)","(V)","(W)","(X)"
10240 DATA "(Y)","(Z)","({sh +})","({cm -})","({sh -})"
10250 DATA "(PI)","({cm asterisk})","Nothing","Orange","Underline-Off
10260 DATA "RUN","Nothing","F1","F3","F5"
10270 DATA "F7","F2","F4","F6","F8"
10280 DATA "Shift-Return","Uppercase-On","Flash-Off","*Color-Cycle*","CrsrUp"
10290 DATA "Reverse-Off","ClearScreen","Insert","Brown","Lt.Red"
10300 DATA "Dk.Grey","Md.Grey","Lt.Green","Lt.Blue","Lt.Grey
10310 DATA "Purple,","CrsrLeft","Yellow","Cyan","Shft-Space"
10330 DATA "{cm k}","{cm i}","{cm t}","{cm @}","{cm g}"
10340 DATA "{cm +}","{cm m}","{cm pound}","{sh pound}","{cm l}"
10350 DATA "{cm q}","{cm d}","{cm z}","{cm s}","{cm p}"
10360 DATA "{cm a}","{cm e}","{cm r}","{cm w}","{cm h}"
10370 DATA "{cm j}","{cm n}","{cm y}","{cm u}","{cm o}"
10380 DATA "{sh @}","{cm f}","{cm c}","{cm x}","{cm v}"
10390 DATA "{cm b}","({sh @})","A","B","C"
10400 DATA "D","E","F","G","H"
10410 DATA "I","J","K","L","M"
10420 DATA "N","O","P","Q","R"
10430 DATA "S","T","U","V","W"
10440 DATA "X","Y","Z","({sh +})","({cm -})","({sh -})","({cm +})","({sh pound})","(Shft-Space)"
10450 DATA "({cm k})","({cm i})","({cm t})","({cm @})","({cm g})"
10460 DATA "({cm +})","({cm m})","({cm pound})","({sh pound})","({cm l})"
10470 DATA "({cm q})","({cm d})","({cm z})","({cm s})","({cm p})"
10480 DATA "({cm a})","({cm e})","({cm r})","({cm w})","({cm h})"
10490 DATA "({cm j})","({cm n})","({cm y})","({cm u})","({cm o})"
10500 DATA "({sh @})","({cm f})","({cm c})","({cm x})","({cm v})"
10510 DATA "PI"
20000 DATA "Null","Nothing","Nothing","Nothing","Nothing","Nothing"
20010 DATA "Nothing","Bell","Backspace","Nothing","Linefeed"
20020 DATA "Nothing","Formfeed","Return","Nothing","Nothing"
20030 DATA "Nothing","Nothing","Nothing","Nothing","Nothing"
20040 DATA "Nothing","Nothing","Nothing","Nothing","Nothing"
20050 DATA "Nothing","Escape","Nothing","Nothing","Nothing"
20060 DATA "Nothing","Space","!","Quote","#"
20070 DATA "$","%","&","'","("
20080 DATA ")","*","+",",","-"
20090 DATA ".","/","0","1","2"
20100 DATA "3","4","5","6","7"
20110 DATA "8","9",":",";","<"
20120 DATA "=",">","?","@","A"
20130 DATA "B","C","D","E","F"
20140 DATA "G","H","I","J","K"
20150 DATA "L","M","N","O","P"
20160 DATA "Q","R","S","T","U"
20170 DATA "V","W","X","Y","Z"
20180 DATA "[","Backslash","]","^","{cm @}"
20190 DATA "Apostrophe","a","b","c","d"
20200 DATA "e","f","g","h","i"
20210 DATA "j","k","l","m","n"
20220 DATA "o","p","q","r","s"
20230 DATA "t","u","v","w","x"
20240 DATA "y","z","OpenSet","WideColon","CloseSet"
20250 DATA "Approximately","Nothing"
55555 A=PEEK(186):OPEN1,A,15,"s0:bbs.ascii edit":CLOSE1:DSAVE"bbs.ascii edit",U(A)
