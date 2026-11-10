# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2395c7,0x239614); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.lbz r23, 0x14(r1)
    bn.lbz r24, 0x18(r1)
    bn.lbz r25, 0x1c(r1)
    bn.sbz 0x7(r1), r3
    bn.sbz 0x8(r1), r4
    bn.sbz 0x9(r1), r5
    bn.sbz 0xa(r1), r6
    bn.sbz 0xb(r1), r7
    bn.sbz 0xc(r1), r8
    bn.sbz 0xd(r1), r23
    bn.sbz 0xe(r1), r24
    bn.sbz 0xf(r1), r25
    bn.ori r3, r0, 0x20
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bt.movi r6, 0x9
    bn.addi r7, r1, 0x7
    bt.movi r8, 0x0
    bg.jal 0x238fce
    bn.ff1 r3, r3
    bn.sub r3, r0, r3
    bn.srli r3, r3, 0x1f
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
