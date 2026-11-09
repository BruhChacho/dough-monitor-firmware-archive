# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac120,0x2ac1a8); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bt.movi r7, 0x3
    bn.sw 0x0(r1), r7
    bn.sw 0x4(r1), r0
    bn.blesi r3, -0x1, loc_2ac1a1
loc_2ac131:
    bn.bnei r3, 0x0, loc_2ac14b
    bt.movi r7, 0x2
    bn.sw 0x0(r1), r7
loc_2ac139:
    bt.mov r3, r1
    bg.jal 0x2aba8f
    bt.mov r7, r3
loc_2ac141:
    bt.mov r3, r7
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_2ac14b:
    bn.ori r5, r0, 0x1e
    bn.sw 0x8(r1), r5
    bn.lwz r7, 0x4(r1)
    bn.beqi r7, 0x0, loc_2ac19c
    bg.movhi r7, 0xcf00
    bg.movhi r6, 0x8000
    bn.sfne r3, r6
    bn.bnf loc_2ac141
    bn.sub r7, r0, r3
    bn.sw 0xc(r1), r7
loc_2ac16b:
    bn.lwz r6, 0xc(r1)
    bg.movhi r7, 0x3fff
    bg.ori r7, r7, 0xffff
    bn.sfleu r6, r7
    bn.bnf loc_2ac139
    bn.lwz r5, 0x8(r1)
loc_2ac17f:
    bn.slli r7, r6, 0x1
    bt.addi r5, -0x1
    bt.mov r6, r7
    bg.movhi r23, 0x3fff
    bg.ori r23, r23, 0xffff
    bn.sfleu r7, r23
    bn.bf loc_2ac17f
    bn.sw 0x8(r1), r5
    bn.sw 0xc(r1), r7
    bt.j loc_2ac139
loc_2ac19c:
    bn.sw 0xc(r1), r3
    bt.j loc_2ac16b
loc_2ac1a1:
    bt.movi r7, 0x1
    bn.sw 0x4(r1), r7
    bt.j loc_2ac131
