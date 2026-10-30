# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e8a2,0x23e999); Reset selected fields of a 168-byte channel record; not a full memset; wide store semantics conditional.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.sbz 0x0(r3), r0
    bn.sw 0x4(r3), r0
    bg.movhi r7, 0x2b
    bg.lwz r6, -0x9e0(r7)
    bn.sw 0x8(r3), r6
    bg.addi r7, r7, -0x9e0
    bn.lwz r7, 0x4(r7)
    bn.sw 0xc(r3), r7
    bn.sw 0x10(r3), r6
    bn.sw 0x14(r3), r7
    bn.sw 0x18(r3), r6
    bn.sw 0x1c(r3), r7
    bn.sw 0x20(r3), r6
    bn.sw 0x24(r3), r7
    bn.sbz 0x28(r3), r0
    bn.sbz 0x29(r3), r0
    bn.sh_2 0x2a(r3), r0
    bn.sh_1 0x2c(r3), r0
    bn.sbz 0x2e(r3), r0
    bn.sbz 0x2f(r3), r0
    bn.sbz 0x30(r3), r0
    bn.sh_2 0x32(r3), r0
    bn.sbz 0x34(r3), r0
    bn.sbz 0x35(r3), r0
    bn.sbz 0x36(r3), r0
    bn.sbz 0x37(r3), r0
    bn.sbz 0x38(r3), r0
    bn.sbz 0x39(r3), r0
    bn.sw 0x3c(r3), r0
    bn.sw 0x40(r3), r0
    bn.sw 0x44(r3), r0
    bn.sw 0x48(r3), r0
    bn.sw 0x4c(r3), r0
    bn.sw 0x50(r3), r0
    bn.sw 0x54(r3), r0
    bn.lwz r7, 0x58(r3)
    bt.movi r6, -0x2
    bn.and r7, r7, r6
    bn.sw 0x58(r3), r7
    bn.sbz 0x59(r3), r0
    bn.sbz 0x5a(r3), r0
    bn.sbz 0x5b(r3), r0
    bn.sw 0x5c(r3), r0
    bn.sw 0x68(r3), r0
    bn.sw 0x74(r3), r0
    bn.sw 0x60(r3), r0
    bn.sw 0x6c(r3), r0
    bn.sw 0x78(r3), r0
    bn.sw 0x64(r3), r0
    bn.sw 0x70(r3), r0
    bn.sw 0x7c(r3), r0
    bg.sbz 0x80(r3), r0
    bg.sbz 0x81(r3), r0
    bg.sbz 0x82(r3), r0
    bg.sbz 0x83(r3), r0
    bg.sbz 0x84(r3), r0
    bg.sw_0 0x88(r3), r0
    bg.sw_0 0x8c(r3), r0
    bg.sw_1 0x90(r3), r0
    bg.sh 0x90(r3), r0
    bg.sbz 0x94(r3), r0
    bg.sbz 0x95(r3), r0
    bg.sbz 0x96(r3), r0
    bg.sbz 0x97(r3), r0
    bg.sbz 0x98(r3), r0
    bg.sbz 0xa4(r3), r0
    bt.movi r7, 0x1
    bg.sbz 0xa5(r3), r7
    bg.sbz 0xa2(r3), r0
    bg.sbz 0xa3(r3), r0
    bt.jr r9
