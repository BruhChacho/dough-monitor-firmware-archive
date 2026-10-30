# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x220995,0x220a8b); Configure a pair of registers from the supplied values; register semantics are unresolved.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bg.movhi r11, 0x45
    bg.lbz r12, 0x5210(r11)
    bn.bnei r12, 0x0, loc_2209c8
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5211(r7)
    bg.sbz 0x5210(r11), r0
    bg.bnei r7, 0x0, loc_220a4b
    bg.lbz r7, 0x5210(r11)
    bg.beqi r7, 0x0, loc_220a7c
loc_2209c8:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f1a
    bt.mov r4, r10
    bg.jal 0x23e58a
loc_2209d5:
    bg.lbz r7, 0x5210(r11)
    bn.beqi r7, 0x0, loc_220a08
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2b1a
    bt.mov r4, r10
    bg.jal 0x23e58a
loc_2209e9:
    bn.bnei r12, 0x0, loc_2209f7
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5211(r7)
    bn.bnei r7, 0x0, loc_220a17
loc_2209f7:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_220a08:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2b1a
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bt.j loc_2209e9
loc_220a17:
    bg.jal 0x23e4a0
    bg.sbz 0x5210(r11), r0
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0x90
    bg.ori r3, r3, 0x2f02
    bt.movi r4, 0x5
    bg.jal 0x23ddb9
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23e13b
loc_220a4b:
    bt.movi r7, 0x1
    bg.sbz 0x5210(r11), r7
    bg.jal 0x23e49c
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0x90
    bg.ori r3, r3, 0x2f02
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
    bg.lbz r7, 0x5210(r11)
    bg.bnei r7, 0x0, loc_2209c8
loc_220a7c:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f1a
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bt.j loc_2209d5
