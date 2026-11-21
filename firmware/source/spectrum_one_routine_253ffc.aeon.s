# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x253ffc,0x2540bb); byte-exact only; hardware untested.
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
    bt.mov r14, r4
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r10, 0x2a(r7)
    bt.movi r12, 0x0
    bg.movhi r17, 0x3b
    bn.slli r13, r3, 0x1
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7870
    bt.add r13, r7
    bt.movi r16, 0x1
    bn.ori r15, r0, 0x7c
    bt.j loc_254051
loc_254049:
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.beqi r10, 0x0, loc_25409b
loc_254051:
    bn.extbz r6, r12
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_254049
    bn.andi r7, r6, 0x1
    bn.xor r11, r7, r16
    bn.muls r7, r6, r15
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bg.sw_0 0x7430(r17), r7
    bg.jal 0x242247
    bt.mov r3, r11
    bg.jal 0x24f810
    bn.lh r4, 0x0(r13)
    bg.beq r3, r4, loc_25408b
    bt.mov r3, r11
    bg.jal 0x24f822
loc_25408b:
    bt.mov r3, r11
    bt.mov r4, r14
    bg.jal 0x2538f6
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.bnei r10, 0x0, loc_254051
loc_25409b:
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
    bt.jr r9
