# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27fbbf,0x27fc15); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bt.mov r7, r3
    bt.mov r10, r4
    bt.mov r3, r1
    bt.mov r4, r7
    bg.jal 0x27f31c
    bn.lwz r7, 0x0(r1)
    bn.sw 0x0(r10), r7
    bn.lwz r7, 0x4(r1)
    bn.sw 0x4(r10), r7
    bn.lwz r7, 0x8(r1)
    bn.sw 0x8(r10), r7
    bn.lwz r7, 0xc(r1)
    bn.sw 0xc(r10), r7
    bn.lwz r7, 0x10(r1)
    bn.sw 0x10(r10), r7
    bn.lwz r7, 0x14(r1)
    bn.sw 0x14(r10), r7
    bn.lwz r7, 0x18(r1)
    bn.sw 0x18(r10), r7
    bn.lwz r7, 0x1c(r1)
    bn.sw 0x1c(r10), r7
    bt.mov r3, r10
    bg.jal 0x27fad3
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bt.jr r9
