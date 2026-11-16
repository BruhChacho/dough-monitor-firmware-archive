# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21859c,0x218a2a); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bn.sw 0x24(r1), r12
    bn.sw 0x20(r1), r13
    bn.sw 0x1c(r1), r14
    bn.sw 0x18(r1), r15
    bn.sw 0x14(r1), r16
    bn.sw 0x10(r1), r17
    bn.sw 0xc(r1), r18
    bn.sw 0x8(r1), r22
    bn.addi r22, r1, 0x34
    bt.mov r10, r4
    bt.mov r11, r5
    bt.mov r17, r6
    bt.mov r18, r1
    bn.addi r7, r5, 0xe
    bg.ori r6, r0, 0x1f8
    bn.and r7, r7, r6
    bn.sub r1, r1, r7
    bt.mov r13, r1
    bg.jal 0x211874
    bt.mov r14, r3
    bn.beqi r11, 0x0, loc_2185f5
    bt.movi r6, 0x0
loc_2185e5:
    bn.add r7, r13, r6
    bn.sbz 0x0(r7), r0
    bn.addi r7, r6, 0x1
    bn.extbz r6, r7
    bg.bne r11, r6, loc_2185e5
loc_2185f5:
    bg.sfeqi r10, 0x81
    bn.bf loc_2186c7
    bg.sfgti r10, 0x81
    bn.bnf loc_21866a
    bg.sfeqi r10, 0x85
    bn.bf loc_218776
    bg.sfgti r10, 0x85
    bn.bnf loc_218736
    bg.sfeqi r10, 0x87
    bn.bf loc_2189a8
    bg.sfleui r10, 0x86
    bn.bnf loc_218826
    bn.sfleui r11, 0x1d
    bn.ori r7, r0, 0x1d
    bn.cmov_0 r7, r11, r7
    bn.extbz r16, r7
    bn.addi r15, r16, 0x1
    bt.mov r5, r16
    bg.blesi r15, 0x0, loc_2186fa
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x3180
    bn.add r10, r14, r6
    bt.movi r12, 0x0
    bt.movi r11, 0x0
    bt.j loc_218655
loc_218643:
    bn.add r7, r11, r13
    bn.sbz -0x1(r7), r3
loc_218649:
    bn.addi r7, r12, 0x1
    bn.extbz r11, r7
    bt.mov r12, r11
    bg.bles r15, r11, loc_2188ca
loc_218655:
    bn.add r3, r10, r11
    bg.jal 0x23dd44
    bn.andi r7, r11, 0x1
    bn.bnei r7, 0x0, loc_218643
    bn.add r7, r11, r13
    bn.sbz 0x1(r7), r3
    bt.j loc_218649
loc_21866a:
    bg.beqi r10, 0x4, loc_2187a8
    bg.bleui r10, 0x4, loc_21872a
    bg.beqi r10, 0x6, loc_218971
    bg.bleui r10, 0x5, loc_2187de
    bg.bnei r10, 0xa, loc_218732
    bn.sfleui r11, 0x15
    bn.ori r7, r0, 0x15
    bn.cmov_0 r7, r11, r7
    bn.extbz r12, r7
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x300f
    bn.add r3, r14, r7
    bn.ori r4, r0, 0x30
    bn.ori r5, r0, 0x30
    bg.jal 0x23dfe1
    bg.beqi r12, 0x0, loc_218732
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x3040
    bn.add r10, r14, r6
    bt.movi r11, 0x0
loc_2186ac:
    bn.add r3, r10, r11
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_2186ac
    bt.mov r5, r12
    bt.j loc_2186fa
loc_2186c7:
    bn.sfleui r11, 0x1d
    bn.ori r7, r0, 0x1d
    bn.cmov_0 r7, r11, r7
    bn.extbz r11, r7
    bn.beqi r11, 0x0, loc_218732
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x3060
    bn.add r12, r14, r7
    bt.movi r10, 0x0
loc_2186e1:
    bn.add r3, r10, r12
    bg.jal 0x23dd44
    bn.add r7, r13, r10
    bn.sbz 0x0(r7), r3
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bg.bne r11, r10, loc_2186e1
    bt.mov r5, r11
loc_2186fa:
    bt.mov r3, r17
    bt.mov r4, r13
    bg.jal 0x2aab1e
    bt.mov r1, r18
    bn.lwz r22, 0x8(r1)
    bn.lwz r18, 0xc(r1)
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
loc_21872a:
    bg.beqi r10, 0x1, loc_2188ce
    bg.beqi r10, 0x3, loc_218897
loc_218732:
    bt.movi r5, 0x0
    bt.j loc_2186fa
loc_218736:
    bg.sfeqi r10, 0x83
    bn.bf loc_2189f3
    bg.sfgti r10, 0x83
    bn.bnf loc_218864
    bn.sfleui r11, 0x5
    bn.cmovsi_2 r7, r11, 0x5
    bn.extbz r12, r7
    bn.beqi r12, 0x0, loc_218732
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x30a8
    bn.add r10, r14, r6
    bt.movi r11, 0x0
loc_21875b:
    bn.add r3, r11, r10
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_21875b
    bt.mov r5, r12
    bt.j loc_2186fa
loc_218776:
    bn.sfleui r11, 0x5
    bn.cmovsi_2 r7, r11, 0x5
    bn.extbz r12, r7
    bn.beqi r12, 0x0, loc_218732
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x30ae
    bn.add r10, r14, r7
    bt.movi r11, 0x0
loc_21878d:
    bn.add r3, r10, r11
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_21878d
    bt.mov r5, r12
    bt.j loc_2186fa
loc_2187a8:
    bn.sfleui r11, 0x10
    bn.ori r7, r0, 0x10
    bn.cmov_0 r7, r11, r7
    bn.extbz r12, r7
    bg.beqi r12, 0x0, loc_218732
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x302e
    bn.add r10, r14, r7
    bt.movi r11, 0x0
loc_2187c3:
    bn.add r3, r10, r11
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_2187c3
    bt.mov r5, r12
    bt.j loc_2186fa
loc_2187de:
    bn.sfleui r11, 0x10
    bn.ori r7, r0, 0x10
    bn.cmov_0 r7, r11, r7
    bn.extbz r12, r7
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x300f
    bn.add r3, r14, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dfe1
    bg.beqi r12, 0x0, loc_218732
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x3040
    bn.add r10, r14, r7
    bt.movi r11, 0x0
loc_21880b:
    bn.add r3, r11, r10
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_21880b
    bt.mov r5, r12
    bt.j loc_2186fa
loc_218826:
    bg.sfeqi r10, 0xe0
    bn.bnf loc_218732
    bn.sfleui r11, 0x5
    bn.cmovsi_2 r7, r11, 0x5
    bn.extbz r12, r7
    bg.beqi r12, 0x0, loc_218732
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x30b4
    bn.add r10, r14, r6
    bt.movi r11, 0x0
loc_218845:
    bn.add r3, r11, r10
    bg.jal 0x23dd44
    bg.jal 0x2118b2
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_218845
    bt.mov r5, r12
    bt.j loc_2186fa
loc_218864:
    bn.sfleui r11, 0xd
    bn.cmovsi_2 r7, r11, 0xd
    bn.extbz r12, r7
    bg.beqi r12, 0x0, loc_218732
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x3080
    bn.add r10, r14, r6
    bt.movi r11, 0x0
loc_21887c:
    bn.add r3, r10, r11
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_21887c
    bt.mov r5, r12
    bt.j loc_2186fa
loc_218897:
    bn.sfleui r11, 0x2
    bn.cmovsi_2 r7, r11, 0x2
    bn.extbz r12, r7
    bg.beqi r12, 0x0, loc_218732
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x302a
    bn.add r10, r14, r6
    bt.movi r11, 0x0
loc_2188af:
    bn.add r3, r11, r10
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_2188af
    bt.mov r5, r12
    bt.j loc_2186fa
loc_2188ca:
    bt.mov r5, r16
    bt.j loc_2186fa
loc_2188ce:
    bn.sbz -0x33(r22), r0
    bn.sbz -0x32(r22), r0
    bn.sbz -0x31(r22), r0
    bn.sbz -0x30(r22), r0
    bn.sbz -0x2f(r22), r0
    bn.sbz -0x2e(r22), r0
    bn.sbz -0x2d(r22), r0
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x3013
    bn.add r10, r14, r7
    bt.mov r3, r10
    bg.jal 0x23dd44
    bn.andi r3, r3, 0xf
    bn.sbz -0x32(r22), r3
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x3014
    bn.add r3, r14, r6
    bg.jal 0x23dd44
    bn.sbz -0x31(r22), r3
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x3015
    bn.add r3, r14, r7
    bg.jal 0x23dd44
    bn.sbz -0x30(r22), r3
    bt.mov r3, r10
    bg.jal 0x23dd44
    bn.andi r3, r3, 0xf0
    bn.srai r3, r3, 0x4
    bn.sbz -0x2f(r22), r3
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x3016
    bn.add r3, r14, r6
    bg.jal 0x23dd44
    bn.sbz -0x2e(r22), r3
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x3017
    bn.add r3, r14, r7
    bg.jal 0x23dd44
    bn.sbz -0x2d(r22), r3
    bn.sfleui r11, 0x7
    bn.cmovsi_2 r7, r11, 0x7
    bn.extbz r5, r7
    bg.beqi r5, 0x0, loc_218732
    bt.movi r4, 0x0
loc_218956:
    bn.add r6, r13, r4
    bn.addi r7, r22, -0x2c
    bt.add r7, r4
    bn.lbz r7, -0x7(r7)
    bn.sbz 0x0(r6), r7
    bn.addi r7, r4, 0x1
    bn.extbz r4, r7
    bg.bne r5, r4, loc_218956
    bn.j loc_2186fa
loc_218971:
    bn.sfleui r11, 0x10
    bn.ori r7, r0, 0x10
    bn.cmov_0 r7, r11, r7
    bn.extbz r12, r7
    bg.beqi r12, 0x0, loc_218732
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x3050
    bn.add r10, r14, r6
    bt.movi r11, 0x0
loc_21898c:
    bn.add r3, r10, r11
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_21898c
    bt.mov r5, r12
    bn.j loc_2186fa
loc_2189a8:
    bn.sfleui r11, 0x1d
    bn.ori r7, r0, 0x1d
    bn.cmov_0 r7, r11, r7
    bn.extbz r16, r7
    bn.addi r15, r16, 0x1
    bt.mov r5, r16
    bg.blesi r15, 0x0, loc_2186fa
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x31c0
    bn.add r10, r14, r7
    bt.movi r12, 0x0
    bt.movi r11, 0x0
    bt.j loc_2189de
loc_2189cc:
    bn.add r7, r11, r13
    bn.sbz -0x1(r7), r3
loc_2189d2:
    bn.addi r7, r12, 0x1
    bn.extbz r11, r7
    bt.mov r12, r11
    bg.bles r15, r11, loc_2188ca
loc_2189de:
    bn.add r3, r10, r11
    bg.jal 0x23dd44
    bn.andi r7, r11, 0x1
    bn.bnei r7, 0x0, loc_2189cc
    bn.add r7, r11, r13
    bn.sbz 0x1(r7), r3
    bt.j loc_2189d2
loc_2189f3:
    bn.sfleui r11, 0x19
    bn.ori r7, r0, 0x19
    bn.cmov_0 r7, r11, r7
    bn.extbz r12, r7
    bg.beqi r12, 0x0, loc_218732
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x308e
    bn.add r10, r14, r7
    bt.movi r11, 0x0
loc_218a0e:
    bn.add r3, r11, r10
    bg.jal 0x23dd44
    bn.add r7, r13, r11
    bn.sbz 0x0(r7), r3
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bne r12, r11, loc_218a0e
    bt.mov r5, r12
    bn.j loc_2186fa
