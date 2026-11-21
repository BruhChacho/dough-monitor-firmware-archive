# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x261417,0x2614a9); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.mov r10, r4
    bg.jal 0x206b6b
    bt.mov r3, r10
    bg.jal 0x20649d
    bt.mov r5, r4
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x260faa
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x260f9f
    bt.mov r3, r11
    bg.jal 0x206e24
    bn.bnei r3, 0x0, loc_261486
    bn.addi r7, r10, -0x1
    bn.extbz r7, r7
    bn.bgtui r7, 0x2, loc_261486
loc_261454:
    bt.mov r3, r11
    bg.jal 0x27e9b2
    bn.extbz r3, r3
    bt.movi r7, 0x1
    bn.bnei r3, 0x0, loc_261477
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3f86(r7)
    bn.bnei r7, 0x0, loc_261490
    bt.mov r3, r11
    bt.movi r4, 0x0
    bg.jal 0x23a0de
    bt.movi r7, 0x0
loc_261477:
    bt.mov r3, r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_261486:
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x281391
    bt.j loc_261454
loc_261490:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x23a0de
    bt.movi r7, 0x0
    bt.mov r3, r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
