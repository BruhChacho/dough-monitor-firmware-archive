# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2535c7,0x253649); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r4
    bt.mov r11, r6
    bn.beqi r3, 0x0, loc_2535ed
    bt.movi r7, 0x0
    bn.beqi r3, 0x1, loc_253622
loc_2535de:
    bt.mov r3, r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_2535ed:
    bn.extbz r3, r4
    bg.movhi r7, 0x45
    bg.lbz r4, 0x765c(r7)
    bn.extbz r5, r5
    bn.extbz r6, r6
    bg.jal 0x248992
    bn.exthz r7, r3
    bg.sfeqi r3, 0xfd
    bn.bnf loc_2535de
    bt.movi r3, 0x0
    bt.mov r4, r10
    bt.mov r5, r11
    bg.jal 0x252cd9
    bt.mov r4, r3
    bt.movi r3, 0x0
    bg.jal 0x252efc
    bt.mov r7, r3
    bt.j loc_2535de
loc_253622:
    bn.extbz r3, r4
    bg.movhi r7, 0x45
    bg.lbz r4, 0x765e(r7)
    bn.extbz r5, r5
    bn.extbz r6, r6
    bg.jal 0x24a09e
    bn.exthz r7, r3
    bt.mov r3, r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
