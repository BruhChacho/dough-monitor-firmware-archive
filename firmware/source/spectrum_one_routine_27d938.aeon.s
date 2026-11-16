# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27d938,0x27d947); byte-exact only; hardware untested.
    bg.movhi r7, 0x3d
    bg.addi r7, r7, -0x39e0
    bt.add r3, r7
    bn.lbz r3, 0x0(r3)
    bt.jr r9
