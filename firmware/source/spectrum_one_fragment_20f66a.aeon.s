# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20f66a,0x20f67b); byte-exact only; hardware untested.
    bt.movhi r6, 0x2
    bn.and r7, r4, r6
    bn.sfeqi r7, 0x0
    bt.movhi r7, 0x2
    bn.cmov_0 r4, r4, r7
    bg.j 0x2146c9
