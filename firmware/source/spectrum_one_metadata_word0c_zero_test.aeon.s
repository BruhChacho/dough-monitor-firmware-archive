# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23ea03,0x23ea1e); Test whether the 32-bit metadata word at offset 0x0c is zero.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0xc(r3)
    bn.sfnei r7, 0x0
    bn.cmovsi_2 r3, r0, 0x1
    bt.jr r9
