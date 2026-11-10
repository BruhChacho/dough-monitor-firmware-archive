# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21632e,0x21639c); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bg.jal 0x2162d2
    bt.movi r10, 0x0
    bn.beqi r3, 0x0, loc_21638d
    bt.mov r3, r11
    bg.jal 0x211817
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x278
    bt.add r3, r7
    bg.jal 0x23df85
    bt.movi r8, 0x0
    bt.mov r4, r8
    bg.ori r5, r0, 0x4b0
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bn.slli r7, r4, 0x19
    bn.srli r3, r3, 0x7
    bn.or r3, r7, r3
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x211855
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x104e
    bt.add r3, r7
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x2
    bn.slli r7, r10, 0x1
    bn.sfnei r3, 0x0
    bn.cmov_0 r10, r7, r10
loc_21638d:
    bt.mov r3, r10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
