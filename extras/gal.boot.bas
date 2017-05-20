!--------------------------------------------------
!- Saturday, May 20, 2017 1:34:17 AM
!- Import of : 
!- c:\src\zelch128\extras\gal.boot.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625
30020 GOSUB400:OPEN2,U,2,"gal.galaxy":##################2,36:PRINT#2,STR$(ID)+CHR$(13)+LEFT$(O$(3),8):CLOSE2
30030 GOSUB30050
30040 F$="gal.empire":POKE2930,0:POKE2931,0:GOTO8940
30050 O$="{clear}{down*2}{white}":GOSUB4
30060 O$="  .       .     .       .":GOSUB4
30070 O$="   ..  .   .      .  .   ":GOSUB4
30080 O$=" .    . {light blue}galactic {white}    . ":GOSUB4
30090 O$="   .  . {light blue} EMPIRE{white}  .  .  ":GOSUB4
30100 O$=" .   .   .     .    .   .":GOSUB4
30110 O$="  {light green}v2.0 by Bo Zimmerman{white}.  ":GOSUB4
30120 O$="{white} . {green}(c)1991 Elite Software{white} .":GOSUB4
30121 O$="{white}   ..  .   .      .    .   ":GOSUB4
30122 O$="  .       .     .       .":GOSUB4
30130 RETURN
55555 SCRATCH"gal.boot",U(PEEK(186)):DSAVE"gal.boo
