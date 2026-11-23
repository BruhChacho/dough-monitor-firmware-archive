# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2475db,0x247620); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r7, 0x3b
    bg.lwz r5, 0x5f38(r7)
    bn.lbz r3, 0x5a(r5)
    bn.add r4, r5, r3
    bn.ori r6, r0, 0x29
    bn.muls r6, r3, r6
    bn.ori r7, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r7, r7, r4
    bt.add r6, r7
    bt.add r6, r5
    bg.lbz r4, 0xd2(r6)
    bg.jal 0x23a327
    bg.movhi r7, 0x3b
    bg.sh 0x4948(r7), r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
