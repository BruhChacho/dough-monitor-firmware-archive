# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20ccf6,0x20cd13); Clear slot state and received byte count; no slot bound in this routine.
# Fixed original addresses; not a hardware-validated implementation.
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3b94
    bn.add r7, r3, r6
    bn.sbz 0x0(r7), r0
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x414c
    bt.add r3, r7
    bn.sbz 0x0(r3), r0
    bt.jr r9
