# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21e600,0x21e67e); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bg.jal 0x21d3b1
    bt.mov r12, r3
    bt.mov r3, r10
    bg.jal 0x222804
    bt.mov r11, r3
    bn.ori r7, r0, 0xb0
    bn.muls r7, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r7, 0x1c(r7)
    bn.andi r7, r7, 0x20
    bn.bnei r7, 0x0, loc_21e64f
    bn.addi r3, r12, 0x24
    bg.jal 0x23df85
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_21e64f:
    bt.mov r3, r10
    bg.jal 0x2227ef
    bn.ori r7, r0, 0x58
    bn.muls r7, r11, r7
    bt.add r7, r3
    bn.slli r7, r7, 0x1
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lh r3, 0x34(r7)
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
