# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x225df0,0x225e11); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.movi r10, 0x0
loc_225dfa:
    bn.extbz r3, r10
    bg.jal 0x225db7
    bt.addi r10, 0x1
    bg.bnei r10, 0x4, loc_225dfa
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
