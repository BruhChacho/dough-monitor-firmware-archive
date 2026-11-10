# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d51e,0x21d57b); For each selected engine bit, masked-update control register offset 0x90 with mask 0x10.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r13, r3
    bt.mov r10, r4
    bn.beqi r4, 0x0, loc_21d567
    bt.movi r12, 0x0
    bt.j loc_21d543
loc_21d53b:
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.beqi r10, 0x0, loc_21d567
loc_21d543:
    bn.extbz r11, r12
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_21d53b
    bt.mov r3, r11
    bg.jal 0x21d3b1
    bg.addi r3, r3, 0x90
    bt.mov r4, r13
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.bnei r10, 0x0, loc_21d543
loc_21d567:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
