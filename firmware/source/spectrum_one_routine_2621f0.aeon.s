# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2621f0,0x2623d2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x30
    bn.sw 0x2c(r1), r9
    bn.sw 0x28(r1), r10
    bn.sw 0x24(r1), r11
    bn.sw 0x20(r1), r12
    bn.sw 0x1c(r1), r13
    bn.sw 0x18(r1), r14
    bn.sw 0x14(r1), r15
    bn.sw 0x10(r1), r16
    bn.sw 0xc(r1), r17
    bn.sw 0x8(r1), r18
    bt.mov r15, r3
    bn.sw 0x0(r1), r5
    bn.sw 0x4(r1), r6
    bt.mov r13, r7
    bt.mov r16, r8
    bn.lwz r17, 0x30(r1)
    bn.lh r14, 0x6(r1)
    bn.lh r12, 0x4(r1)
    bn.lh r11, 0x2(r1)
    bn.lh r10, 0x0(r1)
    bg.jal 0x2227da
    bt.mov r18, r3
    bt.movi r7, 0x1
    bn.sbz 0x0(r13), r7
    bn.sh_1 0x0(r16), r10
    bn.sh_2 0x2(r16), r11
    bn.sh_1 0x4(r16), r12
    bn.sh_2 0x6(r16), r14
    bt.mov r3, r15
    bt.movi r4, 0x1
    bg.jal 0x23e7e0
    bg.movhi r10, 0x3b
    bg.lwz r6, 0x5f38(r10)
    bn.lbz r7, 0x59(r6)
    bn.bnei r7, 0x0, loc_2622ab
    bn.lbz r7, 0x5a(r6)
    bt.add r7, r6
    bn.ori r6, r0, 0xb0
    bn.lbz r7, 0x5b(r7)
    bn.muls r6, r6, r7
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r6, r23
    bg.lbz r7, 0x8a(r6)
    bn.bnei r7, 0x0, loc_262280
    bg.lbz r6, 0x8b(r6)
    bg.beqi r6, 0x0, loc_2623b0
loc_262280:
    bt.mov r3, r16
    bt.mov r4, r17
    bt.movi r5, 0x2
loc_262286:
    bn.lwz r18, 0x8(r1)
    bn.lwz r17, 0xc(r1)
    bn.lwz r16, 0x10(r1)
    bn.lwz r15, 0x14(r1)
    bn.lwz r14, 0x18(r1)
    bn.lwz r13, 0x1c(r1)
    bn.lwz r12, 0x20(r1)
    bn.lwz r11, 0x24(r1)
    bn.lwz r10, 0x28(r1)
    bn.lwz r9, 0x2c(r1)
    bn.addi r1, r1, 0x30
    bg.j 0x26049f
loc_2622ab:
    bn.lh r5, 0x4(r17)
    bn.lh r4, 0x6(r17)
    bn.lwz r6, 0x4(r16)
    bn.movhi_2 r23, 0x1e0
    bg.ori r23, r23, 0x280
    bn.sfeq r6, r23
    bn.bf loc_26234b
    bn.movhi_2 r7, 0x1e0
    bg.ori r7, r7, 0x2d0
    bn.sfne r6, r7
    bn.bnf loc_26234b
    bn.movhi_2 r23, 0x258
    bg.ori r23, r23, 0x320
    bn.sfeq r6, r23
    bn.bf loc_26239e
    bt.movi r7, 0x1
    bn.movhi_2 r23, 0x5a0
    bg.ori r23, r23, 0xa00
    bn.sfeq r6, r23
    bn.bnf loc_26235a
loc_2622ea:
    bt.movi r7, 0x3
    bn.lh r23, 0x4(r16)
    bn.muls r6, r7, r23
    bn.srai r6, r6, 0x2
    bn.lh r16, 0x6(r16)
    bn.muls r7, r7, r16
    bn.srai r3, r7, 0x2
loc_2622fe:
    bt.movi r23, -0x4
    bn.and r7, r6, r23
    bn.sh_1 0x4(r17), r7
    bn.sh_2 0x6(r17), r3
    bn.sub r7, r5, r6
    bn.srli r7, r7, 0x1
    bn.and r7, r7, r23
    bn.lh r6, 0x0(r17)
    bt.add r7, r6
    bn.sh_1 0x0(r17), r7
    bn.sub r7, r4, r3
    bn.srli r7, r7, 0x1
    bn.lh r23, 0x2(r17)
    bt.add r7, r23
    bn.sh_2 0x2(r17), r7
    bn.lwz r18, 0x8(r1)
    bn.lwz r17, 0xc(r1)
    bn.lwz r16, 0x10(r1)
    bn.lwz r15, 0x14(r1)
    bn.lwz r14, 0x18(r1)
    bn.lwz r13, 0x1c(r1)
    bn.lwz r12, 0x20(r1)
    bn.lwz r11, 0x24(r1)
    bn.lwz r10, 0x28(r1)
    bn.lwz r9, 0x2c(r1)
    bn.addi r1, r1, 0x30
    bt.jr r9
loc_26234b:
    bt.movi r7, 0x2
    bn.movhi_2 r23, 0x5a0
    bg.ori r23, r23, 0xa00
    bn.sfeq r6, r23
    bn.bf loc_2622ea
loc_26235a:
    bn.movhi_2 r23, 0x780
    bg.ori r23, r23, 0xa00
    bn.sfne r6, r23
    bn.bnf loc_2622ea
    bn.movhi_2 r23, 0x870
    bg.ori r23, r23, 0xb40
    bn.sfeq r6, r23
    bn.bf loc_2623a2
    bn.movhi_2 r23, 0x708
    bg.ori r23, r23, 0xc80
    bn.sfeq r6, r23
    bn.bf loc_2623a2
    bt.mov r3, r7
    bn.movhi_2 r7, 0x870
    bg.ori r7, r7, 0xf00
    bn.sfeq r6, r7
    bn.bf loc_2623a2
loc_262390:
    bn.lh r23, 0x4(r16)
    bn.muls r6, r3, r23
    bn.lh r16, 0x6(r16)
    bn.muls r3, r3, r16
    bt.j loc_2622fe
loc_26239e:
    bt.movi r3, 0x2
    bt.j loc_262390
loc_2623a2:
    bn.lh r7, 0x4(r16)
    bn.srli r6, r7, 0x1
    bn.lh r7, 0x6(r16)
    bn.srli r3, r7, 0x1
    bt.j loc_2622fe
loc_2623b0:
    bg.jal 0x2686dd
    bn.beqi r3, 0x0, loc_2623c3
    bg.lwz r7, 0x5f38(r10)
    bg.lbz r7, 0xa8(r7)
    bg.beqi r7, 0x1, loc_262280
loc_2623c3:
    bg.lwz r7, 0x5f38(r10)
    bt.add r7, r18
    bt.mov r3, r16
    bt.mov r4, r17
    bn.lbz r5, 0x50(r7)
    bt.j loc_262286
