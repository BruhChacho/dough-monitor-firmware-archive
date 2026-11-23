# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a4d7,0x23a55b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r12, r3
    bt.mov r10, r5
    bt.mov r11, r6
    bt.mov r3, r4
    bg.jal 0x262bfa
    bt.mov r14, r3
    bt.mov r3, r10
    bg.jal 0x262bfa
    bt.mov r13, r3
    bt.mov r3, r11
    bg.jal 0x262bfa
    bt.mov r10, r3
    bt.mov r3, r12
    bg.jal 0x23e760
    bn.beqi r3, 0x0, loc_23a537
    bt.mov r3, r12
    bn.extbz r4, r14
    bn.extbz r5, r13
    bn.extbz r6, r10
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x20abaa
loc_23a537:
    bt.mov r3, r12
    bn.extbz r4, r14
    bn.extbz r5, r13
    bn.extbz r6, r10
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x20ab2e
