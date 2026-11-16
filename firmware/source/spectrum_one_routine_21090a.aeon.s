# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21090a,0x21097f); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r4
    bt.mov r11, r5
    bg.jal 0x2100d2
    bt.mov r12, r3
    bn.beqi r10, 0x0, loc_210937
    bt.movi r6, 0x0
loc_210927:
    bn.add r7, r11, r6
    bn.sbz 0x0(r7), r0
    bn.addi r7, r6, 0x1
    bn.extbz r6, r7
    bg.bne r10, r6, loc_210927
loc_210937:
    bt.mov r3, r12
    bt.mov r4, r10
    bt.mov r5, r11
    bg.jal 0x2129c3
    bn.ori r7, r0, 0x74
    bn.muls r3, r12, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x7e8
    bt.add r3, r5
    bn.lh r6, 0x66(r3)
    bg.ori r5, r0, 0x200
    bn.and r7, r6, r5
    bt.movi r5, 0x0
    bn.beqi r7, 0x0, loc_21096c
    bg.addi r5, r0, -0x201
    bn.and r7, r6, r5
    bn.sh_2 0x66(r3), r7
    bt.movi r5, 0x1
loc_21096c:
    bt.mov r3, r5
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
