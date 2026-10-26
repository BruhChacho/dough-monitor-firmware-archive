# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e7f6,0x23e8a2); Populate channel record with two copies of four packed halfwords and flags; wide store semantics conditional.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x0(r1), r6
    bn.sw 0x4(r1), r7
    bn.lh r6, 0x6(r1)
    bn.lh r23, 0x4(r1)
    bn.lh r24, 0x2(r1)
    bn.lh r25, 0x0(r1)
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r3), r7
    bt.movi r7, 0x1
    bn.sw 0x4(r3), r7
    bn.sh_2 0x1e(r3), r6
    bn.sh_1 0x1c(r3), r23
    bn.sh_2 0x1a(r3), r24
    bn.sh_1 0x18(r3), r25
    bn.sh_2 0x26(r3), r6
    bn.sh_1 0x24(r3), r23
    bn.sh_2 0x22(r3), r24
    bn.sh_1 0x20(r3), r25
    bn.sbz 0x28(r3), r4
    bn.sh_1 0x2c(r3), r0
    bn.sh_2 0x2a(r3), r0
    bn.sbz 0x29(r3), r5
    bn.sw 0x5c(r3), r0
    bn.sw 0x68(r3), r0
    bn.sw 0x60(r3), r0
    bn.sw 0x6c(r3), r0
    bn.sw 0x64(r3), r0
    bn.sw 0x70(r3), r0
    bn.sbz 0x2e(r3), r0
    bn.sbz 0x59(r3), r0
    bn.sbz 0x5a(r3), r0
    bn.sbz 0x5b(r3), r0
    bg.sbz 0x81(r3), r0
    bg.sbz 0x82(r3), r0
    bg.sbz 0x83(r3), r0
    bg.sbz 0x84(r3), r0
    bg.sw_0 0x88(r3), r0
    bg.sw_0 0x8c(r3), r0
    bg.sw_1 0x90(r3), r0
    bg.sh 0x90(r3), r0
    bg.sbz 0x97(r3), r7
    bg.sbz 0x98(r3), r0
    bg.sbz 0xa4(r3), r0
    bg.sbz 0xa5(r3), r7
    bg.sbz 0xa2(r3), r0
    bg.sbz 0xa3(r3), r0
    bt.addi r1, 0x8
    bt.jr r9
