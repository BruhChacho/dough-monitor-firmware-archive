# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21fb2b,0x21fb61); Return 0x78 except when the engine mode byte is 5; then calculate a scaled value.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.ori r3, r0, 0x78
    bg.movhi r7, 0x48
    bg.lbz r7, -0x4db(r7)
    bg.beqi r7, 0x5, loc_21fb46
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_21fb46:
    bt.movi r3, 0x1
    bg.jal 0x2227ef
    bg.jal 0x21fac9
    bt.addi r3, 0x5
    bt.movi r7, 0xa
    bn.divs r3, r3, r7
    bn.extbz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
