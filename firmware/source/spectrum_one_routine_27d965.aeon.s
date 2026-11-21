# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27d965,0x27d974); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7dc8
    bt.add r3, r7
    bn.sbz 0x0(r3), r4
    bt.jr r9
