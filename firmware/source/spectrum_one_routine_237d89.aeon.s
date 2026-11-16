# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x237d89,0x237daa); byte-exact only; hardware untested.
    bn.beqi r3, 0x0, loc_237d9b
    bg.movhi r7, 0x48
    bg.lwz r7, 0x2198(r7)
    bt.add r7, r4
    bn.lbz r3, 0x0(r7)
    bt.jr r9
loc_237d9b:
    bg.movhi r7, 0x48
    bg.lwz r7, 0x2150(r7)
    bt.add r7, r4
    bn.lbz r3, 0x0(r7)
    bt.jr r9
