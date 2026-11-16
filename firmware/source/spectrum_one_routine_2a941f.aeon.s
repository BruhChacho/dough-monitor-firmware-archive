# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a941f,0x2a9434); byte-exact only; hardware untested.
    bn.beqi r5, 0x0, loc_2a9432
    bt.mov r7, r3
    bn.extbs r4, r4
    bt.add r5, r3
loc_2a9429:
    bn.sbz 0x0(r7), r4
    bt.addi r7, 0x1
    bg.bne r7, r5, loc_2a9429
loc_2a9432:
    bt.jr r9
