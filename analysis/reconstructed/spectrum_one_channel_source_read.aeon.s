# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2227da,0x2227ef); Read byte at channel record base0x4821ec + index*168 +0x28; no local bound.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.lbz r3, 0x28(r3)
    bt.jr r9
