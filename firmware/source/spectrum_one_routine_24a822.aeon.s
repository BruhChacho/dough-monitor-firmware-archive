# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24a822,0x24a967); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bn.sw 0x24(r1), r12
    bn.sw 0x20(r1), r13
    bn.sw 0x1c(r1), r14
    bn.sw 0x18(r1), r15
    bn.sw 0x14(r1), r16
    bn.sw 0x10(r1), r17
    bt.mov r14, r3
    bt.mov r11, r4
    bt.mov r16, r5
    bg.movhi r10, 0x45
    bg.sbz 0x6267(r10), r0
    bt.movi r3, 0x0
    bg.jal 0x24f810
    bt.movi r17, 0x0
    bg.beq r14, r3, loc_24a868
    bn.addi r7, r14, -0x80
    bn.exthz r14, r7
    bt.movi r7, 0x1
    bg.sbz 0x6267(r10), r7
    bt.movi r17, 0x1
loc_24a868:
    bg.sfeqi r11, 0xff
    bn.bf loc_24a936
    bt.movi r13, 0x1
    bg.movhi r15, 0x45
loc_24a875:
    bt.movi r12, 0x0
    bt.j loc_24a888
loc_24a879:
    bt.addi r12, 0x1
    bn.extbz r7, r12
    bg.ble r13, r7, loc_24a8e5
loc_24a882:
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
loc_24a888:
    bg.addi r7, r15, 0x6268
    bn.lwz r7, 0xc(r7)
    bt.add r7, r11
    bn.lbz r7, 0x0(r7)
    bn.bnei r7, 0x0, loc_24a879
    bt.mov r3, r14
    bt.mov r4, r11
    bg.jal 0x249e95
    bn.extbz r3, r3
    bn.beqi r16, 0x0, loc_24a8b7
    bn.sfeqi r11, 0x18
    bn.bf loc_24a949
    bn.addi r7, r11, -0x17
    bn.extbz r7, r7
    bn.sfgtui r7, 0xb
    bn.cmov_0 r3, r3, r0
loc_24a8b7:
    bt.mov r4, r11
    bg.jal 0x249ec2
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bn.addi r7, r11, -0x45
    bn.extbz r7, r7
    bn.bgtui r7, 0x1, loc_24a8d5
    bn.beqi r17, 0x1, loc_24a905
loc_24a8d5:
    bn.addi r3, r1, 0x8
    bg.jal 0x24a2a2
    bt.addi r12, 0x1
    bn.extbz r7, r12
    bg.bgt r13, r7, loc_24a882
loc_24a8e5:
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
loc_24a905:
    bg.ori r3, r0, 0x2316
    bg.jal 0x27baa2
    bt.mov r10, r3
    bg.ori r3, r0, 0x2316
    bg.ori r4, r0, 0x303
    bg.ori r5, r0, 0xffff
    bg.jal 0x27ba56
    bn.addi r3, r1, 0x8
    bg.jal 0x24a2a2
    bg.ori r3, r0, 0x2316
    bt.mov r4, r10
    bg.ori r5, r0, 0xffff
    bg.jal 0x27ba56
    bt.j loc_24a879
loc_24a936:
    bg.movhi r15, 0x45
    bg.addi r7, r15, 0x6268
    bn.lbz r13, 0x1(r7)
    bt.movi r11, 0x0
    bg.bnei r13, 0x0, loc_24a875
    bt.j loc_24a8e5
loc_24a949:
    bt.movi r3, 0x5
    bn.ori r4, r0, 0x18
    bg.jal 0x249ec2
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bn.addi r3, r1, 0x8
    bg.jal 0x24a2a2
    bt.j loc_24a879
