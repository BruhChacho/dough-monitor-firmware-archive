# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27bc11,0x27bc4b); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bt.mov r11, r4
    bt.mov r12, r5
    bn.extbz r4, r4
    bn.extbz r5, r5
    bg.jal 0x27bbd5
    bn.addi r3, r10, 0x1
    bn.srli r4, r11, 0x8
    bn.srli r5, r12, 0x8
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x27bbd5
