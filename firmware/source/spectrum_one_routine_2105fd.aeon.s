# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2105fd,0x210624); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.movi r7, 0x0
    bn.beqi r4, 0x0, loc_210617
    bt.movi r7, 0x1
    bn.beqi r4, 0x1, loc_210617
    bt.movi r7, 0x2
    bn.beqi r4, 0x2, loc_210617
    bn.sfnei r4, 0x3
    bn.cmovi r7, 0x4, 0x3
loc_210617:
    bt.mov r4, r7
    bg.jal 0x2105df
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
