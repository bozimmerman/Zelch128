!--------------------------------------------------
!- Wednesday, August 18, 2021 12:27:14 AM
!- Import of : 
!- c:\tmp\newproject\mdr.maker.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
5 I=RND(-TI)
10 GOTO100
20 A$="{down*2}Create "+CHR$(34)+F$+CHR$(34)+" (y/n)? ":PRINTCHR$(27)"s";
25 PRINTA$;:GETKEYYN$:PRINTYN$:YN=INSTR("yn",YN$):IFYN=0THEN20:ELSERETURN
54 GOTO100
55 U=PEEK(186):D=0:F$="mdr.maker":GOSUB56:SAVE"mdr.maker",U:STOP
56 OPEN1,U,15,"s"+MID$(STR$(D),2)+":"+F$:CLOSE1:RETURN
57 OPEN2,U,2,MID$(STR$(D),2)+":"+F$+",l,"+CHR$(X):RECORD#2,Y+1:PRINT#2,"Burp!":RETURN
100 RESTORE
110 PRINT"{clear}{down*2}{yellow}Murder Motel file creation program."
120 PRINT"Written by Bo Zimmerman for Elite Software"
130 PRINT"{down*2}--Hotel structure and data by Sean D. Wagle"
140 INPUT"{down*4}Save files on what drive{space*3}8,0{left*5}";U,D
200 F$="mdr.rooms":GOSUB20:ONYNGOTO210,300
210 GOSUB56:X=50:Y=99:GOSUB57
220 FORI=1TO99:A$="":FORX=0TO6:READB$:A$=A$+B$+CHR$(13):NEXTX:RECORD#2,I:PRINT#2,A$:NEXTI:CLOSE2
300 F$="mdr.stuff":GOSUB20:ONYNGOTO310,400
310 GOSUB56:X=5:Y=200:GOSUB57
320 FORI=1TO200:RECORD#2,I:PRINT#2,INT(RND(TI)*99)+1:NEXTI:CLOSE2
400 F$="mdr.losers":GOSUB20:ONYNGOTO410,500
410 GOSUB56:X=100:Y=31:GOSUB57
420 FORI=1TO31:RECORD#2,I:R$=CHR$(13):PRINT#2,"0"+R$+"empty"+R$+"0"+R$+"0"+R$+"0"+R$+"910800"+R$+"0"+R$+"0":NEXTI:CLOSE2
500 F$="mdr.squeals":GOSUB20:ONYNGOTO510,600
510 GOSUB56:X=100:Y=11:GOSUB57
520 FORI=1TO10:RECORD#2,I:PRINT#2,"empty":NEXTI:CLOSE2
600 PRINT"{down*2}Yer all done!":END
61102 DATA "falling! Yiiiii!!!!",0,0,0,0,0,41
61105 DATA IN THE UP ONLY ELEVATOR,15,0,0,23,3,0
61108 DATA IN UP ONLY ELEVATOR (F2),0,0,0,52,4,0
61111 DATA IN UP ONLY ELEVATOR (F3),0,0,0,81,0,0
61114 DATA IN THE NORMAL ELEVATOR (F1),0,0,10,0,6,0
61117 DATA IN THE NORMAL ELEVATOR (F2),0,60,0,0,7,5
61120 DATA IN THE NORMAL ELEVATOR (F3),0,78,0,0,0,6
61123 DATA SLIDING DOWN THE PIPE,0,0,0,0,0,50
61126 DATA "on the roof of Murder Motel",0,0,0,0,0,83
61129 DATA IN THE MAIN LOBBY,5,11,29,33,0,0
61132 DATA IN THE SOUTH MAIN HALL,49,12,27,10,0,0
61135 DATA IN THE CENTRAL MAIN HALL,51,13,26,11,0,0
61138 DATA IN THE NORTH MAIN HALL,20,14,24,12,0,0
61141 DATA IN THE NORTH WING,21,15,23,13,0,0
61144 DATA AT THE NORTH WING'S END,0,0,2,14,0,0
61147 DATA WITHIN THE KITCHEN,17,20,0,51,0,0
61150 DATA INSIDE THE MEAT FREEZER,0,19,16,18,0,0
61153 DATA "at the Bootleg Bar",0,17,51,0,0,0
61156 DATA IN THE PANTRY,0,0,20,17,0,0
61159 DATA IN THE EAST WING,19,0,13,16,0,0
61162 DATA IN THE JANITOR'S CLOSET,0,0,14,0,0,0
61165 DATA IN THE OFFICE SUPPLY ROOM,0,29,0,0,0,0
61168 DATA STANDING IN THE LIBRARY,14,2,0,24,0,0
61171 DATA IN THE WEST HALLWAY,13,23,0,25,0,0
61174 DATA IN THE WOMEN'S RESTROOM,0,24,0,0,0,0
61177 DATA IN THE MEN'S RESTROOM,12,0,0,27,0,0
61180 DATA "in the TV room (cartoons on)",11,26,0,0,0,0
61183 DATA SNOOPING IN THE FILE ROOM,0,0,0,30,0,0
61186 DATA IN THE SECRETARIES' OFFICE,10,0,30,22,0,0
61189 DATA IN THE MANAGER'S OFFICE,29,28,0,31,0,0
61192 DATA OUTSIDE IN THE COURTYARD,32,30,0,0,0,0
61195 DATA UNDER THE FRONT PORCH,0,0,31,0,0,0
61198 DATA ON THE FRONT PORCH,34,10,0,39,0,0
61201 DATA IN THE PARKING LOT,37,35,33,0,0,0
61204 DATA "by the NO VACANCY sign",0,0,36,34,0,0
61207 DATA IN A PHONE BOOTH,35,0,0,0,0,0
61210 DATA "facing Interstate 80",0,0,34,0,0,38
61213 DATA "sitting in a HUGE pothole",0,0,0,0,37,0
61216 DATA WALKING THROUGH THE GARDEN,0,33,0,40,0,0
61219 DATA IN A SHRUBBERY MAZE,41,39,47,46,0,0
61222 DATA "under a huge Larch",0,0,40,45,42,0
61225 DATA "climbing the Larch's trunk",0,0,0,0,43,0
61228 DATA "in the Larch's foliage",0,0,0,0,44,0
61231 DATA "at the top of the Larch",0,0,0,0,0,1
61234 DATA IN THE GARDNER'S SHED,0,41,46,0,0,0
61237 DATA BY A RIVERBANK,45,40,0,0,0,0
61240 DATA AT A KENNELING AREA,40,0,48,0,0,0
61243 DATA INSIDE A DOG CAGE,47,0,0,0,0,0
61246 DATA HIDING IN A STORAGE CLOSET,0,0,11,0,0,0
61249 DATA IN A TRASH COMPACTOR,0,51,0,0,0,0
61252 DATA SEATED IN THE CAFETERIA,18,16,12,50,0,0
61255 DATA "on 2nd floor/blue hall",53,3,68,54,0,0
61258 DATA IN THE OVAL OFFICE,0,0,52,0,0,0
61261 DATA ON 2ND FLOOR/SMALL HALL,55,52,66,61,0,0
61264 DATA "in Col. Khadafy's playroom",56,0,54,0,0,0
61267 DATA "in Tammy Faye's powder room",0,0,55,57,0,0
61270 DATA "in the Kudzu room",0,56,0,58,0,0
61273 DATA IN A TACKY TOURIST TRAP,0,57,0,59,0,0
61276 DATA "sweating in the boiler room",0,58,60,0,0,0
61279 DATA "on 2nd floor/yellow hall",59,61,62,6,0,0
61282 DATA "on 2nd floor/Fawn Hall",0,54,0,60,0,0
61285 DATA "in John Hinkley's bedroom",60,0,64,99,0,0
61288 DATA IN THE CANNIBAL'S CORNER,99,64,0,0,0,0
61291 DATA "in GearJammer's room",62,65,0,63,0,0
61294 DATA IN THE LOONY LAUNDRY,0,66,0,64,0,0
61297 DATA "on 2nd floor/brown hall",54,68,67,65,0,0
61300 DATA IN THE PIGEON COOP,66,0,0,0,0,0
61303 DATA ON 2ND FLOOR/POOL HALL,52,69,0,66,0,0
61306 DATA IN A SHOOTING GALLERY,0,0,0,68,0,0
61309 DATA IN THE AVOCADO ROOM,71,81,0,75,0,0
61312 DATA "in the banana room",72,82,70,0,0,0
61315 DATA IN CABBAGE CORNER,0,0,71,73,0,0
61318 DATA IN THE RADISH ROOM,0,72,74,78,0,0
61321 DATA IN THE SQUASH SUITE,73,0,0,0,0,0
61324 DATA IN THE BOOGER DINER,0,70,0,76,0,0
61327 DATA ON A SPIRAL STAIRCASE,0,75,0,77,83,0
61330 DATA IN TORTURE CHAMBER #1,79,76,0,0,0,0
61333 DATA "at the altar of Little John",0,73,79,7,0,0
61336 DATA LOSING ALL SENSE OF SANITY,78,80,77,0,0,0
61339 DATA IN THE CRUD CAFE,0,0,0,79,0,0
61342 DATA IN THE VINEGAR BEAN ROOM,82,4,0,70,0,0
61345 DATA IN THE HILL OF BEANS ROOM,0,0,81,71,0,0
61348 DATA IN THE NUDE ART GALLERY,84,96,0,0,9,76
61351 DATA "in a little rubber room",85,0,83,98,0,0
61354 DATA "in a roomfull of MAGIC FOAM",0,86,84,0,0,0
61357 DATA "in the smushed Smurf room",87,0,89,85,0,0
61360 DATA ON THE 4TH FLOOR BALCONY,0,88,86,0,0,0
61363 DATA ON A SLIPPERY DRAINAGE PIPE,0,0,0,87,0,8
61366 DATA IN A CHEMICAL DUMP,86,90,91,0,0,0
61369 DATA "in a SPAM cannery",0,0,94,89,0,0
61372 DATA "in the spider's den",89,0,0,92,0,0
61375 DATA "deeper in the spider's den",93,91,0,0,0,0
61378 DATA "in the sanctuary",0,0,92,0,0,0
61381 DATA IN A ROOM WITH A FIREPLACE,90,0,97,95,0,0
61384 DATA IN THE HEXAGON'S CIRCLE,0,94,0,96,0,0
61387 DATA IN THE ANGULAR PRISM,0,95,0,83,0,0
61390 DATA "in the fireplace",94,0,0,0,0,0
61393 DATA HANGING OUT THE WINDOW,0,84,0,0,0,99
61396 DATA ON THE ROOF OF THE PORCH,0,62,63,0,0,0