# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2227ef,0x222804); Read byte at engine record base0x47fa9c + index*124 +0x10; no local bound.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r3, r7
    bn.lbz r3, 0x10(r3)
    bt.jr r9
