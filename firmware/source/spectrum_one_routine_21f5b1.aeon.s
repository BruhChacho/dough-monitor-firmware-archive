# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21f5b1,0x21f61e); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.mov r10, r4
    bg.jal 0x21d3b1
    bn.ori r7, r0, 0xb0
    bn.muls r7, r10, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r7, 0x1c(r7)
    bn.andi r7, r7, 0x20
    bn.bnei r7, 0x0, loc_21f5f3
    bn.addi r3, r3, 0x24
    bt.mov r4, r10
    bg.jal 0x23a5ea
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_21f5f3:
    bt.mov r3, r11
    bg.jal 0x2227ef
    bn.ori r7, r0, 0x58
    bn.muls r7, r10, r7
    bt.add r7, r3
    bn.slli r7, r7, 0x1
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lh r3, 0x34(r7)
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
