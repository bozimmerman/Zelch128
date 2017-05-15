!--------------------------------------------------
!- Monday, May 15, 2017 12:16:59 AM
!- Import of : 
!- c:\src\zelch128\filecopy.prg
!- Commodore 64
!--------------------------------------------------
11 F$="filecopy.bin":U=8
13 GOSUB9100:GOSUB9050
14 IF F=0 THEN LOAD F$,U,1:GOTO25
20 GRAPHIC1,1
21 BLOAD(F$),P(BA)ONU(U):IFRGR(0)<5THENGRAPHIC0
25 GOSUB9000
40 INPUT "{right}{reverse on}{light gray}your source disk unit{reverse off}{white}  8{left*3}";SU
50 INPUT "{right}{reverse on}{light gray}destination disk unit{white}{reverse off}  9{left*3}";DU:PRINT
60 : IF SU<4 OR SU>31 OR DU<4 OR DU>31 OR SU=DU THEN 10
70 PRINT "{reverse on}{light gray} enter template or <return> {reverse off}{white} ";:M$="":INPUTM$
72 W=0:WW=0:FOR I=1TOLEN(M$):IF "*"=MID$(M$,I,1) THEN W=I:WW=WW+1
73 NEXT: IF WW>1 THEN PRINT"{down}{light gray}bad template": GOTO 120
74 W$=RIGHT$(M$,LEN(M$)-W)
80 DIM N$(200),T$(200),CE(200):Q$=CHR$(34):E$=","
90 OPEN14,SU,15,"i": SC=14:U=SC: GOSUB8000: IFS THEN PRINT"{light gray}{down}"SU":{reverse on}";S$: GOTO120
95 OPEN15,DU,15,"i": DC=15:U=DC: GOSUB8000: IF S THEN PRINT"{down}"DU":{reverse on}";S$: GOTO120
100 GOSUB 9000: GOSUB 1000: GOSUB 2000
110 IF K THEN GOSUB 9000: GOSUB 3000
120 PRINT:PRINT"{reverse on} more (y/n) ? {reverse off}{white} ";:GOSUB4000: IF A$="n" THEN CLR: END
130 CLR:GOSUB9100:GOTO25
1000 REM  READ DIRECTORY INTO N$,T$: N=NUM FILES+1
1010 PRINT "{light gray}reading directory.";
1020 N=0: F$="$": IF LEN(M$)<>0 THEN F$="$:"+M$
1030 OPEN 8,SU,0,F$: U=SC: GOSUB8000
1035 : IF S THEN PRINT: PRINT"{reverse on}";S$: CLOSE8: RETURN
1040 GET#8,A$,B$
1050 : GET#8,A$,A$,A$,A$ :PRINT ".";
1060 :   GET#8,A$: IF LEN(A$)=0 OR ST THEN 1130
1065 :   IF ASC(A$)=0 THEN 1130
1070 :   IF A$<>Q$ THEN 1060
1080 : GET#8,A$: IF A$<>Q$ AND ST=0 THEN N$(N)=N$(N)+A$: GOTO 1080
1090 : GET#8,A$: IF A$=" " THEN 1090
1100 : T$(N)=T$(N)+A$: GET#8,A$: IF A$<>" " AND ST=0 THEN 1100
1110 : GET#8,A$:A$=A$+CHR$(0):IF ASC(A$)<>0 AND ST=0 THEN 1110
1116 : IF N=0 OR W=0 THEN 1120
1117 : IF LEN(N$(N)) < (W-1+LEN(W$)) THEN N$(N)="":T$(N)="": GOTO 1050
1119 : IF W$<>RIGHT$(N$(N), LEN(W$)) THEN N$(N)="":T$(N)="":GOTO1050
1120 : N=N+1: GOTO1050
1130 PRINT:CLOSE 8: GOSUB8000: IF S THEN PRINT"...{reverse on}";S$
1140 PRINT:PRINT N-1;"files targeted" :PRINT : RETURN
2000 REM   DISPLAY FILES & ASK USER WHICH ONES TO COPY
2010 K=0: IF N<2 THEN PRINT" no files found.":RETURN
2020 FOR I=1TON-1:CE(I)=0
2030 : PRINT Q$;N$(I);Q$;TAB(19);T$(I);TAB(25);: IF M$<>"*" THEN 2070
2040 : PRINT:CE(I)=1: K=K+1: NEXT: PRINT
2050 PRINT "{reverse on} continue (y/n) ? {reverse off} ";: GOSUB4000 :IF A$="y" THEN RETURN
2060 K=0: RETURN
2070 PRINT "copy ? (y/n) ";:GOSUB4000 :IF A$="y" THEN CE(I)=1: K=K+1
2080 : NEXT: RETURN
3000 REM   COPY THE FILES
3010 FOR I=1TON-1:IF CE(I)=0 THEN NEXT: RETURN
3020 :T$(I) = LEFT$(T$(I),1): F$=Q$+N$(I)+Q$
3030 OPEN9,DU,9,N$(I): U=DC: GOSUB8000: CLOSE9
3040 : IF S=62 THEN 3100
3050 : PRINT F$;" exists, replace? ";: GOSUB4000:GOSUB 4500
3060 : IF A$="n" THEN PRINT F$;" not copied":NEXT:RETURN
3070 :   PRINT  "scratching old ";F$
3080 :   PRINT#15,"s0:";N$(I): GOSUB8000:GOSUB 4500:IF S>1 THEN 3170
3090 :   GOTO 3030
3100 : IF T$(I)="r" THEN GOSUB 5000:GOTO 3170:REM  COPY REL FILES
3110 :  PRINT "now copying ";F$
3120 :  OPEN9,DU,1,N$(I)+","+T$(I)+",w": U=DC: GOSUB8000 : IF S THEN 3170
3140 :  OPEN8,SU,0,N$(I)+","+T$(I)+",r": U=SC: GOSUB8000 : IF S THEN 3170
3160 :  SYS BA: CLOSE 8: CLOSE 9:U=DC:GOSUB 8000
3170 :  IF S THEN PRINT "{reverse on}{right}copy failed: {reverse off}";S$ : GOTO 3180
3175 :  U=SC:GOSUB 8000
3176 :  IF S THEN PRINT "{reverse on}{right}copy failed: {reverse off}";S$
3180 NEXT: RETURN
4000 GET A$: IF A$<>"y" AND A$<>"n" THEN 4000
4010 PRINTA$: RETURN
4500 PRINT "{up}                                       "+CHR$(13)+"{up}";:RETURN
5000 REM   COPY REL FILES.
5010 PRINT "scanning ";F$
5020 OPEN8,SU,8,N$(I): U=SC: GOSUB 8000: IF S THEN RETURN
5030 L=0:FOR RN=7TO0STEP-1:RG=2^RN: REM SCAN FOR RECLEN
5040 : R=1:L=L+RG:GOSUB 6000:IF S THEN L=L-RG
5050 : NEXT
5060 R=0:FORRN=15TO0STEP-1:RG=2^RN: REM SCAN FOR NUMREC
5070 : R=R+RG: GOSUB 6000: IF S THEN R=R-RG
5080 : NEXT
5100 GOSUB 4500:PRINT "creating ";F$
5110 OPEN9,DU,9,N$(I)+",l,"+CHR$(L)
5120 :  U=DC: GOSUB 8000: IF S THEN RETURN
5130 A$="p"+CHR$(96+8)+CHR$(1)+CHR$(0)+CHR$(1): PRINT#14,A$: PRINT#14,A$
5140 :  U=SC: GOSUB 8000: IF S THEN RETURN
5150 A$="p"+CHR$(96+9)+CHR$(RL)+CHR$(RH)+CHR$(1): PRINT#15,A$: PRINT#15,A$
5160 :  PRINT#9,CHR$(255);: REM WRITE END RECORD
5170 A$="p"+CHR$(96+9)+CHR$(1)+CHR$(0)+CHR$(1): PRINT#15,A$: PRINT#15,A$
5180 :  U=DC: GOSUB 8000: IF S THEN RETURN
5200 GOSUB 4500:PRINT "now copying ";F$
5210 FOR RN=1TOR: SYSBA: NEXT
5220 CLOSE8: CLOSE9: U=DC: GOSUB 8000
5230 RETURN
6000 RH=INT(R/256):RL=R-RH*256 :REM  SEND SRC P CMD.  R=REC#, L=OFFSET
6010 A$="p"+CHR$(96+8)+CHR$(RL)+CHR$(RH)+CHR$(L): PRINT#14,A$: PRINT#14,A$
6020 : U=SC: GOTO8000          :REM GET DISK STAT AND RETURN
8000 INPUT#U,A$,B$,C$,D$: S=VAL(A$): S$=A$+E$+B$+E$+C$+E$+D$ :RETURN
9000 POKE53280,0:POKE53281,0:PRINT"{clear}";
9010 PRINT"{light gray}{cm a}{sh asterisk*29}{cm s}
9020 PRINT"{light gray}{sh -}  {cyan}filecopy utility - v021887{light gray} {sh -}
9030 PRINT"{cm z}{sh asterisk*29}{cm x}":PRINT
9040 RETURN
9045 IFU=12THENPRINT"{right}{light gray}"F$" "B$:END
9050 OPEN15,U,15:OPEN2,U,2,F$+",p,r":CLOSE2:INPUT#15,A,B$,C,D
9055 CLOSE15:IFA>19THENU=U+1:GOTO9045
9060 RETURN
9100 F=ABS(PEEK(65533)=255)           :REM F=0 IF C64, F=1 IF C128
9101 IF F=0 AND BA=0 THEN BA=12*4096
9102 IF F=1 AND BA=0 THEN BA=DEC("c00")
9103 RETURN
