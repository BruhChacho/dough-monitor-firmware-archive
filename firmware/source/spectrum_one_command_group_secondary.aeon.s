# Membership in the second-priority command group (41 entries).
# Reconstructed from pinned ES07DC9 v101; not original vendor source.
# Firmware-derived code is excluded from the repository MIT grant.
# Candidate VA 0x204059; absolute targets retain the original layout.
bg.movhi r7, 0x2b
bg.addi r7, r7, -0x1284
bt.j 0x204071
bt.addi r7, 0x1
bg.movhi r6, 0x2b
bg.addi r6, r6, -0x125b
bg.beq r7,r6,0x20407c
bn.lbz r6,0x0(r7)
bg.bne r3,r6,0x204063
bt.movi r3, 0x1
bt.jr r9
bt.movi r3, 0x0
bt.jr r9
