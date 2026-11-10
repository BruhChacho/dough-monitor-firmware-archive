# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22e68a,0x22e6f9); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lh r7, 0x2c(r3)
    bg.ori r6, r0, 0x1ff0
    bn.and r12, r7, r6
    bn.andi r7, r7, 0xf
    bn.sh_1 0x2c(r3), r7
    bt.mov r3, r12
    bt.movi r4, 0x1
    bg.jal 0x22dc46
    bt.movi r10, 0x0
    bt.j loc_22e6ca
loc_22e6c4:
    bt.addi r10, 0x1
    bg.beqi r10, 0xd, loc_22e6e8
loc_22e6ca:
    bn.extbz r11, r10
    bn.sra r7, r12, r10
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22e6c4
    bt.mov r3, r11
    bg.jal 0x222804
    bt.mov r4, r11
    bg.jal 0x22acf2
    bt.addi r10, 0x1
    bg.bnei r10, 0xd, loc_22e6ca
loc_22e6e8:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
