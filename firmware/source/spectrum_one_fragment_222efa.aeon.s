# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222efa,0x222f30); byte-exact only; hardware untested.
    bt.movi r23, 0x1
    bn.beqi r4, 0x1, loc_222f05
    bn.sfnei r4, 0x2
    bn.cmovsi_2 r23, r0, 0x2
loc_222f05:
    bn.beqi r3, 0x0, loc_222f2e
    bt.movi r5, 0x0
    bn.ori r4, r0, 0x7c
loc_222f0d:
    bn.extbz r6, r5
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_222f26
    bn.muls r7, r6, r4
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sw 0x74(r7), r23
loc_222f26:
    bn.srli r3, r3, 0x1
    bt.addi r5, 0x1
    bn.bnei r3, 0x0, loc_222f0d
loc_222f2e:
    bt.jr r9
