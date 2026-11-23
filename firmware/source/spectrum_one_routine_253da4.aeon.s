# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x253da4,0x253db3); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x786c
    bt.add r3, r7
    bn.sbz 0x0(r3), r4
    bt.jr r9
