# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2461f6,0x246205); byte-exact only; hardware untested.
    bt.mov r7, r3
    bt.mov r5, r4
    bn.ori r3, r0, 0xa0
    bt.mov r4, r7
    bt.movi r6, 0x1
    bg.j 0x24097b
