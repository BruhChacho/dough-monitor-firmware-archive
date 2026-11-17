# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2383cb,0x2383db); byte-exact only; hardware untested.
    bn.beqi r3, 0x0, loc_2383d4
    bt.mov r3, r4
    bg.j 0x237dfd
loc_2383d4:
    bn.ori r3, r0, 0xff
    bg.j 0x237dfd
