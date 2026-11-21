# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252fe9,0x25347a); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x50
    bn.sw 0x4c(r1), r9
    bn.sw 0x48(r1), r10
    bn.sw 0x44(r1), r11
    bn.sw 0x40(r1), r12
    bn.sw 0x3c(r1), r13
    bn.sw 0x38(r1), r14
    bn.sw 0x34(r1), r15
    bn.sw 0x30(r1), r16
    bn.sw 0x2c(r1), r17
    bn.sw 0x28(r1), r18
    bn.sw 0x24(r1), r19
    bn.sw 0x20(r1), r20
    bn.sw 0x1c(r1), r21
    bn.sw 0x18(r1), r22
    bt.mov r13, r3
    bt.mov r15, r4
    bn.sw 0x10(r1), r5
    bn.sw 0xc(r1), r6
    bn.sw 0x8(r1), r7
    bt.mov r19, r8
    bn.lh r5, 0x50(r1)
    bn.sw 0x4(r1), r5
    bg.movhi r21, 0x45
    bg.lhz r7, 0x7644(r21)
    bn.andi r7, r7, 0x2
    bg.bnei r7, 0x0, loc_25346b
loc_25303a:
    bg.ori r7, r0, 0x3e8
    bn.lwz r6, 0x4(r1)
    bn.muls r7, r6, r7
    bn.sw 0x14(r1), r7
    bt.movi r22, 0x0
    bt.movi r18, 0x0
    bn.exthz r20, r18
    bt.mov r3, r13
    bt.mov r4, r15
    bg.jal 0x252d93
    bg.ble r3, r20, loc_25318c
loc_25305a:
    bn.extbz r12, r18
    bg.ori r10, r0, 0x7d0
    bn.beqi r19, 0x0, loc_25306a
    bn.lwz r7, 0x14(r1)
    bn.divu r10, r7, r19
loc_25306a:
    bt.mov r3, r13
    bt.mov r4, r15
    bt.mov r5, r12
    bg.jal 0x252d17
    bt.mov r14, r3
    bg.lhz r7, 0x7644(r21)
    bn.andi r7, r7, 0x2
    bg.bnei r7, 0x0, loc_2532ac
loc_253081:
    bt.movi r16, 0x0
    bn.lwz r5, 0x10(r1)
    bg.beqi r5, 0x0, loc_253222
    bt.movi r16, 0x1
    bn.lwz r6, 0xc(r1)
    bg.beqi r6, 0x0, loc_2532c6
    bt.mov r3, r13
    bt.mov r4, r15
    bt.movi r5, 0x0
    bt.mov r6, r12
    bg.jal 0x252d4f
    bt.mov r11, r3
loc_2530a1:
    bg.sfeqi r11, 0xff
    bn.bf loc_253222
    bg.lhz r7, 0x7644(r21)
    bn.andi r7, r7, 0x2
    bg.bnei r7, 0x0, loc_253393
loc_2530b3:
    bn.sfnei r14, 0x33
    bn.bnf loc_25329a
loc_2530b9:
    bt.movi r6, 0x1
    bn.xor r7, r15, r6
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r17, r7, 0x1f
    bn.beqi r16, 0x0, loc_2530cc
    bn.bnei r17, 0x0, loc_2530fc
loc_2530cc:
    bn.xor r7, r13, r6
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r6, r7, 0x1f
    bn.slli r7, r13, 0x4
    bg.movhi r5, 0x49
    bg.addi r5, r5, -0x58dc
    bt.add r7, r5
    bn.lbz r7, 0x0(r7)
    bn.bnei r7, 0x0, loc_2530fc
    bn.bnei r6, 0x0, loc_2530fc
    bn.bnei r13, 0x0, loc_253129
    bg.movhi r7, 0x3b
    bg.lbz r7, 0x745c(r7)
    bg.bnei r7, 0x0, loc_25321a
loc_2530fc:
    bt.mov r3, r13
    bt.mov r4, r15
    bt.mov r5, r12
    bg.jal 0x252d17
    bn.sfeqi r3, 0x33
    bn.bf loc_2531ff
    bt.mov r3, r13
    bt.mov r4, r15
    bt.mov r5, r12
    bg.jal 0x252d17
    bn.sfeqi r3, 0x33
    bn.bf loc_2531ff
    bt.movi r7, 0x1
    bn.xor r7, r13, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r6, r7, 0x1f
loc_253129:
    bn.addi r7, r14, -0x45
    bn.exthz r7, r7
    bn.sfgtui r7, 0x1
    bn.cmovsi_2 r7, r0, 0x1
    bn.and r12, r6, r7
    bt.mov r10, r13
    bt.movi r16, 0x0
    bg.bnei r12, 0x0, loc_2533c2
loc_253140:
    bn.sfnei r14, 0x33
    bn.cmov_0 r11, r11, r0
    bt.mov r3, r10
    bt.mov r4, r11
    bt.mov r5, r14
    bg.jal 0x252e20
    bn.bnei r10, 0x0, loc_25315f
    bn.sfeqi r14, 0x43
    bn.bf loc_253385
    bn.sfeqi r14, 0x44
    bn.bf loc_2531f1
loc_25315f:
    bn.bnei r12, 0x0, loc_2531c3
loc_253162:
    bn.beqi r17, 0x0, loc_2531e1
loc_253165:
    bt.movi r7, 0x2
    bn.xor r7, r11, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r3, r7, 0x1f
loc_253172:
    bn.sll r7, r3, r20
    bn.or r7, r7, r22
    bn.extbz r22, r7
    bt.addi r18, 0x1
    bn.exthz r20, r18
    bt.mov r3, r13
    bt.mov r4, r15
    bg.jal 0x252d93
    bg.bgt r3, r20, loc_25305a
loc_25318c:
    bn.bnei r15, 0x1, loc_253192
    bn.andi r22, r22, 0x1
loc_253192:
    bt.mov r3, r22
    bn.lwz r22, 0x18(r1)
    bn.lwz r21, 0x1c(r1)
    bn.lwz r20, 0x20(r1)
    bn.lwz r19, 0x24(r1)
    bn.lwz r18, 0x28(r1)
    bn.lwz r17, 0x2c(r1)
    bn.lwz r16, 0x30(r1)
    bn.lwz r15, 0x34(r1)
    bn.lwz r14, 0x38(r1)
    bn.lwz r13, 0x3c(r1)
    bn.lwz r12, 0x40(r1)
    bn.lwz r11, 0x44(r1)
    bn.lwz r10, 0x48(r1)
    bn.lwz r9, 0x4c(r1)
    bn.addi r1, r1, 0x50
    bt.jr r9
loc_2531c3:
    bg.movhi r7, 0x3b
    bg.lwz r3, 0x7430(r7)
    bg.movhi r5, 0x2380
    bn.ori r5, r5, 0x16
    bt.add r3, r5
    bt.mov r4, r16
    bg.ori r5, r0, 0xffff
    bg.jal 0x23e152
    bn.bnei r17, 0x0, loc_253165
loc_2531e1:
    bt.movi r7, 0x1
    bn.xor r7, r11, r7
    bn.ff1 r7, r7
    bn.sub r7, r0, r7
    bn.srli r3, r7, 0x1f
    bt.j loc_253172
loc_2531f1:
    bg.movhi r7, 0x3b
    bg.sw_1 0x7460(r7), r11
    bg.beqi r12, 0x0, loc_253162
    bt.j loc_2531c3
loc_2531ff:
    bg.lhz r7, 0x7644(r21)
    bn.andi r7, r7, 0x2
    bn.ori r14, r0, 0x33
    bt.movi r11, 0x0
    bn.beqi r7, 0x0, loc_25321a
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x37c3
    bg.jal 0x2a93a3
loc_25321a:
    bt.movi r16, 0x0
    bt.movi r10, 0x0
    bt.movi r12, 0x0
    bt.j loc_253140
loc_253222:
    bg.sfleui r10, 0x3e8
    bn.bnf loc_253334
    bn.lwz r7, 0x8(r1)
    bg.beqi r7, 0x0, loc_2532d7
    bn.ori r11, r0, 0x16
    bg.sfnei r10, 0x3e8
    bn.bnf loc_25324e
    bn.ori r11, r0, 0x14
    bg.sfleui r10, 0x383
    bn.bnf loc_25324e
    bn.ori r11, r0, 0x12
    bg.sfleui r10, 0x31f
    bn.bf loc_253406
loc_25324e:
    bg.movhi r10, 0x45
    bg.lhz r7, 0x7644(r21)
    bn.andi r7, r7, 0x2
    bg.bnei r7, 0x0, loc_253375
loc_25325d:
    bt.movi r3, 0x1
    bg.sfnei r11, 0xff
    bn.bnf loc_253172
    bt.mov r3, r13
    bt.mov r4, r15
    bt.mov r5, r11
    bt.mov r6, r12
    bg.jal 0x252d4f
    bt.mov r11, r3
    bg.sfnei r3, 0xff
    bn.bnf loc_253445
    bg.lhz r7, 0x7644(r10)
    bn.andi r7, r7, 0x2
    bg.beqi r7, 0x0, loc_2530b3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x37d1
    bt.mov r4, r11
    bg.jal 0x2a9310
    bn.sfnei r14, 0x33
    bn.bf loc_2530b9
loc_25329a:
    bg.bnei r13, 0x0, loc_2530b9
    bg.bnei r11, 0x0, loc_2533f9
    bg.movhi r7, 0x45
    bg.sbz 0x7658(r7), r0
    bt.j loc_2530b9
loc_2532ac:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3878
    bt.mov r4, r12
    bt.mov r5, r14
    bt.mov r6, r19
    bn.lwz r7, 0x4(r1)
    bt.mov r8, r10
    bg.jal 0x2a9310
    bn.j loc_253081
loc_2532c6:
    bt.mov r3, r13
    bt.mov r4, r15
    bt.movi r5, 0x1
    bt.mov r6, r12
    bg.jal 0x252d4f
    bt.mov r11, r3
    bn.j loc_2530a1
loc_2532d7:
    bn.ori r11, r0, 0x17
    bg.sfnei r10, 0x3e8
    bn.bnf loc_25324e
    bn.ori r11, r0, 0x15
    bg.sfleui r10, 0x383
    bn.bnf loc_25324e
    bn.ori r11, r0, 0x13
    bg.sfleui r10, 0x31f
    bn.bnf loc_25324e
    bn.ori r11, r0, 0x11
    bg.sfleui r10, 0x2bb
    bn.bnf loc_25324e
    bt.movi r11, 0xf
    bg.sfleui r10, 0x257
    bn.bnf loc_25324e
    bt.movi r11, 0xd
    bg.sfleui r10, 0x1f3
    bn.bnf loc_25324e
    bt.movi r11, 0xb
    bg.sfleui r10, 0x18f
    bn.bnf loc_25324e
    bt.movi r11, 0x9
    bg.sfleui r10, 0x12b
    bn.bnf loc_25324e
    bt.movi r11, 0x7
    bg.sfleui r10, 0xc7
    bn.bnf loc_25324e
    bn.sfleui r10, 0x63
    bn.cmovi r11, 0x3, 0x5
    bt.j loc_25324e
loc_253334:
    bt.mov r3, r13
    bt.mov r4, r14
    bg.jal 0x252efc
    bt.mov r11, r3
    bg.lhz r7, 0x7644(r21)
    bn.andi r7, r7, 0x2
    bg.beqi r7, 0x0, loc_2530b3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x380f
    bg.jal 0x2a9310
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x2
    bg.beqi r7, 0x0, loc_2530b3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x37fd
    bt.mov r4, r11
    bg.jal 0x2a9310
    bn.j loc_2530b3
loc_253375:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x37ef
    bt.mov r4, r11
    bg.jal 0x2a9310
    bt.j loc_25325d
loc_253385:
    bg.movhi r7, 0x3b
    bg.sh 0x745c(r7), r11
    bg.beqi r12, 0x0, loc_253162
    bt.j loc_2531c3
loc_253393:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3841
    bn.lwz r4, 0xc(r1)
    bg.jal 0x2a9310
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x2
    bg.beqi r7, 0x0, loc_2530b3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x381d
    bt.mov r4, r11
    bg.jal 0x2a9310
    bn.j loc_2530b3
loc_2533c2:
    bg.movhi r6, 0x3b
    bg.lwz r3, 0x7430(r6)
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x16
    bt.add r3, r7
    bg.jal 0x23df85
    bt.mov r16, r3
    bg.movhi r5, 0x3b
    bg.lwz r3, 0x7430(r5)
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x16
    bt.add r3, r6
    bg.ori r4, r0, 0x303
    bg.ori r5, r0, 0xffff
    bg.jal 0x23e152
    bn.j loc_253140
loc_2533f9:
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x7658(r7), r6
    bn.j loc_2530b9
loc_253406:
    bn.ori r11, r0, 0x10
    bg.sfleui r10, 0x2bb
    bn.bnf loc_25324e
    bt.movi r11, 0xe
    bg.sfleui r10, 0x257
    bn.bnf loc_25324e
    bt.movi r11, 0xc
    bg.sfleui r10, 0x1f3
    bn.bnf loc_25324e
    bt.movi r11, 0xa
    bg.sfleui r10, 0x18f
    bn.bnf loc_25324e
    bt.movi r11, 0x8
    bg.sfleui r10, 0x12b
    bn.bnf loc_25324e
    bt.movi r11, 0x6
    bg.sfleui r10, 0xc7
    bn.bnf loc_25324e
    bn.sfleui r10, 0x63
    bn.cmovi r11, 0x2, 0x4
    bt.j loc_25324e
loc_253445:
    bt.mov r3, r13
    bt.mov r4, r14
    bg.jal 0x252efc
    bt.mov r11, r3
    bg.lhz r7, 0x7644(r10)
    bn.andi r7, r7, 0x2
    bg.beqi r7, 0x0, loc_2530b3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x37df
    bt.mov r4, r11
    bg.jal 0x2a9310
    bn.j loc_2530b3
loc_25346b:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x38a2
    bg.jal 0x2a9310
    bn.j loc_25303a
