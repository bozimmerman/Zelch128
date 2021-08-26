!--------------------------------------------------
!- Saturday, May 20, 2017 1:38:13 AM
!- Import of : 
!- c:\src\zelch128\extras\prg.dating boot.prg
!- Unknown Machine
!--------------------------------------------------
30000 SYS15625:REM ========== DATING MODULE LOADER ================= 06/09/91 =
30010 OPEN1,U,15,"s0:sys.work":CLOSE1:A$="0":IFU$(5)="Z"THENA$="1"
30020 OPEN2,U,2,MID$(STR$(D),2)+":sys.datingmeta,s,w":PRINT#2,U$(1)+R$+STR$(ID)+R$+A$+R$+STR$(D(4,0))+R$+STR$(D(4,1))+R$+STR$(M(14)):CLOSE2
30030 F$="prg.dating":POKE2930,0:POKE2931,0:GOTO8940
