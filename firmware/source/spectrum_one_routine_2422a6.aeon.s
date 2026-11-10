# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2422a6,0x2422ce); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.ori r7, r0, 0x14
    bn.lbz r3, 0x2a(r3)
    bn.muls r7, r7, r3
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4e30
    bt.add r7, r6
    bn.lh r3, 0x4(r7)
    bt.jr r9
