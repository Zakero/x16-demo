10 REM BLINKENLIGHTS RANDALL BOHN 2019-10-03 FOR MARY
15 POKE 646,1:PRINT CHR$(147);"BLINKENLIGHTS"
20 GOSUB 300 :REM SET UP VERA L1 160x120x4 BIG PIXELS
40 REM MAIN LOOP
50 CC=$FF:GOSUB 100
60 CC=$AA:GOSUB 100
70 CC=$55:GOSUB 100
80 CC=0  :GOSUB 100
90 GOTO 40
100 REM PLOTTING
110 U0 = INT(RND(1)*155)
111 VPOKE 15,$1002+INT(RND(1)*6),INT(RND(1)*256)
120 FOR U = U0 TO U0 +3
130 X = U AND $FE
140 GOSUB 700
150 NEXT U
160 RETURN
300 REM VERA CONFIGURATION
310 VPOKE 15,1,128 :REM 640 WIDE
320 VPOKE 15,2,64  :REM 240 HIGH
330 VPOKE 15,$2000,1 :REM L0 MODE 0
340 VPOKE 15,$2001,2 :REM L0 MAPH 32 TILES, MAPW 128 TILES
350 VPOKE 15,$3005,16:REM L1 MAP AT $4000
360 VPOKE 15,$3001,16:REM L1 160 BYTES WIDE
370 VPOKE 15,$3000,$A1:REM L1 MODE 5
380 RETURN
700 FOR Y = 10 TO 99 STEP 2: GOSUB 900:NEXT Y
710 RETURN
900 REM PLOT 160X120X4
910 VB = $4000+320*Y+X
920 VPOKE 0,VB,CC	:REM TOP HALF
930 VPOKE 0,VB+160,CC	:REM BOTTOM HALF
940 RETURN
RUN
