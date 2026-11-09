# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ad165,0x2ad1b7); Prepare a conversion record, call the conversion leaf and finalize the output; helper semantics remain unresolved.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x18(r1), r3
    bn.sw 0x1c(r1), r4
    bn.addi r3, r1, 0x18
    bt.mov r4, r1
    bg.jal 0x2ac756
    bn.lwz r4, 0x10(r1)
    bn.lwz r5, 0x14(r1)
    bn.slli r23, r5, 0x2
    bn.srli r6, r4, 0x1e
    bn.or r6, r23, r6
    bg.movhi r7, 0x3fff
    bg.ori r7, r7, 0xffff
    bn.and r4, r4, r7
    bt.movi r5, 0x0
    bn.or r4, r4, r5
    bn.ori r23, r6, 0x1
    bn.sfnei r4, 0x0
    bn.lwz r3, 0x0(r1)
    bn.lwz r4, 0x4(r1)
    bn.lwz r5, 0x8(r1)
    bn.cmov_0 r6, r23, r6
    bg.jal 0x2ac268
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
