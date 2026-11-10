# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e4f4,0x23e50c); Prepare a shifted masked byte request, then tail-transfer to the request service.
# Fixed original addresses; not hardware-validated.
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_23e506
    bn.slli r4, r4, 0x8
    bn.slli r5, r5, 0x8
    bt.movi r6, 0x0
    bg.j 0x27b707
loc_23e506:
    bt.movi r6, 0x0
    bg.j 0x27b707
