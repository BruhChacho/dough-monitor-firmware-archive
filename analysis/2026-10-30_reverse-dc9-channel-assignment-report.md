# DC9 channel assignment and active-apply progress

Three further byte-exact routines bring the editable overlay to **167 components,
9,339 instructions / 28,780 code bytes**, plus **12 tables / 911 bytes**.
Coverage is **1.186% (about 1.19%)** of the 2,426,560-byte expanded application.
The denominator includes data; this ratio measures neither product readiness
nor engineering effort. The active-channel fixture now executes assignment and
reaches its dispatch service, with one additional explicit memory input. Active
full apply and hardware operation remain unfinished.

This 2026-10-30 milestone continues from published `d22a0d6`, following the
[offline scope](scope.md). Lower-cost agents handled reconstruction, isolated
validation and documentation. Parent review checked boundaries, preservation,
fixtures, auxiliary writes and the integrated active path. No monitor access,
vendor executable or flashing occurred. This is ordinary firmware analysis;
no malware or vulnerability classification applies.

## Source boundaries and dependencies

| Span (hex, end exclusive) | Instructions / bytes | Observed role |
|---|---:|---|
| `22701c..227145` | 97 / 297 | Metadata-to-engine assignment |
| `222ce8..222d32` | 25 / 74 | Metadata state to engine state mapping |
| `220c76..220cb4` | 22 / 62 | Argument preparation and service dispatch |

The [generator](../scripts/reconstruct_dc9_channel_assignment.py) adds **144
instructions / 433 bytes**, without new ISA forms or tables. It checks the
complete decode, aligned local branches, static reachability and terminal
boundaries, then reassembles all bytes before writing. The two explicit external
tail targets are accepted as terminal edges; other escaping branches reject.
Calls are treated as fallthrough for this static check, not proven to return.
Matching existing files are preserved; conflicts and overlaps reject. The
previous 164 routine records and twelve tables remain unchanged.

Assignment's early return at `2270a2` does not end the routine. Later blocks
branch into its body, and a tail at `22708c` jumps to `220c76`. Dispatch ends
with a tail at `220cb0` to `226bb5`. The layout records external calls separately
from external tails. The raw application has no conventional PE/ELF import
table; these addresses are a partial fixed-address dependency map.

Assignment calls recovered `222ce8`, `2227ef` and `20f1ef`. Dispatch calls
unrecovered `21ddcf`, then recovered `220a8b`, and tails to unrecovered `226bb5`.
No absent call is replaced by a success stub.

## State mapping and assignment

The state helper reads a **word** at METADATA base `3b4950`, stride 176, offset
`+c`, then writes a word at ENGINE base `47fa9c`, stride 124, offset `+8`.
Metadata value 2 maps to engine value 5, value 4 to 2, and every other tested
word to 1. Distinct high-bit values check that this is a full-word comparison.
No local index bounds are added by the reconstruction.

Assignment takes metadata index in r3 and engine index in r4. Metadata index 6
returns after stack save/restore without accessing data records. This is an
exact sentinel check, not a general upper-bound guard. Other inputs read the
metadata selector byte at `+10`. If it is not 4, assignment merges
`1 << engine_index` into the metadata mask halfword at `+12`, stores the low
metadata-index byte into engine `+1d`, calls the real state helper, unwinds its
20-byte frame and tails into dispatch.

Selector 4 instead stores the engine-index byte at metadata `+10`, replaces
its mask at `+12`, and writes one at `+1c`. The real `2227ef` helper reads the
engine's owner-channel byte; assignment reads that channel's flag at `+81`.
A nonzero flag writes metadata state `+c=0`. A zero flag writes state `+c=1`
and calls the existing metadata-state service `20f1ef` with the record's two
leading words. The latter path uses the real service and its helpers.

On continuation, assignment clears metadata byte `+70`. For engine indices
0–3, it reads configuration byte `45508c`. When nonzero, it initializes the
24-byte auxiliary record at `3b4288 + metadata_index*24`: bytes `+0/+1=1`,
byte `+11=0`, and words `+4/+8` from the corresponding byte entries in tables
`3b4281` and `3b427b`. These are zero-extended byte values stored as full words,
not two adjacent byte copies. Later state/selector updates lead into dispatch.
Engine indices above three bypass this auxiliary configuration read.

Dispatch selects r11=`20` hex for engine index four, otherwise 2 for an even
index or 4 for an odd index. It reaches CALL `220c95` with the original metadata
and engine arguments. Its later configuration call and tail remain unexecuted
through the real entry until `21ddcf` is recovered.

All execution claims depend on the explicit CALL, unsigned-low-halfword,
little-endian and store interpretations of the offline model. Register
addresses are ordinary bytes, without physical peripheral behavior.

## Integrated active-channel prefix

The earlier active fixture now faults at **unmapped `45508c+1`**, after the real
assignment and metadata service have already made writes. The new integrated
fixture adds exactly one read-only configuration byte at that address, set to
zero. It retains the existing explicit global, owner-record and bus mappings;
missing memory is never created automatically.

For one active channel at each of four positions, with dimensions 100 by 200,
the model reaches **`220c95` immediately before `21ddcf`** under both store
policies. The eight cases take 34,459 / 34,468 / 34,477 / 34,486 instructions
by channel position, with r3/r4=`[0,1]`. They call assignment and the state
helper once, and metadata accumulation seven times including earlier resets.
The assignment frame has unwound, while the dispatcher and caller frames are
still live; this is not a full-apply return or restored-stack claim.

The final seven metadata/engine writes are checked in order: metadata bytes
`+10=1`, halfword `+12=2`, byte `+1c=1`, word `+c=1`, byte `+70=0`, then engine
one's selector `+1d=0` and state `+8=1`. Owner channel and dimensions are checked,
and the new configuration input remains read-only. Allowing the next instruction
to execute rejects unknown `21ddcf` and retains those writes. The prior inactive
fixture still returns, while positive-area storage and flagged final-channel
services remain separate unfinished paths.

## Completed validation and preservation

The full gate completed on **2026-10-30**, with the preservation audit
completed on **2026-11-02** and publication review on **2026-11-04**. It passed **222 repository
tests**, with no failures, errors or skips, 45 archive hashes, 13 byte-exact
corpus roundtrips, 141 resource checksums, all model stages and three BIN builds.
The isolated validator records **24 strict cases**, visiting 96/97 assignment,
25/25 state and 11/22 dispatch instructions; seven focused regressions cover
mapping/permission faults, prior-write retention and unresolved dispatch. The
integrated validator adds **eight conditional active-prefix cases**. These
instruction counts are not exhaustive input/path coverage.

See the [versioned summary](community-channel-assignment-workspace.json),
[isolated evidence](dc9-channel-assignment-validation.json),
[integrated evidence](dc9-assignment-apply-validation.json), and
[complete run](extracted/firmware-validation-channel-assignment-2026-10-30/validation.json).
The audit verified 250 artifact hashes, 303 input identities and 206 base
workspace artifacts plus two USB references. All **403 saved starting files,
17 prior workspaces and 46 earlier BINs** verify. The starting snapshot at
`analysis/scratch/channel-assignment-before-2026-10-30/` remains immutable.

Each BIN remains 2,069,060 bytes with eleven unchanged resource spans:

| Build | SHA256 | Changed expanded bytes |
|---|---|---:|
| Stock | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` | 0 |
| Helper experiment | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` | 29 |
| Layout experiment | `95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a` | 6 |

No BIN has been booted on a monitor. Replacing original bytes with identical
assembled output expands the editable overlay without changing those hashes.

## Evidence, findings and continuation

| Evidence | Source |
|---|---|
| E92 | Three reconstructed sources, layout and generator; exact 433-byte reassembly |
| E93 | Isolated assignment validator and fault regressions |
| E94 | Integrated active-prefix validator, old missing-config regression and unknown-call retention regression |
| E95 | Combined run, build identities and preservation audit in the workspace summary |

Evidence is from local file/command observations on 2026-10-30. Source/tool
SHA256 identities are retained in the validation JSONs. Scope is the pinned DC9
application, with no device access. Reproduce with prepared local dependencies
and extracted inputs, using a fresh destination:

```bash
.venv/bin/python scripts/reconstruct_dc9_channel_assignment.py
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-channel-assignment-validation
```

| Finding | Evidence | Limit |
|---|---|---|
| F91: Three additional routines are editable and reproduce the archived bytes | E92, E95 | Recovered assembly, not original vendor source |
| F92: Assignment writes and state selection execute before dispatch | E93, E94 | Bounded synthetic states; shared ISA assumptions remain |
| F93: Active full apply advances to the `21ddcf` call with explicit configuration | E94 | Prefix only, no physical display proof |

**P74 — callflow:** start at active full apply, execute real assignment and
metadata accumulation, map state, unwind assignment, reach dispatch CALL
`220c95` (E93/E94, F92/F93). The next unresolved service is `21ddcf`; `226bb5`
is also required by dispatch. Recover and validate these before claiming a
complete active assignment path. Storage arithmetic `2aacb9/2ab331`, final
services, other application source and the full toolchain remain outstanding.
