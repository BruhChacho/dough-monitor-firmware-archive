# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2acae4,0x2acd5b); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x8c
    bg.sw_0 0x88(r1), r9
    bg.sw_0 0x84(r1), r10
    bg.sw_0 0x80(r1), r11
    bn.sw 0x7c(r1), r12
    bn.sw 0x78(r1), r13
    bn.sw 0x74(r1), r14
    bn.sw 0x70(r1), r15
    bn.sw 0x6c(r1), r16
    bn.sw 0x68(r1), r17
    bn.sw 0x64(r1), r18
    bn.sw 0x60(r1), r19
    bn.sw 0x5c(r1), r20
    bn.sw 0x58(r1), r21
    bn.sw 0x50(r1), r3
    bn.sw 0x54(r1), r4
    bn.sw 0x48(r1), r5
    bn.sw 0x4c(r1), r6
    bn.addi r10, r1, 0x30
    bn.addi r3, r1, 0x50
    bt.mov r4, r10
    bg.jal 0x2ac756
    bn.addi r12, r1, 0x18
    bn.addi r3, r1, 0x48
    bt.mov r4, r12
    bg.jal 0x2ac756
    bn.lwz r7, 0x30(r1)
    bn.bleui r7, 0x1, loc_2acb63
    bn.lwz r6, 0x18(r1)
    bn.bleui r6, 0x1, loc_2acb4d
    bg.beqi r7, 0x4, loc_2acb60
    bg.bnei r6, 0x4, loc_2acbb2
    bn.beqi r7, 0x2, loc_2acba8
loc_2acb4d:
    bn.lwz r7, 0x34(r1)
    bn.lwz r6, 0x1c(r1)
    bn.sfeq r7, r6
    bn.cmovsi_2 r7, r0, 0x1
    bn.sw 0x1c(r1), r7
    bt.mov r3, r12
    bt.j loc_2acb74
loc_2acb60:
    bn.beqi r6, 0x2, loc_2acba8
loc_2acb63:
    bn.lwz r7, 0x34(r1)
    bn.lwz r6, 0x1c(r1)
    bn.sfeq r7, r6
    bn.cmovsi_2 r7, r0, 0x1
    bn.sw 0x34(r1), r7
    bt.mov r3, r10
loc_2acb74:
    bg.jal 0x2ac55d
    bn.lwz r21, 0x58(r1)
    bn.lwz r20, 0x5c(r1)
    bn.lwz r19, 0x60(r1)
    bn.lwz r18, 0x64(r1)
    bn.lwz r17, 0x68(r1)
    bn.lwz r16, 0x6c(r1)
    bn.lwz r15, 0x70(r1)
    bn.lwz r14, 0x74(r1)
    bn.lwz r13, 0x78(r1)
    bn.lwz r12, 0x7c(r1)
    bg.lwz r11, 0x80(r1)
    bg.lwz r10, 0x84(r1)
    bg.lwz r9, 0x88(r1)
    bg.addi r1, r1, 0x8c
    bt.jr r9
loc_2acba8:
    bg.movhi r7, 0x34
    bg.addi r3, r7, -0x49f0
    bt.j loc_2acb74
loc_2acbb2:
    bn.beqi r7, 0x2, loc_2acb63
    bn.beqi r6, 0x2, loc_2acb4d
    bn.lwz r14, 0x40(r1)
    bn.lwz r15, 0x44(r1)
    bn.lwz r10, 0x28(r1)
    bn.lwz r11, 0x2c(r1)
    bt.mov r16, r10
    bt.movi r17, 0x0
    bt.movi r13, 0x0
    bt.mov r3, r10
    bt.mov r4, r17
    bt.mov r5, r14
    bt.mov r6, r13
    bg.jal 0x2aacb9
    bt.mov r20, r3
    bt.mov r21, r4
    bt.mov r10, r11
    bt.movi r11, 0x0
    bt.mov r18, r10
    bt.movi r19, 0x0
    bt.mov r3, r14
    bt.mov r4, r13
    bt.mov r5, r10
    bt.mov r6, r19
    bg.jal 0x2aacb9
    bt.mov r12, r3
    bt.mov r13, r4
    bt.mov r10, r15
    bt.mov r3, r16
    bt.mov r4, r17
    bt.mov r5, r15
    bt.mov r6, r11
    bg.jal 0x2aacb9
    bt.mov r14, r12
    bt.mov r15, r13
    bt.add r14, r3
    bn.addc r15, r15, r4
    bg.bgt r13, r15, loc_2acd20
    bg.beq r13, r15, loc_2acd1c
loc_2acc11:
    bt.movi r16, 0x0
    bt.movi r17, 0x0
loc_2acc15:
    bt.movi r5, 0x0
    bt.mov r12, r5
    bt.mov r13, r14
    bt.add r12, r20
    bn.addc r13, r13, r21
    bg.bgt r21, r13, loc_2acd15
    bg.beq r21, r13, loc_2acd11
loc_2acc28:
    bt.mov r3, r18
    bt.mov r4, r19
    bt.mov r5, r10
    bt.mov r6, r11
    bg.jal 0x2aacb9
    bt.movi r8, 0x0
    bt.mov r23, r15
    bt.mov r24, r8
    bt.add r23, r3
    bn.addc r24, r24, r4
    bt.add r23, r16
    bn.addc r24, r24, r17
    bn.lwz r6, 0x38(r1)
    bt.addi r6, 0x4
    bn.lwz r7, 0x20(r1)
    bt.add r7, r6
    bn.sw 0x8(r1), r7
    bn.sw 0x4(r1), r0
    bn.lwz r6, 0x34(r1)
    bn.lwz r7, 0x1c(r1)
    bg.beq r6, r7, loc_2acc63
    bt.movi r7, 0x1
    bn.sw 0x4(r1), r7
loc_2acc63:
    bn.movhi_2 r6, 0x1fff
    bg.ori r6, r6, 0xffff
    bn.sfgtu r24, r6
    bn.bnf loc_2accb0
    bn.lwz r5, 0x8(r1)
loc_2acc73:
    bn.andi r7, r23, 0x1
    bn.beqi r7, 0x0, loc_2acc8e
    bn.slli r6, r13, 0x1f
    bn.srli r7, r12, 0x1
    bn.or r7, r6, r7
    bn.srli r8, r13, 0x1
    bt.mov r12, r7
    bg.movhi r6, 0x8000
    bn.or r13, r8, r6
loc_2acc8e:
    bn.slli r6, r24, 0x1f
    bn.srli r7, r23, 0x1
    bn.or r7, r6, r7
    bn.srli r8, r24, 0x1
    bt.mov r23, r7
    bt.mov r24, r8
    bt.addi r5, 0x1
    bn.movhi_2 r7, 0x1fff
    bg.ori r7, r7, 0xffff
    bn.sfgtu r8, r7
    bn.bf loc_2acc73
    bn.sw 0x8(r1), r5
loc_2accb0:
    bn.movhi_2 r6, 0xfff
    bg.ori r6, r6, 0xffff
    bn.sfgtu r24, r6
    bn.bf loc_2accf6
    bn.lwz r5, 0x8(r1)
loc_2accc0:
    bn.srli r6, r23, 0x1f
    bn.slli r8, r24, 0x1
    bn.or r8, r6, r8
    bn.slli r7, r23, 0x1
    bt.mov r23, r7
    bt.mov r24, r8
    bg.blesi r13, -0x1, loc_2acd52
loc_2accd4:
    bn.srli r6, r12, 0x1f
    bn.slli r8, r13, 0x1
    bn.or r8, r6, r8
    bn.slli r7, r12, 0x1
    bt.mov r12, r7
    bt.mov r13, r8
    bt.addi r5, -0x1
    bn.movhi_2 r7, 0xfff
    bg.ori r7, r7, 0xffff
    bn.sfgtu r24, r7
    bn.bnf loc_2accc0
    bn.sw 0x8(r1), r5
loc_2accf6:
    bn.andi r7, r23, 0xff
    bt.movi r8, 0x0
    bg.sfnei r7, 0x80
    bn.bnf loc_2acd26
loc_2acd02:
    bn.sw 0x10(r1), r23
    bn.sw 0x14(r1), r24
    bt.movi r7, 0x3
    bn.sw 0x0(r1), r7
    bt.mov r3, r1
    bt.j loc_2acb74
loc_2acd11:
    bg.ble r20, r12, loc_2acc28
loc_2acd15:
    bt.addi r16, 0x1
    bn.addc r17, r17, r0
    bt.j loc_2acc28
loc_2acd1c:
    bg.ble r12, r14, loc_2acc11
loc_2acd20:
    bt.movi r16, 0x0
    bt.movi r17, 0x1
    bt.j loc_2acc15
loc_2acd26:
    bn.bnei r8, 0x0, loc_2acd02
    bg.ori r6, r0, 0x100
    bn.and r7, r23, r6
    bn.or r7, r7, r8
    bn.bnei r7, 0x0, loc_2acd02
    bn.or r7, r12, r13
    bn.beqi r7, 0x0, loc_2acd02
    bt.mov r7, r23
    bt.mov r8, r24
    bg.addi r7, r7, 0x80
    bn.addc r8, r8, r0
    bg.addi r6, r0, -0x100
    bn.and r23, r7, r6
    bt.mov r24, r8
    bt.j loc_2acd02
loc_2acd52:
    bn.ori r7, r7, 0x1
    bt.mov r23, r7
    bt.mov r24, r8
    bt.j loc_2accd4
