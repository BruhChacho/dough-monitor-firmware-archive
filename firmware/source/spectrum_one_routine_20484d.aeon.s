# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20484d,0x2048f4); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bn.sw 0x1c(r1), r11
    bn.sw 0x18(r1), r12
    bn.sw 0x14(r1), r13
    bn.sw 0x10(r1), r14
    bn.sw 0xc(r1), r15
    bn.sw 0x8(r1), r16
    bt.mov r10, r3
    bt.mov r3, r4
    bt.mov r13, r5
    bt.mov r14, r6
    bt.mov r15, r7
    bt.mov r16, r8
    bn.lbz r11, 0x28(r1)
    bn.lh r12, 0x2c(r1)
    bg.beqi r10, 0x6, loc_2048c1
    bg.bgtui r10, 0x5, loc_20489f
loc_204882:
    bn.lwz r16, 0x8(r1)
    bn.lwz r15, 0xc(r1)
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bt.jr r9
loc_20489f:
    bn.addi r7, r10, -0x9
    bg.bgtui r7, 0x6, loc_204882
    bn.bgtui r4, 0x1, loc_204882
    bg.jal 0x204168
    bn.sw 0x0(r1), r11
    bn.sw 0x4(r1), r12
    bt.mov r4, r10
    bt.mov r5, r13
    bt.mov r6, r14
    bt.mov r7, r15
    bt.mov r8, r16
    bg.jal 0x2047e1
loc_2048c1:
    bg.jal 0x2042cc
    bn.sw 0x28(r1), r11
    bn.sw 0x2c(r1), r12
    bt.mov r4, r10
    bt.mov r5, r13
    bt.mov r6, r14
    bt.mov r7, r15
    bt.mov r8, r16
    bn.lwz r16, 0x8(r1)
    bn.lwz r15, 0xc(r1)
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bg.j 0x2047e1
