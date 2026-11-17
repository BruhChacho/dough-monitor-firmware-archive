# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x242968,0x2429b9); byte-exact only; hardware untested.
    bn.extbz r4, r4
    bn.ori r7, r0, 0x28
    bn.muls r4, r4, r7
    bg.movhi r7, 0x49
    bg.addi r7, r7, -0x5a5c
    bt.add r4, r7
    bn.lwz r7, 0x0(r4)
    bn.sw 0x0(r3), r7
    bn.lwz r7, 0x4(r4)
    bn.sw 0x4(r3), r7
    bn.lwz r7, 0x8(r4)
    bn.sw 0x8(r3), r7
    bn.lwz r7, 0xc(r4)
    bn.sw 0xc(r3), r7
    bn.lwz r7, 0x10(r4)
    bn.sw 0x10(r3), r7
    bn.lwz r7, 0x14(r4)
    bn.sw 0x14(r3), r7
    bn.lwz r7, 0x18(r4)
    bn.sw 0x18(r3), r7
    bn.lwz r7, 0x1c(r4)
    bn.sw 0x1c(r3), r7
    bn.lwz r7, 0x20(r4)
    bn.sw 0x20(r3), r7
    bn.lwz r7, 0x24(r4)
    bn.sw 0x24(r3), r7
    bt.jr r9
