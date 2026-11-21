# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a423,0x23a4d7); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x38
    bn.sw 0x34(r1), r9
    bn.sw 0x30(r1), r10
    bn.sw 0x2c(r1), r11
    bn.sw 0x28(r1), r12
    bn.sw 0x24(r1), r13
    bn.sw 0x20(r1), r14
    bn.sw 0x1c(r1), r15
    bn.sw 0x18(r1), r16
    bn.sw 0x14(r1), r17
    bn.sw 0x10(r1), r18
    bt.mov r14, r3
    bt.mov r18, r4
    bt.mov r13, r5
    bt.mov r15, r6
    bt.mov r10, r7
    bt.mov r11, r8
    bn.lh r12, 0x38(r1)
    bn.sw 0xc(r1), r0
    bn.addi r4, r1, 0xc
    bg.jal 0x23e697
    bt.mov r3, r10
    bg.jal 0x262bfa
    bt.mov r17, r3
    bt.mov r3, r11
    bg.jal 0x262bfa
    bt.mov r16, r3
    bt.mov r3, r12
    bg.jal 0x262bfa
    bt.mov r11, r3
    bt.mov r3, r13
    bg.jal 0x262c67
    bt.mov r12, r3
    bt.mov r3, r14
    bg.jal 0x23e760
    bn.beqi r3, 0x0, loc_23a4cd
    bt.mov r3, r15
    bg.jal 0x262c42
    bt.mov r10, r3
loc_23a48e:
    bt.mov r3, r14
    bt.movi r4, 0x0
    bg.jal 0x209a30
    bn.sw 0x0(r1), r11
    bt.mov r3, r14
    bt.mov r4, r18
    bn.extbz r5, r12
    bt.mov r6, r10
    bt.mov r7, r17
    bt.mov r8, r16
    bg.jal 0x20ad33
    bn.lwz r18, 0x10(r1)
    bn.lwz r17, 0x14(r1)
    bn.lwz r16, 0x18(r1)
    bn.lwz r15, 0x1c(r1)
    bn.lwz r14, 0x20(r1)
    bn.lwz r13, 0x24(r1)
    bn.lwz r12, 0x28(r1)
    bn.lwz r11, 0x2c(r1)
    bn.lwz r10, 0x30(r1)
    bn.lwz r9, 0x34(r1)
    bn.addi r1, r1, 0x38
    bt.jr r9
loc_23a4cd:
    bt.mov r3, r15
    bg.jal 0x262c1d
    bt.mov r10, r3
    bt.j loc_23a48e
