!--------------------------------------------------
!- Wednesday, May 17, 2017 12:20:16 AM
!- Import of : 
!- c:\src\zelch128next\bbs.main.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
1 A$="":O$="":I$="":C$="":TRAP360:R$=CHR$(13):SYS15622:U=PEEK(186):DLOAD"bbs.setup",U(U),D0
4 IFO$=""THENO$=R$:GOTO9:ELSESYS8204:IFPEEK(2896)=2THENPOKE2896,0:GOSUB300:RETURN:ELSERETURN
5 POKE2847,X:POKE2895,1:POKE2831,1
6 SY$(1)="":I$="":SYS8201:ON(PEEK(2827)=1)+2GOTO600:RETURN
7 IFMID$(U$(8),1,1)="1"ANDP0<101THEN11
8 SYS8192:IFPEEK(2827)THEN600:ELSEIFPEEK(2893)THEN751:ELSEIF(PEEK(2896)=2)ANDM(18)=0THEN4:ELSERETURN
9 POKE254,ASC(O$+CHR$(0)):SYS8198:RETURN
10 I=X:X=40:GOSUB15:X=I:IFI$=""ORLEN(I$)>4THENI=0:RETURN:ELSEI=VAL(I$):RETURN
11 A$=RIGHT$(O$,LEN(O$)-4):IFA$=CHR$(13)THENA$="+"
12 IFLEFT$(O$,3)=LEFT$(P0$(P0),3)ANDLEN(P0$(P0))<150THENP0$(P0)=P0$(P0)+","+A$:RETURN:ELSEIFP0$(P0)<>""THENP0=P0+1:P0$(P0)=O$:RETURN:ELSEP0$(P0)=O$:RETURN
15 ONM(18)GOTO693:GOTO5
16 POKE2982,0:ONM(18)GOTO693:GOSUB5:POKE2982,O(25):RETURN
20 SY(6)=X:X=1:GOSUB693:X=SY(6):IFI$=""THENI$=R$
21 I=INSTR(C$,I$):IFITHENA$=I$:I$=SY$(5):RETURN:ELSEGOSUB4:GOTO20
23 IFO$(11)=I$THEN30010:ELSEO$(11)=I$:O$=LEFT$(RIGHT$(I$,LEN(I$)-4)+SP$,12):X=PEEK(238)-12:Y=24:GOSUB30:SYS15622:LOAD(MID$(STR$(D),2)+":"+I$),U
25 O$=T$(1):GOSUB4
26 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":SYS8210:INPUT#1,I:CLOSE1:CLOSE2:C$="":IFPEEK(252)=0THENRETURN
27 POKE2925,0:O$="{ct k}return>{ct c}":GOSUB4:POKE2925,M(3):C$=R$:GOSUB32:O$=A$+"{ct n}":GOSUB4:RETURN
28 IFM(18)THENSY$(5)=I$:GOTO20:ELSEGOSUB32:O$=A$:GOTO4
29 PRINT#5,R$R$R$R$:SLEEP1:PRINT#5,"atz":SLEEP1:FORI=0TO100:GET#5,I$:NEXT:RETURN
30 POKE2861,X:POKE2862,Y:O$="{light gray}{reverse on}"+O$+O$(21):SYS15631:RETURN
31 SYS8222:POKE252,0:POKE253,0:IFI$=CHR$(1)THENPOKE252,1:RETURN:ELSEIFST>0THENPOKE253,1:PRINT#3,I$:RETURN:ELSEPRINT#3,I$:GOTO31
32 A$="":DOUNTILINSTR(C$,A$)>0:POKE2831,1:GOSUB8:LOOP:I=INSTR(C$,A$):RETURN
55 A=PEEK(186):OPEN1,A,15,"s0:bbs.main":CLOSE1:DSAVE"bbs.main",U(A):STOP
99 REM ------------ UPDATE ALL WINDOW DATA
100 POKE2978,ASC(U$(5)):IFPEEK(215)THEN200:ELSEX=7:Y=0:O$=LEFT$(U$(1)+SP$,16):GOSUB30:Y=1:O$=LEFT$(U$(3)+SP$,16):GOSUB30:Y=2:O$=U$(4):GOSUB30
105 Y=3:O$=U$(5):GOSUB30:Y=0:X=27:O$=LEFT$(MID$(STR$(ID),2,3)+SP$,3):GOSUB30:X=33:O$=RIGHT$(SP$+MID$(STR$(BA),2,4),4):GOSUB30:X=30:Y=1
110 O$=RIGHT$("00"+MID$(STR$(U(6)),2),2)+"/":O$=O$+RIGHT$("00"+MID$(STR$(CD(ASC(U$(5))-192,0)),2),2):GOSUB30:Y=2:O$=LEFT$(O$(1),7):GOSUB30:X=11:Y=3
120 O$="":FORI=1TO26:IFMID$(U$(9),I,1)="1"THENO$=O$+"{reverse off}":ELSEO$=O$+"{reverse on}"
125 O$=O$+CHR$(I+192):NEXTI:GOSUB30:GOTO300
200 X=10:Y=0:O$=LEFT$(U$(1)+SP$,16):GOSUB30:Y=1:O$=LEFT$(U$(3)+SP$,16):GOSUB30:Y=2:O$=U$(4):GOSUB30:Y=3:O$=O$(4):GOSUB30
205 X=32:Y=0:O$=LEFT$(MID$(STR$(ID),2)+SP$,3):GOSUB30:Y=1:O$=U$(5):GOSUB30:Y=2:O$=MID$(STR$(40+(40*VAL(MID$(U$(8),2,1)))),2,2):GOSUB30
210 Y=3:O$=LEFT$(MID$(STR$(BA),2,4)+SP$,4):GOSUB30:X=42:Y=0:O$=LEFT$(STR$(U(2))+SP$,5):GOSUB30:Y=1:O$=LEFT$(STR$(U(1))+SP$,5):GOSUB30
215 Y=2:O$=LEFT$(STR$(U(4))+SP$,5):GOSUB30:Y=3:O$=LEFT$(STR$(U(5))+SP$,5):GOSUB30:X=55:Y=0
220 O$=RIGHT$("00"+MID$(STR$(U(6)),2),2)+"/":O$=O$+RIGHT$("00"+MID$(STR$(CD(ASC(U$(5))-192,0)),2),2):GOSUB30:Y=1:O$=LEFT$(U$(7),2)+RIGHT$(U$(7),3)
225 GOSUB30:Y=2:X=INSTR("ACDEIMTPO",MID$(U$(8),10,1))-1:O$=MID$("AmigaC=64 C=128AppleCloneMac  AtariCP/M Other",(X*5)+1,5):X=55:GOSUB30
230 Y=3:X=49:O$="{ct b}":FORI=1TO26:IFMID$(U$(9),I,1)="1"THENO$=O$+"{reverse off}":ELSEO$=O$+"{reverse on}"
235 O$=O$+CHR$(I+192):NEXTI:O$=O$+"{130}":GOSUB30
237 VT$(0)="Q{down}{left}":VT$(1)="W{down}{left}":X=62:Y=0:O$="{142}":O$=O$+VT$(VAL(MID$(U$(8),1,1))):O$=O$+VT$(VAL(MID$(U$(8),3,1))):O$=O$+VT$(VAL(MID$(U$(8),4,1))):GOSUB30
240 X=70:Y=0:O$=VT$(VAL(MID$(U$(8),5,1))):O$=O$+VT$(VAL(MID$(U$(8),7,1))):O$=O$+VT$(VAL(MID$(U$(8),8,1))):O$=O$+"{ct n}":GOSUB30:GOTO300
250 X=0:Y=24:O$=LEFT$(O$+SP$,PEEK(238)-17):GOSUB30:RETURN
300 X=0:Y=0:O$="":IFPEEK(2896)THENO$="{pink}{ct o}"
305 W1$=O$:IFPEEK(215)THEN350:ELSEO$=O$+"C{down}{left}H{down}{left}A{down}{left}T":GOSUB30:X=38:O$="{gray}":IFPEEK(2829)=0THENO$="":IFPEEK(2979)THENO$="{purple}"
310 O$=O$+"G{down}{left}R{down}{left}F{down}{left}X":GOSUB30:O$=W1$:RETURN
350 O$=O$+" C{cm m}{down}{left*3} H{cm m}{down}{left*3} A{cm m}{down}{left*3} T{cm m}{down}{left*3}{143}":GOSUB30:X=76:O$="{dark gray}":IFPEEK(2829)=0THENO$="":IFPEEK(2979)THENO$="{orange}"
355 O$=O$+"{cm g}G {down}{left*3}{cm g}R {down}{left*3}{cm g}F {down}{left*3}{cm g}X ":GOSUB30:O$=W1$:RETURN
359 REM -------- MAIN TRAP ROUTINE
360 IFER=30THENPRINTR$"break":END:ELSEGOSUB400:I$="["+ERR$(ER)+"] line"+STR$(EL):O$="{ct k}{white}"+I$:GOSUB4:GOSUB7
365 O$="Standby, recording...{ct c}":GOSUB4:O(5)=O(5)+1:CLOSE2:CLOSE1:OPEN1,D(1,0),15:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.errorlog,s,a":INPUT#1,E:IFE=0THEN375
370 CLOSE2:OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.errorlog,s,w"
375 PRINT#2,O$(3)+", "+I$+", "+O$(11)+", "+O$(15)+", ID#"+STR$(ID):CLOSE2:CLOSE1:CLOSE3:CLOSE4:TRAP360:IFID=0THEN600:ELSE920
399 REM ----------- CREATION OF O$(1-4)
400 SYS8216:A$=RIGHT$(STR$(PEEK(2863)),2)+RIGHT$(STR$(PEEK(2879)),2)+RIGHT$(STR$(PEEK(2880)),2)+LEFT$(I$,2)+MID$(I$,4,2):IFLEFT$(I$,2)="12"THENMID$(A$,7,2)="00"
405 DOUNTILINSTR(A$," ")=0:MID$(A$,INSTR(A$," "),1)="0":LOOP:IFRIGHT$(O$(1),2)="pm"THENMID$(A$,7,2)=RIGHT$(STR$(VAL(MID$(A$,7,2))+12),2)
410 O$(2)=A$:SYS8216:O$(3)=MID$(O$(2),3,2)+"/"+MID$(O$(2),5,2)+"/"+LEFT$(O$(2),2)+"  "+I$
415 O$(4)=MID$(U$(6),3,2)+"/"+MID$(U$(6),5,2)+"/"+LEFT$(U$(6),2)+"  "+MID$(U$(6),7,2)+":"+MID$(U$(6),9,2)+"am":IFMID$(O$(4),11,2)="00"THENMID$(O$(4),11,2)="12"
420 IFMID$(U$(6),7,2)>"12"THENMID$(O$(4),11,2)=RIGHT$(STR$(VAL(MID$(U$(6),7,2))-12),2):MID$(O$(4),16,2)="pm":IFINSTR(O$(4)," ",11)>1THENMID$(O$(4),11,1)="0"
430 T$=MID$(STR$(PEEK(2825)),2):IFOL$(0)>""THENO$(12)=OL$(INT(RND(TI)*VAL(OL$(0)))+1):RETURN:ELSERETURN
449 REM ---------- BAUD CHANGE
450 POKE2576,6:BA=I:IFI=1200THENPOKE2576,8:ELSEIFI=2400THENPOKE2576,10
460 A=1022730/BA:GOSUB480:O(17)=X:O(18)=Y:POKE6912,X:POKE6913,Y:IFBA>1199THENA=1022730/BA*.996:GOSUB480
470 POKE2582,X:POKE2583,Y:A=1022730/BA/2-100:GOSUB480:POKE2578,X:POKE2579,Y:RETURN
480 Y=INT(A/256):X=INT(A-(Y*256)):RETURN
499 REM ---------- XFER
500 GOSUB590:ONO(19)+1GOTO580,505,520,520,520
505 SYS4885:SYS4873:IFPEEK(512)=1THENE=1:GOTO580
510 GOSUB585:ONEGOTO580:SLEEP1:SYS59074:SYS4885:SYS4867:SLEEP1:POKE2585,PEEK(2584):GOTO580
520 GOSUB585:ONEGOTO580:IFO(19)=3THENSYS4873:GOTO525:ELSESYS4867
525 E=PEEK(251):GOTO580
530 GOSUB586:ONEGOTO580:IFO(19)=3THENSYS4870:GOTO535:ELSESYS4864
535 E=PEEK(251):GOTO570
550 GOSUB590:ONO(19)+1GOTO580,555,530,530,530
555 GOSUB586:ONEGOTO580:SYS4885:POKE7195,I:SYS4876:IFPEEK(512)=1THENE=1:GOTO570:ELSESYS4885:POKE7192,255:SYS4870
570 SLEEP5
580 CLOSE1:CLOSE2:POKE2974,W0:PRINT:IFPEEK(215)THENFAST:RETURN:ELSERETURN
585 OPEN1,U,15,"i"+MID$(STR$(D),2):OPEN2,U,1,MID$(STR$(D),2)+":"+F$+","+MID$("psp",I,1)+",w":INPUT#1,X:IFX>20THENE=1:RETURN:ELSERETURN
586 OPEN1,U,15:OPEN2,U,VAL(MID$("020",I,1)),MID$(STR$(D),2)+":"+F$+","+MID$("psp",I,1)+",r":INPUT#1,X:IFX>20THENE=1:RETURN:ELSERETURN
590 E=0:W0=PEEK(2974):POKE2974,0:POKE6912,O(17):POKE6913,O(18):IFBA<2399THENSLOW:RETURN:ELSERETURN
600 U=D(0,0):D=D(0,1):I$="prg.logon":O(26)=1:GOTO23
610 IFLEN(SY$)<>26THENSY$="00000000000000000000000000":GOTO610:ELSEO$="":FORX=1TO26:IFMID$(SY$,X,1)="1"THENO$=O$+CHR$(X+192):ELSEO$=O$+" "
620 NEXT:O$=W2$+O$+"{ct c}":GOSUB4:IFETHENO$=R$:E=0:GOTO4:ELSEC$=CHR$(20)+R$:GOSUB32:IFI=2THENO$=A$:GOTO9:ELSEO$=CHR$(20):FORX=1TO28:GOSUB9:NEXT:O$=" Toggle: {ct c}"
630 GOSUB4:X=26:GOSUB16:IFI$=""THENRETURN:ELSEFORX=1TOLEN(I$):A=ASC(MID$(I$,X,1))-192:IFA>0ANDA<27THENMID$(SY$,A,1)=MID$(STR$(ABS(VAL(MID$(SY$,A,1))-1)),2)
640 NEXT:GOTO610
693 C=0:IFSY$(1)=""THENC=1:GOSUB5:POKE2982,O(25):SY$(1)=I$:IFPEEK(2893)THEN751
695 I$=SY$(1):SY(1)=1:DO:SY(2)=INSTR(I$,MID$(":;,",SY(1),1)):SY(1)=SY(1)+1:LOOPUNTIL(SY(2))OR(SY(1)>3)
696 IFSY(2)THENI$=LEFT$(I$,SY(2)-1):SY$(1)=MID$(SY$(1),SY(2)+1):ELSESY$(1)=""
697 IFC=0THENO$=I$:GOSUB4:RETURN:ELSEC=0:RETURN
699 REM --------- MAIN MENU ROUTINES
700 O(20)=1:X=40:POKE2982,0:GOSUB693:POKE2982,O(25):A$=I$:O(20)=0
710 IFA$=""THENA$=R$:GOTO710:ELSEI=0:FORX=1TOSY(5):IFA$=M$(X,0)THENI=X
720 NEXTX:IFITHENIFMID$(M$(I,1),ASC(U$(5))-192,1)="1"THEN930
725 IFI=0ANDVAL(A$)=0THENIFRIGHT$(A$,1)="0"ORVAL(RIGHT$(A$,1))THEN740
730 IFA$=R$THEN925:ELSEO$=T$(122):GOSUB4:SY(4)=0:GOTO925
740 X=1:IFVAL(RIGHT$(A$,2))THENX=2:IFVAL(RIGHT$(A$,3))THENX=3
745 SY(4)=VAL(RIGHT$(A$,X)):A$=LEFT$(A$,LEN(A$)-X):GOTO710
751 SY(4)=0:SY$(1)="":IFO(20)=0THENRETURN:ELSEW1=0:O$=T$(88):GOSUB4:I$="prg.online utils":U=D(0,0):D=D(0,1):GOTO23
752 I$=F$:IFRIGHT$(F$,2)="/a"ANDPEEK(2829)THENF$=LEFT$(F$,LEN(F$))-2:RETURN:ELSERETURN
760 GOSUB990:IFSY(4)THENI=SY(4):SY(4)=0:RETURN:ELSEI=ASC(SY$)-192
765 IFI<1ORI>26THENI=VAL(SY$):RETURN:ELSERETURN
770 GOSUB4:X=2:GOSUB15:IFVAL(I$)THENI=VAL(I$):GOTO776:ELSEI=ASC(I$+CHR$(0))-192
776 IFI>0ANDI<27THENRETURN:ELSEI=0:RETURN
900 O$(13)="":CLOSE1:CLOSE2:GOSUB752:U=D(9,0):D=D(9,1):OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":F$=I$:SY(4)=0
902 INPUT#1,I:IFI>0THENCLOSE1:CLOSE2:O$=T$(10):GOSUB4:GOTO920
905 SYS8213:SYS8222:A$=I$:SYS8222:O$(10)=I$:SYS8222:O$(8)=I$:SYS8222:O$(9)=I$:I=O(21):DO:I=I+1:FORX=0TO4:SYS8222:M$(I,X)=I$:NEXTX:LOOPUNTILPEEK(253)ORI=50
910 O$(16)=F$:CLOSE1:CLOSE2:C$="":SY(5)=I:FORX=1TOI:IFM$(X,0)="{ct k}"THENM$(X,0)=R$
912 C$=C$+M$(X,0):NEXTX:O$(7)=C$:A=VAL(LEFT$(A$,1)):A$=MID$(A$,2):IFA$<>""THENO$(13)=A$
915 IFA>0THENGOSUB752:GOSUB25:F$=I$:IFPEEK(2859)>0THENGOSUB400:A$=CHR$(PEEK(2859)):I=INSTR(O$(7),A$):IFM(18)=0THEN930
920 SY(4)=0:IFO$(13)<>""THENA$=O$(13):O$(13)="":I=INSTR(O$(7),A$):IFI>0THENON(M(18)+1)GOTO930,710
925 GOSUB400:O$=O$(8+PEEK(2829))+"{ct c}":GOSUB4:IFM(18)THEN700
927 C$=O$(7):O(20)=1:GOSUB32:O(20)=0:IFMID$(M$(I,1),ASC(U$(5))-192,1)="1"THENO$=M$(I,2):GOSUB4:GOTO930
928 IFLEN(T$(122))>3THENO$=A$+"{ct k}"+T$(122):GOSUB4:GOTO925:ELSE927
930 E=0:C$="":IFMID$(M$(I,1),ASC(U$(5))-192,1)<>"1"THEN920:ELSESY$(2)=M$(I,3):SY$(3)=M$(I,4):O$=O$(10)+":"+A$:GOSUB7
940 IFSY$(2)=""THENO$(13)="":GOTO920:ELSEI=INSTR(SY$(2),"{f4}"):IFI<1THENW1=VAL(SY$(2)):SY$(2)="":GOTO950
945 W1=VAL(LEFT$(SY$(2),I-1)):SY$(2)=RIGHT$(SY$(2),LEN(SY$(2))-I)
950 IFW1>100THEN960:ELSEONW1GOTO8040,8050,600,8100,8260,8270,8280,8290,8410,8440,8450,8460,8480,8500,8510,8530,8550,8590,8610,8660
955 ON(W1-20)GOTO8690,8700,8730,8740,8750,8760,8770,8790,8810,8820,8860,8890,8900,8910,8920,8930,8990,9000,9030,9050
956 ON(W1-40)GOTO9060,9100,9110
960 U=D(0,0):D=D(0,1):IFW1>100ANDW1<999THENI$=PR$(INT(W1/100)-1,2):GOTO23:ELSE940
990 IFSY$(3)=""THENSY$="*":RETURN:ELSEI=INSTR(SY$(3),"{f4}"):IFI<1THENSY$=SY$(3):SY$(3)="":RETURN
995 SY$=LEFT$(SY$(3),I-1):SY$(3)=RIGHT$(SY$(3),LEN(SY$(3))-I):IFSY$=""THENSY$="*":RETURN:ELSERETURN
999 REM  -------- MSG MAKER
1000 O(8)=200:IFPEEK(2915)THENO(8)=100
1010 CLOSE1:CLOSE2:CLOSE3:O$="{ct n}":POKE2850,1:O(13)=0:IFO(7)=1THENO$=CHR$(142)
1020 POKE2925,0:GOSUB9:IFO(9)=0THENFORI=0TO201:TT$(I)="":NEXTI:L=1
1030 A=FRE(1):O$="{ct k}{black}{clear}message maker!{ct k}{black}type /h for help{ct k}{black}"+MID$(STR$(O(8)),2)+" lines max. go:{white}":GOSUB4:E=0:POKE2917,0:POKE2850,1:O(11)=0:W3=0
1040 IFPEEK(2825)<13THENO$="{black}["+MID$(STR$(PEEK(2825)),2)+" minutes left]{white}":GOSUB4
1050 IFO(9)THENO(9)=0:X=1:Y=L-1:GOTO1440
1100 O(13)=0:X=L:ONPEEK(2917)GOSUB1130:GOSUB6
1110 TT$(L)=I$:W1$="":W2$=LEFT$(TT$(L),2):IFINSTR(W2$,"/")=1ORINSTR(W2$,".")=1THENW1$=CHR$(ASC(RIGHT$(W2$,1))OR128):IFTT$(L)="."ORTT$(L)="/"THEN1600
1120 ONINSTR("B{cm n}GPOHSEDLNVIAUWTCRX",W1$)GOTO1850,1870,1720,1720,1800,1160,1200,1300,1350,1400,1420,1430,1450,1460,1480,1490,1510,1530,1700,1900:GOTO1150
1130 O$=RIGHT$("  "+STR$(X),3)+">{ct c}":GOSUB4:RETURN
1150 IFL>=O(8)ORFRE(1)<500THENO$="buffer full. type /h for help":GOSUB4:GOTO1100:ELSEL=L+1:GOTO1100
1160 OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.msg help,s,r":SYS8210:CLOSE2:GOTO1100
1170 IFO(13)THEN1650
1175 E=0:X=0:Y=0:W1=0:W2$=MID$(TT$(L),3):W2=INSTR(W2$,","):IFINSTR(W2$,"e")OR(LEN(W2$)>4ANDW2=0)THENE=1:O$="bad format":GOSUB4:GOTO1190
1176 IFW2=0THENW2=LEN(W2$)
1180 IFW2$=""THENW1=1:X=1:ELSEX=VAL(LEFT$(W2$,W2)):IFW2<>LEN(W2$)THENY=VAL(MID$(W2$,W2+1)):IF Y<X OR Y>L-1 THENY=X
1185 IFX>L-1ORX<1THENE=1:IFW3=0THENO$="bad line number":GOSUB4
1190 W3=0:RETURN
1200 O$="save (y/n)?{ct c}":GOSUB4:C$="YN":GOSUB32:O$=CHR$(ASC(A$)AND127):GOSUB4:IFI=2THEN1100:ELSEIFF$=""THEN1473
1210 O$="saving...{ct c}":GOSUB4:OPEN1,U,15:OPEN2,U,0,"$"+MID$(STR$(D),2)+":zu%":INPUT#1,I:IFI>0THEN1299
1215 SYS8225:CLOSE2:IFPEEK(2854)+256*PEEK(2855)<94THENO$=" no disk space!":GOSUB4:O(11)=1:GOTO1470
1220 IFO(12)=1THENPRINT#1,"s"+MID$(STR$(D),2)+":"+F$:GOTO1260:ELSEIFO(12)<>2THEN1260
1230 PRINT#1,"s"+MID$(STR$(D),2)+":sys.work":OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":INPUT#1,I:IFI>19THENCLOSE2:CLOSE3:O(11)=1:GOTO1470
1235 OPEN3,U,3,MID$(STR$(D),2)+":sys.work,s,w":INPUT#1,I:IFI>19THEN1299
1240 IFO(10)=0THEN1270:ELSEFORX=0TOO(10)-1:IFX<>0THENPRINT#3,CHR$(1)
1250 GOSUB31:NEXTX:PRINT#3,CHR$(1):GOTO1270
1260 OPEN3,U,3,MID$(STR$(D),2)+":"+F$+",s,w":INPUT#1,I:IFI<19THEN1270:ELSEIFI<>63THEN1299
1265 CLOSE3:OPEN3,U,3,MID$(STR$(D),2)+":"+F$+",s,a":INPUT#1,I:IFI>0THEN1299:ELSEPRINT#3,CHR$(1)
1270 IFO$(5)<>""THENPRINT#3,O$(5):PRINT#3,"{white}{f4}"
1274 TT$(L)="":IFL=1THENO(11)=1:GOTO1470:ELSEIFO(7)=1THENPRINT#3,CHR$(142)
1280 FORI=1TOL-1:PRINT#3,TT$(I):NEXTI:IFO(12)<>2THENCLOSE3:CLOSE1:O$="{left*6}ed!   ":GOSUB4:GOTO1470
1285 SYS8213:IFPEEK(253)=0THENDO:PRINT#3,CHR$(1):GOSUB31:LOOPUNTILPEEK(253)
1290 CLOSE3:CLOSE2:INPUT#1,I:IFI<20THENPRINT#1,"s"+MID$(STR$(D),2)+":"+F$:PRINT#1,"r"+MID$(STR$(D),2)+":"+F$+"=sys.work":O$="{left*6}ed!   ":GOSUB4:GOTO1470
1299 CLOSE3:CLOSE2:O$="{ct k*2}disk error, please wait!":GOSUB4:PRINT#1,"s"+MID$(STR$(D),2)+":sys.work":PRINT#1,"v"+MID$(STR$(D),2):O(11)=1:GOTO1470
1300 GOSUB1170:IFE=1ORW1=1THEN1100:ELSEO$="{white}>"+TT$(X)+"{ct k}search for: {ct c}":GOSUB4:GOSUB6:W1$=TT$(X):W1=LEN(W1$):W2=LEN(I$):IFW1=0THEN1100
1310 Y=INSTR(W1$,I$):IFY=0THENO$="not found!":GOSUB4:GOTO1100:ELSEW2=W1-Y-W2+1:W2$=LEFT$(W1$,Y-1):W3$=RIGHT$(W1$,W2)
1320 O$="change to : {ct c}":GOSUB4:GOSUB6:TT$(X)=W2$+I$+W3$:IFTT$(X)=""THENTT$(X)="":ELSEIFLEN(TT$(X))>120THENO$="illegal length":GOSUB4:TT$(X)=W1$
1330 GOTO1100
1350 W3=1:GOSUB1170:IF(W1=1)OR(E=1ANDX>0)THEN1100:ELSEIFE=1ANDX<0THENX=L+X:Y=L-1:E=0:IFX<1THENE=1
1360 IFE=1THEN1100:ELSEIFY=0ANDINSTR(W2$,",")THENY=L-1:ELSEIFY=0THENY=X
1370 I$="":IFX<>YTHENI$="s"
1380 W1=Y-X+1:FORI=XTOL-W1+1:TT$(I)=TT$(I+W1):NEXTI:L=L-W1:IFL<1THENL=1
1390 I=FRE(0):O$=STR$(W1)+" line"+I$+" deleted":GOSUB4:GOTO1100
1400 GOSUB1170:O$="{white}":GOSUB9:IFE=1THEN1100:ELSEIFW1=1ORY<1THENY=L-1
1410 DO:I=X:GOSUB1130:O$=TT$(X)+CHR$(0):POKE2958,1:SYS8204:POKE2958,0:X=X+1:GOSUB1445:LOOPUNTILX>YORA$=" ":GOTO1100
1420 O$="clear (y/n)?{ct c}":GOSUB4:C$="YN":GOSUB32:O$=CHR$(ASC(A$)AND127):GOSUB4:ONIGOTO1010,1100
1430 GOSUB1170:O$="{white}":GOSUB9:IFE=1THEN1100:ELSEIFW1=1ORY<1THENY=L-1
1440 DO:O$=TT$(X):GOSUB4:X=X+1:GOSUB1445:LOOPUNTILX>YORA$=" ":GOTO1100
1445 W1=PEEK(2850):POKE2850,0
1446 GOSUB8:IFA$="{home}"THENDO:GOSUB8:LOOPUNTILA$<>""ANDA$<>"{home}":GOTO1446:ELSEPOKE2850,W1:RETURN
1450 GOSUB1170:IFE=1ORL>O(8)-1ORW1=1THEN1100:ELSEFORI=LTOX+1STEP-1:TT$(I)=TT$(I-1):NEXTI:TT$(X)="":L=L+1:I=FRE(1):O$="blank line inserted":GOSUB4:GOTO1100
1460 O$="abort (y/n)?{ct c}":GOSUB4:C$="YN":GOSUB32:O$=CHR$(ASC(A$)AND127):GOSUB4:IFI=2THEN1100:ELSEO(11)=1
1470 FORI=0TOO(8):TT$(I)="":NEXTI:O$(5)="":O(7)=0:O(9)=0:O(10)=0:O(12)=0:O$=R$:GOSUB9
1473 E=0:POKE2917,0:O(13)=0:CLOSE2:CLOSE3:CLOSE1:O$="{ct n}":POKE2850,1:GOSUB9
1475 POKE2925,M(3):RETURN
1480 IFPEEK(2829)=0THEN1100:ELSEIFO(7)=1THENO(7)=0:O$="{ct n}gfx off":GOSUB4:GOTO1100:ELSEO(7)=1:O$=CHR$(142)+"gfx on":GOSUB4:GOTO1100
1490 IFPEEK(2850)THENPOKE2850,0:O$="word wrap off":GOSUB4:GOTO1100:ELSEPOKE2850,1:O$="word wrap on":GOSUB4:GOTO1100
1510 IFPEEK(2917)=1THENPOKE2917,0:O$="line numbers off":GOSUB4:GOTO1100:ELSEPOKE2917,1:O$="line numbers on":GOSUB4:GOTO1100
1530 GOSUB1170:IFE=1THEN1100:ELSEIFW1=1THENY=L-1:ELSEIFY<1THENY=X
1535 W4=(PEEK(2915)*40)+39:IFPEEK(2917)THENW4=W4-1
1540 FORW1=XTOY:IFTT$(W1)=""ORTT$(W1)=""THEN1560:ELSEW2=0:I$=TT$(W1):FORI=1TOLEN(I$):IFMID$(I$,I,1)<>" "ANDW2=0THENW2=I
1550 NEXTI:I$=RIGHT$(I$,LEN(I$)-(W2-1)):I=LEN(I$):FORW3=0TO((((W4+1)/2)-(I/2))-1):I$=" "+I$:NEXTW3:TT$(W1)=I$
1560 NEXTW1:I=FRE(1):O$="text centered":GOSUB4:GOTO1100
1595 IFI=0THENO$=O$+" off":RETURN:ELSEO$=O$+" on":RETURN
1600 O$="{ct k}{black}lines  :"+STR$(L-1)+" (l/n:":I=PEEK(2917):GOSUB1595:O$=O$+"){f7}(w/w:":I=PEEK(2850):GOSUB1595:O$=O$+") (gfx:":I=O(7):GOSUB1595:O$=O$+"){ct k}":GOSUB4
1610 O$="{black}s)ave text  a)bort      e)dit line  {f7}d)elete     l)ist text  n)ew  (clear)":GOSUB4
1620 O$="v)iew text  i)nsert     x) copy txt {f7}u)cg toggle w)w toggle  t)oggle line #s":GOSUB4
1625 O$="c)enter     r)eplace ln":IFMID$(U$(8),4,1)="1"THENO$=O$+" g)et  p)ut  {f7}o)utput     *)bit edit  b)it list":GOSUB4:ELSEGOSUB4
1630 O$="{ct k}{black}command (return=exit): {ct c}":GOSUB4:DO:GOSUB8:W1$=CHR$(ASC(A$)OR128):LOOPUNTILINSTR("{cm n}BGPOHSEDLNVIAUWTCRX"+CHR$(141),W1$)>0:O$=A$:GOSUB4:IFA$=R$THEN1100
1640 O(13)=1:A$=W1$:GOTO1120
1650 E=0:X=0:Y=0:W1=0:IFINSTR("EIR{cm n}",A$)THEN1680:ELSEO$="from line: {ct c}":GOSUB4:GOSUB10:IFI<1ORI>L-1THENE=1:RETURN:ELSEIFI$=""THENW1=1:X=1:RETURN
1660 X=I:O$="  to line: {ct c}":GOSUB4:GOSUB10:IFI$<>""ANDI>1THENIFI<X ORI>L-1THENI=X
1670 Y=I:RETURN
1680 O$="which line: {ct c}":GOSUB4:GOSUB10:IFI<1ORI>L-1THENE=1:RETURN:ELSEIFI$=""THENW1=1:X=1:RETURN:ELSEX=I:RETURN
1700 GOSUB1170:IFE=1ORW1=1THEN1100:ELSEONPEEK(2917)GOSUB1130:O$="rewrite line"+STR$(X):GOSUB4:ONPEEK(2917)GOSUB1130:O$=TT$(X):GOSUB4:GOSUB6
1710 IFI$=""THENO$="(no change)":GOSUB4:GOTO1100:ELSETT$(X)=I$:GOTO1100
1720 IFMID$(U$(8),4,1)<>"1"THEN1100
1725 O$="{ct k}filename: {ct c}":GOSUB4:GOSUB6:SY$=I$:IFI$=""THEN1100:ELSEO$="  device: {ct c}":GOSUB4:GOSUB10:D(3,0)=I:IFI<8ORI>30THEN1100:ELSEO$="   drive: {ct c}":GOSUB4:GOSUB10
1730 D(3,1)=I:IFI<0ORI>254ORI$=""THEN1100:ELSEIFW1$="P"THEN1770:ELSEO$="filelink: {ct c}":GOSUB4:GOSUB10:IFI$=""THEN1100
1740 O$="{ct k}loading...{ct c}":GOSUB4:POKE253,0:OPEN1,D(3,0),15:OPEN2,D(3,0),2,MID$(STR$(D(3,1)),2)+":"+SY$+",s,r":INPUT#1,E:IFI>0THENFORX=1TOI:SYS8213:NEXT
1750 IFPEEK(253)ORETHENCLOSE1:CLOSE2:O$="not found.{ct k}":GOSUB4:GOTO1100
1760 SYS8222:TT$(L)=I$:L=L+1:IFI$="{white}{f4}"THENL=L-1:GOTO1760:ELSEIFI$=CHR$(1)THENL=L-1:POKE253,1
1765 IFPEEK(253)THENCLOSE1:CLOSE2:O$="done.{ct k}":GOSUB4:GOTO1100:ELSE1760
1770 GOSUB1170:IFE=1THEN1100:ELSEIFW1=1ORY<1THENY=L-1
1780 O$="{ct k}saving...{ct c}":GOSUB4:OPEN1,D(3,0),15:OPEN2,D(3,0),2,MID$(STR$(D(3,1)),2)+":"+SY$+",s,w":INPUT#1,E:IFETHENCLOSE1:CLOSE2:O$="error.{ct k}":GOSUB4:GOTO1100
1790 FORI=XTOY:PRINT#2,TT$(I):NEXTI:CLOSE1:CLOSE2:O$="{left*6}ed.   {ct k}":GOSUB4:GOTO1100
1800 GOSUB1170:IFE=1ORMID$(U$(8),4,1)<>"1"THEN1100:ELSEIFW1=1ORY<1THENY=L-1
1810 IFPEEK(2823)=0THEN1100:ELSEO$="print (y/n)?{ct c}":GOSUB4:C$="YN":GOSUB32:O$=CHR$(ASC(A$)AND127):GOSUB4:IFI=2THEN1100:ELSEO$="{ct k}printing...{ct c}":GOSUB4
1820 OPEN4,4,7:GOSUB400:PRINT#4,R$R$"Filename: "+F$+"     Date: "+O$(3)+R$:FORI=XTOY:I$=TT$(I):FORE=1TO4:W1=INSTR(I$,MID$("{ct k}{f6}{f5}{f7}",E))
1830 IFW1THENMID$(I$,W1,1)=MID$(R$+R$+CHR$(34)+" ",E)
1840 NEXTE:PRINT#4,I$:NEXTI:CLOSE4:OPEN1,U,15,"i"+MID$(STR$(D),2):CLOSE1:O$="done.{ct k}":GOSUB4:GOTO1100
1850 IFO(19)>0THEN1100:ELSEGOSUB1170:O$="{white}":GOSUB9:IFE=1THEN1100:ELSEIFW1=1ORY<1THENY=L-1
1860 DO:I=X:GOSUB1130:O$=TT$(X):POKE251,34+(SGN(PEEK(215))*40):IFO$=""THEN1865:ELSESYS4864
1865 O$=R$:GOSUB9:X=X+1:GOSUB1445:LOOPUNTILX>YORA$=" ":GOTO1100
1870 IFO(19)>0THEN1100:ELSEGOSUB1170:IFE=1ORW1=1THEN1100:ELSEIFTT$(X)=""THENTT$(X)=" "
1875 ONPEEK(2917)GOSUB1130:O$="rewrite line"+STR$(X):GOSUB4:O$=TT$(X):POKE250,121:SYS4867:TT$(X)=I$:GOTO1100
1900 GOSUB1170:IFE=1THEN1100:ELSEIFL>=O(8)THEN1150:ELSEIFX<1ORY<1THENO$="range expected":GOSUB4:GOTO1100
1910 DO:TT$(L)=TT$(X):X=X+1:L=L+1:LOOPUNTILX>YORL>=O(8):IFL>=O(8)THEN1150:ELSEO$="range copied":GOSUB4:GOTO1100
2000 O$(10)="REP":I$="prg.news":U=D(0,0):D=D(0,1):GOTO23
7999 REM --------- MAIN OPCODES
8000 E=0:GOSUB990:IFINSTR(SY$,"*")=0THEN8005:ELSEF$=LEFT$(SY$,LEN(SY$)-1):O$=T$(2)+F$+"{ct c}":GOSUB4:POKE2895,1:POKE2847,16
8003 GOSUB6:IFI$=""THENE=1:RETURN:ELSEF$=F$+I$:RETURN
8005 F$=SY$:IFRIGHT$(F$,2)="/a"ANDPEEK(2829)THENF$=LEFT$(F$,LEN(F$)-2):RETURN:ELSERETURN
8010 GOSUB990:IFSY$<>"*"THEN8015:ELSEO$=T$(3):GOSUB4:POKE2895,1:POKE2847,2:GOSUB10:U=I:IFI<8ORI>30THENU=8:GOTO8020:ELSE8020
8015 IFLEN(SY$)>1ANDLEN(SY$)<4ANDLEFT$(SY$,1)="#"THENI=VAL(MID$(SY$,2)):U=D(I,0):D=D(I,1):GOSUB990:RETURN:ELSEU=VAL(SY$):GOSUB990:D=VAL(SY$):RETURN
8020 GOSUB990:O$=T$(4):GOSUB4:POKE2895,1:POKE2847,2:GOSUB10:D=I:IFD<0ORD>9ORI$=""THEND=0:RETURN:ELSERETURN
8030 GOSUB8000:IFETHENGOSUB990:GOSUB990:RETURN:ELSEGOSUB8010:RETURN
8040 GOSUB8000:ONEGOTO920:O$(15)=O$(16):GOTO900
8050 GOSUB8030:ONEGOTO920:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",p,r":GET#2,A$:IFSTTHENCLOSE2:O$=T$(5):GOSUB4:GOTO920:ELSECLOSE2:I$=F$:GOTO23
8060 O$=T$(6):GOSUB4:X=16:GOSUB15:I=VAL(I$):W1$=I$:IFI$=""ORI>M(14)ORI=IDTHENA=0:RETURN:ELSEIFI>0THENA=I:GOTO8080
8070 A=0:O$=T$(7):GOSUB4:DO:A=A+1:A$=UI$(A):LOOPUNTILA$=W1$ORA>M(14)ORA$="":IFA$<>W1$ORA$=U$(1)ORA>M(14)THENO$=T$(8):GOSUB4:A=0:RETURN
8080 IFUI$(A)="^"ORUI$(A)=""ORA>M(14)THENA=0:RETURN
8090 IFI$=UI$(A)THENRETURN:ELSEO$="{ct k}{black}Is "+UI$(A)+" correct (y/n)? {ct c}":GOSUB4:C$="NY":GOSUB28:IFI=1THENA=0:RETURN:ELSERETURN
8100 GOSUB990:IFSY(4)THENA=SY(4):SY(4)=0:GOSUB8080:GOTO8110
8105 IFSY$<>"*"THENA=VAL(SY$):GOSUB8080:ELSEGOSUB8060:I=FRE(1)
8110 GOSUB8120:GOTO940
8120 IFA=0ORA=IDTHENRETURN:ELSECLOSE1:U=D(5,0):D=D(5,1):F$="mail."+STR$(A):GOSUB400:O$(5)=U$(1)+R$+STR$(ID)+R$+O$(3)
8125 O(12)=0:GOSUB1000:IFO(11)ORLEFT$(F$,4)<>"mail"THENRETURN:ELSEU(5)=U(5)+1:O$=O$(10)+":ID"+MID$(F$,INSTR(F$,".")+1):GOSUB7:RETURN
8130 O$=T$(7):GOSUB4:W5=0:O(14)=1:W7=O(2)
8140 CLOSE1:CLOSE2:OPEN1,U0,15:OPEN2,U0,2,MID$(STR$(D0),2)+":"+F0$+",s,r":INPUT#1,I:IFI>20THENO$=T$(16):GOSUB4:CLOSE2:W7=0:CLOSE1:O(14)=0:RETURN
8150 IFW5THENFORI=1TOW5:SYS8213:NEXTI:IFPEEK(253)THEN8240
8155 SY$(4)="":A$="":SYS8222:IFLEFT$(I$,1)="#"THENSY$(4)=MID$(I$,INSTR(I$,"{f4}")+1):A$="{ct k}{yellow}   Source: {white}"+MID$(I$,2):SYS8222
8160 W5$=I$:SYS8222:W6=VAL(I$):SYS8222:C$=""
8170 O$="{clear}{ct k}{yellow}  Sent by: {white}"+W5$+"{yellow} (ID#{white}"+STR$(W6)+"{yellow}){ct k}Date/Time: {white}"+I$+A$:GOSUB4:SYS8210
8180 CLOSE2:O(14)=1:O$="{ct n}{ct k}{black}R)eply, H)old, A)gain,{f7}F)orward, Q)uit, or N)ext: {ct c}":GOSUB4:C$="RHANQF":GOSUB28:IFI=1THEN8230
8190 IFI=3THEN8140:ELSEIFI=5THENPRINT#1,"s"+MID$(STR$(D0),2)+":mail.work":INPUT#1,I:W7=O(2):GOTO8250
8195 U1=U0:D1=D0:W5$="mail.work":IFI=6THENGOSUB8060:ON(A+1)GOTO8140:W5$="mail."+STR$(A):U1=D(5,0):D1=D(5,1):W7=W7-1:IFU1<>U0THENOPEN15,U1,15
8200 IFI=4THENO$=T$(14):GOSUB4:W5=W5+1:W7=W7-1:GOTO8140:ELSEIFI=2THENW7=W7+1
8205 O$="Saving...{ct c}":GOSUB4:OPEN3,U1,3,MID$(STR$(D1),2)+":"+W5$+",s,a":PRINT#3,CHR$(1):INPUT#1,I:IFU1<>U0THENINPUT#15,I
8210 IFI>20THENCLOSE3:OPEN3,U1,3,MID$(STR$(D1),2)+":"+W5$+",s,w"
8220 OPEN2,U0,2,MID$(STR$(D0),2)+":"+F0$+",s,r":IFW5=0THEN8225:ELSEFORI=1TOW5:SYS8213:NEXTI:IFPEEK(253)THEN8240
8225 GOSUB31:CLOSE2:CLOSE3:CLOSE15:O$="{left*6}ed!    {ct k*2}":GOSUB4:I=4:GOTO8200
8230 IFSY$(4)=""THENA=W6:GOSUB8120:GOTO8140:ELSEU=D(5,0):D=D(5,1):OPEN2,D(1,0),2,MID$(STR$(D(1,1)),2)+":sys.network"
8231 X=0:DO:X=X+1:RECORD#2,X:FORI=1TO3:SYS8222:NEXT:LOOPUNTILMID$(I$,2)=SY$(4)ORX>26:IFX>26THENO$=T$(89):GOSUB4:CLOSE2:GOTO8180
8233 GOSUB400:SYS8222:F$="net."+MID$(I$,2):RECORD#2,27:FORI=1TO3:SYS8222:NEXT:CLOSE2:O$(5)=SY$(4)+R$+MID$(I$,2)+R$+"1"+W5$+R$+U$(1)+R$+STR$(ID)+R$+O$(3)
8235 GOSUB8125:GOTO8140
8240 CLOSE3:CLOSE2:O$=T$(15):GOSUB4:C$="YN":GOSUB28:IFI=2THENI=5:GOTO8190
8245 CLOSE1:OPEN1,U0,15,"s"+MID$(STR$(D0),2)+":"+F0$:PRINT#1,"r"+MID$(STR$(D0),2)+":"+F0$+"=mail.work":INPUT#1,I
8250 CLOSE1:CLOSE3:CLOSE2:O(14)=0:RETURN
8260 U0=D(5,0):D0=D(5,1):F0$="mail."+STR$(ID):OPEN1,U0,15,"s"+MID$(STR$(D0),2)+":mail.work":GOSUB8130:GOTO940
8270 U=D(6,0):D=D(6,1):F$="sys.feedback":GOSUB400:O(12)=0:O$(5)=U$(1)+R$+STR$(ID)+R$+O$(3):GOSUB1000:IFO(11)=0THENO(2)=O(2)+1:GOTO940:ELSE920
8280 F0$="sys.feedback":U0=D(6,0):D0=D(6,1):OPEN1,U0,15,"s"+MID$(STR$(D0),2)+":mail.work":GOSUB8130:O(2)=W7:IFO(2)<0THENO(2)=0:GOTO940:ELSE940
8290 GOSUB8030:IFETHENGOSUB990:GOTO920:ELSEE=0:GOSUB990
8300 IFSY$="-"THENO(12)=1:ELSEIFSY$="*"THENGOSUB8400:GOTO8310:ELSEIFSY$="+"THENO(12)=0:GOTO8320:ELSEO(10)=VAL(SY$):O(12)=2
8310 GOSUB8330:IFO(11)=1THEN920
8320 GOSUB1000:GOTO940
8330 O(11)=0:O$(5)="":L=1:OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":INPUT#1,I:IFI>20THENCLOSE1:CLOSE2:O$=T$(16):GOSUB4:O(12)=1:RETURN
8340 IFO(12)<>2THEN8350:ELSEIFO(10)=0THEN8350:ELSEFORX=0TOO(10)-1:SYS8213:NEXTX:IFPEEK(253)THENCLOSE2:CLOSE1:O$=T$(17):GOSUB4:O(11)=1:RETURN
8350 O$=T$(18):GOSUB4
8360 SYS8222:IFPEEK(253)THENCLOSE2:CLOSE1:A=FRE(1):TT$(L)=I$:L=L+1:O(9)=1:RETURN
8370 IFI$=CHR$(1)ANDO(12)=2THENCLOSE2:CLOSE1:A=FRE(1):O(9)=1:RETURN
8380 IFI$=CHR$(142)THENO(7)=1:ELSEIFI$="{white}{f4}"THENFORI=1TOL-1:O$(5)=O$(5)+TT$(I)+R$:NEXTI:O$(5)=LEFT$(O$(5),LEN(O$(5))-1):L=1:GOTO8360
8390 TT$(L)=I$:L=L+1:GOTO8360
8400 O$=T$(19):GOSUB4:GOSUB10:O(10)=I:O(12)=2:RETURN
8410 GOSUB8030:IFETHENGOSUB990:GOTO920:ELSEGOSUB990:X=VAL(SY$):IFSY$="*"THENGOSUB8400:O(10)=0:O(12)=0:X=I
8415 IFX=0ANDSY$<>"+"THENGOSUB25:GOTO940:ELSEOPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",s,r":IFX>0THENFORI=1TOX:SYS8213:NEXTI:IFPEEK(253)THEN8435
8420 SYS8210:IFSY$="+"ANDPEEK(255)THENO$="{ct k}{ct n}{black}J)ump, Q)uit, A)gain, (RETURN = Next): {white}{ct c}":GOSUB4:C$="JQA"+R$:GOSUB28:ONIGOTO8425,8435,8430:X=X+1:GOTO8420:ELSE8435
8425 O$="{ct k}{black}Jump to #{white}{ct c}":GOSUB4:GOSUB10:IFI>=0ANDI$<>""THENX=I
8430 CLOSE1:CLOSE2:GOTO8415
8435 INPUT#1,I:CLOSE1:CLOSE2:GOTO940
8440 GOSUB990:C$=SY$:GOSUB990:C$=C$+SY$:GOSUB28:IFINSTR(SY$,A$)THEN940:ELSE920
8450 GOSUB990:POKE2844,1:X=20:GOSUB16:IFI$=SY$THEN940:ELSEO$=T$(20):GOSUB4:GOTO920
8460 POKE2829,ABS(PEEK(2829)-1):IFPEEK(2829)=1THENO$=T$(21):ELSEO$=T$(22)
8470 GOSUB4:GOSUB300:GOTO940
8480 POKE2845,ABS(PEEK(2845)-1):IFPEEK(2845)=1THENO$=T$(23):ELSEO$=T$(24)
8490 GOSUB4:GOTO940
8500 GOSUB990:IFPEEK(2829)=VAL(SY$)THEN940:ELSEGOTO920
8510 GOSUB990:I$=SY$:GOSUB990:A$=MID$(STR$(VAL(SY$)),2):Y=0:FORX=1TO26:IFMID$(I$,X,1)="1"ANDMID$(U$(9),X,1)=A$THENY=1
8520 NEXTX:IFYTHEN940:ELSEGOTO920
8530 GOSUB990:I$=SY$:GOSUB990:A$=MID$(STR$(VAL(SY$)),2):Y=0:FORX=1TO26:IFMID$(I$,X,1)="1"ANDMID$(U$(9),X,1)<>A$THENY=1
8540 NEXTX:IFYTHEN920:ELSEGOTO940
8550 GOSUB990:X=VAL(SY$):IFX=0THENPOKE2896,ABS(PEEK(2896)-1):ELSEPOKE2896,1
8560 GOSUB300:IFPEEK(2896)=1THENO$=T$(25):GOSUB4:X=PEEK(238)-15:GOSUB5:IFPEEK(2896)=2ORI$=""THEN940
8570 O$="Sub: "+I$:GOSUB250:IFPEEK(2896)THENO$=T$(26):GOSUB4:FORX=1TO9:O$="{black}.{ct g}{ct c}":GOSUB4:SLEEP1:NEXTX:O$="{black}.{ct g}":ELSEO$=T$(27)
8580 GOSUB4:GOTO940
8590 GOSUB990:Y=0:C$=SY$:IFC$="*"THENY=1:O$=T$(28):GOSUB4:GOSUB6:C$=I$:IFI$=""THENGOSUB990:GOSUB990:GOTO940
8600 GOSUB8010:CLOSE1:OPEN1,U,15:PRINT#1,C$:INPUT#1,A,I$,W1,W2:CLOSE1:IFYTHENO$="{ct k}{black}Status:"+STR$(A)+","+I$+","+STR$(W1)+","+STR$(W2):GOTO940:ELSE940
8610 GOSUB990:W1$=SY$:IFSY$="*"THENGOSUB8640:GOTO8620:ELSEIFSY$="**"THENW1$="*"
8620 GOSUB8010:GOSUB990:I=0:IFSY$="*"THENGOSUB8650:GOTO8630:ELSEIFSY$="#"THENW1$=CHR$(UB(1)+192)+W1$:I=UB(1)+192:U=D(8,0):D=D(8,1):ELSEI=VAL(SY$)
8630 OPEN2,U,0,"$"+MID$(STR$(D),2)+":"+W1$:POKE253,I:SYS8219:CLOSE2:GOTO940
8640 O$=T$(29):GOSUB4:POKE2847,16:POKE2895,1:GOSUB6:IFI$=""THENW1$="*":RETURN:ELSEW1$=I$:RETURN
8650 O$=T$(30):GOSUB4:POKE2847,1:POKE2895,1:GOSUB6:IFI$=""THENI=0:RETURN:ELSEI=ASC(I$):RETURN
8660 GOSUB990:IFRND(TI)=>VAL(SY$)/100THEN920:ELSE940
8690 O(1)=1:I$="prg.new user":U=D(0,0):D=D(0,1):GOTO23
8700 GOSUB760:IFI>0ANDI<M(14)THEN8710
8705 O$=T$(31):GOSUB4:X=16:GOSUB15:I=VAL(I$):IFI=0ANDI$<>""THEN8710:ELSEIFI=0ORI>M(14)THENI=1
8710 O$=R$:GOSUB9:X=I:DO:IFIORLEFT$(UI$(X),LEN(I$))=I$THENIFUI$(X)<>"^"ANDUI$(X)<>""THENO$="{black}"+MID$(STR$(X),2)+") "+UI$(X):GOSUB4
8720 X=X+1:GOSUB1445:LOOPUNTILUI$(X)=""ORA$=" ":GOTO940
8730 O(15)=1:GOTO600
8740 GOSUB990:IFSY$="*"THENO$=T$(32):GOSUB4:X=38:GOSUB5:O$(12)=I$:GOTO940:ELSEO$(12)=SY$:GOTO940
8750 GOSUB990:O$=SY$+"{ct c}":GOSUB4:GOTO940
8760 GOSUB990:A$=SY$:I=INSTR(O$(7),A$):IFITHEN930:ELSEGOTO940
8770 IFSY(4)THENI=SY(4):SY(4)=0:ELSEO$="{ct k}{black}Current baud is"+STR$(BA)+",{f7}enter new baud rate: {ct c}":GOSUB4:GOSUB10
8775 IFI<100ORI>1199ORBA>1199THENO$="{ct k}Out of range.":GOSUB4:GOTO920
8780 O$="{ct k}{black}Set your term for"+STR$(I)+" baud,{f7}and press return.":GOSUB4:GOSUB450:C$=R$:GOSUB28:GOSUB100:GOTO940
8790 GOSUB990:W1$=SY$:IFSY$="*"THENGOSUB8640
8800 GOSUB8010:OPEN2,U,0,"$"+MID$(STR$(D),2)+":"+W1$:SYS8228:CLOSE2:O$="{ct k}{black}"+MID$(STR$(PEEK(2858)+256*PEEK(2859)),2)+" files counted.":GOSUB4:GOTO940
8810 IFO$(16)=""THEN920:ELSEF$=O$(16):C$=O$(7):U=D(9,0):D=D(9,1):A=1:GOTO915
8820 GOSUB990:IFSY$="*"THEN920:ELSESY$=";"+SY$+";"
8830 IFINSTR(SY$,";"+MID$(STR$(ID),2)+";")THEN940:ELSE920
8860 GOSUB990:IFSY$<>"*"THENW1=ASC(SY$)-192:GOTO8870:ELSEO$=T$(33):GOSUB4:X=1:GOSUB5:W1=ASC(I$)-192:IFW1<1ORW1>26THEN920
8870 GOSUB990:IFSY$<>"*"THENA=VAL(SY$):GOTO8880:ELSEO$=T$(90):GOSUB4:C$="CS"+R$:GOSUB28:IFI=3THEN920:ELSEA=I-1
8880 MID$(U$(9),W1,1)=RIGHT$(STR$(A),1):GOTO940
8890 GOSUB990:O$(13)=SY$:GOTO940
8900 GOSUB990:U(2)=U(2)+VAL(SY$):GOTO940
8910 GOSUB990:O(VAL(SY$))=0:GOTO940
8920 GOSUB990:IFU(2)>=VAL(SY$)THEN940:ELSEO$=T$(34):GOSUB4:GOTO920
8930 GOSUB8030
8940 POKE2931,0:POKE2932,U:POKE2933,D:POKE2934,LEN(F$):FORI=1TOLEN(F$):POKE2934+I,ASC(MID$(F$,I,1)):NEXTI:POKE2930,1
8950 O$=LEFT$(F$+SP$,12):X=PEEK(238)-12:Y=24:GOSUB30:F$=""
8960 I=FRE(1):SYS8234:IFPEEK(2931)>0THEN8970:ELSEIFPEEK(2932)=0THEN36000:ELSE8980
8970 POKE2931,0:O$(11)="":U=D(0,0):D=D(0,1):IFPEEK(2894)=0THENTRAP8975:DCLEARU(D(0,0)):ELSEIFPEEK(2961)<2THEN940:ELSEIFI$="prg.monster":GOTO23
8975 TRAP360:I$="prg.logon":GOTO23
8980 SYS8240:FORI=1TOPEEK(2934):F$=F$+CHR$(PEEK(2934+I)):NEXTI:SYS15622:LOAD(MID$(STR$(PEEK(2933)),2)+":"+F$),PEEK(2932)
8990 IFO$(15)=""THEN920:ELSEF$=O$(15):GOTO900
9000 GOSUB8030:IFETHENGOSUB990:GOTO920:ELSEE=0:GOSUB990
9010 IFSY$="-"THENO(12)=1:ELSEIFSY$="+"THENO(12)=0:ELSEO(10)=VAL(SY$):O(12)=2
9020 GOSUB400:O$(5)="{yellow}Message by: {white}"+U$(1)+"{yellow} (ID#{white}"+STR$(ID)+"{yellow}){ct k} Posted on: {white}"+O$(3)+"{ct k}":GOSUB1000:GOTO940
9030 GOSUB990:C$=SY$:GOSUB990:IFLEN(C$)<>LEN(SY$)THENO$="{ct k}{black}Bad datafield!":GOSUB4:GOTO920
9040 GOSUB28:A$=MID$(SY$,I,1):GOTO710
9050 GOSUB990:IFMID$(SY$,ASC(U$(5))-192,1)<>"1"THEN920:ELSE940
9060 IFPEEK(2829)THENO$=T$(91):GOTO9070:ELSEPOKE2979,ABS(PEEK(2979)-1):O$=T$(92+PEEK(2979))
9070 GOSUB4:GOSUB300:GOTO940
9080 OPEN1,D(5,0),15:OPEN2,D(5,0),2,MID$(STR$(D(5,1)),2)+":mail."+STR$(ID)+",s,r":INPUT#1,E:IFE>0THENCLOSE2:CLOSE1:RETURN:ELSEX=1:O$="{ct k}{white}{ct c}":GOSUB4
9090 SYS8222:O$=MID$(STR$(X),2)+".  {yellow}Sent by: {white}"+I$:SYS8222:O$=O$+"  {yellow}(ID#{white}"+I$+"{yellow}){f7}   "+MID$("    ",1,LEN(I$)-1):SYS8222:O$=O$+"{yellow}   Date:{white} "+I$:GOSUB4:SYS8213
9095 GOSUB8:IFPEEK(253)>0ORA$=" "THENCLOSE1:CLOSE2:RETURN:ELSEX=X+1:GOTO9090
9100 GOSUB9080:IFETHEN920:ELSE940
9110 GOSUB990:I=ASC(SY$)-192:IFI<1ORI>26THENI=VAL(SY$):IFI<1ORI>26THEN940
9120 IFMID$(O$(26),I,1)="0"THEN940:ELSE920
