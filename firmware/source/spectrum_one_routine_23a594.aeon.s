# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a594,0x23a5aa); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x262c8a
    bt.mov r4, r3
    bt.movi r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x2383cb
