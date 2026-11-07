# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x204144,0x204168); Write low byte of r5 only when unsigned plane r3 <= 2 and offset r4 <= 319.
# Fixed addresses; CALL execution remains an explicit model hypothesis.
    bn.bgtui r3, 0x2, return
    bg.sfgti r4, 0x13f
    bn.bnf write_byte
return:
    bt.jr r9
write_byte:
    bg.ori r7, r0, 0x140
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1eac
    bt.add r7, r6
    bt.add r7, r4
    bn.sbz 0x8(r7), r5
    bt.jr r9
