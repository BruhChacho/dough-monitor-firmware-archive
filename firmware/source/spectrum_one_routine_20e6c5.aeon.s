# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e6c5,0x20e717); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x20e687
    bg.movhi r7, 0x45
    bg.addi r5, r7, 0x43bc
    bn.lbz r6, 0xa(r5)
    bn.and r7, r3, r6
    bt.movi r6, 0x3
    bn.bnei r7, 0x0, loc_20e70e
    bn.lbz r6, 0x4(r5)
    bn.and r7, r3, r6
    bt.movi r6, 0x2
    bn.bnei r7, 0x0, loc_20e70e
    bn.lbz r6, 0x7(r5)
    bn.and r7, r3, r6
    bt.movi r6, 0x4
    bn.bnei r7, 0x0, loc_20e70e
    bn.lbz r6, 0x6(r5)
    bn.and r7, r3, r6
    bt.movi r6, 0x1
    bn.bnei r7, 0x0, loc_20e70e
    bn.lbz r5, 0x3(r5)
    bn.and r7, r3, r5
    bn.sfeqi r7, 0x0
    bn.cmov_1 r6, r5, r0
loc_20e70e:
    bt.mov r3, r6
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
