# DC9 bulk-source recovery checkpoint

This checkpoint collects **85 general CFG candidates** and four conversion
leaves. The candidates add **89 routines, 5,201 instructions / 15,641 code
bytes** integrated with the existing 182-routine overlay. The resulting
source totals are **271 routines, 15,539 instructions / 47,338 code bytes**,
plus the existing **14 tables / 1,203 bytes**. That is **1.9508% (about 1.95%)**
code-byte coverage of the 2,426,560-byte expanded application. Coverage measures
editable code bytes, not product readiness.

The discovery inventory found 86 candidates (5,085 instructions / 15,302 bytes).
It reserves `0x2aba8f..0x2abba0` (273 bytes / 94 instructions) for the conversion
leaf batch, leaving 85 general candidates (4,991 instructions / 15,029 bytes).
The four conversion leaves add 210 instructions / 612 bytes. Existing routine
and table records are the baseline; the discovery script does not change the
layout. Candidate identities and original-byte / assembly hashes are recorded in
the [bulk-source manifest](reconstructed/dc9-bulk-source-batch.json).

## Qualification and review

Candidates begin at observed direct-call targets. The inventory requires a
contiguous reachable CFG, supported instruction encodings, proven return or
tail exits, no overlap with existing routines or tables, and byte-exact assembly
against the pinned image. It emits instructions only; it does not count raw
bytes or `.byte` blocks as recovered code. Calls, tails and provenance call PCs
are recorded per candidate. Rejected indirect paths and conditional exits remain
unclaimed; recovered names describe addresses and do not establish source-level
semantics.

An independent review reassembled the ten largest spans against the pinned
image and walked their CFGs: all **2,929 instructions** were reachable and
contiguous, with no accepted-span or existing-layout overlaps and no hidden
call entries. The largest span, `0x22bb7d..0x22cae2`, is 3,941 bytes / 1,239
instructions, reached by direct call at `0x233555`; it has one return and two
proven tail exits. Its size alone is not evidence of merged functions.

The conversion leaves cover a binary64-to-binary32 path in **115 bounded cases**
(96 finite random inputs and 19 edge / rounding inputs). Calls use the explicit
fallthrough-link model. NaN payload behavior is not proven, and this sample is
not exhaustive. The conversion caller `0x2aae3d` and its dependency cluster
remain incomplete, so the active lane-store path still stops before conversion.

The starting snapshot at
`analysis/scratch/bulk-source-before-2026-11-06/` preserves **450 files** from
`f4761dc`; its manifest SHA256 is
`e5cbbea412982bbef2be614f2529d49a964207db430324954e7e434dd3a0ef4f`.

## Reproduction and limits

```sh
.venv/bin/python scripts/reconstruct_dc9_bulk_source.py
.venv/bin/python scripts/reconstruct_dc9_conversion_leaves.py
.venv/bin/python scripts/validate_dc9_conversion_leaves.py
```

The bulk-source reconstruction script defaults to dry-run and validates the
installed batch without writing tracked files. The conversion-leaf generator and
validator also complete without writing tracked files. Discovery on the current
layout produces the next candidate batch, not this historical batch. The combined
offline gate passed on 2026-11-08 UTC: all
40 stages and 231 tests passed with zero failures, errors or skips. It verified
361 run-artifact hashes and 423 source identities, including 310 workspace
artifacts plus two USB images. Preservation checked 450 snapshot files, 21
prior workspaces and 58 BIN files. See the [workspace summary](community-bulk-source-workspace.json)
for canonical gate evidence. The inventory is static source evidence; it does not
validate device behavior. A later independent call entry inside an accepted
span makes discovery fail closed for review rather than inferring a merge.
More application code and carry / borrow semantics remain to be recovered.
