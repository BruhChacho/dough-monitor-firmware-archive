# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bd14,0x21bd1e); Read a halfword from global address 0x343c16.
# Fixed original addresses; not hardware-validated.
    bg.movhi r7, 0x34
    bg.lhz r3, 0x3c16(r7)
    bt.jr r9
