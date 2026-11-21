# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2041b0,0x2041c9); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x16
    bn.muls r3, r3, r7
    bg.movhi r7, 0x34
    bg.lwz r7, 0x0(r7)
    bg.addi r7, r7, 0x794
    bt.add r3, r7
    bn.exthz r3, r3
    bt.jr r9
