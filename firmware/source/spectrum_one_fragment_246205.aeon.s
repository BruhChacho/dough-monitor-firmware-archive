# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x246205,0x246269); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bt.mov r11, r4
    bt.mov r12, r5
    bg.ori r3, r0, 0x42c
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.ori r3, r0, 0x42e
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bn.ori r3, r0, 0xa0
    bt.mov r4, r10
    bt.mov r5, r11
    bt.mov r6, r12
    bg.jal 0x240a8b
    bg.ori r3, r0, 0x42c
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.ori r3, r0, 0x42e
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dead
