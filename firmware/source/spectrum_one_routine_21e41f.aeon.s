# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21e41f,0x21e4e8); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r3
    bt.mov r11, r4
    bt.mov r3, r4
    bg.jal 0x21d3b1
    bt.mov r13, r3
    bt.mov r3, r11
    bg.jal 0x222804
    bn.ori r7, r0, 0x7c
    bn.muls r10, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r10, r6
    bn.sbz 0x28(r10), r0
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x4(r3)
    bg.ori r6, r0, 0x400
    bn.and r7, r7, r6
    bn.beqi r7, 0x0, loc_21e479
    bn.lbz r3, 0x70(r3)
    bn.bnei r3, 0x0, loc_21e4c4
loc_21e479:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.beqi r7, 0x0, loc_21e4a4
    bn.addi r3, r13, 0xa
    bg.ori r7, r0, 0x1fff
    bn.and r4, r12, r7
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23e58a
loc_21e4a4:
    bn.addi r3, r13, 0xa
    bg.ori r6, r0, 0x1fff
    bn.and r4, r12, r6
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23dfb6
loc_21e4c4:
    bt.mov r3, r11
    bg.jal 0x21d913
    bt.addi r3, 0x1
    bn.exthz r3, r3
    bn.sbz 0x28(r10), r0
    bn.divu r6, r12, r3
    bn.beqi r6, 0x0, loc_21e4dd
    bt.movi r7, 0x1
    bn.sbz 0x28(r10), r7
loc_21e4dd:
    bn.muls r7, r6, r3
    bn.sub r7, r12, r7
    bn.exthz r12, r7
    bt.j loc_21e479
