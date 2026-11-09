# DC9 encoder-bulk source checkpoint

The 2026-11-08 encoder-bulk batch adds **31 routines, 3,545 instructions /
10,639 code bytes** to the previous 271-routine overlay. The resulting source
layout contains **302 routines, 19,084 instructions / 57,977 code bytes**, plus
**14 tables / 1,203 bytes**. This is **2.3893% (about 2.39%)** code-byte
coverage of the 2,426,560-byte expanded application. Coverage is a code-byte
proxy, not a measure of product readiness.

The batch adds encoder support and operand parsing for nine forms: `bn.sfeq`,
`bn.sfne`, `bn.exths`, `bn.jal`, `bg.bles`, `bg.bgtsi`, `bn.addc`,
`bg.syncwritebuffer`, and `bg.addci_maybe`. A generic operandless-instruction
parser adjustment allows the complete source model to construct. This work adds
no execution semantics: all nine forms remain rejected during execution. The
source model records them without treating an encoding as validated CPU
behavior.

The batch manifest is
[`dc9-encoder-bulk-source-batch.json`](reconstructed/dc9-encoder-bulk-source-batch.json).
It contains 31 accepted CFG candidates totaling 10,639 bytes and 3,545
instructions; 247 candidates were rejected. Candidate addresses and source
hashes are recorded there. The prior 271 routine records and all 14 table
records were preserved. The immutable pre-batch snapshot is
`analysis/scratch/encoder-bulk-before-2026-11-08/`; its manifest SHA256 is
`9388f2f6c16012575747e23e81ba851d0c51f84d0270ddaab529ab9d2e4f6048`. The batch
inventory SHA256 is `71cbddf44c0a06da45a124b1dfb191d7b403a70fc0db66b141af65b05e3ee13c`.

Independent full-CFG and byte-exact assembly review passed for three large
rooted candidates: `0x22cae2` (entry from `0x233549`), `0x2ab6d2` (called at
`0x22d1ed` and `0x22d31b` from `0x22cae2`), and `0x2acae4` (called at
`0x2aae82` from `0x2aae3d`, itself rooted by six older calls). Review found no
hidden known entry points. The evidence is in
`analysis/scratch/dc9-next-bulk-entry-audit-2026-11-08.json`. The lane-store
execution fixture still stops before the `0x2aae3d` call site; recovered source
alone does not establish execution behavior. Tail candidates remain excluded
pending separate audit.

## Reproduction and gate status

```sh
.venv/bin/python scripts/reconstruct_dc9_bulk_source.py --inventory analysis/reconstructed/dc9-encoder-bulk-source-batch.json
```

This command performs the reconstruction check without `--apply`. The combined
offline gate passed on 2026-11-08 UTC: 40 stages and 235 tests, with zero
failures, errors, or skips. It verified 392 run-artifact hashes and 455 source
identities; the workspace contains 341 artifacts plus two USB images.
Preservation verified the 547-file pre-batch snapshot, 22 prior workspaces and
61 BIN files; three reference BIN hashes were unchanged. See the
[workspace summary](community-encoder-bulk-workspace.json) and
[validation run](extracted/firmware-validation-encoder-bulk-2026-11-08/).
Earlier gates remain historical. No hardware behavior is established.

A conditional-tail allowance experiment found no new candidates. Future source
work can examine joint tail closure, unresolved indirect entries and opaque
opcodes; no easy coverage gain is assumed. Three whitespace-only lines in the
validated generated source for routine `0x27099e` are retained with their proven
hashes. The build passed; regenerate that source with formatter cleanup under a
fresh manifest in the next batch.
