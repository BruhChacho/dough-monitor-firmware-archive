# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27fad3,0x27fbbf); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x24c2
    bg.jal 0x27f422
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x24ae
    bn.lbz r4, 0x3(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x24a4
    bn.lh r4, 0x16(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2491
    bn.lh r4, 0x18(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x247e
    bn.lh r4, 0x1a(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2470
    bn.lh r4, 0x1c(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2461
    bn.lh r4, 0x6(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2456
    bn.lh r4, 0x8(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x244b
    bn.lh r4, 0xa(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2440
    bn.lh r4, 0xc(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2435
    bn.lh r4, 0xe(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x242a
    bn.lh r4, 0x10(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x241f
    bn.lh r4, 0x12(r10)
    bg.jal 0x27f95e
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x2414
    bn.lh r4, 0x14(r10)
    bg.jal 0x27f95e
    bn.lbz r3, 0x3(r10)
    bn.srli r3, r3, 0x1
    bn.andi r3, r3, 0x1
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
