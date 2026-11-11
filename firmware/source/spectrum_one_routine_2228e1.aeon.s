# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2228e1,0x222915); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r3, r6
    bn.lbz r7, 0x55(r3)
    bn.lbz r6, 0x54(r3)
    bt.add r7, r6
    bn.extbz r7, r7
    bn.lh r6, 0x48(r3)
    bt.add r7, r6
    bn.exthz r6, r7
    bn.lh r7, 0x7a(r3)
    bt.movi r3, 0x0
    bg.ble r6, r7, loc_222913
    bn.sub r7, r6, r7
    bn.exthz r3, r7
loc_222913:
    bt.jr r9
