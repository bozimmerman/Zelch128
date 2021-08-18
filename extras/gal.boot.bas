!--------------------------------------------------
!- Wednesday, August 18, 2021 12:27:59 AM
!- Import of : 
!- c:\tmp\newproject\gal.boot.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
30000 SYS15625
30020 GOSUB400:OPEN2,9,2,"gal.galaxy":RECORD#2,36:PRINT#2,STR$(ID)+CHR$(13)+LEFT$(O$(3),8):CLOSE2
30030 GOSUB30050
30040 F$="gal.empire":POKE2930,0:POKE2931,0:GOTO8940
30050 O$="{clear}{down*2}{white}":GOSUB4
30060 O$="{space*2}.{space*7}.{space*5}.{space*7}.":GOSUB4
30070 O$="{space*3}..{space*2}.{space*3}.{space*6}.{space*2}.{space*3}":GOSUB4
30080 O$=" .{space*4}. {light blue}galactic {white}{space*4}. ":GOSUB4
30090 O$="{space*3}.{space*2}. {light blue} EMPIRE{white}{space*2}.{space*2}.{space*2}":GOSUB4
30100 O$=" .{space*3}.{space*3}.{space*5}.{space*4}.{space*3}.":GOSUB4
30110 O$="{space*2}{light green}v2.0 by Bo Zimmerman{white}.{space*2}":GOSUB4
30120 O$="{white} . {green}(c)1991 Elite Software{white} .":GOSUB4
30121 O$="{white}{space*3}..{space*2}.{space*3}.{space*6}.{space*4}.{space*3}":GOSUB4
30122 O$="{space*2}.{space*7}.{space*5}.{space*7}.":GOSUB4
30130 RETURN
55555 SCRATCH"gal.boot",U(PEEK(186)):DSAVE"gal.boot",U(PEEK(186))
