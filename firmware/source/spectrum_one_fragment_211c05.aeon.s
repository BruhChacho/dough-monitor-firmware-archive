# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211c05,0x211c40); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.slli r3, r3, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1db2
    bt.add r3, r7
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x60
    bn.srli r3, r3, 0x5
    bn.beqi r3, 0x0, loc_211c35
    bt.movi r7, 0x1
    bn.beqi r3, 0x1, loc_211c2c
    bt.movi r7, 0x2
    bn.bnei r3, 0x2, loc_211c35
loc_211c2c:
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_211c35:
    bt.movi r7, 0x0
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
