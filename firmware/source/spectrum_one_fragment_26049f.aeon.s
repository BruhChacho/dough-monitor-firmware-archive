# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26049f,0x26062f); byte-exact only; hardware untested.
    bn.lh r24, 0x4(r4)
    bn.lh r25, 0x6(r4)
    bg.bgtui r5, 0x7, loc_2604bb
    bn.slli r7, r5, 0x2
    bg.movhi r6, 0x33
    bg.addi r6, r6, -0x7eb8
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_2604bb:
    bt.movi r26, 0x0
    bt.movi r23, 0x0
loc_2604bf:
    bt.movi r6, -0x4
    bn.and r7, r24, r6
    bn.sh_1 0x4(r4), r7
    bn.sh_2 0x6(r4), r25
    bn.and r7, r26, r6
    bn.lh r6, 0x0(r4)
    bt.add r7, r6
    bn.sh_1 0x0(r4), r7
    bn.lh r7, 0x2(r4)
    bt.add r23, r7
    bn.sh_2 0x2(r4), r23
    bt.jr r9
    bn.lh r7, 0x6(r3)
    bn.muls r5, r24, r7
    bn.lh r3, 0x4(r3)
    bn.muls r6, r25, r3
    bg.ble r5, r6, loc_26061c
    bn.divu r6, r6, r7
    bt.mov r3, r25
loc_2604f4:
    bg.ori r7, r0, 0xfffe
    bn.and r6, r6, r7
    bn.and r5, r3, r7
    bt.j loc_26053b
    bn.slli r23, r24, 0x2
    bt.movi r26, 0x5
    bn.muls r7, r25, r26
    bn.srli r6, r7, 0x2
    bt.mov r5, r25
    bg.ble r23, r7, loc_260615
loc_260511:
    bg.ori r7, r0, 0xfffe
    bn.and r6, r6, r7
    bn.and r5, r5, r7
    bt.j loc_26053b
    bt.movi r26, 0x3
    bn.muls r7, r24, r26
    bn.slli r23, r25, 0x2
    bn.srli r5, r7, 0x2
    bt.mov r6, r24
    bg.ble r7, r23, loc_260511
loc_26052e:
    bn.divu r6, r23, r26
    bt.mov r5, r25
    bt.j loc_260511
    bn.lh r6, 0x4(r3)
    bn.lh r5, 0x6(r3)
loc_26053b:
    bn.sub r7, r24, r6
    bn.srli r7, r7, 0x1
    bn.exthz r26, r7
    bn.sub r7, r25, r5
    bn.srli r7, r7, 0x1
    bn.exthz r23, r7
    bt.mov r24, r6
    bt.mov r25, r5
    bt.j loc_2604bf
    bt.movi r26, 0x9
    bn.muls r7, r24, r26
    bn.slli r23, r25, 0x4
    bn.srli r5, r7, 0x4
    bt.mov r6, r24
    bg.ble r7, r23, loc_260511
    bt.j loc_26052e
    bn.lwz r7, 0x4(r3)
    bn.movhi_2 r6, 0x1e0
    bg.ori r6, r6, 0x280
    bn.sfeq r7, r6
    bn.bf loc_260623
    bn.movhi_2 r6, 0x1e0
    bg.ori r6, r6, 0x2d0
    bn.sfne r7, r6
    bn.bnf loc_260623
    bn.movhi_2 r6, 0x258
    bg.ori r6, r6, 0x320
    bn.sfeq r7, r6
    bn.bf loc_260627
    bn.movhi_2 r6, 0x2d0
    bg.ori r6, r6, 0x500
    bn.sfeq r7, r6
    bn.bf loc_260627
    bn.movhi_2 r6, 0x240
    bg.ori r6, r6, 0x2d0
    bn.sfeq r7, r6
    bn.bf loc_260627
    bn.movhi_2 r6, 0x300
    bg.ori r6, r6, 0x400
    bn.sfeq r7, r6
    bn.bf loc_26062b
    bn.movhi_2 r6, 0x300
    bg.ori r6, r6, 0x500
    bn.sfeq r7, r6
    bn.bf loc_26062b
    bn.movhi_2 r6, 0x400
    bg.ori r6, r6, 0x500
    bn.sfeq r7, r6
    bn.bf loc_26062b
    bn.movhi_2 r6, 0x41a
    bg.ori r6, r6, 0x690
    bn.sfeq r7, r6
    bn.bf loc_26062b
    bn.movhi_2 r6, 0x438
    bg.ori r6, r6, 0x780
    bn.sfeq r7, r6
    bn.bf loc_26062b
    bn.movhi_2 r6, 0x384
    bg.ori r6, r6, 0x5a0
    bn.sfeq r7, r6
    bn.bf loc_26062b
    bt.movi r5, 0x1
    bn.movhi_2 r6, 0x3c0
    bg.ori r6, r6, 0x500
    bn.sfeq r7, r6
    bn.bf loc_26062b
loc_260607:
    bn.lh r7, 0x4(r3)
    bn.muls r6, r5, r7
    bn.lh r3, 0x6(r3)
    bn.muls r5, r5, r3
    bt.j loc_26053b
loc_260615:
    bn.divu r5, r23, r26
    bt.mov r6, r24
    bt.j loc_260511
loc_26061c:
    bn.divu r3, r5, r3
    bt.mov r6, r24
    bt.j loc_2604f4
loc_260623:
    bt.movi r5, 0x4
    bt.j loc_260607
loc_260627:
    bt.movi r5, 0x3
    bt.j loc_260607
loc_26062b:
    bt.movi r5, 0x2
    bt.j loc_260607
