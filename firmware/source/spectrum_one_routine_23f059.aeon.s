# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23f059,0x23f0e4); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bt.mov r10, r3
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r4, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r4, r7
    bn.lwz r7, 0x4(r4)
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_23f0bc
    bg.movhi r7, 0x3b
    bg.lwz r4, 0x5f38(r7)
    bn.add r5, r4, r10
    bn.ori r7, r0, 0x29
    bn.muls r7, r10, r7
    bn.ori r6, r0, 0xa4
    bn.lbz r5, 0x5b(r5)
    bn.muls r6, r6, r5
    bt.add r7, r6
    bt.add r7, r4
    bg.lbz r7, 0xd3(r7)
    bn.sfnei r7, 0x1
    bn.cmovsi_2 r7, r0, 0x1
    bt.movi r6, 0x1
    bn.xor r7, r7, r6
    bn.extbz r3, r7
loc_23f0b1:
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_23f0bc:
    bt.mov r3, r1
    bn.lwz r4, 0x0(r4)
    bg.jal 0x20f12a
    bn.lbz r7, 0x4(r1)
    bt.movi r3, 0x0
    bn.beqi r7, 0x1, loc_23f0b1
    bn.bgtui r7, 0x0, loc_23f0dd
loc_23f0d0:
    bt.movi r3, 0x1
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_23f0dd:
    bt.mov r3, r7
    bn.bnei r7, 0x2, loc_23f0b1
    bt.j loc_23f0d0
