# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20557d,0x2055c2); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bg.sfeqi r3, 0xff
    bn.bf loc_2055b1
    bn.ori r6, r0, 0x80
    bg.sfnei r3, 0xfe
    bn.bnf loc_2055a0
    bn.addi r4, r1, 0x2
    bg.jal 0x2043a6
    bn.beqi r3, 0x0, loc_2055b7
    bn.lh r6, 0x2(r1)
loc_2055a0:
    bt.mov r3, r6
    bg.jal 0x23a564
    bg.jal 0x23a55b
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_2055b1:
    bg.ori r6, r0, 0xffff
    bt.j loc_2055a0
loc_2055b7:
    bg.jal 0x205576
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
