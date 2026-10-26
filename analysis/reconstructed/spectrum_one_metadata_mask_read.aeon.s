# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22282e,0x222843); Read low halfword at metadata base0x3b4950 + index*176 +0x12; halfword semantics assumed.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lh r3, 0x12(r3)
    bt.jr r9
