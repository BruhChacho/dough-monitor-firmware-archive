# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24aaef,0x24ab1c); byte-exact only; hardware untested.
    bt.mov r7, r3
    bg.movhi r6, 0x45
    bg.lbz r5, 0x6a74(r6)
    bg.ble r5, r3, loc_24ab17
    bg.addi r6, r6, 0x6a74
    bn.lbz r3, 0x1(r6)
    bg.ble r3, r4, loc_24ab17
    bn.muls r7, r7, r3
    bn.lwz r6, 0x4(r6)
    bt.add r7, r6
    bt.add r7, r4
    bn.lbz r3, 0x0(r7)
    bt.jr r9
loc_24ab17:
    bn.ori r3, r0, 0xff
    bt.jr r9
