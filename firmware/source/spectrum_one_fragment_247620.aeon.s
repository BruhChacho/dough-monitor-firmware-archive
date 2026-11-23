# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x247620,0x247656); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bg.movhi r6, 0x48
    bg.lbz r6, -0x4cb(r6)
    bt.add r7, r6
    bg.lbz r3, 0x91(r7)
    bg.jal 0x23a594
    bg.movhi r7, 0x3b
    bg.sbz 0x494c(r7), r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
