# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2acf9e,0x2ad047); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bt.mov r6, r3
    bt.movi r7, 0x3
    bn.sw 0x0(r1), r7
    bn.sw 0x4(r1), r0
    bg.blesi r3, -0x1, loc_2ad040
loc_2acfb2:
    bn.bnei r6, 0x0, loc_2acfc8
    bt.movi r7, 0x2
    bn.sw 0x0(r1), r7
loc_2acfba:
    bt.mov r3, r1
    bg.jal 0x2ac55d
loc_2acfc0:
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_2acfc8:
    bn.ori r23, r0, 0x3c
    bn.sw 0x8(r1), r23
    bn.lwz r7, 0x4(r1)
    bn.beqi r7, 0x0, loc_2ad035
    bt.movi r3, 0x0
    bg.movhi r4, 0xc1e0
    bg.movhi r7, 0x8000
    bn.sfne r6, r7
    bn.bnf loc_2acfc0
    bn.sub r7, r0, r6
    bn.sw 0x10(r1), r7
    bn.srai r7, r7, 0x1f
    bn.sw 0x14(r1), r7
loc_2acff0:
    bn.lwz r4, 0x10(r1)
    bn.lwz r5, 0x14(r1)
    bn.movhi_2 r7, 0xfff
    bg.ori r7, r7, 0xffff
    bn.sfgtu r5, r7
    bn.bf loc_2acfba
    bn.lwz r23, 0x8(r1)
loc_2ad006:
    bn.srli r6, r4, 0x1f
    bn.slli r7, r5, 0x1
    bn.or r7, r7, r6
    bn.sw 0x14(r1), r7
    bn.slli r7, r4, 0x1
    bn.sw 0x10(r1), r7
    bn.addi r7, r23, -0x1
    bt.mov r23, r7
    bn.sw 0x8(r1), r7
    bn.lwz r4, 0x10(r1)
    bn.lwz r5, 0x14(r1)
    bn.movhi_2 r7, 0xfff
    bg.ori r7, r7, 0xffff
    bn.sfgtu r5, r7
    bn.bnf loc_2ad006
    bt.j loc_2acfba
loc_2ad035:
    bn.sw 0x10(r1), r6
    bn.srai r7, r6, 0x1f
    bn.sw 0x14(r1), r7
    bt.j loc_2acff0
loc_2ad040:
    bt.movi r7, 0x1
    bn.sw 0x4(r1), r7
    bt.j loc_2acfb2
