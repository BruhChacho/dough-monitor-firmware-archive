# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x208381,0x208490); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r13, r4
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r11, 0x2a(r3)
    bg.beqi r11, 0x0, loc_208432
    bt.movi r12, 0x0
    bt.j loc_2083e2
loc_2083b0:
    bn.andi r7, r6, 0x1
    bg.beqi r7, 0x0, loc_208446
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0xa0
    bn.add r3, r10, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0xaf
    bn.add r3, r10, r5
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
loc_2083da:
    bn.srli r11, r11, 0x1
    bt.addi r12, 0x1
    bn.beqi r11, 0x0, loc_208432
loc_2083e2:
    bn.extbz r6, r12
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_2083da
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r10, 0x4(r7)
    bn.bnei r13, 0x0, loc_2083b0
    bn.andi r7, r6, 0x1
    bn.beqi r7, 0x0, loc_20846b
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0xa0
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0xaf
    bn.add r3, r10, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bn.srli r11, r11, 0x1
    bt.addi r12, 0x1
    bn.bnei r11, 0x0, loc_2083e2
loc_208432:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_208446:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x30
    bn.add r3, r10, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0xaf
    bn.add r3, r10, r5
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bt.j loc_2083da
loc_20846b:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x30
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0xaf
    bn.add r3, r10, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bt.j loc_2083da
