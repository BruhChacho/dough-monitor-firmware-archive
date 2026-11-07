# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d89d,0x21d8f7); For each selected engine bit, masked-update engine register offset 0x05 with mask 0x04.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r3
    bt.mov r13, r4
    bn.beqi r3, 0x0, loc_21d8e3
    bt.movi r12, 0x0
    bt.j loc_21d8c2
loc_21d8ba:
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.beqi r10, 0x0, loc_21d8e3
loc_21d8c2:
    bn.extbz r11, r12
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_21d8ba
    bt.mov r3, r11
    bg.jal 0x21d3b1
    bt.addi r3, 0x5
    bt.mov r4, r13
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.bnei r10, 0x0, loc_21d8c2
loc_21d8e3:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
