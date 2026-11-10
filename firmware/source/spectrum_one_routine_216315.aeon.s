# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x216315,0x21632e); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2162d2
    bn.ff1 r3, r3
    bn.sub r3, r0, r3
    bn.srli r3, r3, 0x1f
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
