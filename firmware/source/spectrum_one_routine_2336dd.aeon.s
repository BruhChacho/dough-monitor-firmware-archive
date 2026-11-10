# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2336dd,0x233759); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r11, r3
    bt.mov r12, r4
    bg.jal 0x2150f8
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x212093
    bn.beqi r3, 0x0, loc_233714
    bn.ori r7, r0, 0x84
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0xe8
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bn.beqi r7, 0x3, loc_233727
loc_233714:
    bt.mov r3, r10
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_233727:
    bn.bnei r12, 0x0, loc_233743
loc_23372a:
    bn.slli r7, r10, 0x1
    bn.exthz r10, r7
    bt.mov r3, r10
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_233743:
    bn.beqi r12, 0x2, loc_23372a
    bt.mov r3, r10
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
