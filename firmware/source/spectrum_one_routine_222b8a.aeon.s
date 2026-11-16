# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222b8a,0x222b9f); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r3, r7
    bn.lwz r3, 0x4(r3)
    bt.jr r9
