# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x284f2a,0x284fb9); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bt.mov r10, r3
    bg.jal 0x283179
    bt.mov r11, r3
    bn.sh_2 0x6(r1), r0
    bn.sh_1 0x4(r1), r0
    bt.mov r3, r10
    bn.addi r4, r1, 0x6
    bn.addi r5, r1, 0x4
    bg.jal 0x27f984
    bn.lh r7, 0x4(r1)
    bn.beqi r7, 0x0, loc_284f5c
    bn.lh r4, 0x6(r1)
    bn.bnei r4, 0x0, loc_284f6c
loc_284f5c:
    bt.movi r3, 0x0
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_284f6c:
    bg.movhi r7, 0x7980
    bn.ori r7, r7, 0x10
    bn.add r3, r11, r7
    bg.jal 0x23dfb6
    bg.movhi r7, 0x7980
    bn.ori r7, r7, 0x12
    bn.add r3, r11, r7
    bn.lh r4, 0x4(r1)
    bg.jal 0x23dfb6
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x1a13
    bn.lh r4, 0x6(r1)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x19fb
    bn.lh r4, 0x4(r1)
    bg.jal 0x27f95e
    bt.movi r3, 0x1
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
