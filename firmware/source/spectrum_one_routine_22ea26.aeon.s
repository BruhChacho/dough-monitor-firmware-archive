# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22ea26,0x22eb07); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.sw 0x4(r1), r15
    bn.sw 0x0(r1), r16
    bt.mov r10, r3
    bt.mov r13, r4
    bg.jal 0x2227ef
    bt.mov r14, r3
    bt.mov r3, r10
    bg.jal 0x222804
    bt.mov r16, r3
    bt.mov r11, r10
    bn.andi r7, r10, 0x2
    bg.bnei r7, 0x0, loc_22eae1
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r6, 0x18(r7)
    bn.lh r7, 0x1c(r7)
    bt.add r6, r7
    bt.mov r15, r13
    bt.mov r12, r10
    bg.sflesi r6, 0x780
    bn.bf loc_22eaff
loc_22ea7f:
    bt.movi r7, 0x1
    bn.sll r7, r7, r11
    bn.exthz r10, r7
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x22dc46
    bn.ori r7, r0, 0xa8
    bn.muls r3, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.lh r6, 0x2c(r3)
    bn.sra r7, r6, r11
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22eab1
    bn.sub r7, r6, r10
    bn.sh_1 0x2c(r3), r7
loc_22eab1:
    bn.lh r6, 0x2a(r3)
    bn.sub r7, r6, r10
    bn.sh_2 0x2a(r3), r7
    bt.mov r3, r16
    bt.mov r4, r12
    bg.jal 0x22acf2
    bt.mov r3, r15
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
loc_22eae1:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r7, 0x18(r7)
    bt.mov r15, r13
    bt.mov r12, r10
    bg.sfgti r7, 0x77f
    bn.bnf loc_22ea7f
loc_22eaff:
    bt.mov r12, r13
    bt.mov r15, r10
    bt.mov r11, r13
    bt.j loc_22ea7f
