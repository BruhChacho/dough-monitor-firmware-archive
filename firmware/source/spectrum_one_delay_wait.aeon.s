# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24209d,0x2420bb); Arm a halfword-load counter and poll adjacent completion flag; store width unresolved.
# Fixed original addresses; not a hardware-validated implementation.
    bn.beqi r3, 0x0, loc_2420b9
    bg.movhi r7, 0x45
    bg.sw_1 0x5204(r7), r3
    bg.movhi r6, 0x45
    bt.movi r7, 0x1
    bg.sbz 0x5206(r6), r7
loc_2420b2:
    bg.lbz r7, 0x5206(r6)
    bn.bnei r7, 0x0, loc_2420b2
loc_2420b9:
    bt.jr r9
