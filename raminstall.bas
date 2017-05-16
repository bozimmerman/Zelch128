!--------------------------------------------------
!- Monday, May 15, 2017 3:04:37 AM
!- Import of : 
!- c:\src\zelch128\raminstall.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 GRAPHICCLR:A=RGR(0):GRAPHIC1,1:GRAPHIC(A)
20 PRINT"{clear}{ct n}RamInstall for Zelch 128 v2.0a":U=PEEK(186):D=0
30 OPEN1,U,15:OPEN2,U,2,"0:ramdos128.bin*,p,r"
40 INPUT#1,A:CLOSE2:CLOSE1
50 IFATHENPRINT"{down}RamDos is not on drive "MID$(STR$(U),2)","MID$(STR$(D),2):ELSEGOTO90
60 PRINT"{down}Insert the disk containing 'ramdos128'."
70 OPEN1,0:PRINT"Which drive is it on? "MID$(STR$(U),2)",0{left*4}";:INPUT#1,U,D:PRINT:CLOSE1
80 GOTO30
90 BLOAD"ramdos128.bin*",U(U),D(D)
100 PRINT"{down}Insert your boot disk."
110 OPEN1,0:PRINT"Which drive is it on? "MID$(STR$(U),2)",0{left*4}";:INPUT#1,U,D:PRINT:CLOSE1
120 OPEN1,0:PRINT"{down}Device number for RamDrive (8-30)? 9{left}";:INPUT#1,I:PRINT:CLOSE1
130 POKE16128,I:BSAVE"ramdos128",U(U),D(D),P(8960) TO P(16129)
140 PRINT"{clear}RamDos installation complete."
