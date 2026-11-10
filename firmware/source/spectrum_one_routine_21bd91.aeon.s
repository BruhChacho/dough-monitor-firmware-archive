# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bd91,0x21bda7); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x21bd8d
    bn.sfeqi r3, 0x0
    bn.cmovi r3, 0x4, 0x8
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
