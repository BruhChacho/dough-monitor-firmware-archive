# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252c92,0x252cd9); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.mov r6, r3
    bn.ori r3, r0, 0xff
    bg.movhi r7, 0x45
    bg.lbz r7, 0x7492(r7)
    bn.beqi r7, 0x0, loc_252caf
    bn.beqi r6, 0x0, loc_252cb6
    bt.movi r3, 0x0
    bn.beqi r6, 0x1, loc_252cca
loc_252caf:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252cb6:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bg.jal 0x248963
    bn.exthz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252cca:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bg.jal 0x24a06f
    bn.exthz r3, r3
    bt.j loc_252caf
