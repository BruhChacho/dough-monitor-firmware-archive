# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x208cd2,0x208e9b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x30
    bn.sw 0x2c(r1), r9
    bn.sw 0x28(r1), r10
    bn.sw 0x24(r1), r11
    bn.sw 0x20(r1), r12
    bn.sw 0x1c(r1), r13
    bn.sw 0x18(r1), r14
    bn.sw 0x14(r1), r15
    bn.sw 0x10(r1), r16
    bn.sw 0xc(r1), r17
    bn.sw 0x8(r1), r18
    bn.sw 0x4(r1), r19
    bn.sw 0x0(r1), r22
    bn.addi r22, r1, 0x30
    bt.mov r18, r4
    bt.mov r10, r5
    bt.mov r19, r1
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lh r15, 0x2a(r3)
    bg.addi r1, r1, -0x408
    bt.mov r14, r1
    bt.mov r3, r1
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x400
    bg.jal 0x2a941f
    bn.slli r7, r18, 0x2
    bt.add r7, r10
    bn.lwz r4, 0x0(r7)
    bt.mov r5, r1
    bt.movi r23, 0x0
loc_208d33:
    bn.lbz r7, 0x0(r4)
    bn.sw 0x0(r5), r7
    bn.lbz r6, 0x1(r4)
    bn.andi r6, r6, 0x3f
    bn.slli r6, r6, 0x8
    bt.add r7, r6
    bn.sw 0x0(r5), r7
    bn.addi r7, r23, 0x1
    bn.exthz r23, r7
    bt.addi r4, 0x2
    bt.addi r5, 0x4
    bg.sfnei r23, 0x100
    bn.bf loc_208d33
    bg.beqi r15, 0x0, loc_208e3a
    bt.movi r16, 0x0
    bt.j loc_208d69
loc_208d60:
    bn.srli r15, r15, 0x1
    bt.addi r16, 0x1
    bg.beqi r15, 0x0, loc_208e3a
loc_208d69:
    bn.extbz r12, r16
    bn.andi r7, r15, 0x1
    bn.beqi r7, 0x0, loc_208d60
    bn.ori r7, r0, 0x7c
    bn.muls r7, r12, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r10, 0x4(r7)
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0xe2
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0xe0
    bn.add r11, r10, r6
    bt.mov r3, r11
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bn.andi r17, r12, 0x1
    bg.beqi r17, 0x0, loc_208e65
    bt.mov r3, r11
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.beqi r18, 0x0, loc_208e73
loc_208dba:
    bg.beqi r18, 0x1, loc_208e8d
    bt.mov r3, r11
    bn.ori r4, r0, 0xc0
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
loc_208dca:
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0xe4
    bn.add r13, r10, r7
    bt.movi r12, 0x0
loc_208ddb:
    bn.add r7, r14, r12
    bt.mov r3, r13
    bn.lh r4, 0x0(r7)
    bg.jal 0x23dfb6
    bt.mov r3, r11
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bt.movi r10, 0x0
    bt.j loc_208e07
loc_208df5:
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bn.sfeqi r10, 0x64
    bn.bf loc_208e13
loc_208e07:
    bt.mov r3, r11
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x8
    bn.bnei r3, 0x0, loc_208df5
loc_208e13:
    bt.addi r12, 0x4
    bg.sfnei r12, 0x400
    bn.bf loc_208ddb
    bn.beqi r17, 0x0, loc_208e81
    bt.mov r3, r11
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
loc_208e29:
    bt.mov r3, r11
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bn.srli r15, r15, 0x1
    bt.addi r16, 0x1
    bg.bnei r15, 0x0, loc_208d69
loc_208e3a:
    bt.mov r1, r19
    bn.lwz r22, 0x0(r1)
    bn.lwz r19, 0x4(r1)
    bn.lwz r18, 0x8(r1)
    bn.lwz r17, 0xc(r1)
    bn.lwz r16, 0x10(r1)
    bn.lwz r15, 0x14(r1)
    bn.lwz r14, 0x18(r1)
    bn.lwz r13, 0x1c(r1)
    bn.lwz r12, 0x20(r1)
    bn.lwz r11, 0x24(r1)
    bn.lwz r10, 0x28(r1)
    bn.lwz r9, 0x2c(r1)
    bn.addi r1, r1, 0x30
    bt.jr r9
loc_208e65:
    bt.mov r3, r11
    bt.movi r4, 0x2
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bg.bnei r18, 0x0, loc_208dba
loc_208e73:
    bt.mov r3, r11
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bt.j loc_208dca
loc_208e81:
    bt.mov r3, r11
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bt.j loc_208e29
loc_208e8d:
    bt.mov r3, r11
    bn.ori r4, r0, 0xa0
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bt.j loc_208dca
