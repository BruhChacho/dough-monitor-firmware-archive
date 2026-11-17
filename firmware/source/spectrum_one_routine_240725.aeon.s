# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x240725,0x240789); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.jal 0x24229a
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.jal 0x24229a
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x24229a
