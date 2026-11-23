# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e6c4,0x23e6dc); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.lbz r7, 0x2f(r3)
    bn.sbz 0x0(r4), r7
    bt.jr r9
