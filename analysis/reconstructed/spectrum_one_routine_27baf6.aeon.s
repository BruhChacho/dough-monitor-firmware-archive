# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27baf6,0x27bb39); byte-exact only; hardware untested.
    bn.movhi_2 r6, 0x80
    bn.and r7, r3, r6
    bn.beqi r7, 0x0, loc_27bb18
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xff00
    bn.and r7, r3, r6
    bn.slli r7, r7, 0x1
    bg.movhi r6, 0xa000
    bt.add r7, r6
    bn.srli r6, r3, 0x18
    bn.sbz 0x0(r7), r6
loc_27bb18:
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xffff
    bn.and r7, r3, r6
    bn.slli r7, r7, 0x1
    bn.andi r6, r3, 0x1
    bn.sub r7, r7, r6
    bg.movhi r6, 0xa000
    bt.add r7, r6
    bn.lbz r7, 0x0(r7)
    bn.extbz r3, r7
    bt.jr r9
