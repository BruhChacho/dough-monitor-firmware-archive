# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27e93c,0x27e977); byte-exact only; hardware untested.
    bg.movhi r7, 0x3d
    bg.lwz r6, -0x4744(r7)
    bn.sw 0x0(r3), r6
    bg.addi r7, r7, -0x4744
    bn.lwz r6, 0x4(r7)
    bn.sw 0x4(r3), r6
    bn.lwz r6, 0x8(r7)
    bn.sw 0x8(r3), r6
    bn.lwz r6, 0xc(r7)
    bn.sw 0xc(r3), r6
    bn.lwz r6, 0x10(r7)
    bn.sw 0x10(r3), r6
    bn.lwz r6, 0x14(r7)
    bn.sw 0x14(r3), r6
    bn.lwz r6, 0x18(r7)
    bn.sw 0x18(r3), r6
    bn.lwz r7, 0x1c(r7)
    bn.sw 0x1c(r3), r7
    bt.jr r9
