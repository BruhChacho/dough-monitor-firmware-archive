# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac756,0x2ac837); Convert a two-word input into a tagged conversion record; called helper semantics remain unresolved.
# Fixed original addresses; not hardware-validated.
    bn.lwz r5, 0x0(r3)
    bn.lwz r6, 0x4(r3)
    bt.mov r23, r5
    bt.movhi r7, 0xf
    bg.ori r7, r7, 0xffff
    bn.and r24, r6, r7
    bn.srli r7, r6, 0x14
    bg.ori r25, r0, 0x7ff
    bn.and r7, r7, r25
    bn.srli r5, r6, 0x1f
    bn.andi r5, r5, 0x1
    bn.sw 0x4(r4), r5
    bn.bnei r7, 0x0, loc_2ac7d7
    bn.or r7, r23, r24
    bg.beqi r7, 0x0, loc_2ac804
    bg.addi r7, r0, -0x3fe
    bn.sw 0x8(r4), r7
    bn.srli r7, r23, 0x18
    bn.slli r26, r24, 0x8
    bn.or r26, r7, r26
    bn.slli r25, r23, 0x8
    bt.movi r7, 0x3
    bn.sw 0x0(r4), r7
    bn.movhi_2 r6, 0xfff
    bg.ori r6, r6, 0xffff
    bn.sfgtu r26, r6
    bn.bf loc_2ac7cf
    bg.addi r5, r0, -0x3fe
loc_2ac7ad:
    bn.srli r6, r25, 0x1f
    bn.slli r8, r26, 0x1
    bn.or r8, r6, r8
    bn.slli r7, r25, 0x1
    bt.mov r25, r7
    bt.mov r26, r8
    bt.addi r5, -0x1
    bn.movhi_2 r7, 0xfff
    bg.ori r7, r7, 0xffff
    bn.sfgtu r8, r7
    bn.bnf loc_2ac7ad
    bn.sw 0x8(r4), r5
loc_2ac7cf:
    bn.sw 0x10(r4), r25
    bn.sw 0x14(r4), r26
    bt.jr r9
loc_2ac7d7:
    bg.sfnei r7, 0x7ff
    bn.bnf loc_2ac80b
    bg.addi r7, r7, -0x3ff
    bn.sw 0x8(r4), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r4), r7
    bn.srli r6, r23, 0x18
    bn.slli r8, r24, 0x8
    bn.or r8, r6, r8
    bn.slli r7, r23, 0x8
    bn.sw 0x10(r4), r7
    bn.movhi_2 r6, 0x1000
    bn.or r7, r8, r6
    bn.sw 0x14(r4), r7
    bt.jr r9
loc_2ac804:
    bt.movi r7, 0x2
    bn.sw 0x0(r4), r7
    bt.jr r9
loc_2ac80b:
    bn.or r7, r23, r24
    bn.bnei r7, 0x0, loc_2ac818
    bt.movi r7, 0x4
    bn.sw 0x0(r4), r7
    bt.jr r9
loc_2ac818:
    bt.movi r7, 0x0
    bt.movhi r25, 0x8
    bn.and r8, r24, r25
    bn.or r7, r7, r8
    bn.beqi r7, 0x0, loc_2ac832
    bt.movi r7, 0x1
    bn.sw 0x0(r4), r7
loc_2ac82a:
    bn.sw 0x10(r4), r23
    bn.sw 0x14(r4), r24
    bt.jr r9
loc_2ac832:
    bn.sw 0x0(r4), r0
    bt.j loc_2ac82a
