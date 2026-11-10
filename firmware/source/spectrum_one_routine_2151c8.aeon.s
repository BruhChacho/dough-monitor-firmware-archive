# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2151c8,0x215297); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r10, r3
    bg.beqi r3, 0x1, loc_215271
    bn.bgtui r3, 0x0, loc_21525f
loc_2151e6:
    bt.mov r3, r10
    bg.jal 0x211855
    bt.mov r14, r3
    bn.addi r3, r10, 0x1
loc_2151f1:
    bg.jal 0x211855
    bt.mov r13, r3
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x1062
    bn.add r12, r3, r7
loc_215200:
    bt.movi r11, 0x0
loc_215202:
    bt.mov r3, r12
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x40
    bn.beqi r3, 0x0, loc_21527e
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x1066
    bn.add r3, r14, r7
    bg.jal 0x23df85
    bt.mov r10, r3
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x1066
    bn.add r3, r13, r7
    bg.jal 0x23df85
    bn.sub r10, r10, r3
    bn.srai r7, r10, 0x1f
    bn.xor r10, r7, r10
    bn.sub r10, r10, r7
    bg.bgtsi r10, 0xa, loc_21527e
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bn.sfnei r11, 0x14
    bn.bf loc_215202
    bt.movi r3, 0x1
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_21525f:
    bn.beqi r3, 0x2, loc_2151e6
    bn.beqi r3, 0x3, loc_215271
    bt.movi r14, 0x0
    bt.movi r13, 0x0
    bt.movhi r7, -0x9
    bg.ori r12, r7, 0x1062
    bt.j loc_215200
loc_215271:
    bt.mov r3, r10
    bg.jal 0x211855
    bt.mov r14, r3
    bn.addi r3, r10, -0x1
    bt.j loc_2151f1
loc_21527e:
    bt.movi r3, 0x0
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
