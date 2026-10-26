# Community firmware workspace and DC9 register source

Continuation: the [receive-source report](2026-10-23_reverse-dc9-receive-report.md)
records the later 35-component build. This report and `community-workspace.json`
describe the preserved 20-component workspace; exact then-current source/tool/
model versions are saved in `analysis/scratch/receive-before-2026-10-23/`.
Current canonical source-build and model JSON has advanced to the newer layout.

Date: 2026-10-23. Scope: authorized offline source reconstruction and raw-file
preparation. Start developing with the [build guide](../firmware/README.md).

## Result

A prepared workspace now exposes complete DC9/EFE images, every encoded DC9
container component, expanded application/resources, editable reconstructed
assembly, and the separate Spectrum One USB hub/VL103R images. Its baseline
build reproduces the original DC9 BIN byte for byte. An explicit source-edit
build reproduces the already audited helper experiment.

Seven newly reconstructed routines add 879 code bytes. The source layout now
contains 20 routines/fragments, 572 instructions / 1,750 code bytes, and four
tables / 531 bytes. Recovered code represents approximately 0.072% of the
2,426,560-byte expanded program. This is a usable partial source build with a
large preserved vendor remainder. Original complete source, a general AEON
compiler/SDK, peripheral models and hardware validation are still missing.

## Evidence and findings

| Evidence | Artifact | Finding supported |
|---|---|---|
| E30 | [Workspace evidence](community-workspace.json), generated workspace manifests and build sidecars | Raw input identities, independent workspace builds and preservation checks |
| E31 | [Source layout](reconstructed/dc9-source-layout.json), [baseline](dc9-source-baseline.json), [experiment](dc9-source-experiment.json) | All 20 source components assemble to the original bytes; explicit helper substitution remains isolated |
| E32 | [Register validation](dc9-register-validation.json), [validator](../scripts/validate_dc9_registers.py) | 266 cases for six new routines using plain mapped bytes; 218 instructions visited |
| E33 | `excluded_masked_update.store_observations` in E32 | Two `bg.sw_1` instructions translate to four-byte stores in pinned SLEIGH; surrounding code reads a halfword counter |

F30 — The workspace contains the raw inputs needed to reproduce the existing
DC9 image and begin replacing selected routines with source. It does not recover
the original source tree merely by unpacking the firmware. The exports are
code/data, resource payloads and container parts; no Linux root filesystem is
established by this work.

F31 — Builds no longer need the archive extraction paths after workspace
preparation. They reconstruct the pinned input from the workspace's components,
then assemble its editable source. Tests disable archive loading during a
workspace build. Raw exports are immutable references; the tool rejects their
modification instead of silently omitting changes from the build. Edited source
requires experimental mode. Paths, lengths, overlap, original hashes and
allocation limits remain checked.

F32 — Register byte access uses the candidate base pointer at `0x453cf0`,
initialized to `0xa0000000` in the earlier static trace. Plain-memory contracts
exercise address arithmetic, page-selection write ordering, read/write value
width, two-bit broadcast-mask groups, wrapper access ordering, stack balance
and preservation of registers r10–r14. These tests do not simulate a device's
page window, transport, lock behavior or concurrent accesses.

F33 — Masked-update source is recovered byte for byte, but its execution is
excluded because store width is unresolved. Pinned SLEIGH emits a four-byte
store for `eceb51a9` at `0x23ded2` and `ecab51a9` at `0x23df3a`; both address
`0x4551a8` through r11. The routine reads this counter with halfword loads.
Neither pattern alone establishes the real store width. The instruction model
rejects `bg.sw_1`, and a regression verifies that rejection leaves the counter
and neighboring bytes untouched.

## Recovered register module

| Routine | Candidate address | Bytes | Behavior inferred from code |
|---|---|---:|---|
| `register_read8` | `0x23dd44` | 117 | Optional page selection followed by a byte read; zero for rejected address group |
| `register_write8` | `0x23ddb9` | 244 | Direct/paged byte write; optional descriptor-based broadcast |
| `register_update_bits` | `0x23dead` | 216 | Bit set/clear around polling and a nesting-counter pattern; execution excluded |
| `register_read16` | `0x23df85` | 49 | High-byte read, low-byte read, then combine |
| `register_write16` | `0x23dfb6` | 43 | Low-byte write followed by high-byte tail call |
| `slot_buffer_offset` | `0x20c7a8` | 101 | Two offset sets for slots 0, 1, 2, 3, 7; otherwise `0xb900` |
| `slot_ring_position` | `0x20c73b` | 109 | Halfword position from one of five mapped offsets; otherwise zero |

For logical byte address `L`, the observed mapping is
`base + 2*(L & 0x7fffff) - (L & 1)`. Access is skipped when
`(L & 0x7fff00) == 0`. When bit 23 is set, the direct path writes the high byte
of `L` to `base + 2*(L & 0x7fff00)` first. The page-selection and data addresses
can alias; tests include that case.

The broadcast path uses the halfword at `0x455214` as eight two-bit groups.
Any nonzero group selects a descriptor at `0x47fa9c + (2*i)*124 + 4` in the
tested path. Physical meanings of descriptors and channels remain unknown.

The masked-update routine writes 1 to candidate `base + 0x203034` and polls
for 1 with a finite retry count. Both success and exhausted retries lead into
the read/modify/write sequence. A later conditional write of zero depends on
the counter and another read of this byte. This is a static code observation,
not proof of an atomic hardware lock or timeout correctness.

## Outputs and validation

The generated workspace is `analysis/extracted/community-workspace/`. Its base
manifest covers 57 artifacts; the separate USB manifest adds two raw images.
No source differences were present during final verification. The USB images
come from the pinned v19 installer extracted in earlier work; no executable
was run. Package metadata includes DC9 among the published model associations,
but the owner's exact device compatibility is not established here.

| Output | SHA256 |
|---|---|
| DC9 complete baseline | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` |
| DC9 helper experiment | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` |
| EFE raw v1.0.19 | `e3eeedada1464cfb65b927ed2877ebbeffff0d59ba2d793f0c18ddf7cb8ebd40` |
| VL822 raw hub | `ec6699214c621671449ec941ab4ccd8c413cb79b6e369d99a654c12beb3a3356` |
| VL103R raw image | `62879652a96b8098cb240c4a4290828304afc6709b3948066ccb0d1de49e0fe1` |

Both DC9 outputs are 2,069,060 bytes, pass normalized main CRC16 and both CRC32
checks, and preserve all eleven resource ranges byte for byte. The helper
experiment changes 29 program bytes within the existing 39-byte helper.
Canonical repository-source builds under `analysis/extracted/rebuild/` produce
the same hashes as workspace builds. No earlier BIN was overwritten.

The register validator passes 60 read8, 100 write8, 36 broadcast-write8,
15 read16, 15 write16, 30 slot-offset and ten slot-position cases. All 218
instructions in the six newly executable routines were visited. The 72
instructions in masked-update source remain excluded from execution.

The command-path validator was rerun against the expanded model: 5,084 command
cases, 81 parent cases, 196 other router cases, 294 setter cases, four copy
cases, 36 offset cases and 218 helper-rewrite comparisons still pass. That
validator visits 273 instructions; its larger 572-instruction denominator now
includes the register routines validated separately. CALL fallthrough and
aliased-load semantics remain explicit hypotheses rather than an independently
verified physical ABI.

The complete test suite passes **63 tests**. New tests cover workspace-local
build inputs, source-edit gating, immutable raw/component tampering, path
confinement, refusal to overwrite, pinned USB exports, encoding truncation and
the unresolved-store rejection. This suite and the instruction models establish
offline tooling properties, not monitor operation.

Reproduce with the build guide and these checks:

```bash
.venv/bin/python scripts/firmware_workspace.py verify analysis/extracted/community-workspace
.venv/bin/python scripts/validate_dc9_registers.py
.venv/bin/python scripts/validate_dc9_module.py
.venv/bin/python -m unittest discover -s scripts -p 'test_*.py'
git diff --check
```

## Preservation and next steps

Git remains on `main` at `50dbabfe6a8d8c9d1616616235ce570538270fde`; the local
`origin/main` reference matches. No remote fetch was needed for this offline
step. All 58 pre-existing changed/untracked files were snapshotted under
`analysis/scratch/community-workspace-before-2026-10-22/`; their saved hashes
verify and every original working path remains present. All 45 original ZIP
files still match the archive manifest. Existing work remains uncommitted.
Current build/model JSON supersedes older revisions preserved in that snapshot.

P30 — Continue source recovery through receive-state routine `0x20d33c`, status
helper `0x20c9fa` and indirect-byte helper `0x20e47e`. Use the recovered register
primitives to trace their interactions, keeping polling/peripheral assumptions
explicit. Establish ring capacity, state transitions and command-specific
length bounds before changing command handling.

P31 — Resolve `bg.sw_1` width and the existing CALL/aliased-load decoder gaps
using independent ISA evidence or additional constrained code patterns. Do not
silently promote the current model into a hardware emulator. A general target
compiler/linker and relocation strategy are needed for larger source modules.

P32 — Advance EFE loader/integrity coverage and USB source recovery as separate
targets. The raw files are available now, but neither has a validated source
rebuild. Display initialization, HDR/VRR, input switching, sleep/wake and USB-C
behavior remain largely unreconstructed. No monitor has been accessed or flashed.
