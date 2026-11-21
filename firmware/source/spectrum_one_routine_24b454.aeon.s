# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24b454,0x24b5a1); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bt.movi r6, -0x1
    bg.movhi r7, 0x45
    bg.addi r26, r7, 0x7270
    bg.movhi r7, 0x45
    bg.addi r3, r7, 0x7268
    bg.movhi r7, 0x45
    bg.addi r2, r7, 0x7260
    bg.movhi r7, 0x45
    bg.addi r31, r7, 0x7258
    bg.movhi r7, 0x45
    bg.addi r30, r7, 0x7250
    bg.movhi r7, 0x45
    bg.addi r29, r7, 0x7248
    bg.movhi r7, 0x45
    bg.addi r28, r7, 0x7240
    bg.movhi r7, 0x45
    bg.addi r27, r7, 0x7238
    bg.movhi r7, 0x45
    bg.addi r25, r7, 0x7230
    bg.movhi r7, 0x45
    bg.addi r24, r7, 0x7228
    bg.movhi r7, 0x45
    bg.addi r23, r7, 0x7220
    bg.movhi r7, 0x45
    bg.addi r4, r7, 0x7218
    bg.movhi r7, 0x45
    bg.addi r5, r7, 0x7210
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7208
    bn.addi r8, r26, 0x8
loc_24b4d8:
    bn.sbz 0x0(r7), r6
    bn.sbz 0x0(r5), r6
    bn.sbz 0x0(r4), r6
    bn.sbz 0x0(r23), r6
    bn.sbz 0x0(r24), r6
    bn.sbz 0x0(r25), r6
    bn.sbz 0x0(r27), r6
    bn.sbz 0x0(r28), r6
    bn.sbz 0x0(r29), r6
    bn.sbz 0x0(r30), r6
    bn.sbz 0x0(r31), r6
    bn.sbz 0x0(r2), r6
    bn.sbz 0x0(r3), r6
    bn.sbz 0x0(r26), r6
    bt.addi r7, 0x1
    bt.addi r5, 0x1
    bt.addi r4, 0x1
    bt.addi r23, 0x1
    bt.addi r24, 0x1
    bt.addi r25, 0x1
    bt.addi r27, 0x1
    bt.addi r28, 0x1
    bt.addi r29, 0x1
    bt.addi r30, 0x1
    bt.addi r31, 0x1
    bt.addi r2, 0x1
    bt.addi r3, 0x1
    bt.addi r26, 0x1
    bg.bne r26, r8, loc_24b4d8
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x6a74
    bn.lbz r6, 0x1(r7)
    bn.beqi r6, 0x0, loc_24b590
    bt.movi r10, 0x0
    bt.movi r11, 0x0
    bt.mov r12, r7
    bt.j loc_24b54d
loc_24b538:
    bn.sfnei r6, 0x17
    bn.bnf loc_24b55b
loc_24b53e:
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bt.addi r11, 0x1
    bn.lbz r7, 0x1(r12)
    bg.ble r7, r10, loc_24b590
loc_24b54d:
    bn.extbz r6, r11
    bn.lwz r7, 0xc(r12)
    bt.add r7, r10
    bn.lbz r7, 0x0(r7)
    bn.bnei r7, 0x0, loc_24b538
loc_24b55b:
    bg.sfeqi r6, 0xa7
    bn.bf loc_24b53e
    bn.beqi r6, 0x0, loc_24b53e
    bn.ori r3, r0, 0xfe
    bt.mov r4, r10
    bg.jal 0x24ab1c
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bn.addi r3, r1, 0x8
    bg.jal 0x24ad93
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bt.addi r11, 0x1
    bn.lbz r7, 0x1(r12)
    bg.bgt r7, r10, loc_24b54d
loc_24b590:
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
