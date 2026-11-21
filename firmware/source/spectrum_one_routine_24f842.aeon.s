# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24f842,0x24fb6d); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r10, r3
    bn.slli r7, r3, 0x4
    bg.movhi r6, 0x49
    bg.addi r6, r6, -0x58dc
    bt.add r7, r6
    bn.lh r12, 0x2(r7)
    bn.lh r13, 0x4(r7)
    bn.lh r14, 0x8(r7)
    bn.lbz r11, 0x1(r7)
    bn.lh r23, 0xc(r7)
    bn.lh r24, 0xe(r7)
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bn.beqi r4, 0x0, loc_24f8e9
    bt.movi r7, 0x6
    bn.xor r7, r4, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r5, r7, 0x1f
    bt.movi r7, 0x8
    bn.xor r7, r4, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r6, r7, 0x1f
    bg.beqi r5, 0x0, loc_24f95e
loc_24f89d:
    bt.movi r7, 0xc
    bn.muls r7, r10, r7
    bg.movhi r25, 0x49
    bg.addi r25, r25, -0x58f4
    bt.add r7, r25
    bn.lbz r7, 0x0(r7)
    bn.beqi r7, 0x0, loc_24f8e9
loc_24f8b2:
    bt.movi r7, 0xc
    bn.muls r7, r10, r7
    bg.movhi r25, 0x49
    bg.addi r25, r25, -0x58f4
    bt.add r7, r25
    bn.lwz r7, 0x4(r7)
    bg.beqi r7, 0x0, loc_24fa3d
    bg.beqi r7, 0x2, loc_24fa50
loc_24f8cc:
    bg.sfgti r12, 0x31f
    bn.bf loc_24f968
    bg.sfgti r13, 0x1f3
    bn.bnf loc_24f9e6
    bg.sfgti r13, 0x257
    bn.bf loc_24f968
    bn.sfeqi r11, 0x0
    bn.cmovi r3, 0xf, 0xd
    bt.j loc_24f947
loc_24f8e9:
    bn.beqi r11, 0x0, loc_24f912
    bn.bnei r5, 0x0, loc_24f8b2
    bn.bnei r6, 0x0, loc_24f8b2
    bn.beqi r4, 0x0, loc_24f8cc
    bg.beqi r4, 0x4, loc_24fad0
loc_24f8f9:
    bt.movi r3, 0x0
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_24f912:
    bg.beqi r5, 0x0, loc_24f9ac
loc_24f916:
    bt.movi r7, 0xc
    bn.muls r7, r10, r7
    bg.movhi r6, 0x49
    bg.addi r6, r6, -0x58f4
    bt.add r7, r6
    bn.lwz r3, 0x4(r7)
    bg.beqi r3, 0x2, loc_24fa03
    bg.beqi r3, 0x1, loc_24fa20
    bg.ble r23, r12, loc_24f9b4
loc_24f934:
    bn.ori r3, r0, 0x35
    bg.bgt r24, r13, loc_24f947
    bn.sfleu r13, r24
    bn.ori r6, r0, 0x37
    bn.ori r7, r0, 0x36
    bn.cmov_0 r3, r6, r7
loc_24f947:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_24f95e:
    bg.bnei r6, 0x0, loc_24f89d
    bg.bnei r4, 0x4, loc_24f8f9
    bt.j loc_24fad0
loc_24f968:
    bg.sfgti r12, 0x513
    bn.bf loc_24f992
    bg.sfgti r13, 0x31f
    bn.bf loc_24f992
    bn.bnei r11, 0x0, loc_24f992
    bn.ori r3, r0, 0x12
    bg.sfleui r14, 0x226
    bn.bnf loc_24f947
    bg.sfleui r14, 0xfa
    bn.ori r6, r0, 0x10
    bn.ori r7, r0, 0x11
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24f992:
    bg.sfleui r12, 0xeff
    bn.bnf loc_24f9cd
    bg.beqi r11, 0x0, loc_24fa63
    bg.sfleui r14, 0x226
    bn.ori r6, r0, 0x14
    bn.ori r7, r0, 0x15
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24f9ac:
    bg.bnei r6, 0x0, loc_24f916
    bg.bgt r23, r12, loc_24f934
loc_24f9b4:
    bg.ble r12, r23, loc_24fa80
    bn.ori r3, r0, 0x38
    bg.bgt r24, r13, loc_24f947
    bn.sfleu r13, r24
    bn.ori r6, r0, 0x3a
    bn.ori r7, r0, 0x39
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24f9cd:
    bn.ori r3, r0, 0x1d
    bg.sfleui r14, 0x226
    bn.bnf loc_24f947
    bg.sfleui r14, 0xfa
    bn.ori r6, r0, 0x1b
    bn.ori r7, r0, 0x1c
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24f9e6:
    bn.sfeqi r11, 0x0
    bn.cmovi r3, 0xe, 0xc
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_24fa03:
    bg.bgt r23, r12, loc_24faa1
    bg.ble r12, r23, loc_24fb31
    bn.ori r3, r0, 0x24
    bg.bgt r24, r13, loc_24f947
    bn.sfleu r13, r24
    bn.ori r6, r0, 0x26
    bn.ori r7, r0, 0x25
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24fa20:
    bg.bgt r23, r12, loc_24fabb
    bg.ble r12, r23, loc_24fb52
    bn.ori r3, r0, 0x2f
    bg.bgt r24, r13, loc_24f947
    bn.sfleu r13, r24
    bn.ori r6, r0, 0x31
    bn.ori r7, r0, 0x30
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24fa3d:
    bt.mov r3, r10
    bg.jal 0x24f834
    bg.beqi r3, 0x0, loc_24f8cc
    bg.bnei r11, 0x0, loc_24f8cc
loc_24fa4b:
    bn.ori r3, r0, 0x3d
    bt.j loc_24f947
loc_24fa50:
    bt.mov r3, r10
    bg.jal 0x24f834
    bg.beqi r3, 0x0, loc_24f8cc
    bg.bnei r11, 0x0, loc_24f8cc
loc_24fa5e:
    bn.ori r3, r0, 0x29
    bt.j loc_24f947
loc_24fa63:
    bg.sfgti r14, 0x226
    bn.bf loc_24fab6
    bg.sfleui r13, 0x5dc
    bn.bnf loc_24fab6
    bg.sfleui r14, 0x1c2
    bn.ori r6, r0, 0x16
    bn.ori r7, r0, 0x18
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24fa80:
    bn.ori r3, r0, 0x3b
    bg.bgt r24, r13, loc_24f947
    bn.ori r3, r0, 0x3c
    bg.bgt r13, r24, loc_24f947
    bg.sfleui r12, 0x1dff
    bn.bf loc_24fa4b
    bn.ori r3, r0, 0x3f
    bg.sfleui r14, 0x226
    bn.bnf loc_24f947
    bt.j loc_24fa4b
loc_24faa1:
    bn.ori r3, r0, 0x21
    bg.bgt r24, r13, loc_24f947
    bn.sfleu r13, r24
    bn.ori r6, r0, 0x23
    bn.ori r7, r0, 0x22
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24fab6:
    bn.ori r3, r0, 0x17
    bt.j loc_24f947
loc_24fabb:
    bn.ori r3, r0, 0x2c
    bg.bgt r24, r13, loc_24f947
    bn.sfleu r13, r24
    bn.ori r6, r0, 0x2e
    bn.ori r7, r0, 0x2d
    bn.cmov_0 r3, r6, r7
    bt.j loc_24f947
loc_24fad0:
    bt.mov r3, r10
    bg.jal 0x24f834
    bn.beqi r3, 0x0, loc_24fadc
    bn.beqi r11, 0x0, loc_24fa5e
loc_24fadc:
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3c84
    bt.add r10, r6
    bn.lbz r7, 0x0(r10)
    bg.beqi r7, 0x0, loc_24f8f9
    bt.movi r3, 0x2
    bg.beqi r7, 0x1, loc_24f947
    bt.movi r3, 0x1
    bg.beqi r7, 0x2, loc_24f947
    bt.movi r3, 0x3
    bg.beqi r7, 0x3, loc_24f947
    bt.movi r3, 0x5
    bg.beqi r7, 0x4, loc_24f947
    bt.movi r3, 0x6
    bg.beqi r7, 0x5, loc_24f947
    bt.movi r3, 0x7
    bg.beqi r7, 0x6, loc_24f947
    bt.movi r3, 0x8
    bg.beqi r7, 0x7, loc_24f947
    bg.beqi r7, 0x8, loc_24fb68
    bg.beqi r7, 0xa, loc_24fb68
    bg.beqi r7, 0x9, loc_24fb68
    bt.movi r3, 0xa
    bg.beqi r7, 0xb, loc_24f947
    bn.sfnei r7, 0xc
    bn.cmovi r3, 0x4, 0xb
    bt.j loc_24f947
loc_24fb31:
    bn.ori r3, r0, 0x27
    bg.bgt r24, r13, loc_24f947
    bn.ori r3, r0, 0x28
    bg.bgt r13, r24, loc_24f947
    bg.sfleui r12, 0x1dff
    bn.bf loc_24fa5e
    bn.ori r3, r0, 0x2b
    bg.sfleui r14, 0x226
    bn.bnf loc_24f947
    bt.j loc_24fa5e
loc_24fb52:
    bn.ori r3, r0, 0x32
    bg.bgt r24, r13, loc_24f947
    bn.sfleu r13, r24
    bn.ori r6, r0, 0x34
    bn.ori r7, r0, 0x33
    bn.cmov_0 r3, r6, r7
    bn.j loc_24f947
loc_24fb68:
    bt.movi r3, 0x9
    bn.j loc_24f947
