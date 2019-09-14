1000 REM ARITM V0.3.2 FOR COMMANDER X16 BASIC 2.0 IS FOSS.
1020 REM (C) 1992-2019 BY MIKAEL O. BONNIER, LUND, SWEDEN.
1030 REM E-MAIL: <MIKAEL.BONNIER@GMAIL.COM>.
1040 REM ABSOLUTELY NO WARRANTY.
1050 REM LICENSE GPLV3+, SEE 
1060 REM <HTTP://WWW.GNU.ORG/LICENSES/GPL.HTML>.
1070 REM MORE PROGRAMS AT 
1080 REM <HTTP://WWW.DF.LTH.SE.ORBIN.SE/~MIKAELB/BASIC/>. ~ IS TILDE.
1090 REM DOCUMENTATION:
1100 REM 876543210, 8:TYPE, 7-5:OP1, 4-3:OP2, 2:RES'D, 1-0:#TODO.
1110 REM PROGRAM:
1112 GOTO 1115
1113 MOD%=INT((X/Y-INT(X/Y))*Y+.5):RETURN
1114 DIV=INT(X/Y+.5):RETURN
1115 LET R=RND(-TIME):LET R=RND(0)
1116 OPEN1,0:POKE646,0:PRINT CHR$(142);CHR$(158):IF PEEK($D9)<>40 THEN SYS$FF5F
1117 DIM A(590)
1120 REM LBL C
1130 GOSUB 3410:REM CLS
1140 LET A%=0
1150 IF (L%>0)*M THEN GOTO 3000:REM CONTMENU
1160 IF 0=M THEN LET M=10
1170 GOTO 3030:REM MENU
1180 REM LBL S
1190 GOSUB 3410:REM CLS
1200 PRINT "GENERATING"
1210 PRINT "PROBLEMS..."
1220 LET U%=1
1230 REM DIM A(N%)
1240 REM LBL ADD1
1250 X=M:Y=10:GOSUB 1114:X=DIV:GOSUB 1113
1255 IF 0=MOD% THEN GOTO 1320:REM ADD2
1260 FOR I=0 TO 9
1270 FOR J=0 TO 9
1280 LET A(U%)=100000000+I*100000+J*1000+1
1290 LET U%=U%+1
1300 NEXT J
1310 NEXT I
1320 REM LBL ADD2
1330 X=M:Y=100:GOSUB 1114:X=DIV:Y=10:GOSUB 1113
1335 IF 0=MOD% THEN GOTO 1410:REM SUB1
1340 FOR I=0 TO 9
1350 FOR J=0 TO 9
1360 LET T%=10*(INT(8*RND(1))+1)
1370 LET A(U%)=200000000+(T%+I)*100000+J*1000+1
1380 LET U%=U%+1
1390 NEXT J
1400 NEXT I
1410 REM LBL SUB1
1420 X=M:Y=1000:GOSUB 1114:X=DIV:Y=10:GOSUB 1113
1420 IF 0=MOD% THEN GOTO 1490:REM SUB2
1430 FOR I=0 TO 9
1440 FOR J=I TO 9+I
1450 LET A(U%)=300000000+J*100000+I*1000+1
1460 LET U%=U%+1
1470 NEXT J
1480 NEXT I
1490 REM LBL SUB2
1500 X=M:Y=10000:GOSUB 1114:X=DIV:Y=10:GOSUB 1113
1505 IF 0=MOD% THEN GOTO 1580:REM MUL
1510 FOR I=0 TO 9
1520 FOR J=I TO 9+I
1530 LET T%=10*(INT(9*RND(1))+1)
1540 LET A(U%)=400000000+(T%+J)*100000+I*1000+1
1550 LET U%=U%+1
1560 NEXT J
1570 NEXT I
1580 REM LBL MUL
1590 X=M:Y=100000:GOSUB 1114:X=DIV:Y=10:GOSUB 1113
1595 IF 0=MOD% THEN GOTO 1660:REM DIV
1600 FOR I=0 TO 9
1610 FOR J=0 TO 9
1620 LET A(U%)=500000000+I*100000+J*1000+1
1630 LET U%=U%+1
1640 NEXT J
1650 NEXT I
1660 REM LBL DIV
1670 X=M:Y=1000000:GOSUB 1114:X=DIV:Y=10:GOSUB 1113
1675 IF 0=MOD% THEN GOTO 1750:REM ENDIF
1680 FOR I=0 TO 9
1690 FOR J=1 TO 9
1700 LET T%=I*J+INT(J*RND(1))
1710 LET A(U%)=600000000+T%*100000+J*1000+1
1720 LET U%=U%+1
1730 NEXT J
1740 NEXT I
1750 REM LBL ENDIF
1760 LET U%=U%-1
1770 LET L%=U%
1780 REM LBL U
1790 PRINT "SHUFFLING..."
1800 FOR I=U% TO 2 STEP -1
1810 LET J%=INT(I*RND(1))+1
1820 LET T=A(I)
1830 LET A(I)=A(J%)
1840 LET A(J%)=T
1850 NEXT I
1860 LET K%=1
1870 REM LBL K
1880 GOSUB 3410:REM CLS
1890 PRINT MID$(STR$(L%),2);" PROBLEMS LEFT. -1 ESC"
1900 LET T=A(K%)
1910 X=T:Y=100000000:GOSUB 1114
1915 LET C%=DIV
1920 IF 6=C% THEN PRINT "INTEGER PART OF ";
1930 X=T:Y=100000:GOSUB 1114:X=DIV:Y=1000:GOSUB 1113
1935 LET I%=MOD%
1940 PRINT MID$(STR$(I%),2);
1950 GOSUB 3280:REM SIGN
1960 X=T:Y=1000:GOSUB 1114:X=DIV:Y=100:GOSUB 1113
1965 LET J%=MOD%
1970 PRINT MID$(STR$(J%),2);
1980 PRINT " = ";:INPUT#1,A$:A%=VAL(A$)
1985 PRINT
1990 IF -1=A% OR ".1"=A$ THEN GOTO 1120:REM C
2000 IF (1=C%)+(2=C%) THEN LET R%=I%+J%:GOTO 2040:REM ENDIF
2010 IF (3=C%)+(4=C%) THEN LET R%=I%-J%:GOTO 2040:REM ENDIF
2020 IF 5=C% THEN LET R%=I%*J%:GOTO 2040:REM ENDIF
2030 IF 6=C% THEN LET R%=INT(I%/J%)
2040 REM LBL ENDIF
2050 IF R%<>A% THEN GOTO 2140:REM WRONG
2060 PRINT "RIGHT! ";
2070 X=T:Y=100:GOSUB 1113
2075 IF 0>=MOD% THEN GOTO 2100:REM ENDIF
2080 LET L%=L%-1
2090 LET A(K%)=T-1
2100 REM LBL ENDIF
2110 LET K%=K%+1
2120 IF 0<L% THEN LET D=500:GOSUB 3402:REM DELAY
2130 GOTO 2250:REM ENDIF 2
2140 REM LBL WRONG
2150 PRINT "WRONG.";
2160 PRINT STR$(I%);
2170 GOSUB 3280:REM SIGN
2180 PRINT MID$(STR$(J%),2);" IS";STR$(R%);"."
2190 X=T:Y=100:GOSUB 1113
2195 IF 99<=MOD% THEN GOTO 2220:REM ENDIF
2200 LET L%=L%+1
2210 LET A(K%)=T+1
2220 REM LBL ENDIF
2230 LET K%=K%+1
2235 GOSUB 3610:REM SOUND
2240 LET D=1000:GOSUB 3402:REM DELAY
2250 REM LBL ENDIF 2
2260 IF K%<=U% GOTO 1870:REM K
2270 IF 0>=L% GOTO 2390:REM W
2280 PRINT "CHECKING..."
2290 LET N%=1
2300 FOR K=1 TO U%
2310 LET T=A(K)
2320 X=T:Y=100:GOSUB 1113
2325 IF 0=MOD% THEN GOTO 2350:REM ENDIF
2330 LET A(N%)=T
2340 LET N%=N%+1
2350 REM ENDIF
2360 NEXT K
2370 LET U%=N%-1
2380 GOTO 1780:REM U
2390 REM LBL W
2400 PRINT "GOOD!!! WELL DONE!"
2410 LET D=5000:GOSUB 3402:REM DELAY
2420 GOTO 1120:REM C
2430 REM LBL E
2440 GOSUB 3410:REM CLS
2450 LET A%=0
2460 LET N%=0
2470 LET T=M
2480 GOSUB 2640:REM SUB
2490 PRINT "ADDITION 1"
2500 GOSUB 2640:REM SUB
2510 PRINT "ADDITION 2"
2520 GOSUB 2640:REM SUB
2530 PRINT "SUBTRACTION 1"
2540 GOSUB 2640:REM SUB
2550 PRINT "SUBTRACTION 2"
2560 GOSUB 2640:REM SUB
2570 PRINT "MULTIPLICATION"
2580 GOSUB 2640:REM SUB
2590 PRINT "DIVISION y -1 ESC"
2600 PRINT "0 OK AND GO";
2610 GOTO 2760:REM AFTER SUB
2640 REM SUB
2650 LET A%=A%+1
2660 X=T:Y=10:GOSUB 1114
2665 LET T=DIV
2670 PRINT MID$(STR$(A%),2);
2680 X=T:Y=10:GOSUB 1113
2685 IF 0=MOD% THEN GOTO 2720:REM ELSE
2690 PRINT "*";
2700 LET N%=N%+100+10*(6=A%)
2710 GOTO 2740:REM ENDIF
2720 REM LBL ELSE
2730 PRINT " ";
2740 REM LBL ENDIF
2750 RETURN
2760 REM LBL AFTER SUB
2770 PRINT STR$(N%)
2780 REM LBL INPUT
2790 PRINT "TOGGLE ITEM 1-6, OR CHOOSE 0 OR -1: ";:INPUT#1,A$:A%=VAL(A$)
2795 PRINT:REM C64 INPUT# DOESN'T LINEFEED
2800 IF (-1>A%)+(6<A%)+(0=A%)*(0=N%) THEN GOTO 2780:REM INPUT
2810 IF 0=A% THEN GOTO 1180:REM S
2820 IF -1=A% OR ".1"=A$ THEN GOTO 1120:REM C
2830 GOSUB 3350:REM 10^A%
2840 X=M:Y=R:GOSUB 1114:X=DIV:Y=10:GOSUB 1113
2845 IF 0=MOD% THEN GOTO 2870:REM ELSE
2850 LET M=M-R
2860 GOTO 2890:REM ENDIF
2870 REM LBL ELSE
2880 LET M=M+R
2890 REM ENDIF
2900 GOTO 2430:REM E
2910 REM LBL H
2920 GOSUB 3470:REM HELP
2930 GOTO 1120:REM C
2940 REM LBL A
2950 GOSUB 3540:REM ABOUT
2960 GOTO 1120:REM C
2970 REM LBL Q
2980 GOSUB 3410:REM CLS
2990 END
3000 REM LBL CONTMENU
3010 GOSUB 3240:REM MENUITEM
3020 PRINT "CONTINUE"
3030 REM LBL MENU
3040 GOSUB 3240:REM MENUITEM
3050 PRINT "SETUP AND GO"
3060 GOSUB 3240:REM MENUITEM
3070 PRINT "HELP"
3080 GOSUB 3240:REM MENUITEM
3090 PRINT "ABOUT"
3100 GOSUB 3240:REM MENUITEM
3110 PRINT "EXIT"
3120 REM LBL INPUT
3130 PRINT "CHOOSE 1-";MID$(STR$(4-(L%>0)),2);": ";
3140 INPUT#1,A$:S%=VAL(A$)
3145 PRINT
3150 IF (1>S%)+(4-(L%>0)<S%) THEN GOTO 3120:REM INPUT
3160 LET S%=S%-(L%<=0)
3170 REM ON S GOTO K,E,H,A,Q
3180 ON S% GOTO 1870,2430,2910,2940,2970
3230 STOP
3240 REM SUB MENUITEM
3250 LET A%=A%+1
3260 PRINT MID$(STR$(A%),2);" ";
3270 RETURN
3280 REM SUB SIGN
3290 IF (1=C%)+(2=C%) THEN PRINT "+";:GOTO 3330:REM ENDIF
3300 IF (3=C%)+(4=C%) THEN PRINT "-";:GOTO 3330:REM ENDIF
3310 IF 5=C% THEN PRINT "*";:GOTO 3330:REM ENDIF
3320 IF 6=C% THEN PRINT "/";
3330 REM LBL ENDIF
3340 RETURN
3350 REM SUB 10^A, A>0
3360 LET R=1
3370 FOR I=1 TO A%
3380 LET R=R*10
3390 NEXT I
3400 RETURN
3402 REM DELAY
3404 LET T1=TIME
3405 LET D=60*D/1000
3406 IF TIME-T1<D THEN GOTO 3406
3408 RETURN
3410 REM SUB CLS
3420 FOR T=1 TO 30
3430 PRINT
3440 NEXT T
3450 PRINT "ARITM"
3460 RETURN
3470 REM SUB HELP
3480 GOSUB 3410:REM CLS
3490 PRINT "HELP"
3500 PRINT "YOU CAN MIX PROBLEMS ANYWAY YOU LIKE."
3510 PRINT "MORE HELP ON <HTTP://ARITM.ORBIN.SE/>."
3520 LET D=5000:GOSUB 3402:REM DELAY
3530 RETURN
3540 REM SUB ABOUT
3550 GOSUB 3410:REM CLS
3560 PRINT "ABOUT"
3570 PRINT "ARITM 0.3 (C) 1992-2019 BY" 
3575 PRINT "MIKAEL O. BONNIER, LUND, SWEDEN."
3580 PRINT "ABSOLUTELY NO WARRANTY."
3585 PRINT "FOSS, SEE LICENSE GPLV3+."
3590 LET D=5000:GOSUB 3402:REM DELAY
3600 RETURN
3610 REM SUB SOUND 
3615 REM FOR X=54272 TO 54296:POKE X,0:NEXT 
3620 REM POKE 54296,15 
3630 REM POKE 54277,190 
3640 REM POKE 54278,248 
3650 REM POKE 54273,17:POKE 54272,37 
3660 REM POKE 54276,17 
3670 FOR X=1 TO 250:NEXT 
3680 REM POKE 54276,16
3690 RETURN
