# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d430,0x21d4c1); Read metadata flags and write 0x80 to engine control registers at offsets 0x0f/0x11 for selected flag values.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bg.jal 0x21d3b1
    bt.mov r11, r3
    bt.mov r3, r10
    bg.jal 0x222804
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bg.lbz r7, 0x89(r3)
    bn.addi r3, r11, 0xf
    bt.movi r4, 0x0
    bn.beqi r7, 0x1, loc_21d47f
    bn.beqi r7, 0x2, loc_21d479
    bg.beqi r7, 0x4, loc_21d49d
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_21d479:
    bn.addi r3, r11, 0xf
    bn.ori r4, r0, 0x80
loc_21d47f:
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.addi r3, r11, 0x11
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23dfe1
loc_21d49d:
    bn.addi r3, r11, 0xf
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.addi r3, r11, 0x11
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23dfe1
