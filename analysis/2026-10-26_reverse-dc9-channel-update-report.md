# DC9 channel update and engine allocation source

Updated 2026-10-26 (America/Los_Angeles). This continuation recovers nine
byte-exact routines, totaling 413 instructions and 1,214 bytes. The editable
DC9 overlay now contains **146 components, 6,332 instructions / 19,539 code
bytes**, plus 11 tables / 867 bytes: **0.805% (about 0.81%)** of the 2,426,560-byte
expanded application. This ratio includes a data-bearing denominator and is
not a product-readiness estimate. The application remains mostly pinned vendor
code; a fully editable firmware and physical operation remain unfinished.

Scope follows [the owner authorization](scope.md). Work used local archived
inputs and ordinary byte-memory models; no vendor executable, device probe or
flashing operation ran. The existing draft PR is updated after validation.
Starting tracked files are preserved in
`scratch/channel-update-before-2026-10-26/`. Prior workspaces and builds remain
intact. This report uses the ordinary reverse-engineering template, with no
malware or vulnerability classification.

## Source and instruction evidence

The recovery script is [reconstruct_dc9_channel_update.py](../scripts/reconstruct_dc9_channel_update.py).
Every instruction decodes using the existing pinned pypcode/SLEIGH toolchain
and reassembles exactly to archived bytes. All original 137 routine records
and eleven tables remain unchanged. Byte equality establishes reproducibility,
not physical ISA correctness or complete execution coverage.

| Candidate address span (end exclusive) | Recovered behavior |
|---|---|
| `2271a9..2272cf` | Channel metadata reference update orchestration |
| `227145..2271a9` | Allocate an engine, publish channel mask and engine ownership, then delegate |
| `222843..222898` | Publish channel overlap flags |
| `222ace..222af1` | Select available engine from pair 0/1 or return sentinel 4 |
| `222af1..222b15` | Select available engine from pair 2/3 or return sentinel 4 |
| `2229f8..222aa2` | Assign channel rectangle fields to an engine |
| `222b65..222b8a` | Scan engine indices 5–12 for zero state; return 13 if exhausted |
| `22aa4e..22ab1c` | Assign non-crossing channel ranges |
| `22ab1c..22ac17` | Assign crossing channel ranges and update overlap flags |

Three newly supported comparison forms use the pinned SLEIGH definitions:
`bg.sflesi` and `bg.sfgtsi` compare signed values against signed 16-bit
immediates; `bg.sfleui` compares unsigned values against an unsigned 16-bit
immediate. Existing `bg.sfgti` remains unsigned. Focused tests check archived
bytes, selector encodings, immediate limits, and signed/unsigned comparisons.
No CALL, endianness or ambiguous-store assumption was changed.

## Recovered contracts and limits

Channel records start at `0x4821ec`, stride 168. Metadata records start at
`0x3b4950`, stride 176. Engine records start at `0x47fa9c`, stride 124.
Names describe observed software behavior, not physical connector assignments.

`2271a9` reads the channel's source index at byte `+28`, then source metadata
word `+80`, before reading channel flag `+94`. Either zero value bypasses the
update and returns 1. Otherwise it processes metadata reference bytes `+7c`
and `+7d`; word `+80 > 1` enables `+7e`, and word `+80 > 2` enables `+7f`.
References equal to the source index are skipped. Calls to `227145` combine
success values and stop processing after failure. The first result is masked
to one bit; later results are ANDed. This word is not treated as an arbitrary
unbounded reference-list length here.

`222b65` scans engine state words `+8` at indices 5 through 12; it performs no
allocation write. `227145` returns 0 for sentinel 13, otherwise ORs the selected
bit into channel halfword `+2c`, stores the channel index in engine byte `+10`,
stores 1 in engine word `+8`, and calls unrecovered `22701c` with the requested
metadata index and selected engine. Prefix tests preserve these earlier writes;
they do not substitute success for the missing service.

The pair selectors read engine state words `+8`. For pair 0/1, engine 1 state
zero selects 1; otherwise engine 0 state zero or 7 selects 0, otherwise sentinel
4. Pair 2/3 follows the same rule, selecting 3, 2, or 4. These routines do not
modify memory.

`222843` reads unsigned halfwords `+18` and `+1c`. It clears channel bytes
`+35/+36` unless `x <= 1919` and `x + extent > 1920`. On overlap it writes 1 to
`+35`; if `x + (extent >> 1) == 1920`, the pinned instruction
`bn.cmov_1 r7,r1,r0` causes byte `+36` to receive **the low byte of r1**, otherwise
zero. This surprising stack-pointer dependence is preserved, including a
nonzero low-byte fixture; it is not silently rewritten as boolean 1. Physical
semantics of this instruction remain unverified.

`2229f8` ORs the engine bit into channel halfword `+2a`, writes engine owner
byte `+10` and state word `+8`, copies the two **32-bit** channel words `+18/+1c`
to engine `+4c/+50`, and copies byte `+29` to engine `+0e`. It then clips low
halfwords relative to the observed boundary 1920: right-side x subtracts 1920;
a crossing engine with bit 1 set gets x=0 and the right extent; other crossing
engines retain x and receive the left extent. Copied upper halfwords must remain
intact during clipping. Physical geometry interpretation remains inferred.

`22ab1c` handles active channel byte `+0 == 1` with crossing geometry and calls
both pair selectors before checking their sentinel results. `22aa4e` handles
left-only or right-only geometry using one pair selector. Both loops use an
8-bit increment and inclusive bounds; caller bounds are not silently clamped.
Assignment mask bits can skip `22701c`, allowing complete bounded return cases;
other cases retain the exact unresolved call arguments and preceding writes.

## Integrated apply boundary

The existing wrapper `22ac17` now returns for a single inactive channel or its
selector-4 range of all four channels. It clears byte `+5b`, invokes each real
metadata update and both real range helpers, and returns their combined result.
The full apply entry `23fad0` completes six metadata resets, thirteen enabled
engine setups, four auxiliary resets, and all four channel updates.

The earlier fixture now correctly faults at the wait routine's unmapped
configuration pointer `0x3b5f38`. The expanded fixture explicitly maps that
pointer to synthetic configuration memory at `0x600000`. Either configuration
bit `+4c & 0x20` or inactive byte `0x4551e8 == 0` permits the existing wait
routine to return. An active non-bypass fixture still faults at unmapped
countdown `0x455208`; no timer completion is invented.

With either bypass input under both existing store policies, full apply reaches
**`0x20401d`, before the call to unrecovered `0x21ffb3`**, in the first engine
preparation call `204000`. The prefix has completed fourteen calls to `220a8b`
(thirteen setup calls plus engine 0), thirteen to `22d986`, and one wait return.
Full apply has **not** returned. There is no claim of display, boot or recovery
operation from these bounded runs.

## Completed offline gate

The combined run at
[firmware-validation-channel-update-2026-10-26](extracted/firmware-validation-channel-update-2026-10-26/validation.json)
passed **171 tests**, with no errors, failures or skips; all 45 archive identities,
13 byte-exact corpus reconstructions and 141 resource checksums passed.
New validators report **475 channel cases** (including two expected budget
rejections), **21 leaf cases** plus a mapping fault, and **15 strict / 4
conditional integrated cases**. All previous model gates also passed.

Across these bounded checks, the metadata updater, overlap helper, both pair
selectors, rectangle assignment and free-engine scan have every instruction
visited. The allocation wrapper and two range routines remain partially visited;
these observations are not exhaustive input/path or physical coverage.

All three complete BINs are 2,069,060 bytes with eleven unchanged resources:

| Build | SHA256 | Changed expanded bytes |
|---|---|---:|
| Stock | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` | 0 |
| Helper | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` | 29 |
| Layout | `95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a` | 6 |

The [workspace summary](community-channel-update-workspace.json) records the
run and its evidence hashes. Independent finalization checked **220 generated
artifact hashes and 260 input identities**, the 185 base workspace artifacts
plus two USB images, all **13 earlier workspaces / 34 BINs**, and the saved
318 starting tracked files. Canonical validation/build reports now describe
this successful run; older runs and versioned reports are retained.

## Evidence, findings and next paths

| Evidence | Artifact / observation |
|---|---|
| E72 | New assembly, source layout and recovery script; exact archived bytes; unchanged prior source records |
| E73 | Comparison encoder/model changes and focused instruction tests |
| E74 | Channel-update, channel-leaf and integrated-apply validator reports in the new validation run |
| E75 | Combined gate, input/artifact identities, three BINs and preservation summary |

The compiled application is a raw firmware image without a conventional PE/ELF
import table. Direct calls and fixed memory addresses above are the applicable
static dependency evidence; no native import-resolution claim is made.

| Finding | Evidence | Limit |
|---|---|---|
| F75: Nine routines are byte-exact editable source | E72, E73 | No original vendor source names or general compiler/linker |
| F76: Channel assignment and allocator contracts are bounded | E74 | Missing `22701c`; geometry and ISA assumptions remain |
| F77: Integrated inactive update returns and apply advances | E74 | Explicit wait bypass; stop before `21ffb3`; no full apply return |
| F78: Offline builds remain reproducible | E75 | Hardware and most application source remain unfinished |

| Next path | Finding / evidence | Work |
|---|---|---|
| P62 | F77 / E74 | Recover `21ffb3` from the actual first engine preparation path |
| P63 | F76 / E74 | Recover `22701c` and its `222ce8` / `220c76` dependencies for selected active assignments |
| P64 | F75–F78 | Independent ISA/store/CALL evidence, remaining application, toolchain, EFE/USB builds and later hardware validation |

Reproduce from the repository root with a fresh output directory:

```bash
.venv/bin/python scripts/reconstruct_dc9_channel_update.py
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-channel-validation
```

The recovery command rejects differing existing sources. The combined command
rejects reused output paths and Python `-O`. Existing historical reports and
builds remain preserved.
