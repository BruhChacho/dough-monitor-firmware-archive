# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22f856,0x233214); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x1a0
    bg.sw_0 0x19c(r1), r9
    bg.sw_0 0x198(r1), r10
    bg.sw_0 0x194(r1), r11
    bg.sw_0 0x190(r1), r12
    bg.sw_0 0x18c(r1), r13
    bg.sw_0 0x188(r1), r14
    bg.sw_0 0x184(r1), r15
    bg.sw_0 0x180(r1), r16
    bg.sw_0 0x17c(r1), r17
    bg.sw_0 0x178(r1), r18
    bg.sw_0 0x174(r1), r19
    bg.sw_0 0x170(r1), r20
    bg.sw_0 0x16c(r1), r21
    bg.sw_0 0x168(r1), r22
    bt.mov r14, r3
    bn.ori r10, r0, 0x7c
    bn.muls r10, r3, r10
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r10, r4
    bn.lwz r12, 0x4(r10)
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lbz r11, 0x2f(r3)
    bn.lh r6, 0x32(r3)
    bn.lbz r7, 0x30(r3)
    bn.sbz 0x30(r10), r7
    bt.mov r3, r6
    bt.mov r4, r11
    bg.jal 0x222915
    bn.sw 0x2c(r10), r3
    bn.andi r21, r14, 0x1
    bg.beqi r21, 0x0, loc_230367
    bg.beqi r11, 0x0, loc_2303fe
    bn.sfeqi r11, 0x1
    bn.bf loc_232373
    bn.sfeqi r11, 0x2
    bn.bf loc_2328d0
    bn.sfeqi r11, 0x3
    bn.bf loc_232a3b
    bn.sfeqi r11, 0x4
    bn.bf loc_232476
    bn.sfeqi r11, 0x5
    bn.bf loc_232ba4
loc_22f8fb:
    bn.ori r7, r0, 0x7c
    bn.muls r10, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r10, r6
    bn.lwz r11, 0x4(r10)
    bt.mov r3, r14
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_22f940
    bn.andi r7, r14, 0x2
    bg.bnei r7, 0x0, loc_230448
    bn.lh r7, 0x34(r10)
    bn.lh r6, 0x38(r10)
    bt.add r7, r6
    bn.lh r10, 0x40(r10)
    bg.beq r7, r10, loc_23044f
loc_22f940:
    bt.movi r10, 0x0
    bg.beqi r21, 0x0, loc_230466
loc_22f946:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r3, 0x29(r7)
    bn.sfeqi r3, 0x3
    bn.bf loc_23118b
    bn.sfeqi r3, 0x5
    bn.bf loc_23118b
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_231644
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r10
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x1e
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfff0
    bn.and r4, r4, r6
    bg.jal 0x23e58a
loc_22f99f:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_231615
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r10
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x50
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfff0
    bn.and r4, r4, r6
    bg.jal 0x23e58a
loc_22f9d9:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_230f24
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x30
    bn.add r3, r11, r5
    bn.lh r7, 0x3a(r7)
    bg.ori r4, r7, 0x8000
    bg.jal 0x23e58a
loc_22fa0c:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_230f00
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bg.movhi r4, 0x2080
    bn.ori r4, r4, 0x2a
    bn.add r3, r11, r4
    bn.lh r4, 0x4a(r7)
    bg.jal 0x23e58a
loc_22fa3b:
    bn.ori r7, r0, 0x7c
    bn.muls r11, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r11, r7
    bn.lwz r12, 0x4(r11)
    bt.mov r3, r14
    bg.jal 0x2227ef
    bn.sw 0x4(r1), r3
    bn.lbz r16, 0xe(r11)
    bg.jal 0x2250c5
    bg.sw_0 0x98(r1), r3
    bn.lwz r4, 0x2c(r11)
    bn.sw 0x4c(r1), r4
    bn.ori r10, r0, 0xa8
    bn.lwz r5, 0x4(r1)
    bn.muls r10, r5, r10
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lbz r7, 0x2f(r10)
    bg.sw_0 0x9c(r1), r7
    bt.mov r3, r5
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bn.sw 0x48(r1), r3
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x2
    bt.add r4, r12
    bg.sw_0 0x94(r1), r4
    bt.mov r3, r4
    bg.jal 0x23df85
    bn.sw 0x40(r1), r3
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x4
    bt.add r5, r12
    bg.sw_0 0x90(r1), r5
    bt.mov r3, r5
    bg.jal 0x23df85
    bn.sw 0x3c(r1), r3
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x82
    bt.add r6, r12
    bg.sw_0 0x8c(r1), r6
    bt.mov r3, r6
    bg.jal 0x23df85
    bg.sw_0 0xac(r1), r3
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x84
    bt.add r7, r12
    bg.sw_0 0x88(r1), r7
    bt.mov r3, r7
    bg.jal 0x23df85
    bg.sw_0 0xb4(r1), r3
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x2
    bt.add r4, r12
    bg.sw_0 0x84(r1), r4
    bt.mov r3, r4
    bg.jal 0x23df85
    bn.sw 0x34(r1), r3
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x4
    bt.add r5, r12
    bg.sw_0 0x80(r1), r5
    bt.mov r3, r5
    bg.jal 0x23df85
    bn.sw 0x30(r1), r3
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x6
    bt.add r6, r12
    bn.sw 0x7c(r1), r6
    bt.mov r3, r6
    bg.jal 0x23df85
    bn.sw 0x2c(r1), r3
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xa
    bt.add r7, r12
    bn.sw 0x78(r1), r7
    bt.mov r3, r7
    bg.jal 0x23df85
    bn.sw 0x28(r1), r3
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x60
    bt.add r4, r12
    bn.sw 0x74(r1), r4
    bt.mov r3, r4
    bg.jal 0x23df85
    bt.mov r17, r3
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x82
    bt.add r5, r12
    bn.sw 0x70(r1), r5
    bt.mov r3, r5
    bg.jal 0x23df85
    bn.sw 0x20(r1), r3
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x84
    bt.add r6, r12
    bn.sw 0x6c(r1), r6
    bt.mov r3, r6
    bg.jal 0x23df85
    bn.sw 0x1c(r1), r3
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x86
    bt.add r7, r12
    bn.sw 0x68(r1), r7
    bt.mov r3, r7
    bg.jal 0x23df85
    bn.sw 0x18(r1), r3
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x8a
    bt.add r4, r12
    bn.sw 0x64(r1), r4
    bt.mov r3, r4
    bg.jal 0x23df85
    bn.sw 0x14(r1), r3
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xcc
    bn.add r13, r12, r5
    bt.mov r3, r13
    bg.jal 0x23df85
    bt.mov r15, r3
    bn.sw 0x50(r1), r0
    bn.lbz r10, 0x38(r10)
    bn.beqi r10, 0x0, loc_22fbc6
    bn.lbz r11, 0x59(r11)
    bn.sw 0x50(r1), r11
loc_22fbc6:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lbz r6, 0x32(r7)
    bn.sfeq r14, r6
    bn.bf loc_230edb
    bn.addi r7, r6, 0x4
    bn.extbz r5, r7
    bn.andi r6, r6, 0x1
    bn.addi r7, r5, -0x1
    bn.extbz r4, r7
    bn.bnei r6, 0x0, loc_22fbf7
    bn.addi r7, r5, 0x1
    bn.extbz r4, r7
loc_22fbf7:
    bn.sfeqi r21, 0x0
    bn.bf loc_230d7f
    bn.addi r7, r14, -0x1
    bn.slli r7, r7, 0x2
    bn.andi r7, r7, 0xfc
    bn.sll r4, r4, r7
    bt.movi r5, 0x7
    bn.sll r5, r5, r7
    bt.movhi r3, -0xd
    bg.ori r3, r3, 0x1912
    bn.exthz r4, r4
    bn.exthz r5, r5
    bg.jal 0x23e152
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_23151f
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0xe
    bn.add r3, r12, r5
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
loc_22fc3e:
    bg.jal 0x21be0b
    bt.movi r7, 0x5
    bn.sw 0x58(r1), r7
    bn.ori r4, r0, 0x60
    bn.sw 0x44(r1), r4
    bn.bnei r3, 0x0, loc_22fc5b
    bt.movi r5, 0x4
    bn.sw 0x58(r1), r5
    bn.ori r6, r0, 0x40
    bn.sw 0x44(r1), r6
loc_22fc5b:
    bg.addi r4, r0, -0x2000
    bn.or r7, r15, r4
    bg.ori r5, r0, 0x1fff
    bn.and r6, r15, r5
    bn.exthz r7, r7
    bg.lwz r4, 0x9c(r1)
    bn.sfeqi r4, 0x5
    bn.cmov_0 r4, r7, r6
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_230bdc
    bt.mov r3, r13
    bg.jal 0x23e58a
loc_22fc88:
    bg.beqi r21, 0x0, loc_230b3e
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_230fa5
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x32
    bn.add r3, r12, r7
    bn.lwz r4, 0x58(r1)
    bn.ori r5, r0, 0x1f
    bg.jal 0x23e4f4
loc_22fcae:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_230f91
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x4f
    bn.add r3, r12, r6
    bn.ori r4, r0, 0x14
    bg.jal 0x23e5d1
loc_22fccd:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_230f7d
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xc9
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x14
    bg.jal 0x23e5d1
loc_22fcec:
    bn.lwz r7, 0x34(r1)
    bg.ori r4, r0, 0x7fff
    bn.and r7, r7, r4
    bn.sw 0x34(r1), r7
    bn.lwz r5, 0x2c(r1)
    bg.ori r6, r0, 0xcfdf
    bn.and r5, r5, r6
    bn.sw 0x2c(r1), r5
    bg.ori r7, r0, 0xfffb
    bn.and r7, r17, r7
    bn.sw 0x24(r1), r7
    bg.lwz r4, 0xac(r1)
    bn.andi r4, r4, 0xff
    bg.sw_0 0xac(r1), r4
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x21
    bn.add r3, r12, r5
    bt.movi r4, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.sw_0 0xb4(r1), r0
    bn.sw 0x30(r1), r0
loc_22fd34:
    bg.lwz r7, 0x9c(r1)
    bt.addi r7, -0x4
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_230bbb
loc_22fd41:
    bn.ori r7, r0, 0x7c
    bn.muls r10, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r10, r6
    bn.lbz r11, 0x54(r10)
    bn.lbz r4, 0x55(r10)
    bn.add r7, r11, r4
    bn.extbz r7, r7
    bn.sw 0x54(r1), r7
    bt.mov r3, r14
    bg.jal 0x2228e1
    bt.mov r20, r3
    bn.lh r15, 0x7a(r10)
    bn.lh r6, 0x40(r10)
    bn.sub r7, r6, r15
    bn.exthz r18, r7
    bn.lbz r22, 0x78(r10)
    bt.movi r13, 0x0
    bn.lbz r5, 0x60(r10)
    bn.beqi r5, 0x0, loc_22fd85
    bn.lh r7, 0x44(r10)
    bn.sub r13, r7, r11
loc_22fd85:
    bg.beq r15, r6, loc_22fd96
    bg.bgt r18, r13, loc_22fd96
    bn.sub r7, r13, r18
    bn.sfnei r13, 0x0
    bn.cmov_0 r13, r7, r13
loc_22fd96:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r7, 0x38(r7)
    bg.bnei r7, 0x0, loc_23067f
    bt.mov r3, r14
    bt.movi r4, 0x1
    bg.jal 0x22d986
    bg.ori r7, r0, 0x4000
    bn.sw 0x10(r1), r7
    bg.beqi r22, 0x2, loc_23068e
loc_22fdc0:
    bn.sfeqi r22, 0x1
    bn.bf loc_2312c6
    bn.ori r7, r0, 0xa8
    bn.lwz r4, 0x4(r1)
    bn.muls r7, r4, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r6, 0x5c(r7)
    bg.movhi r5, 0xbfff
    bg.ori r5, r5, 0xffff
    bn.and r4, r6, r5
    bn.lwz r7, 0x60(r7)
    bn.and r19, r7, r5
    bn.movhi_2 r7, 0x190
    bt.add r19, r7
loc_22fdf2:
    bn.addi r7, r16, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_2306bc
loc_22fdfc:
    bn.movhi_2 r5, 0x190
    bn.add r11, r4, r5
    bn.lwz r3, 0x58(r1)
    bg.jal 0x2ac120
    bt.mov r17, r3
    bn.sflesi r13, -0x1
    bn.bf loc_23156a
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r4, r3
loc_22fe19:
    bn.lwz r3, 0x4c(r1)
    bg.jal 0x2abe2e
    bt.mov r4, r17
    bg.jal 0x2abe2e
    bg.jal 0x2aad27
    bg.sw_0 0xa8(r1), r3
    bn.addi r7, r15, 0x3f
    bn.lwz r6, 0x50(r1)
    bt.add r7, r6
    bg.ori r4, r0, 0xffc0
    bn.and r13, r7, r4
    bn.addi r7, r16, -0x4
    bn.extbz r7, r7
    bn.sfleui r7, 0x1
    bn.bf loc_231534
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r3, 0x36(r7)
    bt.mov r10, r11
    bn.beqi r3, 0x0, loc_22fe86
    bn.muls r3, r13, r3
    bn.sflesi r3, -0x1
    bn.bf loc_231558
loc_22fe6a:
    bg.jal 0x2ac120
    bt.mov r4, r3
loc_22fe70:
    bn.lwz r3, 0x4c(r1)
    bg.jal 0x2abe2e
    bt.mov r4, r3
    bt.mov r3, r17
    bg.jal 0x2abe2e
    bg.jal 0x2aad27
    bn.add r10, r11, r3
loc_22fe86:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r3, 0x34(r7)
    bn.ori r7, r0, 0xa8
    bn.lwz r5, 0x4(r1)
    bn.muls r7, r5, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_22fec4
    bn.andi r7, r14, 0x2
    bn.beqi r7, 0x0, loc_22fec4
    bn.lwz r4, 0x50(r1)
    bn.add r7, r3, r4
    bn.sfnei r3, 0x0
    bn.cmov_0 r3, r7, r3
loc_22fec4:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r7, 0x40(r7)
    bg.beq r15, r7, loc_22fee8
    bg.bgt r18, r3, loc_22fee8
    bn.sub r7, r3, r18
    bn.sfnei r22, 0x0
    bn.cmov_0 r3, r7, r3
loc_22fee8:
    bg.beqi r3, 0x0, loc_230d5b
    bn.beqi r16, 0x3, loc_22ff14
    bg.beqi r16, 0x5, loc_22ff14
loc_22fef3:
    bn.sflesi r3, -0x1
    bn.bf loc_231c5c
    bg.jal 0x2ac120
    bt.mov r4, r3
loc_22feff:
    bn.lwz r3, 0x4c(r1)
    bg.jal 0x2abe2e
    bt.mov r4, r3
    bt.mov r3, r17
    bg.jal 0x2abe2e
    bg.jal 0x2aad27
    bt.add r10, r3
loc_22ff14:
    bg.beqi r21, 0x0, loc_230d1c
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_23130b
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x10
    bn.add r3, r12, r4
    bn.srli r4, r10, 0x5
    bg.jal 0x23e50c
    bn.sfeqi r16, 0x3
    bn.bf loc_231322
loc_22ff3d:
    bn.sfeqi r16, 0x4
    bn.bf loc_231bf5
    bn.sfeqi r16, 0x5
    bn.bf loc_231daa
loc_22ff49:
    bt.movi r15, 0x0
    bt.movi r16, 0x0
loc_22ff4d:
    bg.beqi r20, 0x0, loc_230c48
    bg.lwz r5, 0x98(r1)
    bn.extbz r3, r5
    bn.sfeqi r3, 0x1
    bn.bf loc_23172f
    bn.sfeqi r3, 0x3
    bn.bf loc_231bcc
loc_22ff64:
    bt.mov r7, r11
    bt.mov r11, r19
    bt.mov r19, r7
loc_22ff6a:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_2314b5
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x8
    bn.add r3, r12, r6
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23e4f4
loc_22ff8a:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lbz r5, 0x60(r7)
    bn.sfeqi r5, 0x0
    bn.bf loc_2313bb
    bn.lh r7, 0x48(r7)
    bt.add r7, r20
    bg.ori r6, r0, 0x1fff
    bn.and r7, r7, r6
    bg.ori r10, r7, 0x8000
    bg.beqi r21, 0x0, loc_2300ab
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232420
    bg.lwz r5, 0xa8(r1)
    bn.add r4, r11, r5
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bn.srli r4, r4, 0x5
    bg.jal 0x23e50c
loc_22ffdd:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_23283e
    bn.addi r4, r18, 0x3f
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x2c
    bn.add r3, r12, r7
    bg.ori r5, r0, 0xffc0
    bn.and r4, r4, r5
    bg.jal 0x23e58a
loc_230003:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_23282b
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bt.mov r4, r20
    bg.jal 0x23e58a
loc_230021:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232818
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x1c
    bn.add r3, r12, r4
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_23003f:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232804
    bg.movhi r7, 0x5280
    bn.ori r7, r7, 0x20
    bn.add r3, r12, r7
    bn.srli r4, r19, 0x5
    bg.jal 0x23e50c
loc_23005e:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_2327f1
    bg.movhi r6, 0x5280
    bn.ori r6, r6, 0x2c
    bn.add r3, r12, r6
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_23007c:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_2327cd
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x5280
    bn.ori r6, r6, 0x2e
    bn.add r3, r12, r6
    bn.lh r4, 0x48(r7)
    bg.jal 0x23e58a
loc_2300ab:
    bt.mov r3, r14
    bg.jal 0x21d3b1
    bg.addi r3, r3, 0x88
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
loc_2300bb:
    bg.beqi r21, 0x0, loc_2305a2
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_231178
    bn.movhi_2 r6, 0x280
    bn.ori r6, r6, 0x54
    bn.add r3, r12, r6
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23e58a
loc_2300dd:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_2310fd
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x52
    bn.add r3, r12, r5
    bt.mov r4, r10
    bg.jal 0x23e58a
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_23111b
loc_230109:
    bg.lwz r3, 0x84(r1)
    bn.lwz r4, 0x34(r1)
    bg.jal 0x23e58a
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_231134
loc_230122:
    bg.lwz r3, 0x80(r1)
    bn.lwz r4, 0x30(r1)
    bg.jal 0x23e58a
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_23114d
loc_23013b:
    bn.lwz r3, 0x7c(r1)
    bn.lwz r4, 0x2c(r1)
    bg.jal 0x23e58a
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_231165
loc_230153:
    bn.lwz r7, 0x28(r1)
    bn.ori r4, r7, 0x80
    bn.lwz r3, 0x78(r1)
    bn.exthz r4, r4
    bg.jal 0x23e58a
loc_230163:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_2310d9
    bn.lwz r3, 0x78(r1)
    bn.lwz r4, 0x28(r1)
    bg.jal 0x23e58a
loc_230179:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2310ca
    bg.lwz r3, 0x8c(r1)
    bg.lwz r4, 0xac(r1)
    bg.jal 0x23e58a
loc_230191:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_2310bb
    bg.lwz r3, 0x88(r1)
    bg.lwz r4, 0xb4(r1)
    bg.jal 0x23e58a
loc_2301a9:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_2310a8
    bg.movhi r6, 0x4880
    bn.ori r6, r6, 0x54
    bn.add r3, r12, r6
    bt.mov r4, r15
    bg.jal 0x23e58a
loc_2301c5:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_230595
    bn.lwz r3, 0x74(r1)
    bn.lwz r4, 0x24(r1)
    bg.jal 0x23e58a
loc_2301db:
    bn.ori r7, r0, 0xa8
    bn.lwz r5, 0x4(r1)
    bn.muls r7, r5, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r7, 0x34(r7)
    bn.sfeqi r7, 0x0
    bn.lwz r7, 0x44(r1)
    bn.cmov_0 r7, r7, r0
    bn.sw 0x44(r1), r7
    bg.beqi r21, 0x0, loc_230572
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_231091
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xf
    bn.add r3, r12, r5
    bt.mov r4, r7
    bn.ori r5, r0, 0xe0
    bg.jal 0x23e4f4
loc_230220:
    bn.ori r10, r0, 0x7c
    bn.muls r10, r14, r10
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r10, r6
    bn.lwz r12, 0x4(r10)
    bt.mov r3, r14
    bg.jal 0x2227ef
    bt.mov r11, r3
    bt.mov r3, r14
    bg.jal 0x2228e1
    bt.mov r4, r3
    bn.lbz r7, 0x78(r10)
    bg.beqi r7, 0x2, loc_230ec5
    bn.sfeqi r7, 0x1
    bn.bf loc_2312f5
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r6, 0x5c(r7)
loc_230263:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r5, 0x5c(r7)
    bn.lwz r3, 0x60(r7)
    bt.movi r15, 0x2
    bn.blesi r6, -0x1, loc_230284
    bn.srli r7, r6, 0x1e
    bn.andi r15, r7, 0x1
loc_230284:
    bt.movi r13, 0x2
    bn.blesi r5, -0x1, loc_23028f
    bn.srli r7, r5, 0x1e
    bn.andi r13, r7, 0x1
loc_23028f:
    bt.movi r14, 0x2
    bn.blesi r3, -0x1, loc_23029a
    bn.srli r7, r3, 0x1e
    bn.andi r14, r7, 0x1
loc_23029a:
    bg.bnei r4, 0x0, loc_230ded
    bg.beqi r21, 0x0, loc_230dc1
    bg.movhi r7, 0x3180
    bn.ori r7, r7, 0xa
    bn.add r3, r12, r7
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x10
    bg.beqi r3, 0x0, loc_23051c
loc_2302b7:
    bt.movi r17, 0x2
loc_2302b9:
    bg.beq r15, r17, loc_230534
loc_2302bd:
    bg.beqi r21, 0x0, loc_230be5
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231239
    bg.movhi r4, 0x2080
    bn.ori r4, r4, 0x20
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
    bg.beqi r15, 0x2, loc_23124f
loc_2302e3:
    bn.sfeqi r15, 0x1
    bn.bf loc_231b8e
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_231a2d
    bg.movhi r7, 0x3180
    bn.ori r7, r7, 0xa
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_23030a:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_231a05
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0xa
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
loc_230327:
    bg.lwz r22, 0x168(r1)
    bg.lwz r21, 0x16c(r1)
    bg.lwz r20, 0x170(r1)
    bg.lwz r19, 0x174(r1)
    bg.lwz r18, 0x178(r1)
    bg.lwz r17, 0x17c(r1)
    bg.lwz r16, 0x180(r1)
    bg.lwz r15, 0x184(r1)
    bg.lwz r14, 0x188(r1)
    bg.lwz r13, 0x18c(r1)
    bg.lwz r12, 0x190(r1)
    bg.lwz r11, 0x194(r1)
    bg.lwz r10, 0x198(r1)
    bg.lwz r9, 0x19c(r1)
    bg.addi r1, r1, 0x1a0
    bg.j 0x23e4f4
loc_230367:
    bn.beqi r11, 0x0, loc_2303b4
    bn.sfeqi r11, 0x1
    bn.bf loc_232329
    bn.sfeqi r11, 0x3
    bn.bf loc_232887
    bn.sfeqi r11, 0x2
    bn.bf loc_2329f2
    bn.sfeqi r11, 0x4
    bn.bf loc_232492
    bg.bnei r11, 0x5, loc_22f8fb
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x82
    bn.add r10, r12, r7
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r4, 0x480
    bn.ori r4, r4, 0x14
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bn.j loc_232355
loc_2303b4:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x82
    bn.add r10, r12, r4
    bt.mov r3, r10
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bn.ori r4, r0, 0x20
loc_2303cf:
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r5, 0x480
    bn.ori r5, r5, 0x14
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x58
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_22f8fb
loc_2303fe:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x2
    bn.add r10, r12, r6
    bt.mov r3, r10
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bn.ori r4, r0, 0x20
loc_230419:
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x280
    bn.ori r7, r7, 0x14
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r4, 0x2380
    bn.ori r4, r4, 0x18
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_22f8fb
loc_230448:
    bn.lh r10, 0x34(r10)
    bg.bnei r10, 0x0, loc_22f940
loc_23044f:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lbz r10, 0x59(r7)
    bg.bnei r21, 0x0, loc_22f946
loc_230466:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lbz r3, 0x29(r7)
    bg.beqi r3, 0x3, loc_2311fe
    bg.beqi r3, 0x5, loc_2311fe
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_231673
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r10
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x9e
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfff0
    bn.and r4, r4, r6
    bg.jal 0x23e58a
loc_2304bb:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_230fe0
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xb0
    bn.add r3, r11, r5
    bn.lh r7, 0x3a(r7)
    bg.ori r4, r7, 0x8000
    bg.jal 0x23e58a
loc_2304ec:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_230fbc
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bg.movhi r4, 0x2080
    bn.ori r4, r4, 0x2c
    bn.add r3, r11, r4
    bn.lh r4, 0x4a(r7)
    bg.jal 0x23e58a
    bn.j loc_22fa3b
loc_23051c:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0xa
    bn.add r3, r12, r4
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x4
    bn.andi r17, r3, 0x1
    bg.bne r15, r17, loc_2302bd
loc_230534:
    bg.lwz r22, 0x168(r1)
    bg.lwz r21, 0x16c(r1)
    bg.lwz r20, 0x170(r1)
    bg.lwz r19, 0x174(r1)
    bg.lwz r18, 0x178(r1)
    bg.lwz r17, 0x17c(r1)
    bg.lwz r16, 0x180(r1)
    bg.lwz r15, 0x184(r1)
    bg.lwz r14, 0x188(r1)
    bg.lwz r13, 0x18c(r1)
    bg.lwz r12, 0x190(r1)
    bg.lwz r11, 0x194(r1)
    bg.lwz r10, 0x198(r1)
    bg.lwz r9, 0x19c(r1)
    bg.addi r1, r1, 0x1a0
    bt.jr r9
loc_230572:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2310e6
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x8f
    bn.add r3, r12, r4
    bn.lwz r4, 0x44(r1)
    bn.ori r5, r0, 0xe0
    bg.jal 0x23e4f4
    bn.j loc_230220
loc_230595:
    bn.lwz r3, 0x74(r1)
    bn.lwz r4, 0x24(r1)
    bg.jal 0x23dfb6
    bn.j loc_2301db
loc_2305a2:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_23107e
    bn.movhi_2 r5, 0x480
    bn.ori r5, r5, 0x54
    bn.add r3, r12, r5
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23e58a
loc_2305be:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231071
    bn.lwz r3, 0x70(r1)
    bn.lwz r4, 0x20(r1)
    bg.jal 0x23e58a
loc_2305d4:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_231064
    bn.lwz r3, 0x6c(r1)
    bn.lwz r4, 0x1c(r1)
    bg.jal 0x23e58a
loc_2305ea:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_231057
    bn.lwz r3, 0x68(r1)
    bn.lwz r4, 0x18(r1)
    bg.jal 0x23e58a
loc_230600:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_231044
    bn.lwz r7, 0x14(r1)
    bn.ori r4, r7, 0x80
    bn.lwz r3, 0x64(r1)
    bn.exthz r4, r4
    bg.jal 0x23e58a
loc_23061c:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_231037
    bn.lwz r3, 0x64(r1)
    bn.lwz r4, 0x14(r1)
    bg.jal 0x23e58a
loc_230632:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231029
    bg.lwz r3, 0x94(r1)
    bn.lwz r4, 0x40(r1)
    bg.jal 0x23e58a
loc_230649:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_23101b
    bg.lwz r3, 0x90(r1)
    bn.lwz r4, 0x3c(r1)
    bg.jal 0x23e58a
loc_230660:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_231008
    bg.movhi r6, 0x4880
    bn.ori r6, r6, 0xd4
    bn.add r3, r12, r6
    bt.mov r4, r16
    bg.jal 0x23e58a
    bn.j loc_2301c5
loc_23067f:
    bt.mov r3, r14
    bt.movi r4, 0x0
    bg.jal 0x22d986
    bn.sw 0x10(r1), r0
    bg.bnei r22, 0x2, loc_22fdc0
loc_23068e:
    bn.ori r7, r0, 0xa8
    bn.lwz r4, 0x4(r1)
    bn.muls r7, r4, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r7, 0x64(r7)
    bg.movhi r6, 0xbfff
    bg.ori r6, r6, 0xffff
    bn.and r4, r7, r6
    bn.movhi_2 r19, 0x190
    bn.addi r7, r16, -0x1
    bn.extbz r7, r7
    bg.bgtui r7, 0x1, loc_22fdfc
loc_2306bc:
    bn.lwz r5, 0x48(r1)
    bn.ff1 r7, r5
    bn.sub r7, r0, r7
    bn.srli r11, r7, 0x1f
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r10, 0x40(r7)
    bg.addi r3, r1, 0x110
    bg.movhi r4, 0x2b
    bg.addi r4, r4, -0x970
    bn.ori r5, r0, 0x58
    bg.jal 0x2aab1e
    bg.addi r3, r1, 0xb8
    bg.movhi r4, 0x2b
    bg.addi r4, r4, -0x9c8
    bn.ori r5, r0, 0x58
    bg.jal 0x2aab1e
    bt.movi r6, 0x0
    bg.sfgti r10, 0x438
    bn.bnf loc_230759
    bt.movi r6, 0x1
    bg.sfgti r10, 0x5a0
    bn.bnf loc_230759
    bt.movi r6, 0x2
    bg.sfgti r10, 0x780
    bn.bnf loc_230759
    bt.movi r6, 0x3
    bg.sfgti r10, 0x870
    bn.bnf loc_230759
    bt.movi r6, 0x4
    bg.sfgti r10, 0xa00
    bn.bnf loc_230759
    bt.movi r6, 0x5
    bg.sfgti r10, 0xb40
    bn.bnf loc_230759
    bt.movi r6, 0x6
    bg.sfgti r10, 0xf00
    bn.bnf loc_230759
    bt.movi r6, 0x7
    bg.sfgti r10, 0x1000
    bn.bnf loc_230759
    bt.movi r6, 0x8
    bg.sfgti r10, 0x10e0
    bn.bnf loc_230759
    bg.sfgti r10, 0x1400
    bn.cmovi r6, 0xa, 0x9
loc_230759:
    bg.lwz r7, 0x9c(r1)
    bn.sfeqi r7, 0x4
    bn.bf loc_231d08
    bn.ori r7, r0, 0x16
    bn.muls r7, r11, r7
    bt.add r7, r6
    bn.slli r7, r7, 0x1
    bg.addi r6, r1, 0x168
    bt.add r7, r6
    bg.lhz r7, -0x9a(r7)
    bg.sw_0 0xa4(r1), r7
    bn.srli r7, r13, 0x3
    bn.slli r17, r7, 0x4
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r7, 0x38(r7)
    bn.addi r6, r7, 0x3f
    bg.ori r5, r0, 0xffc0
    bn.and r5, r6, r5
    bn.sw 0x60(r1), r5
    bn.srli r6, r7, 0x6
    bn.andi r7, r7, 0x3f
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bt.add r6, r7
    bn.exthz r6, r6
    bn.sw 0x5c(r1), r6
loc_2307b6:
    bn.sfeqi r16, 0x1
    bn.bf loc_231c74
    bn.sfeqi r16, 0x2
    bn.bf loc_232933
    bt.movi r15, 0x0
    bn.sw 0xc(r1), r0
    bn.sw 0x8(r1), r0
    bg.sw_0 0xa0(r1), r0
loc_2307ce:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lbz r5, 0x60(r7)
    bn.beqi r5, 0x0, loc_230810
    bg.lwz r6, 0x9c(r1)
    bn.sfeqi r6, 0x4
    bn.bf loc_232b1d
    bn.lh r7, 0x44(r7)
    bn.lwz r6, 0x54(r1)
    bn.sub r7, r7, r6
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1d
    bt.add r7, r6
    bn.andi r7, r7, 0x7
    bn.sub r7, r7, r6
    bn.lwz r4, 0x8(r1)
    bt.add r7, r4
    bn.exthz r7, r7
    bn.sw 0x8(r1), r7
loc_230810:
    bg.beqi r11, 0x0, loc_23176d
    bn.ori r5, r0, 0xa8
    bn.lwz r6, 0x4(r1)
    bn.muls r5, r6, r5
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r5, r7
    bn.lwz r4, 0x5c(r5)
    bn.lwz r23, 0x60(r5)
    bg.movhi r6, 0xc000
    bn.and r7, r23, r6
    bn.srli r7, r7, 0x1c
    bn.srli r6, r4, 0x1e
    bn.or r10, r7, r6
    bg.movhi r7, 0xbfff
    bg.ori r7, r7, 0xffff
    bn.and r11, r4, r7
    bn.and r13, r23, r7
    bn.movhi_2 r6, 0x190
    bt.add r11, r6
    bt.add r13, r6
    bn.lwz r7, 0x68(r5)
    bg.movhi r4, 0xfe70
    bt.add r7, r4
    bt.movi r6, 0x3
    bn.divu r7, r7, r6
    bg.addi r4, r0, -0x200
    bn.and r16, r7, r4
    bn.lwz r7, 0x6c(r5)
    bg.movhi r5, 0xfe70
    bt.add r7, r5
    bn.divu r7, r7, r6
    bn.and r18, r7, r4
    bn.lwz r6, 0xc(r1)
    bt.add r6, r17
    bn.sw 0xc(r1), r6
    bn.sfeqi r21, 0x0
    bn.bf loc_231dfa
    bg.lwz r4, 0xac(r1)
    bg.ori r7, r4, 0x4000
    bn.exthz r22, r7
    bg.lwz r5, 0xb4(r1)
    bn.or r7, r5, r10
    bn.exthz r7, r7
    bn.sw 0x38(r1), r7
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_2324e2
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xc9
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e5d1
loc_2308ba:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_232d6e
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x4f
    bn.add r3, r12, r6
    bt.mov r4, r10
    bg.jal 0x23e5d1
loc_2308d8:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_232d57
    bn.srli r20, r11, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x98
    bn.add r3, r12, r5
    bn.add r4, r15, r20
    bg.jal 0x23e50c
loc_2308fa:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232d3d
    bn.add r7, r11, r16
    bn.srli r19, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x9c
    bn.add r3, r12, r4
    bn.add r4, r15, r19
    bg.jal 0x23e50c
loc_23091f:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232d21
    bn.slli r7, r16, 0x1
    bt.add r7, r11
    bn.srli r17, r7, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xa0
    bn.add r3, r12, r7
    bn.add r4, r15, r17
    bg.jal 0x23e50c
loc_230946:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_233059
    bn.srli r16, r13, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xa4
    bn.add r3, r12, r6
    bn.add r4, r15, r16
    bg.jal 0x23e50c
loc_230968:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_23303f
    bn.add r7, r13, r18
    bn.srli r11, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xa8
    bn.add r3, r12, r5
    bn.add r4, r15, r11
    bg.jal 0x23e50c
loc_23098d:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_233023
    bn.slli r7, r18, 0x1
    bt.add r7, r13
    bn.srli r10, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xac
    bn.add r3, r12, r4
    bn.add r4, r15, r10
    bg.jal 0x23e50c
loc_2309b4:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_233010
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xb0
    bn.add r3, r12, r7
    bt.mov r4, r20
    bg.jal 0x23e50c
loc_2309d2:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_232ffd
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xb4
    bn.add r3, r12, r6
    bt.mov r4, r19
    bg.jal 0x23e50c
loc_2309f0:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_232fea
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xb8
    bn.add r3, r12, r5
    bt.mov r4, r17
    bg.jal 0x23e50c
loc_230a0e:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232fd7
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xbc
    bn.add r3, r12, r4
    bt.mov r4, r16
    bg.jal 0x23e50c
loc_230a2c:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232fc4
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xc0
    bn.add r3, r12, r7
    bt.mov r4, r11
    bg.jal 0x23e50c
loc_230a4a:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_232d9c
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xc4
    bn.add r3, r12, r6
    bt.mov r4, r10
    bg.jal 0x23e50c
loc_230a68:
    bn.lwz r7, 0x5c(r1)
    bn.andi r6, r7, 0xff
    bg.addi r4, r0, -0x100
    bn.and r7, r22, r4
    bn.or r6, r6, r7
    bg.sw_0 0xac(r1), r6
    bn.lwz r5, 0x38(r1)
    bg.ori r5, r5, 0x860
    bg.sw_0 0xb4(r1), r5
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232718
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x8e
    bn.add r3, r12, r7
    bn.lwz r4, 0x60(r1)
    bg.jal 0x23e58a
loc_230aa6:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_2326f4
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x90
    bn.add r3, r12, r4
    bn.lh r4, 0x3a(r7)
    bg.jal 0x23e58a
loc_230ad5:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_2326df
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x96
    bn.add r3, r12, r4
    bg.lwz r4, 0xa4(r1)
    bg.jal 0x23e58a
loc_230af5:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_2326c3
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xce
    bn.add r3, r12, r7
    bg.lwz r5, 0xa0(r1)
    bn.slli r4, r5, 0x5
    bg.ori r5, r0, 0x3e0
    bg.jal 0x23e4a6
loc_230b1c:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_2326af
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xd4
    bn.add r3, r12, r5
    bn.lwz r4, 0xc(r1)
    bg.jal 0x23e50c
    bn.j loc_232073
loc_230b3e:
    bg.ori r6, r0, 0xfff7
    bn.and r6, r17, r6
    bn.sw 0x24(r1), r6
    bn.lwz r7, 0x20(r1)
    bg.ori r4, r0, 0x7fff
    bn.and r7, r7, r4
    bn.sw 0x20(r1), r7
    bn.lwz r5, 0x18(r1)
    bg.ori r6, r0, 0xcfdf
    bn.and r5, r5, r6
    bn.sw 0x18(r1), r5
    bn.lwz r7, 0x40(r1)
    bn.andi r7, r7, 0xff
    bn.sw 0x40(r1), r7
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_230f66
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xb2
    bn.add r3, r12, r5
    bn.lwz r4, 0x58(r1)
    bn.ori r5, r0, 0x1f
    bg.jal 0x23e4f4
loc_230b8b:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_230f4c
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x49
    bn.add r3, r12, r4
    bn.ori r4, r0, 0x14
    bg.jal 0x23e5d1
    bn.sw 0x3c(r1), r0
    bn.sw 0x1c(r1), r0
    bg.lwz r7, 0x9c(r1)
    bt.addi r7, -0x4
    bn.extbz r7, r7
    bg.bgtui r7, 0x1, loc_22fd41
loc_230bbb:
    bg.beqi r21, 0x0, loc_23175a
    bg.lwz r6, 0x9c(r1)
    bn.sfeqi r6, 0x5
    bn.bf loc_232b0d
    bn.lwz r5, 0x34(r1)
    bg.addi r6, r0, -0x8000
    bn.or r7, r5, r6
    bn.exthz r7, r7
    bn.sw 0x34(r1), r7
    bn.j loc_22fd41
loc_230bdc:
    bt.mov r3, r13
    bg.jal 0x23dfb6
    bn.j loc_22fc88
loc_230be5:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_23128d
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23e4f4
    bg.beqi r15, 0x2, loc_2312a3
loc_230c07:
    bg.beqi r15, 0x1, loc_231b50
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231a17
    bg.movhi r4, 0x3180
    bn.ori r4, r4, 0x89
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23e4f4
loc_230c2a:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_231582
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x89
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bn.j loc_230327
loc_230c48:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r4, 0x54(r1)
    bn.lh r7, 0x48(r7)
    bt.add r4, r7
    bt.mov r7, r4
    bt.addi r7, 0xf
    bn.lwz r5, 0x50(r1)
    bt.add r7, r5
    bg.ori r6, r0, 0xfff0
    bn.and r10, r7, r6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2314f5
    bg.movhi r4, 0x2080
    bn.ori r4, r4, 0x8
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23e4f4
loc_230c8e:
    bg.beqi r21, 0x0, loc_231338
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_231afd
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x1c
    bn.add r3, r12, r7
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_230cae:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_231ae2
    bg.lwz r6, 0xa8(r1)
    bn.add r4, r11, r6
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x20
    bn.add r3, r12, r7
    bn.srli r4, r4, 0x5
    bg.jal 0x23e50c
loc_230cd2:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231acf
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x2c
    bn.add r3, r12, r4
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_230cee:
    bn.sfgtui r10, 0xf
    bn.ori r7, r0, 0x10
    bn.cmov_0 r10, r10, r7
    bg.ble r13, r10, loc_231a92
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfnei r6, 0x0
    bn.bf loc_23240d
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x2e
    bn.add r3, r12, r4
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bn.j loc_231aae
loc_230d1c:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_2314ca
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x90
    bn.add r3, r12, r7
    bn.srli r4, r10, 0x5
    bg.jal 0x23e50c
    bg.beqi r16, 0x3, loc_2314df
loc_230d3d:
    bg.beqi r16, 0x4, loc_231be1
    bg.bnei r16, 0x5, loc_22ff49
    bn.lwz r4, 0x18(r1)
    bg.ori r7, r4, 0x3000
    bn.exthz r7, r7
    bn.sw 0x18(r1), r7
    bt.movi r15, 0x0
    bg.ori r16, r0, 0x8000
    bn.j loc_22ff4d
loc_230d5b:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r3, 0x38(r7)
    bn.beqi r16, 0x3, loc_230d75
    bg.bnei r16, 0x5, loc_22ff14
loc_230d75:
    bn.sub r3, r15, r3
    bg.beqi r3, 0x0, loc_22ff14
    bn.j loc_22fef3
loc_230d7f:
    bn.addi r7, r14, 0x1
    bn.slli r7, r7, 0x2
    bn.andi r7, r7, 0xfc
    bn.sll r4, r4, r7
    bt.movi r5, 0x7
    bn.sll r5, r5, r7
    bt.movhi r3, -0xd
    bg.ori r3, r3, 0x1912
    bn.exthz r4, r4
    bn.exthz r5, r5
    bg.jal 0x23e152
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_23150a
    bg.movhi r7, 0x3180
    bn.ori r7, r7, 0x8e
    bn.add r3, r12, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
    bn.j loc_22fc3e
loc_230dc1:
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x89
    bn.add r3, r12, r5
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x40
    bg.bnei r3, 0x0, loc_2302b7
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x89
    bn.add r3, r12, r6
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x6
    bn.andi r17, r3, 0x1
    bn.j loc_2302b9
loc_230ded:
    bg.movhi r6, 0x3180
    bn.ori r6, r6, 0xa
    bn.add r3, r12, r6
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x10
    bt.movi r17, 0x2
    bg.beqi r3, 0x0, loc_231b32
loc_230e04:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0xe0
    bn.add r11, r12, r4
    bt.mov r3, r11
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x8
    bt.movi r16, 0x2
    bg.beqi r3, 0x0, loc_231b23
loc_230e1d:
    bg.movhi r5, 0x5180
    bn.ori r5, r5, 0xa
    bn.add r10, r12, r5
    bt.mov r3, r10
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x10
    bt.movi r7, 0x2
    bn.beqi r3, 0x0, loc_230eaf
loc_230e35:
    bg.beq r13, r16, loc_231b49
loc_230e39:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231600
    bg.movhi r4, 0x2080
    bn.ori r4, r4, 0x20
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
loc_230e57:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_2315f2
    bt.mov r3, r11
    bn.slli r4, r13, 0x2
    bt.movi r5, 0xc
    bg.jal 0x23e4f4
loc_230e6e:
    bg.beqi r14, 0x2, loc_231c09
    bg.beqi r14, 0x1, loc_231dc0
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231c4e
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_230e8d:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_231744
    bg.movhi r5, 0x5280
    bn.ori r5, r5, 0xa
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
    bn.j loc_2302b9
loc_230eaf:
    bg.movhi r6, 0x5280
    bn.ori r6, r6, 0xa
    bn.add r3, r12, r6
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x4
    bn.andi r7, r3, 0x1
    bt.j loc_230e35
loc_230ec5:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r6, 0x64(r7)
    bn.j loc_230263
loc_230edb:
    bg.beqi r21, 0x0, loc_2315d1
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_231c24
    bg.movhi r6, 0x3180
    bn.ori r6, r6, 0xe
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
    bn.j loc_22fc3e
loc_230f00:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x2a
    bn.add r3, r11, r6
    bn.lh r4, 0x4a(r7)
    bg.jal 0x23dfb6
    bn.j loc_22fa3b
loc_230f24:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x30
    bn.add r3, r11, r4
    bn.lh r7, 0x3a(r7)
    bg.ori r4, r7, 0x8000
    bg.jal 0x23dfb6
    bn.j loc_22fa0c
loc_230f4c:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x49
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x14
    bg.jal 0x23ddb9
    bn.sw 0x3c(r1), r0
    bn.sw 0x1c(r1), r0
    bn.j loc_22fd34
loc_230f66:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0xb2
    bn.add r3, r12, r6
    bn.lwz r4, 0x58(r1)
    bn.ori r5, r0, 0x1f
    bg.jal 0x23dfe1
    bn.j loc_230b8b
loc_230f7d:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xc9
    bn.add r3, r12, r6
    bn.ori r4, r0, 0x14
    bg.jal 0x23ddb9
    bn.j loc_22fcec
loc_230f91:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x4f
    bn.add r3, r12, r7
    bn.ori r4, r0, 0x14
    bg.jal 0x23ddb9
    bn.j loc_22fccd
loc_230fa5:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x32
    bn.add r3, r12, r4
    bn.lwz r4, 0x58(r1)
    bn.ori r5, r0, 0x1f
    bg.jal 0x23dfe1
    bn.j loc_22fcae
loc_230fbc:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x2c
    bn.add r3, r11, r6
    bn.lh r4, 0x4a(r7)
    bg.jal 0x23dfb6
    bn.j loc_22fa3b
loc_230fe0:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0xb0
    bn.add r3, r11, r4
    bn.lh r7, 0x3a(r7)
    bg.ori r4, r7, 0x8000
    bg.jal 0x23dfb6
    bn.j loc_2304ec
loc_231008:
    bg.movhi r7, 0x4880
    bn.ori r7, r7, 0xd4
    bn.add r3, r12, r7
    bt.mov r4, r16
    bg.jal 0x23dfb6
    bn.j loc_2301c5
loc_23101b:
    bg.lwz r3, 0x90(r1)
    bn.lwz r4, 0x3c(r1)
    bg.jal 0x23dfb6
    bn.j loc_230660
loc_231029:
    bg.lwz r3, 0x94(r1)
    bn.lwz r4, 0x40(r1)
    bg.jal 0x23dfb6
    bn.j loc_230649
loc_231037:
    bn.lwz r3, 0x64(r1)
    bn.lwz r4, 0x14(r1)
    bg.jal 0x23dfb6
    bn.j loc_230632
loc_231044:
    bn.lwz r5, 0x14(r1)
    bn.ori r4, r5, 0x80
    bn.lwz r3, 0x64(r1)
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bn.j loc_23061c
loc_231057:
    bn.lwz r3, 0x68(r1)
    bn.lwz r4, 0x18(r1)
    bg.jal 0x23dfb6
    bn.j loc_230600
loc_231064:
    bn.lwz r3, 0x6c(r1)
    bn.lwz r4, 0x1c(r1)
    bg.jal 0x23dfb6
    bn.j loc_2305ea
loc_231071:
    bn.lwz r3, 0x70(r1)
    bn.lwz r4, 0x20(r1)
    bg.jal 0x23dfb6
    bn.j loc_2305d4
loc_23107e:
    bn.movhi_2 r6, 0x480
    bn.ori r6, r6, 0x54
    bn.add r3, r12, r6
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23dfb6
    bn.j loc_2305be
loc_231091:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0xf
    bn.add r3, r12, r6
    bn.lwz r4, 0x44(r1)
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bn.j loc_230220
loc_2310a8:
    bg.movhi r7, 0x4880
    bn.ori r7, r7, 0x54
    bn.add r3, r12, r7
    bt.mov r4, r15
    bg.jal 0x23dfb6
    bn.j loc_2301c5
loc_2310bb:
    bg.lwz r3, 0x88(r1)
    bg.lwz r4, 0xb4(r1)
    bg.jal 0x23dfb6
    bn.j loc_2301a9
loc_2310ca:
    bg.lwz r3, 0x8c(r1)
    bg.lwz r4, 0xac(r1)
    bg.jal 0x23dfb6
    bn.j loc_230191
loc_2310d9:
    bn.lwz r3, 0x78(r1)
    bn.lwz r4, 0x28(r1)
    bg.jal 0x23dfb6
    bn.j loc_230179
loc_2310e6:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x8f
    bn.add r3, r12, r5
    bn.lwz r4, 0x44(r1)
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bn.j loc_230220
loc_2310fd:
    bg.movhi r6, 0x3180
    bn.ori r6, r6, 0x52
    bn.add r3, r12, r6
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfnei r7, 0x0
    bn.bf loc_230109
loc_23111b:
    bg.lwz r3, 0x84(r1)
    bn.lwz r4, 0x34(r1)
    bg.jal 0x23dfb6
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfnei r4, 0x0
    bn.bf loc_230122
loc_231134:
    bg.lwz r3, 0x80(r1)
    bn.lwz r4, 0x30(r1)
    bg.jal 0x23dfb6
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfnei r5, 0x0
    bn.bf loc_23013b
loc_23114d:
    bn.lwz r3, 0x7c(r1)
    bn.lwz r4, 0x2c(r1)
    bg.jal 0x23dfb6
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfnei r6, 0x0
    bn.bf loc_230153
loc_231165:
    bn.lwz r5, 0x28(r1)
    bn.ori r4, r5, 0x80
    bn.lwz r3, 0x78(r1)
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bn.j loc_230163
loc_231178:
    bn.movhi_2 r7, 0x280
    bn.ori r7, r7, 0x54
    bn.add r3, r12, r7
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23dfb6
    bn.j loc_2300dd
loc_23118b:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2316d1
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r10
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x1e
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfffc
    bn.and r4, r4, r6
    bg.jal 0x23e58a
loc_2311c3:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2316a2
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r10
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x50
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfffc
    bn.and r4, r4, r6
    bg.jal 0x23e58a
    bn.j loc_22f9d9
loc_2311fe:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_231700
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r10
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x9e
    bn.add r3, r11, r7
    bg.ori r5, r0, 0xfffc
    bn.and r4, r4, r5
    bg.jal 0x23e58a
    bn.j loc_2304bb
loc_231239:
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.bnei r15, 0x2, loc_2302e3
loc_23124f:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_231d93
    bg.movhi r7, 0x3180
    bn.ori r7, r7, 0xa
    bn.add r3, r12, r7
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_23126f:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_231d81
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0xa
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bn.j loc_230327
loc_23128d:
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bg.bnei r15, 0x2, loc_230c07
loc_2312a3:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231d6a
    bg.movhi r4, 0x3180
    bn.ori r4, r4, 0x89
    bn.add r3, r12, r4
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23e4f4
    bn.j loc_230c2a
loc_2312c6:
    bn.ori r7, r0, 0xa8
    bn.lwz r4, 0x4(r1)
    bn.muls r7, r4, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lwz r6, 0x60(r7)
    bg.movhi r5, 0xbfff
    bg.ori r5, r5, 0xffff
    bn.and r4, r6, r5
    bn.lwz r7, 0x5c(r7)
    bn.and r19, r7, r5
    bn.movhi_2 r7, 0x190
    bt.add r19, r7
    bn.j loc_22fdf2
loc_2312f5:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lwz r6, 0x60(r7)
    bn.j loc_230263
loc_23130b:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x10
    bn.add r3, r12, r5
    bn.srli r4, r10, 0x5
    bg.jal 0x23e2b8
    bn.sfnei r16, 0x3
    bn.bf loc_22ff3d
loc_231322:
    bn.lwz r6, 0x2c(r1)
    bg.ori r7, r6, 0x1000
    bn.exthz r7, r7
    bn.sw 0x2c(r1), r7
    bg.ori r15, r0, 0x8000
    bt.movi r16, 0x0
    bn.j loc_22ff4d
loc_231338:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_231a7f
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x9c
    bn.add r3, r12, r4
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_231354:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_231a64
    bg.lwz r7, 0xa8(r1)
    bn.add r4, r11, r7
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xa0
    bn.add r3, r12, r5
    bn.srli r4, r4, 0x5
    bg.jal 0x23e50c
loc_231378:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_231b10
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xac
    bn.add r3, r12, r5
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_231394:
    bg.ble r13, r10, loc_231a43
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfnei r7, 0x0
    bn.bf loc_2323f8
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xae
    bn.add r3, r12, r5
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bt.movi r10, 0x0
    bn.j loc_2300ab
loc_2313bb:
    bn.add r7, r20, r13
    bg.ori r6, r0, 0x1fff
    bn.and r7, r7, r6
    bg.ori r10, r7, 0x8000
    bn.sfeqi r21, 0x0
    bn.bf loc_2300ab
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_2323e5
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x1c
    bn.add r3, r12, r4
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_2313ed:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_2327b2
    bg.lwz r7, 0xa8(r1)
    bn.add r4, r19, r7
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bn.srli r4, r4, 0x5
    bg.jal 0x23e50c
loc_231413:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_23279f
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2c
    bn.add r3, r12, r5
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_231431:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_23278c
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x2e
    bn.add r3, r12, r4
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_23144f:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232778
    bg.movhi r7, 0x5280
    bn.ori r7, r7, 0x20
    bn.add r3, r12, r7
    bn.srli r4, r11, 0x5
    bg.jal 0x23e50c
loc_23146e:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_23286c
    bn.addi r4, r18, 0x3f
    bg.movhi r6, 0x5280
    bn.ori r6, r6, 0x2c
    bn.add r3, r12, r6
    bg.ori r7, r0, 0xffc0
    bn.and r4, r4, r7
    bg.jal 0x23e58a
loc_231494:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232859
    bg.movhi r4, 0x5280
    bn.ori r4, r4, 0x2e
    bn.add r3, r12, r4
    bt.mov r4, r20
    bg.jal 0x23e58a
    bn.j loc_2300ab
loc_2314b5:
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x8
    bn.add r3, r12, r7
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bn.j loc_22ff8a
loc_2314ca:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x90
    bn.add r3, r12, r4
    bn.srli r4, r10, 0x5
    bg.jal 0x23e2b8
    bg.bnei r16, 0x3, loc_230d3d
loc_2314df:
    bn.lwz r5, 0x18(r1)
    bg.ori r7, r5, 0x1000
    bn.exthz r7, r7
    bn.sw 0x18(r1), r7
    bt.movi r15, 0x0
    bg.ori r16, r0, 0x8000
    bn.j loc_22ff4d
loc_2314f5:
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x8
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bn.j loc_230c8e
loc_23150a:
    bg.movhi r4, 0x3180
    bn.ori r4, r4, 0x8e
    bn.add r3, r12, r4
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.j loc_22fc3e
loc_23151f:
    bg.movhi r6, 0x3180
    bn.ori r6, r6, 0xe
    bn.add r3, r12, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.j loc_22fc3e
loc_231534:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r6, 0x42(r7)
    bn.lh r7, 0x36(r7)
    bn.sub r6, r6, r7
    bt.addi r6, -0x1
    bn.muls r3, r13, r6
    bn.sfgtsi r3, -0x1
    bn.bf loc_22fe6a
loc_231558:
    bn.srli r3, r3, 0x1
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22fe70
loc_23156a:
    bn.andi r7, r13, 0x1
    bn.srli r3, r13, 0x1
    bn.or r3, r7, r3
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22fe19
loc_231582:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x89
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
loc_231591:
    bg.lwz r22, 0x168(r1)
    bg.lwz r21, 0x16c(r1)
    bg.lwz r20, 0x170(r1)
    bg.lwz r19, 0x174(r1)
    bg.lwz r18, 0x178(r1)
    bg.lwz r17, 0x17c(r1)
    bg.lwz r16, 0x180(r1)
    bg.lwz r15, 0x184(r1)
    bg.lwz r14, 0x188(r1)
    bg.lwz r13, 0x18c(r1)
    bg.lwz r12, 0x190(r1)
    bg.lwz r11, 0x194(r1)
    bg.lwz r10, 0x198(r1)
    bg.lwz r9, 0x19c(r1)
    bg.addi r1, r1, 0x1a0
    bg.j 0x23dfe1
loc_2315d1:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_231c39
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x8e
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
    bn.j loc_22fc3e
loc_2315f2:
    bt.mov r3, r11
    bn.slli r4, r13, 0x2
    bt.movi r5, 0xc
    bg.jal 0x23dfe1
    bn.j loc_230e6e
loc_231600:
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.j loc_230e57
loc_231615:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r10
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x50
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfff0
    bn.and r4, r4, r6
    bg.jal 0x23dfb6
    bn.j loc_22f9d9
loc_231644:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r10
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x1e
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfff0
    bn.and r4, r4, r6
    bg.jal 0x23dfb6
    bn.j loc_22f99f
loc_231673:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0xf
    bt.add r4, r10
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x9e
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfff0
    bn.and r4, r4, r6
    bg.jal 0x23dfb6
    bn.j loc_2304bb
loc_2316a2:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r10
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x50
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfffc
    bn.and r4, r4, r6
    bg.jal 0x23dfb6
    bn.j loc_22f9d9
loc_2316d1:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r10
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x1e
    bn.add r3, r11, r5
    bg.ori r6, r0, 0xfffc
    bn.and r4, r4, r6
    bg.jal 0x23dfb6
    bn.j loc_2311c3
loc_231700:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r4, 0x38(r7)
    bt.addi r4, 0x3
    bt.add r4, r10
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x9e
    bn.add r3, r11, r7
    bg.ori r5, r0, 0xfffc
    bn.and r4, r4, r5
    bg.jal 0x23dfb6
    bn.j loc_2304bb
loc_23172f:
    bg.movhi r6, 0x48
    bg.addi r7, r6, -0x564
    bg.lbz r7, 0xf4(r7)
    bn.sfnei r7, 0x0
    bn.bf loc_22ff6a
    bn.j loc_22ff64
loc_231744:
    bg.movhi r6, 0x5280
    bn.ori r6, r6, 0xa
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_2302b9
loc_23175a:
    bn.lwz r4, 0x20(r1)
    bg.addi r5, r0, -0x8000
    bn.or r7, r4, r5
    bn.exthz r7, r7
    bn.sw 0x20(r1), r7
    bn.j loc_22fd41
loc_23176d:
    bn.ff1 r7, r22
    bn.sub r7, r0, r7
    bn.srli r7, r7, 0x1f
    bn.ori r6, r0, 0x2a
    bn.lwz r5, 0x4(r1)
    bn.muls r6, r5, r6
    bt.add r6, r7
    bn.slli r6, r6, 0x2
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lwz r13, 0x5c(r6)
    bn.movhi_2 r4, 0x190
    bt.add r13, r4
    bn.lwz r7, 0x68(r6)
    bg.movhi r5, 0xfe70
    bt.add r7, r5
    bn.lwz r6, 0x58(r1)
    bn.divu r7, r7, r6
    bg.addi r4, r0, -0x200
    bn.and r16, r7, r4
    bn.srli r11, r13, 0x1e
    bg.beqi r21, 0x0, loc_23215f
    bg.lwz r5, 0xac(r1)
    bg.ori r6, r0, 0xbfff
    bn.and r22, r5, r6
    bg.lwz r4, 0xb4(r1)
    bn.or r7, r4, r11
    bn.exthz r7, r7
    bn.sw 0x38(r1), r7
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_2324f5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xc9
    bn.add r3, r12, r6
    bt.mov r4, r11
    bg.jal 0x23e5d1
loc_2317e7:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lbz r7, -0x4(r7)
    bn.sfeqi r7, 0x0
    bn.ori r10, r0, 0x58
    bn.ori r7, r0, 0x5c
    bn.cmov_0 r10, r10, r7
    bn.addi r3, r14, -0x1
    bn.extbz r3, r3
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bt.add r3, r10
    bn.lwz r7, 0x4(r3)
    bg.movhi r6, 0xc000
    bn.and r7, r7, r6
    bn.srli r7, r7, 0x1c
    bn.or r4, r11, r7
    bn.sfnei r4, 0x0
    bn.bf loc_232d00
    bt.movi r4, 0x4
loc_23183a:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232cef
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x4f
    bn.add r3, r12, r5
    bg.jal 0x23e5d1
loc_231856:
    bg.movhi r7, 0xbfff
    bg.ori r7, r7, 0xffff
    bn.and r10, r13, r7
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_232cd8
    bn.srli r20, r10, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x98
    bn.add r3, r12, r5
    bn.add r4, r15, r20
    bg.jal 0x23e50c
loc_231883:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232cbe
    bn.add r7, r16, r10
    bn.srli r19, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x9c
    bn.add r3, r12, r4
    bn.add r4, r15, r19
    bg.jal 0x23e50c
loc_2318a8:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232ca2
    bn.slli r7, r16, 0x1
    bt.add r7, r10
    bn.srli r18, r7, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xa0
    bn.add r3, r12, r7
    bn.add r4, r15, r18
    bg.jal 0x23e50c
loc_2318cf:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_232c84
    bt.movi r7, 0x3
    bn.muls r7, r16, r7
    bt.add r7, r10
    bn.srli r13, r7, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xa4
    bn.add r3, r12, r6
    bn.add r4, r15, r13
    bg.jal 0x23e50c
loc_2318f8:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_232c68
    bn.slli r7, r16, 0x2
    bt.add r7, r10
    bn.srli r11, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xa8
    bn.add r3, r12, r5
    bn.add r4, r15, r11
    bg.jal 0x23e50c
loc_23191f:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232c4a
    bt.movi r7, 0x5
    bn.muls r7, r16, r7
    bt.add r7, r10
    bn.srli r10, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xac
    bn.add r3, r12, r4
    bn.add r4, r15, r10
    bg.jal 0x23e50c
loc_231948:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232c36
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xb0
    bn.add r3, r12, r7
    bn.add r4, r17, r20
    bg.jal 0x23e50c
loc_231967:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_232c22
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xb4
    bn.add r3, r12, r6
    bn.add r4, r17, r19
    bg.jal 0x23e50c
loc_231986:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_232c0e
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xb8
    bn.add r3, r12, r5
    bn.add r4, r17, r18
    bg.jal 0x23e50c
loc_2319a5:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232bfa
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xbc
    bn.add r3, r12, r4
    bn.add r4, r17, r13
    bg.jal 0x23e50c
loc_2319c4:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232be6
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xc0
    bn.add r3, r12, r7
    bn.add r4, r17, r11
    bg.jal 0x23e50c
loc_2319e3:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_232bd2
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xc4
    bn.add r3, r12, r6
    bn.add r4, r17, r10
    bg.jal 0x23e50c
    bn.j loc_230a68
loc_231a05:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xa
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bn.j loc_231591
loc_231a17:
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x89
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bn.j loc_230c2a
loc_231a2d:
    bg.movhi r4, 0x3180
    bn.ori r4, r4, 0xa
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_23030a
loc_231a43:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.bnei r6, 0x0, loc_2323d0
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0xae
    bn.add r3, r12, r4
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bt.movi r10, 0x0
    bn.j loc_2300ab
loc_231a64:
    bg.lwz r6, 0xa8(r1)
    bn.add r4, r11, r6
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xa0
    bn.add r3, r12, r7
    bn.srli r4, r4, 0x5
    bg.jal 0x23e2b8
    bn.j loc_231378
loc_231a7f:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x9c
    bn.add r3, r12, r5
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_231354
loc_231a92:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_2323bd
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x2e
    bn.add r3, r12, r6
    bt.mov r4, r13
    bg.jal 0x23e58a
loc_231aae:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_2325db
    bg.movhi r5, 0x5280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bg.jal 0x23e58a
    bt.movi r10, 0x0
    bn.j loc_2300ab
loc_231acf:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2c
    bn.add r3, r12, r5
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_230cee
loc_231ae2:
    bg.lwz r5, 0xa8(r1)
    bn.add r4, r11, r5
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bn.srli r4, r4, 0x5
    bg.jal 0x23e2b8
    bn.j loc_230cd2
loc_231afd:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x1c
    bn.add r3, r12, r4
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_230cae
loc_231b10:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0xac
    bn.add r3, r12, r6
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_231394
loc_231b23:
    bt.mov r3, r11
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x2
    bn.andi r16, r3, 0x1
    bn.j loc_230e1d
loc_231b32:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xa
    bn.add r3, r12, r7
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x4
    bn.andi r17, r3, 0x1
    bn.j loc_230e04
loc_231b49:
    bg.bne r7, r14, loc_230e39
    bn.j loc_2302b9
loc_231b50:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_232451
    bg.movhi r6, 0x3180
    bn.ori r6, r6, 0x89
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23e4f4
loc_231b6f:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_2329df
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x89
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bn.j loc_230327
loc_231b8e:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_23243b
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0xa
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_231bad:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2329cc
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0xa
    bn.add r3, r12, r4
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bn.j loc_230327
loc_231bcc:
    bg.movhi r4, 0x48
    bg.addi r7, r4, -0x564
    bg.lbz r7, 0x1ec(r7)
    bn.sfnei r7, 0x1
    bn.bf loc_22ff6a
    bn.j loc_22ff64
loc_231be1:
    bn.lwz r6, 0x18(r1)
    bg.ori r7, r6, 0x2000
    bn.exthz r7, r7
    bn.sw 0x18(r1), r7
    bt.movi r15, 0x0
    bt.movi r16, 0x0
    bn.j loc_22ff4d
loc_231bf5:
    bn.lwz r4, 0x2c(r1)
    bg.ori r7, r4, 0x2000
    bn.exthz r7, r7
    bn.sw 0x2c(r1), r7
    bt.movi r15, 0x0
    bt.movi r16, 0x0
    bn.j loc_22ff4d
loc_231c09:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_232467
    bt.mov r3, r10
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_230e8d
loc_231c24:
    bg.movhi r7, 0x3180
    bn.ori r7, r7, 0xe
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.j loc_22fc3e
loc_231c39:
    bg.movhi r6, 0x3180
    bn.ori r6, r6, 0x8e
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.j loc_22fc3e
loc_231c4e:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_230e8d
loc_231c5c:
    bn.andi r7, r3, 0x1
    bn.srli r3, r3, 0x1
    bn.or r3, r7, r3
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22feff
loc_231c74:
    bg.lwz r6, 0x9c(r1)
    bg.beqi r6, 0x4, loc_232508
    bn.andi r7, r10, 0x7
    bt.movi r6, 0x8
    bn.sub r6, r6, r7
    bn.srai r7, r6, 0x1f
    bn.srli r7, r7, 0x1d
    bt.add r6, r7
    bn.andi r6, r6, 0x7
    bn.sub r6, r6, r7
    bn.exthz r6, r6
    bn.sw 0x8(r1), r6
loc_231c98:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r5, 0x36(r7)
    bg.beqi r5, 0x0, loc_232adb
    bg.lwz r6, 0x9c(r1)
    bn.sfeqi r6, 0x4
    bn.bf loc_2331c3
    bn.lh r7, 0x3a(r7)
    bn.srli r7, r7, 0x3
    bt.addi r7, -0x1
    bn.slli r4, r7, 0x4
loc_231cc4:
    bg.lwz r5, 0x9c(r1)
    bn.sfeqi r5, 0x2
    bn.bf loc_23312c
loc_231cce:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.lwz r6, 0xa4(r1)
    bn.lh r7, 0x34(r7)
    bn.muls r7, r6, r7
    bn.add r15, r4, r7
loc_231ceb:
    bg.beqi r21, 0x0, loc_232ac4
    bg.lwz r4, 0xac(r1)
    bg.ori r7, r4, 0x1000
    bn.exthz r7, r7
    bg.sw_0 0xac(r1), r7
    bn.sw 0xc(r1), r0
    bg.sw_0 0xa0(r1), r0
    bn.j loc_2307ce
loc_231d08:
    bn.ori r7, r0, 0x16
    bn.muls r7, r11, r7
    bt.add r7, r6
    bn.slli r7, r7, 0x1
    bg.addi r4, r1, 0x168
    bt.add r7, r4
    bn.lh_1 r7, 0xbe(r7)
    bg.sw_0 0xa4(r1), r7
    bt.movi r7, 0x7
    bn.divu r7, r13, r7
    bn.slli r17, r7, 0x4
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r6, 0x38(r7)
    bn.addi r7, r6, 0x37
    bn.ori r5, r0, 0x38
    bn.divs r7, r7, r5
    bn.muls r7, r7, r5
    bn.exthz r7, r7
    bn.sw 0x60(r1), r7
    bn.divu r4, r6, r5
    bn.muls r5, r4, r5
    bn.sub r6, r6, r5
    bn.exthz r6, r6
    bn.sfeqi r6, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bt.add r4, r7
    bn.exthz r4, r4
    bn.sw 0x5c(r1), r4
    bn.j loc_2307b6
loc_231d6a:
    bg.movhi r5, 0x3180
    bn.ori r5, r5, 0x89
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bn.j loc_230c2a
loc_231d81:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xa
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bn.j loc_231591
loc_231d93:
    bg.movhi r4, 0x3180
    bn.ori r4, r4, 0xa
    bn.add r3, r12, r4
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_23126f
loc_231daa:
    bn.lwz r5, 0x2c(r1)
    bg.ori r7, r5, 0x3000
    bn.exthz r7, r7
    bn.sw 0x2c(r1), r7
    bg.ori r15, r0, 0x8000
    bt.movi r16, 0x0
    bn.j loc_22ff4d
loc_231dc0:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2324ae
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_231dd7:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_232b8d
    bg.movhi r5, 0x5280
    bn.ori r5, r5, 0xa
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
    bn.j loc_2302b9
loc_231dfa:
    bn.lwz r4, 0x40(r1)
    bg.ori r7, r4, 0x4000
    bn.exthz r7, r7
    bg.sw_0 0xb0(r1), r7
    bn.lwz r5, 0x3c(r1)
    bn.or r7, r5, r10
    bn.exthz r22, r7
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_2324bc
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x49
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e5d1
loc_231e2d:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_232f42
    bn.srli r20, r11, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x18
    bn.add r3, r12, r6
    bn.add r4, r15, r20
    bg.jal 0x23e50c
loc_231e4f:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bn.sfeqi r4, 0x0
    bn.bf loc_232f28
    bn.add r7, r11, r16
    bn.srli r19, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x1c
    bn.add r3, r12, r5
    bn.add r4, r15, r19
    bg.jal 0x23e50c
loc_231e74:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.sfeqi r7, 0x0
    bn.bf loc_232f0c
    bn.slli r7, r16, 0x1
    bt.add r7, r11
    bn.srli r17, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x20
    bn.add r3, r12, r4
    bn.add r4, r15, r17
    bg.jal 0x23e50c
loc_231e9b:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.sfeqi r6, 0x0
    bn.bf loc_232ef5
    bn.srli r16, r13, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x24
    bn.add r3, r12, r7
    bn.add r4, r15, r16
    bg.jal 0x23e50c
loc_231ebd:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bn.sfeqi r5, 0x0
    bn.bf loc_232edb
    bn.add r7, r13, r18
    bn.srli r11, r7, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x28
    bn.add r3, r12, r6
    bn.add r4, r15, r11
    bg.jal 0x23e50c
loc_231ee2:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_232ebf
    bn.slli r7, r18, 0x1
    bt.add r7, r13
    bn.srli r10, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x2c
    bn.add r3, r12, r5
    bn.add r4, r15, r10
    bg.jal 0x23e50c
loc_231f07:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_232eac
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x30
    bn.add r3, r12, r4
    bt.mov r4, r20
    bg.jal 0x23e50c
loc_231f23:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232e99
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x34
    bn.add r3, r12, r7
    bt.mov r4, r19
    bg.jal 0x23e50c
loc_231f3f:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_232e86
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x38
    bn.add r3, r12, r6
    bt.mov r4, r17
    bg.jal 0x23e50c
loc_231f5b:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_232e73
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x3c
    bn.add r3, r12, r5
    bt.mov r4, r16
    bg.jal 0x23e50c
loc_231f77:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_232e60
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x40
    bn.add r3, r12, r4
    bt.mov r4, r11
    bg.jal 0x23e50c
loc_231f93:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232e4d
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x44
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e50c
loc_231faf:
    bn.lwz r5, 0x5c(r1)
    bn.andi r6, r5, 0xff
    bg.lwz r4, 0xb0(r1)
    bg.addi r5, r0, -0x100
    bn.and r7, r4, r5
    bn.or r6, r6, r7
    bn.sw 0x40(r1), r6
    bg.ori r22, r22, 0x860
    bn.sw 0x3c(r1), r22
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232764
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xe
    bn.add r3, r12, r7
    bn.lwz r4, 0x60(r1)
    bg.jal 0x23e58a
loc_231fea:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_232740
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x10
    bn.add r3, r12, r4
    bn.lh r4, 0x3a(r7)
    bg.jal 0x23e58a
loc_232017:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_23269a
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x16
    bn.add r3, r12, r4
    bg.lwz r4, 0xa4(r1)
    bg.jal 0x23e58a
loc_232035:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232682
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xce
    bn.add r3, r12, r7
    bg.lwz r4, 0xa0(r1)
    bn.ori r5, r0, 0x1f
    bg.jal 0x23e4a6
loc_232056:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_23272c
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xd0
    bn.add r3, r12, r6
    bn.lwz r4, 0xc(r1)
    bg.jal 0x23e50c
loc_232073:
    bg.lwz r4, 0x9c(r1)
    bg.beqi r4, 0x4, loc_23253e
    bg.lwz r6, 0xa4(r1)
    bn.slli r7, r6, 0x3
    bn.exthz r10, r7
    bg.beqi r21, 0x0, loc_23254e
loc_232089:
    bn.lwz r4, 0x2c(r1)
    bn.ori r7, r4, 0x20
    bn.exthz r7, r7
    bn.sw 0x2c(r1), r7
    bg.jal 0x21be0b
    bn.lwz r5, 0x24(r1)
    bn.ori r7, r5, 0x4
    bn.sfnei r3, 0x0
    bn.cmov_0 r5, r7, r5
    bn.sw 0x24(r1), r5
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232630
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x2c
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e58a
loc_2320c4:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x48(r7)
    bn.sfgtui r4, 0x3f
    bn.bf loc_232643
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232d81
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x2e
    bn.add r3, r12, r7
    bn.ori r4, r0, 0x40
    bg.jal 0x23e58a
    bg.ori r4, r0, 0x3cc
    bn.sw 0x30(r1), r4
loc_232101:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_23252b
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x48
    bn.add r3, r12, r5
    bt.movi r4, 0x8
    bg.jal 0x23e5d1
loc_23211d:
    bg.lwz r7, 0x9c(r1)
    bg.beqi r7, 0x4, loc_2325f0
    bg.lwz r5, 0x9c(r1)
    bg.beqi r5, 0x3, loc_232919
    bg.beqi r21, 0x0, loc_23260a
    bg.lwz r4, 0xac(r1)
    bg.ori r5, r0, 0xfeff
    bn.and r7, r4, r5
    bg.ori r7, r7, 0x2a00
    bg.sw_0 0xac(r1), r7
loc_232144:
    bt.mov r3, r14
    bg.jal 0x21d3b1
    bg.addi r3, r3, 0x88
    bg.ori r4, r0, 0x8007
    bg.jal 0x23dfb6
    bt.movi r10, 0x0
    bt.movi r15, 0x0
    bt.movi r16, 0x0
    bn.j loc_2300bb
loc_23215f:
    bg.ori r5, r0, 0xbfff
    bn.lwz r4, 0x40(r1)
    bn.and r5, r4, r5
    bg.sw_0 0xb0(r1), r5
    bn.lwz r6, 0x3c(r1)
    bn.or r7, r6, r11
    bn.exthz r22, r7
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2324cf
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x49
    bn.add r3, r12, r4
    bt.mov r4, r11
    bg.jal 0x23e5d1
loc_232192:
    bg.movhi r6, 0xbfff
    bg.ori r6, r6, 0xffff
    bn.and r10, r13, r6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_232fad
    bn.srli r20, r10, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x18
    bn.add r3, r12, r4
    bn.add r4, r15, r20
    bg.jal 0x23e50c
loc_2321bd:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232f93
    bn.add r7, r16, r10
    bn.srli r19, r7, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x1c
    bn.add r3, r12, r7
    bn.add r4, r15, r19
    bg.jal 0x23e50c
loc_2321e0:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_232f77
    bn.slli r7, r16, 0x1
    bt.add r7, r10
    bn.srli r18, r7, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bn.add r4, r15, r18
    bg.jal 0x23e50c
loc_232205:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_232f59
    bt.movi r7, 0x3
    bn.muls r7, r16, r7
    bt.add r7, r10
    bn.srli r13, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x24
    bn.add r3, r12, r5
    bn.add r4, r15, r13
    bg.jal 0x23e50c
loc_23222c:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_232df5
    bn.slli r7, r16, 0x2
    bt.add r7, r10
    bn.srli r11, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x28
    bn.add r3, r12, r4
    bn.add r4, r15, r11
    bg.jal 0x23e50c
loc_232251:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232dd7
    bt.movi r7, 0x5
    bn.muls r7, r16, r7
    bt.add r7, r10
    bn.srli r10, r7, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x2c
    bn.add r3, r12, r7
    bn.add r4, r15, r10
    bg.jal 0x23e50c
loc_232278:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_232dc3
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x30
    bn.add r3, r12, r6
    bn.add r4, r17, r20
    bg.jal 0x23e50c
loc_232295:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_232daf
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x34
    bn.add r3, r12, r5
    bn.add r4, r17, r19
    bg.jal 0x23e50c
loc_2322b2:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_232e25
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x38
    bn.add r3, r12, r4
    bn.add r4, r17, r18
    bg.jal 0x23e50c
loc_2322cf:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_232e11
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x3c
    bn.add r3, r12, r7
    bn.add r4, r17, r13
    bg.jal 0x23e50c
loc_2322ec:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_232e39
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x40
    bn.add r3, r12, r6
    bn.add r4, r17, r11
    bg.jal 0x23e50c
loc_232309:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_232d0d
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x44
    bn.add r3, r12, r5
    bn.add r4, r17, r10
    bg.jal 0x23e50c
    bn.j loc_231faf
loc_232329:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x82
    bn.add r10, r12, r7
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r4, 0x480
    bn.ori r4, r4, 0x14
    bn.add r3, r12, r4
    bn.ori r4, r0, 0x80
loc_232355:
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2380
    bn.ori r5, r5, 0x58
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_22f8fb
loc_232373:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2
    bn.add r10, r12, r5
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r6, 0x280
    bn.ori r6, r6, 0x14
    bn.add r3, r12, r6
    bn.ori r4, r0, 0x80
loc_23239f:
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x18
    bn.add r3, r12, r7
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_22f8fb
loc_2323bd:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x2e
    bn.add r3, r12, r7
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_231aae
loc_2323d0:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xae
    bn.add r3, r12, r7
    bt.mov r4, r13
    bg.jal 0x23e58a
    bt.movi r10, 0x0
    bn.j loc_2300ab
loc_2323e5:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x1c
    bn.add r3, r12, r5
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_2313ed
loc_2323f8:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0xae
    bn.add r3, r12, r4
    bt.mov r4, r10
    bg.jal 0x23e58a
    bt.movi r10, 0x0
    bn.j loc_2300ab
loc_23240d:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x2e
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e58a
    bn.j loc_231aae
loc_232420:
    bg.lwz r7, 0xa8(r1)
    bn.add r4, r11, r7
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bn.srli r4, r4, 0x5
    bg.jal 0x23e2b8
    bn.j loc_22ffdd
loc_23243b:
    bg.movhi r6, 0x3180
    bn.ori r6, r6, 0xa
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_231bad
loc_232451:
    bg.movhi r7, 0x3180
    bn.ori r7, r7, 0x89
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bn.j loc_231b6f
loc_232467:
    bt.mov r3, r10
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
    bn.j loc_230e8d
loc_232476:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x2
    bn.add r10, r12, r6
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.j loc_230419
loc_232492:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x82
    bn.add r10, r12, r4
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.j loc_2303cf
loc_2324ae:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_231dd7
loc_2324bc:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x49
    bn.add r3, r12, r4
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.j loc_231e2d
loc_2324cf:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x49
    bn.add r3, r12, r5
    bt.mov r4, r11
    bg.jal 0x23ddb9
    bn.j loc_232192
loc_2324e2:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xc9
    bn.add r3, r12, r4
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.j loc_2308ba
loc_2324f5:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xc9
    bn.add r3, r12, r7
    bt.mov r4, r11
    bg.jal 0x23ddb9
    bn.j loc_2317e7
loc_232508:
    bt.movi r7, 0x7
    bn.divu r6, r10, r7
    bn.muls r6, r6, r7
    bn.sub r6, r10, r6
    bn.exthz r6, r6
    bn.sub r6, r7, r6
    bn.divs r5, r6, r7
    bn.muls r5, r5, r7
    bn.sub r6, r6, r5
    bn.exthz r6, r6
    bn.sw 0x8(r1), r6
    bn.j loc_231c98
loc_23252b:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x48
    bn.add r3, r12, r6
    bt.movi r4, 0x8
    bg.jal 0x23ddb9
    bn.j loc_23211d
loc_23253e:
    bt.movi r7, 0x7
    bg.lwz r5, 0xa4(r1)
    bn.muls r7, r5, r7
    bn.exthz r10, r7
    bg.bnei r21, 0x0, loc_232089
loc_23254e:
    bn.lwz r4, 0x18(r1)
    bn.ori r7, r4, 0x20
    bn.exthz r7, r7
    bn.sw 0x18(r1), r7
    bg.jal 0x21be0b
    bn.beqi r3, 0x0, loc_23256a
    bn.lwz r7, 0x24(r1)
    bn.ori r7, r7, 0x8
    bn.sw 0x24(r1), r7
loc_23256a:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_23261e
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xac
    bn.add r3, r12, r5
    bt.mov r4, r10
    bg.jal 0x23e58a
loc_232586:
    bg.lwz r7, 0x9c(r1)
    bg.beqi r7, 0x4, loc_232b3f
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_232a84
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r4, 0x54(r1)
    bn.lh r7, 0x48(r7)
    bt.add r4, r7
    bn.sw 0x54(r1), r4
    bt.addi r4, 0x7
    bn.lwz r5, 0x8(r1)
    bt.add r4, r5
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0xae
    bn.add r3, r12, r6
    bg.ori r7, r0, 0xfff8
    bn.and r4, r4, r7
    bg.jal 0x23e58a
    bg.ori r4, r0, 0x3cc
    bn.sw 0x1c(r1), r4
    bn.j loc_232101
loc_2325db:
    bg.movhi r6, 0x5280
    bn.ori r6, r6, 0x2e
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.movi r10, 0x0
    bn.j loc_2300ab
loc_2325f0:
    bg.beqi r21, 0x0, loc_232af9
    bg.lwz r4, 0xac(r1)
    bg.ori r5, r0, 0xfdff
    bn.and r7, r4, r5
    bg.ori r7, r7, 0x2900
    bg.sw_0 0xac(r1), r7
    bn.j loc_232144
loc_23260a:
    bn.lwz r6, 0x40(r1)
    bg.ori r4, r0, 0xfeff
    bn.and r7, r6, r4
    bg.ori r7, r7, 0x2a00
    bn.sw 0x40(r1), r7
    bn.j loc_232144
loc_23261e:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0xac
    bn.add r3, r12, r6
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bt.j loc_232586
loc_232630:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x2c
    bn.add r3, r12, r4
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bn.j loc_2320c4
loc_232643:
    bg.lwz r7, 0x9c(r1)
    bg.beqi r7, 0x4, loc_2330af
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_233084
    bn.lwz r6, 0x54(r1)
    bt.add r4, r6
    bt.addi r4, 0x7
    bn.lwz r7, 0x8(r1)
    bt.add r4, r7
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bg.ori r6, r0, 0xfff8
    bn.and r4, r4, r6
    bg.jal 0x23e58a
    bg.ori r7, r0, 0x3cc
    bn.sw 0x30(r1), r7
    bn.j loc_232101
loc_232682:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xce
    bn.add r3, r12, r4
    bg.lwz r4, 0xa0(r1)
    bn.ori r5, r0, 0x1f
    bg.jal 0x23e152
    bn.j loc_232056
loc_23269a:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x16
    bn.add r3, r12, r5
    bg.lwz r4, 0xa4(r1)
    bg.jal 0x23dfb6
    bn.j loc_232035
loc_2326af:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xd4
    bn.add r3, r12, r6
    bn.lwz r4, 0xc(r1)
    bg.jal 0x23e2b8
    bn.j loc_232073
loc_2326c3:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xce
    bn.add r3, r12, r6
    bg.lwz r7, 0xa0(r1)
    bn.slli r4, r7, 0x5
    bg.ori r5, r0, 0x3e0
    bg.jal 0x23e152
    bn.j loc_230b1c
loc_2326df:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x96
    bn.add r3, r12, r5
    bg.lwz r4, 0xa4(r1)
    bg.jal 0x23dfb6
    bn.j loc_230af5
loc_2326f4:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x90
    bn.add r3, r12, r6
    bn.lh r4, 0x3a(r7)
    bg.jal 0x23dfb6
    bn.j loc_230ad5
loc_232718:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x8e
    bn.add r3, r12, r4
    bn.lwz r4, 0x60(r1)
    bg.jal 0x23dfb6
    bn.j loc_230aa6
loc_23272c:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xd0
    bn.add r3, r12, r7
    bn.lwz r4, 0xc(r1)
    bg.jal 0x23e2b8
    bn.j loc_232073
loc_232740:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x10
    bn.add r3, r12, r6
    bn.lh r4, 0x3a(r7)
    bg.jal 0x23dfb6
    bn.j loc_232017
loc_232764:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xe
    bn.add r3, r12, r4
    bn.lwz r4, 0x60(r1)
    bg.jal 0x23dfb6
    bn.j loc_231fea
loc_232778:
    bg.movhi r4, 0x5280
    bn.ori r4, r4, 0x20
    bn.add r3, r12, r4
    bn.srli r4, r11, 0x5
    bg.jal 0x23e2b8
    bn.j loc_23146e
loc_23278c:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_23144f
loc_23279f:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x2c
    bn.add r3, r12, r6
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_231431
loc_2327b2:
    bg.lwz r6, 0xa8(r1)
    bn.add r4, r19, r6
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x20
    bn.add r3, r12, r7
    bn.srli r4, r4, 0x5
    bg.jal 0x23e2b8
    bn.j loc_231413
loc_2327cd:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bg.movhi r5, 0x5280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bn.lh r4, 0x48(r7)
    bg.jal 0x23dfb6
    bn.j loc_2300ab
loc_2327f1:
    bg.movhi r7, 0x5280
    bn.ori r7, r7, 0x2c
    bn.add r3, r12, r7
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_23007c
loc_232804:
    bg.movhi r4, 0x5280
    bn.ori r4, r4, 0x20
    bn.add r3, r12, r4
    bn.srli r4, r19, 0x5
    bg.jal 0x23e2b8
    bn.j loc_23005e
loc_232818:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x1c
    bn.add r3, r12, r5
    bt.mov r4, r13
    bg.jal 0x23dfb6
    bn.j loc_23003f
loc_23282b:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x2e
    bn.add r3, r12, r6
    bt.mov r4, r20
    bg.jal 0x23dfb6
    bn.j loc_230021
loc_23283e:
    bn.addi r4, r18, 0x3f
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x2c
    bn.add r3, r12, r6
    bg.ori r7, r0, 0xffc0
    bn.and r4, r4, r7
    bg.jal 0x23dfb6
    bn.j loc_230003
loc_232859:
    bg.movhi r5, 0x5280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bt.mov r4, r20
    bg.jal 0x23dfb6
    bn.j loc_2300ab
loc_23286c:
    bn.addi r4, r18, 0x3f
    bg.movhi r5, 0x5280
    bn.ori r5, r5, 0x2c
    bn.add r3, r12, r5
    bg.ori r6, r0, 0xffc0
    bn.and r4, r4, r6
    bg.jal 0x23dfb6
    bn.j loc_231494
loc_232887:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x82
    bn.add r10, r12, r6
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x480
    bn.ori r7, r7, 0x14
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r4, 0x2380
    bn.ori r4, r4, 0x58
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_22f8fb
loc_2328d0:
    bg.movhi r4, 0x3280
    bn.ori r4, r4, 0x2
    bn.add r10, r12, r4
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r5, 0x280
    bn.ori r5, r5, 0x14
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x18
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_22f8fb
loc_232919:
    bg.beqi r21, 0x0, loc_233070
    bg.lwz r6, 0xac(r1)
    bg.ori r4, r0, 0xfcff
    bn.and r7, r6, r4
    bg.ori r7, r7, 0x2800
    bg.sw_0 0xac(r1), r7
    bn.j loc_232144
loc_232933:
    bg.lwz r6, 0x9c(r1)
    bg.beqi r6, 0x4, loc_23315d
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r6, 0x42(r7)
    bn.lh r7, 0x34(r7)
    bn.sub r7, r6, r7
    bn.addi r7, r7, 0x3f
    bn.addi r5, r0, -0x40
    bn.and r4, r7, r5
    bn.extbz r6, r6
    bn.addi r7, r6, 0x3f
    bn.and r7, r7, r5
    bn.sub r7, r7, r6
    bn.extbz r5, r7
    bg.lwz r6, 0x9c(r1)
    bg.beqi r6, 0x2, loc_233194
loc_232974:
    bn.addi r7, r4, -0x1
    bt.movi r4, -0x10
    bn.and r7, r7, r4
    bn.and r6, r5, r4
    bg.lwz r4, 0xa4(r1)
    bn.muls r6, r6, r4
    bn.sw 0xc(r1), r6
    bn.muls r7, r4, r7
    bn.addi r15, r7, 0xf
    bn.andi r6, r5, 0x1f
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r5, 0x36(r7)
    bg.sw_0 0xa0(r1), r6
    bn.sw 0x8(r1), r0
    bn.sfeqi r5, 0x0
    bn.bf loc_2307ce
    bg.lwz r7, 0x9c(r1)
    bg.beqi r7, 0x4, loc_233207
    bn.srli r7, r5, 0x3
    bn.slli r7, r7, 0x4
    bt.add r15, r7
    bg.sw_0 0xa0(r1), r6
    bn.sw 0x8(r1), r0
    bn.j loc_2307ce
loc_2329cc:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xa
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bn.j loc_231591
loc_2329df:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x89
    bn.add r3, r12, r6
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bn.j loc_231591
loc_2329f2:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x82
    bn.add r10, r12, r5
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r6, 0x480
    bn.ori r6, r6, 0x14
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x58
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_22f8fb
loc_232a3b:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x2
    bn.add r10, r12, r7
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r4, 0x280
    bn.ori r4, r4, 0x14
    bn.add r3, r12, r4
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2380
    bn.ori r5, r5, 0x18
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_22f8fb
loc_232a84:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r6, 0x54(r1)
    bn.lh r7, 0x48(r7)
    bt.add r6, r7
    bt.mov r4, r6
    bt.addi r4, 0x7
    bn.lwz r7, 0x8(r1)
    bt.add r4, r7
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xae
    bn.add r3, r12, r5
    bg.ori r6, r0, 0xfff8
    bn.and r4, r4, r6
    bg.jal 0x23dfb6
    bg.ori r7, r0, 0x3cc
    bn.sw 0x1c(r1), r7
    bn.j loc_232101
loc_232ac4:
    bn.lwz r5, 0x40(r1)
    bg.ori r7, r5, 0x1000
    bn.exthz r7, r7
    bn.sw 0x40(r1), r7
    bn.sw 0xc(r1), r0
    bg.sw_0 0xa0(r1), r0
    bn.j loc_2307ce
loc_232adb:
    bg.lwz r7, 0x9c(r1)
    bg.beqi r7, 0x4, loc_2331a5
    bn.srli r7, r10, 0x3
    bn.andi r6, r10, 0x7
    bn.sfeqi r6, 0x0
    bn.cmovsi_2 r6, r0, 0x1
    bt.add r7, r6
    bt.addi r7, -0x1
    bn.slli r4, r7, 0x4
    bn.j loc_231cc4
loc_232af9:
    bn.lwz r6, 0x40(r1)
    bg.ori r4, r0, 0xfdff
    bn.and r7, r6, r4
    bg.ori r7, r7, 0x2900
    bn.sw 0x40(r1), r7
    bn.j loc_232144
loc_232b0d:
    bn.lwz r4, 0x30(r1)
    bg.ori r7, r4, 0x410d
    bn.exthz r7, r7
    bn.sw 0x30(r1), r7
    bn.j loc_22fd41
loc_232b1d:
    bn.lh r7, 0x44(r7)
    bn.lwz r4, 0x54(r1)
    bn.sub r7, r7, r4
    bt.movi r5, 0x7
    bn.divs r6, r7, r5
    bn.muls r6, r6, r5
    bn.sub r7, r7, r6
    bn.lwz r5, 0x8(r1)
    bt.add r7, r5
    bn.exthz r7, r7
    bn.sw 0x8(r1), r7
    bn.j loc_230810
loc_232b3f:
    bg.movhi r4, 0x45
    bg.lbz r4, 0x5210(r4)
    bg.beqi r4, 0x0, loc_2330ea
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r4, 0x48(r7)
    bn.lwz r6, 0x54(r1)
    bt.add r4, r6
    bt.addi r4, 0x6
    bn.lwz r7, 0x8(r1)
    bt.add r4, r7
    bt.movi r7, 0x7
    bn.divs r4, r4, r7
    bn.muls r4, r4, r7
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0xae
    bn.add r3, r12, r5
    bn.exthz r4, r4
    bg.jal 0x23e58a
    bg.ori r6, r0, 0x3cc
    bn.sw 0x1c(r1), r6
    bn.j loc_232101
loc_232b8d:
    bg.movhi r6, 0x5280
    bn.ori r6, r6, 0xa
    bn.add r3, r12, r6
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.j loc_2302b9
loc_232ba4:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2
    bn.add r10, r12, r5
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bn.movhi_2 r6, 0x280
    bn.ori r6, r6, 0x14
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.j loc_23239f
loc_232bd2:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xc4
    bn.add r3, r12, r7
    bn.add r4, r17, r10
    bg.jal 0x23e2b8
    bn.j loc_230a68
loc_232be6:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xc0
    bn.add r3, r12, r4
    bn.add r4, r17, r11
    bg.jal 0x23e2b8
    bn.j loc_2319e3
loc_232bfa:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xbc
    bn.add r3, r12, r5
    bn.add r4, r17, r13
    bg.jal 0x23e2b8
    bn.j loc_2319c4
loc_232c0e:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xb8
    bn.add r3, r12, r6
    bn.add r4, r17, r18
    bg.jal 0x23e2b8
    bn.j loc_2319a5
loc_232c22:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xb4
    bn.add r3, r12, r7
    bn.add r4, r17, r19
    bg.jal 0x23e2b8
    bn.j loc_231986
loc_232c36:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xb0
    bn.add r3, r12, r4
    bn.add r4, r17, r20
    bg.jal 0x23e2b8
    bn.j loc_231967
loc_232c4a:
    bt.movi r7, 0x5
    bn.muls r7, r16, r7
    bt.add r7, r10
    bn.srli r10, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xac
    bn.add r3, r12, r5
    bn.add r4, r15, r10
    bg.jal 0x23e2b8
    bn.j loc_231948
loc_232c68:
    bn.slli r7, r16, 0x2
    bt.add r7, r10
    bn.srli r11, r7, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xa8
    bn.add r3, r12, r6
    bn.add r4, r15, r11
    bg.jal 0x23e2b8
    bn.j loc_23191f
loc_232c84:
    bt.movi r7, 0x3
    bn.muls r7, r16, r7
    bt.add r7, r10
    bn.srli r13, r7, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xa4
    bn.add r3, r12, r7
    bn.add r4, r15, r13
    bg.jal 0x23e2b8
    bn.j loc_2318f8
loc_232ca2:
    bn.slli r7, r16, 0x1
    bt.add r7, r10
    bn.srli r18, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xa0
    bn.add r3, r12, r4
    bn.add r4, r15, r18
    bg.jal 0x23e2b8
    bn.j loc_2318cf
loc_232cbe:
    bn.add r7, r16, r10
    bn.srli r19, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x9c
    bn.add r3, r12, r5
    bn.add r4, r15, r19
    bg.jal 0x23e2b8
    bn.j loc_2318a8
loc_232cd8:
    bn.srli r20, r10, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x98
    bn.add r3, r12, r6
    bn.add r4, r15, r20
    bg.jal 0x23e2b8
    bn.j loc_231883
loc_232cef:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x4f
    bn.add r3, r12, r6
    bg.jal 0x23ddb9
    bn.j loc_231856
loc_232d00:
    bg.beqi r4, 0x5, loc_233202
    bn.sfnei r4, 0xa
    bn.cmovsi_2 r4, r4, 0x2
    bn.j loc_23183a
loc_232d0d:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x44
    bn.add r3, r12, r6
    bn.add r4, r17, r10
    bg.jal 0x23e2b8
    bn.j loc_231faf
loc_232d21:
    bn.slli r7, r16, 0x1
    bt.add r7, r11
    bn.srli r17, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xa0
    bn.add r3, r12, r4
    bn.add r4, r15, r17
    bg.jal 0x23e2b8
    bn.j loc_230946
loc_232d3d:
    bn.add r7, r11, r16
    bn.srli r19, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x9c
    bn.add r3, r12, r5
    bn.add r4, r15, r19
    bg.jal 0x23e2b8
    bn.j loc_23091f
loc_232d57:
    bn.srli r20, r11, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x98
    bn.add r3, r12, r6
    bn.add r4, r15, r20
    bg.jal 0x23e2b8
    bn.j loc_2308fa
loc_232d6e:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x4f
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.j loc_2308d8
loc_232d81:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x40
    bg.jal 0x23dfb6
    bg.ori r6, r0, 0x3cc
    bn.sw 0x30(r1), r6
    bn.j loc_232101
loc_232d9c:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xc4
    bn.add r3, r12, r7
    bt.mov r4, r10
    bg.jal 0x23e2b8
    bn.j loc_230a68
loc_232daf:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x34
    bn.add r3, r12, r6
    bn.add r4, r17, r19
    bg.jal 0x23e2b8
    bn.j loc_2322b2
loc_232dc3:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x30
    bn.add r3, r12, r7
    bn.add r4, r17, r20
    bg.jal 0x23e2b8
    bn.j loc_232295
loc_232dd7:
    bt.movi r7, 0x5
    bn.muls r7, r16, r7
    bt.add r7, r10
    bn.srli r10, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x2c
    bn.add r3, r12, r4
    bn.add r4, r15, r10
    bg.jal 0x23e2b8
    bn.j loc_232278
loc_232df5:
    bn.slli r7, r16, 0x2
    bt.add r7, r10
    bn.srli r11, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x28
    bn.add r3, r12, r5
    bn.add r4, r15, r11
    bg.jal 0x23e2b8
    bn.j loc_232251
loc_232e11:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x3c
    bn.add r3, r12, r4
    bn.add r4, r17, r13
    bg.jal 0x23e2b8
    bn.j loc_2322ec
loc_232e25:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x38
    bn.add r3, r12, r5
    bn.add r4, r17, r18
    bg.jal 0x23e2b8
    bn.j loc_2322cf
loc_232e39:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x40
    bn.add r3, r12, r7
    bn.add r4, r17, r11
    bg.jal 0x23e2b8
    bn.j loc_232309
loc_232e4d:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x44
    bn.add r3, r12, r4
    bt.mov r4, r10
    bg.jal 0x23e2b8
    bn.j loc_231faf
loc_232e60:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x40
    bn.add r3, r12, r5
    bt.mov r4, r11
    bg.jal 0x23e2b8
    bn.j loc_231f93
loc_232e73:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x3c
    bn.add r3, r12, r6
    bt.mov r4, r16
    bg.jal 0x23e2b8
    bn.j loc_231f77
loc_232e86:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x38
    bn.add r3, r12, r7
    bt.mov r4, r17
    bg.jal 0x23e2b8
    bn.j loc_231f5b
loc_232e99:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x34
    bn.add r3, r12, r4
    bt.mov r4, r19
    bg.jal 0x23e2b8
    bn.j loc_231f3f
loc_232eac:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x30
    bn.add r3, r12, r5
    bt.mov r4, r20
    bg.jal 0x23e2b8
    bn.j loc_231f23
loc_232ebf:
    bn.slli r7, r18, 0x1
    bt.add r7, r13
    bn.srli r10, r7, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x2c
    bn.add r3, r12, r6
    bn.add r4, r15, r10
    bg.jal 0x23e2b8
    bn.j loc_231f07
loc_232edb:
    bn.add r7, r13, r18
    bn.srli r11, r7, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x28
    bn.add r3, r12, r7
    bn.add r4, r15, r11
    bg.jal 0x23e2b8
    bn.j loc_231ee2
loc_232ef5:
    bn.srli r16, r13, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x24
    bn.add r3, r12, r4
    bn.add r4, r15, r16
    bg.jal 0x23e2b8
    bn.j loc_231ebd
loc_232f0c:
    bn.slli r7, r16, 0x1
    bt.add r7, r11
    bn.srli r17, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bn.add r4, r15, r17
    bg.jal 0x23e2b8
    bn.j loc_231e9b
loc_232f28:
    bn.add r7, r11, r16
    bn.srli r19, r7, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x1c
    bn.add r3, r12, r6
    bn.add r4, r15, r19
    bg.jal 0x23e2b8
    bn.j loc_231e74
loc_232f42:
    bn.srli r20, r11, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x18
    bn.add r3, r12, r7
    bn.add r4, r15, r20
    bg.jal 0x23e2b8
    bn.j loc_231e4f
loc_232f59:
    bt.movi r7, 0x3
    bn.muls r7, r16, r7
    bt.add r7, r10
    bn.srli r13, r7, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0x24
    bn.add r3, r12, r6
    bn.add r4, r15, r13
    bg.jal 0x23e2b8
    bn.j loc_23222c
loc_232f77:
    bn.slli r7, r16, 0x1
    bt.add r7, r10
    bn.srli r18, r7, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0x20
    bn.add r3, r12, r7
    bn.add r4, r15, r18
    bg.jal 0x23e2b8
    bn.j loc_232205
loc_232f93:
    bn.add r7, r16, r10
    bn.srli r19, r7, 0x5
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0x1c
    bn.add r3, r12, r4
    bn.add r4, r15, r19
    bg.jal 0x23e2b8
    bn.j loc_2321e0
loc_232fad:
    bn.srli r20, r10, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0x18
    bn.add r3, r12, r5
    bn.add r4, r15, r20
    bg.jal 0x23e2b8
    bn.j loc_2321bd
loc_232fc4:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xc0
    bn.add r3, r12, r4
    bt.mov r4, r11
    bg.jal 0x23e2b8
    bn.j loc_230a4a
loc_232fd7:
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xbc
    bn.add r3, r12, r5
    bt.mov r4, r16
    bg.jal 0x23e2b8
    bn.j loc_230a2c
loc_232fea:
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xb8
    bn.add r3, r12, r6
    bt.mov r4, r17
    bg.jal 0x23e2b8
    bn.j loc_230a0e
loc_232ffd:
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xb4
    bn.add r3, r12, r7
    bt.mov r4, r19
    bg.jal 0x23e2b8
    bn.j loc_2309f0
loc_233010:
    bg.movhi r4, 0x2f80
    bn.ori r4, r4, 0xb0
    bn.add r3, r12, r4
    bt.mov r4, r20
    bg.jal 0x23e2b8
    bn.j loc_2309d2
loc_233023:
    bn.slli r7, r18, 0x1
    bt.add r7, r13
    bn.srli r10, r7, 0x5
    bg.movhi r5, 0x2f80
    bn.ori r5, r5, 0xac
    bn.add r3, r12, r5
    bn.add r4, r15, r10
    bg.jal 0x23e2b8
    bn.j loc_2309b4
loc_23303f:
    bn.add r7, r13, r18
    bn.srli r11, r7, 0x5
    bg.movhi r6, 0x2f80
    bn.ori r6, r6, 0xa8
    bn.add r3, r12, r6
    bn.add r4, r15, r11
    bg.jal 0x23e2b8
    bn.j loc_23098d
loc_233059:
    bn.srli r16, r13, 0x5
    bg.movhi r7, 0x2f80
    bn.ori r7, r7, 0xa4
    bn.add r3, r12, r7
    bn.add r4, r15, r16
    bg.jal 0x23e2b8
    bn.j loc_230968
loc_233070:
    bn.lwz r5, 0x40(r1)
    bg.ori r6, r0, 0xfcff
    bn.and r7, r5, r6
    bg.ori r7, r7, 0x2800
    bn.sw 0x40(r1), r7
    bn.j loc_232144
loc_233084:
    bn.lwz r5, 0x54(r1)
    bt.add r4, r5
    bt.addi r4, 0x7
    bn.lwz r6, 0x8(r1)
    bt.add r4, r6
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x2e
    bn.add r3, r12, r7
    bg.ori r5, r0, 0xfff8
    bn.and r4, r4, r5
    bg.jal 0x23dfb6
    bg.ori r6, r0, 0x3cc
    bn.sw 0x30(r1), r6
    bn.j loc_232101
loc_2330af:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_2331d3
    bn.lwz r6, 0x54(r1)
    bt.add r4, r6
    bt.addi r4, 0x6
    bn.lwz r7, 0x8(r1)
    bt.add r4, r7
    bt.movi r7, 0x7
    bn.divs r4, r4, r7
    bn.muls r4, r4, r7
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x2e
    bn.add r3, r12, r5
    bn.exthz r4, r4
    bg.jal 0x23e58a
    bg.ori r6, r0, 0x3cc
    bn.sw 0x30(r1), r6
    bn.j loc_232101
loc_2330ea:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r4, 0x48(r7)
    bn.lwz r5, 0x54(r1)
    bt.add r4, r5
    bt.addi r4, 0x6
    bn.lwz r6, 0x8(r1)
    bt.add r4, r6
    bt.movi r7, 0x7
    bn.divs r4, r4, r7
    bn.muls r4, r4, r7
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xae
    bn.add r3, r12, r7
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bg.ori r4, r0, 0x3cc
    bn.sw 0x1c(r1), r4
    bn.j loc_232101
loc_23312c:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.lh r7, 0x34(r7)
    bn.muls r6, r6, r7
    bg.lwz r7, 0xa4(r1)
    bn.muls r6, r7, r6
    bn.addi r7, r6, 0x3
    bn.sflesi r6, -0x1
    bn.cmov_0 r7, r7, r6
    bn.srai r7, r7, 0x2
    bn.add r15, r4, r7
    bn.j loc_231ceb
loc_23315d:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lh r5, 0x42(r7)
    bn.lh r7, 0x34(r7)
    bn.sub r7, r5, r7
    bn.addi r7, r7, 0x37
    bn.ori r6, r0, 0x38
    bn.divs r7, r7, r6
    bn.muls r4, r7, r6
    bn.addi r7, r5, 0x37
    bn.divs r7, r7, r6
    bn.muls r7, r7, r6
    bn.sub r7, r7, r5
    bn.extbz r5, r7
    bn.j loc_232974
loc_233194:
    bt.movi r7, 0x3
    bn.muls r6, r4, r7
    bn.srli r4, r6, 0x2
    bn.muls r7, r5, r7
    bn.srli r5, r7, 0x2
    bn.j loc_232974
loc_2331a5:
    bt.movi r7, 0x7
    bn.divu r6, r10, r7
    bn.muls r7, r6, r7
    bn.sub r7, r10, r7
    bn.exthz r7, r7
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bt.add r6, r7
    bt.addi r6, -0x1
    bn.slli r4, r6, 0x4
    bn.j loc_231cce
loc_2331c3:
    bn.lh r7, 0x3a(r7)
    bt.movi r6, 0x7
    bn.divu r7, r7, r6
    bt.addi r7, -0x1
    bn.slli r4, r7, 0x4
    bn.j loc_231cce
loc_2331d3:
    bn.lwz r7, 0x54(r1)
    bt.add r4, r7
    bt.addi r4, 0x6
    bn.lwz r5, 0x8(r1)
    bt.add r4, r5
    bt.movi r7, 0x7
    bn.divs r4, r4, r7
    bn.muls r4, r4, r7
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x2e
    bn.add r3, r12, r6
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bg.ori r7, r0, 0x3cc
    bn.sw 0x30(r1), r7
    bn.j loc_232101
loc_233202:
    bt.movi r4, 0x1
    bn.j loc_23183a
loc_233207:
    bt.movi r7, 0x7
    bn.divu r7, r5, r7
    bn.slli r7, r7, 0x4
    bt.add r15, r7
    bn.j loc_2307ce
