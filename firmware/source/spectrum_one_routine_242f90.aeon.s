# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x242f90,0x243142); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bg.movhi r10, 0x45
    bg.lwz r7, 0x5230(r10)
    bg.ori r6, r0, 0x1380
    bg.beqi r7, 0x1, loc_2430ac
loc_242fac:
    bg.movhi r11, 0x45
    bg.lwz r7, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0x5
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r5, 0x1
    bn.sbz 0x0(r7), r5
loc_243010:
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ac
    bg.ori r6, r0, 0x1bac
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13ad
    bg.ori r6, r0, 0x1bad
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bg.jal 0x242adc
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1394
    bg.ori r6, r0, 0x1b94
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.lbz r7, 0x0(r7)
    bn.extbz r3, r7
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
loc_2430ac:
    bt.mov r3, r1
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r5, 0x0(r1)
    bg.ori r6, r0, 0x1b80
    bg.bnei r5, 0x1, loc_242fac
    bg.movhi r11, 0x45
    bg.lwz r6, 0x3cf0(r11)
    bt.movi r7, 0xf
    bg.sbz 0x1b80(r6), r7
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.addi r6, r0, -0x40
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b0
    bg.ori r6, r0, 0x1bb0
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b1
    bg.ori r6, r0, 0x1bb1
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bn.sbz 0x0(r7), r0
    bg.lwz r7, 0x5230(r10)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a8
    bg.ori r6, r0, 0x1ba8
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r11)
    bt.add r7, r6
    bt.movi r6, 0x2
    bn.sbz 0x0(r7), r6
    bt.j loc_243010
