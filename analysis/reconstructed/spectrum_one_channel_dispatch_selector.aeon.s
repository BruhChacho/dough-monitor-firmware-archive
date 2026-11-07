# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bfca,0x21c024); Select the engine using the metadata value shifted left by two and masked by 0xfc; r4 is the engine index 0-3, r5 is mask 0x7c, and selector zero is valid.
# Fixed original addresses; not hardware-validated.
    bn.beqi r4, 0x1, loc_21bfeb
    bn.bleui r4, 0x0, loc_21bfd8
    bn.beqi r4, 0x2, loc_21c011
    bn.beqi r4, 0x3, loc_21bffe
    bt.jr r9
loc_21bfd8:
    bn.slli r4, r3, 0x2
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f8e
    bn.andi r4, r4, 0xfc
    bn.ori r5, r0, 0x7c
    bg.j 0x23dfe1
loc_21bfeb:
    bn.slli r4, r3, 0x2
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f8d
    bn.andi r4, r4, 0xfc
    bn.ori r5, r0, 0x7c
    bg.j 0x23dfe1
loc_21bffe:
    bn.slli r4, r3, 0x2
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f8f
    bn.andi r4, r4, 0xfc
    bn.ori r5, r0, 0x7c
    bg.j 0x23dfe1
loc_21c011:
    bn.slli r4, r3, 0x2
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f90
    bn.andi r4, r4, 0xfc
    bn.ori r5, r0, 0x7c
    bg.j 0x23dfe1
