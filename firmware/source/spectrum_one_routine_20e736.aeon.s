# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e736,0x20e76c); byte-exact only; hardware untested.
    bg.bgtui r3, 0x7, loc_20e74c
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xec0
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_20e74c:
    bt.movi r3, 0x0
    bt.jr r9
    bt.movi r3, 0x7
    bt.jr r9
    bt.movi r3, 0x6
    bt.jr r9
    bt.movi r3, 0x5
    bt.jr r9
    bt.movi r3, 0x4
    bt.jr r9
    bt.movi r3, 0x3
    bt.jr r9
    bt.movi r3, 0x2
    bt.jr r9
    bt.movi r3, 0x1
    bt.jr r9
