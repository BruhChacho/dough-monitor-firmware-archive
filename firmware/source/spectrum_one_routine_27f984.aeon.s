# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27f984,0x27fa53); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bn.sw 0x1c(r1), r11
    bn.sw 0x18(r1), r12
    bn.sw 0x14(r1), r13
    bn.sw 0x10(r1), r14
    bt.mov r13, r3
    bt.mov r12, r4
    bt.mov r14, r5
    bn.slli r11, r3, 0x1
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x7dd8
    bn.add r7, r11, r6
    bn.lh r7, 0x0(r7)
    bn.sh_1 0x0(r4), r7
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x7de8
    bn.add r7, r11, r6
    bn.lh r7, 0x0(r7)
    bn.sh_1 0x0(r5), r7
    bn.lh r6, 0x0(r4)
    bn.beqi r6, 0x0, loc_27f9cd
    bn.bnei r7, 0x0, loc_27f9fd
loc_27f9cd:
    bg.jal 0x27d938
    bt.mov r10, r3
    bt.mov r3, r13
    bg.jal 0x2250c5
    bn.extbz r4, r3
    bt.mov r3, r10
    bg.jal 0x23d121
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bt.mov r3, r13
    bg.jal 0x223126
    bn.sh_1 0x0(r12), r3
    bn.lh r7, 0xe(r1)
    bn.sh_1 0x0(r14), r7
loc_27f9fd:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2558
    bt.mov r4, r13
    bg.jal 0x27f95e
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x7dd8
    bn.add r7, r11, r6
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x253a
    bn.lh r4, 0x0(r7)
    bg.jal 0x27f95e
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7de8
    bt.add r11, r7
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2524
    bn.lh r4, 0x0(r11)
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bg.j 0x27f95e
