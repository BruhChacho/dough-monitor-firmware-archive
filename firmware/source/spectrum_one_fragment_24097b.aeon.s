# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24097b,0x240a8b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x3c
    bn.sw 0x38(r1), r9
    bn.sw 0x34(r1), r10
    bn.sw 0x30(r1), r11
    bn.sw 0x2c(r1), r12
    bn.sw 0x28(r1), r13
    bn.sw 0x24(r1), r14
    bn.sw 0x20(r1), r15
    bn.sw 0x1c(r1), r16
    bn.sw 0x18(r1), r17
    bn.sw 0x14(r1), r18
    bn.sw 0x10(r1), r19
    bn.sw 0xc(r1), r20
    bn.sw 0x8(r1), r21
    bt.mov r12, r4
    bt.mov r21, r5
    bt.mov r14, r6
    bg.movhi r15, 0x45
    bn.srli r7, r4, 0x8
    bg.sbz 0x3c3f(r15), r7
    bg.beqi r6, 0x0, loc_240a40
    bn.extbs r20, r3
    bn.extbz r19, r4
    bn.andi r18, r4, 0xff
    bt.mov r16, r6
    bt.movi r13, 0x0
loc_2409c7:
    bn.add r6, r13, r12
    bn.srai r6, r6, 0x8
    bn.slli r7, r6, 0x1
    bn.or r7, r20, r7
    bn.extbz r11, r7
    bn.add r5, r13, r18
    bg.lbz r7, 0x3c3f(r15)
    bg.sflesi r5, 0xff
    bn.cmov_0 r7, r7, r6
    bg.sbz 0x3c3f(r15), r7
    bn.extbz r6, r13
    bn.sub r7, r19, r6
    bn.sbz 0x7(r1), r7
    bt.movi r10, 0x9
    bn.sub r17, r14, r6
    bt.j loc_240a0b
loc_2409f8:
    bt.movi r3, 0x2
    bg.jal 0x240469
    bg.jal 0x240725
loc_240a02:
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bn.beqi r10, 0x0, loc_240a40
loc_240a0b:
    bt.movi r3, 0x0
    bt.mov r4, r11
    bg.jal 0x2408ff
    bn.beqi r3, 0x0, loc_2409f8
    bt.movi r3, 0x1
    bn.addi r4, r1, 0x7
    bg.jal 0x2406df
    bn.beqi r3, 0x0, loc_240a02
    bt.movi r3, 0x1
    bt.mov r4, r11
    bg.jal 0x2408ff
    bn.beqi r3, 0x0, loc_240a02
    bn.sfleui r16, 0x7f
    bn.bnf loc_240a6c
    bn.extbz r3, r17
    bn.add r4, r13, r21
    bg.jal 0x240789
    bn.beqi r3, 0x0, loc_240a02
loc_240a40:
    bn.lwz r21, 0x8(r1)
    bn.lwz r20, 0xc(r1)
    bn.lwz r19, 0x10(r1)
    bn.lwz r18, 0x14(r1)
    bn.lwz r17, 0x18(r1)
    bn.lwz r16, 0x1c(r1)
    bn.lwz r15, 0x20(r1)
    bn.lwz r14, 0x24(r1)
    bn.lwz r13, 0x28(r1)
    bn.lwz r12, 0x2c(r1)
    bn.lwz r11, 0x30(r1)
    bn.lwz r10, 0x34(r1)
    bn.lwz r9, 0x38(r1)
    bn.addi r1, r1, 0x3c
    bt.jr r9
loc_240a6c:
    bn.ori r3, r0, 0x80
    bn.add r4, r21, r13
    bg.jal 0x240789
    bn.beqi r3, 0x0, loc_240a02
    bn.addi r7, r16, -0x80
    bn.exthz r16, r7
    bn.beqi r16, 0x0, loc_240a40
    bg.addi r7, r13, 0x80
    bn.exthz r13, r7
    bt.j loc_2409c7
