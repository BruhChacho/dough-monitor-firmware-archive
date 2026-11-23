# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24a06f,0x24a087); byte-exact only; hardware untested.
    bn.slli r3, r3, 0x2
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x6268
    bt.add r3, r7
    bg.lwz r7, 0xbc(r3)
    bt.add r7, r4
    bn.lbz r3, 0x0(r7)
    bt.jr r9
