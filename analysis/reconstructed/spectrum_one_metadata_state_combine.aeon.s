# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e76c,0x20e79d); Combine accumulated metadata bytes and tail-call the three-byte state store.
# Fixed original addresses; not a hardware-validated implementation.
    bg.movhi r7, 0x45
    bg.addi r6, r7, 0x43bc
    bn.lbz r5, 0x7(r6)
    bn.ori r3, r5, 0x80
    bn.lbz r6, 0x1(r6)
    bn.sfnei r6, 0x0
    bn.cmov_0 r3, r3, r5
    bg.addi r7, r7, 0x43bc
    bn.lbz r4, 0x3(r7)
    bn.or r6, r5, r4
    bn.lbz r23, 0x6(r7)
    bn.lbz r24, 0x4(r7)
    bn.or r4, r23, r24
    bn.or r4, r6, r4
    bg.j 0x20e66d
