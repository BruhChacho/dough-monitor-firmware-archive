# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2420bb,0x242105); Optionally call pointer at 0x4824ac before arming the shared delay counter and waiting.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.beqi r3, 0x0, loc_2420ec
    bg.movhi r7, 0x45
    bg.lbz r7, 0x51e1(r7)
    bn.bnei r7, 0x0, loc_2420f6
loc_2420d3:
    bg.movhi r7, 0x45
    bg.sw_1 0x5204(r7), r10
    bg.movhi r6, 0x45
    bt.movi r7, 0x1
    bg.sbz 0x5206(r6), r7
loc_2420e5:
    bg.lbz r7, 0x5206(r6)
    bn.bnei r7, 0x0, loc_2420e5
loc_2420ec:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_2420f6:
    bg.movhi r7, 0x48
    bg.lwz r7, 0x24ac(r7)
    bn.beqi r7, 0x0, loc_2420d3
    bt.jalr r7
    bt.j loc_2420d3
