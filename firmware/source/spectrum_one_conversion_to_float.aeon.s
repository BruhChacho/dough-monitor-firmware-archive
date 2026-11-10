# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2aba8f,0x2abba0); Convert a tagged value to a 32-bit floating-point representation; numeric edge behavior is not independently validated.
# Fixed original addresses; not hardware-validated.
    bn.lwz r5, 0xc(r3)
    bn.lwz r4, 0x4(r3)
    bn.lwz r7, 0x0(r3)
    bn.bgtui r7, 0x1, loc_2abab9
    bt.movhi r6, -0x10
    bn.or r7, r5, r6
    bn.movhi_2 r5, 0x7f
    bg.ori r5, r5, 0xffff
    bn.and r6, r7, r5
    bg.movhi r7, 0x7f80
loc_2abaae:
    bn.slli r3, r4, 0x1f
    bn.or r3, r3, r6
    bn.or r3, r3, r7
    bt.jr r9
loc_2abab9:
    bg.beqi r7, 0x4, loc_2abb1a
    bn.beqi r7, 0x2, loc_2abb2b
    bn.beqi r5, 0x0, loc_2abb2b
    bn.lwz r3, 0x8(r3)
    bn.sfgtsi r3, -0x7f
    bn.bf loc_2abb3a
    bn.addi r7, r0, -0x7e
    bn.sub r3, r7, r3
    bt.movi r23, 0x0
    bt.movi r6, 0x0
    bn.sfgtsi r3, 0x19
    bn.bf loc_2abb0b
    bn.srl r6, r5, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bt.addi r7, -0x1
    bn.and r7, r5, r7
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bn.or r6, r6, r7
    bn.andi r7, r6, 0x7f
    bn.sfeqi r7, 0x40
    bn.bf loc_2abb72
    bn.addi r7, r6, 0x3f
    bg.movhi r6, 0x4000
    bn.sfgtu r6, r7
    bn.cmovsi_2 r23, r0, 0x1
    bn.srli r6, r7, 0x7
loc_2abb0b:
    bn.movhi_2 r7, 0x7f
    bg.ori r7, r7, 0xffff
    bn.and r6, r6, r7
    bn.slli r7, r23, 0x17
    bt.j loc_2abaae
loc_2abb1a:
    bt.movi r6, 0x0
    bg.movhi r7, 0x7f80
    bn.slli r3, r4, 0x1f
    bn.or r3, r3, r6
    bn.or r3, r3, r7
    bt.jr r9
loc_2abb2b:
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bn.slli r3, r4, 0x1f
    bn.or r3, r3, r6
    bn.or r3, r3, r7
    bt.jr r9
loc_2abb3a:
    bn.sfgtsi r3, 0x7f
    bn.bf loc_2abb1a
    bn.addi r3, r3, 0x7f
    bn.andi r7, r5, 0x7f
    bn.sfnei r7, 0x40
    bn.bnf loc_2abb67
    bn.addi r5, r5, 0x3f
loc_2abb4f:
    bn.blesi r5, -0x1, loc_2abb87
loc_2abb52:
    bn.srli r7, r5, 0x7
    bn.movhi_2 r5, 0x7f
    bg.ori r5, r5, 0xffff
    bn.and r6, r7, r5
    bn.andi r7, r3, 0xff
    bn.slli r7, r7, 0x17
    bt.j loc_2abaae
loc_2abb67:
    bn.andi r7, r5, 0x80
    bn.beqi r7, 0x0, loc_2abb4f
    bn.addi r5, r5, 0x40
    bt.j loc_2abb4f
loc_2abb72:
    bn.andi r7, r6, 0x80
    bn.bnei r7, 0x0, loc_2abb8e
    bg.movhi r7, 0x4000
    bn.sfgtu r7, r6
    bn.cmovsi_2 r23, r0, 0x1
    bn.srli r6, r6, 0x7
    bt.j loc_2abb0b
loc_2abb87:
    bn.srli r5, r5, 0x1
    bt.addi r3, 0x1
    bt.j loc_2abb52
loc_2abb8e:
    bn.addi r7, r6, 0x40
    bg.movhi r5, 0x4000
    bn.sfgtu r5, r7
    bn.cmovsi_2 r23, r0, 0x1
    bn.srli r6, r7, 0x7
    bt.j loc_2abb0b
