# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e5d1,0x23e5ed); Align a byte request into a masked halfword request to unresolved service0x27b707.
# Fixed original addresses; not a hardware-validated implementation.
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_23e5e4
    bn.slli r4, r4, 0x8
    bg.ori r5, r0, 0xff00
    bt.movi r6, 0x0
    bg.j 0x27b707
loc_23e5e4:
    bn.ori r5, r0, 0xff
    bt.movi r6, 0x0
    bg.j 0x27b707
