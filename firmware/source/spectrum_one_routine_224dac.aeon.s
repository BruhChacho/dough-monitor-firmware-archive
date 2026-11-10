# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x224dac,0x224f15); byte-exact only; hardware untested.
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
    bt.mov r13, r3
    bt.movi r14, 0x1
    bn.sll r7, r14, r3
    bn.sub r10, r10, r7
    bn.exthz r3, r10
    bg.bnei r3, 0x0, loc_224eff
loc_224df6:
    bg.jal 0x222b15
    bn.bleui r3, 0x3, loc_224e17
loc_224dfd:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_224e17:
    bg.jal 0x222b15
    bt.mov r12, r3
    bn.ori r10, r0, 0x7c
    bn.muls r10, r3, r10
    bg.movhi r14, 0x48
    bg.addi r6, r14, -0x564
    bt.add r10, r6
    bn.sbz 0x10(r10), r11
    bt.movi r7, 0x3
    bn.sw 0x8(r10), r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lbz r7, 0x29(r7)
    bn.sbz 0xe(r10), r7
    bg.jal 0x222b9f
    bn.sbz 0x1d(r10), r15
    bt.movi r7, 0x1
    bn.sll r7, r7, r12
    bn.exths r5, r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r15, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lh r24, 0x12(r7)
    bn.or r6, r5, r24
    bn.sh_2 0x12(r7), r6
loc_224e73:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r24, 0x2a(r7)
    bn.or r6, r5, r24
    bn.sh_2 0x2a(r7), r6
    bn.ori r6, r0, 0x7c
    bn.muls r4, r12, r6
    bg.addi r7, r14, -0x564
    bt.add r4, r7
    bn.muls r6, r13, r6
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
    bn.sbz 0x32(r6), r13
    bn.sbz 0x32(r4), r13
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
    bt.j loc_224dfd
loc_224eff:
    bg.jal 0x2402c4
    bg.beqi r3, 0x4, loc_224df6
    bt.mov r12, r3
    bn.sll r7, r14, r3
    bn.exths r5, r7
    bg.movhi r14, 0x48
    bt.j loc_224e73
