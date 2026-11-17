# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a4bf8,0x2a4c7f); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.jal 0x235a79
    bn.beqi r3, 0x0, loc_2a4c3e
    bn.slli r5, r10, 0x2
    bg.movhi r6, 0x47
    bg.addi r6, r6, -0x2d20
    bt.add r5, r6
    bn.lbz r4, 0x0(r5)
    bn.lbz r7, 0x1(r5)
    bn.slli r7, r7, 0x8
    bn.or r4, r4, r7
    bn.lbz r6, 0x2(r5)
    bn.slli r6, r6, 0x10
    bn.lbz r7, 0x3(r5)
    bn.slli r7, r7, 0x18
    bn.or r6, r6, r7
    bn.or r3, r4, r6
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_2a4c3e:
    bg.jal 0x235a94
    bn.bnei r3, 0x0, loc_2a4c5c
    bg.movhi r7, 0x47
    bg.addi r7, r7, -0x2d20
    bt.add r10, r7
    bn.lbz r3, 0x0(r10)
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_2a4c5c:
    bn.slli r7, r10, 0x1
    bg.movhi r6, 0x47
    bg.addi r6, r6, -0x2d20
    bt.add r7, r6
    bn.lbz r6, 0x0(r7)
    bn.lbz r7, 0x1(r7)
    bn.slli r7, r7, 0x8
    bn.or r3, r6, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
