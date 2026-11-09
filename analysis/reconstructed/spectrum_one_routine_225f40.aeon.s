# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x225f40,0x226030); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r13, r3
    bt.mov r12, r4
    bt.mov r14, r4
    bg.bnei r4, 0x4, loc_225f6e
    bt.j loc_22602a
loc_225f64:
    bn.addi r7, r12, 0x1
    bn.extbz r12, r7
    bg.bgt r12, r14, loc_226010
loc_225f6e:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r12, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r6, r5
    bn.lbz r7, 0x28(r6)
    bg.bne r13, r7, loc_225f64
    bn.lwz r7, 0x4(r6)
    bn.beqi r7, 0x0, loc_225f64
    bg.lbz r7, 0x98(r6)
    bn.beqi r7, 0x0, loc_225fcf
    bt.mov r6, r7
    bt.movi r4, 0x0
    bn.ori r25, r0, 0x18
    bg.movhi r7, 0x2b
    bg.lwz r24, -0x9d8(r7)
    bg.addi r7, r7, -0x9d8
    bn.lwz r23, 0x4(r7)
loc_225fa8:
    bn.extbz r5, r4
    bn.andi r7, r6, 0x1
    bn.beqi r7, 0x0, loc_225fc7
    bn.muls r7, r5, r25
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x5c4
    bt.add r7, r5
    bn.sbz 0x0(r7), r0
    bn.sw 0xc(r7), r24
    bn.sw 0x10(r7), r23
loc_225fc7:
    bn.srli r6, r6, 0x1
    bt.addi r4, 0x1
    bn.bnei r6, 0x0, loc_225fa8
loc_225fcf:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r12, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.sbz 0x98(r7), r0
    bn.lh r10, 0x2c(r7)
    bg.beqi r10, 0x0, loc_225f64
    bt.movi r11, 0x0
loc_225fec:
    bn.extbz r4, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_225ffe
    bn.bgtui r4, 0x3, loc_225ffe
    bt.mov r3, r13
    bg.jal 0x21ddcf
loc_225ffe:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_225fec
    bn.addi r7, r12, 0x1
    bn.extbz r12, r7
    bg.ble r12, r14, loc_225f6e
loc_226010:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_22602a:
    bt.movi r12, 0x0
    bt.movi r14, 0x3
    bt.j loc_225f6e
