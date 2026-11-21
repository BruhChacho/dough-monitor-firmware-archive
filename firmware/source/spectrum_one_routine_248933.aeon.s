# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x248933,0x248954); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x5254
    bn.slli r6, r3, 0x2
    bt.add r6, r7
    bt.add r3, r7
    bn.lbz r3, 0x10(r3)
    bn.muls r4, r4, r3
    bn.lwz r7, 0x2c(r6)
    bt.add r4, r7
    bt.add r4, r5
    bn.lbz r3, 0x0(r4)
    bt.jr r9
