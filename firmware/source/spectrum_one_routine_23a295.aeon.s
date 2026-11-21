# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a295,0x23a327); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r3
    bt.mov r13, r4
    bt.movi r11, 0x0
loc_23a2ad:
    bn.extbz r10, r11
    bt.mov r3, r10
    bg.jal 0x23e7b3
    bn.bnei r3, 0x0, loc_23a313
loc_23a2b9:
    bt.addi r11, 0x1
    bg.bnei r11, 0x4, loc_23a2ad
    bt.movi r10, 0x0
loc_23a2c1:
    bt.mov r3, r12
    bn.extbz r4, r10
    bt.mov r5, r13
    bg.jal 0x20879a
    bt.addi r10, 0x1
    bn.bnei r10, 0x3, loc_23a2c1
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x50cc
    bn.add r5, r12, r7
    bt.movi r6, 0x1
    bn.sbz 0x0(r5), r6
    bt.movi r11, 0x0
    bt.mov r12, r7
loc_23a2e5:
    bn.extbz r10, r11
    bt.mov r3, r10
    bg.jal 0x23e7b3
    bn.beqi r3, 0x0, loc_23a2f7
    bn.lbz r7, 0x0(r12)
    bn.beqi r7, 0x1, loc_23a31d
loc_23a2f7:
    bt.addi r11, 0x1
    bt.addi r12, 0x1
    bg.bnei r11, 0x4, loc_23a2e5
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_23a313:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x2082c3
    bt.j loc_23a2b9
loc_23a31d:
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x2082c3
    bt.j loc_23a2f7
