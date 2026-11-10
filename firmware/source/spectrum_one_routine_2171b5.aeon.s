# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2171b5,0x21723d); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r4
    bt.mov r12, r5
    bg.jal 0x211893
    bt.mov r11, r3
    bg.addi r13, r3, 0x1805
    bt.mov r3, r13
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x20
    bg.jal 0x23dfe1
    bg.addi r3, r11, 0x1804
    bt.mov r4, r10
    bg.ori r5, r0, 0x3ff
    bg.jal 0x23e152
    bt.mov r3, r13
    bt.movi r4, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.addi r3, r11, 0x1806
    bt.mov r4, r12
    bn.ori r5, r0, 0xff
    bg.jal 0x23dfe1
    bg.addi r11, r11, 0x1807
    bt.mov r3, r11
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
loc_217214:
    bt.mov r3, r11
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x2
    bn.bnei r3, 0x0, loc_217214
    bt.mov r3, r13
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23dfe1
