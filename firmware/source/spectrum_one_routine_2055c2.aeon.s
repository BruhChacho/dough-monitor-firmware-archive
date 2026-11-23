# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2055c2,0x205614); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bg.movhi r10, 0x3b
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.mov r4, r11
    bg.jal 0x23a12d
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.mov r4, r11
    bg.jal 0x23a0b1
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.mov r4, r11
    bg.jal 0x239ff2
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.mov r4, r11
    bt.movi r5, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x239fc0
