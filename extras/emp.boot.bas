!--------------------------------------------------
!- Saturday, May 20, 2017 1:33:53 AM
!- Import of : 
!- c:\src\zelch128\extras\emp.boot.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625
30010 OPEN1,U,15,"s0:sys.work":CLOSE1
30020 GOSUB400:OPEN2,U,2,MID$(STR$(D),2)+":sys.work,s,w":PRINT#2,LEFT$(O$(3),8):PRINT#2,ID:PRINT#2,U$(1):PRINT#2,U$(5):CLOSE2
30030 F$="emp.title":GOSUB25
30040 F$="emp.main":POKE2930,0:POKE2931,0:GOTO8940
55555 SCRATCH"emp.boot",U(PEEK(186)):DSAVE"emp.boot",U(PEEK(186))
