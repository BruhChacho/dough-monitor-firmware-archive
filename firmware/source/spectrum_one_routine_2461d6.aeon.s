# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2461d6,0x2461e7); byte-exact only; hardware untested.
    bt.mov r7, r3
    bt.mov r23, r4
    bt.mov r6, r5
    bn.ori r3, r0, 0xa0
    bt.mov r4, r7
    bt.mov r5, r23
    bg.j 0x24097b
