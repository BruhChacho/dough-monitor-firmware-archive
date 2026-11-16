# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27f0b6,0x27f0d0); byte-exact only; hardware untested.
    bn.sw 0x0(r3), r0
    bn.sw 0x4(r3), r0
    bn.sw 0x8(r3), r0
    bn.sw 0xc(r3), r0
    bn.sw 0x10(r3), r0
    bn.sw 0x14(r3), r0
    bn.sw 0x18(r3), r0
    bn.sw 0x1c(r3), r0
    bt.jr r9
