# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e47e,0x20e52d); Indirect byte read with bounded busy polls and retry flag; masked-update dependency has unresolved store width.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bt.mov r10, r3
    bt.movi r7, -0x1
    bn.sh_1 0x4(r1), r7
loc_20e494:
    bg.ori r3, r0, 0x3c06
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x20
    bn.beqi r3, 0x0, loc_20e4b3
    bn.lh r7, 0x4(r1)
    bt.addi r7, -0x1
    bn.exthz r7, r7
    bn.sh_1 0x4(r1), r7
    bn.lh r7, 0x4(r1)
    bn.bnei r7, 0x0, loc_20e494
loc_20e4b3:
    bg.addi r4, r10, -0x4000
    bg.ori r3, r0, 0x3c02
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bg.movhi r10, 0x45
    bt.movi r12, -0x1
    bt.movi r11, 0x1
loc_20e4ca:
    bn.sh_1 0x4(r1), r12
    bg.sbz 0x3b9e(r10), r11
    bg.ori r3, r0, 0x3c06
    bt.movi r4, 0x1
    bt.movi r5, 0x2
    bg.jal 0x23dead
loc_20e4dd:
    bg.ori r3, r0, 0x3c06
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x20
    bn.beqi r3, 0x0, loc_20e4fc
    bn.lh r7, 0x4(r1)
    bt.addi r7, -0x1
    bn.exthz r7, r7
    bn.sh_1 0x4(r1), r7
    bn.lh r7, 0x4(r1)
    bn.bnei r7, 0x0, loc_20e4dd
loc_20e4fc:
    bg.ori r3, r0, 0x3c01
    bg.jal 0x23dd44
    bn.sbz 0x7(r1), r3
    bg.lbz r7, 0x3b9e(r10)
    bn.beqi r7, 0x0, loc_20e4ca
    bg.movhi r7, 0x45
    bg.sbz 0x3b9e(r7), r0
    bn.lbz r3, 0x7(r1)
    bn.extbz r3, r3
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
