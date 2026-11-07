# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bd1e,0x21bd28); Read and return a global halfword.
# Fixed original addresses; not a hardware-validated implementation.
    bg.movhi r7, 0x34
    bg.lhz r3, 0x3c14(r7)
    bt.jr r9
