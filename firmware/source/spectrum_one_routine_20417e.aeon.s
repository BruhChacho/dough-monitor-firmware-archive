# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20417e,0x2041b0); byte-exact only; hardware untested.
    bn.addi r7, r3, -0x9
    bg.bgtui r7, 0x6, loc_2041ab
    bt.movi r7, 0x1
    bn.sbz 0x0(r4), r7
loc_20418a:
    bn.addi r7, r3, -0x1
    bg.bgtui r7, 0xe, loc_20419e
    bt.movi r7, 0x1
    bn.sbz 0x0(r5), r7
    bn.beqi r3, 0x3, loc_2041a4
loc_204199:
    bn.sbz 0x0(r6), r0
    bt.jr r9
loc_20419e:
    bn.sbz 0x0(r5), r0
    bn.bnei r3, 0x3, loc_204199
loc_2041a4:
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.jr r9
loc_2041ab:
    bn.sbz 0x0(r4), r0
    bt.j loc_20418a
