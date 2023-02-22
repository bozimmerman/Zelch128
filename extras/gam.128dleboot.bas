!--------------------------------------------------
!- Wednesday, Feb 18, 2023 12:27:59 AM
!- c:\tmp\newproject\128dleboot.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625
30020 GOSUB400:OPEN2,8,2,"scoredle,l,"+chr$(50)
30030 RECORD#2,502:PRINT#2,"0":RECORD#2,502
30040 RECORD#2,501:PRINT#2,ID,LEFT$(O$(3),8):RECORD#2,501
30050 CLOSE2
30060 F$="gam.128dle":POKE2930,0:POKE2931,0:GOTO8940
