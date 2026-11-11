# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222915,0x2229b7); byte-exact only; hardware untested.
    bg.movhi r7, 0x4000
    bg.sfnei r3, 0x300
    bn.bnf loc_2229ad
    bg.sfeqi r3, 0x311
    bn.bf loc_2229a9
    bg.sfeqi r3, 0x388
    bn.bf loc_2229a9
    bg.sfeqi r3, 0x399
    bn.bf loc_2229a9
    bg.sfeqi r3, 0x3aa
    bn.bf loc_2229a9
    bg.sfeqi r3, 0x3bb
    bn.bf loc_2229a9
    bg.movhi r7, 0x4080
    bg.sfnei r3, 0x322
    bn.bnf loc_2229ad
    bg.sfeqi r3, 0x344
    bn.bf loc_2229b1
    bg.sfeqi r3, 0x355
    bn.bf loc_2229b1
    bg.sfeqi r3, 0x366
    bn.bf loc_2229b1
    bg.movhi r7, 0x3f80
    bg.sfnei r3, 0x3cc
    bn.bnf loc_2229ad
    bg.movhi r7, 0x3fc0
    bg.sfnei r3, 0x3dd
    bn.bnf loc_2229ad
    bg.movhi r7, 0x4090
    bg.sfnei r3, 0x3ff
    bn.bnf loc_2229ad
    bg.movhi r7, 0x4000
    bn.beqi r4, 0x1, loc_2229ad
    bg.movhi r7, 0x4040
    bn.beqi r4, 0x2, loc_2229ad
    bg.movhi r7, 0x4080
    bn.beqi r4, 0x3, loc_2229ad
    bg.movhi r7, 0x4090
    bg.beqi r4, 0x4, loc_2229ad
    bg.movhi r7, 0x3fc0
    bg.beqi r4, 0x5, loc_2229ad
loc_2229a9:
    bg.movhi r7, 0x4040
loc_2229ad:
    bt.mov r3, r7
    bt.jr r9
loc_2229b1:
    bg.movhi r7, 0x4020
    bt.j loc_2229ad
