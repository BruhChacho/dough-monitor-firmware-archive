# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2072e4,0x2074a3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r13, r4
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r11, 0x2a(r3)
    bg.beqi r11, 0x0, loc_2073e7
    bt.movi r12, 0x0
    bg.movhi r14, 0x45
    bt.j loc_207369
loc_20731a:
    bg.beqi r13, 0x0, loc_2073fe
    bn.movhi_2 r7, 0x1a80
    bn.ori r7, r7, 0x9
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2780
    bn.ori r5, r5, 0xe1
    bn.add r3, r10, r5
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.movhi r7, 0x2b80
    bn.ori r7, r7, 0xc0
    bn.add r3, r10, r7
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.lhz r7, 0x51ec(r14)
    bn.andi r7, r7, 0x40
    bg.bnei r7, 0x0, loc_207490
loc_207360:
    bn.srli r11, r11, 0x1
    bt.addi r12, 0x1
    bg.beqi r11, 0x0, loc_2073e7
loc_207369:
    bn.extbz r6, r12
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_207360
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r10, 0x4(r7)
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_20731a
    bg.beqi r13, 0x0, loc_207448
    bn.movhi_2 r7, 0x1a80
    bn.ori r7, r7, 0x9
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2780
    bn.ori r5, r5, 0xe1
    bn.add r3, r10, r5
    bt.movi r4, 0x2
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bg.movhi r7, 0x2b80
    bn.ori r7, r7, 0xc0
    bn.add r3, r10, r7
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bg.lhz r7, 0x51ec(r14)
    bn.andi r7, r7, 0x40
    bn.beqi r7, 0x0, loc_207360
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x85
    bn.add r3, r10, r5
    bt.movi r4, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bn.srli r11, r11, 0x1
    bt.addi r12, 0x1
    bn.bnei r11, 0x0, loc_207369
loc_2073e7:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_2073fe:
    bn.movhi_2 r7, 0x1a80
    bn.ori r7, r7, 0x9
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2780
    bn.ori r5, r5, 0xe1
    bn.add r3, r10, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x5
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2b80
    bn.ori r5, r5, 0xc0
    bn.add r3, r10, r5
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.j loc_207360
loc_207448:
    bn.movhi_2 r7, 0x1a80
    bn.ori r7, r7, 0x9
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2780
    bn.ori r5, r5, 0xe1
    bn.add r3, r10, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x85
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2b80
    bn.ori r5, r5, 0xc0
    bn.add r3, r10, r5
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bt.j loc_207360
loc_207490:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x5
    bn.add r3, r10, r5
    bt.movi r4, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bt.j loc_207360
