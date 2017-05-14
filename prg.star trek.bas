!--------------------------------------------------
!- Sunday, May 14, 2017 12:05:34 AM
!- Import of : 
!- c:\tmp\delme\prg.star trek.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
20 Q$="{sh +}XV@*"
25 DA$(0)="{purple} Move":DA$(2)="{purple}   {sh -} 1.5":DA$(3)="{purple} 5-+-1":DA$(4)="{purple}   {sh -} "
27 DA$(5)="{purple} 6 7 8":DA$(1)="{purple} 4 3 2"
30 D$(0)="{pink}Warp engines"
40 D$(1)="{yellow}Short range sensors"
50 D$(2)="{light green}Long range sensors"
60 D$(3)="{cyan}Phasers"
70 D$(4)="{light blue}Photon torpedoes":D$(5)="{blue}Galactic records"
90 I=INT(RND(1)*256):FORJ=0TOI:K=RND(1):NEXT
100 DEFFND(N)=SQR((K1(I)-S1)^2+(K2(I)-S2)^2)
110 GOSUB610:GOSUB450:Q1=X:Q2=Y:X=8:Y=1:X1=.2075:Y1=6.28:X2=3.28
120 Y2=1.8:A=.96:C=100:W=10:K9=0:B9=0:S9=400:T9=3575:GOTO 140
130 K=K+(N<X2)+(N<Y2)+(N<.28)+(N<.08)+(N<.03)+(N<.01):K9=K9-K:O%=K9:GOTO 160
140 T0=3520:T=T0:E0=INT(RND(2)*1500+3000):E=E0:P0=INT(RND(1)*3+7):P=P0
145 FORI=0TO7
150 FORJ=0TO7:K=0:N=RND(Y):IFN<X1THENN=N*64:K=(N<Y1)-Y:GOTO130
160 B=(RND(Y)>A):B9=B9-B:Q(I,J)=K*C+B*W-INT(RND(Y)*X+Y):NEXTJ,I
170 IFK9>(T9-T0)THENT9=T0+K9
180 IFB9>0THEN182
181 GOSUB450:Q(X,Y)=Q(X,Y)-10:B9=0
182 PRINT"{clear}";TAB(15)"{down*3}Star Trek V"
183 FORI=1TO1000:NEXTI:GOTO190
184 NEXTI:E$="{cm i*3}U{sh asterisk}I{down}{left*4}MJ{cm r}K{down}{left*5}{reverse on}{cm i*4}{reverse off}"
185 PRINT"{up*2}";:FORI=1TO34:PRINT" {down}{left}   {down}{left*3}  {left}{up*2}";E$;"{up*2}{left*5}";:NEXT
190 PRINT"{clear}{down*2}"
191 PRINT"{light green}You command the starship enterprise."
193 PRINT"{down*2}Objective:"
194 PRINT"{down}Find and destroy";K9;"klingons in 55 years"
195 INPUT"{down}instructions (y/n)";E$:IFE$="n"THEN218
197 PRINT"{clear}{down}"
200 PRINT"{white}*GALAXY-64 Zones of 64 Sectors each"
201 PRINT"*Command 3 shows objects in your zone"
202 PRINT" and surrounding 8 zones"
203 PRINT" (digit 1-klingons 2-bases 3-stars)"
204 PRINT"*Torpedoes or phasers destroy klingons"
205 PRINT"*.125 warp moves you one sector"
206 PRINT"*Dock at base to reload torpedoes and"
207 PRINT" energy. *-star X-you V-klingon @-base"
208 PRINT"{right}{down}{right*2}{purple}COMMAND LIST{right}"
209 U=-1
210 U=U+1:PRINT LEFT$(D$(U),1);U+1;D$(U):
211 IFU<>5THEN210
215 PRINT:PRINT"( hit any key to cont.)";
216 GETE$:IFE$=""THEN216
218 PRINT"{clear}{down}"
230 A=0:IFQ1<0ORQ1>7ORQ2<0ORQ2>7THENN=0:S=0:K=0:GOTO250
240 N=ABS(Q(Q1,Q2)):Q(Q1,Q2)=N:S=N-INT(N/10)*10:K=INT(N/100)
250 B=INT(N/10-K*10):GOSUB450:S1=X:S2=Y
260 FORI=0TO7:FORJ=0TO7:S(I,J)=1:NEXTJ,I:S(S1,S2)=2
270 FORI=0TO7:K3(I)=0:X=8:IFI<KTHENGOSUB460:S(X,Y)=3:K3(I)=S9
280 K1(I)=X:K2(I)=Y:NEXT:I=S
290 IFB>0THENGOSUB460:S(X,Y)=4
300 IFI>0THENGOSUB460:S(X,Y)=5:I=I-1:GOTO300
310 GOSUB550:IFA=0THENGOSUB480
320 IFE<=0THEN1370
330 I=1:IFD(I)>0THEN620
340 GOSUB4000
443 GOTO650
450 X=INT(RND(1)*8):Y=INT(RND(1)*8):RETURN
460 GOSUB450:IFS(X,Y)>1THEN460
470 RETURN
480 IFK<1THENRETURN
490 IFC$="{white}Docked"THENPRINT"Starbase protects enterprise":RETURN
500 FORI=0TO7:IFK3(I)<=0THENNEXT:RETURN
510 H=K3(I)*.4*RND(1):K3(I)=K3(I)-H:H=H/(FND(0)^.4):E=E-H
520 E$="Enterprise from":N=E:GOSUB530:NEXT:GOSUB4000:RETURN
530 PRINT"{down*2}{red}";H" Unit hit on ";E$
535 PRINT" Sector";K1(I)+1;"-";K2(I)+1;
540 PRINT"(";N;"left)":FORC=1TO500
545 NEXTC:RETURN
550 FORI=S1-1TOS1+1:FORJ=S2-1TOS2+1
560 IFI<0ORI>7ORJ<0ORJ>7THEN580
570 IFS(I,J)=4THENC$="{white}Docked":E=E0:P=P0:GOSUB610:RETURN
580 NEXTJ,I:IFK>0THENC$="{red}Red":RETURN
590 IFE<E0*.2THENC$="{yellow}Yellow":RETURN
600 C$="{light green}Green":RETURN
610 FORJ=0TO5:D(J)=0:NEXT:RETURN
620 PRINT"{down}{pink}"D$(I);" Damaged"
630 PRINTD(I);"years estimated for repair":PRINT
635 IFI=1THENPRINT"{down}"
640 IFA=1THENRETURN
650 INPUT"{down}{white}(7=menu)(8=quit) COMMAND";A:IFA=8THENINPUT"{down}Are you sure (y/n)";E$:IFE$="y"THENEND
660 IFA<1ORA>6THEN680
670 ONAGOTO710,310,1250,1140,690,1300
680 FORI=0TO5:PRINTLEFT$(D$(I),1);I+1;"= ";D$(I):NEXT:GOTO650
690 IFD(4)>0THENPRINT"{purple}Space crud blocking tubes!":I=4:GOTO630
700 N=15:IFP<1THENPRINT"{purple}No torpedoes left":GOTO650
710 IFA=5THENPRINT"{purple}Torpedo ";
720 INPUT"Course(1-8.9)";Z:IFZ<1THEN650
730 IFZ>=9THEN710
740 IFA=5THENP=P-1:PRINT"{purple}Track";:GOTO900
750 INPUT"Warp(0-12)";W:IFW<=0ORW>12THEN710
760 IFW<=.2ORD(0)<=0THEN780
770 I=0:PRINTD$(I);" damaged, max is .2":GOSUB630:GOTO750
780 GOSUB480:IFE<=0THEN1370
790 IFRND(1)>.33THEN870
800 X=INT(RND(1)*6):IFRND(1)>.5THEN830
810 D(X)=D(X)+INT(6-RND(1)*5):PRINT"{blue}**SPACE{sh space}STORM, "
820 PRINTD$(X);" damaged**":I=X:GOSUB630:D(X)=D(X)+1:GOTO870
830 FORI=XTO5:IFD(I)>0THEN860
850 NEXT:FORI=0TOX:IFD(I)<=0THENNEXT:GOTO870
860 D(I)=.5:PRINT"{light blue}**Spock used a new repair technique**"
870 FORI=0TO5:IFD(I)=0THEN890
880 D(I)=D(I)-1:IF D(I)<=0THEND(I)=0:PRINTD$(I);" are fixed"
890 NEXT:N=INT(W*8):E=E-N-N+.5:S(S1,S2)=1
900 T=T+1:Y1=S1+.5:X1=S2+.5:IFT>T9THEN1370
910 Y=(Z-1)*.785398:X=COS(Y):Y=-SIN(Y)
920 FORI=1TON:Y1=Y1+Y:X1=X1+X:Y2=INT(Y1):X2=INT(X1)
930 IFX2<0ORX2>7ORY2<0ORY2>7THEN1110
940 IFA=5THENPRINTY2+1;"-";X2+1,
950 IFS(Y2,X2)=1THENNEXT:GOTO1060
960 PRINT:IFA=1THENPRINT"Blocked by ";
970 ONS(Y2,X2)-3GOTO1040,1020
980 PRINT"Klingon";:IFA=1THEN1050
990 FORI=0TO7:IFY2<>K1(I)THEN1010
1000 IFX2=K2(I)THENK3(I)=0
1010 NEXT:K=K-1:K9=K9-1:GOTO1070
1020 PRINT"Star";:IFA=5THENS=S-1:GOTO1070
1030 GOTO1050
1040 PRINT"Starbase";:IFA=5THENB=2:GOTO1070
1050 PRINT" at sector";Y2+1;"-";X2+1:Y2=INT(Y1-Y):X2=INT(X1-X)
1060 S1=Y2:S2=X2:S(S1,S2)=2:A=2:GOTO310
1070 PRINT" destroyed!";:IFB=2THENB=0:PRINT".traitor!!!";
1080 PRINT:S(Y2,X2)=1:Q(Q1,Q2)=K*100+B*10+S:T=T-1:IFK<1THENC$="{light green}Green"
1085 GOSUB4000:IFK9<1THEN1400
1090 GOSUB480:IFE<=0THEN1370
1100 GOSUB550:GOTO650
1110 IFA=5THENPRINT"Missed!":GOTO1090
1120 Q1=INT(Q1+W*Y+(S1+.5)/8):Q2=INT(Q2+W*X+(S2+.5)/8)
1130 Q1=Q1-(Q1<0)+(Q1>7):Q2=Q2-(Q2<0)+(Q2>7):GOTO230
1140 I=3:IFD(I)>0THEN620
1150 INPUT"{pink}Units to fire";X:IFX<=0THEN650
1160 IFX>ETHENPRINT"YOU'VE ONLY GOT";E:GOTO1150
1170 E=E-X:Y=K:FORI=0TO7:IFK3(I)<=0THEN1230
1180 H=X/(Y*(FND(0)^.4)):K3(I)=K3(I)-H
1190 E$="Klingon at":N=K3(I):GOSUB530
1200 IFK3(I)>0THEN1230
1210 PRINT"{purple}**Klingon destroyed**"
1220 K=K-1:K9=K9-1:S(K1(I),K2(I))=1:Q(Q1,Q2)=Q(Q1,Q2)-100
1230 NEXT:IFK<1THENC$="{light green}Green"
1231 GOSUB4000:IFK9<1THEN1400
1235 IFT>T9THEN1370
1240 GOTO1090
1250 I=2:IFD(I)>0THEN620
1260 PRINTD$(I);" for zone";Q1+1;"-";Q2+1
1270 FORI=Q1-1TOQ1+1:FORJ=Q2-1TOQ2+1:PRINT"  ";
1280 IFI<0ORI>7ORJ<0ORJ>7THENPRINT"***";:GOTO1350
1290 Q(I,J)=ABS(Q(I,J)):GOTO1340
1300 I=5:IFD(I)>0THEN620
1310 PRINT"{clear}{light blue}Galactic record for{down}":PRINT"  stardate";T;"{down}":M=1
1320 FORI=0TO7:FORJ=0TO7:PRINT"  ";
1330 IFQ(I,J)<0THENPRINT"***";:GOTO1350
1340 E$=STR$(Q(I,J)):E$="00"+MID$(E$,2):PRINTRIGHT$(E$,3);
1350 NEXTJ:PRINT:NEXTI
1351 IFM<>1THENGOSUB610:GOTO650
1355 PRINT"Hit any key to cont.":M=0
1356 GETA$:IFA$=""THEN1356
1357 PRINT"{clear}":GOTO310
1360 PRINT:PRINT"{down}{yellow}It is stardate";T:RETURN
1370 GOSUB1360:PRINT
1371 PRINT"You lose!{down}"
1374 PRINT"The federation will be conquered by the"
1375 PRINT"remaining";K9;"klingon cruisers!":GOTO9999
1400 GOSUB1360
1401 PRINT"{down}{yellow}The federation is safe!"
1402 PRINT
1410 PRINT"{down}You destroyed";O%;"klingons in";T-T0;"years!{down}"
1420 PRINT"Rating:";INT(Z/(T-T0)*1000)
1421 GOTO9999
4000 PRINT"{down}{purple}":FORI=0TO7:FORJ=0TO7:PRINT"{purple}";MID$(Q$,S(I,J),1);   ;:NEXTJ
4350 PRINT" ";:ONIGOTO4380,4390,4400,4410,4420,4430,4440
4360 PRINT"{light blue}Years    :{white}";T9-T
4370 NEXT:GOTO4442
4380 PRINT"{light blue}Stardate :{white}";T;TAB(29);"{white}{sh -}";DA$(0):GOTO4370
4390 PRINT"{light blue}Condition: ";C$;TAB(29);"{white}{sh -}";DA$(1):GOTO4370
4400 PRINT"{light blue}Zone     :{white}";Q1+1;"-";Q2+1;TAB(29);"{white}{sh -}";DA$(2):GOTO4370
4410 PRINT"{light blue}Sector   :{white}";S1+1;"-";S2+1;TAB(29);"{white}{sh -}";DA$(3):GOTO4370
4420 PRINT"{light blue}Energy   :{white}";INT(E)"{left} ";TAB(29);"{white}{sh -}";DA$(4):GOTO4370
4430 PRINT"{light blue}Torpedos :{white}";P;TAB(29);"{white}{sh -}";DA$(5):GOTO4370
4440 PRINT"{light blue}Klingons :{white}";K9"{left} {left}":GOTO4370
4442 PRINT"{light blue}Klingons at start :{white}"O%;" {light blue}Star bases:{white}";B9
4500 RETURN
9999 END
