# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22aa4e,0x22ab1c); Check channel records in the selected range and apply range-update helpers.
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
    bt.mov r13, r4
    bt.mov r15, r5
    bg.bgt r3, r4, loc_22aae3
    bt.mov r11, r3
    bn.ori r14, r0, 0xa8
    bt.movi r16, 0xf
    bt.j loc_22aa84
loc_22aa7a:
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.bgt r11, r13, loc_22aae3
loc_22aa84:
    bn.muls r10, r11, r14
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bn.lbz r7, 0x0(r10)
    bn.bnei r7, 0x1, loc_22aa7a
    bn.lh r6, 0x18(r10)
    bg.sfleui r6, 0x77f
    bn.bnf loc_22ab02
    bn.lh r7, 0x1c(r10)
    bt.add r7, r6
    bg.sfgtsi r7, 0x780
    bn.bf loc_22aa7a
    bg.jal 0x222ace
    bt.mov r12, r3
    bn.bgtui r3, 0x3, loc_22ab0b
loc_22aab6:
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_22ab0f
loc_22aac1:
    bt.mov r4, r11
    bg.jal 0x2229f8
    bn.sra r7, r15, r12
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_22aa7a
    bn.lbz r3, 0x28(r10)
    bt.mov r4, r12
    bg.jal 0x22701c
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.ble r11, r13, loc_22aa84
loc_22aae3:
    bt.movi r3, 0x1
loc_22aae5:
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
loc_22ab02:
    bg.jal 0x222af1
    bt.mov r12, r3
    bn.bleui r3, 0x3, loc_22aab6
loc_22ab0b:
    bt.movi r3, 0x0
    bt.j loc_22aae5
loc_22ab0f:
    bn.sra r7, r16, r12
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_22aac1
    bt.movi r3, 0x0
    bt.j loc_22aae5
