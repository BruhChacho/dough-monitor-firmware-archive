# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2074a3,0x207545); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r4
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r10, 0x2a(r3)
    bn.beqi r10, 0x0, loc_207531
    bt.movi r11, 0x0
    bn.ori r13, r0, 0x7c
    bt.j loc_2074f3
loc_2074d4:
    bn.ff1 r4, r12
    bn.sub r4, r0, r4
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x2d
    bt.add r3, r7
    bn.srli r4, r4, 0x1f
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
loc_2074eb:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_207531
loc_2074f3:
    bn.extbz r6, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_2074eb
    bn.muls r7, r6, r13
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r3, 0x4(r7)
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_2074d4
    bn.ff1 r4, r12
    bn.sub r4, r0, r4
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0x31
    bt.add r3, r5
    bn.srli r4, r4, 0x1f
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_2074f3
loc_207531:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
