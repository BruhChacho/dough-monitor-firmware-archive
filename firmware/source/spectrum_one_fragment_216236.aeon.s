# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x216236,0x216273); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r4
    bg.jal 0x211855
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x107c
    bn.add r10, r3, r7
    bt.mov r3, r10
    bt.mov r4, r11
    bg.ori r5, r0, 0xffff
    bg.jal 0x23e152
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.ori r5, r0, 0xffff
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23e152
