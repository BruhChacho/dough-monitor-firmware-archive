# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x28f6c7,0x28f73a); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bt.mov r11, r4
    bg.jal 0x27d914
    bn.extbz r12, r3
    bn.ori r7, r0, 0x34
    bn.muls r4, r10, r7
    bg.movhi r6, 0x49
    bg.addi r6, r6, -0x204c
    bn.add r7, r4, r6
    bn.sh_2 0xa(r7), r11
    bn.sbz 0x30(r7), r0
    bn.beqi r12, 0x0, loc_28f723
    bt.mov r10, r4
    bt.add r10, r6
    bt.movi r11, 0x0
    bt.j loc_28f70a
loc_28f702:
    bn.srli r12, r12, 0x1
    bt.addi r11, 0x1
    bn.beqi r12, 0x0, loc_28f723
loc_28f70a:
    bn.extbz r5, r11
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_28f702
    bt.movi r3, 0x0
    bt.mov r4, r10
    bg.jal 0x29af4c
    bn.srli r12, r12, 0x1
    bt.addi r11, 0x1
    bn.bnei r12, 0x0, loc_28f70a
loc_28f723:
    bt.movi r3, 0x1
    bt.movi r4, 0x1
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x28f78a
