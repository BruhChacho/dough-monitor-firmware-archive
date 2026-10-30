# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22dc46,0x22dd9a); Initialize selected records among thirteen stride124 records, optionally configure register paths, then prepare masks.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x38
    bn.sw 0x34(r1), r9
    bn.sw 0x30(r1), r10
    bn.sw 0x2c(r1), r11
    bn.sw 0x28(r1), r12
    bn.sw 0x24(r1), r13
    bn.sw 0x20(r1), r14
    bn.sw 0x1c(r1), r15
    bn.sw 0x18(r1), r16
    bn.sw 0x14(r1), r17
    bn.sw 0x10(r1), r18
    bn.sw 0xc(r1), r19
    bn.sw 0x8(r1), r20
    bn.sw 0x4(r1), r21
    bn.sw 0x0(r1), r22
    bt.mov r21, r3
    bt.mov r22, r4
    bt.movi r18, 0x0
    bg.movhi r7, 0x48
    bg.addi r10, r7, -0x55c
    bg.movhi r7, 0x2b
    bg.lbz r20, -0x9e0(r7)
    bg.addi r7, r7, -0x9e0
    bn.lbz r17, 0x1(r7)
    bn.lbz r16, 0x2(r7)
    bn.lbz r15, 0x3(r7)
    bn.lbz r14, 0x4(r7)
    bn.lbz r13, 0x5(r7)
    bn.lbz r12, 0x6(r7)
    bn.lbz r11, 0x7(r7)
    bt.j loc_22dcad
loc_22dca4:
    bt.addi r18, 0x1
    bn.addi r10, r10, 0x7c
    bg.beqi r18, 0xd, loc_22dd65
loc_22dcad:
    bn.extbz r19, r18
    bn.sra r7, r21, r18
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22dca4
    bn.sw 0x0(r10), r0
    bn.sbz 0x18(r10), r20
    bn.sbz 0x19(r10), r17
    bn.sbz 0x1a(r10), r16
    bn.sbz 0x1b(r10), r15
    bn.sbz 0x1c(r10), r14
    bn.sbz 0x1d(r10), r13
    bn.sbz 0x1e(r10), r12
    bn.sbz 0x1f(r10), r11
    bn.sbz 0x44(r10), r20
    bn.sbz 0x45(r10), r17
    bn.sbz 0x46(r10), r16
    bn.sbz 0x47(r10), r15
    bn.sbz 0x48(r10), r14
    bn.sbz 0x49(r10), r13
    bn.sbz 0x4a(r10), r12
    bn.sbz 0x4b(r10), r11
    bn.sbz 0x2a(r10), r19
    bn.sbz 0x34(r10), r20
    bn.sbz 0x35(r10), r17
    bn.sbz 0x36(r10), r16
    bn.sbz 0x37(r10), r15
    bn.sbz 0x38(r10), r14
    bn.sbz 0x39(r10), r13
    bn.sbz 0x3a(r10), r12
    bn.sbz 0x3b(r10), r11
    bn.sbz 0x2c(r10), r20
    bn.sbz 0x2d(r10), r17
    bn.sbz 0x2e(r10), r16
    bn.sbz 0x2f(r10), r15
    bn.sbz 0x30(r10), r14
    bn.sbz 0x31(r10), r13
    bn.sbz 0x32(r10), r12
    bn.sbz 0x33(r10), r11
    bn.sbz 0x3c(r10), r20
    bn.sbz 0x3d(r10), r17
    bn.sbz 0x3e(r10), r16
    bn.sbz 0x3f(r10), r15
    bn.sbz 0x40(r10), r14
    bn.sbz 0x41(r10), r13
    bn.sbz 0x42(r10), r12
    bn.sbz 0x43(r10), r11
    bn.sbz 0x21(r10), r0
    bt.movi r7, 0x4
    bn.sbz 0x8(r10), r7
    bn.sbz 0x50(r10), r0
    bn.sbz 0x4c(r10), r0
    bn.sbz 0x4d(r10), r0
    bg.beqi r22, 0x0, loc_22dca4
    bt.mov r3, r19
    bt.movi r4, 0x1
    bg.jal 0x22d986
    bt.movi r3, 0x1
    bt.mov r4, r19
    bg.jal 0x220a8b
    bt.addi r18, 0x1
    bn.addi r10, r10, 0x7c
    bg.bnei r18, 0xd, loc_22dcad
loc_22dd65:
    bt.movi r3, 0x0
    bt.mov r4, r21
    bn.lwz r22, 0x0(r1)
    bn.lwz r21, 0x4(r1)
    bn.lwz r20, 0x8(r1)
    bn.lwz r19, 0xc(r1)
    bn.lwz r18, 0x10(r1)
    bn.lwz r17, 0x14(r1)
    bn.lwz r16, 0x18(r1)
    bn.lwz r15, 0x1c(r1)
    bn.lwz r14, 0x20(r1)
    bn.lwz r13, 0x24(r1)
    bn.lwz r12, 0x28(r1)
    bn.lwz r11, 0x2c(r1)
    bn.lwz r10, 0x30(r1)
    bn.lwz r9, 0x34(r1)
    bn.addi r1, r1, 0x38
    bg.j 0x23d3a0
