# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27d956,0x27d965); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7dc8
    bt.add r3, r7
    bn.lbz r3, 0x0(r3)
    bt.jr r9
