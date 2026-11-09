# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22683c,0x22699f); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bn.sw 0x4(r1), r16
    bn.sw 0x0(r1), r17
    bt.mov r13, r3
    bn.ori r7, r0, 0xa8
    bn.muls r6, r3, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r6, r4
    bn.lbz r7, 0x29(r6)
    bn.lh r5, 0x2c(r6)
    bn.lh r24, 0x2a(r6)
    bn.or r10, r5, r24
    bg.beqi r10, 0x0, loc_226934
    bt.movi r15, 0x0
    bt.movi r12, 0x0
    bn.ori r14, r0, 0x7c
    bt.addi r7, -0x1
    bn.extbz r17, r7
    bt.mov r16, r6
    bt.j loc_226894
loc_22688c:
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.beqi r10, 0x0, loc_2268e2
loc_226894:
    bn.extbz r11, r12
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_22688c
    bt.mov r3, r13
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_226954
    bn.muls r6, r11, r14
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r6, r4
    bn.lh r7, 0x40(r6)
    bn.srli r7, r7, 0x1
    bg.ori r5, r0, 0x7fc0
    bn.and r7, r7, r5
    bn.lh r6, 0x34(r6)
    bg.ble r7, r6, loc_226961
loc_2268ca:
    bn.muls r7, r11, r14
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.sbz 0x78(r7), r0
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.bnei r10, 0x0, loc_226894
loc_2268e2:
    bn.lh r6, 0x2c(r16)
    bn.lh r7, 0x2a(r16)
    bn.or r5, r6, r7
    bn.beqi r5, 0x0, loc_226934
    bt.movi r4, 0x0
    bn.ori r23, r0, 0x7c
    bt.j loc_22690a
loc_2268f5:
    bg.beqi r7, 0x1, loc_226988
    bn.lh r24, 0x40(r6)
    bn.sub r7, r24, r15
    bn.sh_2 0x7a(r6), r7
loc_226902:
    bn.srli r5, r5, 0x1
    bt.addi r4, 0x1
    bn.beqi r5, 0x0, loc_226934
loc_22690a:
    bn.extbz r6, r4
    bn.andi r7, r5, 0x1
    bn.beqi r7, 0x0, loc_226902
    bn.muls r6, r6, r23
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r6, r24
    bn.lbz r7, 0x78(r6)
    bn.bnei r7, 0x2, loc_2268f5
    bn.lh r7, 0x40(r6)
    bn.sh_2 0x7a(r6), r7
    bn.srli r5, r5, 0x1
    bt.addi r4, 0x1
    bn.bnei r5, 0x0, loc_22690a
loc_226934:
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
loc_226954:
    bt.mov r3, r13
    bg.jal 0x2250c5
    bn.extbz r3, r3
    bg.beqi r3, 0x1, loc_2268ca
loc_226961:
    bn.muls r6, r11, r14
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r6, r7
    bt.movi r7, 0x1
    bn.sbz 0x78(r6), r7
    bn.bleui r17, 0x1, loc_22698d
    bn.lh r24, 0x36(r6)
    bg.bnei r24, 0x0, loc_22688c
    bn.lh r6, 0x38(r6)
    bn.add r7, r15, r6
    bn.exthz r15, r7
    bt.j loc_22688c
loc_226988:
    bn.sh_2 0x7a(r6), r15
    bt.j loc_226902
loc_22698d:
    bn.lh r4, 0x34(r6)
    bg.bnei r4, 0x0, loc_22688c
    bn.lh r6, 0x3a(r6)
    bn.add r7, r15, r6
    bn.exthz r15, r7
    bt.j loc_22688c
