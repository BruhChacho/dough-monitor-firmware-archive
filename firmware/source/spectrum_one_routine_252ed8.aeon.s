# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252ed8,0x252efc); byte-exact only; hardware untested.
    bn.beqi r3, 0x0, loc_252ee0
    bn.beqi r3, 0x1, loc_252eee
    bt.jr r9
loc_252ee0:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bt.mov r5, r6
    bt.mov r6, r7
    bg.j 0x248867
loc_252eee:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bt.mov r5, r6
    bt.mov r6, r7
    bg.j 0x249f73
