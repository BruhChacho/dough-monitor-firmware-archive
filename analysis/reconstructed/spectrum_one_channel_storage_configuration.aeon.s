# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2250e8,0x225416); Configure channel storage records through indexed branches, helper calls, and memory writes; external services remain unresolved.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x58
    bn.sw 0x54(r1), r9
    bn.sw 0x50(r1), r10
    bn.sw 0x4c(r1), r11
    bn.sw 0x48(r1), r12
    bn.sw 0x44(r1), r13
    bn.sw 0x40(r1), r14
    bn.sw 0x3c(r1), r15
    bn.sw 0x38(r1), r16
    bn.sw 0x34(r1), r17
    bn.sw 0x30(r1), r18
    bn.sw 0x2c(r1), r19
    bn.sw 0x28(r1), r20
    bn.sw 0x24(r1), r21
    bn.sw 0x20(r1), r22
    bn.ori r6, r0, 0xff
    bn.sw 0x4(r1), r6
    bn.sw 0x8(r1), r6
    bn.sw 0xc(r1), r6
    bt.movi r19, 0x0
    bt.movi r15, 0x0
    bt.movi r21, 0x0
    bt.movi r17, 0x0
    bt.movi r22, 0x0
    bt.movi r16, 0x0
    bt.movi r13, 0x0
    bg.movhi r18, 0x48
    bg.addi r14, r18, 0x21ec
    bn.addi r12, r1, 0x10
loc_22513a:
    bn.extbz r10, r13
    bn.lbz r7, 0x0(r14)
    bg.bnei r7, 0x0, loc_22522f
    bn.sw 0x0(r12), r0
loc_225147:
    bn.lwz r7, 0x0(r12)
    bt.add r17, r7
    bt.addi r13, 0x1
    bg.addi r14, r14, 0xa8
    bt.addi r12, 0x4
    bg.bnei r13, 0x4, loc_22513a
    bg.beqi r16, 0x2, loc_225395
loc_22515c:
    bn.ori r7, r0, 0x19
    bn.muls r7, r16, r7
    bg.ori r6, r0, 0x1a4
    bn.sub r6, r6, r7
    bt.mov r14, r6
    bt.movi r15, 0x0
    bn.movhi_2 r19, 0x520
    bn.movhi_2 r20, 0x520
    bt.movi r13, 0x0
    bn.ori r18, r0, 0xa8
    bt.j loc_2251c6
loc_22517a:
    bg.beqi r16, 0x4, loc_225278
    bg.beqi r16, 0x3, loc_2252e4
    bn.andi r7, r13, 0x1
    bg.beqi r7, 0x0, loc_2252ab
    bn.slli r7, r12, 0x2
    bn.addi r6, r1, 0x20
    bt.add r7, r6
    bn.lwz r10, -0x10(r7)
    bt.mov r5, r10
    bt.movi r6, 0x0
    bt.mov r3, r14
    bt.mov r4, r15
    bg.jal 0x2aacb9
    bt.mov r5, r17
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bn.addi r3, r3, 0x19
    bn.slli r3, r3, 0x14
    bg.movhi r6, 0x8000
    bn.or r7, r20, r6
    bn.sw 0x60(r11), r7
    bn.sw 0x6c(r11), r3
    bn.sw 0x78(r11), r10
    bt.add r20, r3
loc_2251c0:
    bt.addi r13, 0x1
    bg.beqi r13, 0x8, loc_225200
loc_2251c6:
    bn.extbz r7, r13
    bn.srli r12, r7, 0x1
    bn.muls r11, r12, r18
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r11, r7
    bn.lbz r6, 0x0(r11)
    bn.bnei r6, 0x0, loc_22517a
    bn.sw 0x5c(r11), r0
    bn.sw 0x68(r11), r0
    bn.sw 0x74(r11), r0
    bn.sw 0x60(r11), r0
    bn.sw 0x6c(r11), r0
    bn.sw 0x78(r11), r0
    bn.sw 0x64(r11), r0
    bn.sw 0x70(r11), r0
    bn.sw 0x7c(r11), r0
    bt.addi r13, 0x1
    bg.bnei r13, 0x8, loc_2251c6
loc_225200:
    bn.lwz r22, 0x20(r1)
    bn.lwz r21, 0x24(r1)
    bn.lwz r20, 0x28(r1)
    bn.lwz r19, 0x2c(r1)
    bn.lwz r18, 0x30(r1)
    bn.lwz r17, 0x34(r1)
    bn.lwz r16, 0x38(r1)
    bn.lwz r15, 0x3c(r1)
    bn.lwz r14, 0x40(r1)
    bn.lwz r13, 0x44(r1)
    bn.lwz r12, 0x48(r1)
    bn.lwz r11, 0x4c(r1)
    bn.lwz r10, 0x50(r1)
    bn.lwz r9, 0x54(r1)
    bn.addi r1, r1, 0x58
    bt.jr r9
loc_22522f:
    bn.lh r6, 0x1e(r14)
    bn.lh r7, 0x1c(r14)
    bn.muls r11, r6, r7
    bn.sw 0x0(r12), r11
    bt.mov r3, r10
    bg.jal 0x2250c5
    bg.beqi r11, 0x0, loc_2253fb
    bn.andi r7, r3, 0x2
    bn.beqi r7, 0x0, loc_22525a
    bn.lwz r6, 0x8(r1)
    bg.sfnei r6, 0xff
    bn.bnf loc_2253c0
    bn.sw 0xc(r1), r10
    bt.add r22, r11
loc_22525a:
    bn.addi r7, r16, 0x1
    bn.extbz r16, r7
    bg.beqi r16, 0x1, loc_225391
    bn.sfnei r16, 0x2
    bn.cmov_0 r15, r15, r10
loc_22526a:
    bn.beqi r21, 0x0, loc_225271
    bg.ble r11, r21, loc_225147
loc_225271:
    bn.sw 0x4(r1), r10
    bt.mov r21, r11
    bt.j loc_225147
loc_225278:
    bn.andi r7, r13, 0x1
    bg.bnei r7, 0x0, loc_2251c0
    bn.lwz r7, 0x8(r1)
    bg.beq r7, r12, loc_225356
    bn.lwz r6, 0xc(r1)
    bg.beq r6, r12, loc_225356
    bn.slli r7, r12, 0x2
    bn.addi r6, r1, 0x20
    bt.add r7, r6
    bn.lwz r10, -0x10(r7)
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x172
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bn.sub r5, r17, r22
    bt.j loc_22530e
loc_2252ab:
    bn.slli r7, r12, 0x2
    bn.addi r6, r1, 0x20
    bt.add r7, r6
    bn.lwz r10, -0x10(r7)
    bt.mov r5, r10
    bt.movi r6, 0x0
    bt.mov r3, r14
    bt.mov r4, r15
    bg.jal 0x2aacb9
    bt.mov r5, r17
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bn.addi r3, r3, 0x19
    bn.slli r3, r3, 0x14
    bg.movhi r6, 0x4000
    bn.or r7, r19, r6
    bn.sw 0x5c(r11), r7
    bn.sw 0x68(r11), r3
    bn.sw 0x74(r11), r10
    bt.add r19, r3
    bt.j loc_2251c0
loc_2252e4:
    bn.andi r7, r13, 0x1
    bg.bnei r7, 0x0, loc_2251c0
    bn.lwz r7, 0x4(r1)
    bg.beq r7, r12, loc_2253c7
    bn.slli r7, r12, 0x2
    bn.addi r6, r1, 0x20
    bt.add r7, r6
    bn.lwz r10, -0x10(r7)
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x172
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bn.sub r5, r17, r21
loc_22530e:
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bn.addi r3, r3, 0x19
    bn.slli r3, r3, 0x14
    bg.movhi r6, 0x4000
    bn.or r7, r19, r6
    bn.sw 0x5c(r11), r7
    bn.sw 0x68(r11), r3
    bn.sw 0x74(r11), r10
    bt.add r19, r3
loc_22532c:
    bn.muls r7, r12, r18
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lwz r6, 0x5c(r7)
    bn.sw 0x60(r7), r6
    bn.lwz r6, 0x68(r7)
    bn.sw 0x6c(r7), r6
    bn.lwz r6, 0x74(r7)
    bn.sw 0x78(r7), r6
    bn.sw 0x64(r7), r0
    bn.sw 0x70(r7), r0
    bn.sw 0x7c(r7), r0
    bt.j loc_2251c0
loc_225356:
    bn.slli r7, r12, 0x2
    bn.addi r6, r1, 0x20
    bt.add r7, r6
    bn.lwz r10, -0x10(r7)
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x172
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r22
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bn.addi r3, r3, 0x19
    bn.slli r3, r3, 0x14
    bg.movhi r6, 0x8000
    bn.or r7, r20, r6
    bn.sw 0x5c(r11), r7
    bn.sw 0x68(r11), r3
    bn.sw 0x74(r11), r10
    bt.add r20, r3
    bt.j loc_22532c
loc_225391:
    bt.mov r19, r10
    bt.j loc_22526a
loc_225395:
    bn.slli r4, r19, 0x2
    bn.addi r7, r1, 0x20
    bt.add r4, r7
    bn.lwz r5, -0x10(r4)
    bn.slli r23, r15, 0x2
    bt.add r23, r7
    bn.lwz r6, -0x10(r23)
    bg.beq r5, r6, loc_22515c
    bn.slli r7, r6, 0x1
    bg.ble r5, r7, loc_2253e7
    bn.sw -0x10(r4), r13
    bt.movi r7, 0x1
    bn.sw -0x10(r23), r7
    bt.movi r17, 0x5
    bn.j loc_22515c
loc_2253c0:
    bn.sw 0x8(r1), r10
    bt.add r22, r11
    bt.j loc_22525a
loc_2253c7:
    bg.movhi r6, 0x8000
    bn.or r7, r20, r6
    bn.sw 0x5c(r11), r7
    bn.movhi_2 r7, 0x1a40
    bn.sw 0x68(r11), r7
    bn.slli r7, r12, 0x2
    bn.addi r6, r1, 0x20
    bt.add r7, r6
    bn.lwz r7, -0x10(r7)
    bn.sw 0x74(r11), r7
    bt.j loc_22532c
loc_2253e7:
    bn.slli r7, r5, 0x1
    bg.ble r6, r7, loc_22515c
    bt.movi r7, 0x1
    bn.sw -0x10(r4), r7
    bn.sw -0x10(r23), r13
    bt.movi r17, 0x5
    bn.j loc_22515c
loc_2253fb:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bt.movi r6, 0xa
    bn.sh_1 0x1c(r7), r6
    bn.sh_2 0x1e(r7), r6
    bn.j loc_225200
