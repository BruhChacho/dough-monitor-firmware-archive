# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x243c25,0x243e44); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x38
    bn.sw 0x34(r1), r9
    bn.sw 0x30(r1), r10
    bn.sw 0x2c(r1), r11
    bn.sw 0x28(r1), r12
    bt.mov r12, r3
    bg.movhi r11, 0x45
    bg.lwz r7, 0x5230(r11)
    bg.beqi r7, 0x1, loc_243dfc
loc_243c42:
    bg.jal 0x242aaf
    bg.bnei r12, 0x0, loc_243e1c
loc_243c4a:
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r6, r0, 0x1380
    bg.ori r7, r0, 0x1b80
    bn.cmov_0 r6, r6, r7
    bg.movhi r10, 0x45
    bg.lwz r7, 0x3cf0(r10)
    bt.add r6, r7
    bt.movi r7, 0x6
    bn.sbz 0x0(r6), r7
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3c43(r7)
    bg.sfnei r7, 0xc2
    bn.bnf loc_243e24
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.addi r6, r0, -0x39
    bn.sbz 0x0(r7), r6
loc_243c98:
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1384
    bg.ori r6, r0, 0x1b84
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
    bn.ori r6, r0, 0x11
    bn.sbz 0x0(r7), r6
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13a9
    bg.ori r6, r0, 0x1ba9
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bt.movi r5, 0x1
    bn.sbz 0x0(r7), r5
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
    bn.sbz 0x0(r7), r5
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x13b4
    bg.ori r6, r0, 0x1bb4
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.sbz 0x0(r7), r5
    bt.j loc_243d85
loc_243d7d:
    bg.ori r3, r0, 0x1f4
    bg.jal 0x24209d
loc_243d85:
    bg.lwz r6, 0x5230(r11)
    bg.ori r23, r0, 0x1bb8
    bg.ori r4, r0, 0x13b8
    bn.sfeqi r6, 0x1
    bn.cmov_0 r7, r23, r4
    bg.lwz r5, 0x3cf0(r10)
    bt.add r7, r5
    bn.lbz r7, 0x0(r7)
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_243d7d
    bn.sfeqi r6, 0x1
    bn.cmov_0 r7, r23, r4
    bt.add r7, r5
    bn.lbz r7, 0x0(r7)
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_243dcd
    bn.bnei r12, 0x0, loc_243de5
loc_243dba:
    bn.lwz r12, 0x28(r1)
    bn.lwz r11, 0x2c(r1)
    bn.lwz r10, 0x30(r1)
    bn.lwz r9, 0x34(r1)
    bn.addi r1, r1, 0x38
    bg.j 0x242a8d
loc_243dcd:
    bn.sfnei r6, 0x1
    bg.ori r7, r0, 0x13bc
    bg.ori r6, r0, 0x1bbc
    bn.cmov_0 r7, r7, r6
    bt.add r7, r5
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bn.beqi r12, 0x0, loc_243dba
loc_243de5:
    bg.jal 0x243a16
    bn.lwz r12, 0x28(r1)
    bn.lwz r11, 0x2c(r1)
    bn.lwz r10, 0x30(r1)
    bn.lwz r9, 0x34(r1)
    bn.addi r1, r1, 0x38
    bg.j 0x242a8d
loc_243dfc:
    bt.mov r3, r1
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r7, 0x0(r1)
    bg.bnei r7, 0x1, loc_243c42
    bn.lwz r12, 0x28(r1)
    bn.lwz r11, 0x2c(r1)
    bn.lwz r10, 0x30(r1)
    bn.lwz r9, 0x34(r1)
    bn.addi r1, r1, 0x38
    bt.jr r9
loc_243e1c:
    bt.movi r3, 0x0
    bg.jal 0x243b38
    bt.j loc_243c4a
loc_243e24:
    bg.lwz r7, 0x5230(r11)
    bn.sfnei r7, 0x1
    bg.ori r7, r0, 0x1381
    bg.ori r6, r0, 0x1b81
    bn.cmov_0 r7, r7, r6
    bg.lwz r6, 0x3cf0(r10)
    bt.add r7, r6
    bn.ori r6, r0, 0x60
    bn.sbz 0x0(r7), r6
    bt.j loc_243c98
