# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23eee9,0x23ef0c); Read a 32-bit word from the metadata structure at offset 0x6c.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r3, 0x6c(r3)
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
