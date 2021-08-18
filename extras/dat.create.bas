!--------------------------------------------------
!- Saturday, May 20, 2017 1:33:44 AM
!- Import of : 
!- c:\src\zelch128\extras\dat.create.prg
!- Unknown Machine
!--------------------------------------------------
5 :::::::::::::::::::::::::::::::::::::INPUT"unit,drive:";U,D
10 OPEN2,U,2,MID$(STR$(D),2)+":dat.users,l,"+CHR$(127)
20 INPUT"create how many files (max=500)";A:IFA>500 OR A<0THEN20
30 INPUT"resume' option available (1=yes, 0=no)";B
35 INPUT"drive, lu for resume's (enter as 8,0)";D,LU
40 RECORD#2,A+1:PRINT#2,"0"
50 RECORD#2,1:PRINT#2,STR$(A)+CHR$(13)+STR$(B)+CHR$(13)+STR$(D)+CHR$(13)+STR$(LU)
55 REM ID, HANDLE, INFO/RESUME, NAME, PHONE, ANSWERS
60 A$="0"+CHR$(13)+"^"+CHR$(13)+"00"+CHR$(13)+"^"+CHR$(13)+"^"+CHR$(13)
70 A$=A$+"0000000000000000000"+CHR$(13)
80 FORI=2TOA:RECORD#2,I:PRINT#2,A$;:NEXTI:CLOSE2:END

