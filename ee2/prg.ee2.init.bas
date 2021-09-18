!--------------------------------------------------
!- Thursday, September 16, 2021 2:57:09 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.ee2.init.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 REM ****** EMPIRE INITIALIZATION MODULE *******************************
20 CLR:FAST:DIM M$(25),P$(11,10),P(11,26)
30 DIM AR%(21,21,11),PR$(401),A$(31),MT$(13)
40 DIM XC(401),YC(401),S(401)
50 FORX=1TO12:READMT$(X):NEXTX
60 U=8:DV=0:REM ---===> DEFAULT DRIVE AND UNIT INFO!  CHANGE AS REQUIRED!!!
70 PRINTCHR$(14):PRINT"{white}{clear}";:POKE53281,0:POKE53280,0
80 XM$(1)="0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 2"
90 XM$(2)="0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0"
100 C$(1)=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,./<>?!#$%&'()0+-{pound}1234567890:;[]"+CHR$(34)
110 Q$=CHR$(34)
120 C$(2)=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
130 C$(3)="1234567890"
140 C$(4)=C$(2)+C$(3)
150 C$(5)=C$(3)+","
160 SP$="{space*46}"
170 MK$(0)="None":MK$(1)="Missles":MK$(2)="Convent.":MK$(3)="Nuclear":MK$(4)="Chemical":MK$(5)="Guns":MK$(6)="Food":MK$(7)="Ore":MK$(8)="Energy"
180 MK$(9)="Airplanes"
190 DOPEN#1,"ee2.data,s",D(DV),U(U),R:IF DS<>0 THEN DCLOSE#1:PRINT "ERROR: Date/User data missing!":END
200 INPUT#1,PA$(1),PA$(2),PA$(3):IF DS<>0 THEN DCLOSE#1:PRINT "ERROR: Date/User data corrupt!":END:ELSE DCLOSE#1
210 DT$=PA$(3)
220 A=VAL(LEFT$(DT$,2)):B=VAL(MID$(DT$,3,2)):C=VAL(RIGHT$(DT$,2)):LD$=MT$(B)+STR$(A)+", 19"+MID$(STR$(C),2)
230 PRINT "{cyan}Empire Edition II -- Initialization Module{white}:"
240 EP$="prg.ee2.main":SR$="prg.ee2.str":MN$="prg.ee2.maint"
250 PRINT "{blue}-->{light blue}Please wait, now loading Empire Edition II."
260 DLOAD(EP$),D(DV),U(U)
270 DATA "January","Febuary","March","April","May","June","July","August","September","October","November","December"
