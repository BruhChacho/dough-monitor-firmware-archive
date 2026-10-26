# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d57b,0x21d5ef); For each selected engine bit, choose control offset 0x90 or 0x02800090 from channel parity and masked-update bit 3.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r13, r3
    bt.mov r10, r4
    bn.beqi r4, 0x0, loc_21d5c9
    bt.movi r12, 0x0
    bt.j loc_21d5a0
loc_21d598:
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.beqi r10, 0x0, loc_21d5c9
loc_21d5a0:
    bn.extbz r11, r12
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_21d598
    bt.mov r3, r11
    bg.jal 0x21d3b1
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_21d5dd
    bg.addi r3, r3, 0x90
    bt.mov r4, r13
    bt.movi r5, 0x8
    bg.jal 0x23dead
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.bnei r10, 0x0, loc_21d5a0
loc_21d5c9:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_21d5dd:
    bn.movhi_2 r7, 0x280
    bn.ori r7, r7, 0x90
    bt.add r3, r7
    bt.mov r4, r13
    bt.movi r5, 0x8
    bg.jal 0x23dead
    bt.j loc_21d598
