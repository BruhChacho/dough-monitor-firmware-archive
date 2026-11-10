# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2334ec,0x2336cd); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r12, r3
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r4, 0x74(r7)
    bg.jal 0x21bf85
    bt.mov r3, r12
    bg.jal 0x222804
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x4(r3)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_23364b
    bt.mov r3, r12
    bt.movi r4, 0x0
    bg.jal 0x21bf19
loc_23353b:
    bt.mov r3, r12
    bg.jal 0x22b6b2
    bt.mov r3, r12
    bg.jal 0x233214
    bt.mov r3, r12
    bg.jal 0x22cae2
    bt.mov r3, r12
    bg.jal 0x225e11
    bt.mov r3, r12
    bg.jal 0x22bb7d
    bt.mov r3, r12
    bg.jal 0x22f856
    bn.ori r7, r0, 0x7c
    bn.muls r11, r12, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r11, r6
    bn.lwz r10, 0x4(r11)
    bn.movhi_2 r7, 0xa80
    bn.ori r7, r7, 0xb8
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.movhi_2 r6, 0xa80
    bn.ori r6, r6, 0xba
    bn.add r3, r10, r6
    bn.lh r4, 0x48(r11)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xa80
    bn.ori r7, r7, 0xbc
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.movhi_2 r6, 0xa80
    bn.ori r6, r6, 0xbe
    bn.add r3, r10, r6
    bn.lh r4, 0x4a(r11)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xa80
    bn.ori r7, r7, 0xc8
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.movhi_2 r6, 0xa80
    bn.ori r6, r6, 0xca
    bn.add r3, r10, r6
    bn.lh r4, 0x38(r11)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xa80
    bn.ori r7, r7, 0xcc
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.movhi_2 r6, 0xa80
    bn.ori r6, r6, 0xce
    bn.add r3, r10, r6
    bn.lh r4, 0x3a(r11)
    bg.jal 0x23dfb6
    bn.lwz r10, 0x4(r11)
    bt.mov r3, r12
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bg.lbz r3, 0x83(r3)
    bn.beqi r3, 0x0, loc_233655
    bn.andi r7, r12, 0x1
    bg.bnei r7, 0x0, loc_233698
    bn.lbz r11, 0x29(r11)
    bg.beqi r11, 0x1, loc_2336bd
    bg.addi r3, r10, -0xde
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
loc_233629:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x82
    bn.add r3, r10, r6
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfe1
loc_23364b:
    bt.mov r3, r12
    bt.movi r4, 0x1
    bg.jal 0x21bf19
    bt.j loc_23353b
loc_233655:
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_233689
    bg.addi r3, r10, -0xde
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
loc_233668:
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x82
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfe1
loc_233689:
    bg.addi r3, r10, -0xde
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.j loc_233668
loc_233698:
    bn.lbz r11, 0x29(r11)
    bn.beqi r11, 0x1, loc_2336ad
    bg.addi r3, r10, -0xde
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bt.j loc_233629
loc_2336ad:
    bg.addi r3, r10, -0xde
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bt.j loc_233629
loc_2336bd:
    bg.addi r3, r10, -0xde
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.j loc_233629
