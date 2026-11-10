# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22ac17,0x22aca0); Selector4 chooses record range0..3, otherwise one record; clear byte0x5b and combine external service results.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r15, r4
    bt.mov r12, r3
    bt.mov r14, r3
    bg.beqi r3, 0x4, loc_22ac9a
loc_22ac39:
    bt.mov r10, r14
    bt.movi r11, 0x1
    bn.ori r13, r0, 0xa8
loc_22ac40:
    bn.muls r7, r10, r13
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.sbz 0x5b(r7), r0
    bt.mov r3, r10
    bg.jal 0x2271a9
    bn.and r11, r3, r11
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bg.ble r10, r12, loc_22ac40
    bt.mov r3, r14
    bt.mov r4, r12
    bt.mov r5, r15
    bg.jal 0x22ab1c
    bn.and r10, r3, r11
    bn.extbz r10, r10
    bt.mov r3, r14
    bt.mov r4, r12
    bt.mov r5, r15
    bg.jal 0x22aa4e
    bn.and r3, r10, r3
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_22ac9a:
    bt.movi r14, 0x0
    bt.movi r12, 0x3
    bt.j loc_22ac39
