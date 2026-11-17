# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e5b9,0x20e627); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bg.jal 0x20e52d
    bn.bnei r3, 0x0, loc_20e5da
loc_20e5cb:
    bt.movi r3, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_20e5da:
    bt.movhi r10, -0x10
    bg.ori r3, r10, 0x1818
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x1818
    bt.movi r4, 0x1
    bg.jal 0x23ddb9
    bg.ori r10, r0, 0xffff
    bt.movhi r11, -0x10
    bt.j loc_20e607
loc_20e5f8:
    bt.movi r3, 0x1
    bg.jal 0x24209d
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bn.beqi r10, 0x0, loc_20e5cb
loc_20e607:
    bg.ori r3, r11, 0x1818
    bg.jal 0x23dd44
    bn.bnei r3, 0x2, loc_20e5f8
    bt.movi r3, 0xa
    bg.jal 0x24209d
    bt.movi r3, 0x1
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
