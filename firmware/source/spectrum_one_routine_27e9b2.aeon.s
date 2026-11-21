# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27e9b2,0x27e9c4); byte-exact only; hardware untested.
    bn.slli r3, r3, 0x2
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7da0
    bt.add r3, r7
    bn.lwz r3, 0x0(r3)
    bt.jr r9
