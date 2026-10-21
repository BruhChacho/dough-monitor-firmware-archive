# DC9 v101 bootloader evidence

Source SHA256: `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`.

Static decoding only. The AEON definition is incomplete; this is not an execution trace.
Column 1 is the original file offset; column 2 is the candidate runtime address.
The second-stage mapping follows the copy/jump arguments at raw 0x2322–0x2364:
source 0x724d, destination 0x01000100, copy length 0x4eb8.

## Update-slot CRC and selection

```text
002000  00002000  9c 34        bt.addi           r1, -0xc
002002  00002002  0d 21 08     bn.sw             0x8(r1),r9
002005  00002005  0d 41 04     bn.sw             0x4(r1),r10
002008  00002008  0d 61 00     bn.sw             0x0(r1),r11
00200b  0000200b  98 60        bt.movi           r3, 0x0
00200d  0000200d  e4 00 6a fa  bg.jal            0x558a
002011  00002011  e4 00 74 e2  bg.jal            0x5a82
002015  00002015  c1 56 00 01  bg.movhi          r10, 0xb000
002019  00002019  04 e0 40     bn.movhi_2        r7, 0x40
00201c  0000201c  ec ea 0a e8  bg.sw_0           0xae8(r10),r7,
002020  00002020  c0 e0 00 21  bg.movhi          r7, 0x1
002024  00002024  fc e7 00 00  bg.addi           r7, r7, 0x0
002028  00002028  04 c0 40     bn.movhi_2        r6, 0x40
00202b  0000202b  8c e6        bt.add            r7, r6
00202d  0000202d  0c 87 22     bn.lwz            r4,0x20(r7)
002030  00002030  04 60 40     bn.movhi_2        r3, 0x40
002033  00002033  9c 84        bt.addi           r4, 0x4
002035  00002035  04 a4 c1     bn.movhi_2        r5, 0x4c1
002038  00002038  c8 a5 1d b7  bg.ori            r5, r5, 0x1db7
00203c  0000203c  98 c0        bt.movi           r6, 0x0
00203e  0000203e  98 e5        bt.movi           r7, 0x5
002040  00002040  99 00        bt.movi           r8, 0x0
002042  00002042  e4 00 69 12  bg.jal            0x54cb
002046  00002046  99 60        bt.movi           r11, 0x0
002048  00002048  20 60 3e     bn.bnei           r3,0x0,0x2057
00204b  0000204b  99 61        bt.movi           r11, 0x1
00204d  0000204d  c0 60 00 01  bg.movhi          r3, 0x0
002051  00002051  fc 63 5e f3  bg.addi           r3, r3, 0x5ef3
002055  00002055  90 0e        bt.j              0x2063
002057  00002057  ec 0a 0a e8  bg.sw_0           0xae8(r10),r0,
00205b  0000205b  c0 60 00 01  bg.movhi          r3, 0x0
00205f  0000205f  fc 63 5f 17  bg.addi           r3, r3, 0x5f17
002063  00002063  e4 00 5a d8  bg.jal            0x4dcf
002067  00002067  c0 f6 00 01  bg.movhi          r7, 0xb000
00206b  0000206b  ec 87 0a ea  bg.lwz            r4,0xae8(r7),
00206f  0000206f  c0 c0 00 21  bg.movhi          r6, 0x1
002073  00002073  fc c6 00 80  bg.addi           r6, r6, 0x80
002077  00002077  40 e4 34     bn.add            r7, r4, r6
00207a  0000207a  5c e7 04     bn.exthz          r7, r7
00207d  0000207d  c0 b4 00 01  bg.movhi          r5, 0xa000
002081  00002081  c8 c5 21 ec  bg.ori            r6, r5, 0x21ec
002085  00002085  0c e6 01     bn.sh_1           0x0(r6),r7
002088  00002088  c0 e0 00 21  bg.movhi          r7, 0x1
00208c  0000208c  fc e7 00 80  bg.addi           r7, r7, 0x80
002090  00002090  8c 87        bt.add            r4, r7
002092  00002092  4c 84 81     bn.srli           r4, r4, 0x10
002095  00002095  c8 a5 21 f0  bg.ori            r5, r5, 0x21f0
002099  00002099  0c 85 01     bn.sh_1           0x0(r5),r4
00209c  0000209c  88 6b        bt.mov            r3, r11
00209e  0000209e  0d 61 02     bn.lwz            r11,0x0(r1)
0020a1  000020a1  0d 41 06     bn.lwz            r10,0x4(r1)
0020a4  000020a4  0d 21 0a     bn.lwz            r9,0x8(r1)
0020a7  000020a7  9c 2c        bt.addi           r1, 0xc
0020a9  000020a9  85 29        bt.jr             r9
```

## Second-stage copy and jump

```text
00231e  0000231e  e7 ff f9 c4  bg.jal            0x2000
002322  00002322  c0 60 20 01  bg.movhi          r3, 0x100
002326  00002326  fc 63 01 00  bg.addi           r3, r3, 0x100
00232a  0000232a  c0 80 00 01  bg.movhi          r4, 0x0
00232e  0000232e  fc 84 72 4d  bg.addi           r4, r4, 0x724d
002332  00002332  c0 a0 00 01  bg.movhi          r5, 0x0
002336  00002336  fc a5 4e b8  bg.addi           r5, r5, 0x4eb8
00233a  0000233a  e7 ff fb 98  bg.jal            0x2106
00233e  0000233e  c0 60 00 01  bg.movhi          r3, 0x0
002342  00002342  fc 63 62 59  bg.addi           r3, r3, 0x6259
002346  00002346  e4 00 54 44  bg.jal            0x4d68
00234a  0000234a  c8 ea 1f 58  bg.ori            r7, r10, 0x1f58
00234e  0000234e  fc c0 c0 00  bg.addi           r6, r0, -0x4000
002352  00002352  0c c7 01     bn.sh_1           0x0(r7),r6
002355  00002355  c9 4a 1f 20  bg.ori            r10, r10, 0x1f20
002359  00002359  0c ca 01     bn.sh_1           0x0(r10),r6
00235c  0000235c  c0 60 20 01  bg.movhi          r3, 0x100
002360  00002360  fc 63 01 00  bg.addi           r3, r3, 0x100
002364  00002364  e7 ff fc 8e  bg.jal            0x21ab
```

## Raw DEFLATE wrapper

```text
00743c  010002ef  1c 21 c4     bn.addi           r1, r1, -0x3c
00743f  010002f2  0d 21 38     bn.sw             0x38(r1),r9
007442  010002f5  0d 41 34     bn.sw             0x34(r1),r10
007445  010002f8  0d 61 30     bn.sw             0x30(r1),r11
007448  010002fb  89 67        bt.mov            r11, r7
00744a  010002fd  0c 01 28     bn.sw             0x28(r1),r0
00744d  01000300  c0 e0 20 01  bg.movhi          r7, 0x100
007451  01000304  fc e7 01 9c  bg.addi           r7, r7, 0x19c
007455  01000308  0c e1 20     bn.sw             0x20(r1),r7
007458  0100030b  c0 e0 20 01  bg.movhi          r7, 0x100
00745c  0100030f  fc e7 01 b6  bg.addi           r7, r7, 0x1b6
007460  01000313  0c e1 24     bn.sw             0x24(r1),r7
007463  01000316  0c 61 00     bn.sw             0x0(r1),r3
007466  01000319  0c a1 04     bn.sw             0x4(r1),r5
007469  0100031c  0c 81 0c     bn.sw             0xc(r1),r4
00746c  0100031f  0c c1 10     bn.sw             0x10(r1),r6
00746f  01000322  88 61        bt.mov            r3, r1
007471  01000324  98 91        bt.movi           r4, -0xf
007473  01000326  e4 00 4b b4  bg.jal            0x1002900
007477  0100032a  20 60 3a     bn.bnei           r3,0x0,0x1000338
00747a  0100032d  88 61        bt.mov            r3, r1
00747c  0100032f  98 84        bt.movi           r4, 0x4
00747e  01000331  e4 00 6b 7a  bg.jal            0x10038ee
007482  01000335  24 7c 36     bn.bgtsi          r3,-0x1,0x1000342
007485  01000338  88 61        bt.mov            r3, r1
007487  0100033a  e4 00 48 1c  bg.jal            0x1002748
00748b  0100033e  98 61        bt.movi           r3, 0x1
00748d  01000340  90 10        bt.j              0x1000350
00748f  01000342  0c e1 16     bn.lwz            r7,0x14(r1)
007492  01000345  0c eb 00     bn.sw             0x0(r11),r7
007495  01000348  88 61        bt.mov            r3, r1
007497  0100034a  e4 00 47 fc  bg.jal            0x1002748
00749b  0100034e  98 60        bt.movi           r3, 0x0
00749d  01000350  0d 61 32     bn.lwz            r11,0x30(r1)
0074a0  01000353  0d 41 36     bn.lwz            r10,0x34(r1)
0074a3  01000356  0d 21 3a     bn.lwz            r9,0x38(r1)
0074a6  01000359  1c 21 3c     bn.addi           r1, r1, 0x3c
0074a9  0100035c  85 29        bt.jr             r9
```

## Header selection and fallback

```text
0074ab  0100035e  1c 21 e4     bn.addi           r1, r1, -0x1c
0074ae  01000361  0d 21 18     bn.sw             0x18(r1),r9
0074b1  01000364  0d 41 14     bn.sw             0x14(r1),r10
0074b4  01000367  0d 61 10     bn.sw             0x10(r1),r11
0074b7  0100036a  0d 81 0c     bn.sw             0xc(r1),r12
0074ba  0100036d  0d a1 08     bn.sw             0x8(r1),r13
0074bd  01000370  c0 f6 00 01  bg.movhi          r7, 0xb000
0074c1  01000374  ef a7 0a ea  bg.lwz            r29,0xae8(r7),
0074c5  01000378  c0 f4 04 01  bg.movhi          r7, 0xa020
0074c9  0100037c  c8 e7 1f 58  bg.ori            r7, r7, 0x1f58
0074cd  01000380  08 e7 01     bn.lh             r7,0x0(r7)
0074d0  01000383  4c e7 80     bn.slli           r7, r7, 0x10
0074d3  01000386  42 e7 ec     bn.add            r23, r7, r29
0074d6  01000389  c0 c0 00 21  bg.movhi          r6, 0x1
0074da  0100038d  fc c6 00 18  bg.addi           r6, r6, 0x18
0074de  01000391  40 f7 34     bn.add            r7, r23, r6
0074e1  01000394  0c e7 02     bn.lwz            r7,0x0(r7)
0074e4  01000397  43 37 3c     bn.add            r25, r23, r7
0074e7  0100039a  0c f9 02     bn.lwz            r7,0x0(r25)
0074ea  0100039d  40 97 3c     bn.add            r4, r23, r7
0074ed  010003a0  0f 19 0e     bn.lwz            r24,0xc(r25)
0074f0  010003a3  c0 c0 00 21  bg.movhi          r6, 0x1
0074f4  010003a7  fc c6 00 1c  bg.addi           r6, r6, 0x1c
0074f8  010003ab  40 f7 34     bn.add            r7, r23, r6
0074fb  010003ae  0c e7 02     bn.lwz            r7,0x0(r7)
0074fe  010003b1  04 a0 40     bn.movhi_2        r5, 0x40
007501  010003b4  20 e0 96     bn.bnei           r7,0x0,0x10003d9
007504  010003b7  f0 e4 20 08  bg.lbz            r7, 0x2008(r4)
007508  010003bb  4c e7 40     bn.slli           r7, r7, 0x8
00750b  010003be  f0 c4 20 09  bg.lbz            r6, 0x2009(r4)
00750f  010003c2  44 e7 35     bn.or             r7, r7, r6
007512  010003c5  4c e7 40     bn.slli           r7, r7, 0x8
007515  010003c8  f0 c4 20 0a  bg.lbz            r6, 0x200a(r4)
007519  010003cc  44 e7 35     bn.or             r7, r7, r6
00751c  010003cf  4c e7 40     bn.slli           r7, r7, 0x8
00751f  010003d2  f0 c4 20 0b  bg.lbz            r6, 0x200b(r4)
007523  010003d6  44 a7 35     bn.or             r5, r7, r6
007526  010003d9  94 e2        bt.movhi          r7, 0x2
007528  010003db  40 d7 3c     bn.add            r6, r23, r7
00752b  010003de  d4 c4 04 dd  bg.bgt            r6,r4,0x1000479
00752f  010003e2  40 e5 34     bn.add            r7, r5, r6
007532  010003e5  d4 e4 04 a1  bg.ble            r7,r4,0x1000479
007536  010003e9  8f 17        bt.add            r24, r23
007538  010003eb  d4 d8 04 75  bg.bgt            r6,r24,0x1000479
00753c  010003ef  d4 f8 04 51  bg.ble            r7,r24,0x1000479
007540  010003f3  0d b9 06     bn.lwz            r13,0x4(r25)
007543  010003f6  0f 59 0a     bn.lwz            r26,0x8(r25)
007546  010003f9  f0 c4 11 51  bg.lbz            r6, 0x1151(r4)
00754a  010003fd  4c c6 40     bn.slli           r6, r6, 0x8
00754d  01000400  f0 e4 11 50  bg.lbz            r7, 0x1150(r4)
007551  01000404  44 c6 3d     bn.or             r6, r6, r7
007554  01000407  4c c6 40     bn.slli           r6, r6, 0x8
007557  0100040a  f0 e4 11 4f  bg.lbz            r7, 0x114f(r4)
00755b  0100040e  44 c6 3d     bn.or             r6, r6, r7
00755e  01000411  4c c6 40     bn.slli           r6, r6, 0x8
007561  01000414  f0 e4 11 4e  bg.lbz            r7, 0x114e(r4)
007565  01000418  44 c6 3d     bn.or             r6, r6, r7
007568  0100041b  8c d7        bt.add            r6, r23
00756a  0100041d  10 e6 03     bn.lbz            r7,0x3(r6)
00756d  01000420  4c e7 40     bn.slli           r7, r7, 0x8
007570  01000423  10 a6 02     bn.lbz            r5,0x2(r6)
007573  01000426  44 e7 2d     bn.or             r7, r7, r5
007576  01000429  4c e7 40     bn.slli           r7, r7, 0x8
007579  0100042c  10 a6 01     bn.lbz            r5,0x1(r6)
00757c  0100042f  44 e7 2d     bn.or             r7, r7, r5
00757f  01000432  4c e7 40     bn.slli           r7, r7, 0x8
007582  01000435  10 c6 00     bn.lbz            r6,0x0(r6)
007585  01000438  44 e7 35     bn.or             r7, r7, r6
007588  0100043b  c0 ca b5 41  bg.movhi          r6, 0x55aa
00758c  0100043f  c8 c6 ab cd  bg.ori            r6, r6, 0xabcd
007590  01000443  5c e6 0d     bn.sfne           r7, r6
007593  01000446  20 00 cd     bn.bf             0x1000479
007596  01000449  f0 e4 11 03  bg.lbz            r7, 0x1103(r4)
00759a  0100044d  4c e7 40     bn.slli           r7, r7, 0x8
00759d  01000450  f0 c4 11 02  bg.lbz            r6, 0x1102(r4)
0075a1  01000454  44 e7 35     bn.or             r7, r7, r6
0075a4  01000457  4c e7 40     bn.slli           r7, r7, 0x8
0075a7  0100045a  f0 c4 11 01  bg.lbz            r6, 0x1101(r4)
0075ab  0100045e  44 e7 35     bn.or             r7, r7, r6
0075ae  01000461  4c e7 40     bn.slli           r7, r7, 0x8
0075b1  01000464  f0 c4 11 00  bg.lbz            r6, 0x1100(r4)
0075b5  01000468  44 e7 35     bn.or             r7, r7, r6
0075b8  0100046b  c0 ca b5 41  bg.movhi          r6, 0x55aa
0075bc  0100046f  c8 c6 56 78  bg.ori            r6, r6, 0x5678
0075c0  01000473  5c e6 05     bn.sfeq           r7, r6
0075c3  01000476  20 01 05     bn.bf             0x10004b7
0075c6  01000479  c0 c0 00 21  bg.movhi          r6, 0x1
0075ca  0100047d  fc c6 00 00  bg.addi           r6, r6, 0x0
0075ce  01000481  40 f7 34     bn.add            r7, r23, r6
0075d1  01000484  0c e7 02     bn.lwz            r7,0x0(r7)
0075d4  01000487  40 97 3c     bn.add            r4, r23, r7
0075d7  0100048a  c0 c0 00 21  bg.movhi          r6, 0x1
0075db  0100048e  fc c6 00 04  bg.addi           r6, r6, 0x4
0075df  01000492  40 f7 34     bn.add            r7, r23, r6
0075e2  01000495  0d a7 02     bn.lwz            r13,0x0(r7)
0075e5  01000498  c0 c0 00 21  bg.movhi          r6, 0x1
0075e9  0100049c  fc c6 00 08  bg.addi           r6, r6, 0x8
0075ed  010004a0  40 f7 34     bn.add            r7, r23, r6
0075f0  010004a3  0f 47 02     bn.lwz            r26,0x0(r7)
0075f3  010004a6  c0 c0 00 21  bg.movhi          r6, 0x1
0075f7  010004aa  fc c6 00 0c  bg.addi           r6, r6, 0xc
0075fb  010004ae  40 f7 34     bn.add            r7, r23, r6
0075fe  010004b1  0c e7 02     bn.lwz            r7,0x0(r7)
007601  010004b4  43 17 3c     bn.add            r24, r23, r7
```

## Application marker and hardware CRC32

```text
007604  010004b7  0f 79 16     bn.lwz            r27,0x14(r25)
007607  010004ba  f0 e4 11 49  bg.lbz            r7, 0x1149(r4)
00760b  010004be  c0 e0 1b c4  bg.sfnei          r7, 0xde
00760f  010004c2  20 0f 3d     bn.bf             0x1000891
007612  010004c5  f0 e4 11 48  bg.lbz            r7, 0x1148(r4)
007616  010004c9  c0 e0 15 a4  bg.sfnei          r7, 0xad
00761a  010004cd  20 0f 11     bn.bf             0x1000891
00761d  010004d0  f0 e4 11 47  bg.lbz            r7, 0x1147(r4)
007621  010004d4  c0 e0 17 c4  bg.sfnei          r7, 0xbe
007625  010004d8  20 0e e5     bn.bf             0x1000891
007628  010004db  40 e4 bd     bn.sub            r7, r4, r23
00762b  010004de  40 d8 bd     bn.sub            r6, r24, r23
00762e  010004e1  43 27 ec     bn.add            r25, r7, r29
007631  010004e4  40 86 ec     bn.add            r4, r6, r29
007634  010004e7  c0 b4 04 01  bg.movhi          r5, 0xa020
007638  010004eb  c8 c5 12 04  bg.ori            r6, r5, 0x1204
00763c  010004ef  10 e6 00     bn.lbz            r7,0x0(r6)
00763f  010004f2  54 e7 01     bn.andi           r7, r7, 0x1
007642  010004f5  20 e3 ea     bn.bnei           r7,0x0,0x10004ef
007645  010004f8  5f 19 04     bn.exthz          r24, r25
007648  010004fb  c8 e5 12 10  bg.ori            r7, r5, 0x1210
00764c  010004ff  0f 07 01     bn.sh_1           0x0(r7),r24
00764f  01000502  4f 99 81     bn.srli           r28, r25, 0x10
007652  01000505  c8 e5 12 14  bg.ori            r7, r5, 0x1214
007656  01000509  0f 87 01     bn.sh_1           0x0(r7),r28
007659  0100050c  c8 e5 12 18  bg.ori            r7, r5, 0x1218
00765d  01000510  0c 07 01     bn.sh_1           0x0(r7),r0
007660  01000513  c8 e5 12 1c  bg.ori            r7, r5, 0x121c
007664  01000517  0c 07 01     bn.sh_1           0x0(r7),r0
007667  0100051a  40 e4 c5     bn.sub            r7, r4, r24
00766a  0100051d  5c e7 04     bn.exthz          r7, r7
00766d  01000520  c8 c5 12 20  bg.ori            r6, r5, 0x1220
007671  01000524  0c e6 01     bn.sh_1           0x0(r6),r7
007674  01000527  40 e4 cd     bn.sub            r7, r4, r25
007677  0100052a  4c e7 81     bn.srli           r7, r7, 0x10
00767a  0100052d  c8 c5 12 24  bg.ori            r6, r5, 0x1224
00767e  01000531  0c e6 01     bn.sh_1           0x0(r6),r7
007681  01000534  c8 c5 12 28  bg.ori            r6, r5, 0x1228
007685  01000538  fc e0 1d b7  bg.addi           r7, r0, 0x1db7
007689  0100053c  0c e6 01     bn.sh_1           0x0(r6),r7
00768c  0100053f  c8 c5 12 2c  bg.ori            r6, r5, 0x122c
007690  01000543  fc e0 04 c1  bg.addi           r7, r0, 0x4c1
007694  01000547  0c e6 01     bn.sh_1           0x0(r6),r7
007697  0100054a  c8 e5 12 30  bg.ori            r7, r5, 0x1230
00769b  0100054e  0c 07 01     bn.sh_1           0x0(r7),r0
00769e  01000551  c8 e5 12 34  bg.ori            r7, r5, 0x1234
0076a2  01000555  0c 07 01     bn.sh_1           0x0(r7),r0
0076a5  01000558  c8 e5 12 0c  bg.ori            r7, r5, 0x120c
0076a9  0100055c  18 07 00     bn.sbz            0x0(r7),r0
0076ac  0100055f  c8 c5 12 08  bg.ori            r6, r5, 0x1208
0076b0  01000563  fc e0 03 45  bg.addi           r7, r0, 0x345
0076b4  01000567  0c e6 01     bn.sh_1           0x0(r6),r7
0076b7  0100056a  c8 c5 12 00  bg.ori            r6, r5, 0x1200
0076bb  0100056e  98 e1        bt.movi           r7, 0x1
0076bd  01000570  18 e6 00     bn.sbz            0x0(r6),r7
0076c0  01000573  c0 b4 04 01  bg.movhi          r5, 0xa020
0076c4  01000577  c8 c5 12 04  bg.ori            r6, r5, 0x1204
0076c8  0100057b  10 e6 00     bn.lbz            r7,0x0(r6)
0076cb  0100057e  54 e7 08     bn.andi           r7, r7, 0x8
0076ce  01000581  20 e3 e8     bn.beqi           r7,0x0,0x100057b
0076d1  01000584  c8 e5 12 30  bg.ori            r7, r5, 0x1230
0076d5  01000588  08 c7 01     bn.lh             r6,0x0(r7)
0076d8  0100058b  5c c6 04     bn.exthz          r6, r6
0076db  0100058e  c8 e5 12 34  bg.ori            r7, r5, 0x1234
0076df  01000592  08 e7 01     bn.lh             r7,0x0(r7)
0076e2  01000595  4c e7 80     bn.slli           r7, r7, 0x10
0076e5  01000598  44 c6 3d     bn.or             r6, r6, r7
0076e8  0100059b  d4 db 11 36  bg.bne            r6,r27,0x10007c1
```

## Copy prefix, load stream, decode length and inflate

```text
0076ec  0100059f  c0 b4 04 01  bg.movhi          r5, 0xa020
0076f0  010005a3  ca e5 12 04  bg.ori            r23, r5, 0x1204
0076f4  010005a7  10 f7 00     bn.lbz            r7,0x0(r23)
0076f7  010005aa  54 e7 01     bn.andi           r7, r7, 0x1
0076fa  010005ad  20 e3 ca     bn.bnei           r7,0x0,0x100059f
0076fd  010005b0  c8 e5 12 10  bg.ori            r7, r5, 0x1210
007701  010005b4  0f 07 01     bn.sh_1           0x0(r7),r24
007704  010005b7  c8 e5 12 14  bg.ori            r7, r5, 0x1214
007708  010005bb  0f 87 01     bn.sh_1           0x0(r7),r28
00770b  010005be  5c 8d 04     bn.exthz          r4, r13
00770e  010005c1  c8 e5 12 18  bg.ori            r7, r5, 0x1218
007712  010005c5  0c 87 01     bn.sh_1           0x0(r7),r4
007715  010005c8  4c cd 81     bn.srli           r6, r13, 0x10
007718  010005cb  c8 e5 12 1c  bg.ori            r7, r5, 0x121c
00771c  010005cf  0c c7 01     bn.sh_1           0x0(r7),r6
00771f  010005d2  c8 c5 12 20  bg.ori            r6, r5, 0x1220
007723  010005d6  fc e0 38 00  bg.addi           r7, r0, 0x3800
007727  010005da  0c e6 01     bn.sh_1           0x0(r6),r7
00772a  010005dd  c8 e5 12 24  bg.ori            r7, r5, 0x1224
00772e  010005e1  0c 07 01     bn.sh_1           0x0(r7),r0
007731  010005e4  c8 e5 12 0c  bg.ori            r7, r5, 0x120c
007735  010005e8  18 07 00     bn.sbz            0x0(r7),r0
007738  010005eb  c8 c5 12 08  bg.ori            r6, r5, 0x1208
00773c  010005ef  fc e0 40 45  bg.addi           r7, r0, 0x4045
007740  010005f3  0c e6 01     bn.sh_1           0x0(r6),r7
007743  010005f6  c8 c5 12 00  bg.ori            r6, r5, 0x1200
007747  010005fa  98 e1        bt.movi           r7, 0x1
007749  010005fc  18 e6 00     bn.sbz            0x0(r6),r7
00774c  010005ff  88 d7        bt.mov            r6, r23
00774e  01000601  10 e6 00     bn.lbz            r7,0x0(r6)
007751  01000604  54 e7 08     bn.andi           r7, r7, 0x8
007754  01000607  20 e3 e8     bn.beqi           r7,0x0,0x1000601
007757  0100060a  c0 b4 04 01  bg.movhi          r5, 0xa020
00775b  0100060e  c8 c5 12 04  bg.ori            r6, r5, 0x1204
00775f  01000612  10 e6 00     bn.lbz            r7,0x0(r6)
007762  01000615  54 e7 01     bn.andi           r7, r7, 0x1
007765  01000618  20 e3 ea     bn.bnei           r7,0x0,0x1000612
007768  0100061b  fc f8 38 00  bg.addi           r7, r24, 0x3800
00776c  0100061f  5c e7 04     bn.exthz          r7, r7
00776f  01000622  c8 c5 12 10  bg.ori            r6, r5, 0x1210
007773  01000626  0c e6 01     bn.sh_1           0x0(r6),r7
007776  01000629  fc f9 38 00  bg.addi           r7, r25, 0x3800
00777a  0100062d  4c e7 81     bn.srli           r7, r7, 0x10
00777d  01000630  c8 c5 12 14  bg.ori            r6, r5, 0x1214
007781  01000634  0c e6 01     bn.sh_1           0x0(r6),r7
007784  01000637  c8 e5 12 18  bg.ori            r7, r5, 0x1218
007788  0100063b  0c 07 01     bn.sh_1           0x0(r7),r0
00778b  0100063e  c8 c5 12 1c  bg.ori            r6, r5, 0x121c
00778f  01000642  fc e0 01 10  bg.addi           r7, r0, 0x110
007793  01000646  0c e6 01     bn.sh_1           0x0(r6),r7
007796  01000649  40 fa 25     bn.sub            r7, r26, r4
007799  0100064c  fc e7 c8 0f  bg.addi           r7, r7, -0x37f1
00779d  01000650  c8 c0 ff f0  bg.ori            r6, r0, 0xfff0
0077a1  01000654  44 e7 34     bn.and            r7, r7, r6
0077a4  01000657  c8 c5 12 20  bg.ori            r6, r5, 0x1220
0077a8  0100065b  0c e6 01     bn.sh_1           0x0(r6),r7
0077ab  0100065e  40 fa 6d     bn.sub            r7, r26, r13
0077ae  01000661  fc e7 c8 0f  bg.addi           r7, r7, -0x37f1
0077b2  01000665  4c e7 81     bn.srli           r7, r7, 0x10
0077b5  01000668  c8 c5 12 24  bg.ori            r6, r5, 0x1224
0077b9  0100066c  0c e6 01     bn.sh_1           0x0(r6),r7
0077bc  0100066f  c8 e5 12 0c  bg.ori            r7, r5, 0x120c
0077c0  01000673  18 07 00     bn.sbz            0x0(r7),r0
0077c3  01000676  c8 c5 12 08  bg.ori            r6, r5, 0x1208
0077c7  0100067a  fc e0 40 45  bg.addi           r7, r0, 0x4045
0077cb  0100067e  0c e6 01     bn.sh_1           0x0(r6),r7
0077ce  01000681  c8 c5 12 00  bg.ori            r6, r5, 0x1200
0077d2  01000685  98 e1        bt.movi           r7, 0x1
0077d4  01000687  18 e6 00     bn.sbz            0x0(r6),r7
0077d7  0100068a  c0 f4 04 01  bg.movhi          r7, 0xa020
0077db  0100068e  c8 c7 12 04  bg.ori            r6, r7, 0x1204
0077df  01000692  10 e6 00     bn.lbz            r7,0x0(r6)
0077e2  01000695  54 e7 08     bn.andi           r7, r7, 0x8
0077e5  01000698  20 e3 e8     bn.beqi           r7,0x0,0x1000692
0077e8  0100069b  f0 ed 11 4d  bg.lbz            r7, 0x114d(r13)
0077ec  0100069f  4c e7 40     bn.slli           r7, r7, 0x8
0077ef  010006a2  f0 cd 11 4c  bg.lbz            r6, 0x114c(r13)
0077f3  010006a6  44 e7 35     bn.or             r7, r7, r6
0077f6  010006a9  4c e7 40     bn.slli           r7, r7, 0x8
0077f9  010006ac  f0 cd 11 4b  bg.lbz            r6, 0x114b(r13)
0077fd  010006b0  44 e7 35     bn.or             r7, r7, r6
007800  010006b3  4c e7 40     bn.slli           r7, r7, 0x8
007803  010006b6  f0 cd 11 4a  bg.lbz            r6, 0x114a(r13)
007807  010006ba  44 e7 35     bn.or             r7, r7, r6
00780a  010006bd  1d 87 fa     bn.addi           r12, r7, -0x6
00780d  010006c0  04 c1 0f     bn.movhi_2        r6, 0x10f
007810  010006c3  c8 c6 c7 fd  bg.ori            r6, r6, 0xc7fd
007814  010006c7  8c e6        bt.add            r7, r6
007816  010006c9  11 47 00     bn.lbz            r10,0x0(r7)
007819  010006cc  4d 4a 40     bn.slli           r10, r10, 0x8
00781c  010006cf  9c ff        bt.addi           r7, -0x1
00781e  010006d1  10 c7 00     bn.lbz            r6,0x0(r7)
007821  010006d4  45 4a 35     bn.or             r10, r10, r6
007824  010006d7  4d 4a 40     bn.slli           r10, r10, 0x8
007827  010006da  9c ff        bt.addi           r7, -0x1
007829  010006dc  10 c7 00     bn.lbz            r6,0x0(r7)
00782c  010006df  45 4a 35     bn.or             r10, r10, r6
00782f  010006e2  4d 4a 40     bn.slli           r10, r10, 0x8
007832  010006e5  9c ff        bt.addi           r7, -0x1
007834  010006e7  11 67 00     bn.lbz            r11,0x0(r7)
007837  010006ea  04 62 10     bn.movhi_2        r3, 0x210
00783a  010006ed  04 80 a0     bn.movhi_2        r4, 0xa0
00783d  010006f0  e7 ff f5 20  bg.jal            0x1000180
007841  010006f4  04 61 10     bn.movhi_2        r3, 0x110
007844  010006f7  fc 8d 38 00  bg.addi           r4, r13, 0x3800
007848  010006fb  88 ac        bt.mov            r5, r12
00784a  010006fd  44 ca 5d     bn.or             r6, r10, r11
00784d  01000700  1c e1 04     bn.addi           r7, r1, 0x4
007850  01000703  e7 ff f7 d8  bg.jal            0x10002ef
007854  01000707  91 84        bt.j              0x100088b
```

## Application handoff call

```text
0079d8  0100088b  e7 ff f2 5a  bg.jal            0x10001b8
0079dc  0100088f  90 00        bt.j              0x100088f
0079de  01000891  40 e4 bd     bn.sub            r7, r4, r23
0079e1  01000894  40 b8 bd     bn.sub            r5, r24, r23
0079e4  01000897  43 07 ec     bn.add            r24, r7, r29
0079e7  0100089a  92 6f        bt.j              0x1000709
```

## Application jump to 0x200100

```text
007305  010001b8  c0 f4 04 01  bg.movhi          r7, 0xa020
007309  010001bc  c8 e7 1f 68  bg.ori            r7, r7, 0x1f68
00730d  010001c0  50 c0 20     bn.ori            r6, r0, 0x20
007310  010001c3  0c c7 01     bn.sh_1           0x0(r7),r6
007313  010001c6  88 c7        bt.mov            r6, r7
007315  010001c8  08 e6 01     bn.lh             r7,0x0(r6)
007318  010001cb  5c e4 09     bn.sfnei          r7, 0x20
00731b  010001ce  23 ff e9     bn.bf             0x10001c8
00731e  010001d1  04 e0 20     bn.movhi_2        r7, 0x20
007321  010001d4  c8 e7 01 00  bg.ori            r7, r7, 0x100
007325  010001d8  f4 00 00 05  bg.syncwritebuffer
007329  010001dc  84 e9        bt.jr             r7
00732b  010001de  f4 00 00 05  bg.syncwritebuffer
00732f  010001e2  90 00        bt.j              0x10001e2
```
