# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x238edd,0x238f69); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x268
    bg.sw_0 0x264(r1), r9
    bg.sw_0 0x260(r1), r10
    bg.sw_0 0x25c(r1), r11
    bg.sw_0 0x258(r1), r12
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x33f9
    bg.jal 0x23dd44
    bn.beqi r3, 0x0, loc_238f29
    bt.movi r11, 0x0
    bn.addi r7, r3, -0x1
    bn.exthz r7, r7
    bn.addi r12, r7, 0x1
loc_238f09:
    bn.exthz r10, r11
    bt.movhi r7, -0x10
    bg.ori r7, r7, 0x33fa
    bn.add r3, r10, r7
    bg.jal 0x23dd44
    bg.addi r7, r1, 0x258
    bt.add r7, r10
    bg.sbz -0x258(r7), r3
    bt.addi r11, 0x1
    bg.bne r11, r12, loc_238f09
loc_238f29:
    bt.movhi r10, -0x10
    bg.ori r3, r10, 0x33f3
    bg.jal 0x23dd44
    bt.mov r11, r3
    bg.ori r3, r10, 0x33f4
    bg.jal 0x23dd44
    bt.mov r4, r3
    bt.mov r3, r11
    bt.movi r5, 0x4
    bt.mov r6, r1
    bg.jal 0x238e79
    bg.ori r3, r10, 0x33f1
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.lwz r12, 0x258(r1)
    bg.lwz r11, 0x25c(r1)
    bg.lwz r10, 0x260(r1)
    bg.lwz r9, 0x264(r1)
    bg.addi r1, r1, 0x268
    bt.jr r9
