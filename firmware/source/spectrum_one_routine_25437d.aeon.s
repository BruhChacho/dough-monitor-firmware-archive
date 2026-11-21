# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x25437d,0x25445a); byte-exact only; hardware untested.
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
    bt.mov r16, r4
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r10, 0x2a(r7)
    bn.ff1 r7, r4
    bn.sub r7, r0, r7
    bn.srli r15, r7, 0x1f
    bt.movi r12, 0x0
    bg.movhi r17, 0x3b
    bn.slli r14, r3, 0x1
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7870
    bt.add r14, r7
    bt.j loc_2543d6
loc_2543ce:
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.beqi r10, 0x0, loc_254424
loc_2543d6:
    bn.extbz r6, r12
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_2543ce
    bn.andi r13, r6, 0x1
    bt.movi r7, 0x1
    bn.xor r11, r13, r7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bg.sw_0 0x7430(r17), r7
    bt.mov r3, r11
    bg.jal 0x24f810
    bn.lh r4, 0x0(r14)
    bg.beq r3, r4, loc_254411
    bt.mov r3, r11
    bg.jal 0x24f822
loc_254411:
    bn.beqi r13, 0x0, loc_254444
    bt.mov r3, r11
    bt.mov r4, r15
    bg.jal 0x253749
    bn.srli r10, r10, 0x1
    bt.addi r12, 0x1
    bn.bnei r10, 0x0, loc_2543d6
loc_254424:
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
loc_254444:
    bt.movi r3, 0x0
    bg.jal 0x25430b
    bt.movi r3, 0x1
    bt.mov r4, r16
    bg.jal 0x252f44
    bt.movi r3, 0x1
    bg.jal 0x25430b
    bt.j loc_2543ce
