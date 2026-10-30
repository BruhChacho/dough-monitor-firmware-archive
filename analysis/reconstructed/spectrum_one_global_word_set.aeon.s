# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bd0a,0x21bd14); Execute ambiguous bg.sw_1 store relative to global 0x343c14; width/lane policies remain unresolved.
# Fixed original addresses; not hardware-validated.
    bg.movhi r7, 0x34
    bg.sw_1 0x3c14(r7), r3
    bt.jr r9
