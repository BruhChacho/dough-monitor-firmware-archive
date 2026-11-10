# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x226701,0x22683c); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.ori r7, r0, 0xb0
    bn.muls r6, r4, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bg.lbz r24, 0x89(r6)
    bg.lwz r23, 0x80(r6)
    bg.beqi r4, 0x6, loc_22679c
    bn.ori r7, r0, 0xa8
    bn.muls r5, r3, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, 0x21ec
    bt.add r5, r25
    bg.lbz r7, 0x81(r5)
    bn.bnei r7, 0x0, loc_22679c
    bn.lbz r25, 0x70(r6)
    bn.beqi r25, 0x0, loc_226750
loc_226744:
    bt.movi r3, 0x1
loc_226746:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_226750:
    bn.lwz r7, 0x4(r6)
    bg.ori r25, r0, 0x800
    bn.and r7, r7, r25
    bn.bnei r7, 0x0, loc_226744
    bg.lbz r7, 0x94(r5)
    bn.beqi r7, 0x0, loc_2267a8
    bn.beqi r23, 0x0, loc_2267a8
    bg.lbz r25, 0x97(r5)
    bn.beqi r25, 0x0, loc_2267e2
    bn.bnei r23, 0x1, loc_22677c
    bg.lbz r5, 0x95(r5)
    bn.beqi r5, 0x0, loc_22677c
    bg.beqi r24, 0x4, loc_2267eb
loc_22677c:
    bt.mov r3, r10
    bg.jal 0x222ea6
    bt.mov r6, r3
loc_226784:
    bt.mov r3, r6
    bn.bnei r6, 0x0, loc_226746
loc_226789:
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x2262ce
    bn.ff1 r3, r3
    bn.sub r3, r0, r3
    bn.srli r3, r3, 0x1f
    bt.j loc_226746
loc_22679c:
    bt.movi r3, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_2267a8:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r4, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bg.lbz r7, 0x88(r7)
    bn.beqi r7, 0x0, loc_226789
    bn.ori r7, r0, 0xa8
    bn.muls r7, r10, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, 0x21ec
    bt.add r7, r25
    bn.addi r6, r24, -0x1
    bn.extbz r6, r6
    bg.lbz r7, 0x95(r7)
    bn.bnei r7, 0x0, loc_226784
    bg.bgtui r24, 0x3, loc_226744
    bt.j loc_226789
loc_2267e2:
    bn.beqi r23, 0x1, loc_226813
    bn.beqi r23, 0x2, loc_2267eb
    bn.beqi r23, 0x3, loc_2267ef
loc_2267eb:
    bt.movi r3, 0x3
    bt.j loc_226746
loc_2267ef:
    bg.lbz r5, 0x95(r5)
    bn.beqi r5, 0x0, loc_22680f
    bg.lbz r7, 0x88(r6)
    bn.slli r7, r7, 0x1
    bt.addi r7, 0x2
    bn.muls r7, r24, r7
    bt.addi r7, -0x1
    bn.extbz r6, r7
    bg.bgtui r6, 0x3, loc_226784
    bg.bnei r6, 0x1, loc_226784
loc_22680f:
    bt.movi r3, 0x2
    bt.j loc_226746
loc_226813:
    bg.lbz r5, 0x95(r5)
    bn.beqi r5, 0x0, loc_22682a
    bg.lbz r7, 0x88(r6)
    bt.addi r7, 0x1
    bn.muls r7, r24, r7
    bt.addi r7, -0x1
    bn.extbz r6, r7
    bt.j loc_226784
loc_22682a:
    bg.lbz r7, 0x88(r6)
    bt.addi r7, 0x1
    bn.slli r6, r24, 0x1
    bn.muls r7, r7, r6
    bg.bgtsi r7, 0x7, loc_226744
    bt.j loc_226789
