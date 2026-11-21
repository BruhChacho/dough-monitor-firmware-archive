# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26695b,0x2669ea); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r7, 0x3b
    bg.lwz r5, 0x5f38(r7)
    bn.lbz r3, 0x5a(r5)
    bn.add r4, r5, r3
    bn.ori r7, r0, 0x29
    bn.muls r7, r3, r7
    bn.ori r6, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r6, r6, r4
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r7, 0xf4(r7)
    bn.beqi r7, 0x2, loc_2669ae
    bn.beqi r7, 0x3, loc_2669ca
    bn.beqi r7, 0x1, loc_2669e6
    bt.movi r4, 0x0
    bg.jal 0x253ffc
    bg.movhi r6, 0x45
    bg.lhz r5, 0x51ec(r6)
    bg.ori r4, r0, 0xffbf
    bn.and r7, r5, r4
    bg.sw_1 0x51ec(r6), r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_2669ae:
    bt.movi r4, 0x2
    bg.jal 0x253ffc
    bg.movhi r6, 0x45
    bg.lhz r5, 0x51ec(r6)
    bn.ori r7, r5, 0x40
    bg.sw_1 0x51ec(r6), r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_2669ca:
    bt.movi r4, 0x1
loc_2669cc:
    bg.jal 0x253ffc
    bg.movhi r6, 0x45
    bg.lhz r4, 0x51ec(r6)
    bn.ori r7, r4, 0x40
    bg.sw_1 0x51ec(r6), r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_2669e6:
    bt.movi r4, 0x3
    bt.j loc_2669cc
