# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a618,0x23a6e3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r3
    bt.mov r13, r4
    bt.mov r11, r5
    bt.mov r3, r5
    bg.jal 0x222819
    bg.jal 0x21d76c
    bg.ori r10, r0, 0xfffe
    bn.bnei r3, 0x1, loc_23a66c
    bt.j loc_23a698
loc_23a643:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r11, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0xc
    bn.bnei r7, 0x0, loc_23a684
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bg.ori r6, r0, 0xffff
    bn.sfeq r10, r6
    bn.bf loc_23a684
loc_23a66c:
    bt.mov r3, r12
    bg.jal 0x23dd44
    bn.and r3, r3, r13
    bn.beqi r3, 0x0, loc_23a643
    bt.mov r3, r12
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x8
    bn.bnei r3, 0x0, loc_23a643
loc_23a684:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_23a698:
    bn.ori r7, r0, 0xb0
    bn.muls r11, r11, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r11, r6
    bt.j loc_23a6c3
loc_23a6aa:
    bn.lbz r7, 0x20(r11)
    bn.andi r7, r7, 0xc
    bn.bnei r7, 0x0, loc_23a684
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bg.ori r7, r0, 0xffff
    bn.sfeq r10, r7
    bn.bf loc_23a684
loc_23a6c3:
    bt.mov r3, r12
    bg.jal 0x23dd44
    bn.and r3, r13, r3
    bn.beqi r3, 0x0, loc_23a6aa
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
