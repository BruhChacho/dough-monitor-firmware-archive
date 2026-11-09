# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21e86c,0x21e948); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r3
    bg.jal 0x222804
    bt.mov r13, r3
    bn.ori r7, r0, 0xb0
    bn.muls r6, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r6, r5
    bn.lwz r7, 0x4(r6)
    bg.ori r5, r0, 0x400
    bn.and r7, r7, r5
    bn.beqi r7, 0x0, loc_21e8a9
    bn.lbz r6, 0x70(r6)
    bn.bnei r6, 0x0, loc_21e921
loc_21e8a9:
    bt.mov r3, r12
    bg.jal 0x21e6ff
    bt.mov r10, r3
    bt.mov r3, r12
    bg.jal 0x21e7c3
    bn.sub r10, r10, r3
    bt.addi r10, 0x1
    bn.exthz r6, r10
loc_21e8bf:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bg.lbz r5, 0x89(r7)
    bn.muls r6, r6, r5
    bn.exthz r10, r6
    bn.lwz r3, 0x0(r7)
    bt.movi r4, 0x0
    bg.jal 0x20ece9
    bn.andi r7, r3, 0x3
    bn.beqi r7, 0x0, loc_21e944
    bn.sub r7, r10, r3
    bn.sfeqi r7, 0x2
    bn.cmov_0 r6, r3, r10
loc_21e8f1:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bg.lbz r3, 0x88(r7)
    bt.addi r3, 0x1
    bn.muls r3, r3, r6
    bn.exthz r3, r3
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_21e921:
    bt.mov r3, r12
    bg.jal 0x21d913
    bt.mov r11, r3
    bt.mov r3, r12
    bg.jal 0x21e7c3
    bt.mov r10, r3
    bt.mov r3, r12
    bg.jal 0x21e6ff
    bn.sub r10, r10, r3
    bn.sub r11, r11, r10
    bt.addi r11, 0x2
    bn.exthz r6, r11
    bt.j loc_21e8bf
loc_21e944:
    bt.mov r6, r10
    bt.j loc_21e8f1
