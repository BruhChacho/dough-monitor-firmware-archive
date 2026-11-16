# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20ef9b,0x20f0d1); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r11, r3
    bt.mov r12, r4
    bt.mov r13, r5
    bt.mov r14, r6
    bg.jal 0x20e6c5
    bt.mov r10, r3
    bn.beqi r13, 0x0, loc_20efca
    bt.mov r3, r11
    bg.jal 0x20e736
    bn.bgtui r10, 0x1, loc_20efe3
loc_20efca:
    bt.movi r3, 0x1
loc_20efcc:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_20efe3:
    bn.bgtui r10, 0x3, loc_20f007
    bt.mov r4, r12
    bt.mov r5, r13
    bt.mov r6, r14
    bg.jal 0x233c54
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_20f007:
    bg.bnei r10, 0x4, loc_20efca
    bg.sfnei r12, 0xff
    bn.bnf loc_20f06d
    bg.sfnei r12, 0x84
    bn.bnf loc_20f075
    bg.beqi r12, 0x4, loc_20f07f
    bg.beqi r12, 0x5, loc_20f087
    bg.beqi r12, 0x6, loc_20f08f
    bg.beqi r12, 0x7, loc_20f097
    bn.sfeqi r12, 0x10
    bn.bf loc_20efca
    bg.sfnei r12, 0x81
    bn.bnf loc_20f09f
    bg.sfnei r12, 0x82
    bn.bnf loc_20f0a7
    bg.sfnei r12, 0x83
    bn.bnf loc_20f0af
    bg.sfnei r12, 0x85
    bn.bnf loc_20f0b9
    bg.sfnei r12, 0x86
    bn.bnf loc_20f0c1
    bn.sfnei r12, 0x20
    bn.bnf loc_20f0c9
    bn.sfeqi r12, 0x21
    bn.bf loc_20efca
    bg.sfnei r12, 0x87
    bn.bf loc_20efca
    bt.mov r4, r14
    bg.jal 0x210810
    bt.j loc_20efcc
loc_20f06d:
    bt.mov r4, r14
    bg.jal 0x2104d0
    bt.j loc_20efcc
loc_20f075:
    bt.mov r4, r14
    bg.jal 0x210bde
    bt.movi r3, 0x1
    bt.j loc_20efcc
loc_20f07f:
    bt.mov r4, r14
    bg.jal 0x210bb2
    bt.j loc_20efcc
loc_20f087:
    bt.mov r4, r14
    bg.jal 0x210b43
    bt.j loc_20efcc
loc_20f08f:
    bt.mov r4, r14
    bg.jal 0x210ad4
    bt.j loc_20efcc
loc_20f097:
    bt.mov r4, r14
    bg.jal 0x2109f4
    bt.j loc_20efcc
loc_20f09f:
    bt.mov r4, r14
    bg.jal 0x210776
    bt.j loc_20efcc
loc_20f0a7:
    bt.mov r4, r14
    bg.jal 0x210a64
    bt.j loc_20efcc
loc_20f0af:
    bt.mov r4, r13
    bt.mov r5, r14
    bg.jal 0x21097f
    bt.j loc_20efcc
loc_20f0b9:
    bt.mov r4, r14
    bg.jal 0x2108fa
    bt.j loc_20efcc
loc_20f0c1:
    bt.mov r4, r14
    bg.jal 0x210885
    bt.j loc_20efcc
loc_20f0c9:
    bt.mov r4, r14
    bg.jal 0x2106e1
    bt.j loc_20efcc
