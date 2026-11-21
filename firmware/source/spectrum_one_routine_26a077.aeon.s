# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26a077,0x26a4d0); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bn.sw 0x1c(r1), r11
    bn.sw 0x18(r1), r12
    bn.sw 0x14(r1), r13
    bn.sw 0x10(r1), r14
    bg.movhi r12, 0x3b
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r3, 0x5a(r7)
    bg.jal 0x27e9b2
    bn.extbz r10, r3
    bn.ff1 r7, r10
    bt.addi r7, -0x1
    bn.srli r14, r7, 0x1f
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3c28(r7)
    bn.beqi r7, 0x0, loc_26a0b5
    bg.bnei r14, 0x0, loc_26a3bb
loc_26a0b5:
    bg.jal 0x27f448
    bg.beqi r10, 0x0, loc_26a335
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
    bg.jal 0x206417
    bn.addi r3, r1, 0xc
    bt.movi r4, 0x9
    bg.jal 0x2651fb
loc_26a0d3:
    bg.jal 0x2421d3
    bg.movhi r11, 0x3b
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r10, 0x5a(r7)
    bt.mov r3, r10
    bg.jal 0x23eee9
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x23f12d
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r10, 0x5a(r7)
    bt.mov r3, r10
    bg.jal 0x23e760
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x23a1b8
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r3, 0x5a(r7)
    bg.jal 0x23e760
    bg.beqi r3, 0x0, loc_26a2fa
    bg.lwz r6, 0x5f38(r11)
    bn.lbz r11, 0x5a(r6)
    bn.add r5, r6, r11
    bn.ori r10, r0, 0x29
    bn.muls r10, r11, r10
    bn.ori r7, r0, 0xa4
    bn.lbz r5, 0x5b(r5)
    bn.muls r7, r7, r5
    bt.add r10, r7
    bt.add r10, r6
    bg.lbz r3, 0xd8(r10)
    bg.jal 0x265650
    bt.mov r4, r3
    bg.lbz r5, 0xd7(r10)
    bg.lbz r6, 0xd2(r10)
    bn.lbz r7, 0xc(r1)
    bn.lbz r8, 0xd(r1)
    bn.lbz r23, 0xe(r1)
    bn.sw 0x0(r1), r23
    bt.mov r3, r11
    bg.jal 0x23a423
loc_26a155:
    bg.movhi r10, 0x3b
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r3, 0x5a(r7)
    bg.jal 0x23e760
    bg.beqi r3, 0x0, loc_26a2d1
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x1
    bg.jal 0x239fb8
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x1
    bg.jal 0x239f7e
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x1
    bg.jal 0x239f82
loc_26a18f:
    bg.movhi r13, 0x3b
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r3, 0x5a(r5)
    bn.add r6, r5, r3
    bn.ori r11, r0, 0x29
    bn.muls r7, r3, r11
    bn.ori r10, r0, 0xa4
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r4, 0xde(r7)
    bg.lbz r5, 0xe0(r7)
    bg.lbz r6, 0xdf(r7)
    bg.jal 0x23a241
    bg.beqi r14, 0x0, loc_26a2b0
    bg.jal 0x2063ed
    bg.beqi r3, 0x0, loc_26a381
loc_26a1cc:
    bg.jal 0x2063ed
    bg.beqi r3, 0x0, loc_26a3ca
loc_26a1d4:
    bg.movhi r13, 0x3b
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r3, 0x5a(r5)
    bn.add r6, r5, r3
    bn.ori r11, r0, 0x29
    bn.muls r7, r3, r11
    bn.ori r10, r0, 0xa4
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r4, 0xf8(r7)
    bg.jal 0x25437d
    bg.jal 0x2063ed
    bn.bnei r3, 0x0, loc_26a27e
    bg.movhi r5, 0x45
    bg.lwz r6, 0x3cb8(r5)
    bg.ori r4, r0, 0x800
    bn.and r7, r6, r4
    bg.bnei r7, 0x0, loc_26a497
    bg.lwz r5, 0x5f38(r13)
    bn.lbz r3, 0x5a(r5)
    bn.add r6, r5, r3
    bn.muls r7, r3, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r7, 0xd5(r7)
    bg.beqi r7, 0x2, loc_26a424
    bg.jal 0x27e9b2
    bg.bnei r3, 0x0, loc_26a4c9
    bg.lwz r5, 0x5f38(r13)
    bn.lbz r7, 0x5a(r5)
    bg.movhi r4, 0x3d
    bg.addi r4, r4, -0x4df4
    bt.add r7, r4
    bn.sbz 0x0(r7), r0
loc_26a252:
    bn.lbz r3, 0x5a(r5)
    bn.add r7, r5, r3
    bn.muls r6, r3, r11
    bn.lbz r7, 0x5b(r7)
    bn.muls r7, r10, r7
    bt.add r6, r7
    bt.add r6, r5
    bg.lbz r4, 0xd5(r6)
    bg.beqi r4, 0x2, loc_26a424
    bn.slli r4, r4, 0x5
    bg.movhi r6, 0x3d
    bg.addi r6, r6, -0x5f94
    bt.add r4, r6
    bg.jal 0x2693a8
loc_26a27e:
    bg.jal 0x26691b
    bg.jal 0x267856
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r4, 0x4a(r7)
    bn.lbz r3, 0x5a(r7)
    bn.andi r4, r4, 0x8
    bg.jal 0x2675e6
    bt.movi r3, 0x0
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bt.jr r9
loc_26a2b0:
    bg.lwz r5, 0x5f38(r13)
    bn.lbz r3, 0x5a(r5)
    bn.add r6, r5, r3
    bn.muls r7, r3, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r4, 0xf8(r7)
    bg.jal 0x25437d
    bt.j loc_26a27e
loc_26a2d1:
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
    bg.jal 0x239fb8
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
    bg.jal 0x239f7e
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
    bg.jal 0x239f82
    bt.j loc_26a18f
loc_26a2fa:
    bg.lwz r5, 0x5f38(r11)
    bn.lbz r3, 0x5a(r5)
    bn.add r4, r5, r3
    bn.ori r6, r0, 0x29
    bn.muls r6, r3, r6
    bn.ori r7, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r7, r7, r4
    bt.add r6, r7
    bt.add r6, r5
    bg.lbz r4, 0xd2(r6)
    bg.jal 0x23a327
    bg.lwz r7, 0x5f38(r11)
    bn.lbz r3, 0x5a(r7)
    bn.lbz r4, 0xc(r1)
    bn.lbz r5, 0xd(r1)
    bn.lbz r6, 0xe(r1)
    bg.jal 0x23a4d7
    bt.j loc_26a155
loc_26a335:
    bg.jal 0x2063ed
    bg.bnei r3, 0x0, loc_26a3d0
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r6, 0x5a(r5)
    bn.add r4, r5, r6
    bn.ori r7, r0, 0x29
    bn.muls r6, r6, r7
    bn.ori r7, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r7, r7, r4
    bt.add r6, r7
    bt.add r6, r5
    bg.lbz r7, 0xd9(r6)
    bg.beqi r7, 0x1, loc_26a485
    bg.bgtui r7, 0x0, loc_26a40d
    bg.lbz r3, 0xd6(r6)
    bg.jal 0x265c4e
    bt.mov r4, r3
    bn.addi r3, r1, 0xc
    bg.jal 0x2651fb
    bn.ori r3, r0, 0x22
    bg.jal 0x205b56
    bn.j loc_26a0d3
loc_26a381:
    bg.lwz r5, 0x5f38(r13)
    bg.lbz r7, 0xb9(r5)
    bg.beqi r7, 0x0, loc_26a462
    bg.bnei r7, 0x1, loc_26a1cc
    bn.lbz r7, 0x48(r5)
    bn.lbz r6, 0x49(r5)
    bn.slli r6, r6, 0x8
    bn.or r6, r6, r7
    bg.ori r4, r0, 0x100
    bn.and r7, r6, r4
    bg.bnei r7, 0x0, loc_26a1cc
    bg.ori r7, r6, 0x100
    bn.sbz 0x48(r5), r7
    bn.srli r7, r7, 0x8
    bn.sbz 0x49(r5), r7
    bg.jal 0x2475c9
    bt.j loc_26a1cc
loc_26a3bb:
    bg.jal 0x2063ed
    bg.bnei r3, 0x0, loc_26a0b5
    bg.jal 0x236b04
    bn.j loc_26a0b5
loc_26a3ca:
    bg.jal 0x2684e9
    bt.j loc_26a1d4
loc_26a3d0:
    bg.jal 0x2063ed
    bg.beqi r3, 0x0, loc_26a0d3
    bn.addi r3, r1, 0xc
    bt.movi r4, 0x9
    bg.jal 0x2651fb
    bn.ori r3, r0, 0x22
    bg.jal 0x205b56
    bt.movi r3, 0x0
    bg.jal 0x2055c2
    bn.ori r3, r0, 0x64
    bg.jal 0x23a594
    bg.jal 0x2686be
    bt.movi r3, 0x1
    bg.jal 0x238383
    bn.ori r3, r0, 0xff
    bg.jal 0x26a06e
    bg.jal 0x236b04
    bn.j loc_26a0d3
loc_26a40d:
    bg.bnei r7, 0x3, loc_26a0d3
    bn.addi r3, r1, 0xc
    bt.movi r4, 0x9
    bg.jal 0x2651fb
    bn.ori r3, r0, 0x22
    bg.jal 0x205b56
    bn.j loc_26a0d3
loc_26a424:
    bt.movi r4, 0x0
    bg.jal 0x23a12d
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r6, 0x5a(r5)
    bn.add r4, r5, r6
    bn.ori r7, r0, 0x29
    bn.muls r6, r6, r7
    bn.ori r7, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r7, r7, r4
    bt.add r6, r7
    bt.add r6, r5
    bg.lbz r3, 0xd9(r6)
    bg.jal 0x204168
    bg.jal 0x205531
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x1
    bg.jal 0x23a12d
    bt.j loc_26a27e
loc_26a462:
    bn.lbz r6, 0x48(r5)
    bn.lbz r7, 0x49(r5)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r6
    bg.ori r4, r0, 0xfeff
    bn.and r7, r7, r4
    bn.sbz 0x48(r5), r7
    bn.srli r7, r7, 0x8
    bn.sbz 0x49(r5), r7
    bg.jal 0x247656
    bn.j loc_26a1cc
loc_26a485:
    bn.addi r3, r1, 0xc
    bt.movi r4, 0x9
    bg.jal 0x2651fb
    bt.movi r3, 0x0
    bg.jal 0x205b56
    bn.j loc_26a0d3
loc_26a497:
    bg.addi r4, r0, -0x801
    bn.and r7, r6, r4
    bg.sw_0 0x3cb8(r5), r7
    bg.lwz r7, 0x5f38(r13)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
    bg.jal 0x23a12d
    bg.lwz r7, 0x5f38(r13)
    bn.lbz r7, 0x5a(r7)
    bg.movhi r6, 0x3d
    bg.addi r6, r6, -0x4df4
    bt.add r7, r6
    bn.ori r6, r0, 0x7f
    bn.sbz 0x0(r7), r6
    bn.j loc_26a27e
loc_26a4c9:
    bg.lwz r5, 0x5f38(r13)
    bn.j loc_26a252
