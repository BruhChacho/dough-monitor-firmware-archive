# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x236b04,0x236b18); byte-exact only; hardware untested.
    bt.movi r7, 0x1
    bg.movhi r6, 0x3b
    bg.sbz 0x37f4(r6), r7
    bg.movhi r7, 0x45
    bg.sbz 0x5024(r7), r0
    bt.jr r9
