# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23fc0a,0x23fd13); Guard source selector <=5 and nonzero record masks before switching through external services.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r13, r3
    bt.mov r12, r4
    bn.ori r7, r0, 0xa8
    bn.muls r11, r3, r7
    bg.movhi r15, 0x48
    bg.addi r5, r15, 0x21ec
    bt.add r11, r5
    bn.lbz r14, 0x28(r11)
    bg.bgtui r4, 0x5, loc_23fcf9
    bn.lh r6, 0x2c(r11)
    bn.lh r5, 0x2a(r11)
    bn.or r7, r6, r5
    bg.beqi r7, 0x0, loc_23fcf9
    bg.jal 0x22e68a
    bt.mov r3, r14
    bt.mov r4, r13
    bg.jal 0x22dd9a
    bt.mov r3, r12
    bt.mov r4, r13
    bg.jal 0x225f40
    bn.lh r6, 0x2c(r11)
    bn.lh r7, 0x2a(r11)
    bn.or r10, r6, r7
    bn.sbz 0x28(r11), r12
    bn.beqi r10, 0x0, loc_23fc90
    bt.movi r11, 0x0
    bt.j loc_23fc79
loc_23fc71:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_23fc90
loc_23fc79:
    bn.extbz r4, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_23fc71
    bt.mov r3, r14
    bg.jal 0x22acf2
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_23fc79
loc_23fc90:
    bg.jal 0x239922
    bn.ori r7, r0, 0xa8
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r6, 0x2c(r7)
    bn.lh r5, 0x2a(r7)
    bn.or r10, r6, r5
    bn.beqi r10, 0x0, loc_23fcd3
    bt.movi r11, 0x0
    bt.j loc_23fcbc
loc_23fcb4:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_23fcd3
loc_23fcbc:
    bn.extbz r4, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_23fcb4
    bt.mov r3, r12
    bg.jal 0x22701c
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_23fcbc
loc_23fcd3:
    bt.mov r3, r13
    bg.jal 0x2271a9
    bt.mov r3, r13
    bt.mov r4, r12
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bg.j 0x23e74a
loc_23fcf9:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
