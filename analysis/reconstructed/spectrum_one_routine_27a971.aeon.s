# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27a971,0x27a9bc); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r11, r3
    bt.mov r12, r4
    bg.movhi r10, 0x48
    bg.addi r7, r10, -0x2370
    bg.lhz r3, -0x2370(r10)
    bn.slli r3, r3, 0x3
    bn.lwz r7, 0x8(r7)
    bt.add r3, r7
    bg.jal 0x279cd8
    bn.sw 0x0(r3), r11
    bn.sw 0x4(r3), r12
    bg.lhz r7, -0x2370(r10)
    bt.addi r7, 0x1
    bg.sw_1 -0x2370(r10), r7
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
