# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x243142,0x243738); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x68
    bn.sw 0x64(r1), r9
    bn.sw 0x60(r1), r10
    bn.sw 0x5c(r1), r11
    bn.sw 0x58(r1), r12
    bn.sw 0x54(r1), r13
    bn.sw 0x50(r1), r14
    bn.sw 0x4c(r1), r15
    bn.sw 0x48(r1), r16
    bn.sw 0x44(r1), r17
    bn.sw 0x40(r1), r18
    bn.sw 0x3c(r1), r19
    bn.sw 0x38(r1), r20
    bn.sw 0x34(r1), r21
    bn.sw 0x30(r1), r22
    bt.mov r21, r3
    bg.movhi r22, 0x45
    bg.lwz r10, 0x5230(r22)
    bg.beqi r10, 0x1, loc_243318
loc_24317d:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3c43(r7)
    bg.sfnei r7, 0xbf
    bn.bnf loc_2432fb
    bn.sfnei r7, 0x37
    bn.bnf loc_243457
    bn.sfnei r10, 0x1
loc_243195:
    bg.ori r6, r0, 0x1380
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r6, r7
    bg.movhi r4, 0x45
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bt.movi r7, 0x6
loc_2431ac:
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r5, 0x1
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1384
    bg.ori r6, r0, 0x1b84
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r21
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1385
    bg.ori r6, r0, 0x1b85
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x5
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, -0x10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r6, r0, 0x21
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
loc_2432ad:
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bn.lwz r22, 0x30(r1)
    bn.lwz r21, 0x34(r1)
    bn.lwz r20, 0x38(r1)
    bn.lwz r19, 0x3c(r1)
    bn.lwz r18, 0x40(r1)
    bn.lwz r17, 0x44(r1)
    bn.lwz r16, 0x48(r1)
    bn.lwz r15, 0x4c(r1)
    bn.lwz r14, 0x50(r1)
    bn.lwz r13, 0x54(r1)
    bn.lwz r12, 0x58(r1)
    bn.lwz r11, 0x5c(r1)
    bn.lwz r10, 0x60(r1)
    bn.lwz r9, 0x64(r1)
    bn.addi r1, r1, 0x68
    bg.j 0x242adc
loc_2432fb:
    bn.sfnei r10, 0x1
    bg.ori r6, r0, 0x1380
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r6, r7
    bg.movhi r4, 0x45
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bn.ori r7, r0, 0x50
    bt.j loc_2431ac
loc_243318:
    bn.addi r3, r1, 0x8
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r7, 0x8(r1)
    bg.bnei r7, 0x1, loc_24317d
    bg.movhi r4, 0x45
    bg.lwz r6, 0x3cf0(r4)
    bn.ori r7, r0, 0x1f
    bg.sbz 0x1b80(r6), r7
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.addi r5, r0, -0x60
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1384
    bg.ori r6, r0, 0x1b84
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r21
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1385
    bg.ori r6, r0, 0x1b85
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0xf
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1388
    bg.ori r6, r0, 0x1b88
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.addi r6, r0, -0x78
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r6, r0, 0x23
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r6, r0, 0x10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bt.j loc_2432ad
loc_243457:
    bg.jal 0x242f90
    bn.andi r3, r3, 0x40
    bg.beqi r3, 0x0, loc_24372e
    bg.lwz r7, 0x5230(r22)
    bg.ori r18, r0, 0x1380
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r18, r7
    bg.movhi r4, 0x45
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bt.movi r7, 0x6
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r22)
    bg.ori r19, r0, 0x1381
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r19, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.addi r6, r0, -0x70
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bg.ori r17, r0, 0x1384
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1b84
    bn.cmov_0 r7, r17, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1385
    bg.ori r6, r0, 0x1b85
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r5, r0, 0x28
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1388
    bg.ori r6, r0, 0x1b88
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1389
    bg.ori r6, r0, 0x1b89
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r6, r0, 0x3b
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x138c
    bg.ori r6, r0, 0x1b8c
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x138d
    bg.ori r6, r0, 0x1b8d
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1390
    bg.ori r6, r0, 0x1b90
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, -0x1
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1391
    bg.ori r6, r0, 0x1b91
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x5
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bg.ori r16, r0, 0x13b0
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r16, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bg.ori r15, r0, 0x13b1
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r15, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, -0x10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bg.ori r14, r0, 0x13a8
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r14, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.addi r6, r0, -0x7f
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r22)
    bg.ori r13, r0, 0x13a9
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r13, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r10, 0x1
    bn.sbz 0x0(r7), r10
    bg.lwz r7, 0x5230(r22)
    bg.ori r12, r0, 0x13ac
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r12, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r22)
    bg.ori r11, r0, 0x13ad
    bg.ori r20, r0, 0x1bad
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r11, r20
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r10
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r10
    bn.sw 0x4(r1), r4
    bg.jal 0x242adc
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r18, r18, r7
    bn.lwz r4, 0x4(r1)
    bg.lwz r7, 0x3cf0(r4)
    bt.add r18, r7
    bn.sbz 0x0(r18), r10
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r19, r19, r6
    bg.lwz r7, 0x3cf0(r4)
    bt.add r19, r7
    bn.sbz 0x0(r19), r21
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1b84
    bn.cmov_0 r17, r17, r7
    bg.lwz r7, 0x3cf0(r4)
    bt.add r17, r7
    bt.movi r6, 0x5
    bn.sbz 0x0(r17), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1bb0
    bn.cmov_0 r16, r16, r7
    bg.lwz r7, 0x3cf0(r4)
    bt.add r16, r7
    bt.movi r6, 0x3
    bn.sbz 0x0(r16), r6
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1bb1
    bn.cmov_0 r15, r15, r7
    bg.lwz r7, 0x3cf0(r4)
    bt.add r15, r7
    bn.addi r7, r0, -0x58
    bn.sbz 0x0(r15), r7
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r14, r14, r6
    bg.lwz r7, 0x3cf0(r4)
    bt.add r14, r7
    bn.ori r7, r0, 0x12
    bn.sbz 0x0(r14), r7
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1ba9
    bn.cmov_0 r13, r13, r7
    bg.lwz r7, 0x3cf0(r4)
    bt.add r13, r7
    bn.sbz 0x0(r13), r0
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r12, r12, r6
    bg.lwz r7, 0x3cf0(r4)
    bt.add r12, r7
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r12), r7
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bn.cmov_0 r11, r11, r20
    bg.lwz r7, 0x3cf0(r4)
    bt.add r11, r7
    bn.sbz 0x0(r11), r0
    bn.j loc_2432ad
loc_24372e:
    bg.lwz r7, 0x5230(r22)
    bn.sfnei r7, 0x1
    bn.j loc_243195
