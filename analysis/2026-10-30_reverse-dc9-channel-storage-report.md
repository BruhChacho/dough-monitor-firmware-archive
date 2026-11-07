# DC9 channel storage and inactive full-apply return

Four additional byte-exact routines bring editable reconstruction to **164
components, 9,195 instructions / 28,347 code bytes**, plus **12 tables / 911
bytes**. Code-byte coverage is **1.168% (about 1.17%)** of the 2,426,560-byte
expanded application, whose denominator includes data. This is not a percentage
of product readiness or engineering effort. Full apply now returns in an explicit
inactive-channel model fixture; active operation and physical display behavior
remain unfinished. Most application bytes remain pinned vendor input.

This 2026-10-30 continuation started from published `89df754` under the existing
[offline scope](scope.md). Lower-cost agents contributed source, register
validation and documentation, with parent review of boundaries, addresses,
unsigned-width assumptions and test expectations. No vendor executable, monitor
probe or flashing occurred. This is ordinary firmware reconstruction, with no
malware or vulnerability classification.

## Byte-exact source and dependencies

The [generator](../scripts/reconstruct_dc9_channel_storage.py) verifies complete
decode, local branch targets, static reachability and terminal boundaries, then
reassembles every byte before writing. Calls are treated as fallthrough for
static reachability; that does not prove that external services return. Existing
matching sources are preserved and conflicting sources or records are rejected.

| Span (hex, end exclusive) | Instructions / bytes | Observed role |
|---|---:|---|
| `2402c4..2402de` | 10 / 26 | Lowest-set-bit index, zero returns zero |
| `2250c5..2250e8` | 12 / 35 | Channel mask lookup and lowest-set-bit call |
| `2250e8..225416` | 280 / 814 | Channel storage configuration |
| `226100..226278` | 118 / 376 | Register setup for two engine pairs |

The four routines add **420 instructions / 1,251 bytes**. No new ISA form or
table is needed. The earlier candidate `2250bd` is not the helper entry: the
actual call at `22523d` targets `2250c5`. The early return at `22522d` does not
end the storage routine; later blocks remain reachable. All earlier 160 routine
records and twelve tables are preserved.

This raw application has no conventional PE/ELF import table. Direct call
addresses recorded in the layout supply a partial dependency map. Positive-area
storage reaches unrecovered `2aacb9`, with `2ab331` also present in the static
calls. The recovered register routine uses existing byte, halfword, word and
masked register helpers. Unknown services are never replaced by success stubs.

## Bounded storage behavior

Channel records start at `4821ec`, stride 168. Lookup reads an unsigned modeled
halfword at record `+2a`; index four faults at `4824b6+2` with a four-record
mapping. The lowest-set-bit helper has no memory effects and returns zero for
zero, so zero and bit-zero masks yield the same result.

Storage scans four active bytes, reads width/height at `+1c/+1e`, multiplies
and calls the real lookup. A selected active record with zero area gets both
dimensions set to ten and returns immediately. A read-only second dimension
retains the first store. With all records inactive, an eight-iteration loop
addresses `floor(iteration/2)`: each channel receives nine zero word stores
**twice**, at offsets `5c,68,74,60,6c,78,64,70,7c`, in that order. Tests check
all 72 writes and preserve other bytes; a late fault retains preceding writes.

For one positive-area active record, execution reaches `2252be` immediately
before `2aacb9`, with modeled argument registers r3–r6 equal to
`[395,0,width*height,0]`. Earlier inactive records have already been cleared.
The selected active record is unchanged. Multi-active arithmetic paths remain
unexecuted. The core validator records **101 strict cases and four conditional
full-apply cases**, plus six fault/unknown-service regressions.

## Register behavior and assumptions

Engine records start at `47fa9c`, stride 124. The new routine addresses two
pair pointers, `47faa0` and `47fb98`, separated by 248 bytes. It reads bank at
pointer `+0`, state at `+4`, own width at `+4c` and partner width at `+c8`.
Both widths use the model's **unsigned low-16-bit hypothesis**, including the
instruction spelled `bn.lh`; this is not independent physical ISA proof.

Each pair first makes six direct helper calls. Inactive or zero-width pairs
clear bit 8 at logical `bank+20800047`. For an active pair whose width sum is
at most `1400` hex, it clears that bit, sets bit 8 at `bank+20800021`, and
writes `(1400-width)&fff8` at `bank+20800026`. Above the threshold, it reverses
the two bits, clears words at `bank+23800012/+23800052`, writes the distinct
partner/own configured halfwords to `bank+2080002a/+2080002c`, then writes zero
at `bank+20800026`.

The validator covers **12 conditional returns and one strict rejection**.
Every one of the 118 setup instructions is visited across the bounded cases;
this is not exhaustive input or path coverage. Checks distinguish configured
halfwords, exercise width `8000`, preserve saved registers and engine records,
and assert the complete ordered page/data-write trace. Missing and read-only
bus bytes retain earlier writes. Zero-bank cases produce no bus writes.
Default ambiguous-store rejection remains enabled and occurs after the first
six direct helper calls, preserving their twenty page/data writes.

## Integrated return and remaining active services

The existing engine-mode fixture is reused unchanged: four writable global
bytes, a fifth synthetic owner record, explicit zero engine banks, ordinary
mapped bus bytes and one of two wait-bypass inputs. Under each ambiguous-store
policy, full apply `23fad0` returns r3=1 after 43,910 modeled instructions,
preserving the stack and r10–r22. It completes four engine preparations,
thirteen inactive resets and one call each to the two new main routines.
All channel active bytes and final `+81` flags are zero. Engine state words
remain zero and thirteen engine flag bytes become one.

Three distinct boundaries prevent a stronger claim:

- Making the first channel active reaches assignment service **`22701c`** earlier
  in full apply; this is not the isolated storage arithmetic boundary.
- Positive-area isolated storage requires **`2aacb9`**, then other arithmetic.
- Setting a final channel flag at `+81` reaches **`22eb07`** even with its active
  byte zero.

The real non-bypass timer path still requires unavailable countdown state.
No timer completion, device page behavior, interrupt or physical display effect
is invented. The return proves a bounded inactive path in the current model.

## Completed gate and preservation

The combined gate passed **214 tests** with no failures, errors or skips,
45 archive hashes, 13 byte-exact corpus roundtrips, 141 resource checksums,
all model stages and three firmware builds. The final audit verified 245
run-artifact hashes, 296 source identities and 203 base workspace artifacts
plus two USB references. All 390 saved starting files, sixteen prior workspaces
and 43 earlier BINs verify. The immutable starting snapshot remains at
`analysis/scratch/channel-storage-before-2026-10-29/`.

Each new BIN is 2,069,060 bytes with eleven unchanged resource spans:

| Build | SHA256 | Changed expanded bytes |
|---|---|---:|
| Stock | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` | 0 |
| Helper experiment | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` | 29 |
| Layout experiment | `95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a` | 6 |

Reconstructing more source preserves these image identities because its output
matches the original bytes. No build has been booted on a monitor.

## Evidence and reproduction

The versioned [workspace summary](community-channel-storage-workspace.json)
records the combined gate, source identities, artifacts and preservation audit.
[Storage evidence](dc9-channel-storage-validation.json) and
[register evidence](dc9-storage-registers-validation.json) retain exact source
and tool hashes. Historical workspaces and BINs remain separate.

| Evidence | Source and reproducible observation |
|---|---|
| E88 | Four generated assembly sources and generator: 420 instructions / 1,251 exact bytes |
| E89 | Core validator and six regressions: inactive clears, zero-area repair, full inactive return and active boundaries |
| E90 | Register validator and six regressions: ordered traces, threshold/high-bit cases and fault preservation |
| E91 | Combined validation and preservation summary: archive, corpus, build and input hashes |

All evidence was observed on 2026-10-30 from local files/commands. Artifact and
tool SHA256 values are recorded in the linked JSONs; the snapshot manifest
covers the starting files. Reproduce from the repository root, with prepared
local dependencies and extracted pinned firmware, choosing a fresh output:

```bash
.venv/bin/python scripts/reconstruct_dc9_channel_storage.py
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-channel-storage-validation
```

| Finding | Evidence | Status and residual limit |
|---|---|---|
| F88: Four additional components are editable and reproduce the pinned bytes | E88, E91 | Validated byte equality; recovered assembly, not original vendor source |
| F89: Inactive full apply returns with the stated mappings and policies | E89, E90 | Model result only; shared ISA assumptions are not independent hardware evidence |
| F90: Active assignment, arithmetic and final services remain necessary | E88, E89 | Observed call/fault boundaries; complete active paths are unknown |

**P72 — callflow:** start `23fad0`, complete inactive preparation/reset, call
`2250e8`, call `226100`, return (E89/E90, F89). Goal is the bounded inactive
return; residual risks are CALL/store/width hypotheses and unmodeled hardware.

**P73 — next reconstruction:** start at the active-channel input, recover
`22701c` and verify dependencies `222ce8/220c76` (E89, F90), then complete storage
arithmetic and final flagged services (E88/E89, F90). Goal is a tested active
path without service stubs. Most application source, the compiler/linker route,
other firmware families and device validation remain outstanding.
