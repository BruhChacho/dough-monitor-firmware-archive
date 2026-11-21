# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24a060,0x24a06f); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x6268
    bt.add r3, r7
    bn.lbz r3, 0x10(r3)
    bt.jr r9
