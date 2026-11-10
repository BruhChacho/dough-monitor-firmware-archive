# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20fe13,0x20fe64); byte-exact only; hardware untested.
    bn.beqi r3, 0x1, loc_20fe40
    bn.bgtui r3, 0x0, loc_20fe28
    bg.movhi r7, 0x45
    bg.lbz r7, 0x43de(r7)
    bn.andi r7, r7, 0x1
loc_20fe24:
    bt.mov r3, r7
    bt.jr r9
loc_20fe28:
    bn.beqi r3, 0x2, loc_20fe52
    bt.movi r7, 0x0
    bn.bnei r3, 0x3, loc_20fe24
    bg.movhi r7, 0x45
    bg.lhz r7, 0x43de(r7)
    bn.srli r7, r7, 0x3
    bn.andi r7, r7, 0x1
    bt.j loc_20fe24
loc_20fe40:
    bg.movhi r7, 0x45
    bg.lhz r7, 0x43de(r7)
    bn.srli r7, r7, 0x1
    bn.andi r7, r7, 0x1
    bt.mov r3, r7
    bt.jr r9
loc_20fe52:
    bg.movhi r7, 0x45
    bg.lhz r7, 0x43de(r7)
    bn.srli r7, r7, 0x2
    bn.andi r7, r7, 0x1
    bt.mov r3, r7
    bt.jr r9
