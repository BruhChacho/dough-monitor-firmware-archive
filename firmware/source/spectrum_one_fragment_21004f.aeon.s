# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21004f,0x21008c); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r7, 0x45
    bg.lbz r6, 0x43dd(r7)
    bn.extbs r7, r6
    bn.blesi r7, -0x1, loc_210071
loc_210067:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_210071:
    bn.andi r7, r6, 0x20
    bn.bnei r7, 0x0, loc_210067
    bg.jal 0x2134b2
    bt.mov r3, r10
    bn.ori r4, r0, 0x50
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20ffc6
