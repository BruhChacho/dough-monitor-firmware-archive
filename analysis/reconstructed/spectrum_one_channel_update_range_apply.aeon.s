# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22ab1c,0x22ac17); Apply the requested update across channel records in the selected range.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.sw 0x4(r1), r15
    bn.sw 0x0(r1), r16
    bt.mov r12, r4
    bt.mov r16, r5
    bg.bgt r3, r4, loc_22ab89
    bt.mov r11, r3
    bn.ori r14, r0, 0xa8
    bt.j loc_22ab50
loc_22ab46:
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bgt r11, r12, loc_22ab89
loc_22ab50:
    bn.muls r10, r11, r14
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bn.lbz r7, 0x0(r10)
    bn.bnei r7, 0x1, loc_22ab46
    bn.lh r6, 0x18(r10)
    bg.sfgti r6, 0x77f
    bn.bf loc_22ab79
    bn.lh r7, 0x1c(r10)
    bt.add r7, r6
    bg.sflesi r7, 0x780
    bn.bnf loc_22ab8d
loc_22ab79:
    bt.mov r3, r11
    bg.jal 0x222843
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.ble r11, r12, loc_22ab50
loc_22ab89:
    bt.movi r3, 0x1
    bt.j loc_22ab9e
loc_22ab8d:
    bg.jal 0x222ace
    bt.mov r13, r3
    bg.jal 0x222af1
    bt.mov r15, r3
    bn.bleui r13, 0x3, loc_22abbb
loc_22ab9c:
    bt.movi r3, 0x0
loc_22ab9e:
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
loc_22abbb:
    bn.bgtui r3, 0x3, loc_22ab9c
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_22abf6
loc_22abc9:
    bt.mov r3, r13
    bt.mov r4, r11
    bg.jal 0x2229f8
    bt.mov r3, r15
    bt.mov r4, r11
    bg.jal 0x2229f8
    bn.sra r7, r16, r13
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22ac0c
loc_22abe2:
    bn.sra r7, r16, r15
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_22ab79
    bn.lbz r3, 0x28(r10)
    bt.mov r4, r15
    bg.jal 0x22701c
    bt.j loc_22ab79
loc_22abf6:
    bt.movi r6, 0xf
    bn.sra r7, r6, r13
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22ab9c
    bn.sra r7, r6, r3
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_22abc9
    bt.j loc_22ab9c
loc_22ac0c:
    bn.lbz r3, 0x28(r10)
    bt.mov r4, r13
    bg.jal 0x22701c
    bt.j loc_22abe2
