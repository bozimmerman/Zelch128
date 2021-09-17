!--------------------------------------------------
!- Thursday, September 16, 2021 2:56:50 PM
!- Import of : 
!- z:\_cbmsoft\_bo_unz\d-zelch\zee2wm\prg.ee2.create.prg
!- Unknown Machine
!--------------------------------------------------
1 REM *** MAP MAKER / SECTOR MAKER ***
2 SCRATCH "e.config",U8:SCRATCH"ee2.data",U8
8 INPUT "Unit (Uxx) to create files on:";U:INPUT "Device (Dxx) to create files on:";DV
9 PRINT "{light gray} Empire Edition II -- File Generator"
10 DIM A$(32):DIM AR%(21,21,2):DIMPR$(41)
11 PRINT "{cyan}-->{white}Creating Empire Sector file 1:"
20 FORX=1 TO 20:READ A$(X):NEXTX
40 FOR X=1 TO 20:FORY=1TO20
45 IF MID$(A$(X),Y,1)="s" THEN AR%(X,Y,0)=1
50 NEXTY:NEXTX
60 GOSUB 6050
65 PRINT "Done with map.{space*2}Now making sectors"
67 PRINT "{cyan}-->{blue}Creating Empire Sector file 2:":SCRATCH"sectors2.dat",D(DV),U(U)
70 GOSUB 6100
80 PRINT "Done with making sectors."
89 PRINT "{cyan}-->{light blue}Creating Empire Player file:":SCRATCH"empires.dat",D(DV),U(U)
90 DCLEAR:DOPEN#1,"empires.dat",L150,D(DV),U(U):RECORD#1,11:PRINT#1,CHR$(255):RECORD#1,11:DCLOSE#1:DCLEAR:PRINT"Done making player file."
95 PRINT "{green}--{light green}>Now creating empire news files(1-9), and empire world news files..."
97 FOR X=1 TO 9:X$=STR$(X):Y$=RIGHT$(X$,(LEN(X$)-1)):FI$=Y$+".news"
98 DOPEN#1,("@"+FI$),D(DV),U(U),W:PRINT#1,CHR$(34):DCLOSE#1:NEXTX:DOPEN#1,"@empire.news",D(DV),U(U),W:PRINT#1,CHR$(34):DCLOSE#1
99 PRINT "{red}-->{white}Now creating e.config file."
100 DOPEN#1,"@e.config",D(DV),U(U),W:PRINT#1,STR$(U):PRINT#1,STR$(DV):DCLOSE#1
899 PRINT:PRINT"DONE WITH FILE CREATION.":END
901 DATA"...................."
902 DATA"...................."
903 DATA".....s.............."
904 DATA"...............s...."
905 DATA"...................."
906 DATA".....s.............."
907 DATA"...................."
908 DATA"...................."
909 DATA"...................."
910 DATA"..............s....."
911 DATA"....s..............."
912 DATA"...................."
913 DATA"................s..."
914 DATA"...................."
915 DATA"........s..........."
916 DATA"...................."
917 DATA"...................."
918 DATA"...................."
919 DATA"...............s...."
920 DATA"...s................"
921 DATA"...................."
6050 DOPEN#1,"@sectors1.dat",D(DV),U(U),W
6051 FORX=1TO20:PR$(X)="":FORY=1TO20
6053 A$=STR$(AR%(X,Y,0)):B$=STR$(AR%(X,Y,1))
6054 A$=RIGHT$(A$,1):B$=RIGHT$(B$,1)
6055 PR$(X)=PR$(X)+A$+B$:NEXTY:NEXTX
6057 PRINT"Writing map...":FORX=1TO20:PRINT#1,PR$(X):NEXTX:DCLOSE#1
6060 RETURN
6099 REM **CREATE SECTOR FILE**
6100 DOPEN#1,"sectors2.dat",L26,D(DV),U(U):PRINT"Creating sector data file..."
6105 RECORD#1,401:PRINT#1,CHR$(255);:RECORD#1,401
6110 DCLOSE#1:R=0:RETURN
7000 DATA".............................."
9010 DOPEN#1,"sectors1.dat",D(DV),U(U),R:Z=1
9015 INPUT#1,A$:PRINTA$:PRINTZ:Z=Z+1:GOTO9015
