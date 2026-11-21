# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x205531,0x205576); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bg.jal 0x20444d
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1ea4
    bn.sw 0x4(r1), r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1d64
    bn.sw 0x8(r1), r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1c24
    bn.sw 0xc(r1), r7
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bn.addi r4, r1, 0x4
    bg.jal 0x23a135
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
