!--------------------------------------------------
!- Tuesday, May 16, 2017 10:27:03 PM
!- Import of : 
!- c:\src\zelch128next\bbs.copy.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 IFPEEK(215)THENFAST
20 CLR:A$="":O$="":I$="":C$="":U=PEEK(186):D=0:U1=U+1:D1=0:DIMTT$(400):DL$="":FORI=1TO80:DL$=DL$+CHR$(20):NEXTI
30 M$(0)="Query":M$(1)="Auto-Replace":M$(2)="Complete Auto":M$(3)="Ramload"
40 IFPEEK(2960)=42THENPRINT"{clear}{down}{ct n}{cyan}Zelch Auto Ramloader v1.0":U1=PEEK(2985):CM=3:I$="*":GOTO610
70 PRINT"{clear}{down}{ct n}{yellow}Zelch 128 File Copier":PRINTCHR$(27)+"e";
80 PRINT"{pink}{cm t*21}":PRINT"{cyan}Source drive:{white}"STR$(U)","MID$(STR$(D),2):PRINT"{cyan}Destination :{white}"STR$(U1)","MID$(STR$(D1),2)
90 PRINT"{down}{cyan}Copy mode   : {white}"M$(CM):PRINT"{down}{yellow}[{white}M{yellow}] {cyan}Copy mode":PRINT"{yellow}[{white}S{yellow}] {cyan}Change source drive"
100 PRINT"{yellow}[{white}D{yellow}] {cyan}Change destination drive":PRINT"{yellow}[{white}${yellow}] {cyan}Directory (source drive)":PRINT"{yellow}[{white}C{yellow}] {cyan}Copy files":PRINT"{yellow}[{white}@{yellow}] {cyan}DOS command"
108 PRINT"{yellow}[{white}Q{yellow}] {cyan}Quit"
110 PRINT"{down}{yellow}[{white}M{yellow},{white}S{yellow},{white}D{yellow},{white}${yellow},{white}C{yellow},{white}@{yellow},{white}Q{yellow}] Command: {white}";
120 GETKEYA$:A$=CHR$(ASC(A$)OR128):IFA$=CHR$(164)THENA$="$":ELSEIFA$=CHR$(192)THENA$="@"
130 I=INSTR("MSD$CQ@",A$):IFITHENPRINTA$:ONIGOTO200,300,400,500,600,150,160
140 GOTO120
150 END
160 PRINT"{down}{cyan}Work on {white}Source{cyan} or"+CHR$(13)+"{white}Destination{cyan} drive: {white}S{left}";:X=U
170 GETKEYA$:IFA$<>CHR$(13)ANDA$<>"d"ANDA$<>"D"THEN170:ELSEIFA$<>CHR$(13)THENPRINTCHR$(ASC(A$)OR128):X=U1:ELSEPRINT
180 PRINT:PRINT"{cyan}>";:GOSUB420:IFI$<>""THENOPEN1,X,15,I$:ELSE70
185 INPUT#1,E,E$,E1,E2:PRINT"{down}{white}";E;"{cyan},{white}";E$;"{cyan},{white}";E1;"{cyan},{white}";E2;:CLOSE1:GETKEYA$:PRINT:GOTO70
199 END
200 PRINT"{down}{yellow}[{white}0{yellow}] {cyan}Prompt filenames and replaces":PRINT"{yellow}[{white}1{yellow}] {cyan}Prompt for names, but auto-replace"
210 PRINT"{yellow}[{white}2{yellow}] {cyan}Complete auto, no prompts":PRINT"{yellow}[{white}3{yellow}] {cyan}Ramload marked files"
220 PRINT"{down}{yellow}[{white}0{yellow},{white}1{yellow},{white}2{yellow},{white}3{yellow}] Copy mode: {white}";
230 GETKEYA$:A$=CHR$(ASC(A$)AND127):I=INSTR("0123",A$):IFITHENPRINTA$:CM=I-1:GOTO70:ELSE230
300 PRINT"{down}{cyan}Source device: {white}";:GOSUB450:IFI<8ORI>30THEN70:ELSEU=I
310 PRINT"{cyan}     drive/lu: {white}";:GOSUB450:IFI<0ORI>255THEN70:ELSED=I:IFU<>U1ORD<>D1THEN70:ELSEPRINT"{down}No single drive copies!"
400 PRINT"{down}{cyan}Destination device: {white}";:GOSUB450:IFI<8ORI>30THEN70:ELSEU1=I
410 PRINT"{cyan}          drive/lu: {white}";:GOSUB450:IFI<0ORI>255THEN70:ELSED1=I:IFU1=UANDD1=DTHENPRINT"{down}No single drive copies!":GOTO300:ELSE70
420 I$=""
425 GETKEYA$:IFA$=CHR$(13)THENPRINT:RETURN:ELSEIFA$<>CHR$(20)THEN435
430 IFLEN(I$)=0THEN425:ELSEI$=LEFT$(I$,LEN(I$)-1):PRINTA$;:GOTO425
435 IFLEN(I$)<(37+(PEEK(215)*40))THENI$=I$+A$:PRINTA$;:GOTO425:ELSEPRINT"{ct g}";:GOTO425
450 I$=""
455 GETKEYA$:IFINSTR("0123456789"+CHR$(20)+CHR$(13),A$)=0THEN455
460 IFA$=CHR$(13)THENPRINT:I=VAL(I$):RETURN
465 IFA$<>CHR$(20)THEN475
470 IFLEN(I$)=0THEN455:ELSEI$=LEFT$(I$,LEN(I$)-1):PRINTA$;:GOTO455
475 IFLEN(I$)<2THENI$=I$+A$:PRINTA$;:GOTO455:ELSEPRINT"{ct g}";:GOTO455
500 I$="":POKE255,0:INPUT"{down}{cyan}Filemask (*)";I$:IFI$=""THENI$="*"
510 POKE2829,1:PRINT"{down}Directory"STR$(U)","MID$(STR$(D),2)"{down}"
520 POKE253,0:OPEN2,U,0,"$"+MID$(STR$(D),2)+":"+I$:SYS8219:CLOSE2
530 PRINT"{down}{cyan}Press any key to continue:";:GETKEYA$:PRINT:GOTO70
600 I$="":POKE255,0:INPUT"{down}{cyan}Filemask (*)";I$:IFI$=""THENI$="*"
605 GOSUB610:GOTO70
610 X=0:Y=0:OPEN2,U,0,"$"+MID$(STR$(D),2)+":"+I$:GET#2,A$:GET#2,A$:SYS8258
620 IFCM>1THENPRINT"{down}Scanning directory...";:ELSEPRINT"{down}{yellow}Copy: [{white}Yes{yellow},{white}No{yellow},{white}Done{yellow},{white}Abort{yellow}]{down}"
630 POKE255,0:POKE253,0:SYS8258:IFPEEK(254)THEN800
640 IFCM>1THEN700
650 PRINT"{yellow}"I$"{pink} ("MID$(STR$(PEEK(2975)+256*PEEK(2976)),2)") {white}:";
660 GETKEYA$:A$=CHR$(ASC(A$)OR128):I=INSTR("YNDA",A$):IFI=0THEN660
670 IFI=1THENPRINT"Yes":X=X+1:TT$(X)=I$:GOTO630
680 IFI=2THENPRINT"No.":GOTO630
690 IFI=3THENPRINT"Done":GOTO800
695 PRINT"Abort!":CLOSE2:RETURN
700 IFCM=3ANDLEFT$(I$,3)="---"THENY=ABS(Y-1):GOTO630
710 IFCM=3ANDY=0THEN630
720 X=X+1:TT$(X)=I$:GOTO630
800 CLOSE2:CLOSE3:IFX=0OR(U=U1ANDD=D1)THENRETURN
810 OPEN1,U,15:OPEN15,U1,15:PRINTCHR$(13)"{down}{cyan}Copying files...":PRINT
820 FORY=1TOX:IFRIGHT$(TT$(Y),2)=",r"THEN900
830 GOSUB999
840 OPEN2,U,2,MID$(STR$(D),2)+":"+TT$(Y)+",r":INPUT#1,E:IFE>0THENCLOSE2:PRINT"Source Error!":GOTO990
850 OPEN3,U1,3,MID$(STR$(D1),2)+":"+TT$(Y)+",w"
860 INPUT#15,E,E$:IFE=0THEN865:ELSECLOSE3:CLOSE2:IFE=63THEN870:ELSEPRINT"  Destination Error: {white}"+E$:GOTO990
865 SYS8255:CLOSE2:CLOSE3:PRINT:PRINT"{up}Finished":GOTO990
870 IFCM>0THEN890:ELSEPRINT"  Replace file (y/n)? {white}";
880 GETKEYA$:A$=CHR$(ASC(A$)OR128):I=INSTR("YNQ",A$):IFI=0THEN880:ELSEPRINTLEFT$(DL$,20);:IFI=2THENPRINT:PRINT"{up}{yellow}Skipped":GOTO990
890 PRINTCHR$(13)"{up}{yellow}Scratch "CHR$(13)"{up}";:PRINT#15,"s"+MID$(STR$(D1),2)+":"+TT$(Y):PRINT#15,"i":GOTO830
900 PRINT"{yellow}Scanning: {white}"TT$(Y)"{yellow}";:OPEN2,U,2,"$"+MID$(STR$(D),2):O$=LEFT$(TT$(Y),LEN(TT$(Y))-2):SYS8261:RL=PEEK(2977):CLOSE2:IFRL=0THENE=0:GOTO860
910 OPEN2,U,2,MID$(STR$(D),2)+":"+O$:H=65535:L=1:R=INT(H/2):FORI=0TO30
920 GOSUB1040:IFETHENH=R:R=R-((H-L)/2):GOTO930:ELSEL=R:R=R+((H-L)/2)
930 NEXTI:PRINTCHR$(13)"{up}{yellow}Creating"CHR$(13)"{up}";:OPEN3,U1,3,MID$(STR$(D1),2)+":"+O$+",l,"+CHR$(RL):RECORD#3,R:RECORD#3,R:PRINT#3,"burp";:TT$(Y)=O$:GOSUB999
940 RECORD#2,1:RECORD#3,1:FORI=1TOR:SYS8255:NEXTI:CLOSE2:CLOSE3:PRINTCHR$(13)"{up}Finished"
990 NEXTY:CLOSE1:CLOSE2:CLOSE3:CLOSE15:IFPEEK(2960)=42THEN2000
995 PRINT"{down}{cyan}Press any key to continue:";:GETKEYA$:PRINT:RETURN
999 PRINT"{yellow}Writing : {white}"TT$(Y)CHR$(27)"q{yellow}";:RETURN
1040 R=INT(R):RECORD#2,R:INPUT#1,E:RETURN
2000 PRINT"{clear}{down*2}{black}new":PRINT"{down*2}run"CHR$(34)"zelch"CHR$(34)",u("U"){home}";
2010 POKE842,13:POKE843,13:POKE208,2:END
55555 A=PEEK(186):OPEN1,A,15,"s0:bbs.copy":CLOSE1:DSAVE"bbs.copy",U(A):STOP
