# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e6af,0x23e6c4); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.sw 0x4c(r3), r4
    bt.jr r9
