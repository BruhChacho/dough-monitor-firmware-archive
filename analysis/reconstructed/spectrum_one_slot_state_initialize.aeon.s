# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20ccb0,0x20ccf6); Clear eight five-byte records, eight flags and two global bytes.
# Fixed original addresses; not a hardware-validated implementation.
    bt.movi r6, 0x0
loc_20ccb2:
    bt.movi r7, 0x5
    bn.muls r7, r6, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0xc30
    bt.add r7, r23
    bn.sbz 0x0(r7), r0
    bn.sbz 0x1(r7), r0
    bn.sbz 0x2(r7), r0
    bn.sbz 0x3(r7), r0
    bn.sbz 0x4(r7), r0
    bg.movhi r23, 0x45
    bg.addi r23, r23, 0x3b66
    bn.add r7, r6, r23
    bn.sbz 0x0(r7), r0
    bt.addi r6, 0x1
    bg.bnei r6, 0x8, loc_20ccb2
    bg.movhi r7, 0x45
    bg.sbz 0x3c38(r7), r0
    bg.movhi r7, 0x45
    bg.sbz 0x3b62(r7), r0
    bt.jr r9
