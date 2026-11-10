# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23387d,0x233973); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r11, r3
    bg.jal 0x21632e
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x212093
    bn.bnei r3, 0x0, loc_2338f4
    bn.ori r7, r0, 0x84
    bn.muls r3, r11, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0xe8
    bt.add r3, r7
    bn.lwz r7, 0x0(r3)
    bn.beqi r7, 0x2, loc_2338cc
loc_2338b6:
    bt.mov r3, r10
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_2338cc:
    bn.lbz r6, 0x4f(r3)
    bn.bnei r6, 0x1, loc_2338b6
    bn.lbz r7, 0x44(r3)
    bn.slli r6, r10, 0x1
    bn.sfeqi r7, 0x1
    bn.cmov_0 r10, r6, r10
    bt.mov r3, r10
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_2338f4:
    bt.mov r3, r11
    bg.jal 0x211e4a
    bt.mov r12, r3
    bt.mov r3, r11
    bg.jal 0x211deb
    bt.mov r13, r3
    bt.mov r3, r11
    bg.jal 0x211dc9
    bn.slli r7, r10, 0x2
    bn.sfnei r3, 0x0
    bn.cmov_0 r10, r7, r10
    bn.ori r7, r0, 0x84
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0xe8
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bn.slli r6, r10, 0x1
    bn.sfeqi r7, 0x3
    bn.cmov_0 r10, r6, r10
    bn.beqi r12, 0x3, loc_23395f
    bg.beqi r12, 0x4, loc_233957
    bn.beqi r12, 0x2, loc_233969
loc_233939:
    bn.extbz r7, r13
    bt.addi r7, 0x1
    bn.divu r10, r10, r7
    bt.mov r3, r10
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_233957:
    bn.slli r7, r10, 0x3
    bn.srli r10, r7, 0x4
    bt.j loc_233939
loc_23395f:
    bn.slli r6, r10, 0x3
    bt.movi r7, 0xc
    bn.divu r10, r6, r7
    bt.j loc_233939
loc_233969:
    bn.slli r6, r10, 0x3
    bt.movi r7, 0xa
    bn.divu r10, r6, r7
    bt.j loc_233939
