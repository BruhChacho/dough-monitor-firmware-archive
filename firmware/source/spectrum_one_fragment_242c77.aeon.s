# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x242c77,0x242f90); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522e(r7)
    bn.sfnei r7, 0x22
    bn.bnf loc_242e26
    bg.ori r3, r0, 0x426
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.ori r3, r0, 0x428
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bg.movhi r23, 0x45
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1380
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r6, r7
    bg.movhi r4, 0x45
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bn.ori r7, r0, 0x26
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1381
    bg.ori r7, r0, 0x1b81
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bn.srli r7, r10, 0x10
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1384
    bg.ori r7, r0, 0x1b84
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bn.srli r7, r10, 0x8
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1385
    bg.ori r6, r0, 0x1b85
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.extbz r6, r10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1388
    bg.ori r6, r0, 0x1b88
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x5
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.addi r6, r0, -0x58
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r6, r0, 0x14
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r6, r0, 0x10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
loc_242dfd:
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x242adc
loc_242e26:
    bg.movhi r23, 0x45
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1380
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r6, r7
    bg.movhi r4, 0x45
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bt.movi r7, 0x6
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r6, r0, 0x26
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1384
    bg.ori r7, r0, 0x1b84
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bn.srli r7, r3, 0x10
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1385
    bg.ori r7, r0, 0x1b85
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r4)
    bt.add r6, r7
    bn.srli r7, r3, 0x8
    bn.andi r7, r7, 0xf0
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1388
    bg.ori r6, r0, 0x1b88
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1389
    bg.ori r6, r0, 0x1b89
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x5
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r6, -0x10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.ori r6, r0, 0x41
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bt.movi r5, 0x1
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r23)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r4)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bt.j loc_242dfd
