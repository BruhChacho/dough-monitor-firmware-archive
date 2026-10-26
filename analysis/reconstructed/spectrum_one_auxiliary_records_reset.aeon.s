# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222fca,0x223027); Reset selected low four mask bits in stride24 records using an eight-byte template.
# Fixed original addresses; not a hardware-validated implementation.
    bt.movi r5, 0x0
    bg.movhi r7, 0x48
    bg.addi r6, r7, -0x5c4
    bg.movhi r7, 0x2b
    bg.lbz r29, -0x9d8(r7)
    bg.addi r7, r7, -0x9d8
    bn.lbz r28, 0x1(r7)
    bn.lbz r27, 0x2(r7)
    bn.lbz r26, 0x3(r7)
    bn.lbz r25, 0x4(r7)
    bn.lbz r24, 0x5(r7)
    bn.lbz r23, 0x6(r7)
    bn.lbz r4, 0x7(r7)
loc_222ff5:
    bn.sra r7, r3, r5
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22301c
    bn.sbz 0x0(r6), r0
    bn.sbz 0xc(r6), r29
    bn.sbz 0xd(r6), r28
    bn.sbz 0xe(r6), r27
    bn.sbz 0xf(r6), r26
    bn.sbz 0x10(r6), r25
    bn.sbz 0x11(r6), r24
    bn.sbz 0x12(r6), r23
    bn.sbz 0x13(r6), r4
    bn.sbz 0x15(r6), r0
loc_22301c:
    bt.addi r5, 0x1
    bn.addi r6, r6, 0x18
    bg.bnei r5, 0x4, loc_222ff5
    bt.jr r9
