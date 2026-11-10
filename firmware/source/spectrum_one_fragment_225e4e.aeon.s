# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x225e4e,0x225f40); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bn.sw 0x4(r1), r16
    bn.sw 0x0(r1), r17
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lbz r12, 0x28(r3)
    bg.lbz r10, 0x98(r3)
    bn.beqi r10, 0x0, loc_225ed3
    bt.movi r11, 0x0
    bn.ori r13, r0, 0x18
loc_225e8b:
    bn.extbz r3, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_225eab
    bn.bgtui r3, 0x3, loc_225eab
    bn.muls r7, r3, r13
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bn.lbz r7, 0x0(r7)
    bg.bnei r7, 0x0, loc_225f38
loc_225eab:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_225e8b
loc_225eb3:
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
loc_225ed3:
    bt.mov r13, r12
    bt.movi r16, 0x0
    bt.movi r15, 0x0
    bt.mov r17, r3
    bn.ori r7, r0, 0xb0
    bn.muls r14, r12, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r14, r7
    bg.addi r12, r3, 0x9a
loc_225eef:
    bn.lh r10, 0x0(r12)
    bg.lbz r6, 0x94(r17)
    bn.beqi r6, 0x0, loc_225f06
    bg.lwz r7, 0x80(r14)
    bn.beqi r7, 0x0, loc_225f06
    bn.add r7, r14, r16
    bn.lbz r13, 0x7c(r7)
loc_225f06:
    bn.beqi r10, 0x0, loc_225f2c
    bt.movi r11, 0x0
    bt.j loc_225f15
loc_225f0d:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_225f2c
loc_225f15:
    bn.extbz r4, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_225f0d
    bt.mov r3, r13
    bg.jal 0x21ddcf
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_225f15
loc_225f2c:
    bt.addi r16, 0x1
    bt.addi r12, 0x2
    bt.addi r15, 0x1
    bg.bnei r15, 0x4, loc_225eef
    bt.j loc_225eb3
loc_225f38:
    bt.mov r4, r12
    bg.jal 0x225416
    bt.j loc_225eab
