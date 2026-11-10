# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a94c4,0x2a94d3); byte-exact only; hardware untested.
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x260e
    bt.add r4, r7
    bn.sbz 0x0(r4), r3
    bt.jr r9
