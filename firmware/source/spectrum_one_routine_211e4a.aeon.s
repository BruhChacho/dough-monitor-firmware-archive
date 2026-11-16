# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211e4a,0x211ea5); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x211874
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x302b
    bt.add r3, r6
    bg.jal 0x23dd44
    bn.andi r3, r3, 0xf
    bg.bgtui r3, 0x7, loc_211e78
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xcf8
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_211e78:
    bt.movi r3, 0x5
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
    bt.movi r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
    bt.movi r3, 0x4
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
    bt.movi r3, 0x3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
    bt.movi r3, 0x2
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
