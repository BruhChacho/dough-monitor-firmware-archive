# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2119df,0x211a81); byte-exact only; hardware untested.
    bn.beqi r3, 0x1, loc_211a01
    bn.bleui r3, 0x0, loc_2119ed
    bn.beqi r3, 0x2, loc_211a4b
    bn.beqi r3, 0x3, loc_211a37
    bt.jr r9
loc_2119ed:
    bn.bnei r4, 0x0, loc_211a15
    bg.movhi r6, 0x45
    bg.lbz r5, 0x4475(r6)
    bn.andi r7, r5, 0xfe
    bg.sbz 0x4475(r6), r7
    bt.jr r9
loc_211a01:
    bn.bnei r4, 0x0, loc_211a26
    bg.movhi r6, 0x45
    bg.lbz r5, 0x4475(r6)
    bn.andi r7, r5, 0xfd
    bg.sbz 0x4475(r6), r7
    bt.jr r9
loc_211a15:
    bg.movhi r6, 0x45
    bg.lbz r5, 0x4475(r6)
    bn.ori r7, r5, 0x1
    bg.sbz 0x4475(r6), r7
    bt.jr r9
loc_211a26:
    bg.movhi r6, 0x45
    bg.lbz r5, 0x4475(r6)
    bn.ori r7, r5, 0x2
    bg.sbz 0x4475(r6), r7
    bt.jr r9
loc_211a37:
    bn.bnei r4, 0x0, loc_211a70
    bg.movhi r6, 0x45
    bg.lbz r5, 0x4475(r6)
    bn.andi r7, r5, 0xf7
    bg.sbz 0x4475(r6), r7
    bt.jr r9
loc_211a4b:
    bn.beqi r4, 0x0, loc_211a5f
    bg.movhi r6, 0x45
    bg.lbz r5, 0x4475(r6)
    bn.ori r7, r5, 0x4
    bg.sbz 0x4475(r6), r7
    bt.jr r9
loc_211a5f:
    bg.movhi r6, 0x45
    bg.lbz r5, 0x4475(r6)
    bn.andi r7, r5, 0xfb
    bg.sbz 0x4475(r6), r7
    bt.jr r9
loc_211a70:
    bg.movhi r6, 0x45
    bg.lbz r5, 0x4475(r6)
    bn.ori r7, r5, 0x8
    bg.sbz 0x4475(r6), r7
    bt.jr r9
