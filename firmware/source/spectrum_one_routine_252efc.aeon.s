# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252efc,0x252f44); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.mov r7, r3
    bn.beqi r3, 0x0, loc_252f12
    bt.movi r3, 0x0
    bn.beqi r7, 0x1, loc_252f2b
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252f12:
    bg.movhi r7, 0x45
    bg.lhz r3, 0x765c(r7)
    bn.extbz r4, r4
    bg.jal 0x248839
    bn.extbz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252f2b:
    bg.movhi r7, 0x45
    bg.lhz r3, 0x765e(r7)
    bn.extbz r4, r4
    bg.jal 0x249f45
    bn.extbz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
