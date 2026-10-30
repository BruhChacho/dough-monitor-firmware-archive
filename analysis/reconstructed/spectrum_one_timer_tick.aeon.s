# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2417f1,0x241b18); Decrement counters, set periodic flags, and dispatch channel callbacks; tick period and interrupt source unknown.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.movhi r10, 0x3b
    bg.lhz r7, 0x4948(r10)
    bt.addi r7, -0x1
    bn.exthz r7, r7
    bg.sw_1 0x4948(r10), r7
    bg.movhi r7, 0x45
    bg.lbz r7, 0x51e1(r7)
    bn.beqi r7, 0x0, loc_241822
    bg.movhi r7, 0x48
    bg.lwz r7, 0x24a4(r7)
    bn.beqi r7, 0x0, loc_241822
    bt.jalr r7
loc_241822:
    bg.movhi r5, 0x45
    bg.lbz r7, 0x5206(r5)
    bn.beqi r7, 0x0, loc_241841
    bg.movhi r6, 0x45
    bg.lhz r7, 0x5204(r6)
    bg.bnei r7, 0x0, loc_241abe
    bg.lhz r7, 0x5204(r6)
    bg.beqi r7, 0x0, loc_241ab7
loc_241841:
    bg.movhi r6, 0x45
    bg.lhz r7, 0x5208(r6)
    bn.beqi r7, 0x0, loc_241859
    bg.lhz r7, 0x5208(r6)
    bt.addi r7, -0x1
    bn.exthz r7, r7
    bg.sw_1 0x5208(r6), r7
loc_241859:
    bg.movhi r6, 0x45
    bg.lbz r7, 0x796a(r6)
    bn.beqi r7, 0x0, loc_24186a
    bt.addi r7, -0x1
    bg.sbz 0x796a(r6), r7
loc_24186a:
    bg.movhi r5, 0x45
    bg.lbz r6, 0x51fe(r5)
    bn.beqi r6, 0x0, loc_24188e
    bg.movhi r7, 0x45
    bg.lhz r6, 0x51fc(r7)
    bt.addi r6, -0x1
    bn.exthz r6, r6
    bg.sw_1 0x51fc(r7), r6
    bg.lhz r7, 0x51fc(r7)
    bg.beqi r7, 0x0, loc_241aa6
loc_24188e:
    bt.movi r4, 0x0
    bg.movhi r7, 0x45
    bg.addi r5, r7, 0x51b1
    bg.movhi r7, 0x45
    bg.addi r6, r7, 0x51ba
loc_2418a0:
    bn.lbz r7, 0x0(r5)
    bn.beqi r7, 0x0, loc_2418ba
    bn.lh r7, 0x0(r6)
    bt.addi r7, -0x1
    bn.exthz r7, r7
    bn.sh_1 0x0(r6), r7
    bn.lh r7, 0x0(r6)
    bn.bnei r7, 0x0, loc_2418ba
    bn.sbz 0x0(r5), r0
loc_2418ba:
    bt.addi r4, 0x1
    bt.addi r6, 0x2
    bt.addi r5, 0x1
    bg.bnei r4, 0x9, loc_2418a0
    bg.movhi r7, 0x45
    bg.lbz r7, 0x51db(r7)
    bn.bnei r7, 0x0, loc_2418db
    bg.movhi r5, 0x45
    bg.lbz r7, 0x51e7(r5)
    bg.bnei r7, 0x0, loc_241a87
loc_2418db:
    bg.lhz r7, 0x4948(r10)
    bn.bnei r7, 0x0, loc_24190c
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x51e2(r7), r6
    bg.movhi r7, 0x45
    bg.sbz 0x51ce(r7), r6
    bg.addi r6, r0, 0x3e8
    bg.movhi r7, 0x3b
    bg.sw_1 0x4948(r7), r6
    bg.movhi r6, 0x45
    bg.lbz r7, 0x520e(r6)
    bg.bnei r7, 0x0, loc_241ad5
loc_24190c:
    bg.movhi r4, 0x3b
    bg.lhz r7, 0x4948(r10)
    bn.exthz r7, r7
    bt.movi r5, 0xa
    bn.divu r6, r7, r5
    bn.muls r6, r6, r5
    bn.sub r7, r7, r6
    bn.exthz r7, r7
    bg.bnei r7, 0x0, loc_2419cf
    bt.movi r23, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x51dc(r7), r23
    bg.lhz r6, 0x4948(r4)
    bn.exthz r6, r6
    bn.ori r5, r0, 0x1e
    bn.divu r7, r6, r5
    bn.muls r7, r7, r5
    bn.sub r6, r6, r7
    bn.exthz r6, r6
    bg.beqi r6, 0x0, loc_241a63
    bg.lhz r7, 0x4948(r4)
    bn.exthz r7, r7
    bn.ori r5, r0, 0x32
    bn.divu r6, r7, r5
    bn.muls r6, r6, r5
    bn.sub r7, r7, r6
    bn.exthz r7, r7
    bg.beqi r7, 0x0, loc_241a1c
loc_241967:
    bg.lhz r7, 0x4948(r10)
    bg.movhi r7, 0x3b
    bg.addi r10, r7, 0x49c4
    bt.j loc_24199f
loc_241975:
    bt.addi r7, -0xa
    bn.sh_1 0x0(r10), r7
    bn.lh r7, 0x0(r10)
    bn.lh r6, 0x4(r10)
    bg.beq r7, r6, loc_2419b6
loc_241984:
    bn.lh r6, 0x6(r10)
    bg.beq r7, r6, loc_241b0d
    bg.beqi r7, 0x0, loc_241add
loc_24198f:
    bg.addi r10, r10, 0xb0
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4de4
    bg.beq r10, r7, loc_2419cf
loc_24199f:
    bn.lh r7, 0x0(r10)
    bn.beqi r7, 0x0, loc_24198f
    bg.bgtui r7, 0xa, loc_241975
    bn.sh_1 0x0(r10), r0
    bn.lh r7, 0x0(r10)
    bn.lh r6, 0x4(r10)
    bg.bne r7, r6, loc_241984
loc_2419b6:
    bn.lwz r3, -0x74(r10)
    bt.movi r4, 0x0
    bg.jal 0x20f7d2
    bg.addi r10, r10, 0xb0
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4de4
    bg.bne r10, r7, loc_24199f
loc_2419cf:
    bg.jal 0x2384f1
    bg.movhi r6, 0x45
    bg.lbz r7, 0x5221(r6)
    bn.beqi r7, 0x0, loc_2419ea
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.sbz 0x5221(r6), r7
    bn.beqi r7, 0x0, loc_2419f6
loc_2419ea:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20f1a0
loc_2419f6:
    bg.ori r3, r0, 0x440
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.ori r3, r0, 0x441
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20f1a0
loc_241a1c:
    bg.movhi r7, 0x45
    bg.sbz 0x51de(r7), r23
    bg.lhz r6, 0x4948(r4)
    bn.exthz r6, r6
    bn.ori r5, r0, 0x64
    bn.divu r7, r6, r5
    bn.muls r7, r7, r5
    bn.sub r6, r6, r7
    bn.exthz r6, r6
    bg.beqi r6, 0x0, loc_241ae8
    bg.lhz r7, 0x4948(r4)
    bn.exthz r7, r7
    bg.ori r5, r0, 0x1f4
    bn.divu r6, r7, r5
    bn.muls r6, r6, r5
    bn.sub r7, r7, r6
    bn.exthz r7, r7
    bg.bnei r7, 0x0, loc_241967
loc_241a59:
    bg.movhi r7, 0x45
    bg.sbz 0x51e0(r7), r23
    bt.j loc_241967
loc_241a63:
    bg.movhi r7, 0x45
    bg.sbz 0x51dd(r7), r23
    bg.lhz r7, 0x4948(r4)
    bn.exthz r7, r7
    bn.ori r5, r0, 0x32
    bn.divu r6, r7, r5
    bn.muls r6, r6, r5
    bn.sub r7, r7, r6
    bn.exthz r7, r7
    bg.bnei r7, 0x0, loc_241967
    bt.j loc_241a1c
loc_241a87:
    bg.movhi r7, 0x45
    bg.lhz r6, 0x51f6(r7)
    bt.addi r6, -0x1
    bn.exthz r6, r6
    bg.sh 0x51f4(r7), r6
    bg.lhz r7, 0x51f6(r7)
    bg.bnei r7, 0x0, loc_2418db
    bg.sbz 0x51e7(r5), r0
    bt.j loc_2418db
loc_241aa6:
    bg.sbz 0x51fe(r5), r0
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x51ff(r7), r6
    bn.j loc_24188e
loc_241ab7:
    bg.sbz 0x5206(r5), r0
    bn.j loc_241841
loc_241abe:
    bg.lhz r7, 0x5204(r6)
    bt.addi r7, -0x1
    bn.exthz r7, r7
    bg.sw_1 0x5204(r6), r7
    bg.lhz r7, 0x5204(r6)
    bg.bnei r7, 0x0, loc_241841
    bt.j loc_241ab7
loc_241ad5:
    bt.addi r7, -0x1
    bg.sbz 0x520e(r6), r7
    bt.j loc_24190c
loc_241add:
    bn.lwz r3, -0x74(r10)
    bt.movi r4, 0x1
    bg.jal 0x20edc8
    bt.j loc_24198f
loc_241ae8:
    bg.movhi r7, 0x45
    bg.sbz 0x51df(r7), r23
    bg.lhz r7, 0x4948(r4)
    bn.exthz r7, r7
    bg.ori r5, r0, 0x1f4
    bn.divu r6, r7, r5
    bn.muls r6, r6, r5
    bn.sub r7, r7, r6
    bn.exthz r7, r7
    bg.bnei r7, 0x0, loc_241967
    bt.j loc_241a59
loc_241b0d:
    bn.lwz r3, -0x74(r10)
    bt.movi r4, 0x1
    bg.jal 0x20f7d2
    bt.j loc_24198f
