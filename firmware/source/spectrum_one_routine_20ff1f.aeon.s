# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20ff1f,0x20ff33); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x20fecd
    bg.jal 0x20fe85
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
