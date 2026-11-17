# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x262c8a,0x262ccd); byte-exact only; hardware untested.
    bn.sfgtui r3, 0x32
    bn.bf loc_262ca9
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r7, 0x34(r7)
    bn.muls r7, r3, r7
    bn.ori r6, r0, 0x32
    bn.divu r7, r7, r6
    bn.extbz r3, r7
    bt.jr r9
loc_262ca9:
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r5, 0x34(r7)
    bn.addi r6, r3, -0x32
    bn.ori r7, r0, 0xff
    bn.sub r7, r7, r5
    bn.muls r6, r6, r7
    bn.ori r7, r0, 0x32
    bn.divu r6, r6, r7
    bt.add r5, r6
    bn.extbz r3, r5
    bt.jr r9
