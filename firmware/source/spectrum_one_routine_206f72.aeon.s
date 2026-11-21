# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x206f72,0x207028); byte-exact only; hardware untested.
    bn.ff1 r7, r3
    bt.addi r7, -0x1
    bn.srli r6, r7, 0x1f
    bt.movi r7, 0x2
    bn.xor r7, r4, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r23, r7, 0x1f
    bn.beqi r6, 0x0, loc_206f8d
    bn.bnei r23, 0x0, loc_206ff2
loc_206f8d:
    bt.movi r7, 0x1
    bn.xor r7, r4, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r4, r7, 0x1f
    bn.bnei r6, 0x0, loc_206fc8
loc_206f9d:
    bt.movi r7, 0x1
    bn.xor r7, r3, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bn.bnei r23, 0x0, loc_206fdd
loc_206fad:
    bn.beqi r4, 0x0, loc_206fb3
    bn.bnei r7, 0x0, loc_207004
loc_206fb3:
    bn.beqi r3, 0x3, loc_207016
    bn.slli r7, r5, 0x1
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0x1234
    bt.add r7, r6
    bn.lh r3, 0x0(r7)
loc_206fc6:
    bt.jr r9
loc_206fc8:
    bn.beqi r4, 0x0, loc_206f9d
    bn.slli r7, r5, 0x1
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0x1246
    bt.add r7, r6
    bn.lh r3, 0x0(r7)
    bt.jr r9
loc_206fdd:
    bn.beqi r7, 0x0, loc_206fad
    bn.slli r7, r5, 0x1
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0x1234
    bt.add r7, r6
    bn.lh r3, 0x0(r7)
    bt.j loc_206fc6
loc_206ff2:
    bn.slli r7, r5, 0x1
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0x1258
    bt.add r7, r6
    bn.lh r3, 0x0(r7)
    bt.jr r9
loc_207004:
    bn.slli r7, r5, 0x1
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0x1210
    bt.add r7, r6
    bn.lh r3, 0x0(r7)
    bt.jr r9
loc_207016:
    bn.slli r7, r5, 0x1
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0x11fe
    bt.add r7, r6
    bn.lh r3, 0x0(r7)
    bt.jr r9
