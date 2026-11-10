# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21723d,0x2172af); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bt.movi r4, 0x2
    bt.movi r5, 0x0
    bg.jal 0x2171b5
    bt.mov r3, r10
    bn.ori r4, r0, 0x10
    bt.movi r5, 0x0
    bg.jal 0x2171b5
    bt.mov r3, r10
    bn.ori r4, r0, 0x11
    bt.movi r5, 0x0
    bg.jal 0x2171b5
    bt.mov r3, r10
    bn.ori r4, r0, 0x20
    bt.movi r5, 0x0
    bg.jal 0x2171b5
    bt.mov r3, r10
    bn.ori r4, r0, 0x21
    bt.movi r5, 0x0
    bg.jal 0x2171b5
    bt.mov r3, r10
    bn.ori r4, r0, 0x30
    bt.movi r5, 0x0
    bg.jal 0x2171b5
    bt.mov r3, r10
    bn.ori r4, r0, 0x40
    bt.movi r5, 0x0
    bg.jal 0x2171b5
    bt.mov r3, r10
    bn.ori r4, r0, 0x41
    bt.movi r5, 0x0
    bg.jal 0x2171b5
    bt.mov r3, r10
    bn.ori r4, r0, 0xc0
    bt.movi r5, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x2171b5
