# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2384f1,0x23856e); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.movhi r10, 0x45
    bg.lbz r7, 0x5088(r10)
    bn.beqi r7, 0x0, loc_238519
    bg.movhi r6, 0x45
    bg.lbz r7, 0x5089(r6)
    bn.sfgtui r7, 0x63
    bn.bnf loc_238559
    bg.lbz r6, 0x5089(r6)
    bn.beqi r6, 0x1, loc_238566
loc_238519:
    bg.jal 0x237daa
    bn.beqi r3, 0x0, loc_238527
    bg.lbz r10, 0x5088(r10)
    bn.beqi r10, 0x1, loc_238531
loc_238527:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_238531:
    bg.movhi r10, 0x45
    bg.lbz r7, 0x5089(r10)
    bg.bleui r7, 0x5, loc_238527
    bt.movi r3, 0x0
    bg.jal 0x2383ad
    bg.sbz 0x5089(r10), r0
    bg.movhi r7, 0x45
    bg.sbz 0x5088(r7), r0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_238559:
    bt.addi r7, 0x1
    bg.sbz 0x5089(r6), r7
    bg.lbz r6, 0x5089(r6)
    bn.bnei r6, 0x1, loc_238519
loc_238566:
    bt.movi r3, 0x1
    bg.jal 0x2383ad
    bt.j loc_238519
