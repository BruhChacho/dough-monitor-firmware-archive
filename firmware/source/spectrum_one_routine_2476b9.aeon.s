# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2476b9,0x247782); byte-exact only; hardware untested.
    bn.bnei r3, 0x0, loc_2476c8
    bn.sfgtui r4, 0x33
    bn.bnf loc_2476e0
loc_2476c2:
    bg.ori r3, r0, 0xffff
    bt.jr r9
loc_2476c8:
    bn.sfgtui r4, 0x33
    bn.bf loc_2476c2
    bn.slli r7, r4, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, 0x40
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_2476e0:
    bn.slli r7, r4, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, 0x110
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
    bt.movi r3, 0x0
    bt.jr r9
    bn.ori r3, r0, 0x28
    bt.jr r9
    bn.ori r3, r0, 0x27
    bt.jr r9
    bn.ori r3, r0, 0x25
    bt.jr r9
    bn.ori r3, r0, 0x1d
    bt.jr r9
    bt.movi r3, 0xa
    bt.jr r9
    bn.ori r3, r0, 0x1c
    bt.jr r9
    bn.ori r3, r0, 0x1a
    bt.jr r9
    bn.ori r3, r0, 0x19
    bt.jr r9
    bn.ori r3, r0, 0x18
    bt.jr r9
    bn.ori r3, r0, 0x17
    bt.jr r9
    bn.ori r3, r0, 0x15
    bt.jr r9
    bt.movi r3, 0xe
    bt.jr r9
    bn.ori r3, r0, 0x11
    bt.jr r9
    bt.movi r3, 0xf
    bt.jr r9
    bn.ori r3, r0, 0x10
    bt.jr r9
    bn.ori r3, r0, 0x24
    bt.jr r9
    bn.ori r3, r0, 0x16
    bt.jr r9
    bn.ori r3, r0, 0x14
    bt.jr r9
    bt.movi r3, 0xd
    bt.jr r9
    bt.movi r3, 0xc
    bt.jr r9
    bt.movi r3, 0xb
    bt.jr r9
    bt.movi r3, 0x9
    bt.jr r9
    bt.movi r3, 0x8
    bt.jr r9
    bt.movi r3, 0x7
    bt.jr r9
    bt.movi r3, 0x6
    bt.jr r9
    bt.movi r3, 0x5
    bt.jr r9
    bt.movi r3, 0x4
    bt.jr r9
    bt.movi r3, 0x3
    bt.jr r9
    bt.movi r3, 0x2
    bt.jr r9
    bn.ori r3, r0, 0x13
    bt.jr r9
    bt.movi r3, 0x1
    bt.jr r9
