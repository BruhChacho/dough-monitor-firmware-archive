# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222819,0x22282e); Read byte at metadata base0x3b4950 + index*176 +0x10; no local bound.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r3, 0x10(r3)
    bt.jr r9
