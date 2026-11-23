# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x260c02,0x260dec); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x3c
    bn.sw 0x38(r1), r9
    bn.sw 0x34(r1), r10
    bn.sw 0x30(r1), r11
    bn.sw 0x2c(r1), r12
    bn.sw 0x28(r1), r13
    bn.sw 0x24(r1), r14
    bn.sw 0x20(r1), r15
    bn.sw 0x1c(r1), r16
    bn.sw 0x18(r1), r17
    bt.mov r12, r3
    bg.jal 0x2227da
    bn.ori r10, r0, 0xb0
    bn.muls r7, r3, r10
    bg.movhi r11, 0x3b
    bg.addi r11, r11, 0x4950
    bt.add r7, r11
    bn.addi r3, r1, 0x4
    bn.lwz r4, 0x0(r7)
    bg.jal 0x20f12a
    bt.mov r3, r12
    bg.jal 0x2227da
    bt.mov r15, r3
    bt.mov r3, r12
    bg.jal 0x23f0e4
    bt.mov r13, r3
    bt.mov r3, r12
    bg.jal 0x23f059
    bt.mov r17, r3
    bn.muls r10, r15, r10
    bt.add r10, r11
    bn.lwz r3, 0x0(r10)
    bg.jal 0x20f0d1
    bn.lwz r7, 0xc(r1)
    bg.beqi r7, 0x4, loc_260dd1
    bt.mov r3, r12
    bn.addi r4, r1, 0x17
    bg.jal 0x23e6c4
    bt.mov r3, r12
    bt.mov r4, r13
    bg.jal 0x23f12d
    bg.bnei r13, 0x0, loc_260d72
    bt.movi r14, 0x0
    bg.movhi r16, 0x3b
loc_260c86:
    bt.mov r3, r12
    bg.jal 0x2227da
    bn.ori r11, r0, 0xb0
    bn.muls r3, r3, r11
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_260d9f
    bn.ori r7, r0, 0xa8
    bn.muls r10, r12, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_260d9f
    bt.mov r3, r12
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.bnei r7, 0x0, loc_260d97
loc_260cdf:
    bg.lwz r6, 0x5f38(r16)
    bn.lbz r5, 0x4a(r6)
    bn.lbz r7, 0x4b(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bg.ori r5, r0, 0xfff7
    bn.and r7, r7, r5
    bn.sbz 0x4a(r6), r7
    bn.srli r7, r7, 0x8
    bn.sbz 0x4b(r6), r7
    bg.lwz r6, 0x5f38(r16)
    bn.lbz r5, 0x4a(r6)
    bn.lbz r7, 0x4b(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bg.ori r7, r7, 0x200
    bn.sbz 0x4a(r6), r7
    bn.srli r7, r7, 0x8
    bn.sbz 0x4b(r6), r7
    bt.movi r14, 0x1
    bt.movi r4, 0x0
loc_260d20:
    bt.mov r3, r12
    bg.jal 0x2072e4
    bn.ori r7, r0, 0xb0
    bn.muls r7, r15, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r7, 0x4(r7)
    bn.srli r7, r7, 0x7
    bg.beqi r7, 0x0, loc_260dc5
    bt.mov r3, r12
    bt.movi r4, 0x1
    bt.movi r5, 0x0
    bg.jal 0x23e67f
loc_260d4a:
    bt.mov r3, r12
    bt.mov r4, r14
    bg.jal 0x23e6af
    bn.lwz r17, 0x18(r1)
    bn.lwz r16, 0x1c(r1)
    bn.lwz r15, 0x20(r1)
    bn.lwz r14, 0x24(r1)
    bn.lwz r13, 0x28(r1)
    bn.lwz r12, 0x2c(r1)
    bn.lwz r11, 0x30(r1)
    bn.lwz r10, 0x34(r1)
    bn.lwz r9, 0x38(r1)
    bn.addi r1, r1, 0x3c
    bt.jr r9
loc_260d72:
    bg.movhi r16, 0x3b
    bg.lwz r7, 0x5f38(r16)
    bn.lbz r5, 0x4a(r7)
    bn.lbz r6, 0x4b(r7)
    bn.slli r6, r6, 0x8
    bn.or r6, r6, r5
    bg.ori r6, r6, 0x200
    bn.sbz 0x4a(r7), r6
    bn.srli r6, r6, 0x8
    bn.sbz 0x4b(r7), r6
    bt.movi r14, 0x1
    bt.j loc_260c86
loc_260d97:
    bg.lbz r10, 0xa4(r10)
    bg.beqi r10, 0x0, loc_260cdf
loc_260d9f:
    bn.lbz r5, 0x17(r1)
    bg.beqi r5, 0x1, loc_260cdf
    bg.lwz r7, 0x5f38(r16)
    bn.lbz r7, 0x4b(r7)
    bn.slli r7, r7, 0x8
    bg.ori r6, r0, 0x200
    bn.and r7, r7, r6
    bg.bnei r7, 0x0, loc_260cdf
    bt.movi r4, 0x0
    bg.bnei r14, 0x0, loc_260d20
    bt.movi r4, 0x1
    bt.j loc_260d20
loc_260dc5:
    bt.mov r3, r12
    bt.mov r4, r13
    bt.mov r5, r17
    bg.jal 0x23e67f
    bt.j loc_260d4a
loc_260dd1:
    bt.mov r3, r12
    bn.addi r4, r1, 0x17
    bg.jal 0x23e6c4
    bt.mov r3, r12
    bt.movi r4, 0x0
    bg.jal 0x23f12d
    bt.movi r14, 0x0
    bt.movi r13, 0x0
    bg.movhi r16, 0x3b
    bt.j loc_260c86
