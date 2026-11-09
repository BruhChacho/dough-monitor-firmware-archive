# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27b707,0x27b7d8); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r15, r4
    bt.mov r14, r5
    bt.mov r10, r6
    bn.movhi_2 r6, 0x80
    bn.and r7, r3, r6
    bt.mov r11, r10
    bn.bnei r7, 0x0, loc_27b734
    bt.movi r11, 0x0
    bt.movi r10, 0x0
loc_27b734:
    bt.movi r7, 0x0
    bn.beqi r14, 0x0, loc_27b766
    bg.addi r7, r0, -0x100
    bn.and r6, r3, r7
    bn.andi r7, r3, 0xff
    bn.srli r7, r7, 0x1
    bn.or r12, r6, r7
    bt.movi r13, 0x0
    bn.beqi r11, 0x0, loc_27b798
    bt.movi r3, 0x0
    bt.movi r13, 0x0
loc_27b752:
    bn.andi r7, r10, 0x1
    bn.bnei r7, 0x0, loc_27b782
loc_27b758:
    bn.srli r10, r10, 0x1
    bn.addi r7, r13, 0x1
    bn.extbz r13, r7
    bt.mov r7, r3
    bn.bleui r13, 0x3, loc_27b752
loc_27b766:
    bt.mov r3, r7
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_27b782:
    bt.movi r3, 0x1
    bn.sll r3, r3, r13
    bg.jal 0x27adda
    bg.movhi r6, 0xff80
    bn.ori r6, r6, 0xff
    bn.and r7, r12, r6
    bn.or r12, r7, r3
loc_27b798:
    bn.slli r4, r14, 0x10
    bt.movi r3, 0x0
    bt.movi r8, 0x0
    bn.or r3, r3, r15
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xffff
    bn.and r7, r12, r6
    bn.srli r6, r7, 0x10
    bn.slli r8, r8, 0x10
    bn.or r8, r6, r8
    bn.slli r7, r7, 0x10
    bg.ori r8, r8, 0x8000
    bn.or r3, r3, r7
    bn.or r4, r4, r8
    bt.mov r5, r12
    bg.jal 0x27b5dd
    bn.ff1 r3, r3
    bn.sub r3, r0, r3
    bn.srli r3, r3, 0x1f
    bt.mov r7, r3
    bn.bnei r11, 0x0, loc_27b758
    bt.j loc_27b766
