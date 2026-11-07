# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x226100,0x226278); Initialize register fields and configure them from ENGINE-pair records at 0x47faa0 and 0x47fb98; bus and device behavior remain unresolved.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bg.movhi r7, 0x48
    bg.addi r11, r7, -0x560
loc_226116:
    bn.lwz r10, 0x0(r11)
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x2e
    bn.add r3, r10, r6
    bn.ori r4, r0, 0x40
    bg.jal 0x23dfb6
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xae
    bn.add r3, r10, r7
    bn.ori r4, r0, 0x40
    bg.jal 0x23dfb6
    bg.movhi r6, 0x5280
    bn.ori r6, r6, 0x2e
    bn.add r3, r10, r6
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r7, 0x3180
    bn.ori r7, r7, 0x52
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x3a
    bn.add r3, r10, r6
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x3b
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bn.lwz r7, 0x4(r11)
    bg.beqi r7, 0x0, loc_226211
    bn.lh r6, 0x4c(r11)
    bg.beqi r6, 0x0, loc_226211
    bg.lhz r7, 0xc8(r11)
    bt.add r7, r6
    bg.sfleui r7, 0x1400
    bn.bf loc_226244
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x47
    bn.add r3, r10, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x8
    bg.jal 0x23dead
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x21
    bn.add r3, r10, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dead
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x12
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23e2b8
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x52
    bn.add r3, r10, r6
    bt.movi r4, 0x0
    bg.jal 0x23e2b8
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x2a
    bn.add r3, r10, r7
    bg.lhz r4, 0xca(r11)
    bg.jal 0x23dfb6
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x2c
    bn.add r3, r10, r6
    bn.lh r4, 0x4e(r11)
    bg.jal 0x23dfb6
    bt.movi r12, 0x0
loc_2261ff:
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x26
    bn.add r3, r10, r7
    bt.mov r4, r12
    bg.jal 0x23dfb6
    bt.j loc_226223
loc_226211:
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x47
    bn.add r3, r10, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dead
loc_226223:
    bg.addi r11, r11, 0xf8
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x370
    bg.bne r11, r6, loc_226116
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_226244:
    bg.ori r7, r0, 0x1400
    bn.sub r7, r7, r6
    bg.ori r6, r0, 0xfff8
    bn.and r12, r7, r6
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x47
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dead
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x21
    bn.add r3, r10, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x8
    bg.jal 0x23dead
    bt.j loc_2261ff
