# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22aca0,0x22acf2); External preparation then selective reset of six 176-byte metadata records with per-record external calls.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.movi r3, 0x0
    bt.movi r4, 0xf
    bg.jal 0x23d3a0
    bg.movhi r7, 0x3b
    bg.addi r10, r7, 0x4960
    bt.movi r11, 0x4
loc_22acbd:
    bn.sbz 0x0(r10), r11
    bn.sh_2 0x2(r10), r0
    bn.sw -0x4(r10), r0
    bn.sbz 0x60(r10), r0
    bt.movi r3, 0x0
    bn.lwz r4, -0x10(r10)
    bn.lwz r5, -0xc(r10)
    bg.jal 0x20f1ef
    bg.addi r10, r10, 0xb0
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4d80
    bg.bne r10, r7, loc_22acbd
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
