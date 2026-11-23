# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x207545,0x20762c); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.sw 0x4(r1), r15
    bn.sw 0x0(r1), r16
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lh r15, 0x2a(r3)
    bg.beqi r15, 0x0, loc_20760f
    bt.movi r16, 0x0
    bt.j loc_207584
loc_20757b:
    bn.srli r15, r15, 0x1
    bt.addi r16, 0x1
    bg.beqi r15, 0x0, loc_20760f
loc_207584:
    bn.extbz r6, r16
    bn.andi r7, r15, 0x1
    bn.beqi r7, 0x0, loc_20757b
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r12, 0x4(r7)
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0xe
    bn.add r3, r12, r7
    bg.jal 0x23df85
    bt.mov r11, r3
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0xc
    bn.add r3, r12, r6
    bg.jal 0x23df85
    bt.mov r14, r3
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0xa
    bn.add r3, r12, r7
    bg.jal 0x23df85
    bt.mov r10, r3
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x8
    bn.add r3, r12, r6
    bg.jal 0x23df85
    bt.mov r13, r3
    bn.sub r11, r11, r14
    bt.addi r11, 0x1
    bn.movhi_2 r7, 0x1b80
    bn.ori r7, r7, 0x1e
    bn.add r3, r12, r7
    bn.exthz r4, r11
    bg.jal 0x23dfb6
    bn.sub r10, r10, r13
    bt.addi r10, 0x1
    bn.movhi_2 r6, 0x1b80
    bn.ori r6, r6, 0x1c
    bn.add r3, r12, r6
    bn.exthz r4, r10
    bg.jal 0x23dfb6
    bn.srli r15, r15, 0x1
    bt.addi r16, 0x1
    bg.bnei r15, 0x0, loc_207584
loc_20760f:
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
