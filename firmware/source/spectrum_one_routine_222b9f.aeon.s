# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222b9f,0x222bde); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r3, r7
    bg.movhi r7, 0x2b
    bg.lwz r6, -0x9e0(r7)
    bn.sw 0x20(r3), r6
    bg.addi r7, r7, -0x9e0
    bn.lwz r7, 0x4(r7)
    bn.sw 0x24(r3), r7
    bn.sw 0x4c(r3), r6
    bn.sw 0x50(r3), r7
    bn.sw 0x3c(r3), r6
    bn.sw 0x40(r3), r7
    bn.sw 0x34(r3), r6
    bn.sw 0x38(r3), r7
    bn.sw 0x44(r3), r6
    bn.sw 0x48(r3), r7
    bt.jr r9
