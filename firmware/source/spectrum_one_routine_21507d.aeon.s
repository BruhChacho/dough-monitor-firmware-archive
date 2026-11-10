# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21507d,0x2150f8); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bg.ori r7, r0, 0x900
    bn.muls r10, r3, r7
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x441
    bn.add r3, r10, r7
    bg.jal 0x23dd44
    bn.andi r11, r3, 0x7
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x32e
    bn.add r3, r10, r7
    bg.jal 0x23df85
    bn.beqi r11, 0x1, loc_2150db
    bn.beqi r11, 0x2, loc_2150ee
loc_2150b2:
    bt.movi r6, 0x4
    bn.xor r6, r11, r6
    bn.ff1 r6, r6
    bt.addi r6, -0x1
    bg.ori r7, r0, 0x7777
    bn.xor r7, r3, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.and r7, r7, r6
    bn.srli r3, r7, 0x1f
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_2150db:
    bg.bnei r3, 0x7, loc_2150b2
    bt.movi r3, 0x1
loc_2150e1:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_2150ee:
    bn.sfeqi r3, 0x77
    bn.bnf loc_2150b2
    bt.movi r3, 0x1
    bt.j loc_2150e1
