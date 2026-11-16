# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2388c2,0x23890a); byte-exact only; hardware untested.
    bn.lbz r7, 0x1(r3)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x0(r3)
    bn.or r23, r6, r7
    bg.movhi r7, 0x3b
    bg.addi r5, r7, 0x4281
    bg.movhi r7, 0x3b
    bg.addi r4, r7, 0x429d
loc_2388de:
    bn.lbz r7, 0x0(r5)
    bn.beqi r7, 0x0, loc_2388f7
    bt.addi r7, -0x1
    bt.movi r6, 0x1
    bn.sll r6, r6, r7
    bn.and r6, r23, r6
    bn.sfnei r6, 0x0
    bn.cmov_1 r7, r1, r0
    bn.sbz 0x0(r4), r7
loc_2388f7:
    bt.addi r5, 0x1
    bn.addi r4, r4, 0x18
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4285
    bg.bne r5, r7, loc_2388de
    bt.jr r9
