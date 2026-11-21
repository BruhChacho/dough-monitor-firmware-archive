# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x253c6f,0x253d95); byte-exact only; hardware untested.
    bg.addi r1, r1, -0xfc
    bg.sw_0 0xf8(r1), r9
    bg.sw_0 0xf4(r1), r10
    bg.sw_0 0xf0(r1), r11
    bg.sw_0 0xec(r1), r12
    bg.sw_0 0xe8(r1), r13
    bt.mov r11, r3
    bt.mov r12, r4
    bt.mov r13, r5
    bg.movhi r7, 0x45
    bg.sbz 0x7659(r7), r0
    bg.movhi r7, 0x45
    bg.sbz 0x765a(r7), r0
    bt.movi r3, 0x1
    bg.movhi r4, 0x34
    bg.addi r4, r4, -0x3536
    bt.movi r5, 0x1
    bg.jal 0x279cbd
    bg.movhi r7, 0x3b
    bg.sw_0 0x742c(r7), r3
    bn.beqi r3, 0x7, loc_253d2c
    bt.mov r3, r1
    bt.movi r4, 0x0
    bn.ori r5, r0, 0xe8
    bg.jal 0x2a941f
    bg.movhi r7, 0x45
    bt.movi r10, 0x1
    bg.sbz 0x7654(r7), r10
    bg.sbz 0x7655(r7), r10
    bg.beqi r11, 0x1, loc_253d56
    bn.lh r3, 0x12(r13)
    bt.mov r4, r12
    bg.movhi r7, 0x45
    bg.lbz r5, 0x7490(r7)
    bg.jal 0x251d67
    bn.ff1 r3, r11
    bt.addi r3, -0x1
    bn.slli r7, r11, 0x1
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x765c
    bt.add r7, r6
    bn.srli r3, r3, 0x1f
    bn.lh r4, 0x0(r7)
    bg.jal 0x248739
    bg.movhi r7, 0x45
    bg.sbz 0x7492(r7), r10
loc_253d0a:
    bg.movhi r7, 0x45
    bg.sw_0 0x7650(r7), r12
    bg.lwz r13, 0xe8(r1)
    bg.lwz r12, 0xec(r1)
    bg.lwz r11, 0xf0(r1)
    bg.lwz r10, 0xf4(r1)
    bg.lwz r9, 0xf8(r1)
    bg.addi r1, r1, 0xfc
    bt.jr r9
loc_253d2c:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x352c
    bg.ori r4, r0, 0x17d
    bg.jal 0x2a9310
    bg.lwz r13, 0xe8(r1)
    bg.lwz r12, 0xec(r1)
    bg.lwz r11, 0xf0(r1)
    bg.lwz r10, 0xf4(r1)
    bg.lwz r9, 0xf8(r1)
    bg.addi r1, r1, 0xfc
    bt.jr r9
loc_253d56:
    bn.lh r3, 0x12(r13)
    bt.mov r4, r12
    bg.movhi r7, 0x45
    bg.lbz r5, 0x7490(r7)
    bg.jal 0x25256d
    bt.movi r3, 0x0
    bg.movhi r7, 0x45
    bg.lhz r4, 0x765e(r7)
    bg.jal 0x248739
    bg.movhi r7, 0x45
    bg.sbz 0x7492(r7), r11
    bt.movi r3, 0x1
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x49
    bg.jal 0x252e20
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x4a
    bg.jal 0x252e20
    bt.j loc_253d0a
