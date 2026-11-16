# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x206e24,0x206e73); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bt.mov r10, r3
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r7, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bt.mov r3, r10
    bn.lbz r4, 0x0(r7)
    bg.jal 0x27d974
    bt.mov r3, r1
    bt.mov r4, r10
    bg.jal 0x27f31c
    bn.lbz r7, 0x3(r1)
    bn.andi r7, r7, 0x2
    bt.movi r3, 0x0
    bn.beqi r7, 0x0, loc_206e68
    bn.lbz r7, 0x1(r1)
    bn.sfnei r7, 0x1a
    bn.cmovsi_2 r3, r0, 0x1
loc_206e68:
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bt.jr r9
