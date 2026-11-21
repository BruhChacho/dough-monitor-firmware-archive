# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252917,0x252c92); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bt.mov r24, r3
    bn.slli r23, r3, 0x4
    bg.movhi r7, 0x49
    bg.addi r7, r7, -0x58dc
    bn.add r6, r23, r7
    bn.lwz r7, 0x0(r5)
    bn.sw 0x0(r6), r7
    bn.lwz r7, 0x4(r5)
    bn.sw 0x4(r6), r7
    bn.lwz r7, 0x8(r5)
    bn.sw 0x8(r6), r7
    bn.lwz r7, 0xc(r5)
    bn.sw 0xc(r6), r7
    bg.beqi r4, 0x4, loc_252a38
    bg.beqi r4, 0x6, loc_2529df
    bg.beqi r4, 0x8, loc_2529df
    bg.movhi r25, 0x45
    bg.addi r25, r25, 0x3c84
    bn.add r7, r3, r25
    bt.movi r6, 0xd
    bn.sbz 0x0(r7), r6
    bn.addi r7, r4, -0x1
    bg.bgtui r7, 0x2, loc_252b47
loc_252968:
    bg.movhi r25, 0x45
    bg.addi r25, r25, 0x3c94
    bn.add r7, r24, r25
    bn.sbz 0x0(r7), r0
loc_252976:
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x40
    bn.beqi r7, 0x0, loc_2529d7
    bg.movhi r7, 0x49
    bg.addi r7, r7, -0x58dc
    bt.add r23, r7
    bn.lh r5, 0x2(r23)
    bn.lh r6, 0x4(r23)
    bn.lh r7, 0xc(r23)
    bn.lh r8, 0xe(r23)
    bg.movhi r25, 0x45
    bg.addi r25, r25, 0x3c84
    bn.add r4, r24, r25
    bn.lbz r4, 0x0(r4)
    bn.sw 0x0(r1), r4
    bn.lbz r4, 0x0(r23)
    bn.sw 0x4(r1), r4
    bn.lbz r4, 0x1(r23)
    bn.sw 0x8(r1), r4
    bn.lh r4, 0x8(r23)
    bn.sw 0xc(r1), r4
    bn.lh r4, 0xa(r23)
    bn.sw 0x10(r1), r4
    bn.lh r4, 0x6(r23)
    bn.sw 0x14(r1), r4
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3c4f
    bt.mov r4, r24
    bg.jal 0x2a9310
loc_2529d7:
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_2529df:
    bn.lh r6, 0x2(r5)
    bg.sfgti r6, 0x5db
    bn.bf loc_2529fd
    bn.lh r7, 0x4(r5)
    bg.sfgti r7, 0x1f3
    bn.bf loc_252c2d
    bn.lh r7, 0x8(r5)
    bg.sfgti r7, 0x289
    bn.bnf loc_252b0d
loc_2529fd:
    bg.sfgti r6, 0x513
    bn.bnf loc_252b67
    bg.sfgti r6, 0x789
    bn.bf loc_252bcb
    bn.lh r7, 0x4(r5)
loc_252a0e:
    bg.sfgti r7, 0x44b
    bn.bf loc_252bcb
loc_252a15:
    bn.lbz r6, 0x1(r5)
    bg.bnei r6, 0x0, loc_252b77
    bn.lh r5, 0x8(r5)
    bt.movi r6, 0x8
    bg.sfgti r5, 0xf4
    bn.bf loc_252c87
loc_252a28:
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3c84
    bn.add r7, r24, r5
    bn.sbz 0x0(r7), r6
    bt.j loc_252b24
loc_252a38:
    bn.lh r4, 0x2(r5)
    bg.addi r7, r4, -0x29f
    bn.exthz r7, r7
    bn.sfgtui r7, 0x62
    bn.cmovsi_2 r6, r0, 0x1
    bg.addi r7, r4, -0x56f
    bn.exthz r7, r7
    bn.sfgtui r7, 0x62
    bn.cmovsi_2 r7, r0, 0x1
    bn.or r6, r6, r7
    bn.extbz r6, r6
    bg.bnei r6, 0x0, loc_252af9
    bg.addi r7, r4, -0xb0f
    bn.exthz r7, r7
    bn.sfleui r7, 0x62
    bn.bf loc_252af9
    bg.addi r7, r4, -0x164f
    bn.exthz r7, r7
    bn.sfgtui r7, 0x62
    bn.bnf loc_252af9
loc_252a79:
    bg.addi r7, r4, -0x4cf
    bn.exthz r7, r7
    bn.sfleui r7, 0x62
    bn.bf loc_252a93
    bg.addi r7, r4, -0x9cf
    bn.exthz r7, r7
    bn.sfleui r7, 0x62
    bn.bnf loc_252c4f
loc_252a93:
    bn.lh r7, 0x4(r5)
    bg.sfgti r7, 0x31f
    bn.bf loc_252aa4
    bn.lbz r6, 0x1(r5)
    bg.beqi r6, 0x0, loc_252bdc
loc_252aa4:
    bg.addi r7, r4, -0x74f
    bn.exthz r7, r7
    bn.sfleui r7, 0x62
    bn.bf loc_252abe
    bg.addi r7, r4, -0xecf
    bn.exthz r7, r7
    bn.sfleui r7, 0x62
    bn.bnf loc_252c6b
loc_252abe:
    bn.lh r7, 0x4(r5)
    bg.sfgti r7, 0x44b
    bn.bnf loc_252a15
loc_252ac8:
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3c84
    bn.add r6, r24, r7
    bt.movi r7, 0x2
    bn.sbz 0x0(r6), r7
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3c84
    bn.add r7, r24, r5
    bn.lbz r7, 0x0(r7)
    bn.bgtui r7, 0x3, loc_252b35
loc_252ae9:
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3c94
    bn.add r7, r24, r6
    bn.sbz 0x0(r7), r0
    bt.j loc_252976
loc_252af9:
    bn.lh r25, 0x4(r5)
    bg.sfgti r25, 0x1f3
    bn.bf loc_252b91
    bn.lh r7, 0x8(r5)
    bg.sfgti r7, 0x289
    bn.bf loc_252b91
loc_252b0d:
    bg.movhi r25, 0x45
    bg.addi r25, r25, 0x3c84
    bn.add r7, r24, r25
    bn.lbz r6, 0x1(r5)
    bn.sfnei r6, 0x0
    bn.cmovsi_2 r6, r0, 0x1
    bn.sbz 0x0(r7), r6
loc_252b24:
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3c84
    bn.add r7, r24, r5
    bn.lbz r7, 0x0(r7)
    bn.bleui r7, 0x3, loc_252ae9
loc_252b35:
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3c94
    bn.add r6, r24, r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.j loc_252976
loc_252b47:
    bg.beqi r4, 0x5, loc_252968
    bn.lh r7, 0x2(r5)
    bg.sfleui r7, 0x4af
    bn.bf loc_252ae9
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3c94
    bn.add r6, r3, r5
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.j loc_252976
loc_252b67:
    bn.lh r7, 0x4(r5)
    bg.sfgti r7, 0x31f
    bn.bf loc_252a0e
    bn.lbz r6, 0x1(r5)
    bn.beqi r6, 0x0, loc_252bdc
loc_252b77:
    bn.lh r7, 0x8(r5)
    bg.sfgti r7, 0x225
    bn.cmovi r6, 0x7, 0x6
    bg.movhi r25, 0x45
    bg.addi r25, r25, 0x3c84
    bn.add r7, r24, r25
    bn.sbz 0x0(r7), r6
    bt.j loc_252b24
loc_252b91:
    bn.bnei r6, 0x0, loc_252ba1
    bg.addi r7, r4, -0xb0f
    bn.exthz r7, r7
    bn.sfleui r7, 0x62
    bn.bnf loc_252c40
loc_252ba1:
    bg.sfgti r25, 0x257
    bn.bf loc_252a79
    bn.lh r7, 0x8(r5)
    bg.sfgti r7, 0x225
    bn.bf loc_252a79
loc_252bb2:
    bn.lbz r7, 0x1(r5)
    bn.sfeqi r7, 0x0
    bn.cmovi r6, 0x3, 0x2
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3c84
    bn.add r7, r24, r5
    bn.sbz 0x0(r7), r6
    bt.j loc_252b24
loc_252bcb:
    bg.sfgti r6, 0x545
    bn.bf loc_252bf6
    bn.lh r7, 0x4(r5)
    bg.sfgti r7, 0x60d
    bn.bf loc_252c00
loc_252bdc:
    bn.lh r7, 0x8(r5)
    bg.sfgti r7, 0x225
    bn.cmovi r6, 0x5, 0x4
    bg.movhi r25, 0x45
    bg.addi r25, r25, 0x3c84
    bn.add r7, r24, r25
    bn.sbz 0x0(r7), r6
    bt.j loc_252b24
loc_252bf6:
    bg.sfgti r6, 0x789
    bn.bf loc_252ac8
    bn.lh r7, 0x4(r5)
loc_252c00:
    bg.sfgti r7, 0x8fb
    bn.bf loc_252ac8
    bn.lbz r6, 0x1(r5)
    bg.bnei r6, 0x0, loc_252b77
    bn.lh r5, 0x8(r5)
    bt.movi r6, 0x8
    bg.sfgti r5, 0xf9
    bn.bnf loc_252a28
loc_252c1a:
    bt.movi r6, 0xa
    bg.sfgti r5, 0x15d
    bn.bnf loc_252a28
    bg.sfgti r5, 0x225
    bn.cmovi r6, 0xc, 0xb
    bn.j loc_252a28
loc_252c2d:
    bg.sfgti r7, 0x257
    bn.bf loc_2529fd
    bn.lh r7, 0x8(r5)
    bg.sfgti r7, 0x225
    bn.bf loc_2529fd
    bt.j loc_252bb2
loc_252c40:
    bg.addi r7, r4, -0x164f
    bn.exthz r7, r7
    bn.sfgtui r7, 0x62
    bn.bf loc_252a79
    bt.j loc_252ba1
loc_252c4f:
    bg.addi r7, r4, -0x13cf
    bn.exthz r7, r7
    bn.sfleui r7, 0x62
    bn.bf loc_252a93
    bg.addi r7, r4, -0x27cf
    bn.exthz r7, r7
    bn.sfgtui r7, 0x62
    bn.bf loc_252aa4
    bt.j loc_252a93
loc_252c6b:
    bg.addi r7, r4, -0x1dcf
    bn.exthz r7, r7
    bn.sfleui r7, 0x62
    bn.bf loc_252abe
    bg.addi r7, r4, -0x3bcf
    bn.exthz r7, r7
    bn.sfgtui r7, 0x62
    bn.bf loc_252ac8
    bt.j loc_252abe
loc_252c87:
    bt.movi r6, 0x9
    bg.sfgti r5, 0x10d
    bn.bnf loc_252a28
    bt.j loc_252c1a
