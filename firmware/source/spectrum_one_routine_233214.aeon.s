# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x233214,0x2334ec); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x40
    bn.sw 0x3c(r1), r9
    bn.sw 0x38(r1), r10
    bn.sw 0x34(r1), r11
    bn.sw 0x30(r1), r12
    bn.sw 0x2c(r1), r13
    bn.sw 0x28(r1), r14
    bn.sw 0x24(r1), r15
    bn.sw 0x20(r1), r16
    bn.sw 0x1c(r1), r17
    bn.sw 0x18(r1), r18
    bn.sw 0x14(r1), r19
    bn.sw 0x10(r1), r20
    bn.sw 0xc(r1), r21
    bn.sw 0x8(r1), r22
    bt.mov r13, r3
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r22, 0x4(r7)
    bg.jal 0x21d3b1
    bt.mov r12, r3
    bt.mov r3, r13
    bg.jal 0x222804
    bt.mov r14, r3
    bn.sh_2 0x6(r1), r0
    bn.sh_1 0x4(r1), r0
    bn.ori r7, r0, 0xb0
    bn.muls r6, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bn.lwz r5, 0x4(r6)
    bn.andi r7, r5, 0x80
    bg.beqi r7, 0x0, loc_233394
    bn.andi r18, r13, 0x1
    bn.addi r17, r12, 0x3b
    bn.addi r16, r12, 0x42
    bn.addi r15, r12, 0x43
    bn.ori r21, r0, 0x81
    bt.movi r10, 0x3
    bn.ori r20, r0, 0x30
    bn.ori r19, r0, 0xc5
loc_23329b:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r14, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bg.lbz r6, 0x8a(r7)
    bg.bnei r6, 0x0, loc_233382
    bg.lbz r6, 0x8b(r7)
    bg.bnei r6, 0x0, loc_233382
loc_2332bb:
    bn.andi r11, r10, 0xcc
loc_2332be:
    bn.ori r7, r0, 0xb0
    bn.muls r10, r14, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r10, r7
    bn.lwz r3, 0x0(r10)
    bn.addi r4, r1, 0x6
    bn.addi r5, r1, 0x4
    bg.jal 0x20eb70
    bn.lwz r7, 0x4(r10)
    bn.andi r7, r7, 0x20
    bg.bnei r7, 0x0, loc_23342a
loc_2332e5:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r14, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bt.movi r10, 0x4
    bg.ori r13, r0, 0xa001
    bn.bnei r7, 0x0, loc_23330a
    bt.movi r10, 0x0
    bg.ori r13, r0, 0x8001
loc_23330a:
    bg.beqi r18, 0x0, loc_2333d1
    bt.mov r3, r17
    bt.mov r4, r21
    bn.ori r5, r0, 0x9f
    bg.jal 0x23dfe1
    bt.mov r3, r16
    bt.mov r4, r11
    bt.movi r5, 0x3
    bg.jal 0x23dfe1
    bt.mov r3, r15
    bt.mov r4, r19
    bg.jal 0x23ddb9
    bn.addi r3, r12, 0x47
    bt.mov r4, r20
    bg.jal 0x23ddb9
    bn.addi r3, r12, 0x10
    bt.mov r4, r10
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x22
    bn.add r3, r22, r7
    bt.mov r4, r13
    bg.ori r5, r0, 0xa00f
    bg.jal 0x23e152
loc_233353:
    bn.lwz r22, 0x8(r1)
    bn.lwz r21, 0xc(r1)
    bn.lwz r20, 0x10(r1)
    bn.lwz r19, 0x14(r1)
    bn.lwz r18, 0x18(r1)
    bn.lwz r17, 0x1c(r1)
    bn.lwz r16, 0x20(r1)
    bn.lwz r15, 0x24(r1)
    bn.lwz r14, 0x28(r1)
    bn.lwz r13, 0x2c(r1)
    bn.lwz r12, 0x30(r1)
    bn.lwz r11, 0x34(r1)
    bn.lwz r10, 0x38(r1)
    bn.lwz r9, 0x3c(r1)
    bn.addi r1, r1, 0x40
    bt.jr r9
loc_233382:
    bn.lwz r7, 0x4(r7)
    bn.andi r7, r7, 0x8
    bn.ori r6, r10, 0x1
    bn.andi r11, r6, 0xfd
    bg.bnei r7, 0x0, loc_2332be
    bt.j loc_2332bb
loc_233394:
    bn.lbz r7, 0x20(r6)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_233404
    bn.andi r18, r13, 0x1
    bg.bnei r18, 0x0, loc_233462
    bn.addi r17, r12, 0x3b
    bt.mov r3, r17
    bg.jal 0x23dd44
    bn.andi r21, r3, 0x7f
    bn.addi r16, r12, 0x42
    bt.mov r3, r16
    bg.jal 0x23dd44
    bt.mov r10, r3
    bn.addi r15, r12, 0x43
    bt.mov r3, r15
    bg.jal 0x23dd44
    bn.addi r7, r0, -0x40
    bn.or r3, r3, r7
    bn.extbz r19, r3
    bt.movi r20, 0x0
    bt.j loc_23329b
loc_2333d1:
    bt.mov r3, r17
    bt.mov r4, r21
    bn.ori r5, r0, 0x9f
    bg.jal 0x23dfe1
    bt.mov r3, r16
    bt.mov r4, r11
    bt.movi r5, 0x3
    bg.jal 0x23dfe1
    bt.mov r3, r15
    bt.mov r4, r19
    bg.jal 0x23ddb9
    bn.addi r3, r12, 0x47
    bt.mov r4, r20
    bg.jal 0x23ddb9
    bn.addi r3, r12, 0x10
    bt.mov r4, r10
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bt.j loc_233353
loc_233404:
    bn.andi r7, r5, 0x1
    bg.bnei r7, 0x0, loc_23348f
    bn.andi r7, r5, 0x20
    bg.beqi r7, 0x0, loc_2334a8
    bn.andi r18, r13, 0x1
    bn.addi r17, r12, 0x3b
    bn.addi r16, r12, 0x42
    bn.addi r15, r12, 0x43
    bt.movi r21, 0x1
    bn.ori r10, r0, 0x3c
    bt.movi r20, 0x0
    bn.ori r19, r0, 0xc1
    bt.j loc_23329b
loc_23342a:
    bn.lwz r3, 0x0(r10)
    bg.jal 0x20eb00
    bn.beqi r3, 0x0, loc_23344f
    bt.mov r3, r13
    bg.jal 0x21d7f7
    bn.andi r3, r3, 0x8
    bn.bnei r3, 0x0, loc_23344a
    bn.lh r7, 0x4(r1)
    bg.sfgti r7, 0x258
    bn.bnf loc_23344f
loc_23344a:
    bn.ori r11, r0, 0x3f
    bt.j loc_2332e5
loc_23344f:
    bn.lwz r3, 0x0(r10)
    bg.jal 0x20eac8
    bn.ori r11, r0, 0x3c
    bg.beqi r3, 0x0, loc_2332e5
    bn.ori r11, r0, 0x3f
    bt.j loc_2332e5
loc_233462:
    bn.addi r17, r12, 0x3b
    bt.mov r3, r17
    bg.jal 0x23dd44
    bn.andi r21, r3, 0x7f
    bn.addi r16, r12, 0x42
    bt.mov r3, r16
    bg.jal 0x23dd44
    bt.mov r10, r3
    bn.addi r15, r12, 0x43
    bt.mov r3, r15
    bg.jal 0x23dd44
    bn.addi r6, r0, -0x40
    bn.or r3, r3, r6
    bn.extbz r19, r3
    bt.movi r20, 0x0
    bt.j loc_23329b
loc_23348f:
    bn.andi r18, r13, 0x1
    bn.addi r17, r12, 0x3b
    bn.addi r16, r12, 0x42
    bn.addi r15, r12, 0x43
    bn.ori r21, r0, 0x81
    bt.movi r10, 0x0
    bt.movi r20, 0x0
    bn.ori r19, r0, 0xc1
    bn.j loc_23329b
loc_2334a8:
    bt.mov r3, r13
    bg.jal 0x21d76c
    bn.beqi r3, 0x1, loc_2334c9
loc_2334b1:
    bn.andi r18, r13, 0x1
    bn.addi r17, r12, 0x3b
    bn.addi r16, r12, 0x42
    bn.addi r15, r12, 0x43
    bt.movi r21, 0x1
    bt.movi r10, 0x0
    bt.movi r20, 0x0
    bn.ori r19, r0, 0xc1
    bn.j loc_23329b
loc_2334c9:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x51b0(r7)
    bn.beqi r7, 0x1, loc_2334b1
    bn.andi r18, r13, 0x1
    bn.addi r17, r12, 0x3b
    bn.addi r16, r12, 0x42
    bn.addi r15, r12, 0x43
    bt.movi r21, 0x1
    bt.movi r10, 0x0
    bt.movi r20, 0x0
    bn.ori r19, r0, 0xc0
    bn.j loc_23329b
