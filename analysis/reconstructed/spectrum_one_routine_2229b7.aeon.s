# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2229b7,0x2229f8); byte-exact only; hardware untested.
    bg.movhi r6, 0x48
    bg.lbz r7, 0x21ec(r6)
    bn.sfnei r7, 0x1
    bn.cmovsi_2 r3, r0, 0x1
    bg.addi r6, r6, 0x21ec
    bg.lbz r7, 0xa8(r6)
    bn.beqi r7, 0x1, loc_2229f0
loc_2229d0:
    bg.lbz r7, 0x150(r6)
    bn.beqi r7, 0x1, loc_2229e8
loc_2229d7:
    bg.lbz r6, 0x1f8(r6)
    bn.beqi r6, 0x1, loc_2229e0
    bt.jr r9
loc_2229e0:
    bn.addi r7, r3, 0x1
    bn.extbz r3, r7
    bt.jr r9
loc_2229e8:
    bn.addi r7, r3, 0x1
    bn.extbz r3, r7
    bt.j loc_2229d7
loc_2229f0:
    bn.addi r7, r3, 0x1
    bn.extbz r3, r7
    bt.j loc_2229d0
