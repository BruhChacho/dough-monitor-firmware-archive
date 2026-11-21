# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27d9a1,0x27d9ab); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.sbz 0x79cd(r7), r3
    bt.jr r9
