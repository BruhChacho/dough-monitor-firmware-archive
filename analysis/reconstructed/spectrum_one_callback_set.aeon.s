# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e62c,0x23e63e); Store r4 at callback_table + uint32(r3<<2), with no local index bound.
# Fixed original addresses; not a hardware-validated implementation.
    bn.slli r3, r3, 0x2
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x248c
    bt.add r3, r7
    bn.sw 0x0(r3), r4
    bt.jr r9
