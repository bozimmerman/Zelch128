!--------------------------------------------------
!- Tuesday, May 16, 2017 10:51:08 PM
!- Import of : 
!- c:\src\zelch128next\zelch.prg
!- Unknown Machine
!--------------------------------------------------
10 U=PEEK(186):IFPEEK(2960)=42THEN400
11 GRAPHICCLR:A=RGR(0):GRAPHIC1,1:GRAPHICA:POKE53280,0:POKE53281,0:FORI=2816TO3071:POKEI,0:NEXT:R$=CHR$(13)
15 POKE57093,10:IFPEEK(57093)<>10THEN80
20 OPEN1,U,15:OPEN2,U,2,"ramdos128,p,r":INPUT#1,E:CLOSE2:CLOSE1:IFETHEN80
40 PRINT"loading ramdos...":BLOAD"ramdos128",U(U):POKE2985,PEEK(16128):SYS65418:SYS8972:POKE6,PEEK(2985):POKE7,15
60 PRINT"{down}format and reload ram (y/n)? {reverse on}{white}n{left}";:TI$="000000":DO:GETA$:LOOPUNTILA$=R$ORA$="n"ORA$="y"ORVAL(TI$)>180:IFVAL(TI$)>180ORA$=R$THENA$="n"
70 PRINT"{reverse off}";A$:IFCHR$(ASC(A$)AND127)="n"THENSYS8969:ELSESYS8966:POKE2960,42
80 GRAPHICCLR:GRAPHIC1,1:GRAPHICA
100 IFPEEK(238)=79THENFAST:PRINTCHR$(27)"m{home*2}{clear}{cyan}";:FORX=1TO25:PRINTTAB(39)"{cm g}":NEXTX:PRINTCHR$(27)"l";:WINDOW0,0,38,24
110 PRINT"{142}{clear}{down}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
120 PRINT" {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
130 PRINT"  {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
140 PRINT"   {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
150 PRINT"    {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
160 PRINT"{reverse on}{blue}O                                   P{reverse off}
170 PRINT"{reverse on}                                     {reverse off}
180 PRINT"{reverse on}                                    {sh @}{reverse off}
190 PRINT"{reverse on}L                                  {reverse off}{cm v}
200 PRINT" {cm u*3}{cm y*3}{cm t*2}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}{blue}{cm t*2}{cm @*3}{cm p*3}{cm i*3}{reverse on}{cm u*3}{cm y*3}      {reverse off}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}
210 PRINT" {blue}{cm o*3}{reverse on}{cm u*3}{cm t*3}                       {cm d}{reverse off} {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}
220 PRINT"{reverse on}{blue}O     {cm @*15}           {sh @}{reverse off}   {red}{cm asterisk}
230 PRINT"{reverse on}{blue}      {cm t*3}{cm y*3}{cm u*3}{reverse off}{cm i*3}{cm o*3}{cm p*3} {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}{blue}{cm t*3}{cm y*2}
240 PRINT"{reverse on}                              {cm t*2}P{reverse off}
250 PRINT"{reverse on}L                    {yellow}O{cm t}O{blue} {yellow}O{cm t}OO{blue}    {reverse off}
260 PRINT"  {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}{blue}{cm t*8}   {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}{blue}{cm y*3}{reverse on}{cm i}{yellow} P {reverse off} {reverse on} {reverse off}{blue}{cm t}{reverse on}{yellow} T{blue}{cm @*2} {sh @}{reverse off}{cyan}{cm p}
270 PRINT"   {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}   {reverse on}{yellow} {sh @} {reverse off} {reverse on} {reverse off} {reverse on}  {reverse off}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}  {cyan}{cm q}L
280 PRINT"    {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}  {reverse on}{yellow}L{cm @}L{cm @}L{cm @}L{cm g}{reverse off}{cm g}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off} {cyan}{cm y}{cm q}L
290 PRINT"     {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off} {cyan}{cm y}{cm b}
300 PRINT"      {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off} {cyan}{cm t}
310 PRINT"       {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
320 PRINT"        {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
330 PRINT"         {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
340 BLOAD"l-xfer 1300",U(U),B0,P4864
350 BLOAD"v3.0 2000",U(U),P8192
355 BLOAD"ansi 3a00",U(U),P14848
360 BLOAD"ascii 3b00",U(U),P15104
370 BLOAD"v3.0 3d00",U(U),B15,P15616
380 BLOAD"crsr 0e00",U(U),P3584
390 IFPEEK(238)=79THENWINDOW40,0,79,24
395 IFPEEK(2960)=42THENX=4:F$="bbs.copy":GOTO711
400 PRINT"{clear}{142}{down}   {gray}{cm m}{reverse on}GGGBHHH{reverse off}{cm h}
410 PRINT"   {reverse on}{cm v}{sh -}{sh -}{sh -}{sh -}{sh -}{sh -}{sh -}{cm c}{reverse off}
420 PRINT"   {reverse on} {cm @}{cm p*2}{cm @}{cm p*2}{cm @} {reverse off}
430 PRINT"  {reverse on}{pink}O{reverse off}{brown}UCDD{cm r}DDCI{reverse on}{pink}P{reverse off}   {reverse on}{red}O{cm t*2}P{blue}O{cm t}{red}{cm j}{reverse off}{cm j}{reverse on}O{cm t}{cm h}{reverse off}{cm g}{cm k} {reverse on}{blue}O{reverse off}{cm f}{cm d}{reverse on}PO{cm y}{reverse off}2
440 PRINT"  {reverse on}{pink}{cm m}{reverse off}{brown}G{reverse on}{white}O P{reverse off}{brown}{sh -}{reverse on}{white}O P{reverse off}{brown}H{reverse on}{pink}{cm g}{reverse off}   {red}{cm y}{cm t}{reverse on}O{reverse off}{cm v}{reverse on}{blue} {cm y}{red}{cm g}{reverse off}{cm g}{reverse on} {reverse off} {reverse on} {reverse off}{cm i}{reverse on}{cm l}{reverse off}{blue}{cm u}{reverse on}{cm g}{cm f}{cm d}{cm m}{cm g}{reverse off}{cm t}
450 PRINT"  {reverse on}{pink}{cm l}{reverse off}{brown}T{reverse on}{white}   {reverse off}{brown}{sh -}{reverse on}{white}   {reverse off}{brown}Y{reverse on}{pink}{cm j}{reverse off}  {white}Q {reverse on}{red}{cm v}{sh @}{reverse off}{cm @}{reverse on}{blue} {reverse off}L{reverse on}{red}{cm g}{reverse off} {reverse on} {reverse off}{cm g}{reverse on}{cm h}{cm f}{cm l}{reverse off}{blue}{cm u}{reverse on}{cm g}{reverse off}  {reverse on}{cm m}{cm g}{reverse off}{cm @}
460 PRINT"  {reverse on}{pink}{cm m}{reverse off}{brown}G{reverse on}{white}L {reverse off}{light blue}{cm v}{brown}{sh -}{reverse on}{white}L {reverse off}{light blue}{cm v}{brown}H{reverse on}{pink}{cm h}{reverse off}   {reverse on}{red}L{cm @*2}{sh @}{blue}L{cm @}{red}{cm j}{cm @}L{cm @}{cm j}{reverse off}{cm m}{reverse on}{cm n}{reverse off} {reverse on}{blue}L{reverse off}  {reverse on}{sh @}L{cm p}{reverse off}
470 PRINT"  {reverse on}{pink}{cm g}{reverse off}{brown}JFC{reverse on}{pink}O{cm t}P{reverse off}{brown}CFK{reverse on}{pink}{cm m}{reverse off} {white}Q
480 PRINT"  {pink}{cm c}{reverse on}O{cm t}P   O P{reverse off}{cm v}{white}.
490 PRINT"   {reverse on}{pink}   L{cm @}{sh @}   {reverse off}   {light gray}{cm a}{cm r*20}{cm s}
500 PRINT"   {reverse on}{pink}L {gray}O {cm t} P{pink} {sh @}{reverse off}   {light gray}{cm q}{reverse on}{green}O{cm y*18}P{reverse off}{light gray}{cm w}
510 PRINT" {reverse on}{white}O{cm t}P{pink}P{gray},,,,,{pink}O{white}O{cm t}P{reverse off} {light gray}{cm q}{reverse on}{green}{cm g}1. boot bbs       {cm m}{reverse off}{light gray}{cm w}
520 PRINT" {reverse on}{white}   {pink}{cm g}L{cm @} {cm @}{sh @}{cm m}{white}   {reverse off} {light gray}{cm q}{reverse on}{green}{cm g}2. system editor  {cm m}{reverse off}{light gray}{cm w}
530 PRINT" {reverse on}{white}   {reverse off}{pink}{cm c}{reverse on}{cm t}{cm y}{cm u}{cm y}{cm t}{reverse off}{cm v}{reverse on}{white}   {reverse off} {light gray}{cm q}{reverse on}{green}{cm g}3. create a bbs   {cm m}{reverse off}{light gray}{cm w}
540 PRINT" {reverse on}{white}{cm g} {cm m} {cm y*2}{reverse off} {reverse on}{cm y*2} {cm g} {cm m}{reverse off} {light gray}{cm q}{reverse on}{green}{cm h}4. copy program   {cm m}{reverse off}{light gray}{cm w}
550 PRINT" {white}{cm c}{reverse on} H   B   G {reverse off}{cm v} {light gray}{cm q}{reverse on}{green}{cm g}5. ascii editor   {cm m}{reverse off}{light gray}{cm w}
560 PRINT"  {reverse on}{white}LG   B   H{sh @}{reverse off}  {light gray}{cm q}{reverse on}{green}{cm g}q. quit           {cm m}{reverse off}{light gray}{cm w}
570 PRINT"   {reverse on}{white}G   B   H{reverse off}   {light gray}{cm q}{reverse on}{green}L{cm p*18}{sh @}{reverse off}{light gray}{cm w}
580 PRINT"   {reverse on}{white}LFFF{cm e}FFF{sh @}{reverse off}   {light gray}{cm z}{cm e*20}{cm x}
590 PRINT"    {reverse on}{white}{purple}{cm y}{cm t*5}{cm y}{reverse off}
600 PRINT"    {reverse on}{cm g}  B  {cm m}{reverse off}   {yellow}{cm @}
610 PRINT"    {reverse on}{purple}{cm k}  B  {cm l}{reverse off}  {yellow}({reverse on}{cm q}{reverse off})1991  bill fink
620 PRINT"  {reverse on}{white}O{cm t*3}P{purple}B{white}O{cm t*3}P{reverse off} {yellow}{cm t}      bo zimmerman
630 WINDOW0,0,PEEK(238),24
640 TI$="000000":DO:GETA$:LOOPUNTILINSTR("q12345",A$)ORVAL(TI$)>120:IFVAL(TI$)>120THENA$="1"
643 IFA$="q"THENPRINT"{clear}{down}{142}{pink}z{yellow}e{white}l{cyan}c{light blue}h {white}128 v2.0 copyright (c)1991":PRINT"bill fink and bo zimmerman{cyan}":END
645 X=VAL(A$):IFX<1ORX>5THEN640
650 IFX=1THENF$="bbs.main":I$="1. boot bbs       "
660 IFX=2THENF$="bbs.editor":I$="{down}2. system editor  "
670 IFX=3THENF$="bbs.create":I$="{down*2}3. create a bbs   "
680 IFX=4THENF$="bbs.copy":I$="{down*3}4. copy program   ":POKE2960,0
685 IFX=5THENF$="bbs.ascii edit":I$="{down*4}5. ascii editor   "
700 PRINT"{home}{down*12}{light green}{reverse on}"TAB(PEEK(238)-22)I$
705 IFX=1THENSYS15616
710 IFX=2THENBLOAD"l-xfer 1300",U(U)
711 IFX=4THENPOKE2829,1:POKE2823,1:POKE2825,255:POKE2824,1:POKE2827,0
715 FORI=0TO3:POKE2963+I,PEEK(804+I):POKE2967+I,PEEK(810+I):NEXTI:BANK15
720 RUN(F$),U(U),D0
55555 A=PEEK(186):SCRATCH"zelch",U(A):DSAVE"zelch",U(A):END
