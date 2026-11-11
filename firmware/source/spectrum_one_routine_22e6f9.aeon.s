# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22e6f9,0x22ea26); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x48
    bn.sw 0x44(r1), r9
    bn.sw 0x40(r1), r10
    bn.sw 0x3c(r1), r11
    bn.sw 0x38(r1), r12
    bn.sw 0x34(r1), r13
    bn.sw 0x30(r1), r14
    bn.sw 0x2c(r1), r15
    bn.sw 0x28(r1), r16
    bn.sw 0x24(r1), r17
    bn.sw 0x20(r1), r18
    bn.sw 0x1c(r1), r19
    bn.sw 0x18(r1), r20
    bn.sw 0x14(r1), r21
    bn.sw 0x10(r1), r22
    bt.mov r17, r3
    bt.mov r15, r4
    bn.sw 0x8(r1), r5
    bn.sw 0xc(r1), r6
    bn.lh r14, 0x8(r1)
    bg.jal 0x2227ef
    bt.mov r20, r3
    bn.ori r7, r0, 0xa8
    bn.muls r10, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r10, r5
    bn.lh r6, 0x2c(r10)
    bn.lh r7, 0x2a(r10)
    bn.xor r7, r6, r7
    bn.andi r6, r6, 0xf
    bn.and r11, r7, r6
    bg.bnei r11, 0x0, loc_22e92f
    bg.beqi r15, 0x4, loc_22e956
loc_22e760:
    bt.mov r3, r17
    bg.jal 0x222b9f
    bt.mov r3, r15
    bg.jal 0x222b9f
    bt.movi r13, 0x1
    bn.sll r6, r13, r17
    bn.sw 0x4(r1), r6
    bn.sll r22, r13, r15
    bn.or r6, r6, r22
    bn.exths r6, r6
    bn.ori r7, r0, 0xa8
    bn.muls r11, r20, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r11, r7
    bn.lh r5, 0x2c(r11)
    bn.or r7, r6, r5
    bn.sh_1 0x2c(r11), r7
    bn.lh r7, 0x2a(r11)
    bn.or r6, r6, r7
    bn.sh_2 0x2a(r11), r6
    bg.lbz r4, 0xa5(r11)
    bg.movhi r21, 0x48
    bn.ori r6, r0, 0x7c
    bn.muls r7, r17, r6
    bg.addi r5, r21, -0x564
    bt.add r7, r5
    bn.sbz 0x70(r7), r4
    bn.muls r6, r15, r6
    bn.add r12, r6, r5
    bn.sbz 0x10(r12), r20
    bt.movi r7, 0x3
    bn.sw 0x8(r12), r7
    bn.lbz r7, 0x29(r11)
    bn.sbz 0xe(r12), r7
    bn.sbz 0x70(r12), r4
    bn.lbz r5, 0x29(r12)
    bg.beqi r5, 0x1, loc_22e9f7
loc_22e7d4:
    bn.sbz 0x29(r12), r13
    bn.lbz r3, 0x28(r11)
    bt.mov r4, r15
    bg.jal 0x22701c
loc_22e7e0:
    bn.ori r5, r0, 0x7c
    bn.muls r7, r17, r5
    bg.addi r23, r21, -0x564
    bn.add r11, r7, r23
    bn.ori r6, r0, 0xa8
    bn.muls r6, r20, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lh r7, 0x10(r6)
    bn.sh_1 0x20(r11), r7
    bn.lh r4, 0x12(r6)
    bn.sh_2 0x22(r11), r4
    bn.lh r16, 0x14(r6)
    bn.srli r7, r16, 0x1
    bn.sh_1 0x24(r11), r7
    bn.lh r18, 0x16(r6)
    bn.sh_2 0x26(r11), r18
    bn.muls r5, r15, r5
    bt.add r5, r23
    bn.sh_1 0x20(r5), r14
    bn.sh_2 0x22(r5), r4
    bn.sh_1 0x24(r5), r7
    bn.sh_2 0x26(r5), r18
    bn.lh r7, 0x18(r6)
    bn.sh_1 0x4c(r11), r7
    bn.lh r4, 0x1a(r6)
    bn.sh_2 0x4e(r11), r4
    bn.lh r23, 0x1c(r6)
    bn.srli r7, r23, 0x1
    bn.sh_1 0x50(r11), r7
    bn.lh r19, 0x1e(r6)
    bn.sh_2 0x52(r11), r19
    bn.sh_1 0x4c(r5), r0
    bn.sh_2 0x4e(r5), r4
    bn.sh_1 0x50(r5), r7
    bn.sh_2 0x52(r5), r19
    bn.sbz 0x32(r11), r17
    bn.sbz 0x32(r5), r17
    bg.ori r5, r0, 0xff80
    bn.and r14, r16, r5
    bn.and r13, r23, r5
    bg.ble r14, r13, loc_22e97e
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_22ea1a
loc_22e873:
    bt.mov r3, r13
loc_22e875:
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r16
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x38(r11), r3
    bn.sh_1 0x40(r11), r3
    bn.sh_1 0x48(r11), r3
    bg.bgt r18, r19, loc_22e99a
loc_22e8a5:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sh_2 0x3a(r7), r18
    bn.sh_2 0x42(r7), r18
    bn.sh_2 0x4a(r7), r18
loc_22e8be:
    bn.ori r7, r0, 0x7c
    bn.muls r5, r15, r7
    bg.addi r6, r21, -0x564
    bt.add r5, r6
    bn.muls r7, r17, r7
    bt.add r7, r6
    bn.lwz r6, 0x34(r7)
    bn.sw 0x34(r5), r6
    bn.lwz r6, 0x38(r7)
    bn.sw 0x38(r5), r6
    bn.lwz r6, 0x3c(r7)
    bn.sw 0x3c(r5), r6
    bn.lwz r6, 0x40(r7)
    bn.sw 0x40(r5), r6
    bn.lwz r6, 0x44(r7)
    bn.sw 0x44(r5), r6
    bn.lwz r7, 0x48(r7)
    bn.sw 0x48(r5), r7
    bt.mov r3, r20
    bn.lwz r7, 0x4(r1)
    bn.exthz r4, r7
    bn.exthz r5, r22
    bn.lwz r22, 0x10(r1)
    bn.lwz r21, 0x14(r1)
    bn.lwz r20, 0x18(r1)
    bn.lwz r19, 0x1c(r1)
    bn.lwz r18, 0x20(r1)
    bn.lwz r17, 0x24(r1)
    bn.lwz r16, 0x28(r1)
    bn.lwz r15, 0x2c(r1)
    bn.lwz r14, 0x30(r1)
    bn.lwz r13, 0x34(r1)
    bn.lwz r12, 0x38(r1)
    bn.lwz r11, 0x3c(r1)
    bn.lwz r10, 0x40(r1)
    bn.lwz r9, 0x44(r1)
    bn.addi r1, r1, 0x48
    bg.j 0x2263a5
loc_22e92f:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x22dc46
    bn.lh r6, 0x2c(r10)
    bn.sub r7, r6, r11
    bn.sh_1 0x2c(r10), r7
    bt.mov r3, r20
    bg.jal 0x2227da
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x22acf2
loc_22e956:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r6, 0x18(r7)
    bn.lh r7, 0x1c(r7)
    bt.add r6, r7
    bg.sfgtsi r6, 0x780
    bn.bnf loc_22e991
    bg.jal 0x222af1
    bt.mov r15, r3
    bn.j loc_22e760
loc_22e97e:
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_22ea0c
    bt.mov r3, r14
    bt.j loc_22e875
loc_22e991:
    bg.jal 0x222ace
    bt.mov r15, r3
    bn.j loc_22e760
loc_22e99a:
    bt.mov r3, r20
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.beqi r7, 0x0, loc_22e9dc
    bn.ori r7, r0, 0xa8
    bn.muls r6, r20, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lbz r7, 0x29(r6)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_22e9dc
    bg.lbz r6, 0xa4(r6)
    bg.beqi r6, 0x0, loc_22e8a5
loc_22e9dc:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r17, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r19
    bn.sh_2 0x42(r7), r19
    bn.sh_2 0x4a(r7), r19
    bt.j loc_22e8be
loc_22e9f7:
    bt.mov r3, r15
    bg.jal 0x222804
    bt.mov r10, r3
    bt.mov r3, r20
    bg.jal 0x2227da
    bg.bne r10, r3, loc_22e7d4
    bn.j loc_22e7e0
loc_22ea0c:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bt.mov r3, r14
    bt.j loc_22e875
loc_22ea1a:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bt.j loc_22e873
