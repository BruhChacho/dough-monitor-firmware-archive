# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x224f15,0x2250c5); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r11, r3
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r10, 0x2c(r7)
    bg.jal 0x2227da
    bt.mov r15, r3
    bt.mov r3, r10
    bg.jal 0x2402c4
    bt.mov r14, r3
    bt.movi r12, 0x1
    bn.sll r7, r12, r3
    bn.sub r10, r10, r7
    bn.exthz r3, r10
    bg.bnei r3, 0x0, loc_225017
loc_224f5f:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r6, 0x18(r7)
    bn.lh r7, 0x1c(r7)
    bt.add r6, r7
    bg.sfgtsi r6, 0x780
    bn.bnf loc_2250b7
loc_224f7e:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lh r7, 0x18(r7)
    bg.sfleui r7, 0x77f
    bn.bnf loc_224fb2
loc_224f98:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_224fb2:
    bg.jal 0x222b25
    bn.bgtui r3, 0x3, loc_224f98
    bg.jal 0x222b25
loc_224fbd:
    bt.mov r13, r3
    bn.ori r10, r0, 0x7c
    bn.muls r10, r3, r10
    bg.movhi r12, 0x48
    bg.addi r4, r12, -0x564
    bt.add r10, r4
    bn.sbz 0x10(r10), r11
    bt.movi r7, 0x3
    bn.sw 0x8(r10), r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r7, 0x29(r7)
    bn.sbz 0xe(r10), r7
    bg.jal 0x222b9f
    bn.sbz 0x1d(r10), r15
    bt.movi r7, 0x1
    bn.sll r7, r7, r13
    bn.exths r5, r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r15, r7
    bg.movhi r24, 0x3b
    bg.addi r24, r24, 0x4950
    bt.add r7, r24
    bn.lh r4, 0x12(r7)
    bn.or r6, r5, r4
    bn.sh_2 0x12(r7), r6
    bt.j loc_22502b
loc_225017:
    bg.jal 0x2402c4
    bg.beqi r3, 0x4, loc_224f5f
    bt.mov r13, r3
    bn.sll r7, r12, r3
    bn.exths r5, r7
    bg.movhi r12, 0x48
loc_22502b:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r24, 0x2a(r7)
    bn.or r6, r5, r24
    bn.sh_2 0x2a(r7), r6
    bn.ori r6, r0, 0x7c
    bn.muls r4, r13, r6
    bg.addi r7, r12, -0x564
    bt.add r4, r7
    bn.muls r6, r14, r6
    bt.add r6, r7
    bn.lh r5, 0x50(r6)
    bn.srli r23, r5, 0x1
    bn.lh r24, 0x4c(r6)
    bn.add r7, r23, r24
    bn.sh_1 0x4c(r4), r7
    bn.lh r7, 0x4e(r6)
    bn.sh_2 0x4e(r4), r7
    bn.sub r5, r5, r23
    bn.sh_1 0x50(r4), r5
    bn.lh r7, 0x52(r6)
    bn.sh_2 0x52(r4), r7
    bn.lh r7, 0x50(r6)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x50(r6), r7
    bn.sbz 0x32(r6), r14
    bn.sbz 0x32(r4), r14
    bn.lh r7, 0x40(r6)
    bn.sh_1 0x40(r4), r7
    bn.lh r7, 0x42(r6)
    bn.sh_2 0x42(r4), r7
    bn.lh r7, 0x48(r6)
    bn.srli r23, r7, 0x1
    bn.lh r24, 0x44(r6)
    bn.add r5, r23, r24
    bn.sh_1 0x44(r4), r5
    bn.sub r7, r7, r23
    bn.sh_1 0x48(r4), r7
    bn.lh r7, 0x4a(r6)
    bn.sh_2 0x4a(r4), r7
    bn.lh r7, 0x48(r6)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x48(r6), r7
    bt.j loc_224f98
loc_2250b7:
    bg.jal 0x222b15
    bg.bgtui r3, 0x3, loc_224f7e
    bg.jal 0x222b15
    bt.j loc_224fbd
