# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e43a,0x20e47e); Write r3 bytes from least to most significant at descending indirect addresses 0x4fff..0x4ffc.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.ori r3, r0, 0x4fff
    bn.extbz r4, r10
    bg.jal 0x20e3be
    bn.srli r4, r10, 0x8
    bg.ori r3, r0, 0x4ffe
    bn.extbz r4, r4
    bg.jal 0x20e3be
    bn.srli r4, r10, 0x10
    bg.ori r3, r0, 0x4ffd
    bn.extbz r4, r4
    bg.jal 0x20e3be
    bg.ori r3, r0, 0x4ffc
    bn.srli r4, r10, 0x18
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20e3be
