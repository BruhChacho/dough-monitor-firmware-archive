# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23f257,0x23f352); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r4
    bn.ori r7, r0, 0xb0
    bn.muls r10, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r10, r6
    bn.lwz r7, 0x4(r10)
    bt.movhi r6, 0x2
    bn.and r7, r7, r6
    bg.bnei r7, 0x0, loc_23f307
    bn.beqi r4, 0x0, loc_23f2da
    bt.movi r7, 0xa
    bn.divu r6, r4, r7
    bn.muls r6, r6, r7
    bn.exthz r4, r6
    bn.addi r7, r4, -0x64
    bn.exthz r6, r7
    bg.sfgti r4, 0x12b
    bn.bf loc_23f2a2
    bg.ori r4, r0, 0x12c
    bn.ori r6, r0, 0xc8
loc_23f2a2:
    bn.ori r7, r0, 0xb0
    bn.muls r10, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r10, r7
    bn.sh_1 0x78(r10), r6
    bn.ori r7, r0, 0x64
    bn.sh_2 0x7a(r10), r7
    bn.sh_2 0x76(r10), r4
    bn.lwz r3, 0x0(r10)
    bt.movi r4, 0x0
    bg.jal 0x20edc8
    bn.beqi r3, 0x0, loc_23f338
    bn.sh_1 0x74(r10), r0
loc_23f2cd:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_23f2da:
    bn.sh_1 0x74(r10), r0
    bn.sh_2 0x76(r10), r0
    bn.lwz r3, 0x0(r10)
    bt.movi r4, 0x1
    bg.jal 0x20f7d2
    bn.lwz r3, 0x0(r10)
    bt.movi r4, 0x1
    bg.jal 0x20edc8
    bn.bnei r3, 0x0, loc_23f2cd
    bt.movi r7, 0xa
    bn.sh_2 0x76(r10), r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_23f307:
    bn.ori r10, r0, 0x18
    bn.muls r10, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4288
    bt.add r10, r7
    bn.lbz r3, 0x4(r10)
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bg.jal 0x2394a2
    bn.lbz r3, 0x4(r10)
    bt.movi r4, 0x1
    bt.mov r5, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x2394a2
loc_23f338:
    bt.movi r7, 0xa
    bn.sh_1 0x74(r10), r7
    bn.lh r7, 0x76(r10)
    bt.addi r7, 0xa
    bn.sh_2 0x76(r10), r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
