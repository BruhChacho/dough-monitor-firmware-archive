# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x208b0d,0x208c21); byte-exact only; hardware untested.
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
    bt.mov r17, r4
    bn.slli r7, r4, 0x2
    bn.add r14, r5, r7
    bt.movi r15, 0x1
    bt.movi r11, 0x0
    bt.movi r16, 0x0
loc_208b39:
    bn.addi r7, r16, 0x1
    bn.extbz r16, r7
    bn.andi r7, r15, 0x1
    bg.beqi r7, 0x0, loc_208bde
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r12, 0x4(r7)
    bn.addi r3, r12, 0x62
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.addi r10, r12, 0x60
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.beqi r17, 0x0, loc_208c05
    bg.beqi r17, 0x1, loc_208c13
    bt.mov r3, r10
    bn.ori r4, r0, 0xc0
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
loc_208b81:
    bn.addi r13, r12, 0x64
    bt.movi r12, 0x0
loc_208b86:
    bn.slli r7, r12, 0x1
    bn.exthz r7, r7
    bn.lwz r6, 0x0(r14)
    bt.add r7, r6
    bn.lbz r4, 0x0(r7)
    bn.lbz r7, 0x1(r7)
    bn.slli r7, r7, 0x8
    bt.add r4, r7
    bt.mov r3, r13
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bt.mov r3, r10
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
loc_208baf:
    bt.mov r3, r10
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x8
    bn.beqi r3, 0x0, loc_208bcd
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bn.sfeqi r11, 0x64
    bn.bnf loc_208baf
loc_208bcd:
    bt.addi r12, 0x1
    bg.sfnei r12, 0x400
    bn.bf loc_208b86
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
loc_208bde:
    bn.srli r15, r15, 0x1
    bg.bnei r16, 0x1, loc_208b39
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
loc_208c05:
    bt.mov r3, r10
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bt.j loc_208b81
loc_208c13:
    bt.mov r3, r10
    bn.ori r4, r0, 0xa0
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bt.j loc_208b81
