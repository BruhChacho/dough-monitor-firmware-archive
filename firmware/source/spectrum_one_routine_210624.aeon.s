# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x210624,0x210636); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2100d2
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x211c05
