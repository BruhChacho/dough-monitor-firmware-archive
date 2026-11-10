# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22a9bd,0x22aa4e); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bg.jal 0x2227ef
    bt.mov r11, r3
    bt.mov r3, r10
    bg.jal 0x222804
    bt.mov r12, r3
    bn.andi r10, r10, 0x2
    bn.bnei r10, 0x0, loc_22aa46
    bg.jal 0x222af1
    bt.mov r10, r3
loc_22a9e7:
    bn.bgtui r10, 0x3, loc_22aa33
    bn.ori r7, r0, 0xa8
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r7, 0x29(r7)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_22aa28
loc_22aa05:
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2229f8
    bt.mov r3, r12
    bt.mov r4, r10
    bg.jal 0x22701c
    bt.mov r3, r10
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_22aa28:
    bt.movi r7, 0xf
    bn.sra r7, r7, r10
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_22aa05
loc_22aa33:
    bt.movi r3, 0x4
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_22aa46:
    bg.jal 0x222ace
    bt.mov r10, r3
    bt.j loc_22a9e7
