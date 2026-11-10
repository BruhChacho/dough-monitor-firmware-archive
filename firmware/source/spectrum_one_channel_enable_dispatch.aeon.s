# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x234180,0x2341c8); Dispatch each of four low mask bits to the channel enable register helper.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r12, r3
    bt.movi r11, 0x0
    bt.movi r10, 0x0
loc_234194:
    bn.sra r7, r12, r10
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_2341be
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x213b64
loc_2341a5:
    bt.addi r11, 0x1
    bt.addi r10, 0x1
    bg.bnei r10, 0x4, loc_234194
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_2341be:
    bt.mov r3, r11
    bt.movi r4, 0x0
    bg.jal 0x213b64
    bt.j loc_2341a5
