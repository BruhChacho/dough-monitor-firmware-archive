# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac837,0x2aca43); byte-exact only; hardware untested.
    bn.sw -0x4(r1), r10
    bt.mov r27, r3
    bt.mov r28, r4
    bt.mov r29, r5
    bn.lwz r6, 0x0(r3)
    bn.bleui r6, 0x1, loc_2ac866
    bn.lwz r7, 0x0(r4)
    bn.bleui r7, 0x1, loc_2ac871
    bg.bnei r6, 0x4, loc_2ac86d
    bg.bnei r7, 0x4, loc_2ac866
    bn.lwz r6, 0x4(r3)
    bn.lwz r7, 0x4(r4)
    bg.beq r6, r7, loc_2ac866
    bg.movhi r7, 0x34
    bg.addi r27, r7, -0x49f0
loc_2ac866:
    bt.mov r3, r27
    bn.lwz r10, -0x4(r1)
    bt.jr r9
loc_2ac86d:
    bg.bnei r7, 0x4, loc_2ac87a
loc_2ac871:
    bt.mov r27, r28
    bt.mov r3, r27
    bn.lwz r10, -0x4(r1)
    bt.jr r9
loc_2ac87a:
    bn.bnei r7, 0x2, loc_2ac8b1
    bn.bnei r6, 0x2, loc_2ac866
    bn.sw 0x0(r5), r6
    bn.lwz r7, 0x4(r3)
    bn.sw 0x4(r5), r7
    bn.lwz r7, 0x8(r3)
    bn.sw 0x8(r5), r7
    bn.lwz r7, 0xc(r3)
    bn.sw 0xc(r5), r7
    bn.lwz r7, 0x10(r3)
    bn.sw 0x10(r5), r7
    bn.lwz r7, 0x14(r3)
    bn.sw 0x14(r5), r7
    bn.lwz r7, 0x4(r3)
    bn.lwz r6, 0x4(r4)
    bn.and r7, r7, r6
    bn.sw 0x4(r5), r7
    bt.mov r27, r5
    bt.j loc_2ac866
loc_2ac8b1:
    bn.beqi r6, 0x2, loc_2ac871
    bn.lwz r10, 0x8(r3)
    bn.lwz r2, 0x8(r4)
    bn.lwz r25, 0x10(r3)
    bn.lwz r26, 0x14(r3)
    bn.lwz r23, 0x10(r4)
    bn.lwz r24, 0x14(r4)
    bn.sub r31, r10, r2
    bn.srai r6, r31, 0x1f
    bn.xor r7, r6, r31
    bn.sub r7, r7, r6
    bn.sfgtsi r7, 0x3f
    bn.bnf loc_2ac986
    bg.bgts r10, r2, loc_2aca27
    bt.mov r10, r2
    bt.movi r25, 0x0
    bt.movi r26, 0x0
loc_2ac8e2:
    bn.lwz r3, 0x4(r27)
    bn.lwz r7, 0x4(r28)
    bg.beq r3, r7, loc_2aca14
    bt.mov r5, r23
    bt.mov r6, r24
    bn.sub r5, r5, r25
    bn.subb r6, r6, r26
    bn.bnei r3, 0x0, loc_2ac903
    bt.mov r5, r25
    bt.mov r6, r26
    bn.sub r5, r5, r23
    bn.subb r6, r6, r24
loc_2ac903:
    bg.blesi r6, -0x1, loc_2aca2d
    bn.sw 0x4(r29), r0
    bn.sw 0x8(r29), r10
    bn.sw 0x10(r29), r5
    bn.sw 0x14(r29), r6
loc_2ac913:
    bn.lwz r23, 0x10(r29)
    bn.lwz r24, 0x14(r29)
    bt.mov r7, r23
    bt.mov r8, r24
    bt.addi r7, -0x1
    bg.addci_maybe r8, r8, -0x1
    bn.movhi_2 r6, 0xfff
    bg.ori r6, r6, 0xffff
    bn.sfgtu r8, r6
    bn.bf loc_2ac9d9
    bn.movhi_2 r6, 0xfff
    bg.ori r6, r6, 0xffff
    bn.sfne r8, r6
    bn.bnf loc_2ac9d5
loc_2ac93d:
    bn.lwz r5, 0x8(r29)
loc_2ac940:
    bn.srli r7, r23, 0x1f
    bn.slli r6, r24, 0x1
    bn.or r6, r6, r7
    bn.sw 0x14(r29), r6
    bn.slli r7, r23, 0x1
    bn.sw 0x10(r29), r7
    bt.addi r5, -0x1
    bn.sw 0x8(r29), r5
    bn.lwz r23, 0x10(r29)
    bn.lwz r24, 0x14(r29)
    bt.mov r7, r23
    bt.mov r8, r24
    bt.addi r7, -0x1
    bg.addci_maybe r8, r8, -0x1
    bn.movhi_2 r6, 0xfff
    bg.ori r6, r6, 0xffff
    bn.sfgtu r8, r6
    bn.bf loc_2ac9d9
    bn.movhi_2 r6, 0xfff
    bg.ori r6, r6, 0xffff
    bn.sfne r8, r6
    bn.bf loc_2ac940
    bn.bgtui r7, 0x6, loc_2ac9d9
    bt.j loc_2ac940
loc_2ac986:
    bg.bles r10, r2, loc_2ac9ab
    bt.movi r30, 0x0
loc_2ac98c:
    bn.andi r7, r23, 0x1
    bt.movi r8, 0x0
    bn.slli r4, r24, 0x1f
    bn.srli r5, r23, 0x1
    bn.or r5, r4, r5
    bn.srli r6, r24, 0x1
    bn.or r23, r7, r5
    bn.or r24, r8, r6
    bt.addi r30, 0x1
    bg.bne r31, r30, loc_2ac98c
    bt.add r2, r31
loc_2ac9ab:
    bg.bles r2, r10, loc_2ac8e2
    bt.movi r30, 0x0
    bn.sub r31, r2, r10
loc_2ac9b4:
    bn.andi r7, r25, 0x1
    bt.movi r8, 0x0
    bn.slli r4, r26, 0x1f
    bn.srli r5, r25, 0x1
    bn.or r5, r4, r5
    bn.srli r6, r26, 0x1
    bn.or r25, r7, r5
    bn.or r26, r8, r6
    bt.addi r30, 0x1
    bg.bne r31, r30, loc_2ac9b4
    bt.add r10, r31
    bt.j loc_2ac8e2
loc_2ac9d5:
    bg.bleui r7, 0x1e, loc_2ac93d
loc_2ac9d9:
    bt.movi r7, 0x3
    bn.sw 0x0(r29), r7
    bt.mov r27, r29
    bn.movhi_2 r7, 0x1fff
    bg.ori r7, r7, 0xffff
    bn.sfgtu r24, r7
    bn.bnf loc_2ac866
    bn.andi r5, r23, 0x1
    bt.movi r6, 0x0
    bn.slli r4, r24, 0x1f
    bn.srli r7, r23, 0x1
    bn.or r7, r4, r7
    bn.srli r8, r24, 0x1
    bn.or r4, r5, r7
    bn.sw 0x10(r29), r4
    bn.or r7, r6, r8
    bn.sw 0x14(r29), r7
    bn.lwz r7, 0x8(r29)
    bt.addi r7, 0x1
    bn.sw 0x8(r29), r7
    bt.j loc_2ac866
loc_2aca14:
    bn.sw 0x4(r29), r3
    bn.sw 0x8(r29), r10
    bt.add r23, r25
    bn.addc r24, r24, r26
    bn.sw 0x10(r29), r23
    bn.sw 0x14(r29), r24
    bt.j loc_2ac9d9
loc_2aca27:
    bt.movi r23, 0x0
    bt.movi r24, 0x0
    bt.j loc_2ac8e2
loc_2aca2d:
    bt.movi r7, 0x1
    bn.sw 0x4(r29), r7
    bn.sw 0x8(r29), r10
    bn.sub r5, r0, r5
    bn.subb r6, r0, r6
    bn.sw 0x10(r29), r5
    bn.sw 0x14(r29), r6
    bt.j loc_2ac913
