# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x205200,0x2052b2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.sw 0x4(r1), r15
    bn.sw 0x0(r1), r16
    bt.mov r16, r4
    bt.mov r15, r5
    bt.mov r14, r6
    bt.mov r13, r7
    bt.mov r12, r8
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.lh r10, 0x2a(r3)
    bn.beqi r10, 0x0, loc_205295
    bt.movhi r11, -0xd
    bt.j loc_205275
loc_20523f:
    bn.ori r4, r0, 0x41
    bg.jal 0x23ddb9
    bg.addi r3, r11, 0x81
    bn.ori r4, r0, 0x18
loc_20524d:
    bg.jal 0x23ddb9
    bg.addi r3, r11, 0x84
    bt.mov r4, r15
    bg.jal 0x23ddb9
    bg.addi r3, r11, 0x85
    bt.mov r4, r14
    bg.jal 0x23ddb9
    bg.addi r3, r11, 0x86
    bt.mov r4, r13
    bg.jal 0x23ddb9
loc_20526f:
    bn.srli r10, r10, 0x1
    bn.beqi r10, 0x0, loc_205295
loc_205275:
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_20526f
    bn.slli r7, r12, 0x8
    bt.add r11, r7
    bg.addi r3, r11, 0x80
    bn.bnei r16, 0x0, loc_20523f
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.addi r3, r11, 0x81
    bt.movi r4, 0x0
    bt.j loc_20524d
loc_205295:
    bn.lwz r16, 0x0(r1)
    bn.lwz r15, 0x4(r1)
    bn.lwz r14, 0x8(r1)
    bn.lwz r13, 0xc(r1)
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
