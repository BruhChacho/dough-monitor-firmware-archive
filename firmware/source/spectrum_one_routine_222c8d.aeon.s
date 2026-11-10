# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222c8d,0x222cbd); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r3, r7
    bg.movhi r7, 0x2b
    bg.lwz r6, -0x9d0(r7)
    bn.sw 0x68(r3), r6
    bg.addi r7, r7, -0x9d0
    bn.lwz r7, 0x4(r7)
    bn.sw 0x6c(r3), r7
    bn.sh_2 0x62(r3), r0
    bn.sh_1 0x64(r3), r0
    bn.sbz 0x60(r3), r0
    bt.jr r9
