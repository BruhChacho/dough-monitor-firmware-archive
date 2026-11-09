# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22acf2,0x22ae8c); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r13, r3
    bt.mov r12, r4
    bg.beqi r3, 0x6, loc_22ad59
    bn.ori r7, r0, 0xb0
    bn.muls r11, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r11, r6
    bn.lh r6, 0x12(r11)
    bn.sra r7, r6, r4
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22ad59
    bt.movi r14, 0x1
    bn.sll r10, r14, r4
    bg.beq r6, r10, loc_22ad70
    bn.nand r7, r10, r10
    bn.and r7, r6, r7
    bn.sh_2 0x12(r11), r7
    bn.lbz r7, 0x10(r11)
    bg.beq r4, r7, loc_22ade0
loc_22ad44:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r12, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bt.movi r6, 0x6
    bn.sbz 0x1d(r7), r6
loc_22ad59:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_22ad70:
    bt.movi r3, 0x1
    bg.jal 0x220a8b
    bt.movi r7, 0x4
    bn.sbz 0x10(r11), r7
    bn.sh_2 0x12(r11), r0
    bn.sw 0xc(r11), r0
    bt.movi r3, 0x0
    bn.exthz r4, r10
    bg.jal 0x23d3a0
    bt.movi r3, 0x0
    bn.lwz r4, 0x0(r11)
    bn.lwz r5, 0x4(r11)
    bg.jal 0x20f1ef
    bn.bgtui r12, 0x3, loc_22adcb
    bg.movhi r7, 0x45
    bg.lbz r7, 0x508c(r7)
    bn.beqi r7, 0x0, loc_22adcb
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r7, 0x59(r7)
    bn.bnei r7, 0x0, loc_22adcb
    bn.ori r7, r0, 0x18
    bn.muls r7, r13, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4288
    bt.add r7, r6
    bn.sbz 0x0(r7), r14
    bn.sbz 0x1(r7), r0
    bn.sbz 0x11(r7), r0
loc_22adcb:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.sbz 0x70(r7), r0
    bt.j loc_22ad44
loc_22ade0:
    bt.movi r3, 0x0
    bn.exthz r4, r10
    bg.jal 0x23d3a0
    bn.lh r3, 0x12(r11)
    bg.jal 0x222b35
    bn.sbz 0x10(r11), r3
    bg.beqi r3, 0xd, loc_22ae77
    bg.jal 0x2227ef
    bt.mov r10, r3
    bt.mov r3, r12
    bg.jal 0x2227ef
    bn.ori r7, r0, 0x58
    bn.muls r7, r13, r7
    bt.add r10, r7
    bn.slli r10, r10, 0x1
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r10, r6
    bt.add r7, r3
    bn.slli r7, r7, 0x1
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lh r6, 0x2c(r7)
    bn.sh_1 0x2c(r10), r6
    bn.lh r6, 0x34(r7)
    bn.sh_1 0x34(r10), r6
    bn.lh r6, 0x3c(r7)
    bn.sh_1 0x3c(r10), r6
    bn.lh r7, 0x44(r7)
    bn.sh_1 0x44(r10), r7
    bn.lbz r4, 0x10(r11)
    bn.sll r4, r14, r4
    bt.movi r3, 0x1
    bn.exthz r4, r4
    bg.jal 0x23d3a0
loc_22ae4e:
    bn.ori r7, r0, 0xb0
    bn.muls r10, r13, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r10, r7
    bn.lbz r3, 0x10(r10)
    bg.jal 0x21d7d4
    bg.sfnei r3, 0x1fff
    bn.bf loc_22ad44
    bt.movi r3, 0x0
    bn.lbz r4, 0x10(r10)
    bg.jal 0x21e36f
    bt.j loc_22ad44
loc_22ae77:
    bn.lbz r6, 0x1c(r11)
    bn.ori r7, r6, 0x1
    bn.sbz 0x1c(r11), r7
    bn.lh r3, 0x12(r11)
    bg.jal 0x2402c4
    bn.sbz 0x10(r11), r3
    bt.j loc_22ae4e
