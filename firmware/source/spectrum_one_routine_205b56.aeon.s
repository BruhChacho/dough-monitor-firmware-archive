# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x205b56,0x205bd8); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bt.mov r12, r3
    bn.sh_1 0x4(r1), r0
    bn.sbz 0x7(r1), r0
    bn.sbz 0x6(r1), r0
    bt.movi r11, 0x0
    bn.addi r13, r1, 0x4
loc_205b78:
    bn.extbz r3, r11
    bg.jal 0x204168
    bt.mov r10, r3
    bt.addi r3, 0x6
    bn.exthz r3, r3
    bt.mov r4, r13
    bg.jal 0x2461e7
    bn.lh r7, 0x4(r1)
    bg.beq r12, r7, loc_205bb6
    bt.addi r11, 0x1
    bn.bnei r11, 0x2, loc_205b78
    bn.ori r3, r0, 0xff
    bn.ori r4, r0, 0xff
    bg.jal 0x205711
loc_205ba2:
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_205bb6:
    bt.mov r3, r10
    bn.addi r4, r1, 0x7
    bg.jal 0x2461f6
    bn.addi r3, r10, 0x1
    bn.exthz r3, r3
    bn.addi r4, r1, 0x6
    bg.jal 0x2461f6
    bn.lbz r3, 0x7(r1)
    bn.lbz r4, 0x6(r1)
    bg.jal 0x205711
    bt.j loc_205ba2
