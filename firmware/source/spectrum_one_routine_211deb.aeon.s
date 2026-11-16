# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211deb,0x211e4a); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x211874
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x3084
    bt.add r3, r6
    bg.jal 0x23dd44
    bn.andi r3, r3, 0xf
    bt.movi r7, 0xa
    bg.bgtui r3, 0x9, loc_211e1d
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xd20
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
    bt.movi r7, 0x8
loc_211e1d:
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
    bt.movi r7, 0x0
    bt.j loc_211e1d
    bt.movi r7, 0x9
    bt.j loc_211e1d
    bt.movi r7, 0x7
    bt.j loc_211e1d
    bt.movi r7, 0x6
    bt.j loc_211e1d
    bt.movi r7, 0x5
    bt.j loc_211e1d
    bt.movi r7, 0x4
    bt.j loc_211e1d
    bt.movi r7, 0x3
    bt.j loc_211e1d
    bt.movi r7, 0x2
    bt.j loc_211e1d
    bt.movi r7, 0x1
    bt.j loc_211e1d
