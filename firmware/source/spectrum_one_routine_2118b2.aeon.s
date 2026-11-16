# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2118b2,0x2118d2); byte-exact only; hardware untested.
    bt.movi r5, 0x8
    bt.movi r6, 0x0
loc_2118b6:
    bn.andi r7, r3, 0x1
    bn.slli r6, r6, 0x1
    bn.or r7, r7, r6
    bn.extbz r6, r7
    bn.srli r3, r3, 0x1
    bn.addi r7, r5, -0x1
    bn.extbz r5, r7
    bn.bnei r5, 0x0, loc_2118b6
    bt.mov r3, r6
    bt.jr r9
