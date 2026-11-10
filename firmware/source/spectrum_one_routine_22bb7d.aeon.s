# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22bb7d,0x22cae2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x48
    bn.sw 0x44(r1), r9
    bn.sw 0x40(r1), r10
    bn.sw 0x3c(r1), r11
    bn.sw 0x38(r1), r12
    bn.sw 0x34(r1), r13
    bn.sw 0x30(r1), r14
    bn.sw 0x2c(r1), r15
    bn.sw 0x28(r1), r16
    bn.sw 0x24(r1), r17
    bn.sw 0x20(r1), r18
    bn.sw 0x1c(r1), r19
    bn.sw 0x18(r1), r20
    bn.sw 0x14(r1), r21
    bn.sw 0x10(r1), r22
    bt.mov r13, r3
    bg.jal 0x2227ef
    bt.mov r10, r3
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.beqi r7, 0x0, loc_22bbf2
    bn.ori r7, r0, 0xa8
    bn.muls r3, r10, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lbz r7, 0x29(r3)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_22bbf2
    bg.lbz r3, 0xa4(r3)
    bg.beqi r3, 0x0, loc_22c12e
loc_22bbf2:
    bt.mov r3, r13
    bt.movi r4, 0x0
    bg.jal 0x225be9
loc_22bbfa:
    bn.ori r10, r0, 0x7c
    bn.muls r10, r13, r10
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r10, r7
    bn.lwz r11, 0x4(r10)
    bt.mov r3, r13
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lbz r6, 0x2f(r3)
    bn.lbz r7, 0x30(r3)
    bn.sbz 0x30(r10), r7
    bn.andi r16, r13, 0x1
    bg.beqi r16, 0x0, loc_22c106
    bg.beqi r6, 0x0, loc_22c17f
    bg.beqi r6, 0x1, loc_22c283
    bg.beqi r6, 0x2, loc_22ca64
    bg.beqi r6, 0x3, loc_22cab6
    bg.beqi r6, 0x4, loc_22c283
    bg.beqi r6, 0x5, loc_22cad6
loc_22bc4b:
    bn.ori r7, r0, 0x7c
    bn.muls r10, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r10, r6
    bn.lwz r11, 0x4(r10)
    bt.mov r3, r13
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_22bc90
    bn.andi r7, r13, 0x2
    bg.bnei r7, 0x0, loc_22c1b3
    bn.lh r7, 0x34(r10)
    bn.lh r6, 0x38(r10)
    bt.add r7, r6
    bn.lh r10, 0x40(r10)
    bg.beq r7, r10, loc_22c1ba
loc_22bc90:
    bt.movi r6, 0x0
    bg.beqi r16, 0x0, loc_22c1d1
loc_22bc96:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lbz r3, 0x29(r7)
    bg.beqi r3, 0x3, loc_22c733
    bg.beqi r3, 0x5, loc_22c733
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c7f8
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r6
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x1e
    bn.add r3, r11, r6
    bg.ori r7, r0, 0xfff0
    bn.and r4, r4, r7
    bg.jal 0x23e58a
loc_22bce8:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c5b0
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x30
    bn.add r3, r11, r5
    bn.lh r7, 0x3a(r7)
    bg.ori r4, r7, 0x8000
    bg.jal 0x23e58a
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c5e0
loc_22bd24:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x5780
    bn.ori r6, r6, 0x2a
    bn.add r3, r11, r6
    bn.lh r4, 0x3a(r7)
    bg.jal 0x23e58a
loc_22bd45:
    bn.ori r7, r0, 0x7c
    bn.muls r11, r13, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r11, r7
    bn.lwz r12, 0x4(r11)
    bt.mov r3, r13
    bg.jal 0x2227ef
    bt.mov r17, r3
    bn.ori r10, r0, 0xa8
    bn.muls r10, r3, r10
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r10, r5
    bn.lbz r14, 0x2f(r10)
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x2
    bn.add r20, r12, r6
    bt.mov r3, r20
    bg.jal 0x23df85
    bt.mov r19, r3
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x4
    bn.add r22, r12, r7
    bt.mov r3, r22
    bg.jal 0x23df85
    bn.sw 0x8(r1), r3
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x82
    bn.add r21, r12, r5
    bt.mov r3, r21
    bg.jal 0x23df85
    bt.mov r18, r3
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x84
    bt.add r6, r12
    bn.sw 0xc(r1), r6
    bt.mov r3, r6
    bg.jal 0x23df85
    bn.sw 0x4(r1), r3
    bt.movi r15, 0x0
    bn.lbz r10, 0x38(r10)
    bn.beqi r10, 0x0, loc_22bdc6
    bn.lbz r15, 0x59(r11)
loc_22bdc6:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lbz r10, 0x32(r7)
    bt.mov r3, r13
    bg.jal 0x222804
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.bnei r7, 0x0, loc_22c129
    bg.movhi r7, 0x45
    bg.lhz r7, 0x51ec(r7)
    bn.andi r7, r7, 0x40
    bn.addi r6, r10, 0x4
    bn.extbz r5, r6
    bg.bnei r7, 0x0, loc_22c129
loc_22be0e:
    bn.andi r6, r10, 0x1
    bn.addi r7, r5, -0x1
    bn.extbz r4, r7
    bn.bnei r6, 0x0, loc_22be20
    bn.addi r7, r5, 0x1
    bn.extbz r4, r7
loc_22be20:
    bg.beqi r16, 0x0, loc_22c3b2
    bn.addi r7, r13, -0x1
    bn.slli r7, r7, 0x2
    bn.andi r7, r7, 0xfc
    bn.sll r4, r4, r7
    bt.movi r5, 0x7
    bn.sll r5, r5, r7
    bt.movhi r3, -0xd
    bg.ori r3, r3, 0x1910
    bn.exthz r4, r4
    bn.exthz r5, r5
    bg.jal 0x23e152
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22c688
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0xe
    bn.add r3, r12, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
loc_22be62:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lbz r4, 0x30(r7)
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c675
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x32
    bn.add r3, r12, r7
    bn.ori r5, r0, 0x1f
    bg.jal 0x23e4f4
loc_22be91:
    bg.ori r6, r0, 0x7fff
    bn.and r19, r19, r6
    bg.movhi r7, 0x5780
    bn.ori r7, r7, 0x21
    bn.add r3, r12, r7
    bt.movi r4, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bn.sw 0x8(r1), r0
loc_22bead:
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0xe0
    bn.add r3, r12, r6
    bt.movi r4, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bn.addi r7, r14, -0x4
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22c76d
loc_22bec8:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lbz r7, 0x78(r7)
    bg.beqi r7, 0x2, loc_22c481
    bg.beqi r7, 0x1, loc_22c782
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r7, 0x5c(r7)
    bg.movhi r6, 0xbfff
    bg.ori r6, r6, 0xffff
    bn.and r4, r7, r6
loc_22bf01:
    bn.ori r6, r0, 0x7c
    bn.muls r6, r13, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r6, r7
    bn.lh r7, 0x7a(r6)
    bn.addi r7, r7, 0x3f
    bt.add r7, r15
    bg.ori r5, r0, 0xffc0
    bn.and r11, r7, r5
    bn.lh r7, 0x38(r6)
    bt.addi r7, 0xf
    bt.add r7, r15
    bg.ori r5, r0, 0xfff0
    bn.and r14, r7, r5
    bn.lh r7, 0x48(r6)
    bt.addi r7, 0xf
    bt.add r7, r15
    bn.and r15, r7, r5
    bg.beqi r16, 0x0, loc_22c325
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c514
    bn.srli r10, r4, 0x5
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x10
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e50c
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c532
loc_22bf66:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x1c
    bn.add r3, r12, r7
    bt.mov r4, r11
    bg.jal 0x23e58a
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c54d
loc_22bf81:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x20
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e50c
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c568
loc_22bf9c:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x2c
    bn.add r3, r12, r7
    bt.mov r4, r11
    bg.jal 0x23e58a
loc_22bfab:
    bg.ble r14, r15, loc_22c4f6
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c866
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x2e
    bn.add r3, r12, r7
    bt.mov r4, r14
    bg.jal 0x23e58a
loc_22bfca:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r7, 0x34(r7)
    bn.sfeqi r7, 0x0
    bn.ori r7, r0, 0x40
    bn.cmov_0 r10, r7, r0
    bg.beqi r16, 0x0, loc_22c2da
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22c4b8
    bt.mov r3, r20
    bt.mov r4, r19
    bg.jal 0x23e58a
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c4cc
loc_22c00a:
    bt.mov r3, r22
    bn.lwz r4, 0x8(r1)
    bg.jal 0x23e58a
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c4e1
loc_22c01f:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xf
    bn.add r3, r12, r7
    bt.mov r4, r10
    bn.ori r5, r0, 0xe0
    bg.jal 0x23e4f4
loc_22c031:
    bn.ori r10, r0, 0x7c
    bn.muls r10, r13, r10
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r10, r5
    bn.lwz r11, 0x4(r10)
    bt.mov r3, r13
    bg.jal 0x2227ef
    bn.lbz r7, 0x78(r10)
    bg.beqi r7, 0x2, loc_22c4a2
    bg.beqi r7, 0x1, loc_22c7a3
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lwz r3, 0x5c(r7)
loc_22c068:
    bt.movi r10, 0x2
    bn.blesi r3, -0x1, loc_22c073
    bn.srli r7, r3, 0x1e
    bn.andi r10, r7, 0x1
loc_22c073:
    bg.beqi r16, 0x0, loc_22c2b0
    bn.movhi_2 r7, 0x1180
    bn.ori r7, r7, 0xa
    bn.add r3, r11, r7
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x10
    bg.beqi r3, 0x0, loc_22c139
loc_22c08b:
    bt.movi r3, 0x2
loc_22c08d:
    bg.beq r10, r3, loc_22c150
loc_22c091:
    bg.beqi r16, 0x0, loc_22c43e
    bg.beqi r10, 0x2, loc_22c8f6
    bg.beqi r10, 0x1, loc_22c9b5
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c964
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0xa
    bn.add r3, r11, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_22c0bb:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c954
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0xa
    bn.add r3, r11, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
loc_22c0d5:
    bn.lwz r22, 0x10(r1)
    bn.lwz r21, 0x14(r1)
    bn.lwz r20, 0x18(r1)
    bn.lwz r19, 0x1c(r1)
    bn.lwz r18, 0x20(r1)
    bn.lwz r17, 0x24(r1)
    bn.lwz r16, 0x28(r1)
    bn.lwz r15, 0x2c(r1)
    bn.lwz r14, 0x30(r1)
    bn.lwz r13, 0x34(r1)
    bn.lwz r12, 0x38(r1)
    bn.lwz r11, 0x3c(r1)
    bn.lwz r10, 0x40(r1)
    bn.lwz r9, 0x44(r1)
    bn.addi r1, r1, 0x48
    bg.j 0x23e4f4
loc_22c106:
    bg.beqi r6, 0x0, loc_22c1a3
    bg.beqi r6, 0x1, loc_22c2a5
    bg.beqi r6, 0x3, loc_22ca54
    bg.beqi r6, 0x2, loc_22caab
    bg.beqi r6, 0x4, loc_22c2a5
    bg.bnei r6, 0x5, loc_22bc4b
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x82
    bn.add r10, r11, r5
    bt.j loc_22c28c
loc_22c129:
    bt.mov r5, r10
    bn.j loc_22be0e
loc_22c12e:
    bt.mov r3, r13
    bt.movi r4, 0x1
    bg.jal 0x225be9
    bn.j loc_22bbfa
loc_22c139:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0xa
    bn.add r3, r11, r5
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x4
    bn.andi r3, r3, 0x1
    bg.bne r10, r3, loc_22c091
loc_22c150:
    bn.lwz r22, 0x10(r1)
    bn.lwz r21, 0x14(r1)
    bn.lwz r20, 0x18(r1)
    bn.lwz r19, 0x1c(r1)
    bn.lwz r18, 0x20(r1)
    bn.lwz r17, 0x24(r1)
    bn.lwz r16, 0x28(r1)
    bn.lwz r15, 0x2c(r1)
    bn.lwz r14, 0x30(r1)
    bn.lwz r13, 0x34(r1)
    bn.lwz r12, 0x38(r1)
    bn.lwz r11, 0x3c(r1)
    bn.lwz r10, 0x40(r1)
    bn.lwz r9, 0x44(r1)
    bn.addi r1, r1, 0x48
    bt.jr r9
loc_22c17f:
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x2
    bn.add r10, r11, r6
    bt.mov r3, r10
    bn.ori r4, r0, 0x80
loc_22c18d:
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.j loc_22bc4b
loc_22c1a3:
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x82
    bn.add r10, r11, r6
    bt.mov r3, r10
    bn.ori r4, r0, 0x80
    bt.j loc_22c18d
loc_22c1b3:
    bn.lh r10, 0x34(r10)
    bg.bnei r10, 0x0, loc_22bc90
loc_22c1ba:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lbz r6, 0x59(r7)
    bg.bnei r16, 0x0, loc_22bc96
loc_22c1d1:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lbz r3, 0x29(r7)
    bg.beqi r3, 0x3, loc_22c6f9
    bg.beqi r3, 0x5, loc_22c6f9
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c826
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r6
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x9e
    bn.add r3, r11, r6
    bg.ori r7, r0, 0xfff0
    bn.and r4, r4, r7
    bg.jal 0x23e58a
loc_22c223:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c64e
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0xb0
    bn.add r3, r11, r5
    bn.lh r7, 0x3a(r7)
    bg.ori r4, r7, 0x8000
    bg.jal 0x23e58a
loc_22c253:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c62a
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x5880
    bn.ori r6, r6, 0x2a
    bn.add r3, r11, r6
    bn.lh r4, 0x3a(r7)
    bg.jal 0x23e58a
    bn.j loc_22bd45
loc_22c283:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x2
    bn.add r10, r11, r7
loc_22c28c:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.j loc_22bc4b
loc_22c2a5:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x82
    bn.add r10, r11, r7
    bt.j loc_22c28c
loc_22c2b0:
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0x89
    bn.add r3, r11, r6
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x40
    bg.bnei r3, 0x0, loc_22c08b
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x89
    bn.add r3, r11, r7
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x6
    bn.andi r3, r3, 0x1
    bn.j loc_22c08d
loc_22c2da:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c59b
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x8f
    bn.add r3, r12, r7
    bt.mov r4, r10
    bn.ori r5, r0, 0xe0
    bg.jal 0x23e4f4
loc_22c2f8:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c57a
    bt.mov r3, r21
    bt.mov r4, r18
    bg.jal 0x23e58a
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22c58e
loc_22c318:
    bn.lwz r3, 0xc(r1)
    bn.lwz r4, 0x4(r1)
    bg.jal 0x23e58a
    bn.j loc_22c031
loc_22c325:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c6e4
    bn.srli r10, r4, 0x5
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x90
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e50c
loc_22c343:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c6d2
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x9c
    bn.add r3, r12, r7
    bt.mov r4, r11
    bg.jal 0x23e58a
loc_22c35e:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c6c0
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xa0
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e50c
loc_22c379:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c6ae
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xac
    bn.add r3, r12, r7
    bt.mov r4, r11
    bg.jal 0x23e58a
loc_22c394:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c69c
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xae
    bn.add r3, r12, r7
    bt.mov r4, r14
    bg.jal 0x23e58a
    bn.j loc_22bfca
loc_22c3b2:
    bn.addi r7, r13, 0x1
    bn.slli r7, r7, 0x2
    bn.andi r7, r7, 0xfc
    bn.sll r4, r4, r7
    bt.movi r5, 0x7
    bn.sll r5, r5, r7
    bt.movhi r3, -0xd
    bg.ori r3, r3, 0x1910
    bn.exthz r4, r4
    bn.exthz r5, r5
    bg.jal 0x23e152
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c616
    bn.movhi_2 r5, 0x1180
    bn.ori r5, r5, 0x8e
    bn.add r3, r12, r5
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
loc_22c3f0:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lbz r4, 0x30(r7)
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c604
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0xb2
    bn.add r3, r12, r5
    bn.ori r5, r0, 0x1f
    bg.jal 0x23e4f4
loc_22c41f:
    bg.ori r7, r0, 0x7fff
    bn.and r18, r18, r7
    bg.movhi r5, 0x5780
    bn.ori r5, r5, 0x21
    bn.add r3, r12, r5
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bn.sw 0x4(r1), r0
    bn.j loc_22bead
loc_22c43e:
    bg.beqi r10, 0x2, loc_22c8d4
    bg.beqi r10, 0x1, loc_22c979
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c93f
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0x89
    bn.add r3, r11, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_22c464:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c7b9
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x89
    bn.add r3, r11, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bn.j loc_22c0d5
loc_22c481:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r7, 0x64(r7)
    bg.movhi r6, 0xbfff
    bg.ori r6, r6, 0xffff
    bn.and r4, r7, r6
    bn.j loc_22bf01
loc_22c4a2:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lwz r3, 0x64(r7)
    bn.j loc_22c068
loc_22c4b8:
    bt.mov r3, r20
    bt.mov r4, r19
    bg.jal 0x23dfb6
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.bnei r5, 0x0, loc_22c00a
loc_22c4cc:
    bt.mov r3, r22
    bn.lwz r4, 0x8(r1)
    bg.jal 0x23dfb6
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.bnei r6, 0x0, loc_22c01f
loc_22c4e1:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0xf
    bn.add r3, r12, r5
    bt.mov r4, r10
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bn.j loc_22c031
loc_22c4f6:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22c854
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x2e
    bn.add r3, r12, r7
    bt.mov r4, r15
    bg.jal 0x23e58a
    bn.j loc_22bfca
loc_22c514:
    bn.srli r10, r4, 0x5
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x10
    bn.add r3, r12, r5
    bt.mov r4, r10
    bg.jal 0x23e2b8
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.bnei r6, 0x0, loc_22bf66
loc_22c532:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x1c
    bn.add r3, r12, r5
    bt.mov r4, r11
    bg.jal 0x23dfb6
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.bnei r6, 0x0, loc_22bf81
loc_22c54d:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bt.mov r4, r10
    bg.jal 0x23e2b8
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.bnei r6, 0x0, loc_22bf9c
loc_22c568:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x2c
    bn.add r3, r12, r5
    bt.mov r4, r11
    bg.jal 0x23dfb6
    bn.j loc_22bfab
loc_22c57a:
    bt.mov r3, r21
    bt.mov r4, r18
    bg.jal 0x23dfb6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_22c318
loc_22c58e:
    bn.lwz r3, 0xc(r1)
    bn.lwz r4, 0x4(r1)
    bg.jal 0x23dfb6
    bn.j loc_22c031
loc_22c59b:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x8f
    bn.add r3, r12, r5
    bt.mov r4, r10
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bn.j loc_22c2f8
loc_22c5b0:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x30
    bn.add r3, r11, r5
    bn.lh r7, 0x3a(r7)
    bg.ori r4, r7, 0x8000
    bg.jal 0x23dfb6
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.bnei r6, 0x0, loc_22bd24
loc_22c5e0:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x5780
    bn.ori r6, r6, 0x2a
    bn.add r3, r11, r6
    bn.lh r4, 0x3a(r7)
    bg.jal 0x23dfb6
    bn.j loc_22bd45
loc_22c604:
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0xb2
    bn.add r3, r12, r6
    bn.ori r5, r0, 0x1f
    bg.jal 0x23dfe1
    bt.j loc_22c41f
loc_22c616:
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0x8e
    bn.add r3, r12, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.j loc_22c3f0
loc_22c62a:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x5880
    bn.ori r6, r6, 0x2a
    bn.add r3, r11, r6
    bn.lh r4, 0x3a(r7)
    bg.jal 0x23dfb6
    bn.j loc_22bd45
loc_22c64e:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0xb0
    bn.add r3, r11, r5
    bn.lh r7, 0x3a(r7)
    bg.ori r4, r7, 0x8000
    bg.jal 0x23dfb6
    bn.j loc_22c253
loc_22c675:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x32
    bn.add r3, r12, r5
    bn.ori r5, r0, 0x1f
    bg.jal 0x23dfe1
    bn.j loc_22be91
loc_22c688:
    bn.movhi_2 r7, 0x1180
    bn.ori r7, r7, 0xe
    bn.add r3, r12, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.j loc_22be62
loc_22c69c:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0xae
    bn.add r3, r12, r5
    bt.mov r4, r14
    bg.jal 0x23dfb6
    bn.j loc_22bfca
loc_22c6ae:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0xac
    bn.add r3, r12, r5
    bt.mov r4, r11
    bg.jal 0x23dfb6
    bn.j loc_22c394
loc_22c6c0:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0xa0
    bn.add r3, r12, r5
    bt.mov r4, r10
    bg.jal 0x23e2b8
    bn.j loc_22c379
loc_22c6d2:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x9c
    bn.add r3, r12, r5
    bt.mov r4, r11
    bg.jal 0x23dfb6
    bn.j loc_22c35e
loc_22c6e4:
    bn.srli r10, r4, 0x5
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x90
    bn.add r3, r12, r5
    bt.mov r4, r10
    bg.jal 0x23e2b8
    bn.j loc_22c343
loc_22c6f9:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22c8a6
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r6
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x9e
    bn.add r3, r11, r6
    bg.ori r7, r0, 0xfffc
    bn.and r4, r4, r7
    bg.jal 0x23e58a
    bn.j loc_22c223
loc_22c733:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22c878
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r6
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x1e
    bn.add r3, r11, r6
    bg.ori r7, r0, 0xfffc
    bn.and r4, r4, r7
    bg.jal 0x23e58a
    bn.j loc_22bce8
loc_22c76d:
    bg.beqi r16, 0x0, loc_22c932
    bg.beqi r14, 0x5, loc_22cac6
    bg.addi r6, r0, -0x8000
    bn.or r7, r19, r6
    bn.exthz r19, r7
    bn.j loc_22bec8
loc_22c782:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r7, 0x60(r7)
    bg.movhi r6, 0xbfff
    bg.ori r6, r6, 0xffff
    bn.and r4, r7, r6
    bn.j loc_22bf01
loc_22c7a3:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r3, 0x60(r7)
    bn.j loc_22c068
loc_22c7b9:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x89
    bn.add r3, r11, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
loc_22c7c7:
    bn.lwz r22, 0x10(r1)
    bn.lwz r21, 0x14(r1)
    bn.lwz r20, 0x18(r1)
    bn.lwz r19, 0x1c(r1)
    bn.lwz r18, 0x20(r1)
    bn.lwz r17, 0x24(r1)
    bn.lwz r16, 0x28(r1)
    bn.lwz r15, 0x2c(r1)
    bn.lwz r14, 0x30(r1)
    bn.lwz r13, 0x34(r1)
    bn.lwz r12, 0x38(r1)
    bn.lwz r11, 0x3c(r1)
    bn.lwz r10, 0x40(r1)
    bn.lwz r9, 0x44(r1)
    bn.addi r1, r1, 0x48
    bg.j 0x23dfe1
loc_22c7f8:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r6
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x1e
    bn.add r3, r11, r6
    bg.ori r7, r0, 0xfff0
    bn.and r4, r4, r7
    bg.jal 0x23dfb6
    bn.j loc_22bce8
loc_22c826:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r6
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x9e
    bn.add r3, r11, r6
    bg.ori r7, r0, 0xfff0
    bn.and r4, r4, r7
    bg.jal 0x23dfb6
    bn.j loc_22c223
loc_22c854:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bt.mov r4, r15
    bg.jal 0x23dfb6
    bn.j loc_22bfca
loc_22c866:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bt.mov r4, r14
    bg.jal 0x23dfb6
    bn.j loc_22bfca
loc_22c878:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r6
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x1e
    bn.add r3, r11, r6
    bg.ori r7, r0, 0xfffc
    bn.and r4, r4, r7
    bg.jal 0x23dfb6
    bn.j loc_22bce8
loc_22c8a6:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r6
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x9e
    bn.add r3, r11, r6
    bg.ori r7, r0, 0xfffc
    bn.and r4, r4, r7
    bg.jal 0x23dfb6
    bn.j loc_22c223
loc_22c8d4:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22c9f0
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0x89
    bn.add r3, r11, r6
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23e4f4
    bn.j loc_22c464
loc_22c8f6:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22ca17
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0xa
    bn.add r3, r11, r6
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_22c915:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22ca06
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0xa
    bn.add r3, r11, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bn.j loc_22c0d5
loc_22c932:
    bg.addi r5, r0, -0x8000
    bn.or r7, r18, r5
    bn.exthz r18, r7
    bn.j loc_22bec8
loc_22c93f:
    bn.movhi_2 r7, 0x1180
    bn.ori r7, r7, 0x89
    bn.add r3, r11, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_22c464
loc_22c954:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xa
    bn.add r3, r11, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bt.j loc_22c7c7
loc_22c964:
    bn.movhi_2 r7, 0x1180
    bn.ori r7, r7, 0xa
    bn.add r3, r11, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_22c0bb
loc_22c979:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22ca40
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0x89
    bn.add r3, r11, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23e4f4
loc_22c997:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22ca99
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x89
    bn.add r3, r11, r6
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bn.j loc_22c0d5
loc_22c9b5:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.beqi r5, 0x0, loc_22ca2c
    bn.movhi_2 r6, 0x1180
    bn.ori r6, r6, 0xa
    bn.add r3, r11, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_22c9d2:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22ca87
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0xa
    bn.add r3, r11, r6
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bn.j loc_22c0d5
loc_22c9f0:
    bn.movhi_2 r7, 0x1180
    bn.ori r7, r7, 0x89
    bn.add r3, r11, r7
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bn.j loc_22c464
loc_22ca06:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xa
    bn.add r3, r11, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bn.j loc_22c7c7
loc_22ca17:
    bn.movhi_2 r7, 0x1180
    bn.ori r7, r7, 0xa
    bn.add r3, r11, r7
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.j loc_22c915
loc_22ca2c:
    bn.movhi_2 r7, 0x1180
    bn.ori r7, r7, 0xa
    bn.add r3, r11, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.j loc_22c9d2
loc_22ca40:
    bn.movhi_2 r7, 0x1180
    bn.ori r7, r7, 0x89
    bn.add r3, r11, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bt.j loc_22c997
loc_22ca54:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x82
    bn.add r10, r11, r5
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.j loc_22c18d
loc_22ca64:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x2
    bn.add r10, r11, r5
loc_22ca6d:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.j loc_22bc4b
loc_22ca87:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xa
    bn.add r3, r11, r7
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bn.j loc_22c7c7
loc_22ca99:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x89
    bn.add r3, r11, r7
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bn.j loc_22c7c7
loc_22caab:
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x82
    bn.add r10, r11, r6
    bt.j loc_22ca6d
loc_22cab6:
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x2
    bn.add r10, r11, r6
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.j loc_22c18d
loc_22cac6:
    bn.lwz r5, 0x8(r1)
    bg.ori r7, r5, 0x410d
    bn.exthz r7, r7
    bn.sw 0x8(r1), r7
    bn.j loc_22bec8
loc_22cad6:
    bn.movhi_2 r5, 0x1280
    bn.ori r5, r5, 0x2
    bn.add r10, r11, r5
    bn.j loc_22c28c
