# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a9488,0x2a94c4); byte-exact only; hardware untested.
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x2610
    bn.add r7, r4, r6
    bn.sbz 0x0(r7), r0
    bn.slli r4, r4, 0x2
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x260c
    bn.add r7, r4, r6
    bn.sw 0x0(r7), r0
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x25fc
    bn.add r7, r4, r6
    bn.sw 0x0(r7), r0
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x2604
    bt.add r4, r7
    bn.sw 0x0(r4), r3
    bt.jr r9
