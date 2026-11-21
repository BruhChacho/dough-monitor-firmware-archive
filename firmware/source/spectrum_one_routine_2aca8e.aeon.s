# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2aca8e,0x2acae4); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x64
    bn.sw 0x60(r1), r9
    bn.sw 0x5c(r1), r10
    bn.sw 0x58(r1), r11
    bn.sw 0x50(r1), r3
    bn.sw 0x54(r1), r4
    bn.sw 0x48(r1), r5
    bn.sw 0x4c(r1), r6
    bn.addi r11, r1, 0x30
    bn.addi r3, r1, 0x50
    bt.mov r4, r11
    bg.jal 0x2ac756
    bn.addi r10, r1, 0x18
    bn.addi r3, r1, 0x48
    bt.mov r4, r10
    bg.jal 0x2ac756
    bn.lwz r7, 0x1c(r1)
    bt.movi r6, 0x1
    bn.xor r7, r7, r6
    bn.sw 0x1c(r1), r7
    bt.mov r3, r11
    bt.mov r4, r10
    bt.mov r5, r1
    bn.jal 0x2ac837
    bg.jal 0x2ac55d
    bn.lwz r11, 0x58(r1)
    bn.lwz r10, 0x5c(r1)
    bn.lwz r9, 0x60(r1)
    bn.addi r1, r1, 0x64
    bt.jr r9
