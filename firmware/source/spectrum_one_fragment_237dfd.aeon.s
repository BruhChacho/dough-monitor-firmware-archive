# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x237dfd,0x237e0b); byte-exact only; hardware untested.
    bt.mov r4, r3
    bg.movhi r3, 0x2e90
    bg.ori r3, r3, 0x2f4b
    bg.j 0x23ddb9
