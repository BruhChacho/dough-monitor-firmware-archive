# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252d93,0x252dcb); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.mov r7, r3
    bn.beqi r3, 0x0, loc_252da9
    bt.movi r3, 0x0
    bn.beqi r7, 0x1, loc_252dba
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252da9:
    bn.extbz r3, r4
    bg.jal 0x248954
    bn.exthz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252dba:
    bn.extbz r3, r4
    bg.jal 0x24a060
    bn.exthz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
