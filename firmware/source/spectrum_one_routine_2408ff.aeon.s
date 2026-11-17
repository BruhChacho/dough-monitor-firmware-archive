# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2408ff,0x24097b); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r11, r3
    bn.andi r4, r4, 0xfe
    bn.sfnei r3, 0x1
    bn.ori r7, r0, 0xa1
    bn.cmov_0 r12, r4, r7
    bt.movi r10, 0x4
loc_24091d:
    bg.jal 0x240872
    bn.beqi r3, 0x0, loc_240935
    bn.beqi r11, 0x1, loc_24095b
    bn.ori r3, r0, 0xa0
    bg.jal 0x2405f5
    bn.beqi r3, 0x1, loc_240968
loc_240931:
    bg.jal 0x240725
loc_240935:
    bt.movi r3, 0x1
    bg.jal 0x240469
    bn.addi r7, r10, -0x1
    bn.extbz r10, r7
    bg.sfnei r10, 0xff
    bn.bf loc_24091d
    bt.movi r3, 0x0
loc_24094a:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_24095b:
    bt.mov r3, r12
    bg.jal 0x2405f5
    bn.bnei r3, 0x1, loc_240931
    bt.movi r3, 0x1
    bt.j loc_24094a
loc_240968:
    bg.movhi r7, 0x45
    bg.lbz r3, 0x3c3f(r7)
    bg.jal 0x2405f5
    bn.bnei r3, 0x1, loc_240931
    bt.movi r3, 0x1
    bt.j loc_24094a
