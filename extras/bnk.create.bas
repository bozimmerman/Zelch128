!--------------------------------------------------
!- Tuesday, August 17, 2021 11:55:30 PM
!- Import of : 
!- c:\tmp\z128\bnk.create.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 PRINT"{clear}{down*3}{ct n}Zelch Bank v1.0 Create"
20 INPUT"{down*4}Device, Drive to create files on{space*3}8,0{left*5}";U,D
30 INPUT"# users configured for on system{space*3}500{left*5}";UU
40 PRINT"{down*5}Hit RETURN{sh space}to begin, Q to quit>";
50 GETKEYA$:IFA$="q"ORA$="Q"THENPRINTA$;:END:ELSEIFA$<>CHR$(13)THEN50
60 PRINTA$;:PRINT"{down*2}Working..."
70 OPEN2,U,2,MID$(STR$(D),2)+":bnk.accounts,l,"+CHR$(127):RECORD#2,UU+1:PRINT#2,"Burp!":R$=CHR$(13):A$="0"+R$
80 FORI=1TOUU:RECORD#2,I:PRINT#2,A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$:NEXTI:CLOSE2
90 OPEN2,U,2,MID$(STR$(D),2)+":bnk.records,l,"+CHR$(127):RECORD#2,INT(UU/4):PRINT#2,"Burp!":
100 FORI=1TOINT(UU/4):RECORD#2,I:PRINT#2,"{pound}"+R$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$+A$:NEXTI:CLOSE2
110 PRINT"{down*2}done.":END
