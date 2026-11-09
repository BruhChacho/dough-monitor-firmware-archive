# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac317,0x2ac380); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r3
    bn.addi r3, r1, 0x14
    bn.addi r4, r1, 0x4
    bg.jal 0x2abba0
    bn.lwz r7, 0x4(r1)
    bn.beqi r7, 0x2, loc_2ac34d
    bn.bleui r7, 0x1, loc_2ac34d
    bg.bnei r7, 0x4, loc_2ac357
loc_2ac337:
    bn.lwz r7, 0x8(r1)
    bn.bnei r7, 0x0, loc_2ac37a
    bg.movhi r7, 0x7fff
    bg.ori r3, r7, 0xffff
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_2ac34d:
    bt.movi r3, 0x0
loc_2ac34f:
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_2ac357:
    bn.lwz r6, 0xc(r1)
    bn.blesi r6, -0x1, loc_2ac34d
    bn.sflesi r6, 0x1e
    bn.bnf loc_2ac337
    bn.ori r7, r0, 0x1e
    bn.sub r7, r7, r6
    bn.lwz r6, 0x10(r1)
    bn.srl r3, r6, r7
    bn.lwz r7, 0x8(r1)
    bn.beqi r7, 0x0, loc_2ac34f
    bn.sub r3, r0, r3
    bt.j loc_2ac34f
loc_2ac37a:
    bg.movhi r3, 0x8000
    bt.j loc_2ac34f
