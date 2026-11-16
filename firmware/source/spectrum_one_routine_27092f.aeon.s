# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27092f,0x27099e); byte-exact only; hardware untested.
    bt.mov r6, r3
    bn.extbz r4, r4
    bn.andi r7, r3, 0x3
    bt.mov r23, r5
    bn.beqi r7, 0x0, loc_27094c
    bn.extbz r24, r4
loc_27093f:
    bn.sbz 0x0(r6), r24
    bt.addi r6, 0x1
    bt.addi r23, -0x1
    bn.andi r7, r6, 0x3
    bn.bnei r7, 0x0, loc_27093f
loc_27094c:
    bt.mov r24, r6
    bn.slli r7, r4, 0x8
    bn.slli r6, r4, 0x18
    bn.slli r5, r4, 0x10
    bn.or r6, r6, r5
    bn.or r6, r4, r6
    bn.or r7, r7, r6
    bg.bleui r23, 0xf, loc_270979
loc_270964:
    bn.sw 0x0(r24), r7
    bn.sw 0x4(r24), r7
    bn.sw 0x8(r24), r7
    bn.sw 0xc(r24), r7
    bn.addi r24, r24, 0x10
    bt.addi r23, -0x10
    bg.bgtui r23, 0xf, loc_270964
loc_270979:
    bn.bleui r23, 0x3, loc_270986
loc_27097c:
    bn.sw 0x0(r24), r7
    bt.addi r24, 0x4
    bt.addi r23, -0x4
    bn.bgtui r23, 0x3, loc_27097c
loc_270986:
    bn.beqi r23, 0x0, loc_270998
    bt.mov r7, r24
    bn.extbz r4, r4
loc_27098e:
    bn.sbz 0x0(r7), r4
    bt.addi r7, 0x1
    bt.addi r23, -0x1
    bn.bnei r23, 0x0, loc_27098e
loc_270998:
    bg.syncwritebuffer 
    bt.jr r9
