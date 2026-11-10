# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22dd9a,0x22df19); byte-exact only; hardware untested.
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
    bt.mov r3, r4
    bg.movhi r17, 0x3b
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.addi r5, r17, 0x4950
    bt.add r7, r5
    bn.lwz r6, 0x4(r7)
    bg.ori r5, r0, 0x1000
    bn.and r7, r6, r5
    bn.beqi r7, 0x0, loc_22dde4
    bg.ori r5, r0, 0x800
    bn.and r7, r6, r5
    bg.beqi r7, 0x0, loc_22de76
loc_22dde4:
    bt.mov r12, r3
    bt.mov r14, r3
    bg.bnei r3, 0x4, loc_22ddf8
    bt.j loc_22defd
loc_22ddee:
    bn.addi r7, r12, 0x1
    bn.extbz r12, r7
    bg.bgt r12, r14, loc_22de76
loc_22ddf8:
    bn.ori r7, r0, 0xa8
    bn.muls r10, r12, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lbz r7, 0x28(r10)
    bg.bne r13, r7, loc_22ddee
    bn.lwz r7, 0x4(r10)
    bn.beqi r7, 0x0, loc_22ddee
    bn.lh r6, 0x2c(r10)
    bn.lh r7, 0x2a(r10)
    bn.xor r7, r6, r7
    bn.andi r6, r6, 0xf
    bn.and r11, r7, r6
    bn.beqi r11, 0x0, loc_22de96
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x22dc46
    bn.lh r5, 0x2c(r10)
    bn.sub r7, r5, r11
    bn.sh_1 0x2c(r10), r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bg.ori r5, r0, 0x800
    bn.and r7, r7, r5
    bg.bnei r7, 0x0, loc_22df03
loc_22de56:
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r10, r3
    bt.mov r3, r13
    bt.mov r4, r10
    bg.jal 0x22acf2
    bt.movi r7, 0x1
    bn.sll r7, r7, r10
    bn.sub r7, r11, r7
    bn.exthz r11, r7
    bn.bnei r11, 0x0, loc_22de56
    bt.j loc_22ddee
loc_22de76:
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
loc_22de96:
    bt.mov r3, r12
    bg.jal 0x222df1
    bt.mov r11, r3
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lwz r6, 0x4(r7)
    bg.ori r5, r0, 0x800
    bn.and r7, r6, r5
    bg.beqi r7, 0x0, loc_22ddee
    bg.ori r5, r0, 0x1000
    bn.and r7, r6, r5
    bg.bnei r7, 0x0, loc_22ddee
    bg.beqi r3, 0x4, loc_22ddee
    bg.jal 0x222d32
    bn.extbz r15, r11
    bt.mov r4, r15
    bg.jal 0x22acf2
    bt.movi r7, 0x1
    bn.sll r7, r7, r11
    bn.lh r6, 0x2c(r10)
    bn.sub r7, r6, r7
    bn.sh_1 0x2c(r10), r7
    bn.lh r7, 0x2a(r10)
    bn.sra r7, r7, r11
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_22ddee
    bt.mov r3, r13
    bt.mov r4, r15
    bg.jal 0x22701c
    bt.j loc_22ddee
loc_22defd:
    bt.movi r12, 0x0
    bt.movi r14, 0x3
    bt.j loc_22ddf8
loc_22df03:
    bg.jal 0x222d32
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x22acf2
    bt.j loc_22ddee
