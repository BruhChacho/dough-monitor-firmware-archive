# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2442ef,0x24490d); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x100
    bg.sw_0 0xfc(r1), r9
    bg.sw_0 0xf8(r1), r10
    bg.sw_0 0xf4(r1), r11
    bg.sw_0 0xf0(r1), r12
    bg.sw_0 0xec(r1), r13
    bg.sw_0 0xe8(r1), r14
    bg.sw_0 0xe4(r1), r15
    bg.sw_0 0xe0(r1), r16
    bg.sw_0 0xdc(r1), r17
    bg.sw_0 0xd8(r1), r18
    bg.sw_0 0xd4(r1), r19
    bg.sw_0 0xd0(r1), r20
    bg.sw_0 0xcc(r1), r21
    bg.sw_0 0xc8(r1), r22
    bt.mov r17, r3
    bt.mov r12, r4
    bt.mov r15, r5
    bt.mov r11, r6
    bg.movhi r13, 0x45
    bg.lwz r7, 0x5230(r13)
    bn.beqi r7, 0x1, loc_244386
loc_24433e:
    bt.mov r3, r17
    bt.mov r4, r12
    bt.mov r5, r15
    bt.mov r6, r11
    bg.lwz r22, 0xc8(r1)
    bg.lwz r21, 0xcc(r1)
    bg.lwz r20, 0xd0(r1)
    bg.lwz r19, 0xd4(r1)
    bg.lwz r18, 0xd8(r1)
    bg.lwz r17, 0xdc(r1)
    bg.lwz r16, 0xe0(r1)
    bg.lwz r15, 0xe4(r1)
    bg.lwz r14, 0xe8(r1)
    bg.lwz r13, 0xec(r1)
    bg.lwz r12, 0xf0(r1)
    bg.lwz r11, 0xf4(r1)
    bg.lwz r10, 0xf8(r1)
    bg.lwz r9, 0xfc(r1)
    bg.addi r1, r1, 0x100
    bg.j 0x2440d9
loc_244386:
    bt.mov r3, r1
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r7, 0x0(r1)
    bn.bnei r7, 0x1, loc_24433e
    bg.beqi r15, 0x0, loc_2446e2
    bg.beqi r11, 0x0, loc_2446e2
    bt.movi r19, 0x0
    bn.addi r21, r1, 0x28
    bn.addi r20, r1, 0x50
    bt.j loc_2443bc
loc_2443a6:
    bg.lwz r7, 0x5230(r13)
    bn.beqi r7, 0x1, loc_2443fb
loc_2443ad:
    bg.jal 0x242adc
    bn.sub r11, r11, r14
    bg.beqi r11, 0x0, loc_2446e2
    bt.add r12, r14
    bt.add r19, r14
loc_2443bc:
    bt.mov r3, r21
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r6, 0x30(r1)
    bn.divu r7, r12, r6
    bn.muls r7, r7, r6
    bn.sub r10, r12, r7
    bt.mov r3, r20
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.add r6, r10, r11
    bt.mov r14, r11
    bn.lwz r7, 0x58(r1)
    bg.bgt r7, r6, loc_2443a6
    bn.addi r3, r1, 0x78
    bt.movi r4, 0x1
    bg.jal 0x242968
    bg.lwz r7, 0x80(r1)
    bn.sub r14, r7, r10
    bg.lwz r7, 0x5230(r13)
    bn.bnei r7, 0x1, loc_2443ad
loc_2443fb:
    bg.addi r3, r1, 0xa0
    bt.movi r4, 0x1
    bg.jal 0x242968
    bg.lwz r7, 0xa0(r1)
    bn.bnei r7, 0x1, loc_2443ad
    bt.mov r3, r12
    bg.jal 0x243b38
    bg.movhi r7, 0x45
    bg.lwz r7, 0x5230(r7)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1380
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r6, r7
    bg.movhi r10, 0x45
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bt.movi r7, 0x6
    bn.sbz 0x0(r6), r7
    bt.movi r3, 0x2
    bt.mov r4, r12
    bg.jal 0x2429c3
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x2
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1384
    bg.ori r7, r0, 0x1b84
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bn.srli r7, r3, 0x8
    bn.andi r7, r7, 0x1f
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1385
    bg.ori r7, r0, 0x1b85
    bn.cmov_0 r6, r6, r7
    bn.add r22, r15, r19
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bn.extbz r3, r3
    bn.sbz 0x0(r6), r3
    bt.movi r18, 0x0
    bn.ori r5, r0, 0x31
    bn.beqi r14, 0x0, loc_2444e9
    bt.mov r23, r22
    bt.movi r6, 0x4
loc_2444aa:
    bn.extbz r4, r6
    bg.lwz r7, 0x5230(r13)
    bg.addi r6, r4, 0x9c0
    bn.slli r5, r6, 0x1
    bg.beqi r7, 0x1, loc_244903
loc_2444bc:
    bn.andi r7, r6, 0x1
    bn.sub r7, r5, r7
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.lbz r6, 0x0(r23)
    bn.sbz 0x0(r7), r6
    bt.addi r18, 0x1
    bt.addi r23, 0x1
    bg.ble r14, r18, loc_2444e0
    bn.addi r6, r18, 0x4
    bn.extbz r7, r6
    bg.bleui r7, 0x9, loc_2444aa
loc_2444e0:
    bn.slli r7, r18, 0x4
    bn.addi r7, r7, 0x31
    bn.extbz r5, r7
loc_2444e9:
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.addi r6, r0, -0x80
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bg.jal 0x242adc
    bg.lwz r7, 0x5230(r13)
    bg.bnei r7, 0x0, loc_2448f6
    bg.ori r3, r0, 0xa14
    bt.movi r4, 0x1
    bg.jal 0x23ddb9
loc_2445c3:
    bg.bgt r14, r18, loc_2446c2
    bt.j loc_244720
loc_2445c9:
    bn.andi r7, r6, 0x1
    bn.sub r7, r4, r7
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.lbz r6, 0x0(r23)
    bn.sbz 0x0(r7), r6
    bt.addi r18, 0x1
    bn.sfleu r14, r18
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r16, r7
    bt.addi r5, 0x1
    bt.addi r23, 0x1
    bn.beqi r16, 0x0, loc_2445f7
    bn.addi r7, r24, 0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x9, loc_2446c7
loc_2445f7:
    bn.extbz r5, r5
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x13b4
    bg.ori r7, r0, 0x1bb4
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bg.jal 0x242adc
    bn.beqi r16, 0x0, loc_244720
loc_2446c2:
    bn.add r23, r18, r22
    bt.movi r5, 0x0
loc_2446c7:
    bn.extbz r24, r5
    bg.lwz r7, 0x5230(r13)
    bg.addi r6, r24, 0x9c0
    bn.slli r4, r6, 0x1
    bg.bnei r7, 0x1, loc_2445c9
    bg.addi r6, r24, 0xdc0
    bn.slli r4, r6, 0x1
    bt.j loc_2445c9
loc_2446e2:
    bg.lwz r22, 0xc8(r1)
    bg.lwz r21, 0xcc(r1)
    bg.lwz r20, 0xd0(r1)
    bg.lwz r19, 0xd4(r1)
    bg.lwz r18, 0xd8(r1)
    bg.lwz r17, 0xdc(r1)
    bg.lwz r16, 0xe0(r1)
    bg.lwz r15, 0xe4(r1)
    bg.lwz r14, 0xe8(r1)
    bg.lwz r13, 0xec(r1)
    bg.lwz r12, 0xf0(r1)
    bg.lwz r11, 0xf4(r1)
    bg.lwz r10, 0xf8(r1)
    bg.lwz r9, 0xfc(r1)
    bg.addi r1, r1, 0x100
    bt.jr r9
loc_244720:
    bg.lwz r7, 0x5230(r13)
    bg.bnei r7, 0x0, loc_2448ea
    bg.ori r3, r0, 0xa14
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
loc_244732:
    bn.ori r3, r0, 0x10
    bt.mov r4, r12
    bg.jal 0x2429c3
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1380
    bg.ori r6, r0, 0x1b80
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.ori r5, r0, 0x10
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1381
    bg.ori r7, r0, 0x1b81
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bn.srli r7, r3, 0x10
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1384
    bg.ori r7, r0, 0x1b84
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bn.srli r7, r3, 0x8
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1385
    bg.ori r6, r0, 0x1b85
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.extbz r3, r3
    bn.sbz 0x0(r7), r3
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1388
    bg.ori r6, r0, 0x1b88
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0xf
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1389
    bg.ori r6, r0, 0x1b89
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.addi r6, r0, -0x40
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.addi r6, r0, -0x78
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.ori r6, r0, 0x24
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r13)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bg.jal 0x242adc
    bg.ori r10, r0, 0xffff
    bt.j loc_2448d5
loc_2448c5:
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bg.ori r7, r0, 0xffff
    bn.sfne r10, r7
    bn.bnf loc_2448df
loc_2448d5:
    bg.jal 0x242f90
    bn.andi r3, r3, 0x1
    bn.bnei r3, 0x0, loc_2448c5
loc_2448df:
    bg.beqi r17, 0x0, loc_2443ad
    bg.jal 0x243a16
    bn.j loc_2443ad
loc_2448ea:
    bg.ori r3, r0, 0xe14
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bt.j loc_244732
loc_2448f6:
    bg.ori r3, r0, 0xe14
    bt.movi r4, 0x1
    bg.jal 0x23ddb9
    bn.j loc_2445c3
loc_244903:
    bg.addi r6, r4, 0xdc0
    bn.slli r5, r6, 0x1
    bn.j loc_2444bc
