# Membership in the first-priority command group (42 table entries).
# Reconstructed from pinned ES07DC9 v101; not original vendor source.
# Firmware-derived code is excluded from the repository MIT grant.
# Candidate VA 0x26e0a4; absolute targets retain the original layout.
bg.movhi r7, 0x33
bg.addi r7, r7, -0x79f0
bt.j 0x26e0bc
bt.addi r7, 0x1
bg.movhi r6, 0x33
bg.addi r6, r6, -0x79c6
bg.beq r7,r6,0x26e0c7
bn.lbz r6,0x0(r7)
bg.bne r3,r6,0x26e0ae
bt.movi r3, 0x1
bt.jr r9
bt.movi r3, 0x0
bt.jr r9
