!--------------------------------------------------
!- Saturday, August 13, 2016 1:35:47 PM
!- Import of : 
!- c:\tmp\newproject\ansi maker.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 FAST
20 PRINT"{clear}ansi maker"
25 INPUT"{down}load ascii tables (y/n)  y{left*3}";L$
26 IFL$="y"ORL$="Y"THENINPUT"                 drive   8,0{left*5}";U,D
27 IFL$="y"ORL$="Y"THENBLOAD"ascii 3b00",U(U),D(D)
28 PRINT"{down*2}working..."
29 FORI=DEC("3a00")TODEC("3aff"):POKEI,0:NEXTI:HI=DEC("3a00")
30 READA$,A$:IFA$="*"THEN40
31 FORX=1TOLEN(A$):IFX<3THEN33
32 POKEHI+X-1,PEEK(DEC("3c00")+ASC(MID$(A$,X,1))):GOTO35
33 POKEHI+X-1,ASC(MID$(A$,X,1))
35 NEXTX:HI=HI+X:POKEHI,0:GOTO30
37 POKEHI+1,0
40 INPUT"{down*2}save (y/n)  y{left*3}";A$:IFA$="n"ORA$="N"THENEND
50 INPUT"    drive   8,0{left*5}";U,D
60 SCRATCH"ansi 3a00",U(U),D(D):BSAVE"ansi 3a00",U(U),D(D),P(14838)TOP(15103)
90 STOP
100 DATA CRSRUP   ,"{up*2}1A"
110 DATA CRSRDOWN ,"{down*2}1B"
120 DATA CRSRRIGHT,"{right*2}1C"
130 DATA CRSRLEFT ,"{left*2}1D"
140 DATA CLEARSCN ,"{clear*2}2J"
150 DATA RED      ,"{red*2}8;31m"
160 DATA LTRED    ,"{pink*2}1;31m"
170 DATA GREEN    ,"{green*2}8;32m"
180 DATA LTGREEN  ,"{light green*2}1;32m"
190 DATA BROWN    ,"{brown*2}8;33m"
200 DATA YELLOW     ,"{yellow*2}1;33m"
210 DATA BLUE       ,"{blue*2}8;34m"
220 DATA LTBLUE     ,"{light blue*2}1;34m"
230 DATA VIOLET     ,"{orange}{purple}8;35m"
240 DATA PURPLE     ,"{purple*2}1;35m"
250 DATA DKCYAN     ,"{dark gray*2}8;36m"
260 DATA GREY       ,"{gray}{dark gray}8;36m"
270 DATA CYAN       ,"{cyan*2}1;36m"
280 DATA DKGREY     ,"{light gray*2}8;37m"
290 DATA WHITE      ,"{white*2}1;37m"
999 DATA DONE,"*"
