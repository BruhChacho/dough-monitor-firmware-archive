# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26691b,0x26695b); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x242247
    bg.movhi r7, 0x3b
    bg.lwz r5, 0x5f38(r7)
    bn.lbz r3, 0x5a(r5)
    bn.add r4, r5, r3
    bn.ori r7, r0, 0x29
    bn.muls r7, r3, r7
    bn.ori r6, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r6, r6, r4
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r4, 0xda(r7)
    bn.sfleui r4, 0x4
    bn.cmovsi_2 r5, r0, 0x1
    bn.andi r5, r5, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x23a5aa
