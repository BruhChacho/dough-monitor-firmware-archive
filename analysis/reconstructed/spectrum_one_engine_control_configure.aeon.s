# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x220a8b,0x220c76); Coordinate engine control, metadata gates and register updates; several dependencies remain unrecovered.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r3
    bt.mov r10, r4
    bt.mov r3, r4
    bg.jal 0x21d3b1
    bt.mov r11, r3
    bt.mov r3, r10
    bg.jal 0x21d8f7
    bt.mov r13, r3
    bg.bnei r12, 0x0, loc_220bbd
loc_220ab5:
    bn.andi r7, r10, 0x1
    bg.beqi r7, 0x0, loc_220b42
    bn.addi r3, r11, 0x4
    bg.beqi r12, 0x0, loc_220c09
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r11, 0x48
    bn.ori r7, r0, 0x7c
    bn.muls r7, r10, r7
    bg.addi r6, r11, -0x564
    bt.add r7, r6
    bn.lwz r3, 0x4(r7)
    bg.movhi r7, 0x5b80
    bn.ori r7, r7, 0x3
    bt.add r3, r7
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.movhi r3, 0x2090
    bg.ori r3, r3, 0x2f32
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.movhi_2 r3, 0xf90
    bg.ori r3, r3, 0x2fac
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
loc_220b1e:
    bg.addi r11, r11, -0x564
    bg.lbz r7, 0x89(r11)
    bt.addi r7, -0x9
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_220b69
loc_220b2e:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_220b42:
    bn.sfeqi r12, 0x0
    bn.addi r3, r11, 0x4
    bn.ori r4, r0, 0x80
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r11, 0x48
    bg.addi r11, r11, -0x564
    bg.lbz r7, 0x89(r11)
    bt.addi r7, -0x9
    bn.extbz r7, r7
    bn.bgtui r7, 0x1, loc_220b2e
loc_220b69:
    bt.mov r3, r10
    bg.jal 0x222804
    bt.mov r10, r3
    bt.movi r3, 0x1
    bg.jal 0x222804
    bg.bne r10, r3, loc_220b2e
    bn.extbs r7, r13
    bn.sfgtsi r7, -0x1
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r7, r7
    bg.beq r7, r12, loc_220b2e
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.bnei r12, 0x0, loc_220c18
    bg.lbz r7, 0x89(r11)
    bg.beqi r7, 0xa, loc_220c27
loc_220b9f:
    bg.beqi r7, 0x9, loc_220c35
loc_220ba3:
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23e13b
loc_220bbd:
    bt.movi r3, 0x1
    bn.sll r3, r3, r10
    bn.exthz r3, r3
    bt.movi r4, 0x1
    bg.jal 0x22607c
    bt.mov r3, r10
    bg.jal 0x222804
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0xc
    bg.bnei r7, 0x0, loc_220ab5
    bt.mov r3, r10
    bg.jal 0x222804
    bg.jal 0x23ee2c
    bg.bleui r3, 0x1, loc_220ab5
    bt.mov r3, r10
    bg.jal 0x222804
    bg.jal 0x23ea03
    bg.bnei r3, 0x0, loc_220ab5
    bt.j loc_220b2e
loc_220c09:
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.movhi r11, 0x48
    bt.j loc_220b1e
loc_220c18:
    bg.jal 0x21bd1e
    bt.addi r3, -0x1
    bn.exthz r3, r3
    bg.jal 0x220995
    bt.j loc_220ba3
loc_220c27:
    bg.ori r3, r0, 0xfff
    bg.jal 0x220995
    bg.lbz r7, 0x89(r11)
    bt.j loc_220b9f
loc_220c35:
    bn.movhi_2 r3, 0xf90
    bg.ori r3, r3, 0x2fac
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bg.movhi r10, 0x2090
    bg.ori r3, r10, 0x2f32
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.jal 0x2421d3
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f21
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x80
    bg.jal 0x23dead
    bg.ori r3, r10, 0x2f32
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bt.j loc_220ba3
