# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x233a8f,0x233c54); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r24, r3
    bg.bgtui r3, 0x3, loc_233b3e
    bn.ori r7, r0, 0x84
    bn.muls r7, r3, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0xe8
    bt.add r7, r23
    bn.lwz r23, 0x24(r7)
    bg.beqi r23, 0x0, loc_233b4a
    bg.beqi r4, 0x9, loc_233b5b
loc_233ab8:
    bg.bleui r4, 0x9, loc_233b69
    bg.sfeqi r4, 0x84
    bn.bf loc_233bdf
    bg.sfgti r4, 0x84
    bn.bf loc_233b0f
    bg.sfeqi r4, 0x81
    bn.bf loc_233bbe
    bg.sfgti r4, 0x81
    bn.bf loc_233bea
    bg.bnei r4, 0xa, loc_233b31
    bg.ori r25, r0, 0x2000
    bn.and r7, r23, r25
    bn.beqi r7, 0x0, loc_233b31
loc_233ae6:
    bt.movi r10, 0x1
loc_233ae8:
    bn.beqi r5, 0x0, loc_233afd
    bt.movi r23, 0x0
loc_233aed:
    bn.add r7, r6, r23
    bn.sbz 0x0(r7), r0
    bn.addi r7, r23, 0x1
    bn.extbz r23, r7
    bg.bne r5, r23, loc_233aed
loc_233afd:
    bt.mov r3, r24
    bg.jal 0x21859c
    bt.mov r3, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_233b0f:
    bg.sfeqi r4, 0x86
    bn.bf loc_233ba1
    bg.sfleui r4, 0x85
    bn.bf loc_233c22
    bg.sfeqi r4, 0x87
    bn.bf loc_233c2d
    bg.sfeqi r4, 0xe0
    bn.bnf loc_233b31
loc_233b2b:
    bn.andi r7, r23, 0x20
    bn.bnei r7, 0x0, loc_233ae6
loc_233b31:
    bt.movi r10, 0x0
    bg.movhi r7, 0x45
    bg.lbz r7, 0x485e(r7)
    bn.bnei r7, 0x0, loc_233ae8
loc_233b3e:
    bt.movi r3, 0x0
loc_233b40:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_233b4a:
    bt.movi r3, 0x0
    bg.movhi r7, 0x45
    bg.lbz r7, 0x485e(r7)
    bn.beqi r7, 0x0, loc_233b40
    bg.bnei r4, 0x9, loc_233ab8
loc_233b5b:
    bg.ori r25, r0, 0x4000
    bn.and r7, r23, r25
    bn.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233b69:
    bn.beqi r4, 0x3, loc_233bd4
    bn.bgtui r4, 0x3, loc_233b83
    bn.beqi r4, 0x1, loc_233bc9
    bn.bgtui r4, 0x1, loc_233b2b
    bg.ori r25, r0, 0x100
    bn.and r7, r23, r25
    bn.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233b83:
    bg.beqi r4, 0x5, loc_233baf
    bg.bleui r4, 0x4, loc_233c13
    bg.beqi r4, 0x6, loc_233c3a
    bg.bnei r4, 0x8, loc_233b31
    bg.ori r25, r0, 0x1000
    bn.and r7, r23, r25
    bn.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233ba1:
    bg.ori r25, r0, 0x8000
    bn.and r7, r23, r25
    bn.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233baf:
    bg.ori r25, r0, 0x400
    bn.and r7, r23, r25
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233bbe:
    bn.andi r7, r23, 0x80
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233bc9:
    bn.andi r7, r23, 0x40
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233bd4:
    bn.andi r7, r23, 0x10
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233bdf:
    bn.andi r7, r23, 0x2
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233bea:
    bg.sfeqi r4, 0x82
    bn.bf loc_233c49
    bg.sfeqi r4, 0x83
    bn.bnf loc_233b31
    bn.ori r7, r0, 0x84
    bn.muls r7, r24, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0xe8
    bt.add r7, r23
    bn.lbz r7, 0x3e(r7)
    bg.bnei r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233c13:
    bg.ori r25, r0, 0x800
    bn.and r7, r23, r25
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233c22:
    bn.andi r7, r23, 0x1
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233c2d:
    bt.movhi r25, 0x1
    bn.and r7, r23, r25
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233c3a:
    bg.ori r25, r0, 0x200
    bn.and r7, r23, r25
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
loc_233c49:
    bn.andi r7, r23, 0x8
    bg.beqi r7, 0x0, loc_233b31
    bt.movi r10, 0x1
    bt.j loc_233ae8
