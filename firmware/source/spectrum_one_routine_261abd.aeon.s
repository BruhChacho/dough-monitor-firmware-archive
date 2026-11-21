# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x261abd,0x261b76); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bt.mov r10, r3
    bg.movhi r11, 0x3b
    bg.lwz r7, 0x5f38(r11)
    bn.lbz r12, 0x5a(r7)
    bt.movi r4, 0x0
    bg.jal 0x206417
    bg.movhi r6, 0x45
    bg.lbz r5, 0x51ee(r6)
    bn.andi r7, r5, 0xf7
    bg.sbz 0x51ee(r6), r7
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bg.jal 0x2383db
    bg.movhi r7, 0x3b
    bg.lbz r7, 0x7464(r7)
    bn.bnei r7, 0x0, loc_261b52
loc_261b01:
    bg.lwz r6, 0x5f38(r11)
    bg.lbz r7, 0x9c(r6)
    bn.bnei r7, 0x0, loc_261b23
    bg.lbz r5, 0xa8(r6)
    bn.bnei r5, 0x0, loc_261b23
    bg.movhi r7, 0x48
    bg.lbz r7, -0x4cb(r7)
    bt.add r7, r6
    bn.lbz r7, 0x50(r7)
    bn.beqi r7, 0x1, loc_261b70
loc_261b23:
    bg.lwz r7, 0x5f38(r11)
    bn.sbz 0x5a(r7), r10
    bt.mov r3, r10
    bg.jal 0x23a181
    bg.jal 0x26a077
    bt.mov r3, r10
    bg.jal 0x23a17d
    bg.lwz r7, 0x5f38(r11)
    bn.sbz 0x5a(r7), r12
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_261b52:
    bt.mov r3, r10
    bt.mov r4, r1
    bg.jal 0x23ecff
    bt.mov r3, r10
    bn.lwz r4, 0x0(r1)
    bn.lwz r5, 0x4(r1)
    bt.movi r6, 0x1
    bg.jal 0x25469c
    bt.mov r3, r10
    bg.jal 0x25445a
    bt.j loc_261b01
loc_261b70:
    bg.jal 0x225df0
    bt.j loc_261b23
