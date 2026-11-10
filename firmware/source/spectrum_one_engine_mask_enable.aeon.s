# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22607c,0x226100); Read the engine-bank word at offset 4, then set or clear mask 2 at logical address 0x10800032 + bank according to odd or even bank parity.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r3
    bt.mov r12, r4
    bn.beqi r3, 0x0, loc_2260ec
    bt.movi r11, 0x0
    bn.ori r13, r0, 0x7c
    bt.j loc_2260b4
loc_22609c:
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x32
    bt.add r3, r7
    bt.mov r4, r12
    bt.movi r5, 0x2
    bg.jal 0x23dead
loc_2260ac:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_2260ec
loc_2260b4:
    bn.extbz r6, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_2260ac
    bn.muls r7, r6, r13
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r3, 0x4(r7)
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_22609c
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x32
    bt.add r3, r5
    bt.mov r4, r12
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_2260b4
loc_2260ec:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
