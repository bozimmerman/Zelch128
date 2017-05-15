!--------------------------------------------------
!- Monday, May 15, 2017 12:15:21 AM
!- Import of : 
!- c:\src\zelch128\bbs.create.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 POKE53280,6:POKE53281,6:COLOR6,7:PRINT"{clear}{ct n}{yellow}STEPS FOR CREATING A NEW BBS:"
20 PRINT"{down}{white}1. {cyan}Copy any configurations that you wish to try off of the system"
30 PRINT"configurations disk onto a blank disk.  This will become your {light gray}SYSTEM DATA FILES"
40 PRINT"DISK{cyan}."
50 PRINT"{down}{white}2. {cyan}De-Lynx the copied files. Copy all   files to their appropriate drives as    configured in the SYSTEM EDITOR.":GOTO60
55 SCRATCH"bbs.create":DSAVE"bbs.create":STOP
60 PRINT"{down}{white}3. {cyan}Caffeine plays an important role in  the creation of any bbs--make a pot of  coffee, or visit your local Denny's."
70 PRINT"{down*2}{cyan}[{yellow}RETURN{cyan}] to continue, [{white}ESC{cyan}] to abort":R$=CHR$(13):FORI=1TO12:B$=B$+" 0"+R$:NEXTI
80 GETA$:IFA$=CHR$(13)THEN90:ELSEIFA$=CHR$(27)THENEND:ELSE80
90 PRINT"{clear}{down*2}On which drive is your SYSTEM{sh space}USER{sh space}DATA{sh space}DISK":OPEN1,0:PRINT"> 8,0{left*3}";:INPUT#1,U,D:CLOSE1:PRINT
100 PRINT"{down*2}Shall I format this disk (y/n)?":DO:GETA$:LOOPUNTILA$="y"ORA$="n":IFA$="y"THENPRINT"Grunting..":HEADER"zelch",I90,U(U),D(D)
110 PRINT"{down*2}Hit [Y] to create a new userfile":PRINT"[N] Skips this":DO:GETA$:LOOPUNTILA$="y"ORA$="n":IFA$="n"THEN130:ELSEPRINT"Grinding...":F$="sys.userfiles"
120 SCRATCH(F$),U(U),D(D):OPEN2,U,2,STR$(D)+":"+F$+",l,"+CHR$(127):RECORD#2,1:PRINT#2,B$;:RECORD#2,2:PRINT#2,B$;:CLOSE2
130 PRINT"{clear}{down*2}On which drive is your SYSTEM DATA{sh space}FILES DISK":PRINT"(This may be the same disk/drive as the previous)":PRINT"> 8,0{left*3}";:OPEN1,0:INPUT#1,U,D:CLOSE1
140 PRINT: PRINT"{down*2}Shall I format this disk (y/n)?":DO:GETA$:LOOPUNTILA$="y"ORA$="n":IFA$="y"THENPRINT"Grunting..":HEADER"zelch",I99,U(U),D(D)
150 PRINT"{down}Hit [Y] to create msg base files":PRINT"[N] Skips this":DO:GETA$:LOOPUNTILA$="y"ORA$="n":IFA$="n"THEN190:ELSEPRINT"Grinding..."
160 SCRATCH"sys.msg bases",U(U),D(D):SCRATCH"sys.msg data",U(U),D(D):OPEN2,U,2,STR$(D)+":sys.msg bases,l,"+CHR$(70):FORI=1TO20:RECORD#2,I:PRINT#2,"^"+R$+B$
170 NEXTI:CLOSE2:OPEN2,U,2,STR$(D)+":sys.msg data,l,"+CHR$(15):FORX=1TO1020:RECORD#2,X:PRINT#2,"0000000000"+R$+" 0":NEXTX:FORI=1TO20:RECORD#2,((I-1)*51)+51
180 PRINT#2," 0"+R$+" 1":NEXTI:CLOSE2
190 PRINT"{down}Hit [Y] to create u/d base file":PRINT"[N] Skips this":DO:GETA$:LOOPUNTILA$="y"ORA$="n":IFA$="n"THEN210:ELSEPRINT"Writing..."
200 SCRATCH"sys.u/d bases",U(U),D(D):OPEN2,U,2,STR$(D)+":sys.u/d bases,l,"+CHR$(70):FORI=1TO20:RECORD#2,I:PRINT#2,"^"+R$+B$:NEXTI:CLOSE2
210 PRINT"{down}Hit [Y] to create voting booth":PRINT"[N] Skips this":DO:GETA$:LOOPUNTILA$="y"ORA$="n":IFA$="n"THEN230:ELSEPRINT"Burping..."
220 SCRATCH"sys.voting booth",U(U),D(D):OPEN2,U,2,STR$(D)+":sys.voting booth,l,"+CHR$(55):FORI=1TO20:RECORD#2,I:PRINT#2,"{pound}"+R$+B$:NEXTI:CLOSE2
230 PRINT"Ugh, now off to Denny's!"
