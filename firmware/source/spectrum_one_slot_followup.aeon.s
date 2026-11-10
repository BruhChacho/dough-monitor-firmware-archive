# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20d2b7,0x20d33c); Copy received frame to shadow buffer, format response, prepare transmit and write final marker.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.slli r4, r3, 0x7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r7, r4, r6
    bn.lbz r7, 0x0(r7)
    bn.extbz r5, r7
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x414c
    bn.add r7, r3, r6
    bn.lbz r7, 0x0(r7)
    bn.beqi r7, 0x0, loc_20d2ec
    bn.andi r5, r5, 0x7f
    bn.bnei r5, 0x0, loc_20d2f6
loc_20d2ec:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_20d2f6:
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1040
    bn.add r3, r4, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bt.add r4, r6
    bt.addi r5, 0x2
    bg.jal 0x2aab1e
    bt.mov r3, r10
    bg.jal 0x26bdd1
    bt.mov r3, r10
    bg.jal 0x20cd94
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3b8a
    bt.add r10, r7
    bn.lbz r3, 0x0(r10)
    bn.extbz r3, r3
    bn.ori r4, r0, 0x6e
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20caf8
