# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x212156,0x21218e); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bn.slli r10, r3, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x2702
    bt.add r10, r7
    bt.mov r3, r10
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x40
    bt.movi r7, 0x0
    bn.beqi r3, 0x0, loc_212182
    bt.mov r3, r10
    bn.ori r4, r0, 0x40
    bg.jal 0x23ddb9
    bt.movi r7, 0x1
loc_212182:
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
