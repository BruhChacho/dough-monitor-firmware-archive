# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21e36f,0x21e41f); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r11, r3
    bt.mov r10, r4
    bt.mov r3, r4
    bg.jal 0x21d3b1
    bt.mov r12, r3
    bt.mov r3, r10
    bg.jal 0x222804
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lwz r7, 0x4(r3)
    bg.ori r6, r0, 0x400
    bn.and r7, r7, r6
    bg.ori r6, r0, 0x1fff
    bn.and r4, r11, r6
    bn.beqi r7, 0x0, loc_21e3c0
    bn.lbz r3, 0x70(r3)
    bn.bnei r3, 0x0, loc_21e3f7
loc_21e3b9:
    bg.ori r7, r0, 0x1fff
    bn.and r4, r11, r7
loc_21e3c0:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.beqi r7, 0x0, loc_21e3e1
    bn.addi r3, r12, 0x8
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23e58a
loc_21e3e1:
    bn.addi r3, r12, 0x8
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfb6
loc_21e3f7:
    bn.beqi r11, 0x0, loc_21e3b9
    bg.ori r4, r0, 0x1fff
    bg.sfnei r11, 0x1fff
    bn.bnf loc_21e3c0
    bn.ori r7, r0, 0x7c
    bn.muls r7, r10, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lbz r7, 0x28(r7)
    bt.add r7, r11
    bn.and r4, r7, r4
    bt.j loc_21e3c0
