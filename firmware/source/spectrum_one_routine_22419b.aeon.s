# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22419b,0x2245e6); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bn.sw 0x24(r1), r12
    bn.sw 0x20(r1), r13
    bn.sw 0x1c(r1), r14
    bn.sw 0x18(r1), r15
    bn.sw 0x14(r1), r16
    bn.sw 0x10(r1), r17
    bn.sw 0xc(r1), r18
    bn.sw 0x8(r1), r19
    bn.sw 0x4(r1), r20
    bn.sw 0x0(r1), r21
    bt.mov r16, r3
    bt.mov r18, r4
    bg.jal 0x2227ef
    bt.mov r19, r3
    bn.ori r7, r0, 0xa8
    bn.muls r10, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r10, r5
    bn.lh r13, 0x14(r10)
    bn.lh r17, 0x1c(r10)
    bt.movi r7, 0x1
    bn.sll r21, r7, r16
    bn.lh r6, 0x2c(r10)
    bn.or r7, r21, r6
    bn.sh_1 0x2c(r10), r7
    bg.lbz r4, 0xa5(r10)
    bg.movhi r20, 0x48
    bn.ori r7, r0, 0x7c
    bn.muls r6, r16, r7
    bg.addi r5, r20, -0x564
    bn.add r11, r6, r5
    bn.sbz 0x70(r11), r4
    bn.muls r7, r18, r7
    bn.add r12, r7, r5
    bn.sbz 0x70(r12), r4
    bt.mov r3, r16
    bg.jal 0x222b9f
    bt.mov r3, r18
    bg.jal 0x222b9f
    bn.lwz r7, 0x10(r10)
    bn.sw 0x20(r11), r7
    bn.lwz r7, 0x14(r10)
    bn.sw 0x24(r11), r7
    bn.lh r6, 0x18(r10)
    bn.sh_1 0x4c(r11), r6
    bn.lh r5, 0x1a(r10)
    bn.sh_2 0x4e(r11), r5
    bg.ori r7, r0, 0x780
    bn.sub r7, r7, r6
    bn.sh_1 0x50(r11), r7
    bn.lh r14, 0x1e(r10)
    bn.sh_2 0x52(r11), r14
    bn.sh_1 0x4c(r12), r0
    bn.sh_2 0x4e(r12), r5
    bn.lh r15, 0x1c(r10)
    bn.sub r7, r15, r7
    bn.sh_1 0x50(r12), r7
    bn.sh_2 0x52(r12), r14
    bn.sbz 0x32(r11), r16
    bn.sbz 0x32(r12), r16
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_224456
    bn.lh r10, 0x14(r10)
    bg.bgt r10, r15, loc_2243a2
    bn.ori r17, r0, 0x7c
    bn.muls r11, r16, r17
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r11, r7
    bn.sh_1 0x38(r11), r13
    bn.sh_1 0x40(r11), r13
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_2245c3
loc_224298:
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r15
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.muls r7, r18, r17
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_1 0x38(r7), r0
    bn.sh_1 0x40(r7), r13
    bn.lh r6, 0x40(r11)
    bn.sub r3, r6, r3
    bn.sh_1 0x48(r7), r3
    bn.sh_1 0x34(r11), r0
    bn.sh_1 0x44(r11), r0
    bn.sh_1 0x34(r7), r0
    bn.lh r6, 0x48(r11)
    bn.sh_1 0x44(r7), r6
    bn.ori r7, r0, 0xa8
    bn.muls r10, r19, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bn.lh r11, 0x16(r10)
    bg.bgt r11, r14, loc_224411
loc_2242ff:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r16, r7
    bg.addi r5, r20, -0x564
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r11
    bn.sh_2 0x42(r6), r11
    bn.sh_2 0x4a(r6), r11
    bn.muls r7, r18, r7
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r0
    bn.sh_2 0x42(r7), r11
    bn.sh_2 0x4a(r7), r11
loc_224322:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r19, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lbz r5, 0x38(r6)
    bn.beqi r5, 0x0, loc_22436f
    bt.movi r7, 0x1
    bn.sll r7, r7, r18
    bn.lh r5, 0x2c(r6)
    bn.or r7, r7, r5
    bn.sh_1 0x2c(r6), r7
    bn.ori r7, r0, 0x7c
    bn.muls r5, r18, r7
    bg.addi r6, r20, -0x564
    bt.add r5, r6
    bn.muls r7, r16, r7
    bt.add r7, r6
    bn.lwz r6, 0x20(r7)
    bn.sw 0x20(r5), r6
    bn.lwz r6, 0x24(r7)
    bn.sw 0x24(r5), r6
    bn.lwz r6, 0x34(r7)
    bn.sw 0x34(r5), r6
    bn.lwz r7, 0x38(r7)
    bn.sw 0x38(r5), r7
loc_22436f:
    bt.mov r3, r19
    bn.exthz r4, r21
    bn.lwz r21, 0x0(r1)
    bn.lwz r20, 0x4(r1)
    bn.lwz r19, 0x8(r1)
    bn.lwz r18, 0xc(r1)
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x223fb3
loc_2243a2:
    bn.sh_1 0x38(r11), r17
    bn.sh_1 0x40(r11), r17
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r13, r3
    bg.blesi r10, -0x1, loc_2245b6
loc_2243b7:
    bt.mov r3, r17
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r13
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r15
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.sh_1 0x38(r12), r0
    bn.sh_1 0x40(r12), r17
    bn.lh r6, 0x40(r11)
    bn.sub r3, r6, r3
    bn.sh_1 0x48(r12), r3
    bn.sh_1 0x34(r11), r0
    bn.sh_1 0x44(r11), r0
    bn.sh_1 0x34(r12), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r12), r7
    bn.ori r7, r0, 0xa8
    bn.muls r10, r19, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bn.lh r11, 0x16(r10)
    bg.ble r11, r14, loc_2242ff
loc_224411:
    bt.mov r3, r19
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.bnei r7, 0x0, loc_2244fb
loc_224431:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r16, r7
    bg.addi r5, r20, -0x564
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r14
    bn.sh_2 0x42(r6), r14
    bn.sh_2 0x4a(r6), r14
    bn.muls r7, r18, r7
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r0
    bn.sh_2 0x42(r7), r14
    bn.sh_2 0x4a(r7), r14
    bt.j loc_224322
loc_224456:
    bn.lh r7, 0x14(r10)
    bg.ori r5, r0, 0xfffc
    bn.and r4, r7, r5
    bn.and r7, r14, r5
    bg.ble r4, r7, loc_224505
    bn.sh_1 0x38(r11), r7
    bn.sh_2 0x42(r11), r7
    bn.sh_2 0x4a(r11), r7
    bn.sh_1 0x38(r12), r0
    bn.sh_2 0x42(r12), r7
    bn.sh_2 0x4a(r12), r7
    bn.sh_1 0x34(r11), r0
    bn.sh_1 0x34(r12), r0
    bn.ori r7, r0, 0xa8
    bn.muls r7, r19, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r13, 0x16(r7)
    bg.ble r13, r15, loc_224545
loc_224496:
    bn.ori r13, r0, 0x7c
    bn.muls r11, r16, r13
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r11, r7
    bn.sh_2 0x3a(r11), r15
    bn.sh_1 0x40(r11), r15
    bt.mov r3, r15
    bg.jal 0x2ac120
    bt.mov r12, r3
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_2245d0
loc_2244c1:
    bt.mov r4, r12
    bg.jal 0x2abe2e
    bt.mov r4, r12
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.muls r6, r18, r13
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r0
    bn.sh_1 0x40(r6), r15
    bn.lh r7, 0x40(r11)
    bn.sub r3, r7, r3
    bn.sh_1 0x48(r6), r3
    bn.sh_1 0x44(r11), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r6), r7
    bt.j loc_224322
loc_2244fb:
    bg.lbz r10, 0xa4(r10)
    bg.beqi r10, 0x0, loc_2242ff
    bt.j loc_224431
loc_224505:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r16, r7
    bg.addi r5, r20, -0x564
    bt.add r6, r5
    bn.sh_1 0x38(r6), r4
    bn.sh_2 0x42(r6), r4
    bn.sh_2 0x4a(r6), r4
    bn.muls r7, r18, r7
    bt.add r7, r5
    bn.sh_1 0x38(r7), r0
    bn.sh_2 0x42(r7), r4
    bn.sh_2 0x4a(r7), r4
    bn.sh_1 0x34(r6), r0
    bn.sh_1 0x34(r7), r0
    bn.ori r7, r0, 0xa8
    bn.muls r7, r19, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r13, 0x16(r7)
    bg.bgt r13, r15, loc_224496
loc_224545:
    bn.ori r14, r0, 0x7c
    bn.muls r11, r16, r14
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r11, r5
    bn.sh_2 0x3a(r11), r13
    bn.sh_1 0x40(r11), r13
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bn.blesi r10, -0x1, loc_2245da
loc_224569:
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r15
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.muls r6, r18, r14
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r6, r7
    bn.sh_2 0x3a(r6), r0
    bn.sh_1 0x40(r6), r13
    bn.lh r5, 0x40(r11)
    bn.sub r3, r5, r3
    bn.sh_1 0x48(r6), r3
    bn.sh_1 0x44(r11), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r6), r7
    bn.j loc_224322
loc_2245b6:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r13, r3
    bn.j loc_2243b7
loc_2245c3:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bn.j loc_224298
loc_2245d0:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.j loc_2244c1
loc_2245da:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bt.j loc_224569
