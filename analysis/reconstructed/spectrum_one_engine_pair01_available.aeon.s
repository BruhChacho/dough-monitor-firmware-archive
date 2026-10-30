# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222ace,0x222af1); Return whether engine register pair 0x01 is available.
# Fixed original addresses; not hardware-validated.
    bg.movhi r7, 0x48
    bg.addi r6, r7, -0x564
    bg.lwz r7, 0x84(r6)
    bt.movi r3, 0x1
    bn.beqi r7, 0x0, loc_222ae7
    bn.lwz r7, 0x8(r6)
    bn.bnei r7, 0x0, loc_222ae9
loc_222ae5:
    bt.movi r3, 0x0
loc_222ae7:
    bt.jr r9
loc_222ae9:
    bt.movi r3, 0x4
    bg.beqi r7, 0x7, loc_222ae5
    bt.jr r9
