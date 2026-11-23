# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26154e,0x261560); byte-exact only; hardware untested.
    bn.lbz r4, 0x0(r4)
    bn.beqi r4, 0x2, loc_26155a
    bt.movi r4, 0x0
    bg.j 0x253db3
loc_26155a:
    bt.movi r4, 0x1
    bg.j 0x253db3
