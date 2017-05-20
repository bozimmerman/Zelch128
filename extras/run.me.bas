!--------------------------------------------------
!- Saturday, May 20, 2017 1:33:19 AM
!- Import of : 
!- c:\src\zelch128\extras\run.me.prg
!- Unknown Machine
!--------------------------------------------------
10 REM TYPE "run" AND PRESS RETURN
20 PRINT"{clear}{cyan}  The configurations on your disk include the"
30 PRINT"sequential files necessary to set up certain systems."
40 PRINT"Keep in mind the following points:"
50 PRINT
60 PRINT" {white}o{cyan}  After unpacking your choice configuration, you should
70 PRINT"make sure you have configured the necessary relative files."
80 PRINT
90 PRINT" {white}o{cyan}  Remember that you must set up the message base and"
100 PRINT"u/d base records used by the configurations for everything"
110 PRINT"to work correctly."
120 PRINT
130 PRINT" {white}o{cyan}  On the main menu of all three configurations is an"
140 PRINT"'information' type command.  READ THIS FILE FIRST"
150 PRINT"after logging onto the configuration."
160 PRINT
170 PRINT" {white}o{cyan}  The 'simplicity' configuration was included to serve as"
180 PRINT"a good working setup for small-medium systems.  It features"
190 PRINT"a one menu setup and an open transfer system."
200 PRINT"{down*3}Hit return:";:DO:GETA$:LOOPUNTILA$=CHR$(13)
210 PRINT"{clear}{down*3} {white}o{cyan}  The 'prg' files included with the configurations are"
220 PRINT"necessary for certain functions on that setup to work.  Most"
230 PRINT"'prg' files will go on the definable drive, with the exception"
240 PRINT"of 'prg.dating boot', 'prg.dating', and 'prg.bbs list' from the"
250 PRINT"Elite configuration.  These three files will be looked for on"
260 PRINT"the system program files drive."
270 PRINT
280 PRINT" {white}o{cyan}  Also, most of the 'prg' files included can be used"
290 PRINT"on other configurations with a little menu work."
300 PRINT
310 PRINT"  Welp, have fun, and remember- if you have any questions or"
320 PRINT"problems, give us a call!"
330 PRINT
340 PRINT"    - Elite Software
