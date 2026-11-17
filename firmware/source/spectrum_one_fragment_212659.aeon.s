# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x212659,0x2126c6); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r4
    bn.slli r10, r3, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x2710
    bn.add r11, r10, r7
    bt.mov r3, r11
    bg.jal 0x23dd44
    bt.mov r13, r3
    bt.mov r3, r11
    bt.movi r4, 0x1
    bt.movi r5, 0xf
    bg.jal 0x23dfe1
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x271f
    bn.add r3, r10, r7
    bg.jal 0x23dd44
    bn.bleui r3, 0x1, loc_2126bf
    bt.movi r7, 0x8
    bn.sbz 0x0(r12), r7
loc_2126a0:
    bt.mov r3, r11
    bt.mov r4, r13
    bg.jal 0x23ddb9
    bn.lbz r3, 0x0(r12)
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_2126bf:
    bt.movi r7, 0x2
    bn.sbz 0x0(r12), r7
    bt.j loc_2126a0
