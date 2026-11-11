# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27bc4f,0x27bcb8); byte-exact only; hardware untested.
    bg.movhi r7, 0x48
    bg.lhz r7, -0x2352(r7)
    bg.sfnei r7, 0xf6
    bn.bnf loc_27bc68
loc_27bc5e:
    bt.movi r6, 0x0
loc_27bc60:
    bn.andi r3, r3, 0xff
    bn.or r3, r6, r3
    bt.jr r9
loc_27bc68:
    bn.movhi_2 r4, 0x7f
    bg.ori r4, r4, 0xff00
    bn.and r5, r3, r4
    bg.movhi r6, 0xff00
    bn.and r7, r3, r6
    bn.srli r7, r7, 0x10
    bt.movhi r4, -0x9
    bn.or r6, r7, r4
    bt.movhi r4, -0x10
    bg.ori r4, r4, 0x2f00
    bn.sfne r5, r4
    bn.bnf loc_27bc60
    bn.movhi_2 r4, 0x30
    bn.or r6, r7, r4
    bt.movhi r4, -0x10
    bg.ori r4, r4, 0x3100
    bn.sfne r5, r4
    bn.bnf loc_27bc60
    bt.movhi r4, -0xd
    bn.or r6, r7, r4
    bt.movhi r7, -0x10
    bg.ori r7, r7, 0x2b00
    bn.sfne r5, r7
    bn.bf loc_27bc5e
    bn.andi r3, r3, 0xff
    bn.or r3, r6, r3
    bt.jr r9
