# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x260f9f,0x260faa); byte-exact only; hardware untested.
    bn.bnei r4, 0x0, loc_260fa4
    bt.jr r9
loc_260fa4:
    bt.movi r4, 0x0
    bg.j 0x208381
