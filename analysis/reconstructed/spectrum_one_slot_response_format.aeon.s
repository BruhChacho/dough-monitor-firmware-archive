# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26bdd1,0x26bf22); Format selector-1/3 responses and update mirrored settings; bg.sh address lane unresolved.
# Fixed original addresses; not a hardware-validated implementation.
    bn.slli r3, r3, 0x7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r4, r3, r7
    bn.lbz r7, 0x1(r4)
    bn.extbz r5, r7
    bg.movhi r7, 0x45
    bg.sbz 0x3cd1(r7), r5
    bg.movhi r7, 0x45
    bg.sbz 0x3cc9(r7), r0
    bn.beqi r5, 0x3, loc_26be6b
    bt.movi r3, 0x0
    bn.beqi r5, 0x1, loc_26bdff
    bt.jr r9
loc_26bdff:
    bg.movhi r23, 0x34
    bg.lbz r7, 0x229a(r23)
    bg.beqi r7, 0x0, loc_26beb0
    bn.lbz r7, 0x2(r4)
    bn.extbz r6, r7
    bg.movhi r7, 0x45
    bg.sbz 0x3cc8(r7), r6
    bn.sfnei r6, 0x12
    bn.bnf loc_26bef2
    bg.movhi r26, 0x45
    bg.movhi r25, 0x45
    bg.movhi r24, 0x45
    bg.movhi r23, 0x45
loc_26be2f:
    bn.addi r7, r0, -0x78
    bn.sbz 0x0(r4), r7
    bt.movi r7, 0x2
    bn.sbz 0x1(r4), r7
    bn.sbz 0x2(r4), r0
    bn.sbz 0x3(r4), r6
    bn.sbz 0x4(r4), r0
    bg.lbz r7, 0x3cd0(r26)
    bn.sbz 0x5(r4), r7
    bg.lbz r7, 0x3ccf(r25)
    bn.sbz 0x6(r4), r7
    bg.lbz r7, 0x3cce(r24)
    bn.sbz 0x7(r4), r7
    bg.lbz r7, 0x3cca(r23)
    bn.sbz 0x8(r4), r7
    bg.movhi r7, 0x45
    bg.sbz 0x415e(r7), r5
    bt.movi r3, 0x8
    bt.jr r9
loc_26be6b:
    bn.lbz r5, 0x2(r4)
    bn.extbz r5, r5
    bg.movhi r7, 0x45
    bg.sbz 0x3cc8(r7), r5
    bn.lbz r6, 0x3(r4)
    bg.movhi r7, 0x45
    bg.sbz 0x3cd0(r7), r6
    bn.lbz r7, 0x4(r4)
    bn.extbz r6, r7
    bg.movhi r7, 0x45
    bg.sbz 0x3ccf(r7), r6
    bn.sfnei r5, 0x12
    bn.bnf loc_26becc
loc_26be98:
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bn.add r6, r3, r7
    bn.addi r7, r0, -0x80
    bn.sbz 0x0(r6), r7
    bn.sbz 0x2(r6), r0
    bt.movi r3, 0x0
    bt.jr r9
loc_26beb0:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x2294
    bn.lbz r6, 0x1(r7)
    bn.sbz 0x0(r4), r6
    bn.lbz r7, 0x2(r7)
    bn.sbz 0x1(r4), r7
    bg.sbz 0x229a(r23), r5
    bt.movi r3, 0x2
    bt.jr r9
loc_26becc:
    bn.sfgtui r6, 0x18
    bn.bnf loc_26bee5
    bn.sfgtui r6, 0x64
    bn.bf loc_26be98
    bn.addi r6, r6, 0x32
    bg.movhi r7, 0x3d
    bg.sh -0x4cf8(r7), r6
    bt.j loc_26be98
loc_26bee5:
    bn.ori r6, r0, 0x4b
    bg.movhi r7, 0x3d
    bg.sh -0x4cf8(r7), r6
    bt.j loc_26be98
loc_26bef2:
    bg.movhi r26, 0x45
    bg.sbz 0x3cd0(r26), r0
    bg.movhi r25, 0x45
    bn.ori r7, r0, 0x64
    bg.sbz 0x3ccf(r25), r7
    bg.movhi r24, 0x45
    bg.sbz 0x3cce(r24), r0
    bg.movhi r23, 0x45
    bg.movhi r7, 0x3d
    bg.lbz r7, -0x4cf6(r7)
    bn.addi r7, r7, -0x32
    bg.sbz 0x3cca(r23), r7
    bt.j loc_26be2f
