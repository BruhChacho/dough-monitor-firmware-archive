# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2213d0,0x222634); Configure engine mode through indexed branches and register requests; external services remain unresolved.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x68
    bn.sw 0x64(r1), r9
    bn.sw 0x60(r1), r10
    bn.sw 0x5c(r1), r11
    bn.sw 0x58(r1), r12
    bn.sw 0x54(r1), r13
    bn.sw 0x50(r1), r14
    bn.sw 0x4c(r1), r15
    bn.sw 0x48(r1), r16
    bn.sw 0x44(r1), r17
    bn.sw 0x40(r1), r18
    bn.sw 0x3c(r1), r19
    bn.sw 0x38(r1), r20
    bn.sw 0x34(r1), r21
    bn.sw 0x30(r1), r22
    bt.mov r14, r3
    bt.mov r13, r4
    bg.movhi r19, 0x48
    bn.ori r7, r0, 0x7c
    bn.muls r10, r4, r7
    bg.addi r4, r19, -0x564
    bt.add r10, r4
    bn.lwz r15, 0x4(r10)
    bt.mov r3, r13
    bg.jal 0x222804
    bt.mov r17, r3
    bn.lbz r16, 0xd(r10)
    bg.bgtui r13, 0x3, loc_221621
    bn.lwz r7, 0x8(r10)
    bg.beqi r7, 0x0, loc_221621
    bg.beqi r7, 0x7, loc_221621
    bg.beqi r14, 0x9, loc_2216dd
loc_221432:
    bn.extbz r6, r14
    bn.sbz 0xd(r10), r6
    bg.beqi r13, 0x1, loc_221650
loc_22143c:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sbz 0xd(r7), r6
    bt.mov r3, r13
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r18, 0x48
    bg.addi r6, r18, 0x21ec
    bt.add r3, r6
    bn.lh r3, 0x2a(r3)
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.beqi r14, 0x5, loc_22207d
    bn.addi r7, r14, -0x9
    bg.bleui r7, 0x1, loc_222092
loc_221479:
    bn.movhi_2 r4, 0x1080
    bn.ori r4, r4, 0x21
    bn.add r3, r15, r4
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x80
    bg.jal 0x23dead
loc_22148b:
    bt.mov r3, r13
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r3, 0x2a(r3)
    bt.movi r4, 0x0
    bg.jal 0x23e13b
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lbz r7, 0xc(r7)
    bg.beqi r7, 0x0, loc_2216e3
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0x2
    bn.add r3, r15, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
loc_2214d4:
    bg.bnei r13, 0x1, loc_221621
    bg.beq r16, r14, loc_222076
loc_2214dc:
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.movhi r10, 0x2090
    bg.ori r3, r10, 0x2f34
    bt.movi r4, 0x2
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x2f36
    bt.movi r4, 0x7
    bg.jal 0x23dfb6
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
    bn.movhi_2 r10, 0xf90
    bg.ori r3, r10, 0x2faa
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x2fa8
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.movhi r10, -0xf
    bg.ori r3, r10, 0x1518
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dead
    bg.ori r3, r10, 0x15fd
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x15e1
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x88
    bg.jal 0x23dfe1
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f3d
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bg.jal 0x21bd14
    bt.mov r10, r3
    bg.jal 0x21bd8d
    bt.mov r16, r3
    bn.sfnei r3, 0x0
    bn.cmovi r7, 0x2, 0x1
    bn.divs r10, r10, r7
    bt.addi r10, -0x1
    bn.exthz r22, r10
    bg.jal 0x21bd1e
    bt.mov r15, r3
    bg.bleui r14, 0xa, loc_2216fa
    bn.addi r7, r3, -0x1
    bn.exthz r12, r7
    bt.movi r14, 0x0
    bt.movi r13, 0x0
    bt.movi r11, 0x0
    bn.ori r17, r0, 0x20
loc_221586:
    bt.mov r3, r22
    bg.jal 0x22089f
    bn.sfeqi r16, 0x0
    bn.cmovi r3, 0x1, 0x2
    bn.addi r7, r22, 0x1
    bn.muls r3, r3, r7
    bn.exthz r3, r3
    bg.jal 0x21bd00
    bt.mov r3, r12
    bg.jal 0x220995
    bt.mov r3, r15
    bg.jal 0x21bd0a
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r10, 0x1090
    bg.ori r3, r10, 0x2f39
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23e152
    bt.movi r3, 0x1
    bg.jal 0x21d3b1
    bn.addi r3, r3, 0x12
    bt.mov r4, r11
    bt.movi r5, 0xf
    bg.jal 0x23dfe1
    bt.movi r3, 0x1
    bg.jal 0x21d3b1
    bn.addi r3, r3, 0x38
    bt.mov r4, r17
    bg.ori r5, r0, 0x3f0
    bg.jal 0x23e152
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
    bg.movhi r7, 0x45
    bg.sw_1 0x483c(r7), r0
    bg.ori r3, r10, 0x2f39
    bt.mov r4, r13
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.movhi r3, -0xf
    bg.ori r3, r3, 0x1518
    bt.mov r4, r14
    bt.movi r5, 0x8
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x21d3b1
    bt.addi r3, 0x7
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x80
    bg.jal 0x23dead
loc_221621:
    bn.lwz r22, 0x30(r1)
    bn.lwz r21, 0x34(r1)
    bn.lwz r20, 0x38(r1)
    bn.lwz r19, 0x3c(r1)
    bn.lwz r18, 0x40(r1)
    bn.lwz r17, 0x44(r1)
    bn.lwz r16, 0x48(r1)
    bn.lwz r15, 0x4c(r1)
    bn.lwz r14, 0x50(r1)
    bn.lwz r13, 0x54(r1)
    bn.lwz r12, 0x58(r1)
    bn.lwz r11, 0x5c(r1)
    bn.lwz r10, 0x60(r1)
    bn.lwz r9, 0x64(r1)
    bn.addi r1, r1, 0x68
    bt.jr r9
loc_221650:
    bn.addi r7, r14, -0x4
    bg.bleui r7, 0x3, loc_222024
loc_221657:
    bt.movi r3, 0x1
    bg.jal 0x222804
    bn.ori r12, r0, 0xb0
    bn.muls r3, r3, r12
    bg.movhi r11, 0x3b
    bg.addi r4, r11, 0x4950
    bt.add r3, r4
    bt.movi r10, 0x0
    bn.lh r3, 0x26(r3)
    bg.bnei r3, 0x0, loc_221fd5
loc_221676:
    bt.movi r3, 0x1
    bg.jal 0x222804
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r3, r4
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r3, 0x1, 0x2
    bn.muls r3, r10, r3
    bn.extbz r3, r3
    bg.jal 0x21fb61
    bn.extbz r6, r14
    bg.beqi r3, 0x0, loc_22143c
    bg.beqi r14, 0x5, loc_2216b1
    bg.bnei r14, 0xa, loc_22143c
loc_2216b1:
    bg.addi r7, r19, -0x564
    bg.sbz 0x89(r7), r0
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r18, 0x48
    bg.addi r8, r18, 0x21ec
    bt.add r3, r8
    bn.lh r3, 0x2a(r3)
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bt.movi r14, 0x0
    bn.j loc_221479
loc_2216dd:
    bg.bnei r16, 0x9, loc_221432
    bt.j loc_221621
loc_2216e3:
    bg.movhi r8, 0x3280
    bn.ori r8, r8, 0x2
    bn.add r3, r15, r8
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_2214d4
loc_2216fa:
    bn.slli r7, r14, 0x2
    bg.movhi r4, 0x2b
    bg.addi r4, r4, -0xa24
    bt.add r7, r4
    bn.lwz r7, 0x0(r7)
    bt.jr r7
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f21
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bt.movhi r3, -0xd
    bg.ori r3, r3, 0xd620
    bg.jal 0x22121f
    bn.addi r7, r15, -0x1
    bn.exthz r12, r7
    bt.movi r14, 0x0
    bt.movi r13, 0x1
    bt.movi r11, 0x0
    bn.ori r17, r0, 0x20
    bt.j loc_221586
    bn.movhi_2 r11, 0x1090
    bg.ori r3, r11, 0x2f21
    bt.movi r4, 0x1
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bt.movhi r3, -0xd
    bg.ori r3, r3, 0xd620
    bg.jal 0x22121f
    bn.ori r3, r0, 0x32
    bg.jal 0x2420bb
    bg.ori r3, r11, 0x2f68
    bg.jal 0x23dd44
    bt.mov r10, r3
    bg.ori r3, r11, 0x2f6c
    bg.jal 0x23dd44
    bn.andi r3, r3, 0xf
    bn.slli r3, r3, 0x8
    bn.or r10, r10, r3
    bn.exthz r22, r10
    bt.movi r14, 0x0
    bt.movi r13, 0x0
    bt.movi r11, 0x5
    bg.ori r15, r0, 0x1000
    bg.ori r12, r0, 0xfff
    bn.ori r17, r0, 0x20
    bt.j loc_221586
    bt.movi r14, 0x1
    bt.movi r13, 0x1
    bt.movi r11, 0x4
    bg.ori r15, r0, 0x7ff
    bg.ori r12, r0, 0x7fe
    bn.ori r17, r0, 0x20
    bn.j loc_221586
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f21
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x21e9ba
    bt.mov r10, r3
    bt.movi r3, 0x1
    bg.jal 0x21d7b1
    bt.mov r11, r3
    bt.movi r3, 0x1
    bg.jal 0x21d7b1
    bg.ori r7, r0, 0x870
    bn.muls r10, r10, r7
    bn.srli r11, r11, 0x1
    bn.exthz r11, r11
    bt.add r10, r11
    bn.divu r10, r10, r3
    bn.exthz r15, r10
    bn.ori r7, r0, 0xb0
    bn.muls r7, r17, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_222241
    bt.movi r3, 0x1
    bg.jal 0x21d7b1
    bt.mov r10, r3
    bt.movi r3, 0x1
    bg.jal 0x21d7b1
    bn.srli r10, r10, 0x1
    bn.exthz r10, r10
    bg.addi r10, r10, 0x6540
    bn.divs r10, r10, r3
    bn.exthz r10, r10
loc_22180d:
    bn.sub r10, r15, r10
    bt.addi r10, -0x2
    bn.exthz r10, r10
    bn.movhi_2 r11, 0xf90
    bg.ori r3, r11, 0x2faa
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bt.addi r10, -0x2
    bg.ori r3, r11, 0x2fa8
    bn.exthz r4, r10
    bg.jal 0x23dfb6
    bn.addi r7, r15, -0x1
    bn.exthz r12, r7
    bt.movi r14, 0x1
    bt.movi r13, 0x1
    bt.movi r11, 0x2
    bn.ori r17, r0, 0x20
    bn.j loc_221586
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f21
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bg.jal 0x21bd1e
    bt.mov r15, r3
loc_221856:
    bn.addi r7, r15, -0x1
    bn.exthz r12, r7
    bt.movi r14, 0x1
    bt.movi r13, 0x1
    bt.movi r11, 0x4
    bn.ori r17, r0, 0x20
    bn.j loc_221586
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bn.ori r14, r0, 0xa8
    bn.muls r3, r3, r14
    bg.addi r13, r18, 0x21ec
    bt.add r3, r13
    bn.lh r20, 0x1e(r3)
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bn.muls r3, r3, r14
    bt.add r3, r13
    bn.lh r21, 0x1a(r3)
    bg.addi r7, r19, -0x564
    bn.addi r11, r7, 0x7c
    bn.lh r15, 0x26(r11)
    bn.ori r10, r0, 0xb0
    bn.muls r10, r17, r10
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r10, r6
    bn.lbz r7, 0x20(r10)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.sw 0x4(r1), r7
    bt.movi r3, 0x1
    bg.jal 0x21e9ba
    bn.lbz r7, 0x20(r10)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.divs r3, r3, r7
    bn.exthz r12, r3
    bn.lbz r8, 0x70(r11)
    bg.bnei r8, 0x0, loc_221f9c
loc_2218d3:
    bt.movi r19, 0x6
loc_2218d5:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f1a
    bg.jal 0x23df85
    bg.ori r4, r0, 0xfff
    bn.and r11, r3, r4
    bg.beqi r12, 0x0, loc_222118
    bg.beqi r11, 0x0, loc_222118
loc_2218ef:
    bg.jal 0x21bd1e
    bt.addi r3, -0x1
    bg.beq r11, r3, loc_221907
    bn.exthz r3, r3
    bg.jal 0x220995
    bn.ori r3, r0, 0x32
    bg.jal 0x2420bb
loc_221907:
    bn.lwz r7, 0x4(r1)
    bn.divs r11, r15, r7
    bg.jal 0x21bd1e
    bt.mov r15, r3
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.movhi r10, 0x2090
    bg.ori r3, r10, 0x2f34
    bn.ori r4, r0, 0x6b
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x2f36
    bn.ori r4, r0, 0x70
    bg.jal 0x23dfb6
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
    bg.ori r6, r0, 0x3e8
    bn.muls r7, r20, r6
    bn.divu r5, r7, r15
    bn.sub r7, r11, r19
    bn.muls r7, r7, r6
    bn.divu r7, r7, r12
    bg.ble r7, r5, loc_222418
    bt.movi r7, 0x6
    bn.muls r7, r20, r7
    bn.divs r7, r7, r11
    bn.sub r7, r20, r7
    bn.addi r6, r11, 0x4
    bn.muls r6, r6, r15
    bn.divs r6, r6, r12
    bn.sub r7, r7, r6
    bt.add r7, r15
    bt.addi r7, -0xe
    bn.exthz r3, r7
loc_221972:
    bn.add r10, r3, r21
    bn.addi r4, r10, 0x7c
    bn.divs r7, r4, r15
    bn.muls r7, r7, r15
    bn.sub r4, r4, r7
    bn.movhi_2 r11, 0xf90
    bg.ori r3, r11, 0x2faa
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bn.addi r10, r10, 0x7a
    bn.divs r7, r10, r15
    bn.muls r7, r7, r15
    bn.sub r10, r10, r7
    bg.ori r3, r11, 0x2fa8
    bn.exthz r4, r10
    bg.jal 0x23dfb6
    bn.addi r7, r15, -0x1
    bn.exthz r12, r7
    bt.movi r14, 0x1
    bt.movi r13, 0x1
    bt.movi r11, 0x2
    bn.ori r17, r0, 0x40
    bn.j loc_221586
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f21
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x21be27
    bn.slli r4, r3, 0x2
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f20
    bn.andi r4, r4, 0xfc
    bn.ori r5, r0, 0x7c
    bg.jal 0x23dfe1
    bg.beqi r14, 0x7, loc_222278
loc_2219e4:
    bt.movi r3, 0x1
    bg.jal 0x21f782
    bg.jal 0x21bd1e
    bt.mov r15, r3
    bg.jal 0x21bd14
    bn.sfeqi r16, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.divs r3, r3, r7
    bt.addi r3, -0x1
    bn.exthz r22, r3
    bt.j loc_221856
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f21
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x222804
    bt.mov r14, r3
    bn.sh_1 0x2c(r1), r0
    bn.sh_2 0x2e(r1), r0
    bt.movhi r11, -0xf
    bg.ori r3, r11, 0x151c
    bg.jal 0x23dd44
    bt.mov r10, r3
    bg.ori r3, r11, 0x1519
    bg.jal 0x23dd44
    bn.andi r10, r10, 0xf
    bn.slli r10, r10, 0x4
    bn.andi r3, r3, 0xf
    bt.addi r3, 0x1
    bt.add r10, r3
    bn.extbz r13, r10
    bg.ori r3, r11, 0x151c
    bg.jal 0x23dd44
    bt.mov r10, r3
    bg.ori r3, r11, 0x1519
    bg.jal 0x23dd44
    bn.andi r3, r3, 0xf0
    bn.srai r3, r3, 0x4
    bt.movi r5, -0x10
    bn.and r10, r10, r5
    bt.addi r10, 0x1
    bt.add r3, r10
    bn.extbz r12, r3
    bn.ori r7, r0, 0xb0
    bn.muls r6, r14, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bn.lbz r7, 0x20(r6)
    bn.andi r7, r7, 0x10
    bn.beqi r7, 0x0, loc_221a91
    bn.lwz r7, 0x4(r6)
    bn.andi r7, r7, 0x20
    bn.bnei r7, 0x0, loc_221a91
    bn.slli r7, r12, 0x1
    bn.extbz r12, r7
loc_221a91:
    bn.ori r7, r0, 0xb0
    bn.muls r11, r14, r7
    bg.movhi r8, 0x3b
    bg.addi r8, r8, 0x4950
    bt.add r11, r8
    bn.lwz r6, 0x4(r11)
    bn.andi r7, r6, 0x8
    bg.bnei r7, 0x0, loc_2223e7
loc_221aab:
    bn.andi r7, r6, 0x20
    bg.beqi r7, 0x0, loc_22225f
    bn.lwz r3, 0x0(r11)
    bn.addi r4, r1, 0x2c
    bn.addi r5, r1, 0x2e
    bg.jal 0x20eb70
    bn.lbz r7, 0x70(r11)
    bn.sfeqi r7, 0x0
    bn.cmovi r6, 0x1, 0x2
    bn.lh r4, 0x2e(r1)
    bn.lh r5, 0x2c(r1)
    bn.muls r7, r4, r5
    bn.muls r7, r13, r7
    bn.divu r3, r7, r6
loc_221ad7:
    bn.divu r10, r3, r12
    bt.movhi r11, -0xf
    bg.ori r3, r11, 0x1532
    bn.extbz r4, r10
    bg.jal 0x23ddb9
    bn.srli r4, r10, 0x8
    bg.ori r3, r11, 0x1533
    bn.extbz r4, r4
    bg.jal 0x23ddb9
    bn.srli r10, r10, 0x10
    bg.ori r3, r11, 0x1534
    bg.ori r6, r0, 0x1ff
    bn.and r4, r10, r6
    bg.jal 0x23dfb6
    bg.ori r3, r11, 0x15fd
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.movi r14, 0x1
    bt.movi r13, 0x1
    bt.movi r11, 0x4
    bg.ori r15, r0, 0x8ef
    bg.ori r12, r0, 0x8ee
    bn.ori r17, r0, 0x20
    bn.j loc_221586
    bn.ori r7, r0, 0xb0
    bn.muls r10, r17, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r10, r7
    bn.lwz r7, 0x4(r10)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_2221fc
    bn.lwz r3, 0x0(r10)
    bn.addi r4, r1, 0x2e
    bn.addi r5, r1, 0x2c
    bg.jal 0x20eb70
loc_221b50:
    bg.addi r7, r19, -0x564
    bg.lhz r11, 0xa2(r7)
    bn.ori r7, r0, 0xb0
    bn.muls r10, r17, r7
    bg.movhi r8, 0x3b
    bg.addi r8, r8, 0x4950
    bt.add r10, r8
    bn.lbz r7, 0x20(r10)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r14, 0x1, 0x2
    bt.mov r3, r10
    bn.lwz r6, 0x4(r10)
    bn.andi r7, r6, 0x20
    bg.bnei r7, 0x0, loc_2221ed
    bn.andi r7, r6, 0xe
    bg.bnei r7, 0x0, loc_2221ed
    bn.lh r3, 0x2e(r1)
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x2ee0
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bn.lh r5, 0x22(r10)
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.mov r12, r3
loc_221ba1:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r17, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lh r7, 0x22(r7)
    bg.beqi r7, 0x0, loc_2220ed
    bn.lh r13, 0x2e(r1)
    bg.beqi r13, 0x0, loc_2220ed
    bn.lh r6, 0x2c(r1)
    bg.beqi r6, 0x0, loc_2220ed
    bg.beqi r12, 0x0, loc_2220ed
    bn.divs r7, r11, r14
    bg.beqi r7, 0x0, loc_2220ed
    bn.sfnei r16, 0x0
    bn.cmovi r14, 0x2, 0x1
    bt.mov r10, r7
    bt.movi r11, 0x0
    bt.mov r3, r6
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x870
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r10
    bt.mov r6, r11
    bg.jal 0x2ab331
    bn.exthz r3, r3
    bg.ori r5, r0, 0x870
    bt.movi r6, 0x0
    bg.sfleui r3, 0x8f1
    bn.bnf loc_221c13
    bg.ori r7, r0, 0x8f2
    bn.sub r7, r7, r3
    bn.exthz r7, r7
    bg.addi r7, r7, 0x870
    bt.mov r5, r7
    bt.movi r6, 0x0
loc_221c13:
    bt.mov r20, r12
    bt.movi r21, 0x0
    bt.mov r3, r12
    bt.mov r4, r21
    bg.jal 0x2aacb9
    bn.sw 0x10(r1), r3
    bn.sw 0x14(r1), r4
    bt.mov r5, r13
    bt.movi r6, 0x0
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aacb9
    bt.mov r12, r3
    bt.mov r13, r4
    bn.lwz r3, 0x10(r1)
    bn.lwz r4, 0x14(r1)
    bg.ori r5, r0, 0x13a0
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r12
    bt.mov r6, r13
    bg.jal 0x2ab331
    bn.sw 0x8(r1), r3
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0xa6b0
    bn.sfgtu r6, r3
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r7, r7
    bt.movhi r8, 0xa
    bg.ori r8, r8, 0xc5d0
    bn.sfleu r3, r8
    bn.bf loc_222525
    bg.bnei r7, 0x0, loc_2225dc
    bn.sw 0x18(r1), r3
    bt.movi r6, 0x0
    bn.sw 0x1c(r1), r6
    bg.ori r14, r0, 0x13a0
loc_221c7b:
    bg.jal 0x22121f
    bn.sfeqi r16, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.divs r7, r14, r7
    bt.addi r7, -0x1
    bn.exthz r22, r7
    bn.lh r7, 0x2e(r1)
    bn.sw 0x24(r1), r7
    bt.mov r12, r7
    bt.movi r13, 0x0
    bt.mov r3, r7
    bt.mov r4, r13
    bg.ori r5, r0, 0x3e8
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r3
    bt.mov r6, r4
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aacb9
    bt.mov r5, r20
    bt.mov r6, r21
    bg.jal 0x2ab331
    bt.mov r18, r3
    bt.mov r10, r14
    bt.movi r11, 0x0
    bt.mov r3, r14
    bt.mov r4, r11
    bn.movhi_2 r5, 0x20
    bg.ori r5, r5, 0xf580
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bn.lwz r5, 0x18(r1)
    bn.lwz r6, 0x1c(r1)
    bg.jal 0x2ab331
    bg.beqi r3, 0x0, loc_2225af
    bg.beqi r18, 0x0, loc_2225af
    bt.movi r14, 0xa
    bt.movi r5, 0x6
    bn.sw 0x20(r1), r5
    bg.ble r18, r3, loc_221d20
    bt.mov r5, r18
    bt.movi r6, 0x0
    bt.mov r7, r3
    bt.movi r8, 0x0
    bt.mov r3, r20
    bt.mov r4, r21
    bn.sub r5, r5, r7
    bn.subb r6, r6, r8
    bg.jal 0x2aacb9
    bt.mov r5, r12
    bt.mov r6, r13
    bg.jal 0x2ab331
    bg.ori r5, r0, 0x3e8
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.addi r3, 0xa
    bn.exthz r14, r3
    bn.addi r6, r14, -0x4
    bn.sw 0x20(r1), r6
loc_221d20:
    bt.mov r3, r20
    bt.mov r4, r21
    bt.mov r5, r10
    bt.mov r6, r11
    bg.jal 0x2aacb9
    bt.mov r17, r3
    bt.mov r18, r4
    bn.ori r5, r0, 0x70
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bn.lwz r7, 0x24(r1)
    bn.lwz r8, 0x8(r1)
    bn.muls r5, r7, r8
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bn.exthz r3, r3
    bg.ori r15, r0, 0x8f1
    bt.movi r11, 0x4
    bn.lwz r4, 0x20(r1)
    bg.bgts r3, r4, loc_221da1
    bn.sub r7, r14, r3
    bn.exthz r11, r7
    bn.sfgtui r11, 0x3f
    bn.bnf loc_221da1
    bn.addi r10, r11, -0x3f
    bn.srai r11, r10, 0x1f
    bt.mov r3, r12
    bt.mov r4, r13
    bn.lwz r5, 0x18(r1)
    bn.lwz r6, 0x1c(r1)
    bg.jal 0x2aacb9
    bt.mov r5, r3
    bt.mov r6, r4
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aacb9
    bt.mov r5, r17
    bt.mov r6, r18
    bg.jal 0x2ab331
    bg.addi r3, r3, 0x8f1
    bn.exthz r15, r3
    bn.ori r11, r0, 0x3f
    bg.sfgti r15, 0x1fff
    bn.bnf loc_221da1
    bg.ori r15, r0, 0x1fff
loc_221da1:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f21
    bt.movi r4, 0x1
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.movhi r10, 0x2090
    bg.ori r3, r10, 0x2f34
    bn.ori r4, r0, 0x6b
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x2f36
    bn.ori r4, r0, 0x70
    bg.jal 0x23dfb6
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0xf90
    bg.ori r3, r3, 0x2fa8
    bg.ori r4, r0, 0x8ee
    bg.jal 0x23dfb6
    bt.movi r3, 0x1
    bg.jal 0x21d3b1
    bn.addi r3, r3, 0x12
    bt.movi r4, 0x2
    bt.movi r5, 0xf
    bg.jal 0x23dfe1
    bt.movhi r10, -0xf
    bg.ori r3, r10, 0x1519
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x151c
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bn.addi r7, r15, -0x1
    bn.exthz r12, r7
    bn.slli r7, r11, 0x4
    bn.exthz r17, r7
    bt.movi r14, 0x0
    bt.movi r13, 0x1
    bt.movi r11, 0x2
    bn.j loc_221586
    bg.addi r7, r19, -0x564
    bg.lhz r19, 0xa2(r7)
    bn.ori r7, r0, 0xb0
    bn.muls r7, r17, r7
    bg.movhi r11, 0x3b
    bg.addi r5, r11, 0x4950
    bt.add r7, r5
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r18, 0x1, 0x2
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lh r14, 0x1e(r3)
    bt.movi r3, 0x0
    bt.movi r4, 0x1
    bg.jal 0x220a8b
    bn.ori r3, r0, 0x64
    bg.jal 0x24209d
    bt.movhi r3, -0xf
    bg.ori r3, r3, 0x1542
    bg.jal 0x23e18c
    bt.mov r12, r3
    bn.bnei r3, 0x0, loc_221ea3
    bg.movhi r13, 0x45
    bg.addi r7, r0, 0x1f4
    bg.sw_1 0x5208(r13), r7
    bt.movhi r10, -0xf
loc_221e8e:
    bg.lhz r7, 0x5208(r13)
    bg.beqi r7, 0x0, loc_222456
    bg.ori r3, r10, 0x1542
    bg.jal 0x23e18c
    bt.mov r12, r3
    bn.beqi r3, 0x0, loc_221e8e
loc_221ea3:
    bn.ori r7, r0, 0xb0
    bn.muls r3, r17, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x4(r3)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_22222c
    bn.lwz r3, 0x0(r3)
    bn.addi r4, r1, 0x2e
    bn.addi r5, r1, 0x2c
    bg.jal 0x20eb70
    bn.lh r7, 0x2e(r1)
    bn.sfeqi r16, 0x0
    bn.cmovi r6, 0x1, 0x2
    bn.divs r7, r7, r6
    bn.sh_2 0x2e(r1), r7
loc_221ed9:
    bn.ori r15, r0, 0xd0
    bt.movi r13, 0x9
    bn.bnei r16, 0x0, loc_221ee7
    bn.ori r15, r0, 0xa0
    bn.ori r13, r0, 0x13
loc_221ee7:
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f3d
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.movi r11, 0x0
    bn.lh r3, 0x2c(r1)
    bt.movi r4, 0x0
    bn.movhi_2 r5, 0x971
    bg.ori r5, r5, 0xe000
    bt.movi r6, 0xe
    bg.jal 0x2aacb9
    bt.mov r5, r3
    bt.mov r6, r4
    bt.mov r3, r14
    bt.mov r4, r11
    bg.jal 0x2aacb9
    bt.mov r5, r12
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bn.divs r5, r19, r18
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bg.ori r5, r0, 0x3e8
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bg.jal 0x22121f
    bt.movhi r10, -0xf
    bg.ori r3, r10, 0x1532
    bn.lbz r4, 0x2e(r1)
    bg.jal 0x23ddb9
    bn.lh r4, 0x2e(r1)
    bg.ori r3, r10, 0x1533
    bn.srli r4, r4, 0x8
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x1534
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x1536
    bt.mov r4, r15
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x1537
    bt.mov r4, r13
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x1538
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x15e1
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.movi r14, 0x1
    bt.movi r13, 0x0
    bt.movi r11, 0x4
    bg.ori r15, r0, 0x8ef
    bg.ori r12, r0, 0x8ee
    bn.ori r17, r0, 0x10
    bn.j loc_221586
loc_221f9c:
    bn.lh r10, 0x22(r11)
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bn.muls r3, r3, r14
    bt.add r3, r13
    bn.lh r3, 0xa(r3)
    bg.ble r10, r3, loc_2218d3
    bn.lh r10, 0x22(r11)
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bn.muls r3, r3, r14
    bg.movhi r13, 0x48
    bg.addi r13, r13, 0x21ec
    bt.add r3, r13
    bn.lh r3, 0xa(r3)
    bn.sub r10, r10, r3
    bt.addi r10, 0x6
    bn.exthz r19, r10
    bn.j loc_2218d5
loc_221fd5:
    bt.movi r3, 0x1
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.addi r5, r11, 0x4950
    bt.add r3, r5
    bg.ori r18, r0, 0x3e8
    bn.lh r3, 0x22(r3)
    bg.bnei r3, 0x0, loc_2220b2
loc_221fef:
    bt.movi r3, 0x1
    bg.jal 0x222804
    bn.ori r12, r0, 0xb0
    bn.muls r3, r3, r12
    bg.addi r11, r11, 0x4950
    bt.add r3, r11
    bn.lh r10, 0x26(r3)
    bn.srli r10, r10, 0x1
    bt.add r10, r18
    bt.movi r3, 0x1
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bt.add r3, r11
    bn.lh r7, 0x26(r3)
    bn.divu r10, r10, r7
    bt.addi r10, 0x5
    bt.movi r7, 0xa
    bn.divu r10, r10, r7
    bn.j loc_221676
loc_222024:
    bg.jal 0x21bd14
    bt.mov r10, r3
    bt.movi r11, 0x0
    bg.jal 0x21bd1e
    bt.mov r5, r3
    bt.movi r6, 0x0
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aacb9
    bt.mov r10, r3
    bt.mov r11, r4
    bg.jal 0x21fb2b
    bt.mov r5, r3
    bt.movi r6, 0x0
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aacb9
    bg.ori r5, r0, 0x3e8
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bg.movhi r5, 0xfff5
    bg.ori r5, r5, 0x3a30
    bn.add r7, r3, r5
    bt.movhi r8, 0xc
    bg.ori r8, r8, 0xe0e0
    bn.sfleu r7, r8
    bn.bf loc_2220a7
    bt.movi r14, 0x0
    bn.j loc_221657
loc_222076:
    bg.beqi r14, 0x0, loc_221621
    bn.j loc_2214dc
loc_22207d:
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x21
    bn.add r3, r15, r7
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x80
    bg.jal 0x23dead
    bn.j loc_22148b
loc_222092:
    bn.movhi_2 r8, 0x1080
    bn.ori r8, r8, 0x21
    bn.add r3, r15, r8
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dead
    bn.j loc_22148b
loc_2220a7:
    bg.beqi r3, 0x0, loc_221657
    bg.jal 0x22121f
    bn.j loc_221657
loc_2220b2:
    bt.movi r3, 0x1
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.addi r6, r11, 0x4950
    bt.add r3, r6
    bn.lh r10, 0x22(r3)
    bn.srli r10, r10, 0x1
    bt.movhi r7, 0x1
    bg.ori r7, r7, 0xd4c0
    bt.add r10, r7
    bt.movi r3, 0x1
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.addi r8, r11, 0x4950
    bt.add r3, r8
    bn.lh r7, 0x22(r3)
    bn.divu r10, r10, r7
    bg.ori r7, r0, 0x3e8
    bn.muls r18, r10, r7
    bt.j loc_221fef
loc_2220ed:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r17, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r8, 0x1c(r7)
    bn.ori r6, r8, 0x1
    bn.sbz 0x1c(r7), r6
loc_222106:
    bn.addi r7, r15, -0x1
    bn.exthz r12, r7
    bt.movi r14, 0x0
    bt.movi r13, 0x1
    bt.movi r11, 0x2
    bn.ori r17, r0, 0x20
    bn.j loc_221586
loc_222118:
    bg.movhi r13, 0x45
    bg.addi r7, r0, 0x1f4
    bg.sw_1 0x5208(r13), r7
    bn.ori r7, r0, 0xb0
    bn.muls r10, r17, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r10, r5
    bn.movhi_2 r14, 0x1090
loc_222137:
    bg.lhz r7, 0x5208(r13)
    bn.beqi r7, 0x0, loc_22216b
    bt.movi r3, 0x1
    bg.jal 0x21e9ba
    bn.lbz r7, 0x20(r10)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.divs r3, r3, r7
    bn.exthz r12, r3
    bg.ori r3, r14, 0x2f1a
    bg.jal 0x23df85
    bg.ori r6, r0, 0xfff
    bn.and r11, r3, r6
    bn.beqi r12, 0x0, loc_222137
    bn.beqi r11, 0x0, loc_222137
loc_22216b:
    bn.beqi r12, 0x0, loc_222172
    bg.bnei r11, 0x0, loc_2218ef
loc_222172:
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bn.ori r11, r0, 0xa8
    bn.muls r3, r3, r11
    bg.addi r10, r18, 0x21ec
    bt.add r3, r10
    bn.lbz r12, 0x2f(r3)
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bn.muls r3, r3, r11
    bt.add r3, r10
    bn.lbz r10, 0x2a(r3)
    bn.movhi_2 r3, 0x1090
    bg.ori r3, r3, 0x2f21
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bg.jal 0x21bd1e
    bt.mov r15, r3
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bt.movi r4, 0x0
    bg.jal 0x23e709
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.beqi r12, 0x4, loc_222484
    bn.movhi_2 r3, 0x1290
    bg.ori r3, r3, 0x2f0f
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
loc_2221d3:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x23e13b
    bn.addi r7, r15, -0x1
    bn.exthz r12, r7
    bt.movi r14, 0x1
    bt.movi r13, 0x1
    bt.movi r11, 0x4
    bn.ori r17, r0, 0x40
    bn.j loc_221586
loc_2221ed:
    bn.lwz r3, 0x0(r3)
    bg.jal 0x20e990
    bt.movi r7, 0xa
    bn.muls r12, r3, r7
    bn.j loc_221ba1
loc_2221fc:
    bt.movi r3, 0x1
    bg.jal 0x21d913
    bn.lbz r7, 0x70(r10)
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.muls r7, r7, r3
    bn.sh_2 0x2e(r1), r7
    bt.movi r3, 0x1
    bg.jal 0x21e9ba
    bn.lbz r7, 0x20(r10)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.divs r3, r3, r7
    bn.sh_1 0x2c(r1), r3
    bn.j loc_221b50
loc_22222c:
    bt.movi r3, 0x1
    bg.jal 0x21d913
    bn.sh_2 0x2e(r1), r3
    bt.movi r3, 0x1
    bg.jal 0x21e9ba
    bn.sh_1 0x2c(r1), r3
    bn.j loc_221ed9
loc_222241:
    bt.movi r3, 0x1
    bg.jal 0x21d7b1
    bt.mov r10, r3
    bt.movi r3, 0x1
    bg.jal 0x21d7b1
    bg.addi r10, r10, 0x6540
    bn.slli r3, r3, 0x1
    bn.divs r10, r10, r3
    bn.exthz r10, r10
    bn.j loc_22180d
loc_22225f:
    bt.movi r3, 0x1
    bg.jal 0x21d913
    bt.mov r10, r3
    bt.movi r3, 0x1
    bg.jal 0x21e9ba
    bt.addi r10, 0x1
    bn.muls r10, r10, r3
    bn.muls r3, r13, r10
    bn.j loc_221ad7
loc_222278:
    bg.bnei r16, 0x0, loc_2224c8
    bt.movi r22, 0x1
    bt.movi r21, 0x1
    bg.ori r8, r0, 0x1180
    bn.sw 0xc(r1), r8
    bg.ori r20, r0, 0x13a0
    bt.movhi r7, -0xd
    bg.ori r19, r7, 0xd620
loc_222291:
    bn.ori r7, r0, 0xb0
    bn.muls r10, r17, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r10, r5
    bn.lwz r7, 0x4(r10)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_222498
    bn.lwz r3, 0x0(r10)
    bn.addi r4, r1, 0x2c
    bn.addi r5, r1, 0x2e
    bg.jal 0x20eb70
loc_2222b8:
    bn.ori r7, r0, 0xb0
    bn.muls r10, r17, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r10, r6
    bn.lwz r6, 0x4(r10)
    bn.andi r7, r6, 0x20
    bg.bnei r7, 0x0, loc_222445
    bn.andi r7, r6, 0xe
    bg.bnei r7, 0x0, loc_222445
    bn.lh r11, 0x2c(r1)
    bt.mov r3, r11
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x2ee0
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bn.lh r5, 0x22(r10)
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.mov r18, r3
loc_2222f5:
    bg.beqi r11, 0x0, loc_2223fc
    bn.lh r7, 0x2e(r1)
    bg.beqi r7, 0x0, loc_2223fc
    bg.beqi r18, 0x0, loc_2223fc
    bt.movhi r10, -0xf
    bg.ori r3, r10, 0x151c
    bg.jal 0x23dd44
    bt.mov r11, r3
    bg.ori r3, r10, 0x1519
    bg.jal 0x23dd44
    bt.mov r12, r3
    bg.ori r3, r10, 0x151c
    bg.jal 0x23dd44
    bt.mov r13, r3
    bg.ori r3, r10, 0x1519
    bg.jal 0x23dd44
    bt.mov r10, r3
    bn.lh r3, 0x2c(r1)
    bt.movi r4, 0x0
    bn.lh r5, 0x2e(r1)
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r14, r3
    bt.mov r15, r4
    bt.mov r3, r19
    bt.movi r4, 0x0
    bn.andi r11, r11, 0xf
    bn.slli r11, r11, 0x4
    bn.andi r12, r12, 0xf
    bt.addi r12, 0x1
    bt.add r11, r12
    bn.extbz r5, r11
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r3
    bt.mov r6, r4
    bt.mov r3, r14
    bt.mov r4, r15
    bg.jal 0x2aacb9
    bt.mov r11, r3
    bt.mov r12, r4
    bt.mov r3, r18
    bt.movi r4, 0x0
    bn.andi r10, r10, 0xf0
    bn.srai r10, r10, 0x4
    bt.movi r5, -0x10
    bn.and r13, r13, r5
    bt.addi r13, 0x1
    bt.add r10, r13
    bn.extbz r5, r10
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r3
    bt.mov r6, r4
    bt.mov r3, r11
    bt.mov r4, r12
    bg.jal 0x2ab331
    bg.movhi r7, 0x45
    bg.lhz r6, 0x4830(r7)
    bg.beqi r6, 0x0, loc_2224f4
    bg.movhi r7, 0x45
    bg.lhz r7, 0x4832(r7)
    bg.bnei r7, 0x0, loc_2219e4
    bn.divs r7, r6, r21
    bt.addi r7, 0x3
    bg.ori r6, r0, 0xfffc
    bn.and r6, r7, r6
    bn.sw 0xc(r1), r6
    bn.divu r7, r3, r6
    bn.exthz r10, r7
    bg.sfleui r10, 0x8ee
    bn.bf loc_2225f5
    bg.sfgti r10, 0x1fff
    bn.bnf loc_2223d1
loc_2223cd:
    bg.ori r10, r0, 0x1fff
loc_2223d1:
    bn.lwz r4, 0xc(r1)
    bn.muls r3, r4, r22
    bn.exthz r3, r3
    bg.jal 0x21bd00
    bt.mov r3, r10
    bg.jal 0x21bd0a
    bn.j loc_2219e4
loc_2223e7:
    bn.lwz r3, 0x0(r11)
    bg.jal 0x20ebba
    bt.addi r3, 0x1
    bn.muls r3, r13, r3
    bn.extbz r13, r3
    bn.lwz r6, 0x4(r11)
    bn.j loc_221aab
loc_2223fc:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r17, r7
    bg.movhi r8, 0x3b
    bg.addi r8, r8, 0x4950
    bt.add r7, r8
    bn.lbz r4, 0x1c(r7)
    bn.ori r6, r4, 0x1
    bn.sbz 0x1c(r7), r6
    bn.j loc_2219e4
loc_222418:
    bn.muls r7, r11, r6
    bn.divu r7, r7, r12
    bg.ble r7, r5, loc_2224e0
    bn.addi r6, r19, 0x4
    bn.muls r6, r15, r6
    bn.divu r6, r6, r12
    bn.sub r6, r15, r6
    bn.muls r7, r11, r15
    bn.divs r7, r7, r12
    bn.sub r7, r7, r20
    bn.extbz r7, r7
    bn.sub r6, r6, r7
    bt.addi r6, -0xc
    bn.exthz r3, r6
    bn.j loc_221972
loc_222445:
    bn.lwz r3, 0x0(r10)
    bg.jal 0x20e990
    bt.movi r7, 0xa
    bn.muls r18, r3, r7
    bn.lh r11, 0x2c(r1)
    bt.j loc_2222f5
loc_222456:
    bg.bnei r12, 0x0, loc_221ea3
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bg.jal 0x21fac9
    bt.movi r7, 0xa
    bn.divu r3, r3, r7
    bn.exthz r3, r3
    bn.movhi_2 r7, 0xb7
    bg.ori r10, r7, 0x1b00
    bn.divu r12, r10, r3
    bg.bnei r12, 0x0, loc_221ea3
    bg.jal 0x21fb2b
    bn.divu r12, r10, r3
    bn.j loc_221ea3
loc_222484:
    bn.movhi_2 r3, 0x1290
    bg.ori r3, r3, 0x2f0f
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0xe0
    bg.jal 0x23dfe1
    bn.j loc_2221d3
loc_222498:
    bt.movi r3, 0x1
    bg.jal 0x21d913
    bn.lbz r7, 0x70(r10)
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.muls r7, r7, r3
    bn.sh_1 0x2c(r1), r7
    bt.movi r3, 0x1
    bg.jal 0x21e9ba
    bn.lbz r7, 0x20(r10)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.divs r3, r3, r7
    bn.sh_2 0x2e(r1), r3
    bn.j loc_2222b8
loc_2224c8:
    bt.movi r22, 0x2
    bt.movi r21, 0x2
    bg.ori r4, r0, 0x8c0
    bn.sw 0xc(r1), r4
    bg.ori r20, r0, 0x9d0
    bt.movhi r7, 0x9
    bg.ori r19, r7, 0xeb10
    bn.j loc_222291
loc_2224e0:
    bn.addi r7, r19, 0x4
    bn.muls r7, r15, r7
    bn.divu r7, r7, r12
    bn.sub r7, r15, r7
    bt.addi r7, -0xc
    bn.exthz r3, r7
    bn.j loc_221972
loc_2224f4:
    bg.ori r7, r0, 0xfffc
    bn.and r6, r20, r7
    bg.movhi r7, 0x45
    bg.lhz r10, 0x4832(r7)
    bg.beqi r10, 0x0, loc_2225fc
    bn.divu r7, r3, r10
    bt.addi r7, 0x3
    bg.ori r8, r0, 0xfffc
    bn.and r3, r7, r8
    bn.lwz r4, 0xc(r1)
    bg.bgt r4, r3, loc_2223d1
    bn.sfleu r3, r6
    bn.cmov_0 r3, r3, r6
    bn.sw 0xc(r1), r3
    bt.j loc_2223d1
loc_222525:
    bg.bnei r7, 0x0, loc_2225dc
    bt.movhi r7, 0xa
    bg.ori r7, r7, 0xc5d0
    bn.sw 0x8(r1), r7
    bt.movhi r5, 0xa
    bg.ori r5, r5, 0xc5d0
    bt.movi r6, 0x0
    bn.sw 0x18(r1), r5
    bn.sw 0x1c(r1), r6
loc_222540:
    bt.mov r3, r12
    bt.mov r4, r13
    bn.lwz r5, 0x18(r1)
    bn.lwz r6, 0x1c(r1)
    bg.jal 0x2aacb9
    bn.lwz r5, 0x10(r1)
    bn.lwz r6, 0x14(r1)
    bg.jal 0x2ab331
    bn.exthz r3, r3
    bg.ori r7, r0, 0x1180
    bt.movi r6, 0x0
    bg.sfgti r3, 0x1180
    bn.bnf loc_22256c
    bt.mov r7, r3
    bt.movi r6, 0x1
loc_22256c:
    bn.divs r7, r7, r14
    bt.addi r7, 0x3
    bt.movi r8, -0x4
    bn.and r7, r7, r8
    bn.muls r7, r14, r7
    bn.exthz r14, r7
    bg.sfleui r14, 0x139f
    bg.ori r7, r0, 0x13a0
    bn.cmov_0 r14, r14, r7
    bn.lwz r3, 0x8(r1)
    bg.bnei r6, 0x0, loc_221c7b
    bg.addi r7, r19, -0x564
    bg.sbz 0x89(r7), r0
    bt.movhi r10, -0xf
    bg.ori r3, r10, 0x1519
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x151c
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bn.j loc_222106
loc_2225af:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r17, r7
    bg.movhi r8, 0x3b
    bg.addi r8, r8, 0x4950
    bt.add r7, r8
    bn.lbz r4, 0x1c(r7)
    bn.ori r6, r4, 0x1
    bn.sbz 0x1c(r7), r6
    bt.movi r14, 0x0
    bt.movi r13, 0x1
    bt.movi r11, 0x2
    bg.ori r15, r0, 0x8f1
    bg.ori r12, r0, 0x8f0
    bn.ori r17, r0, 0x20
    bn.j loc_221586
loc_2225dc:
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0xa6b0
    bn.sw 0x8(r1), r7
    bt.movhi r4, -0x9
    bg.ori r4, r4, 0xa6b0
    bt.movi r5, 0x0
    bn.sw 0x18(r1), r4
    bn.sw 0x1c(r1), r5
    bt.j loc_222540
loc_2225f5:
    bg.ori r10, r0, 0x8ef
    bn.j loc_2223d1
loc_2225fc:
    bn.lwz r5, 0xc(r1)
    bn.divu r7, r3, r5
    bn.exthz r10, r7
    bg.sfleui r10, 0x8ee
    bn.bf loc_2225f5
    bg.sfleui r10, 0x1fff
    bn.bf loc_2223d1
    bg.ori r7, r0, 0x1fff
    bn.divu r7, r3, r7
    bt.addi r7, 0x3
    bg.ori r8, r0, 0xfffc
    bn.and r8, r7, r8
    bn.sw 0xc(r1), r8
    bg.ble r8, r6, loc_2223cd
    bn.sw 0xc(r1), r6
    bg.ori r10, r0, 0x1fff
    bn.j loc_2223d1
