# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23eac4,0x23eb05); Walk stride-0xb0 records; for type 4 with a nonzero halfword at metadata base offset 0xac (base+0xa0 plus 0x0c), subtract 50 decimal from that halfword.
# Fixed original addresses; not a hardware-validated implementation.
    bg.movhi r7, 0x3b
    bg.addi r6, r7, 0x495c
    bt.j loc_23eade
loc_23eace:
    bg.addi r6, r6, 0xb0
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4d7c
    bg.beq r6, r7, loc_23eb03
loc_23eade:
    bn.lwz r7, 0x0(r6)
    bg.bnei r7, 0x4, loc_23eace
    bg.lhz r7, 0xa0(r6)
    bn.beqi r7, 0x0, loc_23eace
    bn.addi r7, r7, -0x32
    bg.sw_1 0xa0(r6), r7
    bg.addi r6, r6, 0xb0
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4d7c
    bg.bne r6, r7, loc_23eade
loc_23eb03:
    bt.jr r9
