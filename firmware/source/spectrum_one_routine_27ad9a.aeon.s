# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27ad9a,0x27add6); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x27ac57
    bn.beqi r3, 0x0, loc_27adcd
    bg.movhi r6, 0x48
    bg.lwz r7, -0x2370(r6)
    bn.bnei r7, 0x0, loc_27adcd
    bg.addi r7, r6, -0x2370
    bn.lh r7, 0x4(r7)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bt.movi r6, 0x1
    bn.xor r7, r7, r6
    bn.extbz r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_27adcd:
    bt.movi r3, 0x0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
