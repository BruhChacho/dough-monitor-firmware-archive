# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20fe85,0x20fecd); byte-exact only; hardware untested.
    bn.beqi r3, 0x1, loc_20feaf
    bn.bgtui r3, 0x0, loc_20fe9a
    bg.movhi r7, 0x48
    bg.lbz r7, -0x9ae(r7)
    bn.andi r7, r7, 0x1
loc_20fe96:
    bt.mov r3, r7
    bt.jr r9
loc_20fe9a:
    bn.beqi r3, 0x2, loc_20febe
    bt.movi r7, 0x0
    bn.bnei r3, 0x3, loc_20fe96
    bg.movhi r7, 0x48
    bg.lbz r7, -0xab6(r7)
    bn.andi r7, r7, 0x1
    bt.j loc_20fe96
loc_20feaf:
    bg.movhi r7, 0x48
    bg.lbz r7, -0x8a6(r7)
    bn.andi r7, r7, 0x1
    bt.mov r3, r7
    bt.jr r9
loc_20febe:
    bg.movhi r7, 0x48
    bg.lbz r7, -0xbbe(r7)
    bn.andi r7, r7, 0x1
    bt.mov r3, r7
    bt.jr r9
