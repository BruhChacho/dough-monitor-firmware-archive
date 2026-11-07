# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x270836,0x2708c7); Call timer_tick then maintain word counters, divide-by-100 byte counter, and divide-by-1000 counter.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2417f1
    bg.movhi r4, 0x45
    bg.lwz r7, 0x3d00(r4)
    bt.addi r7, 0x1
    bg.sw_0 0x3d00(r4), r7
    bg.movhi r5, 0x45
    bg.lbz r7, 0x3d18(r5)
    bt.addi r7, 0x1
    bn.extbz r7, r7
    bg.sbz 0x3d18(r5), r7
    bn.sfleui r7, 0x63
    bn.bf loc_270876
    bg.movhi r6, 0x45
    bg.lwz r7, 0x3d14(r6)
    bt.addi r7, 0x1
    bg.sw_0 0x3d14(r6), r7
    bg.sbz 0x3d18(r5), r0
loc_270876:
    bg.lwz r5, 0x3d00(r4)
    bg.ori r6, r0, 0x3e8
    bn.divu r7, r5, r6
    bn.muls r7, r7, r6
    bg.bne r5, r7, loc_270896
    bg.movhi r6, 0x45
    bg.lwz r7, 0x3cfc(r6)
    bt.addi r7, 0x1
    bg.sw_0 0x3cfc(r6), r7
loc_270896:
    bg.movhi r6, 0x45
    bg.lwz r7, 0x3d04(r6)
    bn.beqi r7, 0x0, loc_2708ab
    bg.lwz r7, 0x3d04(r6)
    bt.addi r7, -0x1
    bg.sw_0 0x3d04(r6), r7
loc_2708ab:
    bg.movhi r6, 0x45
    bg.lwz r7, 0x3d08(r6)
    bn.beqi r7, 0x0, loc_2708c0
    bg.lwz r7, 0x3d08(r6)
    bt.addi r7, -0x1
    bg.sw_0 0x3d08(r6), r7
loc_2708c0:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
