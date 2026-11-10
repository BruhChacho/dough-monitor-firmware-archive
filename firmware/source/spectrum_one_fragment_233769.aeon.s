# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x233769,0x2337b0); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x84
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0xe8
    bn.add r6, r3, r5
    bn.lwz r7, 0x0(r6)
    bn.beqi r7, 0x2, loc_23378e
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x144
    bt.add r3, r5
    bg.j 0x211949
loc_23378e:
    bt.movi r7, 0x1
    bn.lbz r5, 0x4f(r6)
    bn.bnei r5, 0x1, loc_2337ac
    bt.movi r7, 0x4
    bn.lbz r6, 0x44(r6)
    bn.beqi r6, 0x1, loc_2337ac
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x144
    bt.add r3, r7
    bg.j 0x211949
loc_2337ac:
    bt.mov r3, r7
    bt.jr r9
