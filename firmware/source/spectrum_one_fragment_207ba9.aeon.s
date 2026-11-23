# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x207ba9,0x207cb6); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r3
    bt.mov r13, r4
    bg.jal 0x2250c5
    bn.ori r7, r0, 0xa8
    bn.muls r10, r10, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r10, r5
    bn.lh r11, 0x2a(r10)
    bg.beqi r11, 0x0, loc_207ca2
    bt.movi r12, 0x0
    bt.j loc_207c31
loc_207bde:
    bn.sfeqi r13, 0x0
    bg.movhi r7, 0x2b80
    bn.ori r7, r7, 0xc0
    bn.add r3, r10, r7
    bn.ori r4, r0, 0x40
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2b80
    bn.ori r5, r5, 0xd8
    bn.add r3, r10, r5
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r7, 0x5e80
    bn.ori r7, r7, 0xd8
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r5, 0x2b80
    bn.ori r5, r5, 0xd6
    bn.add r3, r10, r5
    bn.ori r4, r0, 0x11
    bg.jal 0x23ddb9
loc_207c29:
    bn.srli r11, r11, 0x1
    bt.addi r12, 0x1
    bn.beqi r11, 0x0, loc_207ca2
loc_207c31:
    bn.extbz r6, r12
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_207c29
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r10, 0x4(r7)
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_207bde
    bn.sfeqi r13, 0x0
    bg.movhi r7, 0x2b80
    bn.ori r7, r7, 0xc0
    bn.add r3, r10, r7
    bn.cmovsi_2 r4, r0, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.movhi r5, 0x2b80
    bn.ori r5, r5, 0xda
    bn.add r3, r10, r5
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r7, 0x5e80
    bn.ori r7, r7, 0xda
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r5, 0x9880
    bn.ori r5, r5, 0xd0
    bn.add r3, r10, r5
    bn.ori r4, r0, 0x11
    bg.jal 0x23ddb9
    bn.srli r11, r11, 0x1
    bt.addi r12, 0x1
    bn.bnei r11, 0x0, loc_207c31
loc_207ca2:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
