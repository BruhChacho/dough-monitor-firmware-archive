# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x207028,0x2070f3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r13, r4
    bt.mov r12, r5
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r10, 0x2a(r3)
    bn.beqi r10, 0x0, loc_2070ab
    bt.movi r11, 0x0
    bt.j loc_20707b
loc_207058:
    bn.beqi r13, 0x1, loc_2070bf
    bn.sfeqi r12, 0x0
    bn.movhi_2 r5, 0x1a80
    bn.ori r5, r5, 0x1e
loc_207064:
    bt.add r3, r5
    bn.ori r4, r0, 0xf0
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0xff
    bg.jal 0x23dfe1
loc_207073:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_2070ab
loc_20707b:
    bn.extbz r6, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_207073
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r3, 0x4(r7)
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_207058
    bn.beqi r13, 0x1, loc_2070d9
    bn.sfeqi r12, 0x0
    bn.movhi_2 r5, 0x1a80
    bn.ori r5, r5, 0x1f
    bt.j loc_207064
loc_2070ab:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_2070bf:
    bn.sfeqi r12, 0x0
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0xae
    bt.add r3, r7
    bn.ori r4, r0, 0x40
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bt.j loc_207073
loc_2070d9:
    bn.sfeqi r12, 0x0
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0xae
    bt.add r3, r7
    bn.ori r4, r0, 0x80
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.j loc_207073
