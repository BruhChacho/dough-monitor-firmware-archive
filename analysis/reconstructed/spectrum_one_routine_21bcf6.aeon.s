# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bcf6,0x21bd00); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.sh 0x4830(r7), r3
    bt.jr r9
