!--------------------------------------------------
!- Wednesday, August 18, 2021 12:27:00 AM
!- Import of : 
!- c:\tmp\newproject\mdr.boot.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625
30010 OPEN2,9,2,MID$(STR$(D),2)+":mdr.losers":RECORD#2,31:PRINT#2,STR$(ID)+R$+U$(1)+R$+STR$(VAL(LEFT$(O$(2),6))):CLOSE2
30020 F$="mdr.motel":GOTO8940
