# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x212d95,0x212e18); Clear bit0x40 in three logical registers, then set selected bits from input mask0x70.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.ori r3, r0, 0x11c4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bg.ori r3, r0, 0x12c4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bg.ori r3, r0, 0x13c4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bn.andi r7, r10, 0x10
    bn.bnei r7, 0x0, loc_212e08
loc_212dcc:
    bn.andi r7, r10, 0x20
    bn.bnei r7, 0x0, loc_212df8
loc_212dd2:
    bn.andi r7, r10, 0x40
    bn.bnei r7, 0x0, loc_212de2
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_212de2:
    bg.ori r3, r0, 0x13c4
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
loc_212df8:
    bg.ori r3, r0, 0x12c4
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bt.j loc_212dd2
loc_212e08:
    bg.ori r3, r0, 0x11c4
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bt.j loc_212dcc
