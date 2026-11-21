# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x204243,0x204254); byte-exact only; hardware untested.
    bg.movhi r7, 0x34
    bg.lhz r7, 0x0(r7)
    bg.addi r3, r7, 0xbdf
    bn.exthz r3, r3
    bt.jr r9
