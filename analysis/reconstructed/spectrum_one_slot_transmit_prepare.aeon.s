# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20cd94,0x20cf64); Add header/checksum, set transmit metadata, queue initial bytes and arm slot control.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bn.sw 0x4(r1), r16
    bn.sw 0x0(r1), r17
    bt.mov r13, r3
    bn.slli r14, r3, 0x7
    bg.movhi r17, 0x48
    bg.addi r5, r17, -0x1480
    bn.add r11, r14, r5
    bn.lbz r7, 0x0(r11)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x80
    bn.sbz 0x0(r11), r7
    bn.lbz r10, 0x0(r11)
    bn.andi r10, r10, 0x7f
    bt.addi r10, 0x1
    bn.lbz r4, 0x0(r11)
    bn.andi r4, r4, 0x7f
    bt.addi r4, 0x1
    bg.jal 0x20cd13
    bt.add r10, r11
    bn.sbz 0x0(r10), r3
    bt.mov r3, r13
    bg.jal 0x20cd4a
    bn.slli r7, r13, 0x2
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1070
    bt.add r7, r6
    bn.sw 0x0(r7), r11
    bg.movhi r16, 0x45
    bg.addi r6, r16, 0x3b5a
    bn.add r10, r13, r6
    bn.ori r7, r0, 0x1d
    bn.sbz 0x0(r10), r7
    bn.lbz r7, 0x0(r11)
    bg.sfeqi r7, 0x9a
    bn.bf loc_20ce23
    bn.lbz r7, 0x0(r11)
    bn.andi r7, r7, 0x7f
    bt.addi r7, 0x2
    bn.sbz 0x0(r10), r7
loc_20ce23:
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3b7e
    bn.add r7, r13, r5
    bn.lbz r7, 0x0(r7)
    bn.extbz r7, r7
    bn.ori r6, r0, 0xb0
    bn.muls r7, r7, r6
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bn.andi r7, r7, 0x20
    bn.bnei r7, 0x0, loc_20ce53
    bn.lbz r7, 0x0(r10)
    bn.bnei r7, 0x0, loc_20ce73
loc_20ce53:
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
loc_20ce73:
    bg.movhi r15, 0x45
    bg.addi r7, r15, 0x3b8a
    bn.add r12, r13, r7
    bn.lbz r3, 0x0(r12)
    bn.extbz r3, r3
    bt.movi r4, 0x1
    bg.jal 0x20c7a8
    bg.addi r3, r3, 0x4700
    bn.exthz r3, r3
    bn.ori r4, r0, 0x6e
    bg.jal 0x20e3be
    bn.lbz r7, 0x0(r10)
    bg.beqi r7, 0x0, loc_20cf20
    bn.lbz r3, 0x0(r12)
    bn.lbz r10, 0x0(r11)
    bn.extbz r10, r10
    bn.extbz r3, r3
    bt.movi r4, 0x1
    bg.jal 0x20c7a8
    bg.addi r3, r3, 0x4701
    bn.exthz r3, r3
    bt.mov r4, r10
    bg.jal 0x20e3be
    bt.movi r12, 0x1
    bt.j loc_20cf08
loc_20cec2:
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3b8a
    bn.add r7, r13, r6
    bn.lbz r3, 0x0(r7)
    bt.mov r6, r12
    bt.addi r12, 0x1
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bn.add r7, r14, r5
    bt.add r7, r6
    bn.lbz r11, 0x0(r7)
    bn.extbz r11, r11
    bn.andi r10, r12, 0x7f
    bn.extbz r3, r3
    bt.movi r4, 0x1
    bg.jal 0x20c7a8
    bg.addi r3, r3, 0x4700
    bt.add r10, r3
    bn.exthz r3, r10
    bt.mov r4, r11
    bg.jal 0x20e3be
    bn.sfnei r12, 0x7f
    bn.bnf loc_20cf52
loc_20cf08:
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3b5a
    bn.add r7, r13, r6
    bn.lbz r7, 0x0(r7)
    bn.extbz r7, r7
    bn.exthz r6, r12
    bg.bgt r7, r6, loc_20cec2
loc_20cf20:
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3b8a
    bt.add r13, r7
    bn.lbz r3, 0x0(r13)
    bn.extbz r3, r3
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bg.j 0x20cb4e
loc_20cf52:
    bn.slli r7, r13, 0x1
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1490
    bt.add r7, r5
    bn.sh_1 0x0(r7), r12
    bt.j loc_20cf20
