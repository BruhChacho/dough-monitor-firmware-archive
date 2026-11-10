# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2abba0,0x2abc45); byte-exact only; hardware untested.
    bn.lwz r3, 0x0(r3)
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xffff
    bn.and r5, r3, r6
    bn.srli r7, r3, 0x17
    bn.andi r6, r7, 0xff
    bn.srli r7, r3, 0x1f
    bn.sw 0x4(r4), r7
    bn.bnei r6, 0x0, loc_2abbf9
    bn.beqi r5, 0x0, loc_2abc1a
    bn.addi r7, r0, -0x7e
    bn.sw 0x8(r4), r7
    bn.slli r6, r5, 0x7
    bt.movi r7, 0x3
    bn.sw 0x0(r4), r7
    bg.movhi r7, 0x3fff
    bg.ori r7, r7, 0xffff
    bn.sfgtu r6, r7
    bn.bf loc_2abbf4
    bn.addi r7, r0, -0x7e
loc_2abbde:
    bn.slli r6, r6, 0x1
    bt.addi r7, -0x1
    bg.movhi r5, 0x3fff
    bg.ori r5, r5, 0xffff
    bn.sfleu r6, r5
    bn.bf loc_2abbde
    bn.sw 0x8(r4), r7
loc_2abbf4:
    bn.sw 0xc(r4), r6
    bt.jr r9
loc_2abbf9:
    bg.sfnei r6, 0xff
    bn.bnf loc_2abc21
    bn.addi r7, r6, -0x7f
    bn.sw 0x8(r4), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r4), r7
    bn.slli r7, r5, 0x7
    bg.movhi r5, 0x4000
    bn.or r7, r7, r5
    bn.sw 0xc(r4), r7
    bt.jr r9
loc_2abc1a:
    bt.movi r7, 0x2
    bn.sw 0x0(r4), r7
    bt.jr r9
loc_2abc21:
    bn.bnei r5, 0x0, loc_2abc2b
    bt.movi r7, 0x4
    bn.sw 0x0(r4), r7
    bt.jr r9
loc_2abc2b:
    bt.movhi r6, -0x10
    bn.and r7, r3, r6
    bn.bnei r7, 0x0, loc_2abc3b
    bn.sw 0x0(r4), r0
    bn.sw 0xc(r4), r5
loc_2abc39:
    bt.jr r9
loc_2abc3b:
    bt.movi r7, 0x1
    bn.sw 0x0(r4), r7
    bn.sw 0xc(r4), r5
    bt.j loc_2abc39
