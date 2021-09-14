!--------------------------------------------------
!- Monday, September 13, 2021 11:01:23 PM
!- Import of : 
!- c:\tmp\maps\emp.create.prg
!- Unknown Machine
!--------------------------------------------------
100 TRAP 280
105 COLOR 0,1:COLOR 4,1
110 PRINT "{home*2}{clear}{ct n}{white}Empire File Disk Creator/V5.0
120 PRINT
130 PRINT "Insert empire disk in the":PRINT"appropriate drive and press return"
140 DO:GETKEYA$:LOOPUNTILA$=CHR$(13)
150 PRINT:PRINT:INPUT"Input what is the max plays per day";PL
160 INPUT "What is the max number of players";MAX:INPUT "What drive is empire on";DRIV:PRINT:PRINT "Max plays:";PL:PRINT"Max Players:";MAX:PRINT"Base Drive:";DRIV
170 PRINT:PRINT:INPUT "Save this file (y/n)";SAV$
180 IFSAV$<>"y"AND SAV$<>"n"THEN170
190 IFSAV$="n" THEN END
200 PRINT
210 PRINT "Creating account file..."
220 CLOSE2:DOPEN#2,"emp.players",L150,U(DR):RECORD#2,MAX+1:PRINT#2,"empty":CLOSE2
230 CLOSE2:DOPEN#2,"emp.players",L150,U(DR):RECORD#2,MAX+1:PRINT#2,"empty"
240 FOR XX = 1 TO MAX:RECORD#2,XX,1:PRINT#2,"empty":NEXT XX:CLOSE2
245 CLOSE15:OPEN15,DR,15,"s0:emp.config,emp.reqs,emp.req":CLOSE15
246 PRINT DS$
250 PRINT "Creating Config...":CLOSE2:DOPEN#2,"emp.config",W,U(DR)
260 PRINT#2,PL:PRINT#2,MAX:PRINT#2,DRIV:CLOSE2
270 GOTO 300
280 PRINT:PRINT "{ct g}?";ERR$(ER);"error in";EL
290 CLOSE2::END
300 PRINT:PRINT "Entering 'EMPEROR' Requirements:
310 PRINT
320 INPUT "Acres";AC:INPUT"Serfs";VA:INPUT"Warlords";WA:INPUT"Markets";MA
330 INPUT "Mills";MI:INPUT"Foundries";FO:INPUT"Shipyards";SH:INPUT"Brothels";BR:PRINT "Palace? 100% (automatic!)":11111111111
335 INPUT "Colonies";CJ
340 INPUT "{down}Save (y/n)";S$
350 IFS$<>"y"ANDS$<>"n"THEN340
360 IFS$="n"THEN300
370 PRINT:PRINT "Saving..."
380 CLOSE2:DOPEN#2,"emp.req",W,U(DR):PRINT#2,AC:PRINT#2,VA:PRINT#2,WA:PRINT#2,MA:PRINT#2,MI:PRINT#2,FO:PRINT#2,SH:PRINT#2,BR:PRINT#2,100:PRINT#2,CJ:CLOSE2
390 CLOSE2:DOPEN#2,"emp.reqs",W,U(DR)
400 PRINT#2," "
410 PRINT#2," "
420 PRINT#2,"{light blue}To Become an EMPEROR you
430 PRINT#2,"{light blue}must attain:
440 PRINT#2," "
450 PRINT#2,"{yellow}Acres{space*7}:{red}"+STR$(AC)
460 PRINT#2,"{yellow}Serfs{space*7}:{red}"+STR$(VA)
470 PRINT#2,"{yellow}Warlords{space*4}:{red}"+STR$(WA)
480 PRINT#2,"{yellow}Markets{space*5}:{red}"+STR$(MA)
490 PRINT#2,"{yellow}Mills{space*7}:{red}"+STR$(MI)
500 PRINT#2,"{yellow}Foundries{space*3}:{red}"+STR$(FO)
510 PRINT#2,"{yellow}Shipyards{space*3}:{red}"+STR$(SH)
520 PRINT#2,"{yellow}Brothels{space*4}:{red}"+STR$(BR)
530 PRINT#2,"{yellow}Palace{space*6}: {red}100%"
535 PRINT#2,"{yellow}Colonies{space*4}:{red}"+STR$(CJ)
540 PRINT#2," "
550 PRINT#2,"{light green}>>> {green}Good Luck!! <<<"
560 PRINT#2," "
570 CLOSE2
580 PRINT:INPUT "Recreate the EMPEROR list (y/n)";Y$
590 IFY$<>"y"ANDY$<>"n"THEN580
600 IFY$="n"THEN700
610 CLOSE15:OPEN15,DR,15,"s0:emp.emps":CLOSE15:CLOSE2:DOPEN#2,"emp.emps",U(DR),W
620 PRINT#2," "
630 PRINT#2,"{light blue}Current Emperors..."
640 PRINT#2," "
650 CLOSE2
700 PRINT:PRINT "{white}Empire file disk is now ready":PRINT "Copy empire to appropriate drive and":PRINT "go for it..."
710 PRINT
720 PRINT "{reverse on}{clear}Explanation of files on the disk now:
730 PRINT
740 PRINT "emp.players - holds the data for
750 PRINT "{space*18}all of the players
760 PRINT
770 PRINT "emp.config{space*2}- holds the start-up
795 PRINT
800 PRINT "emp.emps{space*4}- holds the list of all
805 PRINT "{space*18}those who have filled
806 PRINT "{space*18}emperor requirements.
810 PRINT
820 PRINT "emp.reqs{space*4}- holds the list of all
830 PRINT "{space*18}requirements needed to
840 PRINT "{space*18}become an emporer.
850 PRINT
860 PRINT "emp.req{space*9}- this is the data file
870 PRINT "{space*18}of the above...
880 PRINT
890 PRINT "{reverse on}Press Any Key":GETKEYA$
920 PRINT "{reverse on}{clear}Explanation of files you need to make:
922 PRINT "{reverse on}(or modify those already existing)"
930 PRINT
940 PRINT "emp.menu1{space*3}- main menu
950 PRINT
960 PRINT "emp.menu2{space*3}- combat/battle menu
970 PRINT "{space*18}(add 4=hand to hand)
975 PRINT "{space*18}(add 5=quit)
980 PRINT
990 PRINT "emp.menu3{space*3}- investment menu
995 PRINT
1000 PRINT"emp.hand{space*4}- hand to hand combat
1010 PRINT"{space*18}description file."
1015 PRINT"
1020 PRINT"emp.title{space*3}- title screen
1030 PRINT"
1032 PRINT"emp.manif{space*3}- load your ship menu"
1033 PRINT"{space*19}1=grain,2=serfs
1034 PRINT"{space*19}3=warlord,4=navigators"
