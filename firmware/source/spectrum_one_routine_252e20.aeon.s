# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252e20,0x252ed8); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r5
    bg.movhi r7, 0x45
    bg.lbz r7, 0x7492(r7)
    bn.beqi r7, 0x0, loc_252e3b
    bn.beqi r3, 0x0, loc_252e45
    bn.beqi r3, 0x1, loc_252e97
loc_252e3b:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_252e45:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bg.jal 0x2493be
    bn.sfnei r10, 0x17
    bn.bf loc_252e3b
    bg.movhi r7, 0x45
    bg.lbz r7, 0x7491(r7)
    bn.bnei r7, 0x1, loc_252e3b
    bg.movhi r10, 0x3b
    bg.lwz r3, 0x7430(r10)
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xf
    bt.add r3, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bg.lwz r3, 0x7430(r10)
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xf
loc_252e84:
    bt.add r3, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0xe0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
loc_252e97:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bg.jal 0x24aaca
    bn.sfnei r10, 0x17
    bn.bf loc_252e3b
    bg.movhi r7, 0x45
    bg.lbz r7, 0x7491(r7)
    bn.bnei r7, 0x1, loc_252e3b
    bg.movhi r10, 0x3b
    bg.lwz r3, 0x7430(r10)
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x8f
    bt.add r3, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bg.lwz r3, 0x7430(r10)
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x8f
    bt.j loc_252e84
