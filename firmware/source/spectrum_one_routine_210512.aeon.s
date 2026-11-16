# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x210512,0x21057b); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r12, r4
    bg.jal 0x2100d2
    bt.mov r11, r3
    bt.movi r7, 0x0
    bn.beqi r3, 0x3, loc_210568
    bg.ori r4, r0, 0x270
    bt.movi r5, 0x1
    bg.jal 0x2145e6
    bn.ori r3, r0, 0x96
    bg.jal 0x24209d
    bg.ori r10, r0, 0x240
loc_210542:
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x21452e
    bn.add r7, r12, r10
    bg.sbz -0x240(r7), r3
    bt.addi r10, 0x1
    bg.sfnei r10, 0x246
    bn.bf loc_210542
    bt.mov r3, r11
    bg.ori r4, r0, 0x270
    bt.movi r5, 0x0
    bg.jal 0x2145e6
    bt.movi r7, 0x1
loc_210568:
    bt.mov r3, r7
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
