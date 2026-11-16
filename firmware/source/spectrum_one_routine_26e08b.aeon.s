# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e08b,0x26e0a4); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.addi r7, r0, 0x1b00
    bg.sw_1 0x5810(r6), r7
    bn.ori r7, r0, 0xb7
    bg.sw_1 0x5814(r6), r7
    bt.jr r9
