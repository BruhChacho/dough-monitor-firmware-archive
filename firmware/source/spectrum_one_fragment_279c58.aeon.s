# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x279c58,0x279c7e); byte-exact only; hardware untested.
    bg.movhi r7, 0x3d
    bg.lwz r6, -0x47f0(r7)
    bt.movhi r7, 0xf
    bg.ori r7, r7, 0x4240
    bn.divu r6, r6, r7
    bn.muls r6, r6, r3
    bt.movi r7, 0x5
    bn.divu r6, r6, r7
loc_279c71:
    bn.addi r6, r6, -0x1
    bn.sfgtui r6, 0x0
    bn.bf loc_279c71
    bt.nop 0x0
    bt.jr r9
