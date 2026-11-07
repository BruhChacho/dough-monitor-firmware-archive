# Experimental rewrite of the recovered table-membership routine.
# Same entry address, table, argument/result, and register effects.
# This rearranges the loop; it does not change a monitor feature.
# Firmware-derived reconstruction; excluded from the repository MIT grant.
bg.movhi r7, 0x2b
bg.addi r7, r7, -0x1284
test_byte:
bn.lbz r6, 0(r7)
bg.beq r3, r6, found
bt.addi r7, 1
bg.movhi r6, 0x2b
bg.addi r6, r6, -0x125b
bg.bne r7, r6, test_byte
bt.movi r3, 0
bt.jr r9
found:
bt.movi r3, 1
bt.jr r9
# Unreachable padding keeps the original 39-byte footprint.
bt.jr r9
