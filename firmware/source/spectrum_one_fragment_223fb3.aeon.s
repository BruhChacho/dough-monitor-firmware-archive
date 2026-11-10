# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x223fb3,0x22419b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bn.sw 0x4(r1), r16
    bn.sw 0x0(r1), r17
    bt.mov r11, r3
    bt.mov r16, r4
    bg.jal 0x2227da
    bt.mov r12, r3
    bt.mov r3, r11
    bt.mov r4, r12
    bg.jal 0x222ea6
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.lbz r15, 0x98(r7)
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bg.lbz r13, 0x89(r7)
    bg.lbz r5, 0x88(r7)
    bn.addi r7, r3, 0x1
    bn.muls r7, r13, r7
    bn.addi r6, r5, 0x1
    bn.muls r7, r7, r6
    bn.extbz r17, r7
    bt.movi r7, 0x1
    bn.xor r3, r3, r7
    bn.ff1 r3, r3
    bt.addi r3, -0x1
    bn.srli r10, r3, 0x1f
    bg.bnei r5, 0x0, loc_2240ce
    bt.movi r14, 0x0
    bg.bnei r10, 0x0, loc_2240ce
loc_224035:
    bn.ori r10, r0, 0xa8
    bn.muls r10, r11, r10
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bg.sh 0x98(r10), r16
    bg.sw_1 0x9c(r10), r0
    bg.sh 0x9c(r10), r0
    bg.sw_1 0xa0(r10), r0
    bn.ori r7, r0, 0x18
    bn.muls r11, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r11, r6
    bn.lbz r7, 0x11(r11)
    bn.sfeqi r7, 0x6
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r12
    bt.mov r4, r13
    bn.andi r5, r5, 0x1
    bg.jal 0x222f55
    bt.mov r13, r3
    bn.lh r7, 0xe(r11)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r12
    bt.mov r4, r17
    bn.andi r5, r5, 0x1
    bg.jal 0x222f8e
    bg.lbz r7, 0x98(r10)
    bn.sra r7, r7, r14
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_2240a2
    bn.sw 0x4(r11), r3
    bn.sw 0x8(r11), r13
loc_2240a2:
    bt.mov r3, r15
    bg.jal 0x222fca
    bt.mov r3, r16
    bt.mov r4, r17
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bg.j 0x222efa
loc_2240ce:
    bg.beqi r15, 0x0, loc_224171
    bt.mov r3, r15
    bg.jal 0x2402c4
    bt.mov r14, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.extbz r24, r7
    bn.sub r7, r15, r24
    bn.extbz r15, r7
loc_2240e8:
    bn.ori r7, r0, 0x18
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bn.sbz 0x15(r7), r0
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bg.lbz r23, 0x88(r7)
    bn.beqi r23, 0x0, loc_224119
    bt.mov r4, r12
    bt.mov r5, r16
    bn.beqi r13, 0x1, loc_224137
loc_224119:
    bt.movi r4, 0x6
    bt.movi r5, 0x0
    bn.beqi r10, 0x0, loc_224137
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r4, 0x7d(r7)
    bg.beq r12, r4, loc_224181
loc_224137:
    bn.ori r7, r0, 0x18
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bn.sbz 0x1(r7), r23
    bn.sbz 0x11(r7), r4
    bn.sh_2 0xe(r7), r5
    bn.sbz 0x10(r7), r12
    bn.sh_1 0xc(r7), r16
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.sbz 0x98(r7), r24
    bt.j loc_224035
loc_224171:
    bg.jal 0x222f30
    bt.mov r14, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.extbz r24, r7
    bt.j loc_2240e8
loc_224181:
    bn.lbz r4, 0x7c(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x15(r7), r6
    bt.j loc_224137
