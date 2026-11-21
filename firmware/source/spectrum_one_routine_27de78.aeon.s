# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27de78,0x27dee6); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bg.movhi r11, 0x3d
    bn.sfleui r3, 0x63
    bn.bf loc_27dea1
    bn.exths r10, r3
    bt.mov r3, r10
    bg.jal 0x2acf9e
    bn.blesi r10, -0x1, loc_27deda
loc_27de99:
    bg.sw_0 -0x4778(r11), r3
    bg.sw_0 -0x4774(r11), r4
loc_27dea1:
    bg.lwz r3, -0x4778(r11)
    bg.lwz r4, -0x4774(r11)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bg.movhi r7, 0x3d
    bg.sw_0 -0x3a10(r7), r3
    bg.sw_0 -0x3a0c(r7), r4
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x79cf(r7), r6
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_27deda:
    bt.movi r5, 0x0
    bg.movhi r6, 0x40f0
    bg.jal 0x2aca43
    bt.j loc_27de99
