# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20546f,0x2054eb); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bt.mov r11, r3
    bt.mov r13, r4
    bt.mov r12, r5
    bn.addi r7, r3, -0x9
    bg.bgtui r7, 0x6, loc_2054b8
    bn.sbz 0x7(r1), r0
    bn.sbz 0x6(r1), r0
    bt.movi r10, 0x0
    bn.addi r14, r1, 0x7
loc_20549c:
    bn.extbz r3, r10
    bg.jal 0x204168
    bn.sh_1 0x0(r12), r3
    bt.mov r4, r14
    bg.jal 0x2461f6
    bn.lbz r7, 0x7(r1)
    bg.beq r11, r7, loc_2054d1
loc_2054b3:
    bt.addi r10, 0x1
    bn.bnei r10, 0x2, loc_20549c
loc_2054b8:
    bt.movi r3, 0x0
loc_2054ba:
    bn.lwz r14, 0x8(r1)
    bn.lwz r13, 0xc(r1)
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_2054d1:
    bn.lh r3, 0x0(r12)
    bt.addi r3, 0x1
    bn.exthz r3, r3
    bn.addi r4, r1, 0x6
    bg.jal 0x2461f6
    bn.lbz r7, 0x6(r1)
    bg.bne r13, r7, loc_2054b3
    bt.movi r3, 0x1
    bt.j loc_2054ba
