# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e335,0x26f043); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x2c
    bn.sw 0x28(r1), r9
    bn.sw 0x24(r1), r10
    bn.sw 0x20(r1), r11
    bn.sw 0x1c(r1), r12
    bn.sw 0x18(r1), r13
    bn.sw 0x14(r1), r14
    bn.sw 0x10(r1), r15
    bn.slli r11, r3, 0x7
    bg.movhi r28, 0x48
    bg.addi r4, r28, -0x1480
    bn.add r7, r11, r4
    bn.lbz r7, 0x2(r7)
    bn.addi r7, r7, -0x30
    bn.extbz r7, r7
    bg.sfgti r7, 0xcf
    bn.bf loc_26e3b4
    bn.slli r7, r7, 0x2
    bg.movhi r5, 0x33
    bg.addi r5, r5, -0x7d30
    bt.add r7, r5
    bn.lwz r7, 0x0(r7)
    bt.jr r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r5, r11, r6
    bn.lbz r7, 0x3(r5)
    bn.extbz r7, r7
    bg.movhi r6, 0x45
    bg.sw_1 0x3ce0(r6), r7
    bn.lbz r7, 0x3(r5)
    bg.bnei r7, 0x0, loc_26ee3d
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
loc_26e3aa:
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bg.jal 0x2052b2
loc_26e3b4:
    bt.movi r10, 0x0
loc_26e3b6:
    bt.mov r3, r10
    bn.lwz r15, 0x10(r1)
    bn.lwz r14, 0x14(r1)
    bn.lwz r13, 0x18(r1)
    bn.lwz r12, 0x1c(r1)
    bn.lwz r11, 0x20(r1)
    bn.lwz r10, 0x24(r1)
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bt.jr r9
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r5, r11, r7
    bn.lbz r7, 0x3(r5)
    bn.extbz r7, r7
    bg.movhi r6, 0x45
    bg.sw_1 0x3ce0(r6), r7
    bn.lbz r7, 0x3(r5)
    bt.movi r3, 0x0
    bn.beqi r7, 0x0, loc_26e406
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
    bg.jal 0x208490
    bt.movi r3, 0x1
loc_26e406:
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bg.jal 0x205953
    bt.j loc_26e3b4
    bg.movhi r7, 0x45
    bg.sbz 0x3cd8(r7), r0
    bg.addi r7, r7, 0x3cd8
    bn.sbz 0x2(r7), r0
    bn.sbz 0x4(r7), r0
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r10, r11, r4
    bn.lbz r6, 0x3(r10)
    bn.sbz 0x1(r7), r6
    bn.lbz r6, 0x4(r10)
    bn.sbz 0x3(r7), r6
    bn.lbz r6, 0x5(r10)
    bn.sbz 0x5(r7), r6
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
    bg.jal 0x208490
    bn.lbz r4, 0x3(r10)
    bn.lbz r5, 0x4(r10)
    bn.lbz r6, 0x5(r10)
    bt.movi r3, 0x1
    bn.extbz r4, r4
    bn.extbz r5, r5
    bn.extbz r6, r6
    bg.jal 0x205953
    bt.movi r10, 0x0
    bt.j loc_26e3b6
    bt.movi r5, 0x3
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r4, r11, r7
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3cd5
    bn.addi r6, r7, 0x3
loc_26e486:
    bn.add r7, r4, r5
    bn.lbz r7, 0x0(r7)
    bn.sbz 0x0(r6), r7
    bt.addi r5, 0x1
    bt.addi r6, 0x1
    bg.bnei r5, 0x9, loc_26e486
    bn.lbz r5, 0x3(r4)
    bn.extbz r5, r5
    bn.lbz r25, 0x4(r4)
    bn.extbz r25, r25
    bn.lbz r6, 0x5(r4)
    bn.extbz r6, r6
    bn.lbz r24, 0x6(r4)
    bn.extbz r24, r24
    bn.lbz r7, 0x7(r4)
    bn.extbz r7, r7
    bn.lbz r23, 0x8(r4)
    bn.extbz r23, r23
    bg.movhi r4, 0x3b
    bg.lwz r4, 0x5f38(r4)
    bn.slli r5, r5, 0x8
    bn.slli r6, r6, 0x8
    bn.slli r7, r7, 0x8
    bn.lbz r3, 0x5a(r4)
    bt.movi r4, 0x1
    bn.or r5, r5, r25
    bn.or r6, r6, r24
    bn.or r7, r7, r23
    bg.jal 0x2052b2
    bt.movi r10, 0x0
    bt.j loc_26e3b6
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r4, r11, r7
    bn.lbz r7, 0x3(r4)
    bn.extbz r7, r7
    bg.beqi r7, 0x0, loc_26e3b4
    bg.beqi r7, 0x1, loc_26efe4
    bg.bnei r7, 0x2, loc_26e3b4
    bn.ori r3, r0, 0x80
    bg.jal 0x23a55b
    bt.movi r10, 0x0
    bt.j loc_26e3b6
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r4, r11, r5
    bn.lbz r6, 0x3(r4)
    bn.lbz r7, 0x4(r4)
    bn.extbz r5, r7
    bg.beqi r6, 0x0, loc_26ee4d
    bg.movhi r7, 0x45
    bg.sw_0 0x7990(r7), r5
    bt.movi r10, 0x0
    bt.j loc_26e3b6
    bg.movhi r5, 0x34
    bg.addi r6, r5, -0x3496
loc_26e536:
    bn.lbs r7, 0x1(r6)
    bt.addi r6, 0x1
    bn.bnei r7, 0x0, loc_26e536
    bg.addi r5, r5, -0x3496
    bn.sub r25, r6, r5
    bn.addi r4, r25, 0x1
    bn.extbz r3, r4
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r7, r11, r6
    bn.sbz 0x0(r7), r3
    bn.blesi r25, 0x0, loc_26e573
    bt.movi r23, 0x0
    bt.mov r24, r5
    bt.mov r26, r7
loc_26e562:
    bt.addi r23, 0x1
    bn.lbz r6, 0x0(r24)
    bn.add r7, r26, r23
    bn.sbz 0x0(r7), r6
    bt.addi r24, 0x1
    bg.bne r23, r25, loc_26e562
loc_26e573:
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bt.add r11, r7
    bn.add r7, r11, r4
    bn.sbz 0x0(r7), r0
    bt.mov r10, r3
    bt.j loc_26e3b6
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r7, r11, r4
    bt.movi r6, 0x6
    bn.sbz 0x0(r7), r6
    bn.ori r5, r0, 0x31
    bn.sbz 0x1(r7), r5
    bn.ori r6, r0, 0x2e
    bn.sbz 0x2(r7), r6
    bn.sbz 0x3(r7), r5
    bn.sbz 0x4(r7), r6
    bn.ori r6, r0, 0x36
    bn.sbz 0x5(r7), r6
    bn.sbz 0x6(r7), r0
    bt.movi r10, 0x6
    bt.j loc_26e3b6
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x3b7e
    bn.add r7, r3, r4
    bn.lbz r6, 0x0(r7)
    bn.extbz r6, r6
    bn.lbz r7, 0x0(r7)
    bn.extbz r7, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4288
    bn.ori r4, r0, 0x18
    bn.muls r6, r6, r4
    bt.add r6, r5
    bn.muls r7, r7, r4
    bt.add r7, r5
    bn.lbz r3, 0x4(r6)
    bn.lbz r4, 0x8(r7)
    bg.jal 0x2392fe
    bn.ori r6, r0, 0xd3
    bg.movhi r7, 0x45
    bg.sh 0x3cdc(r7), r6
    bn.j loc_26e3b4
    bg.movhi r7, 0x3d
    bg.lwz r6, -0x4cf4(r7)
    bn.extbz r7, r6
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r5, r11, r4
    bn.sbz 0x4(r5), r7
    bn.srli r7, r6, 0x8
    bn.extbz r7, r7
    bn.sbz 0x3(r5), r7
    bn.srli r7, r6, 0x10
    bn.extbz r7, r7
    bn.sbz 0x2(r5), r7
    bn.srli r6, r6, 0x18
    bn.andi r6, r6, 0x7f
    bn.sbz 0x1(r5), r6
    bt.movi r7, 0x4
    bn.sbz 0x0(r5), r7
    bt.movi r10, 0x4
    bn.j loc_26e3b6
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r6, r11, r7
    bn.addi r7, r0, -0x77
    bn.sbz 0x4(r6), r7
    bn.addi r7, r0, -0x55
    bn.sbz 0x3(r6), r7
    bn.addi r7, r0, -0x33
    bn.sbz 0x2(r6), r7
    bn.addi r7, r0, -0x11
    bn.sbz 0x1(r6), r7
    bt.movi r7, 0x4
    bn.sbz 0x0(r6), r7
    bt.movi r10, 0x4
    bn.j loc_26e3b6
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r4, r11, r5
    bn.lbz r5, 0x3(r4)
    bn.extbz r5, r5
    bn.lbz r6, 0x4(r4)
    bn.extbz r6, r6
    bn.lbz r7, 0x5(r4)
    bn.extbz r7, r7
    bn.lbz r4, 0x6(r4)
    bn.slli r6, r6, 0x8
    bt.add r5, r6
    bn.slli r7, r7, 0x10
    bn.slli r4, r4, 0x18
    bt.add r7, r4
    bt.add r5, r7
    bg.movhi r7, 0x45
    bg.sw_0 0x798c(r7), r5
    bg.movhi r7, 0x3d
    bg.lwz r3, -0x4cf4(r7)
    bg.addi r7, r7, -0x4cf4
    bn.sw 0x24(r7), r3
    bn.ori r4, r0, 0xff
    bg.jal 0x27092f
    bg.movhi r7, 0x45
    bg.sw_1 0x3ce0(r7), r0
    bg.movhi r7, 0x45
    bg.sw_0 0x7988(r7), r0
    bn.addi r6, r0, -0x67
    bg.movhi r7, 0x3d
    bg.sbz -0x4ccc(r7), r6
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x51d5(r7), r6
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r7, 0x45
    bg.lwz r6, 0x798c(r7)
    bn.srli r7, r6, 0x18
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r5, r11, r4
    bn.sbz 0x4(r5), r7
    bn.srli r7, r6, 0x10
    bn.extbz r7, r7
    bn.sbz 0x3(r5), r7
    bn.srli r7, r6, 0x8
    bn.extbz r7, r7
    bn.sbz 0x2(r5), r7
    bn.extbz r6, r6
    bn.sbz 0x1(r5), r6
    bt.movi r7, 0x4
    bn.sbz 0x0(r5), r7
    bt.movi r10, 0x4
    bn.j loc_26e3b6
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r4, r11, r5
    bn.lbz r7, 0x0(r4)
    bn.andi r7, r7, 0x7f
    bn.addi r25, r7, -0x2
    bg.blesi r25, 0x0, loc_26e3b4
    bt.movi r23, 0x0
    bg.movhi r26, 0x45
    bg.movhi r12, 0x3d
    bg.movhi r24, 0x45
    bg.addi r10, r12, -0x4cf4
    bt.mov r27, r24
    bt.addi r4, 0x3
loc_26e745:
    bn.lbz r5, 0x0(r4)
    bn.lwz r7, 0x24(r10)
    bg.lwz r6, 0x7988(r24)
    bt.add r7, r23
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bn.lwz r7, 0x24(r10)
    bg.lwz r6, 0x7988(r24)
    bt.add r7, r23
    bt.add r7, r6
    bn.lbz r7, 0x0(r7)
    bg.lhz r5, 0x3ce0(r26)
    bt.add r7, r5
    bg.sw_1 0x3ce0(r26), r7
    bt.addi r23, 0x1
    bt.addi r4, 0x1
    bg.bne r25, r23, loc_26e745
    bn.add r7, r6, r25
    bg.sw_0 0x7988(r27), r7
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r7, 0x45
    bg.lwz r6, 0x7988(r7)
    bn.srli r7, r6, 0x18
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r5, r11, r4
    bn.sbz 0x6(r5), r7
    bn.srli r7, r6, 0x10
    bn.extbz r7, r7
    bn.sbz 0x5(r5), r7
    bn.srli r7, r6, 0x8
    bn.extbz r7, r7
    bn.sbz 0x4(r5), r7
    bn.extbz r6, r6
    bn.sbz 0x3(r5), r6
    bg.movhi r7, 0x45
    bg.lhz r7, 0x3ce0(r7)
    bn.srli r6, r7, 0x8
    bn.sbz 0x2(r5), r6
    bn.extbz r7, r7
    bn.sbz 0x1(r5), r7
    bt.movi r7, 0x6
    bn.sbz 0x0(r5), r7
    bt.movi r10, 0x6
    bn.j loc_26e3b6
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r4, r11, r5
    bn.lbz r5, 0x3(r4)
    bn.extbz r5, r5
    bn.lbz r6, 0x4(r4)
    bn.extbz r6, r6
    bn.lbz r7, 0x5(r4)
    bn.extbz r7, r7
    bn.lbz r4, 0x6(r4)
    bn.slli r6, r6, 0x8
    bt.add r5, r6
    bn.slli r7, r7, 0x10
    bn.slli r4, r4, 0x18
    bt.add r7, r4
    bt.add r5, r7
    bg.movhi r7, 0x45
    bg.sw_0 0x7988(r7), r5
    bg.movhi r7, 0x45
    bg.sw_1 0x3ce0(r7), r0
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r10, 0x3d
    bg.sbz -0x4ccc(r10), r0
    bg.jal 0x270cad
    bt.mov r4, r3
    bt.movi r3, 0x1
    bg.movhi r7, 0x3d
    bg.lwz r5, -0x4cd0(r7)
    bg.movhi r7, 0x45
    bg.lwz r6, 0x7988(r7)
    bt.movi r7, 0x0
    bg.jal 0x24512f
    bt.movi r7, 0x2
    bg.sbz -0x4ccc(r10), r7
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r7, 0x3d
    bg.lbz r7, -0x4ccc(r7)
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r6, r11, r4
    bn.sbz 0x1(r6), r7
    bn.addi r7, r0, -0x7f
    bn.sbz 0x0(r6), r7
    bt.movi r10, 0x1
    bn.j loc_26e3b6
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r6, r11, r5
    bn.sbz 0x1(r6), r0
    bn.addi r7, r0, -0x7f
    bn.sbz 0x0(r6), r7
    bt.movi r10, 0x1
    bn.j loc_26e3b6
    bg.movhi r12, 0x3d
    bg.addi r10, r12, -0x4cf4
    bg.lwz r7, -0x4cf4(r12)
    bn.sw 0x24(r10), r7
    bg.movhi r15, 0x45
    bt.movi r7, 0x1
    bg.sbz 0x51d5(r15), r7
    bt.movi r3, 0x0
    bg.jal 0x26e277
    bt.movi r3, 0x0
    bg.jal 0x26e24a
    bt.movi r3, 0x0
    bg.jal 0x26e218
    bg.jal 0x26e30a
    bn.sw 0x10(r10), r3
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r5, r11, r6
    bn.lbz r23, 0x6(r5)
    bn.extbz r23, r23
    bn.lbz r24, 0x5(r5)
    bn.extbz r24, r24
    bn.lbz r4, 0x4(r5)
    bn.extbz r4, r4
    bn.lbz r25, 0x3(r5)
    bn.lbz r6, 0xa(r5)
    bn.extbz r6, r6
    bn.lbz r7, 0x9(r5)
    bn.extbz r7, r7
    bn.slli r7, r7, 0x8
    bn.add r14, r6, r7
    bn.lbz r6, 0x8(r5)
    bn.extbz r6, r6
    bn.lbz r7, 0x7(r5)
    bn.slli r6, r6, 0x10
    bn.slli r7, r7, 0x18
    bn.add r13, r6, r7
    bn.slli r24, r24, 0x8
    bt.add r23, r24
    bn.slli r4, r4, 0x10
    bn.slli r25, r25, 0x18
    bt.add r4, r25
    bt.add r23, r4
    bg.beq r3, r23, loc_26e951
    bt.movi r3, 0x1
    bg.jal 0x26e218
    bg.sbz 0x51d5(r15), r0
    bt.movi r10, 0x0
    bn.j loc_26e3b6
loc_26e918:
    bn.lwz r7, 0x10(r10)
    bg.addi r4, r0, -0x1000
    bn.and r6, r11, r4
    bn.sfne r5, r7
    bn.cmov_0 r11, r6, r11
loc_26e928:
    bn.add r4, r14, r23
    bg.addi r10, r12, -0x4cf4
    bn.lwz r5, 0xc(r10)
    bt.add r5, r23
    bn.lwz r7, 0x24(r10)
    bt.movi r3, 0x1
    bt.add r4, r13
    bt.add r5, r7
    bt.mov r6, r11
    bt.movi r7, 0x0
    bg.jal 0x26e1bf
    bn.lwz r3, 0x1c(r10)
    bt.add r3, r11
    bn.sw 0x1c(r10), r3
    bg.jal 0x26e277
loc_26e951:
    bg.addi r10, r12, -0x4cf4
    bn.lwz r4, 0x10(r10)
    bn.lwz r7, 0x1c(r10)
    bg.ble r4, r7, loc_26ee62
    bn.lbz r5, 0x18(r10)
    bg.bnei r5, 0x0, loc_26ee62
    bg.jal 0x26e2dd
    bn.sw 0x14(r10), r3
    bg.jal 0x26e2a2
    bn.sbz 0x18(r10), r3
    bn.lwz r5, 0x14(r10)
    bn.lwz r23, 0x1c(r10)
    bn.sub r11, r5, r23
    bg.sfgti r11, 0xfff
    bn.bf loc_26e918
    bn.lwz r7, 0x10(r10)
    bg.bne r5, r7, loc_26e951
    bt.j loc_26e928
    bg.jal 0x26e08b
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r6, r11, r7
    bn.lbz r5, 0x3(r6)
    bn.lbz r7, 0x4(r6)
    bt.add r7, r5
    bn.extbz r7, r7
    bn.sbz 0x2(r6), r7
    bt.movi r7, 0x2
    bn.sbz 0x1(r6), r7
    bn.addi r7, r0, -0x7e
    bn.sbz 0x0(r6), r7
    bt.movi r10, 0x2
    bn.j loc_26e3b6
    bn.sh_2 0xa(r1), r0
    bn.sh_1 0xc(r1), r0
    bn.sh_2 0xe(r1), r0
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r12, r11, r4
    bn.lbz r7, 0x3(r12)
    bn.extbz r10, r7
    bt.mov r3, r10
    bg.jal 0x2227da
    bn.ori r13, r0, 0xb0
    bn.muls r3, r3, r13
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lwz r3, 0x0(r3)
    bn.addi r4, r1, 0xa
    bg.jal 0x20e8e9
    bn.beqi r3, 0x0, loc_26ea0e
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r7, 0x48(r7)
    bn.andi r7, r7, 0x1
    bg.bnei r7, 0x0, loc_26ef47
loc_26ea0e:
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r7, r11, r5
    bn.sbz 0x6(r7), r0
    bn.sbz 0x5(r7), r0
    bn.sbz 0x4(r7), r0
    bn.sbz 0x3(r7), r0
    bn.sbz 0x2(r7), r0
    bn.sbz 0x1(r7), r0
loc_26ea2b:
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bt.add r11, r6
    bn.addi r7, r0, -0x7a
    bn.sbz 0x0(r11), r7
    bt.movi r10, 0x6
    bn.j loc_26e3b6
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r7, r11, r6
    bn.sbz 0x2(r7), r0
    bn.sbz 0x1(r7), r0
    bn.addi r6, r0, -0x7e
    bn.sbz 0x0(r7), r6
    bt.movi r10, 0x2
    bn.j loc_26e3b6
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bt.add r11, r5
    bn.lbz r6, 0x3(r11)
    bg.movhi r7, 0x45
    bg.sbz 0x51d5(r7), r6
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r7, r11, r6
    bn.lbz r4, 0x3(r7)
    bn.lbz r6, 0x4(r7)
    bn.extbz r6, r6
    bn.lbz r23, 0x5(r7)
    bn.extbz r23, r23
    bn.lbz r24, 0x6(r7)
    bn.extbz r24, r24
    bn.lbz r5, 0x7(r7)
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.slli r23, r23, 0x8
    bn.slli r4, r4, 0x18
    bn.slli r6, r6, 0x10
    bt.add r4, r6
    bt.add r4, r24
    bn.lbz r3, 0x5a(r7)
    bt.add r4, r23
    bn.extbz r5, r5
    bg.jal 0x26e115
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r10, r11, r7
    bn.lbz r4, 0x3(r10)
    bn.lbz r6, 0x4(r10)
    bn.extbz r6, r6
    bn.lbz r5, 0x5(r10)
    bn.extbz r5, r5
    bn.lbz r23, 0x6(r10)
    bn.extbz r23, r23
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.slli r5, r5, 0x8
    bn.slli r4, r4, 0x18
    bn.slli r6, r6, 0x10
    bt.add r4, r6
    bt.add r4, r23
    bn.lbz r3, 0x5a(r7)
    bt.add r4, r5
    bg.jal 0x26e0cb
    bn.sbz 0x1(r10), r3
    bt.movi r7, 0x1
    bn.sbz 0x0(r10), r7
    bt.movi r10, 0x1
    bn.j loc_26e3b6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x51d5(r7)
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r6, r11, r5
    bn.sbz 0x1(r6), r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.movi r10, 0x1
    bn.j loc_26e3b6
    bg.movhi r7, 0x45
    bg.lbz r6, 0x3cd8(r7)
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r5, r11, r4
    bn.sbz 0x1(r5), r6
    bg.addi r7, r7, 0x3cd8
    bn.lbz r6, 0x1(r7)
    bn.sbz 0x2(r5), r6
    bn.lbz r6, 0x2(r7)
    bn.sbz 0x3(r5), r6
    bn.lbz r6, 0x3(r7)
    bn.sbz 0x4(r5), r6
    bn.lbz r6, 0x4(r7)
    bn.sbz 0x5(r5), r6
    bn.lbz r7, 0x5(r7)
    bn.sbz 0x6(r5), r7
    bt.movi r7, 0x6
    bn.sbz 0x0(r5), r7
    bt.movi r10, 0x6
    bn.j loc_26e3b6
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bt.add r11, r5
    bn.lbz r7, 0x3(r11)
    bg.beqi r7, 0x1, loc_26ef0c
    bt.movi r3, 0x0
    bg.jal 0x2383a9
    bg.ori r3, r0, 0x640
    bg.jal 0x2383a5
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bt.add r11, r6
    bn.lbz r7, 0x3(r11)
    bg.beqi r7, 0x1, loc_26ef1f
    bn.movhi_2 r10, 0x1090
    bg.ori r3, r10, 0x2f5e
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x2b5e
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.movi r3, 0x0
    bg.jal 0x2383a1
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r10, r11, r4
    bn.lbz r7, 0x4(r10)
    bn.extbz r13, r7
    bn.ori r3, r0, 0xcc
    bg.jal 0x238631
    bn.extbz r11, r3
    bt.movi r3, 0x1
    bt.mov r4, r11
    bg.jal 0x23838d
    bt.mov r12, r3
    bt.movi r7, 0x1
    bn.sbz 0x0(r10), r7
    bn.sbz 0x1(r10), r11
    bn.lbz r7, 0x3(r10)
    bg.beqi r7, 0x1, loc_26eef2
    bn.lbz r7, 0x3(r10)
    bg.bnei r7, 0x0, loc_26ee9d
    bg.bgtsi r3, 0x3, loc_26efc8
loc_26ec0a:
    bn.sbz 0x1(r10), r0
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r5, 0x49
    bg.addi r6, r5, -0x585f
    bg.lbz r7, -0x585f(r5)
    bg.beqi r7, 0x0, loc_26efcd
loc_26ec22:
    bn.lbz r7, 0x1(r6)
    bt.addi r6, 0x1
    bn.bnei r7, 0x0, loc_26ec22
    bg.movhi r4, 0x49
    bg.addi r4, r4, -0x585f
    bn.sub r25, r6, r4
    bn.addi r4, r25, 0x1
    bn.extbz r27, r4
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r7, r11, r5
    bn.sbz 0x0(r7), r27
    bt.mov r10, r27
    bn.blesi r25, 0x0, loc_26ec6d
    bt.movi r24, 0x0
    bt.mov r26, r7
    bg.movhi r7, 0x49
    bg.addi r23, r7, -0x5860
loc_26ec5a:
    bt.addi r24, 0x1
    bt.addi r23, 0x1
    bn.lbz r6, 0x0(r23)
    bn.add r7, r26, r24
    bn.sbz 0x0(r7), r6
    bg.bne r24, r25, loc_26ec5a
    bt.mov r10, r27
loc_26ec6d:
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bt.add r11, r6
    bn.add r7, r11, r4
    bn.sbz 0x0(r7), r0
    bn.j loc_26e3b6
    bg.movhi r7, 0x45
    bg.lhz r7, 0x3ce0(r7)
loc_26ec88:
    bn.srli r5, r7, 0x8
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bn.add r6, r11, r4
    bn.sbz 0x2(r6), r5
    bn.extbz r7, r7
    bn.sbz 0x1(r6), r7
    bt.movi r7, 0x2
    bn.sbz 0x0(r6), r7
    bt.movi r10, 0x2
    bn.j loc_26e3b6
    bg.movhi r7, 0x45
    bg.lhz r7, 0x3cde(r7)
    bt.j loc_26ec88
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r10, r11, r6
    bn.lbz r4, 0x3(r10)
    bn.lbz r5, 0x4(r10)
    bn.lbz r6, 0x5(r10)
    bn.lbz r7, 0x6(r10)
    bn.sw 0x0(r1), r0
    bn.sw 0x4(r1), r0
    bn.ori r3, r0, 0x3c
    bn.extbz r4, r4
    bn.extbz r5, r5
    bn.extbz r6, r6
    bn.extbz r7, r7
    bt.movi r8, 0x0
    bg.jal 0x26e062
    bt.movi r11, 0x2
    bg.movhi r12, 0x3b
loc_26eceb:
    bn.lbz r4, 0x3(r10)
    bn.lbz r5, 0x4(r10)
    bn.lbz r6, 0x5(r10)
    bn.lbz r7, 0x6(r10)
    bg.lwz r23, 0x5f38(r12)
    bn.lbz r3, 0x5a(r23)
    bn.extbz r4, r4
    bn.extbz r5, r5
    bn.extbz r6, r6
    bn.extbz r7, r7
    bt.mov r8, r11
    bg.jal 0x205200
    bt.addi r11, 0x2
    bn.sfnei r11, 0x12
    bn.bf loc_26eceb
    bn.j loc_26e3b4
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r5, r11, r7
    bn.lbz r7, 0x3(r5)
    bn.extbz r7, r7
    bg.movhi r6, 0x45
    bg.sw_1 0x3ce0(r6), r7
    bn.lbz r3, 0x3(r5)
    bn.extbz r3, r3
    bg.jal 0x23a594
    bt.movi r10, 0x0
    bn.j loc_26e3b6
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bg.jal 0x23e79e
    bt.mov r12, r3
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bt.add r11, r7
    bn.lbz r7, 0x3(r11)
    bg.bnei r7, 0x0, loc_26ede3
    bt.movi r11, 0x0
    bn.bnei r3, 0x0, loc_26ed79
    bn.j loc_26e3b4
loc_26ed6d:
    bn.srli r7, r12, 0x1
    bn.exthz r12, r7
    bt.addi r11, 0x1
    bg.beqi r12, 0x0, loc_26e3b4
loc_26ed79:
    bn.extbz r10, r11
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_26ed6d
    bt.mov r3, r10
    bg.jal 0x222b8a
    bn.andi r7, r10, 0x1
    bn.movhi_2 r4, 0xf80
    bn.ori r4, r4, 0x4c
    bn.add r6, r3, r4
    bn.sfeqi r7, 0x0
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x7994
    bt.add r10, r5
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x5e
    bt.add r3, r7
    bn.cmov_0 r3, r6, r3
    bn.lbz r4, 0x0(r10)
    bg.jal 0x23ddb9
    bt.j loc_26ed6d
    bt.movi r24, 0x0
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r4, r11, r5
    bg.movhi r7, 0x45
    bg.addi r23, r7, 0x797f
loc_26edca:
    bt.addi r24, 0x1
    bt.addi r23, 0x1
    bn.lbz r6, 0x0(r23)
    bn.add r7, r4, r24
    bn.sbz 0x0(r7), r6
    bg.bnei r24, 0x8, loc_26edca
    bn.sbz 0x0(r4), r24
    bt.movi r10, 0x8
    bn.j loc_26e3b6
loc_26ede3:
    bt.movi r13, 0x0
    bn.bnei r3, 0x0, loc_26edf7
    bn.j loc_26e3b4
loc_26edeb:
    bn.srli r7, r12, 0x1
    bn.exthz r12, r7
    bt.addi r13, 0x1
    bg.beqi r12, 0x0, loc_26e3b4
loc_26edf7:
    bn.extbz r11, r13
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_26edeb
    bt.mov r3, r11
    bg.jal 0x222b8a
    bn.andi r7, r11, 0x1
    bn.movhi_2 r4, 0xf80
    bn.ori r4, r4, 0x4c
    bn.add r10, r3, r4
    bn.sfeqi r7, 0x0
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x5e
    bt.add r3, r5
    bn.cmov_0 r10, r10, r3
    bt.mov r3, r10
    bg.jal 0x23dd44
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x7994
    bt.add r11, r6
    bn.sbz 0x0(r11), r3
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bt.j loc_26edeb
loc_26ee3d:
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x1
    bn.j loc_26e3aa
loc_26ee4d:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x7990(r7)
    bn.sbz 0x1(r4), r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r4), r7
    bt.movi r10, 0x1
    bn.j loc_26e3b6
loc_26ee62:
    bn.beqi r4, 0x0, loc_26ee89
    bg.addi r7, r12, -0x4cf4
    bn.lwz r5, 0xc(r7)
    bn.lwz r6, 0x24(r7)
    bt.add r5, r6
    bt.movi r23, 0x0
    bt.mov r24, r7
loc_26ee75:
    bn.lbz r6, 0x0(r5)
    bn.lwz r7, 0x20(r24)
    bn.xor r7, r7, r6
    bn.sw 0x20(r24), r7
    bt.addi r23, 0x1
    bt.addi r5, 0x1
    bg.bne r4, r23, loc_26ee75
loc_26ee89:
    bg.addi r7, r12, -0x4cf4
    bn.lwz r3, 0x20(r7)
    bg.jal 0x26e24a
    bg.sbz 0x51d5(r15), r0
    bt.movi r10, 0x0
    bn.j loc_26e3b6
loc_26ee9d:
    bn.lbz r7, 0x3(r10)
    bg.beqi r7, 0x2, loc_26f003
    bn.lbz r7, 0x3(r10)
    bt.mov r10, r11
    bg.bnei r7, 0x3, loc_26e3b6
    bt.movi r3, 0x1
    bt.mov r4, r13
    bg.jal 0x23838d
    bt.mov r12, r3
    bn.beqi r13, 0x0, loc_26eed7
    bt.movi r10, 0x0
loc_26eebc:
    bn.muls r5, r10, r12
    bn.divs r5, r5, r13
    bt.movi r3, 0x1
    bt.mov r4, r10
    bn.extbz r5, r5
    bg.jal 0x23839d
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bg.bne r13, r10, loc_26eebc
loc_26eed7:
    bn.sw 0x0(r1), r0
    bn.sw 0x4(r1), r0
    bt.movi r3, 0x5
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bt.movi r8, 0x0
    bg.jal 0x20484d
    bt.mov r10, r11
    bn.j loc_26e3b6
loc_26eef2:
    bn.addi r5, r3, 0x3
    bg.sfgtsi r3, 0xfb
    bn.bf loc_26ec0a
loc_26eefc:
    bt.movi r3, 0x1
    bt.mov r4, r11
    bn.extbz r5, r5
    bg.jal 0x23839d
    bt.mov r10, r11
    bn.j loc_26e3b6
loc_26ef0c:
    bt.movi r3, 0x1
    bg.jal 0x2383a9
    bg.ori r3, r0, 0x460
    bg.jal 0x2383a5
    bt.movi r10, 0x0
    bn.j loc_26e3b6
loc_26ef1f:
    bn.movhi_2 r10, 0x1090
    bg.ori r3, r10, 0x2f5e
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x2b5e
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.movi r3, 0x1
    bg.jal 0x2383a1
    bt.movi r10, 0x0
    bn.j loc_26e3b6
loc_26ef47:
    bt.mov r3, r10
    bg.jal 0x2227da
    bn.muls r3, r3, r13
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0xc
    bg.bnei r7, 0x0, loc_26ea0e
    bt.mov r3, r10
    bg.jal 0x2227da
    bn.muls r3, r3, r13
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x1c(r3)
    bn.andi r7, r7, 0x2
    bg.beqi r7, 0x0, loc_26ea0e
    bt.mov r3, r10
    bg.jal 0x2250c5
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r3, r4
    bn.lbz r7, 0xf(r3)
    bn.andi r7, r7, 0x1
    bg.bnei r7, 0x0, loc_26ea0e
    bn.lbz r7, 0xf(r1)
    bn.sbz 0x6(r12), r7
    bn.lbz r7, 0xe(r1)
    bn.sbz 0x5(r12), r7
    bn.lbz r7, 0xd(r1)
    bn.sbz 0x4(r12), r7
    bn.lbz r7, 0xc(r1)
    bn.sbz 0x3(r12), r7
    bn.lbz r7, 0xb(r1)
    bn.sbz 0x2(r12), r7
    bn.lbz r7, 0xa(r1)
    bn.sbz 0x1(r12), r7
    bn.j loc_26ea2b
loc_26efc8:
    bn.addi r5, r3, -0x3
    bt.j loc_26eefc
loc_26efcd:
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r6, r11, r5
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.movi r4, 0x1
    bt.movi r10, 0x1
    bn.j loc_26ec6d
loc_26efe4:
    bn.lbz r7, 0x5(r4)
    bn.extbz r7, r7
    bn.lbz r3, 0x4(r4)
    bn.extbz r3, r3
    bn.slli r7, r7, 0x8
    bn.or r3, r7, r3
    bg.jal 0x23a564
    bg.jal 0x23a55b
    bt.movi r10, 0x0
    bn.j loc_26e3b6
loc_26f003:
    bt.movi r3, 0x1
    bt.mov r4, r13
    bg.jal 0x23838d
    bt.mov r10, r11
    bn.sub r13, r13, r11
    bg.blesi r13, 0x0, loc_26e3b6
    bn.sub r15, r3, r12
    bt.movi r14, 0x0
    bt.movi r6, 0x0
loc_26f01b:
    bn.muls r5, r15, r6
    bn.divs r5, r5, r13
    bt.add r5, r12
    bt.movi r3, 0x1
    bt.mov r4, r11
    bn.extbz r5, r5
    bg.jal 0x23839d
    bn.addi r7, r14, 0x1
    bn.extbz r6, r7
    bt.mov r14, r6
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bgts r13, r6, loc_26f01b
    bn.j loc_26e3b6
