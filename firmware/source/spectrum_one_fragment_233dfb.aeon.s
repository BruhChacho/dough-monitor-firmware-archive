# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x233dfb,0x233e19); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.jal 0x213a77
    bt.mov r3, r10
    bt.movi r4, 0x1
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x216236
