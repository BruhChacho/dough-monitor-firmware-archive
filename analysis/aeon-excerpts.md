# ES07DC9 v101 rev1148: AEON excerpts

Input SHA256: 0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9
Expanded SHA256: eb33d20fec6006b092ab951bf1d194109c8d88fa53785ce45af77118d84c29bc
Candidate load base: 0x200000; addresses below = expanded offset + base.
AEON definition is incomplete. These are static decoder results, not execution traces.

## startup

```text
00200100  50 60 01     bn.ori             r3, r0, 0x1
00200103  c0 60 01 1d  bg.mtspr           r0, r3, 0x11
00200107  c0 f4 04 01  bg.movhi           r7, 0xa020
0020010b  c8 c7 1e 00  bg.ori             r6, r7, 0x1e00
0020010f  c8 a0 f0 00  bg.ori             r5, r0, 0xf000
00200113  ec a6 01 40  bg.sw_0            0x140(r6),r5,
00200117  c8 a0 b0 00  bg.ori             r5, r0, 0xb000
0020011b  ec a6 01 38  bg.sw_0            0x138(r6),r5,
0020011f  c8 a0 e0 00  bg.ori             r5, r0, 0xe000
00200123  ec a6 01 54  bg.sw_0            0x154(r6),r5,
00200127  50 a0 17     bn.ori             r5, r0, 0x17
0020012a  ec a6 01 60  bg.sw_0            0x160(r6),r5,
0020012e  80 01        bt.nop             0x0
00200130  c8 a0 c0 00  bg.ori             r5, r0, 0xc000
00200134  ec a6 01 58  bg.sw_0            0x158(r6),r5,
00200138  c8 a0 c0 00  bg.ori             r5, r0, 0xc000
0020013c  ec a6 01 20  bg.sw_0            0x120(r6),r5,
00200140  1c 60 00     bn.addi            r3, r0, 0x0
00200143  c8 80 20 00  bg.ori             r4, r0, 0x2000
00200147  c8 a0 20 02  bg.ori             r5, r0, 0x2002
0020014b  c0 65 00 0d  bg.mtspr           r5, r3, 0x0
0020014f  5c 64 0d     bn.sfne            r3, r4
00200152  1c 63 20     bn.addi            r3, r3, 0x20
00200155  23 ff c9     bn.bf              0x200147
00200158  50 a0 11     bn.ori             r5, r0, 0x11
0020015b  c0 65 00 0f  bg.mfspr           r3, r5, 0x0
0020015f  50 63 10     bn.ori             r3, r3, 0x10
00200162  c0 65 00 0d  bg.mtspr           r5, r3, 0x0
00200166  80 01        bt.nop             0x0
00200168  80 01        bt.nop             0x0
0020016a  80 01        bt.nop             0x0
0020016c  80 01        bt.nop             0x0
0020016e  80 01        bt.nop             0x0
00200170  1c 60 00     bn.addi            r3, r0, 0x0
00200173  fc 80 07 f0  bg.addi            r4, r0, 0x7f0
00200177  f4 03 00 07  bg.invalidate_line 0x0(r3), 0x0
0020017b  f4 03 00 17  bg.invalidate_line 0x0(r3), 0x1
0020017f  f4 03 00 27  bg.invalidate_line 0x0(r3), 0x2
00200183  f4 03 00 37  bg.invalidate_line 0x0(r3), 0x3
00200187  5c 64 0d     bn.sfne            r3, r4
0020018a  1c 63 10     bn.addi            r3, r3, 0x10
0020018d  23 ff a9     bn.bf              0x200177
00200190  c0 60 01 1f  bg.mfspr           r3, r0, 0x11
00200194  50 63 08     bn.ori             r3, r3, 0x8
00200197  c0 60 01 1d  bg.mtspr           r0, r3, 0x11
0020019b  c0 60 08 a1  bg.movhi           r3, 0x45
0020019f  c8 63 3e c0  bg.ori             r3, r3, 0x3ec0
002001a3  c0 80 09 01  bg.movhi           r4, 0x48
002001a7  c8 84 e2 c0  bg.ori             r4, r4, 0xe2c0
002001ab  5c 83 17     bn.sfleu           r4, r3
002001ae  20 00 2d     bn.bf              0x2001b9
002001b1  0c 03 00     bn.sw              0x0(r3),r0
002001b4  1c 63 04     bn.addi            r3, r3, 0x4
002001b7  93 f4        bt.j               0x2001ab
002001b9  c0 36 00 01  bg.movhi           r1, 0xb000
002001bd  c8 21 0f fc  bg.ori             r1, r1, 0xffc
002001c1  1c 40 fd     bn.addi            r2, r0, -0x3
002001c4  e4 0e 0a e3  bg.j               0x270735
002001c8  44 21 14     bn.and             r1, r1, r2
```

## 41-byte table membership helper

```text
00204059  c0 e0 05 61  bg.movhi           r7, 0x2b
0020405d  fc e7 ed 7c  bg.addi            r7, r7, -0x1284
00204061  90 10        bt.j               0x204071
00204063  9c e1        bt.addi            r7, 0x1
00204065  c0 c0 05 61  bg.movhi           r6, 0x2b
00204069  fc c6 ed a5  bg.addi            r6, r6, -0x125b
0020406d  d4 e6 00 7a  bg.beq             r7,r6,0x20407c
00204071  10 c7 00     bn.lbz             r6,0x0(r7)
00204074  d4 66 ff 7e  bg.bne             r3,r6,0x204063
00204078  98 61        bt.movi            r3, 0x1
0020407a  85 29        bt.jr              r9
0020407c  98 60        bt.movi            r3, 0x0
0020407e  85 29        bt.jr              r9
```

## Referenced table

Expanded offset 0xaed7c; candidate address 0x2aed7c:

```text
40 32 33 39 42 44 50 51 60 71 80 84 86 98 99 41 52 53 9a 9b 9c 5a 5b 5c 5d 5e 5f 59 57 58 9d 9e 94 95 96 97 90 91 92 93 56
```
