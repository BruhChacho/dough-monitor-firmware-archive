# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23f0e4,0x23f12d); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r4, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r4, r7
    bn.lwz r6, 0x4(r4)
    bn.andi r7, r6, 0x1
    bt.movi r3, 0x0
    bn.bnei r7, 0x0, loc_23f111
    bn.andi r7, r6, 0x80
    bt.movi r3, 0x2
    bn.beqi r7, 0x0, loc_23f119
loc_23f111:
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_23f119:
    bt.mov r3, r1
    bn.lwz r4, 0x0(r4)
    bg.jal 0x20f12a
    bn.lbz r3, 0x0(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
