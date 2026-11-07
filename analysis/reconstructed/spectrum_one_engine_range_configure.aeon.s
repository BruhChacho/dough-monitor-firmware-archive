# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22d986,0x22dc46); Derive start/end values and route four word writes plus a control-bit update according to engine parity and mode.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r14, r3
    bt.mov r15, r4
    bn.ori r7, r0, 0x7c
    bn.muls r10, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r10, r5
    bn.lwz r11, 0x4(r10)
    bg.jal 0x2227ef
    bt.movi r12, 0x0
    bt.movi r13, 0x0
    bn.bnei r15, 0x0, loc_22d9f4
    bn.lbz r7, 0x78(r10)
    bg.beqi r7, 0x2, loc_22dbee
    bg.beqi r7, 0x1, loc_22dc1a
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lwz r6, 0x5c(r7)
    bg.movhi r5, 0x3fff
    bg.ori r5, r5, 0xffff
    bn.and r6, r6, r5
    bn.srli r12, r6, 0x5
    bn.lwz r7, 0x68(r7)
    bt.add r6, r7
    bn.srli r13, r6, 0x5
loc_22d9f4:
    bn.andi r7, r14, 0x1
    bn.beqi r7, 0x0, loc_22da6e
    bg.movhi r10, 0x45
    bg.lbz r6, 0x5210(r10)
    bg.beqi r6, 0x0, loc_22db68
    bn.movhi_2 r7, 0xd80
    bn.ori r7, r7, 0x80
    bn.add r3, r11, r7
    bt.mov r4, r12
    bg.jal 0x23e50c
    bg.lbz r6, 0x5210(r10)
    bg.beqi r6, 0x0, loc_22db7f
loc_22da1d:
    bn.movhi_2 r7, 0xd80
    bn.ori r7, r7, 0x84
    bn.add r3, r11, r7
    bt.mov r4, r13
    bg.jal 0x23e50c
    bg.lbz r6, 0x5210(r10)
    bg.beqi r6, 0x0, loc_22db96
loc_22da34:
    bn.movhi_2 r7, 0xd80
    bn.ori r7, r7, 0xc8
    bn.add r3, r11, r7
    bt.mov r4, r12
    bg.jal 0x23e50c
    bg.lbz r6, 0x5210(r10)
    bg.beqi r6, 0x0, loc_22dbad
loc_22da4b:
    bn.movhi_2 r7, 0xd80
    bn.ori r7, r7, 0xcc
    bn.add r3, r11, r7
    bt.mov r4, r13
    bg.jal 0x23e50c
    bg.lbz r10, 0x5210(r10)
    bg.beqi r10, 0x0, loc_22dbc4
loc_22da62:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0xe
    bn.add r3, r11, r6
    bt.j loc_22dae0
loc_22da6e:
    bg.movhi r10, 0x45
    bg.lbz r5, 0x5210(r10)
    bg.beqi r5, 0x0, loc_22db00
    bn.movhi_2 r6, 0xd80
    bn.ori r6, r6, 0x88
    bn.add r3, r11, r6
    bt.mov r4, r12
    bg.jal 0x23e50c
    bg.lbz r5, 0x5210(r10)
    bg.beqi r5, 0x0, loc_22db17
loc_22da91:
    bn.movhi_2 r6, 0xd80
    bn.ori r6, r6, 0x8c
    bn.add r3, r11, r6
    bt.mov r4, r13
    bg.jal 0x23e50c
    bg.lbz r5, 0x5210(r10)
    bg.beqi r5, 0x0, loc_22db2e
loc_22daa8:
    bn.movhi_2 r6, 0xd80
    bn.ori r6, r6, 0xd0
    bn.add r3, r11, r6
    bt.mov r4, r12
    bg.jal 0x23e50c
    bg.lbz r5, 0x5210(r10)
    bg.beqi r5, 0x0, loc_22db45
loc_22dabf:
    bn.movhi_2 r6, 0xd80
    bn.ori r6, r6, 0xd4
    bn.add r3, r11, r6
    bt.mov r4, r13
    bg.jal 0x23e50c
    bg.lbz r10, 0x5210(r10)
    bg.beqi r10, 0x0, loc_22db5c
loc_22dad6:
    bg.movhi r5, 0x3280
    bn.ori r5, r5, 0x8e
    bn.add r3, r11, r5
loc_22dae0:
    bt.mov r4, r15
    bt.movi r5, 0x1
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bg.j 0x23e5ed
loc_22db00:
    bn.movhi_2 r7, 0xd80
    bn.ori r7, r7, 0x88
    bn.add r3, r11, r7
    bt.mov r4, r12
    bg.jal 0x23e2b8
    bg.lbz r5, 0x5210(r10)
    bg.bnei r5, 0x0, loc_22da91
loc_22db17:
    bn.movhi_2 r7, 0xd80
    bn.ori r7, r7, 0x8c
    bn.add r3, r11, r7
    bt.mov r4, r13
    bg.jal 0x23e2b8
    bg.lbz r5, 0x5210(r10)
    bg.bnei r5, 0x0, loc_22daa8
loc_22db2e:
    bn.movhi_2 r7, 0xd80
    bn.ori r7, r7, 0xd0
    bn.add r3, r11, r7
    bt.mov r4, r12
    bg.jal 0x23e2b8
    bg.lbz r5, 0x5210(r10)
    bg.bnei r5, 0x0, loc_22dabf
loc_22db45:
    bn.movhi_2 r7, 0xd80
    bn.ori r7, r7, 0xd4
    bn.add r3, r11, r7
    bt.mov r4, r13
    bg.jal 0x23e2b8
    bg.lbz r10, 0x5210(r10)
    bg.bnei r10, 0x0, loc_22dad6
loc_22db5c:
    bg.movhi r6, 0x3280
    bn.ori r6, r6, 0x8e
    bn.add r3, r11, r6
    bt.j loc_22dbce
loc_22db68:
    bn.movhi_2 r5, 0xd80
    bn.ori r5, r5, 0x80
    bn.add r3, r11, r5
    bt.mov r4, r12
    bg.jal 0x23e2b8
    bg.lbz r6, 0x5210(r10)
    bg.bnei r6, 0x0, loc_22da1d
loc_22db7f:
    bn.movhi_2 r5, 0xd80
    bn.ori r5, r5, 0x84
    bn.add r3, r11, r5
    bt.mov r4, r13
    bg.jal 0x23e2b8
    bg.lbz r6, 0x5210(r10)
    bg.bnei r6, 0x0, loc_22da34
loc_22db96:
    bn.movhi_2 r5, 0xd80
    bn.ori r5, r5, 0xc8
    bn.add r3, r11, r5
    bt.mov r4, r12
    bg.jal 0x23e2b8
    bg.lbz r6, 0x5210(r10)
    bg.bnei r6, 0x0, loc_22da4b
loc_22dbad:
    bn.movhi_2 r5, 0xd80
    bn.ori r5, r5, 0xcc
    bn.add r3, r11, r5
    bt.mov r4, r13
    bg.jal 0x23e2b8
    bg.lbz r10, 0x5210(r10)
    bg.bnei r10, 0x0, loc_22da62
loc_22dbc4:
    bg.movhi r7, 0x3280
    bn.ori r7, r7, 0xe
    bn.add r3, r11, r7
loc_22dbce:
    bt.mov r4, r15
    bt.movi r5, 0x1
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bg.j 0x23dead
loc_22dbee:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lwz r6, 0x64(r7)
    bg.movhi r5, 0x3fff
    bg.ori r5, r5, 0xffff
    bn.and r6, r6, r5
    bn.srli r12, r6, 0x5
    bn.lwz r7, 0x70(r7)
    bt.add r6, r7
    bn.srli r13, r6, 0x5
    bn.j loc_22d9f4
loc_22dc1a:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lwz r6, 0x60(r7)
    bg.movhi r5, 0x3fff
    bg.ori r5, r5, 0xffff
    bn.and r6, r6, r5
    bn.srli r12, r6, 0x5
    bn.lwz r7, 0x6c(r7)
    bt.add r6, r7
    bn.srli r13, r6, 0x5
    bn.j loc_22d9f4
