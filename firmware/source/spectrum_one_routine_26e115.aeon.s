# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e115,0x26e1bf); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r10, r3
    bt.mov r12, r4
    bt.mov r13, r5
    bg.jal 0x2250c5
    bn.ori r7, r0, 0xa8
    bn.muls r10, r10, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lh r10, 0x2a(r10)
    bn.movhi_2 r6, 0x80
    bn.and r7, r12, r6
    bn.beqi r7, 0x0, loc_26e1a2
    bn.beqi r10, 0x0, loc_26e18b
    bt.movi r11, 0x0
    bn.ori r14, r0, 0x7c
    bt.j loc_26e162
loc_26e15a:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_26e18b
loc_26e162:
    bn.extbz r6, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_26e15a
    bn.muls r7, r6, r14
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r3, 0x4(r7)
    bt.add r3, r12
    bt.mov r4, r13
    bg.jal 0x23ddb9
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_26e162
loc_26e18b:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_26e1a2:
    bt.mov r3, r12
    bt.mov r4, r13
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x23ddb9
