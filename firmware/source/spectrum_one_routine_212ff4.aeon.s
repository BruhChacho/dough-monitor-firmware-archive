# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x212ff4,0x213048); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bn.slli r3, r3, 0x8
    bn.exthz r10, r3
    bn.beqi r4, 0x1, loc_213026
    bg.addi r3, r10, 0x11a8
    bt.movi r4, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.addi r3, r10, 0x11a9
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
loc_213026:
    bg.addi r3, r10, 0x11a8
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.addi r3, r10, 0x11a9
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x20
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
