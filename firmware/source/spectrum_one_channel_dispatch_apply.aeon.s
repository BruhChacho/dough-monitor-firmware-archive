# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x226bb5,0x226cd6); Apply channel dispatch state; helper behavior at 0x21be27 and 0x21dcee remains unresolved; tail target is 0x23dfb6.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r4
    bn.extbz r11, r3
    bg.ori r6, r0, 0xff00
    bn.and r3, r3, r6
    bn.srli r13, r3, 0x8
    bn.bnei r11, 0x0, loc_226bf1
loc_226bd9:
    bg.bnei r13, 0x0, loc_226cae
loc_226bdd:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_226bf1:
    bt.movi r3, 0x2
    bg.jal 0x24209d
    bn.ori r10, r0, 0x7c
    bn.muls r10, r12, r10
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r10, r7
    bn.lwz r3, 0x4(r10)
    bn.movhi_2 r6, 0x80
    bn.ori r6, r6, 0x4
    bt.add r3, r6
    bt.mov r4, r11
    bg.jal 0x23ddb9
    bt.movi r3, 0x2
    bg.jal 0x24209d
    bt.mov r3, r12
    bg.jal 0x21be27
    bt.mov r11, r3
    bn.ori r3, r0, 0x1f
    bt.mov r4, r12
    bg.jal 0x21bfca
    bt.mov r3, r11
    bt.mov r4, r12
    bg.jal 0x21bfca
    bn.lwz r3, 0x4(r10)
    bn.movhi_2 r7, 0x80
    bn.ori r7, r7, 0x4
    bt.add r3, r7
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bt.movi r3, 0x2
    bg.jal 0x24209d
    bt.mov r3, r12
    bg.jal 0x222804
    bt.mov r10, r3
    bg.jal 0x22282e
    bt.mov r11, r3
    bt.mov r3, r10
    bg.jal 0x222819
    bg.bne r12, r3, loc_226bd9
    bt.movi r4, 0x1
    bg.jal 0x21dcee
    bt.movi r3, 0x2
    bg.jal 0x24209d
    bt.mov r3, r12
    bt.movi r4, 0x0
    bg.jal 0x21dcee
    bg.beqi r11, 0x0, loc_226bd9
    bt.movi r5, 0x0
    bn.ori r23, r0, 0x7c
    bn.addi r4, r0, -0x1a
loc_226c86:
    bn.extbz r6, r5
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_226c9f
    bn.muls r7, r6, r23
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sbz 0x2b(r7), r4
loc_226c9f:
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r5, 0x1
    bn.bnei r11, 0x0, loc_226c86
    bg.beqi r13, 0x0, loc_226bdd
loc_226cae:
    bt.movhi r10, -0x10
    bg.ori r3, r10, 0x250e
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x250e
    bt.movi r4, 0x0
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23dfb6
