# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x237d68,0x237d89); byte-exact only; hardware untested.
    bn.beqi r3, 0x0, loc_237d7a
    bg.movhi r7, 0x48
    bg.lwz r7, 0x2198(r7)
    bt.add r7, r4
    bn.sbz 0x0(r7), r5
    bt.jr r9
loc_237d7a:
    bg.movhi r7, 0x48
    bg.lwz r7, 0x2150(r7)
    bt.add r7, r4
    bn.sbz 0x0(r7), r5
    bt.jr r9
