# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2078d1,0x2079a1); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r10, r3
    bt.mov r11, r4
    bt.mov r13, r5
    bg.jal 0x2250c5
    bn.ori r7, r0, 0xa8
    bn.muls r10, r10, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lh r10, 0x2a(r10)
    bg.beqi r10, 0x0, loc_20798a
    bt.movi r12, 0x0
    bn.andi r14, r13, 0xf
    bt.j loc_207935
loc_20790e:
    bn.movhi_2 r7, 0x1c80
    bn.ori r7, r7, 0x4a
    bg.movhi r6, 0x5d80
    bn.ori r6, r6, 0x4a
    bg.bleui r13, 0xf, loc_207974
loc_20791f:
    bt.add r5, r6
    bn.add r3, r14, r5
    bt.mov r4, r11
    bn.ori r5, r0, 0x7f
    bg.jal 0x23dfe1
loc_20792d:
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.beqi r10, 0x0, loc_20798a
loc_207935:
    bn.extbz r4, r12
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_20792d
    bn.ori r7, r0, 0x7c
    bn.muls r7, r4, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r5, 0x4(r7)
    bn.extbs r7, r11
    bn.ori r6, r11, 0x40
    bn.sflesi r7, -0x1
    bn.cmov_0 r11, r6, r11
    bn.andi r7, r4, 0x1
    bn.bnei r7, 0x0, loc_20790e
    bg.movhi r6, 0x5d80
    bn.ori r6, r6, 0x5a
    bg.bgtui r13, 0xf, loc_20791f
    bn.movhi_2 r7, 0x1c80
    bn.ori r7, r7, 0x5a
loc_207974:
    bt.add r5, r7
    bn.add r3, r13, r5
    bt.mov r4, r11
    bn.ori r5, r0, 0x7f
    bg.jal 0x23dfe1
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.bnei r10, 0x0, loc_207935
loc_20798a:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
