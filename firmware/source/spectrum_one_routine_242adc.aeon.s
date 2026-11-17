# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x242adc,0x242b66); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bg.ori r10, r0, 0xffff
    bg.movhi r12, 0x45
    bg.movhi r11, 0x45
    bt.j loc_242b0e
loc_242af8:
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bg.ori r7, r0, 0xffff
    bn.sfne r10, r7
    bn.bnf loc_242b2f
    bt.movi r3, 0x2
    bg.jal 0x20e371
loc_242b0e:
    bg.lwz r6, 0x5230(r12)
    bg.ori r23, r0, 0x1bb8
    bg.ori r4, r0, 0x13b8
    bn.sfeqi r6, 0x1
    bn.cmov_0 r7, r23, r4
    bg.lwz r5, 0x3cf0(r11)
    bt.add r7, r5
    bn.lbz r7, 0x0(r7)
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_242af8
loc_242b2f:
    bn.sfeqi r6, 0x1
    bn.cmov_0 r7, r23, r4
    bt.add r7, r5
    bn.lbz r7, 0x0(r7)
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_242b55
    bn.sfnei r6, 0x1
    bg.ori r7, r0, 0x13bc
    bg.ori r6, r0, 0x1bbc
    bn.cmov_0 r7, r7, r6
    bt.add r7, r5
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
loc_242b55:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
