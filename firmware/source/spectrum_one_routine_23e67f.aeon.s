# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e67f,0x23e697); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.sw 0x50(r3), r4
    bn.sw 0x54(r3), r5
    bt.jr r9
