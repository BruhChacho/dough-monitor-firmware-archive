# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x210636,0x21065d); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x210624
    bt.movi r7, 0x4
    bn.beqi r3, 0x0, loc_210654
    bt.movi r7, 0x2
    bn.beqi r3, 0x1, loc_210654
    bn.xor r7, r3, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
loc_210654:
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
