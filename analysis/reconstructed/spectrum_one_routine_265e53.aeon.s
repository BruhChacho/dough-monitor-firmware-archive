# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x265e53,0x265e99); byte-exact only; hardware untested.
    bg.movhi r7, 0x48
    bn.ori r6, r0, 0xb0
    bg.lbz r7, -0x4cb(r7)
    bn.muls r6, r6, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bn.lbz r7, 0x20(r6)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_265e95
    bg.addi r7, r3, -0x1e0
    bn.exthz r7, r7
    bg.sfgti r7, 0x3f2
    bn.bf loc_265e95
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r7, 0x59(r7)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r3, r0, 0x1
    bt.jr r9
loc_265e95:
    bt.movi r3, 0x1
    bt.jr r9
