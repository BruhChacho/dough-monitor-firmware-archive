# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x223126,0x2231d9); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bn.ori r7, r0, 0xa8
    bn.muls r11, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r11, r7
    bg.lbz r10, 0x98(r11)
    bg.jal 0x2227da
    bg.jal 0x222819
    bg.jal 0x21d78e
    bt.mov r23, r3
    bn.beqi r10, 0x0, loc_223199
    bt.movi r6, 0x0
    bt.mov r4, r11
loc_22315a:
    bn.extbz r3, r6
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_223191
    bn.bgtui r3, 0x3, loc_223191
    bn.ori r7, r0, 0x18
    bn.muls r11, r3, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x5c4
    bt.add r11, r24
    bn.lbz r7, 0x0(r11)
    bn.beqi r7, 0x0, loc_223191
    bn.lh r5, 0x2c(r4)
    bn.lh r24, 0xc(r11)
    bn.and r7, r5, r24
    bn.bnei r7, 0x0, loc_2231a8
    bn.lh r24, 0xe(r11)
    bn.and r7, r5, r24
    bn.bnei r7, 0x0, loc_2231a8
loc_223191:
    bn.srli r10, r10, 0x1
    bt.addi r6, 0x1
    bn.bnei r10, 0x0, loc_22315a
loc_223199:
    bt.mov r3, r23
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_2231a8:
    bn.slli r3, r3, 0x8
    bt.movhi r7, -0xd
    bg.ori r7, r7, 0x1414
    bt.add r3, r7
    bg.jal 0x23df85
    bn.lwz r6, 0x4(r11)
    bt.movi r24, -0x2
    bn.and r6, r6, r24
    bt.movi r7, 0x4
    bn.sub r7, r7, r6
    bn.muls r3, r3, r7
    bn.exthz r23, r3
    bt.mov r3, r23
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
