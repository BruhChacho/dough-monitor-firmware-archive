# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2440d9,0x2442ef); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.sw 0x4(r1), r15
    bn.sw 0x0(r1), r16
    bt.mov r16, r3
    bt.mov r12, r4
    bt.mov r10, r5
    bt.mov r14, r6
    bg.jal 0x242aaf
    bg.bnei r16, 0x0, loc_2442e7
loc_244104:
    bg.beqi r14, 0x0, loc_2442c1
    bt.mov r13, r10
    bg.movhi r11, 0x45
    bg.movhi r10, 0x45
    bt.movi r15, 0x1
    bt.j loc_244118
loc_244116:
    bt.addi r12, 0x1
loc_244118:
    bg.jal 0x243ac2
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1380
    bg.ori r6, r0, 0x1b80
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x6
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x2
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1384
    bg.ori r7, r0, 0x1b84
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bn.srli r7, r12, 0x10
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1385
    bg.ori r7, r0, 0x1b85
    bn.cmov_0 r6, r6, r7
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bn.srli r7, r12, 0x8
    bn.extbz r7, r7
    bn.sbz 0x0(r6), r7
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1388
    bg.ori r6, r0, 0x1b88
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.extbz r6, r12
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1389
    bg.ori r6, r0, 0x1b89
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.lbz r6, 0x0(r13)
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x138c
    bg.ori r6, r0, 0x1b8c
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x5
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r6, -0x10
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.ori r6, r0, 0x51
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r15
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r15
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r15
    bg.jal 0x242adc
    bt.addi r14, -0x1
    bt.addi r13, 0x1
    bg.bnei r14, 0x0, loc_244116
loc_2442c1:
    bn.beqi r16, 0x0, loc_2442c8
    bg.jal 0x243a16
loc_2442c8:
    bn.lwz r16, 0x0(r1)
    bn.lwz r15, 0x4(r1)
    bn.lwz r14, 0x8(r1)
    bn.lwz r13, 0xc(r1)
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bg.j 0x242a8d
loc_2442e7:
    bt.mov r3, r12
    bg.jal 0x243b38
    bt.j loc_244104
