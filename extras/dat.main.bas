!--------------------------------------------------
!- Saturday, May 20, 2017 1:33:48 AM
!- Import of : 
!- c:\src\zelch128\extras\dat.main.prg
!- Commodore 128 BASIC 7/7.1
!- ***************PROBABLY CURRPT -- MISSING BOTTOM STUFF
!--------------------------------------------------
30000 SYS15625:REM =============== DATING MODULE ==============================
30010 O$="{black}{ct k}Zelch Dating Module v1.0{ct k*2}{black}By Elite Software{ct k}   2968 W. Ina Rd. Suite 140{ct k}   Tucson, Az 85741{black}":GOSUB4:D1=U:D2=D
30020 OPEN1,U,15:OPEN2,U,2,MID$(STR$(D),2)+":dat.users":INPUT#1,A:IFATHENCLOSE1:CLOSE2:O$="{ct k}Error, dating not configured.":GOSUB4:GOTO920
30030 RECORD#2,1:SYS8222:W0=VAL(I$):SYS8222:W5=VAL(I$):SYS8222:U0=VAL(I$):SYS8222:D0=VAL(I$)
30040 O$="{ct k}Searching for your dating file...{ct c}":GOSUB4:X=1
30050 X=1:DO:X=X+1:RECORD#2,X:SYS8222:A=VAL(I$):SYS8222:LOOPUNTIL A=ID OR LEN(I$)=1
30060 IFA=IDANDUI$(ID)=I$THENW6=X:SYS8222:W7=VAL(LEFT$(I$,1)):W8=VAL(RIGHT$(I$,1)):FORX=1TO3:SYS8222:NEXTX:W0$=I$:O$=R$:GOSUB9:GOTO31000
30070 CLOSE1:CLOSE2:O$=" Not found.{ct k}":GOSUB4:F$="dat.verify":GOSUB26:O$="{black}Do you wish to continue (y/n)? {ct c}":GOSUB4:C$="YN"+R$:GOSUB28:IFI>1THEN920
30080 F$="dat.intro":GOSUB25:OPEN2,U,2,MID$(STR$(D),2)+":dat.users":W6=1:DO:W6=W6+1:RECORD#2,W6:INPUT#2,I:INPUT#2,I$:IFI=0ORI$<>UI$(I)THENEXIT
30090 LOOPUNTILW6>W0:CLOSE2:CLOSE1:IFW6>W0THENO$="{ct k}{black}Sorry, no open dating slots.{f7}Try again later.":GOSUB4:GOTO920
30200 RESTORE:W0$="":DO:READO$:IFO$="{pound}"THENEXIT
30210 O$="{ct k}{black}"+O$+"{ct k}":GOSUB4:READA$:READX:FORI=1TOX:READO$:O$=" "+RIGHT$(STR$(I),1)+") "+O$:GOSUB4:NEXTI
30220 O$="{ct k}"+A$+": {ct c}":GOSUB4:C$=LEFT$("1234567890",X):GOSUB28:W0$=W0$+A$:O$="":GOSUB4:LOOP
30230 O$="{black}{ct k}Are all of your answers correct (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN30080
30240 O$="{black}{ct k}Make your real name and phone number{f7}available to interested users (y/n)? {ct c}":GOSUB4:C$="NY":GOSUB28:W7=I-1:IFW5=0THEN30270
30250 O$="{black}{ct k}Would you like to fill out a resume{f7}for others to browse (y/n)? {ct c}":GOSUB4:GOSUB28:W8=I-1
30260 IFI=2THENF$="dat.resume"+STR$(W6):O(12)=1:U=U0:D=D0:GOSUB1000:U=D1:D=D2:IFO(11)THENW8=0
30270 OPEN2,U,2,MID$(STR$(D),2)+":dat.users":RECORD#2,W6:PRINT#2,STR$(ID)+R$+U$(1)+R$+MID$(STR$(W7),2)+MID$(STR$(W8),2)+R$+U$(3)+R$+U$(4)+R$+W0$
30280 O$="{ct k}{black}Your stats are now on file.":GOSUB4:GOTO30050
31000 CLOSE1:CLOSE2:O$="{ct k}{black}Dating Command {black}[ ]{white}{left*2}{ct c}":GOSUB4:C$="QYRLEXVMS?":GOSUB28:RESTORE:ONIGOTO920,32000,33000,34000,35000,36000,37000,38000,39000
31010 F$="dat.menu":U=D1:D=D2:GOSUB25:GOTO31000
31500 IFPEEK(2915)THENO$=O$+RIGHT$(SP$,40-LEN(O$))+"{ct c}"
31510 O$="{yellow}"+LEFT$(O$,INSTR(O$,":"))+"{white}"+MID$(O$,INSTR(O$,":")+1):GOTO4
32000 RESTORE:Y=0:O$="{clear}{ct k}{white}>>{yellow} "+U$(1)+" {white}(ID#"+STR$(ID)+"){ct k}{cyan}":GOSUB4
32010 O$=" Personal information is ":IFW7THENO$=O$+"available.":ELSEO$=O$+"confidential."
32020 GOSUB4:O$=" Resume is ":IFW8=0THENO$=O$+"not "
32030 O$=O$+"on file.{ct k}":GOSUB4
32040 DO:Y=Y+1:READO$:IFO$="{pound}"THENEXIT
32050 READO$,X:FORI=1TOX:READTT$(I):NEXTI:X=VAL(MID$(W0$,Y,1)):IFX=0THENX=10
32060 O$=O$+": "+TT$(X):GOSUB31500:LOOP:O$="":GOSUB4:GOTO31000
33000 O$="{ct k}{black}Enter the user's{f7}dating ID number: {white}{ct c}":GOSUB4:GOSUB10:IFI<2ORI>500THEN31000
33010 OPEN2,D1,2,MID$(STR$(D2),2)+":dat.users":RECORD#2,I:INPUT#2,X,C$:CLOSE2:IFUI$(X)<>C$THENO$="{ct k}{black}No user with dating number"+STR$(I):GOSUB4:GOTO31000
33020 O$="{white}{clear}{ct k}>> {yellow}"+UI$(X)+"{white} (ID#"+STR$(X)+")":GOSUB4
33030 OPEN1,U0,15:OPEN2,U0,2,MID$(STR$(D0),2)+":dat.resume"+STR$(I)+",s,r":GET#2,A$:CLOSE2:INPUT#1,E:CLOSE1:IFETHENO$="{ct k}{black}No resume on file.":GOSUB4:GOTO31000
33040 F$="dat.resume"+STR$(I):U=U0:D=D0:GOSUB26:GOTO31000
34000 O$="{ct k}{black}Dating participants:{ct k}":GOSUB4:OPEN2,D1,2,MID$(STR$(D2),2)+":dat.users":Y=1:DO:Y=Y+1:RECORD#2,Y
34010 INPUT#2,X,C$,A$
34020 IFUI$(X)=C$THENO$="{black}"+RIGHT$("   "+STR$(Y),3)+" "+C$+LEFT$(SP$,18-LEN(C$)):IFMID$(A$,2,1)="1"THENO$=O$+"(resume)
34030 IFUI$(X)=C$THENGOSUB4
34040 LOOPUNTILLEN(C$)=1ORY>W0:CLOSE2:CLOSE1:GOTO31000
35000 O$="{ct k}{black}Enter the user's{f7}dating ID number: {white}{ct c}":GOSUB4:GOSUB10:IFI<2ORI>500THEN31000
35010 OPEN2,D1,2,MID$(STR$(D2),2)+":dat.users":RECORD#2,I:INPUT#2,X,C$:CLOSE2:IFUI$(X)<>C$THENO$="{ct k}{black}No user with dating number"+STR$(I):GOSUB4:GOTO31000
35020 A=X:I$="":GOSUB8090:IFA=0THEN31000
35030 GOSUB8120:GOTO31000
36000 O$="{black}{ct k}Edit or delete your dating account{f7}(e/d/abort)? {ct c}":GOSUB4:C$="EAD":GOSUB28:ONIGOTO30200,31000
36010 O$="{black}{ct k}Delete your dating account (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN31000:ELSEOPEN1,U0,15,"s"+MID$(STR$(D0),2)+":dat.resume"+STR$(W6):CLOSE1
36020 OPEN2,D1,2,MID$(STR$(D2),2)+":dat.users":RECORD#2,W6:X=0:PRINT#2,"0"+R$+"^^"+R$+"00"+R$+"{pound}"+R$+"000-0000"+R$+"0000":CLOSE2:GOTO920
37000 O$="{ct k}{black}Enter the user's{f7}dating ID number: {white}{ct c}":GOSUB4:GOSUB10:IFI<2ORI>500THEN31000
37010 OPEN2,D1,2,MID$(STR$(D2),2)+":dat.users":RECORD#2,I:INPUT#2,X,C$:IFUI$(X)<>C$THENCLOSE2:O$="{ct k}{black}No user with dating number"+STR$(I):GOSUB4:GOTO31000
37020 O$="{clear}{ct k}{white}>> {yellow}"+C$+" {white}(ID#"+STR$(X)+")":SYS8222:IFRIGHT$(I$,1)="1"THENO$=O$+"{f7}   {cyan}* Resume on file *"
37030 O$=O$+"{ct k}":GOSUB4:IFLEFT$(I$,1)="1"THENSYS8222:O$="   "+I$:SYS8222:O$=O$+"{ct k}   "+I$+"{ct k}":GOSUB4:ELSESYS8222:SYS8222
37040 SYS8222:CLOSE2:RESTORE:Y=0:DO:Y=Y+1:READO$:IFO$="{pound}"THENEXIT
37050 READO$,X:FORI=1TOX:READTT$(I):NEXTI:X=VAL(MID$(I$,Y,1)):IFX=0THENX=10
37060 O$=O$+": "+TT$(X):GOSUB31500:LOOP:O$="":GOSUB4:GOTO31000
38000 O$="{ct k}{black}Enter the lowest percentage{f7}desired for a match: {white}{ct c}":GOSUB4:GOSUB10:IFI<1ORI>100THEN31000:ELSEO$="{black}{ct k}Searching...{ct k}":GOSUB4
38010 A=I:OPEN2,D1,2,MID$(STR$(D2),2)+":dat.users":Y=1:DO:Y=Y+1:IFY=W6THEN38500
38020 RECORD#2,Y:INPUT#2,X,C$:IFUI$(X)<>C$THEN38500
38030 FORI=1TO4:SYS8222:NEXTI:IFMID$(W0$,2,1)="1"ANDMID$(W0$,1,1)=MID$(I$,1,1)THEN38500
38035 IFMID$(W0$,14,1)="1"ANDMID$(I$,14,1)="2"THEN38500
38036 IFMID$(W0$,14,1)="2"ANDMID$(I$,14,1)="1"THEN38500
38040 IFMID$(W0$,2,1)="2"ANDMID$(W0$,1,1)<>MID$(I$,1,1)THEN38500
38050 IF(MID$(W0$,2,1)<>MID$(I$,2,1))ANDMID$(W0$,2,1)<>"3"THEN38500
38060 IFABS(VAL(MID$(W0$,3,1))-VAL(MID$(I$,3,1)))>1THEN38500
38070 IFMID$(W0$,7,1)<>"7"ANDMID$(W0$,7,1)<>MID$(I$,6,1)THEN38500
38080 IFINSTR("7890",MID$(W0$,11,1))=0ANDMID$(W0$,11,1)<>MID$(I$,11,1)THEN38500
38090 I=0:FORX=1TO24:IFMID$(W0$,X,1)=MID$(I$,X,1)THENI=I+1
38100 NEXTX:I=INT(((I+1)/24)*100):IFI=>ATHENO$="{black}"+RIGHT$(SP$+STR$(Y),3)+"  "+C$+" matches with"+STR$(I)+"%.":GOSUB4
38500 LOOPUNTILLEN(C$)=1ORY>=W0:CLOSE2:CLOSE1:GOTO31000
39000 O$="{clear}{ct k}{black}Answer the following questions as if you are the person you are":GOSUB4
39010 O$="looking for.  Answer ONLY the questions that you feel should match":GOSUB4
39020 O$="exactly.  Hit {f5}*{f5} for all unimportant questions.":GOSUB4
39030 O$="{ct k}{black}Continue (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN31000
39040 RESTORE:W1$="":DO:READO$:IFO$="{pound}"THENEXIT
39050 O$="{ct k}{black}"+O$+"{ct k}":GOSUB4:READA$:READX:FORI=1TOX:READO$:O$=" "+RIGHT$(STR$(I),1)+") "+O$:GOSUB4:NEXTI:O$=" *) Ignore this question":GOSUB4
39060 O$="{ct k}"+A$+": {ct c}":GOSUB4:C$=LEFT$("*1234567890",X+1):GOSUB28:IFA$="*"THENC$=C$+"*":ELSEW1$=W1$+RIGHT$(STR$(I-1),1)
39070 O$="":GOSUB4:LOOP
39100 O$="{ct k}{black}Are all of your choices correct (y/n)? {ct c}":GOSUB4:C$="YN":GOSUB28:IFI=2THEN39000
39110 O$="{ct k}{black}Checking...{ct k}":GOSUB4
39120 OPEN2,D1,2,MID$(STR$(D2),2)+":dat.users":Y=1:DO:Y=Y+1:IFY=W6THEN39500
39130 RECORD#2,Y:INPUT#2,X,A$:IFUI$(X)<>A$THEN39500
39140 FORI=1TO4:SYS8222:NEXTI:I=0:FORX=1TO22:IFMID$(W1$,X,1)<>"*"ANDMID$(W1$,X,1)<>MID$(I$,X,1)THENI=1
39150 NEXTX:IFI=0THENO$="{black}"+RIGHT$(SP$+STR$(Y),3)+"  "+A$+" is a match.":GOSUB4
39500 LOOPUNTILLEN(A$)=1ORY>=W0:CLOSE2:CLOSE1:GOTO31000
51000 DATA "Your sex?","Sex       "
51005 DATA 2,"Male","Female"
51010 DATA "What is your sexual preference?","Sex. Pref "
51015 DATA 3,"Heterosexual","Homosexual","Bisexual"
51020 DATA "Your age group:","Age group "
51025 DATA 6,"Under 13","13-17","18-20","21-30","31-40","Over 40"
51030 DATA "How tall are you?","Height    "
51035 DATA 6,"Under 5'","5' to 5'4{f5}","5'4{f5} to 5'9{f5}","5'9{f5} to 6'","6' to 6'4{f5}","Over 6'4{f5}"
51040 DATA "How much do you weigh?","Weight    "
51045 DATA 7,"Under 90lbs","90lbs to 110lbs","111lbs to 130lbs","131lbs to 150lbs","151lbs to 185lbs","186lbs to 230lbs","over 230lbs"
51050 DATA "Your race:","Race      "
51055 DATA 6,"Anglo/White","Black","Hispanic","Asian","Native American","Arab"
51056 DATA "What is your racial preference?","Race pref "
51057 DATA 7,"Anglo/White","Black","Hispanic","Asian","Native American","Arab","Doesn't matter"
51060 DATA "What color hair do you have? ","Hair      "
51065 DATA 5,"Black","Brown","Bleach blonde","Sandy blonde","Red"
51070 DATA "How long is your hair?","H. length "
51075 DATA 7,"Bald","Crew cut","Clean cut","Neckline","Shoulder length","1/2 down back","Longer.."
51080 DATA "The color of your eyes: ","Eye color "
51085 DATA 6,"Baby blue","Blue/grey","Hazel","Green/grey","Light green","Brown"
51090 DATA "Your religious preference:","Religion  "
51095 DATA 10,"Catholic","Jewish","Lutheran","Baptist/A. of God","Methodist","Mormon","Other protestant","Other","Nonreligeous","Doesn't matter"
51100 DATA "What is your cultural classification?","Culture   "
51105 DATA 10,"New Yorker","New Englander","Southerner","Calfornian","Western","Texan","Other American","European","Oriental","Other"
51110 DATA "What is your social classification?","Social    "
51115 DATA 9,"Business/Professional","Homebody","Sportsman","Intellectual","Headbanger/Stoner","College/Prep","Mod/New Waver","Working Class","Other"
51120 DATA "Does cigarette smoke bother you?","Smoke?    "
51125 DATA 3,"It bothers me","I'm a smoker","Doesn't bother me"
51126 DATA "Would you date someone that{f7}uses drugs?","Drug use? "
51127 DATA 4,"Absolutely not","Occasional is ok","Don't care","Maybe"
51130 DATA "Would you have sex on first date?","Sex 1/date"
51135 DATA 3,"Yes","No","Depends"
51140 DATA "How is your sexual arousal?","Arousal   "
51145 DATA 3,"Easy","Moderate","Slower"
51150 DATA "How many times per month do{f7}you have sex?","Sex/Month "
51155 DATA 5,"Virgin","0-1","2-6","7-15","More than 15"
51160 DATA "What are you looking for{f7}in a relationship?","Looking   "
51165 DATA 5,"Friendship","Sex","Marriage","Good relationship","Fun"
51170 DATA "Current marital status:","Status    "
51175 DATA 4,"Married but...","Single","Divorced","Seeing someone"
51180 DATA "What kind of music do you prefer?","Music     "
51185 DATA 10,"Popular","Rock","Heavy Metal","Alternative","Easy Listening","Country/Western","Classical","Soul/R&B","Jazz","Blues"
51190 DATA "Where do you like to{f7}go on a first date?","1st date  "
51195 DATA 8,"Dinner & Movie","Romantic Dinner","Park or Zoo","Party","Miniature Golf","Amusement Park","Concert","Other"
51200 DATA "What is your general attitude{f7}towards others?","Attitude  "
51205 DATA 5,"Aggressive","Posessive","Easy-going","Quiet/Reserved","Sincere"
51210 DATA "How do you spend your free time?","Free time "
51215 DATA 9,"With friends","Reading","Outdoors/S
