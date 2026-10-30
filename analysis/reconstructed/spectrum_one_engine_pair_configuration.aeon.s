# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22089f,0x220995); Prepare the selected engine-pair state and preserve its original service calls.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bg.movhi r11, 0x45
    bg.lbz r12, 0x5210(r11)
    bn.bnei r12, 0x0, loc_2208d2
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5211(r7)
    bg.sbz 0x5210(r11), r0
    bg.bnei r7, 0x0, loc_220955
    bg.lbz r7, 0x5210(r11)
    bg.beqi r7, 0x0, loc_220986
loc_2208d2:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f18
    bt.mov r4, r10
    bg.jal 0x23e58a
loc_2208df:
    bg.lbz r7, 0x5210(r11)
    bn.beqi r7, 0x0, loc_220912
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2b18
    bt.mov r4, r10
    bg.jal 0x23e58a
loc_2208f3:
    bn.bnei r12, 0x0, loc_220901
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5211(r7)
    bn.bnei r7, 0x0, loc_220921
loc_220901:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_220912:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2b18
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bt.j loc_2208f3
loc_220921:
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
loc_220955:
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
    bg.bnei r7, 0x0, loc_2208d2
loc_220986:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f18
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bt.j loc_2208df
