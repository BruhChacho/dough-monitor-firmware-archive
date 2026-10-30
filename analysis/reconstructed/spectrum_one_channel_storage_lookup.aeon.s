# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2250c5,0x2250e8); Read one channel record's halfword field and pass it to a helper; the helper's physical meaning is unresolved.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.lh r3, 0x2a(r3)
    bg.jal 0x2402c4
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
