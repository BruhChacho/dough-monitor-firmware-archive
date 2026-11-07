# DC9 enabled setup and metadata consumers

The offline model now completes enabled setup for all 13 mapped engine records
under both existing store hypotheses. Full apply advances to `0x22ac52`, before
the unrecovered call to `0x2271a9`. The recovered source now contains **137
components, 5,919 instructions / 18,325 code bytes**, plus **11 tables / 867
bytes**. Editable-code coverage is **0.755% (about 0.76%)** of the 2,426,560-byte
application. Most application bytes remain precompiled vendor input. This is a
source-coverage proxy; physical operation and the fully editable application
remain unfinished.

This work follows the owner's authorized offline reconstruction and repository
publication scope. See [scope](scope.md). Three lower-cost agents contributed
source recovery, independent validators, boundary tests and documentation.
Parent review corrected word widths, misleading source descriptions, an oracle's
padding behavior and a test that had accidentally bypassed its intended scan.
No instruction encoder or model implementation changed. No hardware, updater,
probe or flash operation was used.

## Evidence and reproduction

| Evidence | Artifact and contract |
|---|---|
| E67 | [Recovery script](../scripts/reconstruct_dc9_engine_enable.py) and [layout](reconstructed/dc9-source-layout.json): 11 new routines, 292 instructions / 893 bytes, reassembling to the original bytes. Existing source records and tables are retained. |
| E68 | [Engine-enable validation](dc9-engine-enable-validation.json): 66 strict and 212 conditional cases covering address arguments, enable writes, broadcast-store widths, direct register pairs, enabled control, selected special modes, complete selected-record setup and the full-apply prefix. |
| E69 | [Leaf validation](dc9-enable-leaf-validation.json): 71 strict cases, two conditional counter scans and one expected strict-store rejection. [Leaf tests](../scripts/test_dc9_enable_leaf.py) retain metadata writes before later faults and distinguish neighboring-byte effects. |
| E70 | [Reference-count validation](dc9-reference-count-validation.json): 74 bounded cases, including one expected instruction-budget rejection. [Reference tests](../scripts/test_dc9_reference_count.py) cover invalid mappings, inclusive scan bounds and counter wrap. |
| E71 | [Workspace summary](community-engine-enable-workspace.json) and [combined gate](extracted/firmware-validation-engine-enable-2026-10-26/validation.json): complete test/build results and preservation audit. [Enable boundary tests](../scripts/test_dc9_engine_enable.py) retain an earlier register update after a later engine read fails. |

Reproduce from the prepared local environment with a fresh destination:

```bash
.venv/bin/python scripts/reconstruct_dc9_engine_enable.py
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-engine-enable-validation
```

The generator refuses differing existing source entries. The combined gate
refuses existing output directories. Raw inputs, workspaces and built BINs
remain ignored generated files; preparation is documented in the
[build guide](../firmware/README.md). Starting source/evidence/docs were preserved
in `analysis/scratch/engine-enable-before-2026-10-26/` with a hash manifest.

## Findings

**F71 — Engine-enable masks route through real register helpers (E67/E68/E71).**
`0x22607c` receives an engine mask and enable value. For each set bit it reads
bank word+4 from engine base `0x47fa9c`, stride124, then calls the recovered
bit-update helper at logical `0x10800032 + bank` with uint32 wrap. Odd engine
indices use mask2; even indices use mask`0x20`. The enable value controls set
versus clear. The engine records themselves are not written by this routine.
An empty mask returns without engine reads. There is no local 13-engine guard;
a later unmapped selected record can fail after an earlier update is retained.

Prefix cases assert complete logical arguments before entering the masked
helper. Conditional cases use active banks and shared addresses to check ordered
read/modify/write effects. In the integrated setup fixture, zero banks hit the
existing inactive-bank guard; this distinction remains explicit.

**F72 — Reference counting has bounded scanning assumptions (E67/E70).**
`0x23ee2c` scans four channel records at `0x4821ec`, stride168. Nonzero word+4
marks a participating record. Its source metadata index is byte+`0x28`.
Equality with the requested metadata index counts immediately. Otherwise,
byte+`0x94` and both source/target metadata words+`0x80` must be nonzero.
It then searches source metadata bytes beginning at+`0x7c`.

The inclusive terminal index is3 when the source word equals4, otherwise its
low byte. Thus word4 scans four bytes; word`0x104` scans five and includes the
low byte of the word itself at+`0x80`. The oracle includes zero padding and
these overlapping fields. Invalid required metadata reads fail explicitly.
A bound255 without a match wraps the eight-bit scan index and exceeds the
finite execution budget; it is not converted into a successful no-match return.
No external reachability or vulnerability claim follows from this fixture.

**F73 — Metadata writes and counter widths remain observable (E67/E69).**
`0x23ea03` returns1 when metadata word+`0x0c` is zero, otherwise0. Its sibling
writes the supplied state to that word, then walks the halfword mask+`0x12`.
Selected engine word+8 becomes5 for state2,2 for state4, otherwise1. r23 is
clobbered even for an empty mask; r24 becomes124 only when the mask is nonzero.
Synthetic 16-record cases exercise the entire halfword mask without asserting
16 physical engines. A fault on a selected engine preserves the earlier
metadata-state write.

The two flag readers reject metadata indices>5, require nonzero halfword+`0xac`,
then return bit3 or bit5 of byte+`0x98`. The accessor at `0x23eee9` maps a
channel's source index to the **32-bit word** at metadata+`0x6c`.

The counter scan at `0x23eac4` visits six metadata records. When state word+`0x0c`
equals4 and halfword+`0xac` is nonzero, it subtracts50 decimal. For a value1,
the literal four-byte store produces `cf ff ff ff`; the halfword hypothesis
produces `cf ff` and preserves the two neighboring bytes. Default execution
rejects the ambiguous store. The same width distinction is retained for
`0x23e13b`, which stores or clears the broadcast mask at `0x455214`.

**F74 — Enabled setup returns; full apply reaches its next dependency (E68/E71).**
Normal enabled-control calls return for all13 fixture indices. Additional cases
exercise metadata flags, two-channel reference counts, and zero/nonzero state
branches. Special enabled modes9/10 with matching metadata mapping execute
the global halfword read at `0x343c14`, subtract one with uint16 wrap, and run
the direct register-pair configuration. The global's physical meaning remains
unknown.

Direct pair writes target logical `0x10902f1a` and `0x10902b1a`. In the special
mode fixture, broadcast mask`0xa` selects engine pairs0 and2; zero banks alias
both destinations. Tests assert the repeated ordered writes and eventual mask
clear. Deferred paths stop before their real unrecovered service calls; special
disable/wait paths are not completed here.

Entry `0x22dc46` with mask`0x1fff`, enabled1 returns after all13 record/range/
control iterations and the existing tail preparation. Full apply entry
`0x23fad0` then completes the four auxiliary resets and enters update-range
`0x22ac17`, stopping at **`0x22ac52` before `0x2271a9`**, with engine index0.
The full prefix uses a finite100,000-instruction budget because the expanded
path exceeds the earlier30,000 default; no service or timer response is stubbed.
Full layout apply remains incomplete.

## Validation, preservation and publication

The combined gate passed **159 tests**, all 45 archive hashes, 13 byte-exact
corpus roundtrips and 141 resource checksums. All three 2,069,060-byte builds
retain stock/helper/layout hashes `0b5d8350` / `d88a1683` / `95a06b2f`, with
11 unchanged resource spans each. The audit verified **208 run artifacts** and
**243 working input identities**. Its workspace contains 176 base artifacts
plus two USB images. All 295 saved starting files, 12 prior workspaces and
31 earlier BINs were verified and retained. E71 records the full identities.

Across
E68–E70, ten new routines have every instruction visited. Register-pair
configuration has42 of78 instructions visited; its deferred portions remain
partial. The 256 visited new instructions out of292 are bounded coverage,
not exhaustive input/state proof or independent ISA evidence.

CPU endianness, CALL links, low-byte/halfword behavior and ambiguous stores
remain explicit hypotheses. The register bus is plain memory without page
isolation, devices, timing or interrupts. Reproducible stock/helper/layout
images do not establish physical boot or an installable community release.

The repository update continues
[draft PR #1](https://github.com/BruhChacho/dough-monitor-firmware-archive/pull/1).
The prior engine-control report/run remain historical. GitHub CLI authentication
is configured, and the PR is not merged.

## Next work

| Path | Evidence → finding → next action | Remaining boundary |
|---|---|---|
| P59: enabled setup → channel update | E68/E71 → F74 → recover `0x2271a9` and update-range dependencies including `0x22ab1c` | Full apply remains partial |
| P60: direct pair → deferred service | E68 → F74 → recover `0x23e49c`, `0x23e4a0`, `0x23e58a`, then `0x27b707` | Queued operations are not completed |
| P61: metadata counters → ISA evidence | E69 → F73 → establish independent counter-store/neighbor semantics | Both width hypotheses remain conditional |

Other open paths include geometry `0x2686dd`, special handlers `0x20ece9` /
`0x20e990`, most application source, a complete compiler/linker, separate EFE
and USB source builds, and physical recovery/display validation.
