# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a1b8,0x23a21a); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bt.mov r11, r3
    bt.mov r10, r4
    bn.addi r4, r1, 0x4
    bt.mov r5, r1
    bg.jal 0x23e661
    bn.beqi r10, 0x0, loc_23a200
    bt.movi r10, 0x1
    bt.movi r5, 0x1
    bn.lwz r7, 0x4(r1)
    bn.bnei r7, 0x0, loc_23a210
loc_23a1de:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x207028
    bt.mov r3, r11
    bt.movi r4, 0x0
    bt.mov r5, r10
    bg.jal 0x2088c3
    bt.movi r3, 0x0
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_23a200:
    bt.movi r10, 0x1
    bt.movi r5, 0x0
    bn.lwz r7, 0x0(r1)
    bn.beqi r7, 0x0, loc_23a1de
loc_23a20a:
    bt.movi r10, 0x0
    bt.movi r5, 0x0
    bt.j loc_23a1de
loc_23a210:
    bt.movi r10, 0x0
    bn.lwz r7, 0x0(r1)
    bn.bnei r7, 0x1, loc_23a1de
    bt.j loc_23a20a
