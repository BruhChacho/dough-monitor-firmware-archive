# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2422ce,0x2422ee); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2422a6
    bn.slli r3, r3, 0x2
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4d70
    bt.add r3, r7
    bn.lh r3, 0x2(r3)
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
