# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23ecff,0x23ed1d); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21fc
    bt.add r3, r7
    bn.lwz r7, 0x0(r3)
    bn.sw 0x0(r4), r7
    bn.lwz r7, 0x4(r3)
    bn.sw 0x4(r4), r7
    bt.jr r9
