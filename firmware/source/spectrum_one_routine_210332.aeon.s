# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x210332,0x21036f); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r4
    bg.jal 0x2100d2
    bn.ori r7, r0, 0x74
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x7e8
    bt.add r3, r7
    bn.lbz r7, 0x5c(r3)
    bn.sbz 0x0(r10), r7
    bn.lbz r7, 0x5d(r3)
    bn.sbz 0x1(r10), r7
    bn.lbz r7, 0x11(r3)
    bn.sfnei r7, 0x5
    bn.cmovsi_2 r3, r0, 0x1
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
