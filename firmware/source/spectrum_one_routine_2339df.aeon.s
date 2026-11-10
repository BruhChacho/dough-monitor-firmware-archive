# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2339df,0x233a44); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.ori r7, r0, 0x84
    bn.muls r6, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0xe8
    bt.add r6, r7
    bn.lwz r7, 0x0(r6)
    bn.beqi r7, 0x2, loc_233a12
    bg.jal 0x2162d2
    bn.bnei r3, 0x0, loc_233a28
loc_233a06:
    bt.movi r3, 0x0
loc_233a08:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_233a12:
    bn.lbz r6, 0x4f(r6)
    bn.bnei r6, 0x1, loc_233a06
    bg.jal 0x2162d2
    bn.beqi r3, 0x0, loc_233a06
    bt.mov r3, r10
    bg.jal 0x2151c8
    bn.bnei r3, 0x0, loc_233a3a
loc_233a28:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x21191d
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_233a3a:
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x21191d
    bt.j loc_233a08
