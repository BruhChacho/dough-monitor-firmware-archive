# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27f31c,0x27f375); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.mov r10, r4
    bn.slli r7, r4, 0x2
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x7da0
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bg.beqi r7, 0x5, loc_27f362
    bg.beqi r7, 0x7, loc_27f362
    bt.mov r3, r4
    bg.jal 0x27d938
    bt.mov r5, r3
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x27f21e
    bt.mov r3, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_27f362:
    bg.jal 0x27e93c
    bt.mov r3, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
