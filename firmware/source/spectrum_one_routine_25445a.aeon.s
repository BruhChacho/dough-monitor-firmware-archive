# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x25445a,0x25469c); byte-exact only; hardware untested.
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
    bn.sw 0x14(r1), r18
    bn.sw 0x10(r1), r19
    bn.sw 0xc(r1), r20
    bn.sw 0x8(r1), r21
    bt.mov r18, r3
    bg.movhi r20, 0x45
    bt.movi r7, 0x1
    bg.sbz 0x3ca8(r20), r7
    bn.ori r7, r0, 0xa8
    bn.muls r10, r3, r7
    bg.movhi r21, 0x48
    bg.addi r4, r21, 0x21ec
    bt.add r10, r4
    bn.lh r13, 0x2a(r10)
    bn.lh r12, 0x2c(r10)
    bg.movhi r7, 0x48
    bg.lbz r7, -0x508(r7)
    bn.andi r15, r7, 0x2
    bg.jal 0x23e760
    bn.ff1 r3, r3
    bn.sub r3, r0, r3
    bn.srli r14, r3, 0x1f
    bt.mov r3, r18
    bg.jal 0x2227da
    bn.ori r11, r0, 0xb0
    bn.muls r3, r3, r11
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.beqi r7, 0x0, loc_25450f
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_25450f
    bt.mov r3, r18
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_254508
loc_254504:
    bt.movi r17, 0x1
    bt.j loc_254511
loc_254508:
    bg.lbz r10, 0xa4(r10)
    bn.beqi r10, 0x0, loc_254504
loc_25450f:
    bt.movi r17, 0x0
loc_254511:
    bn.or r12, r13, r12
    bt.movi r16, 0x0
    bg.movhi r19, 0x3b
    bn.ori r7, r0, 0xa8
    bn.muls r13, r18, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r13, r4
    bt.j loc_25458d
loc_25452c:
    bn.lh r11, 0x14(r13)
    bn.lh r10, 0x1c(r13)
    bn.sw 0x0(r1), r10
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.mov r5, r15
    bt.mov r6, r17
    bt.mov r7, r14
    bt.mov r8, r11
    bg.jal 0x252fe9
    bn.sw 0x0(r1), r10
    bt.movi r3, 0x0
    bt.movi r4, 0x2
    bt.mov r5, r15
    bt.mov r6, r17
    bt.mov r7, r14
    bt.mov r8, r11
    bg.jal 0x252fe9
    bn.lh r11, 0x16(r13)
    bn.lh r10, 0x1e(r13)
    bn.sw 0x0(r1), r10
    bt.movi r3, 0x0
    bt.movi r4, 0x1
    bt.mov r5, r15
    bt.mov r6, r17
    bt.mov r7, r14
    bt.mov r8, r11
    bg.jal 0x252fe9
    bn.sw 0x0(r1), r10
    bt.movi r3, 0x0
    bt.movi r4, 0x3
    bt.mov r5, r15
    bt.mov r6, r17
    bt.mov r7, r14
    bt.mov r8, r11
    bg.jal 0x252fe9
loc_254584:
    bn.srli r12, r12, 0x1
    bt.addi r16, 0x1
    bg.beqi r12, 0x0, loc_254621
loc_25458d:
    bn.extbz r6, r16
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_254584
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r7, 0x4(r7)
    bg.sw_0 0x7430(r19), r7
    bn.andi r7, r6, 0x1
    bg.bnei r7, 0x0, loc_25452c
    bt.movi r3, 0x0
    bg.jal 0x25430b
    bn.lh r11, 0x14(r13)
    bn.lh r10, 0x1c(r13)
    bn.sw 0x0(r1), r10
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bt.mov r5, r15
    bt.mov r6, r17
    bt.mov r7, r14
    bt.mov r8, r11
    bg.jal 0x252fe9
    bn.sw 0x0(r1), r10
    bt.movi r3, 0x1
    bt.movi r4, 0x2
    bt.mov r5, r15
    bt.mov r6, r17
    bt.mov r7, r14
    bt.mov r8, r11
    bg.jal 0x252fe9
    bn.lh r11, 0x16(r13)
    bn.lh r10, 0x1e(r13)
    bn.sw 0x0(r1), r10
    bt.movi r3, 0x1
    bt.movi r4, 0x1
    bt.mov r5, r15
    bt.mov r6, r17
    bt.mov r7, r14
    bt.mov r8, r11
    bg.jal 0x252fe9
    bn.sw 0x0(r1), r10
    bt.movi r3, 0x1
    bt.movi r4, 0x3
    bt.mov r5, r15
    bt.mov r6, r17
    bt.mov r7, r14
    bt.mov r8, r11
    bg.jal 0x252fe9
    bt.movi r3, 0x1
    bg.jal 0x25430b
    bn.srli r12, r12, 0x1
    bt.addi r16, 0x1
    bg.bnei r12, 0x0, loc_25458d
loc_254621:
    bg.movhi r7, 0x3b
    bg.lwz r5, 0x7468(r7)
    bn.beqi r5, 0x1, loc_254669
loc_25462c:
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x3cb1
    bt.add r18, r4
    bn.sbz 0x0(r18), r0
loc_254639:
    bg.sbz 0x3ca8(r20), r0
    bn.lwz r21, 0x8(r1)
    bn.lwz r20, 0xc(r1)
    bn.lwz r19, 0x10(r1)
    bn.lwz r18, 0x14(r1)
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
loc_254669:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r18, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lh r7, 0x1c(r6)
    bn.lh r4, 0x14(r6)
    bg.ble r4, r7, loc_25462c
    bn.lh r7, 0x1e(r6)
    bn.lh r6, 0x16(r6)
    bg.ble r6, r7, loc_25462c
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3cb1
    bt.add r18, r7
    bn.sbz 0x0(r18), r5
    bt.j loc_254639
