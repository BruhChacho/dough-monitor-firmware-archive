# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x213454,0x2134b2); byte-exact only; hardware untested.
    bn.beqi r3, 0x1, loc_213476
    bn.bleui r3, 0x0, loc_213462
    bn.beqi r3, 0x2, loc_21349e
    bn.beqi r3, 0x3, loc_21348a
    bt.jr r9
loc_213462:
    bn.sfeqi r4, 0x0
    bg.ori r3, r0, 0x2f40
    bn.ori r4, r0, 0x80
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x80
    bg.j 0x23dfe1
loc_213476:
    bn.sfeqi r4, 0x0
    bg.ori r3, r0, 0x3140
    bn.ori r4, r0, 0x80
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x80
    bg.j 0x23dfe1
loc_21348a:
    bn.sfeqi r4, 0x0
    bg.ori r3, r0, 0x3540
    bn.ori r4, r0, 0x80
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x80
    bg.j 0x23dfe1
loc_21349e:
    bn.sfeqi r4, 0x0
    bg.ori r3, r0, 0x3340
    bn.ori r4, r0, 0x80
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x80
    bg.j 0x23dfe1
