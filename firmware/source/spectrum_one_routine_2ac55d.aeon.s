# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac55d,0x2ac756); byte-exact only; hardware untested.
    bn.lwz r23, 0x10(r3)
    bn.lwz r24, 0x14(r3)
    bn.lwz r29, 0x4(r3)
    bn.lwz r7, 0x0(r3)
    bn.bgtui r7, 0x1, loc_2ac596
    bt.movhi r6, 0x8
    bn.or r8, r24, r6
    bt.movhi r6, 0xf
    bg.ori r6, r6, 0xffff
    bn.and r24, r8, r6
    bt.movi r25, 0x0
    bg.movhi r26, 0x7ff0
loc_2ac580:
    bn.andi r7, r29, 0x1
    bn.slli r8, r7, 0x1f
    bt.movi r7, 0x0
    bn.or r5, r23, r7
    bn.or r6, r24, r8
    bn.or r3, r25, r5
    bn.or r4, r26, r6
    bt.jr r9
loc_2ac596:
    bg.beqi r7, 0x4, loc_2ac665
    bg.beqi r7, 0x2, loc_2ac685
    bn.or r7, r23, r24
    bg.beqi r7, 0x0, loc_2ac685
    bn.lwz r3, 0x8(r3)
    bg.sfgtsi r3, -0x3ff
    bn.bf loc_2ac6a3
    bg.addi r7, r0, -0x3fe
    bn.sub r3, r7, r3
    bt.movi r25, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bn.sfgtsi r3, 0x38
    bn.bf loc_2ac64c
    bn.addi r5, r3, -0x20
    bn.srl r4, r24, r5
    bn.slli r6, r24, 0x1
    bn.ori r7, r0, 0x1f
    bn.sub r7, r7, r3
    bn.sll r6, r6, r7
    bn.sfgtsi r5, -0x1
    bn.srl r25, r23, r3
    bn.or r25, r6, r25
    bn.srl r26, r24, r3
    bn.cmov_0 r25, r4, r25
    bn.sfgtsi r5, -0x1
    bn.cmov_0 r26, r0, r26
    bt.movi r27, 0x0
    bt.movi r28, 0x0
    bt.movi r6, 0x1
    bn.sll r4, r6, r5
    bn.sfgtsi r5, -0x1
    bt.movi r8, 0x0
    bn.sll r7, r6, r3
    bn.cmov_0 r8, r4, r8
    bn.sfgtsi r5, -0x1
    bn.cmov_0 r7, r0, r7
    bt.addi r7, -0x1
    bg.addci_maybe r8, r8, -0x1
    bn.and r5, r23, r7
    bn.and r6, r24, r8
    bn.or r5, r5, r6
    bn.beqi r5, 0x0, loc_2ac619
    bt.movi r27, 0x1
    bt.movi r28, 0x0
loc_2ac619:
    bn.or r23, r25, r27
    bn.or r24, r26, r28
    bn.andi r7, r23, 0xff
    bt.movi r8, 0x0
    bg.sfnei r7, 0x80
    bn.bnf loc_2ac71d
loc_2ac62b:
    bt.mov r7, r23
    bt.mov r8, r24
    bn.addi r7, r7, 0x7f
    bn.addc r8, r8, r0
loc_2ac635:
    bn.movhi_2 r6, 0x1000
    bn.sfgtu r6, r8
    bn.cmovsi_2 r6, r0, 0x1
    bt.mov r25, r6
    bn.slli r6, r8, 0x18
    bn.srli r4, r7, 0x8
    bn.or r4, r6, r4
    bn.srli r5, r8, 0x8
loc_2ac64c:
    bt.mov r23, r4
    bt.movhi r7, 0xf
    bg.ori r7, r7, 0xffff
    bn.and r24, r5, r7
    bg.ori r6, r0, 0x7ff
    bn.and r7, r25, r6
    bn.slli r26, r7, 0x14
    bt.movi r25, 0x0
    bt.j loc_2ac580
loc_2ac665:
    bt.movi r23, 0x0
    bt.movi r24, 0x0
    bt.movi r25, 0x0
    bg.movhi r26, 0x7ff0
    bn.andi r7, r29, 0x1
    bn.slli r8, r7, 0x1f
    bt.movi r7, 0x0
    bn.or r5, r23, r7
    bn.or r6, r24, r8
    bn.or r3, r25, r5
    bn.or r4, r26, r6
    bt.jr r9
loc_2ac685:
    bt.movi r23, 0x0
    bt.movi r24, 0x0
    bt.movi r25, 0x0
    bt.movi r26, 0x0
    bn.andi r7, r29, 0x1
    bn.slli r8, r7, 0x1f
    bt.movi r7, 0x0
    bn.or r5, r23, r7
    bn.or r6, r24, r8
    bn.or r3, r25, r5
    bn.or r4, r26, r6
    bt.jr r9
loc_2ac6a3:
    bg.sfgtsi r3, 0x3ff
    bn.bf loc_2ac665
    bg.addi r3, r3, 0x3ff
    bn.andi r7, r23, 0xff
    bt.movi r8, 0x0
    bg.sfnei r7, 0x80
    bn.bnf loc_2ac704
loc_2ac6ba:
    bn.addi r23, r23, 0x7f
    bn.addc r24, r24, r0
loc_2ac6c0:
    bn.movhi_2 r7, 0x1fff
    bg.ori r7, r7, 0xffff
    bn.sfgtu r24, r7
    bn.bnf loc_2ac6df
    bn.slli r6, r24, 0x1f
    bn.srli r7, r23, 0x1
    bn.or r7, r6, r7
    bn.srli r8, r24, 0x1
    bt.mov r23, r7
    bt.mov r24, r8
    bt.addi r3, 0x1
loc_2ac6df:
    bn.slli r6, r24, 0x18
    bn.srli r7, r23, 0x8
    bn.or r7, r6, r7
    bn.srli r8, r24, 0x8
    bt.mov r23, r7
    bt.movhi r6, 0xf
    bg.ori r6, r6, 0xffff
    bn.and r24, r8, r6
    bg.ori r6, r0, 0x7ff
    bn.and r7, r3, r6
    bn.slli r26, r7, 0x14
    bt.movi r25, 0x0
    bt.j loc_2ac580
loc_2ac704:
    bn.bnei r8, 0x0, loc_2ac6ba
    bg.ori r6, r0, 0x100
    bn.and r7, r23, r6
    bn.or r7, r7, r8
    bn.beqi r7, 0x0, loc_2ac6c0
    bg.addi r23, r23, 0x80
    bn.addc r24, r24, r0
    bt.j loc_2ac6c0
loc_2ac71d:
    bg.bnei r8, 0x0, loc_2ac62b
    bg.ori r6, r0, 0x100
    bn.and r7, r23, r6
    bt.movi r8, 0x0
    bn.or r7, r7, r8
    bn.bnei r7, 0x0, loc_2ac749
    bn.movhi_2 r7, 0x1000
    bn.sfgtu r7, r24
    bn.cmovsi_2 r7, r0, 0x1
    bt.mov r25, r7
    bn.slli r7, r24, 0x18
    bn.srli r4, r23, 0x8
    bn.or r4, r7, r4
    bn.srli r5, r24, 0x8
    bt.j loc_2ac64c
loc_2ac749:
    bt.mov r7, r23
    bt.mov r8, r24
    bg.addi r7, r7, 0x80
    bn.addc r8, r8, r0
    bt.j loc_2ac635
