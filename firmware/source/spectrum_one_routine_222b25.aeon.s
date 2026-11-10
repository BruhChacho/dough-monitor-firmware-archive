# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222b25,0x222b35); byte-exact only; hardware untested.
    bg.movhi r7, 0x48
    bg.lwz r7, -0x3e8(r7)
    bn.sfeqi r7, 0x0
    bn.cmovi r3, 0x3, 0x4
    bt.jr r9
