# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24490d,0x24512f); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x90
    bg.sw_0 0x8c(r1), r9
    bg.sw_0 0x88(r1), r10
    bg.sw_0 0x84(r1), r11
    bg.sw_0 0x80(r1), r12
    bn.sw 0x7c(r1), r13
    bn.sw 0x78(r1), r14
    bn.sw 0x74(r1), r15
    bn.sw 0x70(r1), r16
    bn.sw 0x6c(r1), r17
    bn.sw 0x68(r1), r18
    bn.sw 0x64(r1), r19
    bn.sw 0x60(r1), r20
    bn.sw 0x5c(r1), r21
    bn.sw 0x58(r1), r22
    bn.sw 0x10(r1), r3
    bn.sw 0xc(r1), r4
    bn.sw 0x8(r1), r5
    bn.sw 0x4(r1), r6
    bt.mov r10, r7
    bg.movhi r12, 0x45
    bg.lwz r7, 0x5230(r12)
    bg.beqi r7, 0x1, loc_2450cf
loc_244959:
    bg.jal 0x242aaf
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3c43(r7)
    bg.beqi r7, 0x1, loc_2450b6
loc_244969:
    bg.ori r15, r0, 0x1000
loc_24496d:
    bg.movhi r4, 0x45
    bg.lwz r7, 0x5234(r4)
    bn.beqi r7, 0x0, loc_24497c
    bt.movi r3, 0x0
    bt.jalr r7
loc_24497c:
    bg.bnei r10, 0x0, loc_245123
    bn.lwz r7, 0x4(r1)
    bt.addi r7, -0x1
    bn.divu r4, r7, r15
    bn.sw 0x14(r1), r0
    bn.beqi r4, 0x7, loc_2449fc
    bn.lwz r7, 0x4(r1)
    bn.slli r5, r7, 0x1
    bn.ori r7, r0, 0x50
    bn.muls r7, r15, r7
    bt.movi r6, 0x5
    bn.divu r7, r7, r6
    bn.add r17, r5, r7
    bn.ori r7, r0, 0xa0
    bn.muls r7, r15, r7
    bn.divu r16, r7, r6
    bn.lwz r11, 0xc(r1)
    bt.movi r13, 0x0
    bn.sw 0x14(r1), r0
    bt.movi r10, 0x0
    bn.addi r14, r4, 0x1
    bt.movi r3, 0x1
    bt.mov r4, r11
    bg.jal 0x243e44
    bt.addi r10, 0x1
    bg.beq r14, r10, loc_2449fc
loc_2449c6:
    bg.ble r10, r13, loc_2449ec
    bn.divu r7, r17, r16
    bt.add r13, r7
    bn.lwz r5, 0x14(r1)
    bt.addi r5, 0x1
    bn.sw 0x14(r1), r5
    bg.movhi r6, 0x45
    bg.lwz r7, 0x5234(r6)
    bn.beqi r7, 0x0, loc_2449ec
    bt.movi r3, 0x5
    bn.muls r3, r5, r3
    bn.extbz r3, r3
    bt.jalr r7
loc_2449ec:
    bt.add r11, r15
    bt.movi r3, 0x1
    bt.mov r4, r11
    bg.jal 0x243e44
    bt.addi r10, 0x1
    bg.bne r14, r10, loc_2449c6
loc_2449fc:
    bn.lwz r7, 0x10(r1)
    bg.bnei r7, 0x0, loc_245119
loc_244a03:
    bn.lwz r4, 0x4(r1)
    bg.beqi r4, 0x0, loc_245025
    bt.movi r7, 0x5
    bn.muls r7, r4, r7
    bn.ori r6, r0, 0x14
    bn.divu r7, r7, r6
    bn.sw 0x18(r1), r7
    bn.sub r5, r4, r7
    bn.sw 0x2c(r1), r5
    bn.lwz r6, 0x8(r1)
    bn.sw 0x1c(r1), r6
    bn.lwz r7, 0xc(r1)
    bn.sw 0x24(r1), r7
    bn.sw 0x28(r1), r4
    bn.sw 0x20(r1), r0
loc_244a30:
    bn.lwz r4, 0x28(r1)
    bn.lwz r5, 0x2c(r1)
    bg.ble r5, r4, loc_244a64
    bn.lwz r6, 0x18(r1)
    bn.sub r5, r5, r6
    bn.sw 0x2c(r1), r5
    bn.lwz r7, 0x14(r1)
    bt.addi r7, 0x1
    bn.sw 0x14(r1), r7
    bg.movhi r4, 0x45
    bg.lwz r6, 0x5234(r4)
    bn.beqi r6, 0x0, loc_244a64
    bt.movi r7, 0x5
    bn.lwz r5, 0x14(r1)
    bn.muls r3, r5, r7
    bn.sfgtui r3, 0x63
    bn.bnf loc_2450c7
loc_244a64:
    bn.lwz r6, 0x28(r1)
    bg.sfleui r6, 0xff
    bn.bf loc_245011
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1380
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r6, r7
    bg.movhi r11, 0x45
    bg.lwz r7, 0x3cf0(r11)
    bt.add r6, r7
    bt.movi r7, 0x6
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0x2
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1384
    bg.ori r7, r0, 0x1b84
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r11)
    bt.add r6, r7
    bn.lwz r4, 0x24(r1)
    bn.srli r7, r4, 0x10
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1385
    bg.ori r7, r0, 0x1b85
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r11)
    bt.add r6, r7
    bn.srli r7, r4, 0x8
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1388
    bg.ori r6, r0, 0x1b88
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.extbz r6, r4
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1389
    bg.ori r6, r0, 0x1b89
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lwz r5, 0x1c(r1)
    bn.lbz r6, 0x0(r5)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x138c
    bg.ori r6, r0, 0x1b8c
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, 0x1(r5)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x138d
    bg.ori r6, r0, 0x1b8d
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, 0x2(r5)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1390
    bg.ori r6, r0, 0x1b90
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, 0x3(r5)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1391
    bg.ori r6, r0, 0x1b91
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, 0x4(r5)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.addi r6, r0, -0x80
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.addi r6, r0, -0x6f
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r4, 0x1
    bn.sbz 0x0(r7), r4
    bg.jal 0x242adc
    bg.ori r3, r0, 0xa14
    bt.movi r4, 0x1
    bg.jal 0x23ddb9
    bn.lwz r10, 0x1c(r1)
    bt.addi r10, 0xe
    bt.movi r13, 0x0
loc_244c84:
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r5, r0, 0x1380
    bg.ori r6, r0, 0x1b80
    bn.cmov_0 r7, r5, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x9(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r4, r0, 0x1381
    bg.ori r5, r0, 0x1b81
    bn.cmov_0 r7, r4, r5
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x8(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1384
    bg.ori r4, r0, 0x1b84
    bn.cmov_0 r7, r6, r4
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x7(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1385
    bg.ori r6, r0, 0x1b85
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x6(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1388
    bg.ori r6, r0, 0x1b88
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x5(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1389
    bg.ori r6, r0, 0x1b89
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x4(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x138c
    bg.ori r6, r0, 0x1b8c
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x3(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x138d
    bg.ori r6, r0, 0x1b8d
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x2(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1390
    bg.ori r6, r0, 0x1b90
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, -0x1(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1391
    bg.ori r6, r0, 0x1b91
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r6, 0x0(r10)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bg.ori r21, r0, 0x13b0
    bg.ori r20, r0, 0x1bb0
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r21, r20
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r5, 0x3
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r12)
    bg.ori r19, r0, 0x13b1
    bg.ori r17, r0, 0x1bb1
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r19, r17
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r12)
    bg.ori r18, r0, 0x13a8
    bg.ori r16, r0, 0x1ba8
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r18, r16
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0xa
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bg.ori r15, r0, 0x13a9
    bg.ori r14, r0, 0x1ba9
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r15, r14
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r12)
    bg.ori r22, r0, 0x1bb4
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x13b4
    bn.cmov_0 r7, r6, r22
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r4, 0x1
    bn.sbz 0x0(r7), r4
    bg.jal 0x242adc
    bn.addi r7, r13, 0x1
    bn.extbz r13, r7
    bt.addi r10, 0xa
    bn.sfnei r13, 0x19
    bn.bf loc_244c84
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r5, r0, 0x1380
    bg.ori r6, r0, 0x1b80
    bn.cmov_0 r7, r5, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lwz r4, 0x1c(r1)
    bg.lbz r6, 0xff(r4)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r21, r20
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r5, 0x3
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r19, r17
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r18, r16
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r15, r14
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r4, r0, 0x13b4
    bn.cmov_0 r7, r4, r22
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r5, 0x1
    bn.sbz 0x0(r7), r5
    bg.jal 0x242adc
    bg.ori r3, r0, 0xa14
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1380
    bg.ori r4, r0, 0x1b80
    bn.cmov_0 r7, r6, r4
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r5, 0x5
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1381
    bg.ori r4, r0, 0x1b81
    bn.cmov_0 r7, r6, r4
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1384
    bg.ori r4, r0, 0x1b84
    bn.cmov_0 r7, r6, r4
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r21, r20
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r5, 0x3
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r19, r17
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, -0x10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r18, r16
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.ori r5, r0, 0x11
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bn.cmov_0 r7, r15, r14
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r4, 0x1
    bn.sbz 0x0(r7), r4
    bg.lwz r7, 0x5230(r12)
    bn.sfnei r7, 0x1
    bg.ori r5, r0, 0x13b4
    bn.cmov_0 r7, r5, r22
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r4
    bg.jal 0x242adc
    bn.lwz r6, 0x28(r1)
    bg.addi r6, r6, -0x100
    bn.sw 0x28(r1), r6
    bn.lwz r7, 0x1c(r1)
    bg.addi r7, r7, 0x100
    bn.sw 0x1c(r1), r7
    bn.beqi r6, 0x0, loc_245025
    bn.lwz r4, 0x20(r1)
    bg.addi r4, r4, 0x100
    bn.sw 0x20(r1), r4
    bn.lwz r5, 0x24(r1)
    bg.addi r5, r5, 0x100
    bn.sw 0x24(r1), r5
    bn.j loc_244a30
loc_245011:
    bt.movi r3, 0x0
    bn.lwz r4, 0x24(r1)
    bn.lwz r5, 0x8(r1)
    bn.lwz r6, 0x20(r1)
    bt.add r5, r6
    bn.lwz r6, 0x28(r1)
    bg.jal 0x2442ef
loc_245025:
    bn.lwz r7, 0x10(r1)
    bg.bnei r7, 0x0, loc_245113
loc_24502c:
    bg.movhi r4, 0x45
    bg.lwz r7, 0x5234(r4)
    bn.beqi r7, 0x0, loc_24503c
    bn.ori r3, r0, 0x64
    bt.jalr r7
loc_24503c:
    bn.lwz r5, 0x4(r1)
    bn.beqi r5, 0x0, loc_245080
    bn.lwz r6, 0xc(r1)
    bg.movhi r7, 0xc000
    bt.add r6, r7
    bn.lbz r7, 0x0(r6)
    bn.extbz r7, r7
    bt.mov r3, r6
    bt.addi r3, 0x1
    bt.movi r5, 0x0
    bn.lwz r4, 0x8(r1)
    bn.lbz r4, 0x0(r4)
    bg.beq r7, r4, loc_245077
    bt.j loc_245080
loc_245063:
    bn.lbz r7, 0x0(r3)
    bn.extbz r7, r7
    bn.lwz r6, 0x8(r1)
    bt.add r6, r5
    bt.addi r3, 0x1
    bn.lbz r6, 0x0(r6)
    bg.bne r7, r6, loc_245080
loc_245077:
    bt.addi r5, 0x1
    bn.lwz r6, 0x4(r1)
    bg.bne r6, r5, loc_245063
loc_245080:
    bn.lwz r22, 0x58(r1)
    bn.lwz r21, 0x5c(r1)
    bn.lwz r20, 0x60(r1)
    bn.lwz r19, 0x64(r1)
    bn.lwz r18, 0x68(r1)
    bn.lwz r17, 0x6c(r1)
    bn.lwz r16, 0x70(r1)
    bn.lwz r15, 0x74(r1)
    bn.lwz r14, 0x78(r1)
    bn.lwz r13, 0x7c(r1)
    bg.lwz r12, 0x80(r1)
    bg.lwz r11, 0x84(r1)
    bg.lwz r10, 0x88(r1)
    bg.lwz r9, 0x8c(r1)
    bg.addi r1, r1, 0x90
    bg.j 0x242a8d
loc_2450b6:
    bt.movhi r15, 0x1
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522e(r7)
    bg.bnei r7, 0x2, loc_244969
    bn.j loc_24496d
loc_2450c7:
    bn.extbz r3, r3
    bt.jalr r6
    bn.j loc_244a64
loc_2450cf:
    bn.addi r3, r1, 0x30
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r7, 0x30(r1)
    bg.bnei r7, 0x1, loc_244959
    bn.lwz r22, 0x58(r1)
    bn.lwz r21, 0x5c(r1)
    bn.lwz r20, 0x60(r1)
    bn.lwz r19, 0x64(r1)
    bn.lwz r18, 0x68(r1)
    bn.lwz r17, 0x6c(r1)
    bn.lwz r16, 0x70(r1)
    bn.lwz r15, 0x74(r1)
    bn.lwz r14, 0x78(r1)
    bn.lwz r13, 0x7c(r1)
    bg.lwz r12, 0x80(r1)
    bg.lwz r11, 0x84(r1)
    bg.lwz r10, 0x88(r1)
    bg.lwz r9, 0x8c(r1)
    bg.addi r1, r1, 0x90
    bt.jr r9
loc_245113:
    bg.jal 0x243a16
    bt.j loc_24502c
loc_245119:
    bn.lwz r3, 0xc(r1)
    bg.jal 0x243b38
    bn.j loc_244a03
loc_245123:
    bt.movi r3, 0x1
    bg.jal 0x243c25
    bn.sw 0x14(r1), r0
    bn.j loc_2449fc
