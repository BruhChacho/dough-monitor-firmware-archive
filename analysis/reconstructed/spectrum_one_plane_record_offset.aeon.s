# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x204168,0x20417e); Return low 16 bits of index * 970 plus uint16 at 0x340000.
# Fixed addresses; CALL execution remains an explicit model hypothesis.
    bg.ori r7, r0, 0x3ca
    bn.muls r3, r3, r7
    bg.movhi r7, 0x34
    bg.lhz r7, 0x0(r7)
    bt.add r3, r7
    bn.exthz r3, r3
    bt.jr r9
