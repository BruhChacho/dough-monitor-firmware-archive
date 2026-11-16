# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23eb92,0x23ecff); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bt.mov r25, r6
    bt.mov r26, r7
    bg.bgtui r4, 0x5, loc_23eba0
    bg.bleui r3, 0x4, loc_23eba4
loc_23eba0:
    bt.addi r1, 0x8
    bt.jr r9
loc_23eba4:
    bg.movhi r7, 0x3b
    bg.addi r29, r7, 0x4950
    bn.ori r28, r0, 0xb0
    bn.muls r30, r4, r28
    bn.add r23, r30, r29
    bt.movi r27, 0x4
    bg.sw_0 0x84(r23), r27
    bg.sw_0 0x80(r23), r0
    bt.movi r24, 0x6
    bn.sbz 0x7f(r23), r24
    bn.sbz 0x7e(r23), r24
    bn.sbz 0x7d(r23), r24
    bn.sbz 0x7c(r23), r24
    bg.bleui r5, 0x5, loc_23ecd8
    bg.bleui r25, 0x5, loc_23ecb7
loc_23ebd5:
    bg.bleui r26, 0x5, loc_23ec8a
loc_23ebd9:
    bn.sbz 0x4(r1), r4
    bn.sbz 0x5(r1), r5
    bn.sbz 0x6(r1), r25
    bn.sbz 0x7(r1), r26
    bn.beqi r3, 0x0, loc_23ec23
loc_23ebe8:
    bg.bgtui r5, 0x5, loc_23ec23
    bg.sw_0 0x80(r23), r3
    bn.muls r5, r5, r28
    bn.add r6, r5, r29
    bg.sw_0 0x80(r6), r3
    bg.sw_0 0x84(r23), r0
    bt.movi r7, 0x1
    bg.sw_0 0x84(r6), r7
    bt.mov r7, r30
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x49c8
    bt.add r7, r6
    bn.lwz r6, 0x4(r1)
    bn.sw 0x4(r7), r6
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x49c8
    bt.add r5, r7
    bn.sw 0x4(r5), r6
loc_23ec23:
    bn.bleui r3, 0x1, loc_23ec55
    bg.bgtui r25, 0x5, loc_23ec55
    bn.ori r6, r0, 0xb0
    bn.muls r6, r25, r6
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bn.add r5, r6, r7
    bg.sw_0 0x80(r5), r3
    bt.movi r7, 0x2
    bg.sw_0 0x84(r5), r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x49c8
    bt.add r6, r7
    bn.lwz r7, 0x4(r1)
    bn.sw 0x4(r6), r7
loc_23ec55:
    bg.bleui r3, 0x2, loc_23eba0
    bg.bgtui r26, 0x5, loc_23eba0
    bn.ori r6, r0, 0xb0
    bn.muls r6, r26, r6
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bn.add r5, r6, r7
    bg.sw_0 0x80(r5), r3
    bt.movi r7, 0x3
    bg.sw_0 0x84(r5), r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x49c8
    bt.add r6, r7
    bn.lwz r7, 0x4(r1)
    bn.sw 0x4(r6), r7
    bt.j loc_23eba0
loc_23ec8a:
    bn.muls r7, r26, r28
    bt.add r7, r29
    bg.sw_0 0x84(r7), r27
    bg.sw_0 0x80(r7), r0
    bt.movi r6, 0x6
    bn.sbz 0x7f(r7), r24
    bn.sbz 0x7e(r7), r6
    bn.sbz 0x7d(r7), r6
    bn.sbz 0x7c(r7), r6
    bn.sbz 0x4(r1), r4
    bn.sbz 0x5(r1), r5
    bn.sbz 0x6(r1), r25
    bn.sbz 0x7(r1), r26
    bg.beqi r3, 0x0, loc_23ec23
    bt.j loc_23ebe8
loc_23ecb7:
    bn.muls r7, r25, r28
    bt.add r7, r29
    bg.sw_0 0x84(r7), r27
    bg.sw_0 0x80(r7), r0
    bt.movi r6, 0x6
    bn.sbz 0x7f(r7), r24
    bn.sbz 0x7e(r7), r6
    bn.sbz 0x7d(r7), r6
    bn.sbz 0x7c(r7), r6
    bg.bgtui r26, 0x5, loc_23ebd9
    bt.j loc_23ec8a
loc_23ecd8:
    bn.muls r7, r5, r28
    bg.movhi r29, 0x3b
    bg.addi r29, r29, 0x4950
    bt.add r7, r29
    bg.sw_0 0x84(r7), r27
    bg.sw_0 0x80(r7), r0
    bn.sbz 0x7f(r7), r24
    bn.sbz 0x7e(r7), r24
    bn.sbz 0x7d(r7), r24
    bn.sbz 0x7c(r7), r24
    bg.bgtui r25, 0x5, loc_23ebd5
    bt.j loc_23ecb7
