# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2105df,0x2105fd); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r4
    bg.jal 0x2100d2
    bt.mov r4, r10
    bg.jal 0x214da6
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
