# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x214da6,0x214e1a); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.beqi r4, 0x1, loc_214de6
    bn.bgtui r4, 0x0, loc_214dcb
    bn.slli r3, r3, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1d6c
    bt.add r3, r7
    bg.jal 0x23df85
    bt.mov r7, r3
loc_214dc2:
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_214dcb:
    bn.beqi r4, 0x2, loc_214e00
    bt.movi r7, 0x0
    bn.bnei r4, 0x3, loc_214dc2
    bn.slli r3, r3, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1d6a
    bt.add r3, r7
    bg.jal 0x23df85
    bt.mov r7, r3
    bt.j loc_214dc2
loc_214de6:
    bn.slli r3, r3, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1d6e
    bt.add r3, r7
    bg.jal 0x23df85
    bt.mov r7, r3
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_214e00:
    bn.slli r3, r3, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1d68
    bt.add r3, r7
    bg.jal 0x23df85
    bt.mov r7, r3
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
