# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222ea6,0x222efa); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xb0
    bn.muls r4, r4, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r4, r6
    bn.lbz r7, 0x70(r4)
    bn.bnei r7, 0x0, loc_222ef2
    bn.lwz r7, 0x4(r4)
    bg.ori r6, r0, 0x800
    bn.and r7, r7, r6
    bn.bnei r7, 0x0, loc_222ef2
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.lbz r7, 0x94(r7)
    bn.beqi r7, 0x0, loc_222ef6
    bg.lwz r4, 0x80(r4)
    bn.beqi r4, 0x0, loc_222ef6
    bn.extbz r7, r4
    bn.sfnei r4, 0x4
    bn.cmovsi_2 r3, r7, 0x3
    bt.jr r9
loc_222ef2:
    bt.movi r3, 0x1
    bt.jr r9
loc_222ef6:
    bt.movi r3, 0x0
    bt.jr r9
