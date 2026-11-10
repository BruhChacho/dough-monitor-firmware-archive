# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2245e6,0x2247fb); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r13, r3
    bg.jal 0x2227ef
    bt.mov r14, r3
    bt.movi r7, 0x1
    bn.sll r15, r7, r13
    bn.ori r7, r0, 0xa8
    bn.muls r10, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r10, r5
    bn.lh r6, 0x2c(r10)
    bn.or r7, r15, r6
    bn.sh_1 0x2c(r10), r7
    bn.ori r7, r0, 0x7c
    bn.muls r11, r13, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r11, r7
    bg.lbz r7, 0xa5(r10)
    bn.sbz 0x70(r11), r7
    bt.mov r3, r13
    bg.jal 0x222b9f
    bn.sbz 0x32(r11), r13
    bn.lwz r7, 0x10(r10)
    bn.sw 0x20(r11), r7
    bn.lwz r7, 0x14(r10)
    bn.sw 0x24(r11), r7
    bn.lwz r7, 0x18(r10)
    bn.sw 0x4c(r11), r7
    bn.lwz r7, 0x1c(r10)
    bn.sw 0x50(r11), r7
    bn.lh r7, 0x18(r10)
    bg.sfleui r7, 0x77f
    bn.bf loc_224670
    bn.lh r5, 0x4c(r11)
    bg.addi r7, r5, -0x780
    bn.sh_1 0x4c(r11), r7
loc_224670:
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_224751
    bn.lh r6, 0x14(r10)
    bn.lh r7, 0x1c(r10)
    bg.bgt r6, r7, loc_2246f3
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_1 0x38(r7), r6
    bn.sh_1 0x40(r7), r6
    bn.sh_1 0x48(r7), r6
    bn.ori r7, r0, 0xa8
    bn.muls r10, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lh r11, 0x16(r10)
    bn.lh r12, 0x1e(r10)
    bg.bgt r11, r12, loc_224716
loc_2246b9:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sh_2 0x3a(r7), r11
    bn.sh_2 0x42(r7), r11
    bn.sh_2 0x4a(r7), r11
loc_2246d2:
    bt.mov r3, r14
    bn.exthz r4, r15
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bg.j 0x223fb3
loc_2246f3:
    bn.sh_1 0x38(r11), r7
    bn.sh_1 0x40(r11), r7
    bn.sh_1 0x48(r11), r7
    bn.ori r7, r0, 0xa8
    bn.muls r10, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lh r11, 0x16(r10)
    bn.lh r12, 0x1e(r10)
    bg.ble r11, r12, loc_2246b9
loc_224716:
    bt.mov r3, r14
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.bnei r7, 0x0, loc_2247b3
loc_224736:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r12
    bn.sh_2 0x42(r7), r12
    bn.sh_2 0x4a(r7), r12
    bt.j loc_2246d2
loc_224751:
    bn.lh r7, 0x14(r10)
    bg.ori r5, r0, 0xfffc
    bn.and r6, r7, r5
    bn.lh r7, 0x1e(r10)
    bn.and r7, r7, r5
    bg.bgt r6, r7, loc_2247bd
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_1 0x38(r7), r6
    bn.sh_2 0x42(r7), r6
    bn.sh_2 0x4a(r7), r6
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r5, 0x16(r7)
    bn.lh r6, 0x1c(r7)
    bg.ble r5, r6, loc_2247e0
loc_224798:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r6
    bn.sh_1 0x40(r7), r6
    bn.sh_1 0x48(r7), r6
    bt.j loc_2246d2
loc_2247b3:
    bg.lbz r10, 0xa4(r10)
    bg.beqi r10, 0x0, loc_2246b9
    bt.j loc_224736
loc_2247bd:
    bn.sh_1 0x38(r11), r7
    bn.sh_2 0x42(r11), r7
    bn.sh_2 0x4a(r11), r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r5, 0x16(r7)
    bn.lh r6, 0x1c(r7)
    bg.bgt r5, r6, loc_224798
loc_2247e0:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sh_2 0x3a(r7), r5
    bn.sh_1 0x40(r7), r5
    bn.sh_1 0x48(r7), r5
    bt.j loc_2246d2
