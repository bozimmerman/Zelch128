!--------------------------------------------------
!- Monday, May 15, 2017 12:14:36 AM
!- Import of : 
!- c:\src\zelch128\zelch.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
5 A=RGR(0):GRAPHIC1,1:GRAPHICA:CLR:POKE53280,0:POKE53281,0
10 IFPEEK(238)=79THENFAST:PRINTCHR$(27)"m{clear}{cyan}";:FORX=1TO25:PRINTTAB(39)"{cm g}":NEXTX:PRINTCHR$(27)"l";:WINDOW0,0,38,24
15 PRINT"{142}{clear}{down}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
20 PRINT" {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
25 PRINT"  {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
30 PRINT"   {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
35 PRINT"    {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
40 PRINT"{reverse on}{blue}O                                   P{reverse off}
45 PRINT"{reverse on}                                     {reverse off}
50 PRINT"{reverse on}                                    {sh @}{reverse off}
55 PRINT"{reverse on}L                                  {reverse off}{cm v}
60 PRINT" {cm u*3}{cm y*3}{cm t*2}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}{blue}{cm t*2}{cm @*3}{cm p*3}{cm i*3}{reverse on}{cm u*3}{cm y*3}      {reverse off}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}
65 PRINT" {blue}{cm o*3}{reverse on}{cm u*3}{cm t*3}                       {cm d}{reverse off} {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}
70 PRINT"{reverse on}{blue}O     {cm @*15}           {sh @}{reverse off}   {red}{cm asterisk}
75 PRINT"{reverse on}{blue}      {cm t*3}{cm y*3}{cm u*3}{reverse off}{cm i*3}{cm o*3}{cm p*3} {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}{blue}{cm t*3}{cm y*2}
80 PRINT"{reverse on}                              {cm t*2}P{reverse off}
85 PRINT"{reverse on}L                    {yellow}O{cm t}O{blue} {yellow}O{cm t}OO{blue}    {reverse off}
90 PRINT"  {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}{blue}{cm t*8}   {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}{blue}{cm y*3}{reverse on}{cm i}{yellow} P {reverse off} {reverse on} {reverse off}{blue}{cm t}{reverse on}{yellow} T{blue}{cm @*2} {sh @}{reverse off}{cyan}{cm p}
95 PRINT"   {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}   {reverse on}{yellow} {sh @} {reverse off} {reverse on} {reverse off} {reverse on}  {reverse off}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}  {cyan}{cm q}L
100 PRINT"    {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}  {reverse on}{yellow}L{cm @}L{cm @}L{cm @}L{cm g}{reverse off}{cm g}{red}{cm asterisk}{reverse on}{cm asterisk}{reverse off} {cyan}{cm y}{cm q}L
105 PRINT"     {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off} {cyan}{cm y}{cm b}
110 PRINT"      {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off} {cyan}{cm t}
115 PRINT"       {red}{cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
120 PRINT"        {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
125 PRINT"         {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}           {cm asterisk}{reverse on}{cm asterisk}{reverse off}
130 U=PEEK(186):BLOAD"p-xfer 3000",U(U),B0,P12288
135 BANK15:BLOAD"v1.0 3d00",U(U),B15,P15616
140 BLOAD"ascii 1c00",U(U),P7168
145 BLOAD"v1.0 2000",U(U),P8192
150 BLOAD"crsr 0e00",U(U),P3584
155 IFPEEK(238)=79THENWINDOW40,0,79,24
160 PRINT"{clear}{down}   {gray}{cm m}{reverse on}GGGBHHH{reverse off}{cm h}
165 PRINT"   {reverse on}{cm v}{sh -}{sh -}{sh -}{sh -}{sh -}{sh -}{sh -}{cm c}{reverse off}
170 PRINT"   {reverse on} {cm @}{cm p*2}{cm @}{cm p*2}{cm @} {reverse off}
175 PRINT"  {reverse on}{pink}O{reverse off}{brown}UCDD{cm r}DDCI{reverse on}{pink}P{reverse off}   {reverse on}{red}O{cm t*2}P{blue}O{cm t}{red}{cm j}{reverse off}{cm j}{reverse on}O{cm t}{cm h}{reverse off}{cm g}{cm k} {reverse on}{blue}O{reverse off}{cm f}{cm d}{reverse on}PO{cm y}{reverse off}2
180 PRINT"  {reverse on}{pink}{cm m}{reverse off}{brown}G{reverse on}{white}O P{reverse off}{brown}{sh -}{reverse on}{white}O P{reverse off}{brown}H{reverse on}{pink}{cm g}{reverse off}   {red}{cm y}{cm t}{reverse on}O{reverse off}{cm v}{reverse on}{blue} {cm y}{red}{cm g}{reverse off}{cm g}{reverse on} {reverse off} {reverse on} {reverse off}{cm i}{reverse on}{cm l}{reverse off}{blue}{cm u}{reverse on}{cm g}{cm f}{cm d}{cm m}{cm g}{reverse off}{cm t}
185 PRINT"  {reverse on}{pink}{cm l}{reverse off}{brown}T{reverse on}{white}   {reverse off}{brown}{sh -}{reverse on}{white}   {reverse off}{brown}Y{reverse on}{pink}{cm j}{reverse off}  {white}Q {reverse on}{red}{cm v}{sh @}{reverse off}{cm @}{reverse on}{blue} {reverse off}L{reverse on}{red}{cm g}{reverse off} {reverse on} {reverse off}{cm g}{reverse on}{cm h}{cm f}{cm l}{reverse off}{blue}{cm u}{reverse on}{cm g}{reverse off}  {reverse on}{cm m}{cm g}{reverse off}{cm @}
190 PRINT"  {reverse on}{pink}{cm m}{reverse off}{brown}G{reverse on}{white}L {reverse off}{light blue}{cm v}{brown}{sh -}{reverse on}{white}L {reverse off}{light blue}{cm v}{brown}H{reverse on}{pink}{cm h}{reverse off}   {reverse on}{red}L{cm @*2}{sh @}{blue}L{cm @}{red}{cm j}{cm @}L{cm @}{cm j}{reverse off}{cm m}{reverse on}{cm n}{reverse off} {reverse on}{blue}L{reverse off}  {reverse on}{sh @}L{cm p}{reverse off}
195 PRINT"  {reverse on}{pink}{cm g}{reverse off}{brown}JFC{reverse on}{pink}O{cm t}P{reverse off}{brown}CFK{reverse on}{pink}{cm m}{reverse off} {white}Q
200 PRINT"  {pink}{cm c}{reverse on}O{cm t}P   O P{reverse off}{cm v}{white}.
205 PRINT"   {reverse on}{pink}   L{cm @}{sh @}   {reverse off}   {light gray}{cm a}{cm r*20}{cm s}
210 PRINT"   {reverse on}{pink}L {gray}O {cm t} P{pink} {sh @}{reverse off}   {light gray}{cm q}{reverse on}{green}O{cm y*18}P{reverse off}{light gray}{cm w}
215 PRINT" {reverse on}{white}O{cm t}P{pink}P{gray},,,,,{pink}O{white}O{cm t}P{reverse off} {light gray}{cm q}{reverse on}{green}{cm g}1. boot bbs       {cm m}{reverse off}{light gray}{cm w}
220 PRINT" {reverse on}{white}   {pink}{cm g}L{cm @} {cm @}{sh @}{cm m}{white}   {reverse off} {light gray}{cm q}{reverse on}{green}{cm g}2. system editor  {cm m}{reverse off}{light gray}{cm w}
225 PRINT" {reverse on}{white}   {reverse off}{pink}{cm c}{reverse on}{cm t}{cm y}{cm u}{cm y}{cm t}{reverse off}{cm v}{reverse on}{white}   {reverse off} {light gray}{cm q}{reverse on}{green}{cm g}3. create a bbs   {cm m}{reverse off}{light gray}{cm w}
230 PRINT" {reverse on}{white}{cm g} {cm m} {cm y*2}{reverse off} {reverse on}{cm y*2} {cm g} {cm m}{reverse off} {light gray}{cm q}{reverse on}{green}{cm h}4. quit           {cm m}{reverse off}{light gray}{cm w}
235 PRINT" {white}{cm c}{reverse on} H   B   G {reverse off}{cm v} {light gray}{cm q}{reverse on}{green}L{cm p*18}{sh @}{reverse off}{light gray}{cm w}
240 PRINT"  {reverse on}{white}LG   B   H{sh @}{reverse off}  {light gray}{cm z}{cm e*20}{cm x}
245 PRINT"   {reverse on}{white}G   B   H{reverse off}
250 PRINT"   {reverse on}LFFF{cm e}FFF{sh @}{reverse off}
255 PRINT"    {reverse on}{purple}{cm y}{cm t*5}{cm y}{reverse off}
260 PRINT"    {reverse on}{cm g}  B  {cm m}{reverse off}   {yellow}{cm @}
265 PRINT"    {reverse on}{purple}{cm k}  B  {cm l}{reverse off}  {yellow}({reverse on}{cm q}{reverse off})1990  bill fink
270 PRINT"  {reverse on}{white}O{cm t*3}P{purple}B{white}O{cm t*3}P{reverse off} {yellow}{cm t}      bo zimmerman
275 WINDOW0,0,PEEK(238),24
280 GETKEYA$:X=VAL(A$):IFX<1ORX>5THEN280
285 IFX=1THENF$="bbs.main":I$="1. boot bbs       "
290 IFX=2THENF$="bbs.editor":I$="{down}2. system editor  "
295 IFX=3THENF$="bbs.create":I$="{down*2}3. create a bbs   "
300 IFX=4THENPRINT"{clear}{142}{down}{pink}    zelch 128 v1.0 copyright (c)1990           {yellow}bill fink and bo zimmerman{white}":END
305 PRINT"{home}{down*12}{light green}{reverse on}"TAB(PEEK(238)-22)I$
310 IFX=1THENSYS15616
315 RUN(F$),U(PEEK(186)),D0
