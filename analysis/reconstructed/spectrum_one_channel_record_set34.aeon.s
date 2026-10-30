# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e709,0x23e71e); Write low byte r4 at 0x4821ec + uint32(r3*168) + 0x34; physical meaning unknown.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.sbz 0x34(r3), r4
    bt.jr r9
