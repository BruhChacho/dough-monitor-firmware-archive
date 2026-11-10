# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x279cd8,0x279ce1); byte-exact only; hardware untested.
    bg.movhi r7, 0x8000
    bn.or r3, r3, r7
    bt.jr r9
