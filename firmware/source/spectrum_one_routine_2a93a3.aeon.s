# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a93a3,0x2a93ea); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r7, 0x45
    bg.lbz r7, 0x79a4(r7)
    bn.beqi r7, 0x1, loc_2a93c4
    bt.movi r3, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_2a93c4:
    bn.lbs r3, 0x0(r3)
    bn.beqi r3, 0x0, loc_2a93d8
loc_2a93ca:
    bg.jal 0x271d56
    bt.addi r10, 0x1
    bn.lbs r7, 0x0(r10)
    bt.mov r3, r7
    bn.bnei r7, 0x0, loc_2a93ca
loc_2a93d8:
    bt.movi r3, 0xa
    bg.jal 0x271d56
    bt.movi r3, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
