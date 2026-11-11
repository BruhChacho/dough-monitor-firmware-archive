# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222bde,0x222c8d); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.lbz r7, 0x29(r3)
    bg.beqi r7, 0x3, loc_222c87
    bg.beqi r7, 0x5, loc_222c87
    bg.movhi r26, 0x48
    bn.ori r6, r0, 0x7c
    bn.muls r7, r10, r6
    bg.addi r5, r26, -0x564
    bt.add r7, r5
    bn.lh r4, 0x3a(r7)
    bn.lh r23, 0x38(r7)
    bn.lh r24, 0x36(r7)
    bn.lh r25, 0x34(r7)
    bn.muls r6, r11, r6
    bt.add r6, r5
    bn.lwz r5, 0x34(r6)
    bn.sw 0x34(r7), r5
    bn.lwz r5, 0x38(r6)
    bn.sw 0x38(r7), r5
    bn.sh_2 0x3a(r6), r4
    bn.sh_1 0x38(r6), r23
    bn.sh_2 0x36(r6), r24
    bn.sh_1 0x34(r6), r25
loc_222c45:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r10, r6
    bg.addi r5, r26, -0x564
    bt.add r7, r5
    bn.lh r4, 0x26(r7)
    bn.lh r23, 0x24(r7)
    bn.lh r24, 0x22(r7)
    bn.lh r25, 0x20(r7)
    bn.muls r6, r11, r6
    bt.add r6, r5
    bn.lwz r5, 0x20(r6)
    bn.sw 0x20(r7), r5
    bn.lwz r5, 0x24(r6)
    bn.sw 0x24(r7), r5
    bn.sh_2 0x26(r6), r4
    bn.sh_1 0x24(r6), r23
    bn.sh_2 0x22(r6), r24
    bn.sh_1 0x20(r6), r25
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_222c87:
    bg.movhi r26, 0x48
    bt.j loc_222c45
