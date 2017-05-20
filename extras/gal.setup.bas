!--------------------------------------------------
!- Saturday, May 20, 2017 1:34:36 AM
!- Import of : 
!- c:\src\zelch128\extras\gal.setup.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
1 U=PEEK(186):R$=CHR$(13):I=RND(-TI):GOTO100
2 PRINT#1,"p"CHR$(98)CHR$(I)CHR$(0)CHR$(0):RETURN
55 U=PEEK(186):OPEN1,U,15,"s0:gal.setup":CLOSE1:SAVE"gal.setup",U:STOP
100 OPEN1,U,15,"s0:gal.galaxy":OPEN2,U,2,"gal.galaxy,l,"+CHR$(50)
110 I=36:GOSUB2:PRINT#2,"shit"
120 FORI=1TO10:GOSUB2
130 PRINT#2," 0"+R$+"0000000000"+R$+"^"+R$+" 0"
140 NEXTI
150 DIMP(25,4)
160 FORI=1TO25:P(I,0)=-1:PRINTI,
170 P(I,1)=INT(RND(TI)*35)+1
180 P(I,2)=INT(RND(TI)*20)+1
190 IFI=1THEN230
200 A=0:FORX=1TOI-1
210 IFABS(P(I,1)-P(X,1))<2ANDABS(P(I,2)-P(X,2))<2THENA=1
220 NEXTX:IFATHEN170
230 P(I,3)=INT(RND(TI)*30)+10
240 P(I,4)=(INT(RND(TI)*20)+1)*P(I,3)
250 NEXTI:PRINT:PRINT
260 FORI=11TO35:A$="":GOSUB2:PRINTI,
270 FORX=0TO4:A$=A$+STR$(P(I-10,X))+R$:NEXTX
280 READB$:PRINT#2,B$+R$+LEFT$(A$,LEN(A$)-1)
290 NEXTI:PRINT:PRINT
300 I=36:GOSUB2:PRINT#2," 1"+R$+"03/01/91":CLOSE2:CLOSE1:DIMG(35,20)
310 FORI=1TO25:G(P(I,1),P(I,2))=1:NEXTI
320 FORY=1TO20:PRINT:FORX=1TO35
330 PRINT".";:IFG(X,Y)THENPRINT"{left}o";
340 NEXTX:NEXTY
350 OPEN1,U,15,"s0:gal.missions":OPEN2,U,2,"gal.missions,l,"+CHR$(30)
360 A$="":FORI=1TO6:A$=A$+"0"+CHR$(13):NEXTI
370 I=101:GOSUB2:PRINT#2,"burp":FORI=1TO100:GOSUB2:PRINT#2,A$:NEXTI
380 CLOSE2:CLOSE1:END
1000 DATA "Zelch","Delta IV","Tyraki","Ermini II","Terra","Alphatron"
1010 DATA "Aurorus","Solora","Pheta IX","Nemesis","Phaze","Proton","GammaWorld"
1020 DATA "Freestar","Cyrus","Blade","Bluering","Tertious","Vulga","Betazon"
1030 DATA "Wavern","Plutoia","Quation","Havnon","Karga-Tuk"
