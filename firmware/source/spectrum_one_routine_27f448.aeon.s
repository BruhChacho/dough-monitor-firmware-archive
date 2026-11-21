# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27f448,0x27f4c0); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x25d8
    bg.jal 0x27f422
    bt.movi r23, 0x0
    bg.movhi r7, 0x45
    bg.addi r25, r7, 0x7ee8
    bn.ori r26, r0, 0x12
    bg.movhi r7, 0x45
    bg.addi r24, r7, 0x7ef4
    bg.movhi r7, 0x45
    bg.addi r4, r7, 0x7ef0
loc_27f476:
    bn.sh_1 0x0(r25), r0
    bn.sbz 0x0(r4), r0
    bn.sbz 0x0(r24), r0
    bn.muls r7, r23, r26
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x7e58
    bn.add r5, r7, r6
    bg.movhi r27, 0x45
    bg.addi r27, r27, 0x7ea0
    bn.add r6, r7, r27
    bt.movi r7, 0x0
loc_27f49a:
    bn.sh_1 0x0(r5), r0
    bn.sh_1 0x0(r6), r0
    bt.addi r7, 0x1
    bn.extbz r7, r7
    bt.addi r5, 0x2
    bt.addi r6, 0x2
    bg.bnei r7, 0x9, loc_27f49a
    bt.addi r23, 0x1
    bt.addi r4, 0x1
    bt.addi r24, 0x1
    bt.addi r25, 0x2
    bg.bnei r23, 0x4, loc_27f476
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
