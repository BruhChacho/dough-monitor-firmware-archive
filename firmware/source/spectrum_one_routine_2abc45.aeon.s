# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2abc45,0x2abd99); byte-exact only; hardware untested.
    bn.lwz r6, 0x0(r3)
    bn.bleui r6, 0x1, loc_2abc6b
    bn.lwz r7, 0x0(r4)
    bn.bleui r7, 0x1, loc_2abc71
    bg.bnei r6, 0x4, loc_2abc6d
    bg.bnei r7, 0x4, loc_2abc6b
    bn.lwz r6, 0x4(r3)
    bn.lwz r7, 0x4(r4)
    bg.beq r6, r7, loc_2abc6b
    bg.movhi r7, 0x34
    bg.addi r3, r7, -0x4a00
loc_2abc6b:
    bt.jr r9
loc_2abc6d:
    bg.bnei r7, 0x4, loc_2abc75
loc_2abc71:
    bt.mov r3, r4
    bt.jr r9
loc_2abc75:
    bn.bnei r7, 0x2, loc_2abca0
    bn.bnei r6, 0x2, loc_2abc6b
    bn.sw 0x0(r5), r6
    bn.lwz r7, 0x4(r3)
    bn.sw 0x4(r5), r7
    bn.lwz r7, 0x8(r3)
    bn.sw 0x8(r5), r7
    bn.lwz r7, 0xc(r3)
    bn.sw 0xc(r5), r7
    bn.lwz r7, 0x4(r3)
    bn.lwz r6, 0x4(r4)
    bn.and r7, r7, r6
    bn.sw 0x4(r5), r7
    bt.mov r3, r5
    bt.jr r9
loc_2abca0:
    bn.beqi r6, 0x2, loc_2abc71
    bn.lwz r28, 0x8(r3)
    bn.lwz r27, 0x8(r4)
    bn.lwz r25, 0xc(r3)
    bn.lwz r24, 0xc(r4)
    bn.sub r26, r28, r27
    bn.srai r6, r26, 0x1f
    bn.xor r7, r6, r26
    bn.sub r7, r7, r6
    bn.sfgtsi r7, 0x1f
    bn.bnf loc_2abd44
    bg.bgts r28, r27, loc_2abd85
    bt.mov r28, r27
    bt.movi r25, 0x0
loc_2abcc9:
    bn.lwz r3, 0x4(r3)
    bn.lwz r7, 0x4(r4)
    bg.beq r3, r7, loc_2abd77
    bn.sub r6, r24, r25
    bn.sub r7, r25, r24
    bn.sfeqi r3, 0x0
    bn.cmov_0 r6, r7, r6
    bg.blesi r6, -0x1, loc_2abd89
    bn.sw 0x4(r5), r0
    bn.sw 0x8(r5), r28
    bn.sw 0xc(r5), r6
loc_2abcec:
    bn.lwz r6, 0xc(r5)
    bt.mov r23, r6
    bn.addi r7, r6, -0x1
    bg.movhi r4, 0x3fff
    bg.ori r4, r4, 0xfffe
    bn.sfleu r7, r4
    bn.bnf loc_2abd23
    bn.lwz r4, 0x8(r5)
loc_2abd05:
    bn.slli r6, r23, 0x1
    bt.addi r4, -0x1
    bt.mov r23, r6
    bn.addi r7, r6, -0x1
    bg.movhi r24, 0x3fff
    bg.ori r24, r24, 0xfffe
    bn.sfleu r7, r24
    bn.bf loc_2abd05
    bn.sw 0x8(r5), r4
    bn.sw 0xc(r5), r6
loc_2abd23:
    bt.movi r7, 0x3
    bn.sw 0x0(r5), r7
    bt.mov r3, r5
    bg.bgtsi r6, -0x1, loc_2abc6b
    bn.andi r7, r6, 0x1
    bn.srli r6, r6, 0x1
    bn.or r7, r7, r6
    bn.sw 0xc(r5), r7
    bn.lwz r7, 0x8(r5)
    bt.addi r7, 0x1
    bn.sw 0x8(r5), r7
    bt.jr r9
loc_2abd44:
    bg.bles r28, r27, loc_2abd5b
    bt.movi r23, 0x0
loc_2abd4a:
    bn.andi r6, r24, 0x1
    bn.srli r7, r24, 0x1
    bn.or r24, r6, r7
    bt.addi r23, 0x1
    bg.bne r26, r23, loc_2abd4a
    bt.add r27, r26
loc_2abd5b:
    bg.bles r27, r28, loc_2abcc9
    bt.movi r23, 0x0
    bn.sub r26, r27, r28
loc_2abd64:
    bn.andi r6, r25, 0x1
    bn.srli r7, r25, 0x1
    bn.or r25, r6, r7
    bt.addi r23, 0x1
    bg.bne r26, r23, loc_2abd64
    bt.add r28, r26
    bt.j loc_2abcc9
loc_2abd77:
    bn.sw 0x4(r5), r3
    bn.sw 0x8(r5), r28
    bn.add r6, r25, r24
    bn.sw 0xc(r5), r6
    bt.j loc_2abd23
loc_2abd85:
    bt.movi r24, 0x0
    bt.j loc_2abcc9
loc_2abd89:
    bt.movi r7, 0x1
    bn.sw 0x4(r5), r7
    bn.sw 0x8(r5), r28
    bn.sub r6, r0, r6
    bn.sw 0xc(r5), r6
    bt.j loc_2abcec
