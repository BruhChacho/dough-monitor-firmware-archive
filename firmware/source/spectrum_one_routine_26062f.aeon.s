# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26062f,0x260645); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bg.sbz 0xa4(r3), r0
    bt.jr r9
