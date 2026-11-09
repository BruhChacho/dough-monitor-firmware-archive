# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2339a1,0x2339cf); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.ori r7, r0, 0x84
    bn.muls r5, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0xe8
    bn.add r7, r5, r6
    bn.lbz r4, 0x2b(r7)
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x144
    bt.add r5, r7
    bg.jal 0x216315
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
