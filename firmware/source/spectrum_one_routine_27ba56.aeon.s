# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27ba56,0x27baa2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r11, r3
    bt.mov r12, r4
    bt.mov r13, r5
    bg.movhi r10, 0x3d
    bg.lwz r3, -0x47a4(r10)
    bg.addi r4, r0, -0x100
    bg.jal 0x279cc1
    bt.mov r3, r11
    bt.mov r4, r12
    bt.mov r5, r13
    bg.jal 0x27bc11
    bg.lwz r3, -0x47a4(r10)
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x279cc5
