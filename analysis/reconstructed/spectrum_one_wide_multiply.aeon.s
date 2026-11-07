# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2aacb9,0x2aad0b); Modulo-64-bit product of two 64-bit operands, reconstructed from partial-product operations.
# Fixed original addresses; not hardware-validated.
    bg.ori r7, r0, 0xffff
    bn.and r25, r3, r7
    bn.srli r26, r3, 0x10
    bn.and r27, r5, r7
    bn.srli r7, r5, 0x10
    bn.muls r29, r25, r27
    bn.muls r25, r25, r7
    bn.muls r27, r26, r27
    bn.muls r26, r26, r7
    bt.add r25, r27
    bn.srli r7, r29, 0x10
    bt.add r7, r25
    bt.movhi r31, 0x1
    bn.add r25, r26, r31
    bn.sfgtu r27, r7
    bn.cmov_0 r26, r25, r26
    bn.srli r25, r7, 0x10
    bn.add r24, r26, r25
    bn.slli r7, r7, 0x10
    bg.ori r25, r0, 0xffff
    bn.and r29, r29, r25
    bn.add r23, r7, r29
    bn.muls r30, r5, r4
    bn.muls r28, r3, r6
    bt.add r28, r24
    bn.add r24, r30, r28
    bt.mov r3, r23
    bt.mov r4, r24
    bt.jr r9
