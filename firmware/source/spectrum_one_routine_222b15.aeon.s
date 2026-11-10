# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222b15,0x222b25); byte-exact only; hardware untested.
    bg.movhi r7, 0x48
    bg.lwz r7, -0x4e0(r7)
    bn.sfeqi r7, 0x0
    bn.cmovi r3, 0x1, 0x4
    bt.jr r9
