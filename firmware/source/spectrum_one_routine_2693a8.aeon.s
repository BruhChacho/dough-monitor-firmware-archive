# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2693a8,0x2694ab); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r12, r3
    bt.mov r13, r4
    bg.movhi r15, 0x3d
    bg.addi r5, r15, -0x4df4
    bn.add r7, r3, r5
    bn.lbz r24, 0x0(r7)
    bg.movhi r14, 0x3b
    bg.lwz r5, 0x5f38(r14)
    bn.lbz r6, 0x5a(r5)
    bn.andi r23, r24, 0x7f
    bn.add r4, r5, r6
    bn.ori r7, r0, 0x29
    bn.muls r6, r6, r7
    bn.ori r7, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r7, r7, r4
    bt.add r6, r7
    bt.add r6, r5
    bg.lbz r6, 0xd5(r6)
    bg.beq r23, r6, loc_269498
loc_2693fe:
    bt.movi r11, 0x0
loc_269400:
    bn.extbz r10, r11
    bt.mov r3, r10
    bg.jal 0x23e7b3
    bg.bnei r3, 0x0, loc_26948e
loc_26940d:
    bt.addi r11, 0x1
    bg.bnei r11, 0x4, loc_269400
    bt.mov r3, r12
    bt.mov r4, r13
    bg.jal 0x23a131
    bt.mov r3, r12
    bt.mov r4, r13
    bg.jal 0x23a129
    bg.lwz r5, 0x5f38(r14)
    bn.lbz r6, 0x5a(r5)
    bn.add r4, r5, r6
    bn.ori r7, r0, 0x29
    bn.muls r6, r6, r7
    bn.ori r7, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r7, r7, r4
    bt.add r6, r7
    bt.add r6, r5
    bg.lbz r7, 0xd5(r6)
    bg.movhi r5, 0x3d
    bg.addi r5, r5, -0x4df4
    bn.add r6, r12, r5
    bn.addi r5, r0, -0x80
    bn.or r7, r7, r5
    bn.sbz 0x0(r6), r7
    bt.movi r10, 0x0
    bt.mov r12, r6
loc_26945c:
    bn.extbz r11, r10
    bt.mov r3, r11
    bg.jal 0x23e7b3
    bn.beqi r3, 0x0, loc_26946e
    bn.lbs r7, 0x0(r12)
    bn.blesi r7, -0x1, loc_2694a1
loc_26946e:
    bt.addi r10, 0x1
    bg.bnei r10, 0x4, loc_26945c
loc_269474:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_26948e:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x23a12d
    bt.j loc_26940d
loc_269498:
    bn.extbs r7, r24
    bg.bgtsi r7, -0x1, loc_2693fe
    bt.j loc_269474
loc_2694a1:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x23a12d
    bt.j loc_26946e
