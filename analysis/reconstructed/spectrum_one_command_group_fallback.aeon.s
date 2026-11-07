# Membership in the final command group (12 entries).
# Reconstructed from pinned ES07DC9 v101; not original vendor source.
# Firmware-derived code is excluded from the repository MIT grant.
# Candidate VA 0x23520b; absolute targets retain the original layout.
bg.movhi r7, 0x2b
bg.addi r7, r7, -0x8e4
bn.lbz r6,0x0(r7)
bg.beq r3,r6,0x23522c
bt.addi r7, 0x1
bg.movhi r6, 0x2b
bg.addi r6, r6, -0x8d8
bg.bne r7,r6,0x235213
bt.movi r3, 0x0
bt.jr r9
bt.movi r3, 0x1
bt.jr r9
