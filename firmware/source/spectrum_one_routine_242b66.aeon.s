# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x242b66,0x242c77); byte-exact only; hardware untested.
    bg.movhi r4, 0x45
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1380
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r6, r7
    bg.movhi r5, 0x45
    bg.lwz r7, 0x3cf0(r5)
    bt.add r6, r7
    bn.ori r7, r0, 0x24
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bt.movi r6, 0x5
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bn.addi r6, r0, -0x58
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bn.ori r6, r0, 0x11
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bn.ori r6, r0, 0x10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r4)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bg.j 0x242adc
