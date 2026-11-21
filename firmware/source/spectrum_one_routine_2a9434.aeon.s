# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a9434,0x2a9469); byte-exact only; hardware untested.
    bn.lbz r5, 0x0(r3)
    bg.movhi r6, 0xa020
    bg.ori r7, r6, 0x6720
    bn.sbz 0x0(r7), r5
    bt.movi r4, 0x1
    bg.ori r5, r6, 0x6721
loc_2a9448:
    bn.add r7, r3, r4
    bn.lbz r7, 0x0(r7)
    bn.sbz 0x0(r5), r7
    bt.addi r5, 0x1
    bn.andi r7, r4, 0x1
    bn.addi r6, r5, 0x2
    bn.sfnei r7, 0x0
    bn.cmov_0 r5, r6, r5
    bt.addi r4, 0x1
    bn.sfnei r4, 0x40
    bn.bf loc_2a9448
    bt.jr r9
