!--------------------------------------------------
!- Saturday, May 20, 2017 1:34:51 AM
!- Import of : 
!- c:\src\zelch128\extras\gam.bagels.prg
!- Unknown Machine
!--------------------------------------------------
10 REM GAME: BAGELS :4-V1.0
20 REM BY VINCE MILLS
30 REM COPYRIGHT OCT 1979 - PERMISSION
40 REM GRANTED FOR FREE DISTRIBUTION.
50 POKE 59468,16
51 GOTO 1000
66 REM -- CHAR INPUT SUBROUTINE ------
70 REM
71 GETA$:GOTO89
75 PRINT;:RETURN
76 REM - GET NON-EMPTY STRING -
77 B$="":IFLE=0THENLE=-1
78 GOSUB66:IFA$=CHR$(13)ANDB$=""THEN78
79 IFASC(A$)=13THENRETURN
80 IFASC(A$)=20ANDLEN(B$)=1THENPRINTCHR$(20);:GOTO 77
81 IFASC(A$)=20ANDLEN(B$)>1THENB$=LEFT$(B$,LEN(B$)-1):PRINTCHR$(20);:GOTO 78
82 IFASC(A$)<32ORASC(A$)>96THEN78
83 PRINT A$;:B$=B$+A$
84 IFLEN(B$)=LEORB$=ST$THENRETURN
85 GOTO78
89 IFA$=""THEN71
90 IFFLG=0ORASC(A$)=13ORASC(A$)=20THEN75
91 IFASC(A$)>57ORASC(A$)<48THEN71
92 GOTO75
1000 REM -- INSTRUCTION BLOCK --------
1010 PRINT"{clear}{right*14}{pink}{cm @*13}"
1020 PRINT"{right*14}{reverse on}{yellow} B a g e l s{sh space}"
1030 PRINT"{right*14}{pink}{cm t*13}"
1035 PRINT
1040 PRINT"{light green}  In this game, I will think of a three-"
1050 PRINT"digit number from 012 to 987 ( zero is"
1060 PRINT"a valid digit ).  Every time you try to"
1070 PRINT"guess this hidden number, I{sh space}will tell"
1080 PRINT"you:"
1090 PRINT"{right*7}{white}Pico {light green}- a{sh space}digit is correct but in"
1100 PRINT"{right*7}{yellow}{cm t*4}{light green}{right*3}the wrong place.{down}"
1110 PRINT"{right*7}{cyan}Fermi{light green}- a digit is correct and in"
1120 PRINT"{right*7}{yellow}{cm t*5}{right*2}{light green}the right place.{down}"
1130 PRINT"{right*7}{light blue}Bagels{light green}-all digits in your guess"
1140 PRINT"{right*7}{yellow}{cm t*6}{right}{light green}are incorrect.{down}"
1150 PRINT"{right*9}{yellow}{cm @*30}"
1160 PRINT"{right*9}{reverse on}{pink} Press any key to continue.   "
1170 PRINT"{right*9}{yellow}{cm t*30}"
1180 GOSUB 66
2000 REM -- GENERATE NUMBER ----------
2001 PRINT"{clear}{yellow}Ok, I have a number in mind.{down*2}"
2002 PRINT"{down}{white}Enter 000 to quit!{down*2}"
2010 FOR I=2 TO 3:A(I)=-1:NEXT
2020 A(1)=INT(RND(1)*10)
2030 A(2)=INT(RND(1)*10)
2040 IF A(2)=A(1) THEN 2030
2050 A(3)=INT(RND(1)*10)
2060 IF A(3)=A(1) THEN 2050
2070 IF A(3)=A(2) THEN 2050
3000 REM -- PLAY GAME ----------------
3001 REM
3010 FOR Q=1 TO 200
3020 PRINT "{pink}Guess #";Q;"{yellow}";
3030 PRINT TAB(12);
3040 FLG=1:LE=3 :GOSUB 77
3045 IFB$="000"THEN3305
3050 IF LEN(B$)<>3 THEN 3100
3060 FOR I=1 TO 3
3070 D$=MID$(B$,I,1)
3090 B(I)=VAL(D$)
3095 NEXT I
3096 GOTO 3110
3100 PRINT:PRINT"{white}Please{sh space}use 3 numbers only.":GOTO 3020
3110 IF B(1)<>B(2) AND B(2)<>B(3) AND B(3)<>B(1) THEN 3125
3120 PRINT"{left*15}{reverse on}{white}Please guess three different numbers.{reverse off}";
3121 FOR LL=1 TO 1000:NEXT LL
3122 PRINT"{left*37}";
3123 PRINT"                                     {up}":GOTO 3020
3125 F=0:P=0
3140 FOR I=1 TO 3
3150 IF B(I)=A(I) THEN F=F+1
3160 IF B(I)=A(1) THEN P=P+1
3170 IF B(I)=A(2) THEN P=P+1
3175 IF B(I)=A(3) THEN P=P+1
3176 NEXT I
3180 P=P-F
3190 PRINT TAB(18);
3195 IF F=3 THEN 3300
3200 IF P=0 THEN 3220
3210 FOR P1=1 TO P:PRINT "{white}Pico ";:NEXT
3220 IF F=0 THEN 3240
3230 FOR F1=1 TO F:PRINT"{cyan}Fermi ";:NEXT
3240 IF F=0 AND P=0 THEN PRINT"{light blue}Bagels";
3245 PRINT
3250 NEXT Q
3300 PRINT"{pink}Y{yellow}o{white}u {cyan}g{light blue}o{blue}t {purple}i{red}t{pink}!{yellow}!{white}!"
3305 PRINT:END
3310 LE=1:FLG=0
3320 GOSUB 77
3330 IF B$<>"y" THEN 32767
3335 FOR I=1 TO 500:NEXT
3340 GOTO 2001
32767 END
