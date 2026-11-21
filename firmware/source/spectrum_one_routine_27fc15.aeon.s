# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27fc15,0x27ff86); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x74
    bn.sw 0x70(r1), r9
    bn.sw 0x6c(r1), r10
    bn.sw 0x68(r1), r11
    bn.sw 0x64(r1), r12
    bn.sw 0x60(r1), r13
    bn.sw 0x5c(r1), r14
    bn.sw 0x58(r1), r15
    bn.sw 0x54(r1), r16
    bn.sw 0x50(r1), r17
    bn.sw 0x4c(r1), r19
    bn.sw 0x48(r1), r20
    bn.sw 0x44(r1), r21
    bn.sw 0x40(r1), r22
    bt.mov r10, r5
    bt.mov r11, r6
    bt.mov r15, r7
    bt.mov r16, r8
    bn.lwz r7, 0x74(r1)
    bn.lwz r8, 0x78(r1)
    bn.sw 0x38(r1), r7
    bn.sw 0x3c(r1), r8
    bn.lwz r7, 0x7c(r1)
    bg.lwz r8, 0x80(r1)
    bn.sw 0x30(r1), r7
    bn.sw 0x34(r1), r8
    bg.lwz r7, 0x84(r1)
    bg.lwz r8, 0x88(r1)
    bn.sw 0x28(r1), r7
    bn.sw 0x2c(r1), r8
    bg.lwz r7, 0x8c(r1)
    bg.lwz r8, 0x90(r1)
    bn.sw 0x20(r1), r7
    bn.sw 0x24(r1), r8
    bg.lwz r7, 0x94(r1)
    bg.lwz r8, 0x98(r1)
    bn.sw 0x18(r1), r7
    bn.sw 0x1c(r1), r8
    bg.lwz r7, 0x9c(r1)
    bg.lwz r8, 0xa0(r1)
    bn.sw 0x10(r1), r7
    bn.sw 0x14(r1), r8
    bg.lwz r7, 0xa4(r1)
    bg.lwz r8, 0xa8(r1)
    bn.sw 0x8(r1), r7
    bn.sw 0xc(r1), r8
    bg.jal 0x2aad6a
    bn.exthz r19, r3
    bt.mov r3, r19
    bg.jal 0x27de78
    bt.mov r3, r10
    bt.mov r4, r11
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r20, r3
    bt.mov r3, r20
    bg.jal 0x27dee6
    bt.mov r3, r15
    bt.mov r4, r16
    bg.jal 0x2ad165
    bt.mov r21, r3
    bg.movhi r10, 0x3d
    bg.addi r10, r10, -0x4768
    bn.sbz 0x1(r10), r3
    bn.srli r7, r3, 0x8
    bn.sbz 0x2(r10), r7
    bn.srli r7, r3, 0x10
    bn.sbz 0x3(r10), r7
    bn.srli r6, r3, 0x18
    bn.sbz 0x4(r10), r6
    bn.lwz r3, 0x30(r1)
    bn.lwz r4, 0x34(r1)
    bg.jal 0x2ad165
    bt.mov r22, r3
    bn.sbz 0x9(r10), r3
    bn.srli r6, r3, 0x8
    bn.sbz 0xa(r10), r6
    bn.srli r6, r3, 0x10
    bn.sbz 0xb(r10), r6
    bn.srli r7, r3, 0x18
    bn.sbz 0xc(r10), r7
    bn.lwz r3, 0x20(r1)
    bn.lwz r4, 0x24(r1)
    bg.jal 0x2ad165
    bt.mov r17, r3
    bn.sbz 0x11(r10), r3
    bn.srli r6, r3, 0x8
    bn.sbz 0x12(r10), r6
    bn.srli r6, r3, 0x10
    bn.sbz 0x13(r10), r6
    bn.srli r7, r3, 0x18
    bn.sbz 0x14(r10), r7
    bn.lwz r3, 0x10(r1)
    bn.lwz r4, 0x14(r1)
    bg.jal 0x2ad165
    bt.mov r14, r3
    bn.sbz 0x19(r10), r3
    bn.srli r6, r3, 0x8
    bn.sbz 0x1a(r10), r6
    bn.srli r6, r3, 0x10
    bn.sbz 0x1b(r10), r6
    bn.srli r7, r3, 0x18
    bn.sbz 0x1c(r10), r7
    bn.lwz r3, 0x38(r1)
    bn.lwz r4, 0x3c(r1)
    bg.jal 0x2ad165
    bt.mov r13, r3
    bn.sbz 0x5(r10), r3
    bn.srli r6, r3, 0x8
    bn.sbz 0x6(r10), r6
    bn.srli r6, r3, 0x10
    bn.sbz 0x7(r10), r6
    bn.srli r7, r3, 0x18
    bn.sbz 0x8(r10), r7
    bn.lwz r3, 0x28(r1)
    bn.lwz r4, 0x2c(r1)
    bg.jal 0x2ad165
    bt.mov r12, r3
    bn.sbz 0xd(r10), r3
    bn.srli r6, r3, 0x8
    bn.sbz 0xe(r10), r6
    bn.srli r6, r3, 0x10
    bn.sbz 0xf(r10), r6
    bn.srli r7, r3, 0x18
    bn.sbz 0x10(r10), r7
    bn.lwz r3, 0x18(r1)
    bn.lwz r4, 0x1c(r1)
    bg.jal 0x2ad165
    bt.mov r11, r3
    bn.sbz 0x15(r10), r3
    bn.srli r6, r3, 0x8
    bn.sbz 0x16(r10), r6
    bn.srli r6, r3, 0x10
    bn.sbz 0x17(r10), r6
    bn.srli r7, r3, 0x18
    bn.sbz 0x18(r10), r7
    bn.lwz r3, 0x8(r1)
    bn.lwz r4, 0xc(r1)
    bg.jal 0x2ad165
    bt.mov r4, r3
    bn.sbz 0x1d(r10), r3
    bn.srli r6, r3, 0x8
    bn.sbz 0x1e(r10), r6
    bn.srli r6, r3, 0x10
    bn.sbz 0x1f(r10), r6
    bn.srli r7, r3, 0x18
    bn.sbz 0x20(r10), r7
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x79cf(r7), r6
    bn.sw 0x0(r1), r17
    bn.sw 0x4(r1), r11
    bt.mov r3, r14
    bt.mov r5, r21
    bt.mov r6, r13
    bt.mov r7, r22
    bt.mov r8, r12
    bg.jal 0x28eef4
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2409
    bg.jal 0x27f422
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23f3
    bt.mov r4, r19
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23e2
    bt.mov r4, r20
    bg.jal 0x27f95e
    bt.mov r3, r15
    bt.mov r4, r16
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r4, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23d1
    bg.jal 0x27f95e
    bn.lwz r3, 0x38(r1)
    bn.lwz r4, 0x3c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r4, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23c9
    bg.jal 0x27f95e
    bn.lwz r3, 0x30(r1)
    bn.lwz r4, 0x34(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r4, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23c1
    bg.jal 0x27f95e
    bn.lwz r3, 0x28(r1)
    bn.lwz r4, 0x2c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r4, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23b9
    bg.jal 0x27f95e
    bn.lwz r3, 0x20(r1)
    bn.lwz r4, 0x24(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r4, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23b1
    bg.jal 0x27f95e
    bn.lwz r3, 0x18(r1)
    bn.lwz r4, 0x1c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r4, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23a9
    bg.jal 0x27f95e
    bn.lwz r3, 0x10(r1)
    bn.lwz r4, 0x14(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r4, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x23a1
    bg.jal 0x27f95e
    bn.lwz r3, 0x8(r1)
    bn.lwz r4, 0xc(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acae4
    bg.jal 0x2aad6a
    bn.exthz r4, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2399
    bn.lwz r22, 0x40(r1)
    bn.lwz r21, 0x44(r1)
    bn.lwz r20, 0x48(r1)
    bn.lwz r19, 0x4c(r1)
    bn.lwz r17, 0x50(r1)
    bn.lwz r16, 0x54(r1)
    bn.lwz r15, 0x58(r1)
    bn.lwz r14, 0x5c(r1)
    bn.lwz r13, 0x60(r1)
    bn.lwz r12, 0x64(r1)
    bn.lwz r11, 0x68(r1)
    bn.lwz r10, 0x6c(r1)
    bn.lwz r9, 0x70(r1)
    bn.addi r1, r1, 0x74
    bg.j 0x27f95e
