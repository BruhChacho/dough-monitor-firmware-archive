# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27099e,0x270a8f); byte-exact only; hardware untested.
    bt.mov r6, r3
    bn.andi r25, r3, 0x3
    bn.andi r23, r4, 0x3
    bt.mov r24, r5
    bg.beq r25, r23, loc_270a63
loc_2709ac:
    bn.or r7, r23, r25
    bn.bnei r7, 0x0, loc_270a0b
    bt.mov r5, r6
    bg.bleui r24, 0xf, loc_2709dc
loc_2709b8:
    bn.lwz r7, 0x0(r4)
    bn.sw 0x0(r5), r7
    bn.lwz r7, 0x4(r4)
    bn.sw 0x4(r5), r7
    bn.lwz r7, 0x8(r4)
    bn.sw 0x8(r5), r7
    bn.lwz r7, 0xc(r4)
    bn.sw 0xc(r5), r7
    bn.addi r5, r5, 0x10
    bn.addi r4, r4, 0x10
    bt.addi r24, -0x10
    bg.bgtui r24, 0xf, loc_2709b8
loc_2709dc:
    bn.bleui r24, 0x3, loc_2709ee
loc_2709df:
    bn.lwz r7, 0x0(r4)
    bn.sw 0x0(r5), r7
    bt.addi r5, 0x4
    bt.addi r4, 0x4
    bt.addi r24, -0x4
    bn.bgtui r24, 0x3, loc_2709df
loc_2709ee:
    bn.beqi r24, 0x0, loc_270a05
    bt.movi r23, 0x0
loc_2709f3:
    bn.add r7, r23, r5
    bn.add r6, r4, r23
    bn.lbz r6, 0x0(r6)
    bn.sbz 0x0(r7), r6
    bt.addi r23, 0x1
    bg.bne r23, r24, loc_2709f3
loc_270a05:
    bg.syncwritebuffer 
    bt.jr r9
loc_270a0b:
    bn.beqi r25, 0x2, loc_270a45
    bn.bnei r25, 0x0, loc_270a48
    bn.bnei r23, 0x2, loc_270a48
loc_270a14:
    bt.mov r23, r6
    bn.bleui r24, 0x1, loc_270a28
loc_270a19:
    bn.lh r7, 0x0(r4)
    bn.sh_1 0x0(r23), r7
    bt.addi r23, 0x2
    bt.addi r4, 0x2
    bt.addi r24, -0x2
    bn.bgtui r24, 0x1, loc_270a19
loc_270a28:
    bn.beqi r24, 0x0, loc_270a05
    bt.movi r5, 0x0
loc_270a2d:
    bn.add r7, r5, r23
    bn.add r6, r4, r5
    bn.lbz r6, 0x0(r6)
    bn.sbz 0x0(r7), r6
    bt.addi r5, 0x1
    bg.bne r5, r24, loc_270a2d
    bg.syncwritebuffer 
    bt.jr r9
loc_270a45:
    bn.beqi r23, 0x0, loc_270a14
loc_270a48:
    bt.mov r5, r6
    bt.add r6, r24
    bn.beqi r24, 0x0, loc_270a05
loc_270a4f:
    bn.lbz r7, 0x0(r4)
    bn.sbz 0x0(r5), r7
    bt.addi r5, 0x1
    bt.addi r4, 0x1
    bg.bne r5, r6, loc_270a4f
    bg.syncwritebuffer 
    bt.jr r9
loc_270a63:
    bn.beqi r23, 0x0, loc_270a89
    bn.beqi r5, 0x0, loc_270a89
    bn.add r5, r3, r23
    bt.j loc_270a71
loc_270a6e:
    bn.beqi r24, 0x0, loc_270a81
loc_270a71:
    bn.lbz r7, 0x0(r4)
    bn.sbz 0x0(r6), r7
    bt.addi r6, 0x1
    bt.addi r4, 0x1
    bt.addi r24, -0x1
    bg.bne r6, r5, loc_270a6e
loc_270a81:
    bn.andi r25, r6, 0x3
    bn.andi r23, r4, 0x3
    bt.j loc_2709ac
loc_270a89:
    bt.mov r24, r5
    bt.mov r23, r25
    bt.j loc_2709ac
