# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ad216,0x2ad2a1); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x18(r1), r3
    bn.sw 0x1c(r1), r4
    bn.addi r3, r1, 0x18
    bt.mov r4, r1
    bg.jal 0x2ac756
    bn.lwz r7, 0x0(r1)
    bn.beqi r7, 0x2, loc_2ad24e
    bn.bleui r7, 0x1, loc_2ad24e
    bg.bnei r7, 0x4, loc_2ad258
loc_2ad238:
    bn.lwz r7, 0x4(r1)
    bn.bnei r7, 0x0, loc_2ad29b
    bg.movhi r7, 0x7fff
    bg.ori r3, r7, 0xffff
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
loc_2ad24e:
    bt.movi r3, 0x0
loc_2ad250:
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
loc_2ad258:
    bn.lwz r7, 0x8(r1)
    bn.blesi r7, -0x1, loc_2ad24e
    bn.sflesi r7, 0x1e
    bn.bnf loc_2ad238
    bn.ori r5, r0, 0x3c
    bn.sub r5, r5, r7
    bn.addi r24, r5, -0x20
    bn.lwz r23, 0x14(r1)
    bn.srl r25, r23, r24
    bn.slli r4, r23, 0x1
    bn.ori r7, r0, 0x1f
    bn.sub r7, r7, r5
    bn.sll r4, r4, r7
    bn.sfgtsi r24, -0x1
    bn.lwz r6, 0x10(r1)
    bn.srl r7, r6, r5
    bn.or r7, r4, r7
    bn.cmov_0 r7, r25, r7
    bt.mov r3, r7
    bn.lwz r7, 0x4(r1)
    bn.beqi r7, 0x0, loc_2ad250
    bn.sub r3, r0, r3
    bt.j loc_2ad250
loc_2ad29b:
    bg.movhi r3, 0x8000
    bt.j loc_2ad250
