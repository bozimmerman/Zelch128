!--------------------------------------------------
!- Thursday, September 16, 2021 3:00:15 PM
!- Import of : 
!- c:\dev\zelch128\ee2\ggg.warr&mons.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:REM ========== WARR MON  MODULE LOADER ============= 06/09/91 =
30010 U=11:D=0:OPEN1,U,15,"s0:wm.data":CLOSE1
30011 F$="wm.intro":GOSUB26
30015 A$=STR$(PEEK(2863)):B$=STR$(PEEK(2879)):C$=STR$(PEEK(2880)):A$=RIGHT$(A$,2):B$=RIGHT$(B$,2):C$=RIGHT$(C$,2):O$=A$+B$+C$
30016 FORX=1TO6:IFMID$(O$,X,1)=" "THENMID$(O$,X,1)="0"
30017 NEXT
30020 OPEN2,U,2,MID$(STR$(D),2)+":wm.data,s,w":PRINT#2,STR$(ID)+CHR$(13)+U$(1)+CHR$(13)+O$+CHR$(13)+STR$(PEEK(2829)):CLOSE2
30030 U=15:D=0:F$="prg.wm.p1":POKE2930,0:POKE2931,0:GOTO8940
