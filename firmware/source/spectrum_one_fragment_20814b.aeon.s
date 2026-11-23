# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20814b,0x208205); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r12, r4
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r10, 0x2a(r3)
    bn.beqi r10, 0x0, loc_2081d0
    bt.movi r11, 0x0
    bt.j loc_208193
loc_208175:
    bn.andi r7, r6, 0x1
    bn.beqi r7, 0x0, loc_2081e1
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0xc0
    bt.add r3, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
loc_20818b:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_2081d0
loc_208193:
    bn.extbz r6, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_20818b
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r3, 0x4(r7)
    bn.bnei r12, 0x0, loc_208175
    bn.andi r7, r6, 0x1
    bn.beqi r7, 0x0, loc_2081f3
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0xc0
    bt.add r3, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_208193
loc_2081d0:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_2081e1:
    bn.movhi_2 r5, 0x1980
    bn.ori r5, r5, 0xc2
    bt.add r3, r5
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.j loc_20818b
loc_2081f3:
    bn.movhi_2 r5, 0x1980
    bn.ori r5, r5, 0xc2
    bt.add r3, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.j loc_20818b
