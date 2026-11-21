# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x271d1a,0x271d56); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r24, 0x48
    bt.movi r7, 0x1
    bg.sbz -0x23b0(r24), r7
    bn.lwz r7, 0xc(r3)
    bn.lwz r23, 0xc(r7)
    bn.beqi r23, 0x0, loc_271d3b
    bn.lh r7, 0x26(r3)
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_271d48
loc_271d3b:
    bg.sbz -0x23b0(r24), r0
    bt.movi r3, 0x0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_271d48:
    bt.movi r6, 0x0
    bt.jalr r23
    bn.exthz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
