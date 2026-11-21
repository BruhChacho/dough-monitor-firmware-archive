# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20444d,0x2044bd); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bg.movhi r10, 0x48
    bg.addi r10, r10, -0x1eac
    bt.mov r4, r10
    bg.ori r5, r0, 0x3ca
    bg.jal 0x2461d6
    bg.movhi r7, 0x48
    bg.addi r11, r7, -0x1ea4
    bt.mov r3, r11
    bg.ori r4, r0, 0x3c0
    bg.jal 0x204080
    bg.lbz r6, 0x3c8(r10)
    bg.lbz r7, 0x3c9(r10)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r6
    bn.exths r3, r3
    bn.exths r7, r7
    bg.beq r3, r7, loc_2044a3
loc_204494:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x2040d2
loc_2044a3:
    bt.mov r3, r11
    bg.ori r4, r0, 0x3c0
    bg.jal 0x20409a
    bn.bnei r3, 0x0, loc_204494
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
