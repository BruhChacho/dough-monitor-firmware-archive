# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222af1,0x222b15); Return whether engine register pair 0x23 is available.
# Fixed original addresses; not hardware-validated.
    bg.movhi r7, 0x48
    bg.addi r6, r7, -0x564
    bg.lwz r7, 0x17c(r6)
    bt.movi r3, 0x3
    bn.beqi r7, 0x0, loc_222b0b
    bg.lwz r7, 0x100(r6)
    bn.bnei r7, 0x0, loc_222b0d
loc_222b09:
    bt.movi r3, 0x2
loc_222b0b:
    bt.jr r9
loc_222b0d:
    bt.movi r3, 0x4
    bg.beqi r7, 0x7, loc_222b09
    bt.jr r9
