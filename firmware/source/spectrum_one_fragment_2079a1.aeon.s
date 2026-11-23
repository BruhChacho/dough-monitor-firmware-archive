# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2079a1,0x207a4b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r3
    bt.mov r12, r4
    bg.jal 0x2250c5
    bn.ori r7, r0, 0xa8
    bn.muls r10, r10, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r10, r5
    bn.lh r10, 0x2a(r10)
    bn.beqi r10, 0x0, loc_207a37
    bt.movi r11, 0x0
    bn.ori r13, r0, 0x7c
    bt.j loc_2079f8
loc_2079d8:
    bn.sfeqi r12, 0x0
    bn.movhi_2 r7, 0x1c80
    bn.ori r7, r7, 0x48
    bt.add r3, r7
    bn.ori r4, r0, 0x80
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
loc_2079f0:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_207a37
loc_2079f8:
    bn.extbz r6, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_2079f0
    bn.muls r7, r6, r13
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r3, 0x4(r7)
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_2079d8
    bn.sfeqi r12, 0x0
    bn.movhi_2 r5, 0x1c80
    bn.ori r5, r5, 0x48
    bt.add r3, r5
    bn.ori r4, r0, 0x40
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_2079f8
loc_207a37:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
