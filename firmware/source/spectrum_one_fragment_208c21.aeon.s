# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x208c21,0x208cd2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.sw 0x4(r1), r15
    bn.sw 0x0(r1), r16
    bt.mov r15, r3
    bt.mov r14, r4
    bt.movi r13, 0x1
    bt.movi r16, 0x0
    bt.movi r12, 0x0
loc_208c46:
    bn.addi r7, r12, 0x1
    bn.extbz r12, r7
    bn.andi r7, r13, 0x1
    bn.beqi r7, 0x0, loc_208ca0
    bn.ori r7, r0, 0x7c
    bn.muls r7, r12, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r10, 0x4(r7)
    bt.mov r3, r10
    bn.ori r4, r0, 0x24
    bg.jal 0x23ddb9
    bg.movhi r7, 0x2480
    bn.ori r7, r7, 0x60
    bn.add r11, r10, r7
    bt.mov r3, r11
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x1
    bn.bnei r3, 0x0, loc_208cc3
loc_208c84:
    bt.movi r10, 0x0
loc_208c86:
    bt.mov r3, r15
    bn.extbz r4, r10
    bt.mov r5, r14
    bg.jal 0x208b0d
    bt.addi r10, 0x1
    bn.bnei r10, 0x3, loc_208c86
    bt.mov r3, r11
    bt.mov r4, r16
    bt.movi r5, 0x1
    bg.jal 0x23dead
loc_208ca0:
    bn.srli r13, r13, 0x1
    bn.bnei r12, 0x1, loc_208c46
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
loc_208cc3:
    bt.mov r3, r11
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bn.ori r16, r16, 0x1
    bt.j loc_208c84
