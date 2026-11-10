# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22eb07,0x22ed53); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bn.sw 0x1c(r1), r11
    bn.sw 0x18(r1), r12
    bn.sw 0x14(r1), r13
    bn.sw 0x10(r1), r14
    bn.sw 0xc(r1), r15
    bn.sw 0x8(r1), r16
    bt.mov r13, r3
    bn.sw 0x0(r1), r4
    bn.sw 0x4(r1), r5
    bg.jal 0x2227da
    bt.mov r10, r3
    bt.mov r3, r13
    bt.mov r4, r10
    bg.jal 0x226701
    bt.mov r15, r3
    bn.ori r7, r0, 0xb0
    bn.muls r10, r10, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r10, r6
    bg.lwz r16, 0x80(r10)
    bn.ori r7, r0, 0xa8
    bn.muls r11, r13, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r11, r7
    bn.lh r10, 0x2a(r11)
    bt.movi r14, 0x4
    bg.bnei r10, 0x0, loc_22ec93
loc_22eb67:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bt.movi r12, 0x4
    bn.lbz r7, 0x35(r7)
    bg.bnei r7, 0x0, loc_22ec30
loc_22eb80:
    bg.beqi r15, 0x1, loc_22ec4b
loc_22eb84:
    bn.bnei r15, 0x0, loc_22ebd7
    bg.beqi r12, 0x4, loc_22ecf4
    bt.mov r3, r14
    bt.mov r4, r12
    bg.jal 0x22419b
loc_22eb93:
    bn.ori r7, r0, 0xa8
    bn.muls r10, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lbz r7, 0x59(r10)
    bg.bnei r7, 0x0, loc_22ec8b
loc_22ebaa:
    bn.lbz r10, 0x5b(r10)
    bn.beqi r10, 0x0, loc_22ebb6
    bt.mov r3, r13
    bg.jal 0x224dac
loc_22ebb6:
    bt.mov r3, r13
    bn.lwz r16, 0x8(r1)
    bn.lwz r15, 0xc(r1)
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bg.j 0x225e4e
loc_22ebd7:
    bn.ori r7, r0, 0xa8
    bn.muls r10, r13, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_22eb93
    bg.jal 0x2229b7
    bn.bgtui r3, 0x1, loc_22eb93
    bt.movi r7, 0x2
    bn.xor r7, r16, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bg.lbz r10, 0x97(r10)
    bn.beqi r10, 0x0, loc_22ec10
    bn.bnei r7, 0x0, loc_22eb93
loc_22ec10:
    bg.beqi r16, 0x1, loc_22ed33
    bg.bnei r7, 0x0, loc_22ed10
    bg.beqi r16, 0x3, loc_22ed20
    bg.bnei r16, 0x4, loc_22eb93
    bt.mov r3, r14
    bt.mov r4, r12
    bn.lwz r5, 0x0(r1)
    bn.lwz r6, 0x4(r1)
    bg.jal 0x2272cf
    bt.j loc_22eb93
loc_22ec30:
    bt.mov r3, r14
    bg.jal 0x22a9bd
    bt.mov r12, r3
    bg.beqi r3, 0x4, loc_22eb80
    bn.andi r7, r14, 0x2
    bg.beqi r7, 0x0, loc_22eb80
    bt.mov r12, r14
    bt.mov r14, r3
    bg.bnei r15, 0x1, loc_22eb84
loc_22ec4b:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r7, 0x38(r7)
    bg.bnei r7, 0x0, loc_22ecfc
    bg.beqi r12, 0x4, loc_22ece6
    bt.mov r3, r14
    bt.mov r4, r12
    bn.lwz r5, 0x0(r1)
    bn.lwz r6, 0x4(r1)
    bg.jal 0x22ae8c
    bn.ori r7, r0, 0xa8
    bn.muls r10, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lbz r7, 0x59(r10)
    bg.beqi r7, 0x0, loc_22ebaa
loc_22ec8b:
    bt.mov r3, r13
    bg.jal 0x224f15
    bt.j loc_22ebaa
loc_22ec93:
    bt.mov r3, r10
    bg.jal 0x2402c4
    bt.mov r14, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.sub r7, r10, r7
    bn.exthz r3, r7
    bg.beqi r3, 0x0, loc_22eb67
    bg.jal 0x2402c4
    bt.mov r12, r3
    bg.beqi r3, 0x4, loc_22eb67
    bn.andi r7, r14, 0x2
    bn.beqi r7, 0x0, loc_22ecc2
    bg.beqi r14, 0x4, loc_22ed0c
    bt.mov r12, r14
    bt.mov r14, r3
loc_22ecc2:
    bn.lh r6, 0x18(r11)
    bn.lh r7, 0x1c(r11)
    bt.add r7, r6
    bg.sflesi r7, 0x780
    bn.bf loc_22ecd8
    bg.sfleui r6, 0x77f
    bn.bf loc_22eb80
loc_22ecd8:
    bt.mov r3, r14
    bt.mov r4, r12
    bg.jal 0x22ea26
    bt.mov r14, r3
    bt.movi r12, 0x4
    bt.j loc_22eb80
loc_22ece6:
    bt.mov r3, r14
    bn.lwz r4, 0x0(r1)
    bn.lwz r5, 0x4(r1)
    bg.jal 0x22df19
    bt.j loc_22eb93
loc_22ecf4:
    bt.mov r3, r14
    bg.jal 0x2245e6
    bt.j loc_22eb93
loc_22ecfc:
    bt.mov r3, r14
    bt.mov r4, r12
    bn.lwz r5, 0x0(r1)
    bn.lwz r6, 0x4(r1)
    bg.jal 0x22e6f9
    bt.j loc_22eb93
loc_22ed0c:
    bt.mov r14, r3
    bt.j loc_22eb67
loc_22ed10:
    bt.mov r3, r14
    bt.mov r4, r12
    bn.lwz r5, 0x0(r1)
    bn.lwz r6, 0x4(r1)
    bg.jal 0x229450
    bt.j loc_22eb93
loc_22ed20:
    bn.beqi r15, 0x3, loc_22ed43
    bt.mov r3, r14
    bt.mov r4, r12
    bn.lwz r5, 0x0(r1)
    bn.lwz r6, 0x4(r1)
    bg.jal 0x228a16
    bt.j loc_22eb93
loc_22ed33:
    bt.mov r3, r14
    bt.mov r4, r12
    bn.lwz r5, 0x0(r1)
    bn.lwz r6, 0x4(r1)
    bg.jal 0x22a02c
    bt.j loc_22eb93
loc_22ed43:
    bt.mov r3, r14
    bt.mov r4, r12
    bn.lwz r5, 0x0(r1)
    bn.lwz r6, 0x4(r1)
    bg.jal 0x227fc6
    bt.j loc_22eb93
