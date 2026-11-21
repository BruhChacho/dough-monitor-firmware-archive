# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2528dd,0x252917); byte-exact only; hardware untested.
    bt.movi r7, 0xc
    bn.muls r6, r3, r7
    bg.movhi r7, 0x49
    bg.addi r7, r7, -0x58f4
    bt.add r6, r7
    bn.lbz r7, 0x0(r4)
    bn.sbz 0x0(r6), r7
    bn.lwz r5, 0x4(r4)
    bn.sw 0x4(r6), r5
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x40
    bn.bnei r7, 0x0, loc_252908
    bt.jr r9
loc_252908:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3c6f
    bn.lbz r4, 0x0(r6)
    bg.j 0x2a9310
