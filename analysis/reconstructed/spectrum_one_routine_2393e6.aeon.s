# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2393e6,0x239410); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sbz 0x7(r1), r3
    bn.ori r3, r0, 0x20
    bt.movi r4, 0xc
    bt.movi r5, 0x0
    bt.movi r6, 0x1
    bn.addi r7, r1, 0x7
    bt.movi r8, 0x0
    bg.jal 0x238fce
    bn.ff1 r3, r3
    bn.sub r3, r0, r3
    bn.srli r3, r3, 0x1f
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
