# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23dead,0x23df85); Masked bit set/clear with polling and nesting counter; store width remains unresolved.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r12, r3
    bt.mov r14, r4
    bt.mov r13, r5
    bg.movhi r11, 0x45
    bg.lhz r7, 0x51a8(r11)
    bt.addi r7, 0x1
    bg.sw_1 0x51a8(r11), r7
    bg.movhi r10, 0x45
    bg.lwz r7, 0x3cf0(r10)
    bn.movhi_2 r6, 0x20
    bg.ori r6, r6, 0x3034
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bg.ori r5, r0, 0xfffe
    bt.movi r4, 0x1
    bt.j loc_23df00
loc_23def4:
    bn.addi r7, r5, -0x1
    bn.exthz r5, r7
    bn.sbz 0x0(r6), r4
    bn.beqi r5, 0x0, loc_23df13
loc_23df00:
    bg.lwz r6, 0x3cf0(r10)
    bn.movhi_2 r7, 0x20
    bg.ori r7, r7, 0x3034
    bt.add r6, r7
    bn.lbz r7, 0x0(r6)
    bn.bnei r7, 0x1, loc_23def4
loc_23df13:
    bt.mov r3, r12
    bg.jal 0x23dd44
    bn.or r7, r3, r13
    bn.extbz r4, r7
    bn.bnei r14, 0x0, loc_23df2b
    bn.nand r7, r13, r13
    bn.and r7, r3, r7
    bn.extbz r4, r7
loc_23df2b:
    bt.mov r3, r12
    bg.jal 0x23ddb9
    bg.lhz r7, 0x51a8(r11)
    bt.addi r7, -0x1
    bn.exthz r5, r7
    bg.sw_1 0x51a8(r11), r5
    bg.lwz r6, 0x3cf0(r10)
    bn.movhi_2 r7, 0x20
    bg.ori r7, r7, 0x3034
    bt.add r6, r7
    bn.lbz r7, 0x0(r6)
    bn.beqi r7, 0x1, loc_23df68
loc_23df51:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_23df68:
    bn.bnei r5, 0x0, loc_23df51
    bn.sbz 0x0(r6), r0
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
