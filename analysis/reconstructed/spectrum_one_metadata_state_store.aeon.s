# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e66d,0x20e687); Store low bytes of three arguments at globals 0x454160..162.
# Fixed original addresses; not a hardware-validated implementation.
    bg.movhi r7, 0x45
    bg.sbz 0x4160(r7), r3
    bg.movhi r7, 0x45
    bg.sbz 0x4161(r7), r4
    bg.movhi r7, 0x45
    bg.sbz 0x4162(r7), r5
    bt.jr r9
