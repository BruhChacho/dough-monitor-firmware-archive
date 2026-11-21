# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x265650,0x265677); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xf0
    bn.muls r3, r3, r7
    bn.ori r6, r0, 0x64
    bn.divs r3, r3, r6
    bn.sub r7, r7, r3
    bn.exthz r6, r7
    bg.addi r7, r6, 0xf0
    bn.exthz r3, r7
    bn.sfgtui r6, 0x77
    bn.bnf loc_265675
    bn.addi r7, r6, -0x78
    bn.exthz r3, r7
loc_265675:
    bt.jr r9
