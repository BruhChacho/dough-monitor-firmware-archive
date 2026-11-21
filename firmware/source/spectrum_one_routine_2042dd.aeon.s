# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2042dd,0x2042f4); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2042cc
    bg.addi r3, r3, 0x3ca
    bn.exthz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
