# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x238858,0x2388c2); byte-exact only; hardware untested.
    bn.lbz r7, 0x1(r3)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x0(r3)
    bn.or r23, r6, r7
    bg.movhi r7, 0x3b
    bg.lwz r24, 0x5f38(r7)
    bg.movhi r7, 0x3b
    bg.addi r5, r7, 0x427b
    bg.movhi r7, 0x45
    bg.addi r4, r7, 0x50a2
    bt.j loc_23889a
loc_23887e:
    bn.lbz r7, 0x59(r24)
    bn.sfeqi r7, 0x0
    bn.cmov_1 r7, r1, r0
    bn.sbz 0x0(r4), r7
loc_23888a:
    bt.addi r5, 0x1
    bt.addi r4, 0x1
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4281
    bg.beq r5, r7, loc_2388c0
loc_23889a:
    bn.lbz r6, 0x0(r5)
    bn.beqi r6, 0x0, loc_23888a
    bt.addi r6, -0x1
    bt.movi r7, 0x1
    bn.sll r7, r7, r6
    bn.and r7, r23, r7
    bn.bnei r7, 0x0, loc_23887e
    bn.sbz 0x0(r4), r0
    bt.addi r5, 0x1
    bt.addi r4, 0x1
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4281
    bg.bne r5, r7, loc_23889a
loc_2388c0:
    bt.jr r9
