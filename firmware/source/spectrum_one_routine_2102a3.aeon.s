# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2102a3,0x2102c6); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2100d2
    bn.ori r7, r0, 0x74
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x7e8
    bt.add r3, r7
    bn.lbz r3, 0x37(r3)
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
