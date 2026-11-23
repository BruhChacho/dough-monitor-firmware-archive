# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x28f78a,0x28f85d); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bg.movhi r12, 0x46
    bg.movhi r11, 0x46
    bg.lwz r7, -0x51a8(r12)
    bg.lwz r6, -0x51ac(r11)
    bt.add r7, r6
    bg.beqi r7, 0x0, loc_28f84f
    bg.jal 0x279dce
    bt.mov r10, r3
    bg.jal 0x23e3b6
    bg.movhi r7, 0x45
    bg.sbz 0x5212(r7), r0
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0x90
    bg.ori r3, r3, 0x2f02
    bt.movi r4, 0x5
    bg.jal 0x23ddb9
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
    bg.jal 0x279dce
    bn.sub r4, r3, r10
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0xd06
    bn.exthz r4, r4
    bg.jal 0x28f782
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0xcf4
    bg.lhz r4, -0x51a8(r12)
    bg.jal 0x28f782
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0xce1
    bg.lhz r4, -0x51ac(r11)
    bg.jal 0x28f782
    bg.lhz r4, -0x51ac(r11)
    bg.lhz r7, -0x51a8(r12)
    bt.add r4, r7
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0xcce
    bn.exthz r4, r4
    bg.jal 0x28f782
    bg.sw_0 -0x51ac(r11), r0
    bg.sw_0 -0x51a8(r12), r0
loc_28f834:
    bg.movhi r7, 0x46
    bg.sbz -0x51b0(r7), r0
    bt.movi r3, 0x1
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_28f84f:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0xcb8
    bg.jal 0x28f762
    bt.j loc_28f834
