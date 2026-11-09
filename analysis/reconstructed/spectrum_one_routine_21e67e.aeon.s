# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21e67e,0x21e6ff); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bg.jal 0x222804
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_21e6de
    bn.lwz r7, 0x4(r3)
    bg.ori r6, r0, 0x400
    bn.and r7, r7, r6
    bn.beqi r7, 0x0, loc_21e6bb
    bn.lbz r3, 0x70(r3)
    bn.bnei r3, 0x0, loc_21e6de
loc_21e6bb:
    bt.mov r3, r11
    bg.jal 0x21e582
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x21e600
    bn.sub r10, r10, r3
    bt.addi r10, 0x1
    bn.exthz r3, r10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_21e6de:
    bt.mov r3, r11
    bg.jal 0x21e582
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x21e600
    bn.sub r10, r10, r3
    bn.exthz r3, r10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
