# DC9 command-path reconstruction and bounded execution

Continuation: the [community workspace and register report](2026-10-23_reverse-dc9-workspace-report.md)
supersedes the source-count and latest-build status below. The 13-component
results and hashes here remain historical; their exact JSON/source versions
are preserved in `analysis/scratch/community-workspace-before-2026-10-22/`.
Current source/build/model JSON files describe later expanded layouts; consult
the [development guide](../firmware/README.md) for the latest build.

Date: 2026-10-22 (America/Los_Angeles). Scope: [offline firmware reconstruction](scope.md).

## What can be built now

The DC9 build reproduces the entire archived v101 BIN byte-for-byte. It now
assembles 13 routines or code fragments: 282 instructions / 871 code bytes,
plus four tables / 531 data bytes. The other program bytes come from the pinned
vendor image. This is binary reconstruction with a growing source overlay;
it is not a rebuild of the complete firmware from original source files.
Only about 0.036% of the 2,426,560-byte expanded program is reconstructed code.
That ratio is not an estimate of engineering effort or completion time.

The source tree does not contain the original complete SDK, compiler/linker
setup, vendor source, or peripheral definitions. Having the complete vendor BIN
provides all bytes needed for a 1:1 copy/reconstruction, but does not supply
those missing development files. Controlled same-size edits can already be
assembled, packaged, and checked offline.

Both new outputs are 2,069,060 bytes:

| Output under `analysis/extracted/rebuild/` | SHA256 | Meaning |
|---|---|---|
| `dc9-v101-command-path.baseline.bin` | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` | Exactly equal to archived DC9 v101 |
| `dc9-v101-command-path.experimental.bin` | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` | Existing helper rewrite, reproduced through the expanded source build |

The experimental BIN is byte-identical to the earlier
[independently audited experiment](dc9-experiment-audit.json). It changes 29
expanded program bytes within the 39-byte helper. The expanded source coverage
does not introduce additional firmware changes. Main CRC16, AP CRC32 and file
CRC32 validation pass; the 11 resources remain unchanged. The stock baseline's
hash proves equality to the archived input, not that the owner's monitor has
accepted or booted it. Neither experimental build has run on hardware.

## Recovered functionality

The existing selector router, membership predicates, fallback stub and XOR
helper are joined by these components in the [source layout](reconstructed/dc9-source-layout.json):

| Component | Candidate address range, end exclusive | Bytes |
|---|---|---:|
| Copy three planes and store their XOR | `0x2040d2–0x204144` | 114 |
| Guarded plane byte writer | `0x204144–0x204168` | 36 |
| Calculate 16-bit record offset | `0x204168–0x20417e` | 22 |
| Secondary dispatcher entry/default/shared return fragment | `0x205bd8–0x205c6e` | 150 |
| Command `0x32` body | `0x205c6e–0x205cdf` | 113 |
| Parent selector-entry fragment | `0x26bf26–0x26bf94` | 110 |
| Parent router-call/shared return fragment | `0x26c153–0x26c17c` | 41 |

The secondary jump table at `0x2aeb78` contributes 109 little-endian uint32
targets / 436 bytes. Rebuilding that table does not reconstruct all its targets.
The strict encoder now supports 41 mnemonics. Each recovered instruction
re-encodes to the archived bytes; fragments are explicitly identified as such.

The parent reads the selector from slot byte 1 and the command from byte 2,
mirroring them at `0x453cd1` and `0x453cc8`. Selectors `cc`, `f0`, and `f1`
branch to the router-call fragment. The existing router only accepts the full
value `cc`; the other two return zero through that path.

For command `0x32`, the recovered operations are:

1. Select plane `slot[4] & 3`, take the byte count from `slot[5]`, and form
   a big-endian 16-bit destination offset from `slot[6]` and `slot[7]`.
2. Read `count` bytes starting at slot offset 8. XOR all supplied bytes,
   including bytes whose destination is rejected by the writer.
3. Write each low byte to `0x47e15c + plane * 320 + offset + index` only when
   unsigned plane is at most 2 and unsigned destination offset is at most 319.
4. Store the XOR in the response halfword at `0x453ce0`, then return zero
   through the common dispatcher epilogue. Count zero gives a zero response.

The related copy routine reads three source pointers at `0x340144`, copies
320 bytes from each into the three planes, calls the XOR helper over all 960
bytes, and writes the checksum at `0x47e51c–0x47e51d`. The preceding eight
record bytes are untouched. The record-offset helper computes
`(index * 970 + uint16_at_0x340000) & 0xffff` under the documented model.
The planes' display/calibration role is not established; no gamma or color
feature name is assigned.

## Execution model and its limits

The pinned AEON SLEIGH files were not changed. Its CALL calculation uses
`inst_next + instruction_size`. Eight of nine CALL sites in the reconstructed
components then point outside the modeled instruction boundaries. Router
execution fails first at `0x26f083`. Returning instead to `inst_next` lets the
tested paths finish, preserves the saved registers/stack, and agrees with the
separate behavioral contracts. This is strong internal evidence for a modeling
correction, not independent confirmation of the physical CPU's ABI.

A second concrete SLEIGH issue appears at `0x204173`: translation of
`bg.lhz r7,0(r7)` zeroes `r7` before using it to calculate the address. The
record-offset routine sets `r7` to `0x340000` immediately beforehand.
The exact P-code is preserved in [module evidence](dc9-module-validation.json).

The new [bounded instruction model](../scripts/aeon_module_model.py) therefore
does not silently reuse or patch those P-code semantics. Its API requires an
explicit CALL policy. It uses decoded instruction text checked by exact
re-encoding, then executes a restricted instruction whitelist with stated
assumptions: 32-bit GPRs, low byte/halfword operations, little-endian data,
read-before-write loads, zero `r0`, fallthrough CALL links, and no delay slots.
The old-link policy is retained to reproduce the failure.

Mapped memory regions have explicit sizes and write permissions. Unknown
handlers, unmapped memory, overlapping mappings, bad instruction boundaries,
unexpected returns and instruction-budget exhaustion fail. The model has no
device operations, host calls, interrupt delivery or timing. It is useful for
checking the recovered RAM behavior, not a monitor emulator or ISA certification.

Recorded passing checks:

| Check | Cases |
|---|---:|
| Command `0x32`, counts 0–120, plane masks and boundary offsets | 5,084 |
| Parent selector/command path | 81 |
| Other supported reject/default/fallback router paths | 196 |
| Byte-writer unsigned bounds and byte truncation | 294 |
| Complete plane copy and checksum | 4 |
| Record-offset calculation and uint16 wrapping | 36 |
| Original/rewrite helper comparisons through the router | 218 |

The 218 comparisons check all 32 final GPRs, the final comparison flag, calls,
ordered reads/writes and all mapped memory. They do not compare timing or all
physical CPU state. The baseline scenarios visit 273 of the 282 reconstructed
instruction addresses; remaining addresses include the unsupported primary
handler route. Positive completion of that route is deliberately not simulated.
The previous 1,557 leaf-helper comparisons retain their narrower scope.

## Packet boundary finding and next receive-path work

The slot stride is 128 bytes. Reading payload from offset 8 leaves 120 bytes
within one slot. Counts 121 and 255 attempt the first out-of-slot byte at
`0x47ec00` for slot zero, and the bounded model rejects that read. The plane
writer's destination check does not bound these source reads. This occurs both
from the router and from the reconstructed parent entry.

[Packet-entry evidence](dc9-packet-entry.json) identifies one direct parent-call
candidate at `0x20cfea`, in a routine beginning at `0x20cf64`. On the listed
path, global byte `0x45415d` is zero, a per-slot byte at `0x45414c + slot` is
nonzero, `slot[0] & 0x7f` is nonzero, and `slot[slot[0] & 0x7f] != 0xe6`.
This path does not compare command `0x32`'s count at byte 5 with that frame-length
field. Around the call it changes bit `0x20` in an object reached through the
pointer at `0x3b5f38`. That object's RAM/MMIO classification is unresolved, and
this earlier caller is not executed by the bounded model.

There is no established external reachability or vulnerability claim: earlier
receive/copy code may constrain packets, and the transport is still unnamed.
Further tracing in this continuation recovered the consumer and part of the
producer, recorded separately in [ingress evidence](dc9-ingress-path.json).
The consumer at `0x20d130` initializes slot zero, increments it by one, and
stops at eight. It calls `0x20cf64` from `0x20d248` only when the per-slot state
at `0x453b94 + slot` is 5. This bounds slots to 0–7 on that consumer path,
covering buffers `[0x47eb80,0x47ef80)`. It does not prove every possible caller
has the same bound.

The producer is in a larger routine beginning at `0x20d33c`. A useful naming
correction follows from its stores: `0x45414c + slot` is a received-byte counter,
not merely a boolean ready flag. The expected frame length is held at
`0x454154 + slot`. The shown producer path requires a nonzero expected length,
`received_count == expected_length + 2`, and a zero result from status helper
`0x20c9fa` before setting state 5. The expected length takes the low seven bits
of a ring byte, with a fallback to slot byte 0. Ring-position arrays are reached
at `0x47ef80 + slot*2` and `0x47f3c0 + slot*2`. Bytes read via helper `0x20e47e`
are copied into the slot and increment the receive count.

These checks constrain the outer frame. No relation between that frame length
and command `0x32`'s separate count at byte 5 has been established. The producer
has other branches; its complete ring/overrun behavior has not been modeled.
Physical transport and externally possible packets remain unresolved. The
following additional static trace resolves part of the low-level register map.

## Register mapping beneath the receive path

[Register-map evidence](dc9-register-map.json) follows initialization at
`0x270735`: request ID `0x12c` is classified as 1, dispatched through table
entry `0x33cbb8` to `0x271afd`, and handled at `0x271c6a`. This path stores
`0xa0000000` into the base-pointer location `0x453cf0` and returns size metadata
`0x7b80`. The archived initial pointer bytes are zero. Initialization ordering,
runtime changes and the meaning of the size metadata have not been verified;
the metadata is not assumed to bound every accessed register.

The byte-read helper at `0x23dd44` returns zero if
`logical & 0x007fff00` is zero. Otherwise its byte address is:

```text
base + 2 * (logical & 0x007fffff) - (logical & 1)
```

If logical bit 23 is set, it first writes the top byte to
`base + 2 * (logical & 0x007fff00)`. Thus this firmware helper can change page
selection while reading. It was inspected statically, never invoked on a device.

The indirect buffer helper `0x20e47e` programs a 16-bit offset equal to its
argument minus `0x4000` through logical register `0x3c02`, polls mask `0x20`
in `0x3c06`, manipulates control bits and software flag `0x453b9e`, and obtains
data from `0x3c01`. With the initialized base above, these correspond to address
bytes at `0xa0007804/05`, control at `0xa000780c`, and data at `0xa0007801`.
Its nested polling, write-helper behavior and flag/interrupt interaction remain
outside the RAM model.

| Slot ID | Buffer offset, mode zero | Buffer offset, mode nonzero | Position-register offset from base |
|---:|---:|---:|---:|
| 0 | `0x80` | `0x300` | `0x7d8c` |
| 1 | `0x100` | `0x380` | `0x7d98` |
| 2 | `0x180` | `0x400` | `0x7da4` |
| 3 | `0x200` | `0x480` | `0x7d74` |
| 7 | `0` | `0x280` | `0x7dc8` |

The consumer loops over eight slot IDs, while these helpers give distinct
mapping cases for five. Other IDs return offset `0xb900` / position zero;
their meaning is not established. No slot is assigned a physical HDMI,
DisplayPort, DDC or USB connector name from this evidence alone. Next work is
to complete producer state transitions and the register write/poll/interrupt
path before proposing a peripheral model.

## Separate Black 32 integrity probe

The EFE/E91 family still has no validated repacker. All 11 pinned images were
checked against their inventory hashes. Their last byte is not reproduced by
sum modulo 256, negative sum, complement sum, or XOR over all preceding bytes.

The [probe](black32-integrity-probe.json) tests 512 full-body CRC8 hypotheses:
all 128 degree-eight polynomials with nonzero constant term, both shift
directions, and optional output-bit reversal. It uses five equal-length
matte/Gorilla Glass version pairs. XOR differences cancel any shared initial
value and final XOR. No hypothesis explains all five observed trailer deltas.
Sparse zero-byte advancement is checked against direct bit-at-a-time CRCs for
every polynomial, and initialization cancellation has a separate regression.

This rules out only the stated full-body CRC8 family. Selected ranges,
normalization, bank checks, reordered bytes, other widths, and non-CRC
algorithms remain possible. Even the interpretation of the last byte as an
integrity field needs loader/updater evidence. No Black 32 image was modified.

## Reproduce and evidence map

Run from the repository root. Existing BINs are never overwritten; choose new
names for repeat builds. Preserve JSON reports before refreshing them.

```bash
.venv/bin/python -m unittest discover -s scripts -p 'test_*.py'
.venv/bin/python scripts/trace_dc9_packet_entry.py
.venv/bin/python scripts/trace_dc9_ingress.py
.venv/bin/python scripts/trace_dc9_register_map.py
.venv/bin/python scripts/validate_dc9_module.py
.venv/bin/python scripts/build_dc9_source_baseline.py --output analysis/extracted/rebuild/dc9-v101-command-path.baseline.bin
.venv/bin/python scripts/build_dc9_source_baseline.py --experimental --replace-source command_group_secondary=analysis/reconstructed/spectrum_one_table_helper_rewrite.aeon.s --output analysis/extracted/rebuild/dc9-v101-command-path.experimental.bin
.venv/bin/python scripts/probe_black32_integrity.py
git diff --check
```

The tool suite passes 54 tests: 24 parser, six leaf-interpreter, 13 source/encoder,
nine module-model, and two sparse-CRC tests. These are offline tool tests.
Environment identity and tool hashes are recorded in the generated evidence.
No dependency downloads, device probes, updaters, flashing, commits or pushes
were performed. Git remains on `main` at `50dbabf` with the prior changes intact.

| Evidence | Finding | Confidence and path |
|---|---|---|
| E24: [layout](reconstructed/dc9-source-layout.json), [baseline](dc9-source-baseline.json), [experiment](dc9-source-experiment.json) | F24: 871 reconstructed code bytes and 531 table bytes reproduce the pinned bytes; complete baseline equals stock | High byte-identity confidence; pinned binary → source assembly → container |
| E25: [module validation](dc9-module-validation.json), [model tests](../scripts/test_aeon_module.py) | F25: selected RAM command behavior and replacement equivalence hold under explicit model assumptions | Conditional semantic evidence; code → bounded model → Python contracts |
| E26: [packet entry](dc9-packet-entry.json) | F26: selector source and one upstream path recovered; end-to-end input constraints remain open | Static reconstruction; caller → parent → router → command |
| E27: [Black 32 probe](black32-integrity-probe.json), [CRC tests](../scripts/test_black32_integrity.py) | F27: stated whole-body sum/XOR/CRC8 candidates do not explain the trailer across the corpus | High confidence for rejected hypotheses only; pinned images → paired deltas → tested CRC engine |
| E28: [ingress path](dc9-ingress-path.json) | F28: one consumer iterates eight slots; producer distinguishes receive count, expected frame length and ready state | Static, partial producer interpretation; receive copy → length equality → state 5 → bounded consumer |
| E29: [register map](dc9-register-map.json) | F29: initialization supplies base `0xa0000000`; logical byte mapping and five slot mappings recovered | Static mapping; initialization → register helper → indirect receive buffer |

P05 (`path_type=solve`): E24/F24 → E25/F25 → E26/F26 advances the source-to-image
path while exposing model and input-boundary limits. E28/F28 extends this to
the consumer and receive state; E29/F29 establishes a candidate register map.
E27/F27 narrows the separate Black 32 integrity
investigation. Findings are `severity=n/a_re`; this is not a
security vulnerability report. Triage/imports anchor: pinned raw monitor images,
expanded AEON application and flat MIPS16-compatible Black 32 image; no new
PE/ELF imports or vendor utility execution are involved.

Timeline: preserved all 37 starting changed/untracked files under ignored
`analysis/scratch/table-module-before-2026-10-22/` with a SHA256 manifest; verified
that snapshot still matches; reconstructed the RAM module and parent fragments;
ran the bounded contracts, source builds and tool tests; then constrained Black
32 trailer candidates. Intermediate eleven-component reports are retained in
that scratch folder as well. Earlier BINs remain intact. The previous report's
six-component JSON hashes refer to copies preserved in this snapshot; its
historical findings remain valid within that earlier scope.

Firmware-derived assembly and data remain excluded from the repository MIT
grant. Hardware identity, recovery, boot acceptance and actual display, HDR/VRR,
sleep/wake, input switching and USB-C behavior remain outstanding.

## Evidence hashes

These hashes identify the evidence from this continuation.

| Artifact | SHA256 |
|---|---|
| [dc9-source-baseline.json](dc9-source-baseline.json) | `cf37d07dcb944111159be61e26293e4d16730a582ad750e732809e41290e96d3` |
| [dc9-source-experiment.json](dc9-source-experiment.json) | `041977bdaa7028072d6cd6dfdb6dd9e85dad9fded6ef085d3c3b7df494b4a22e` |
| [reconstructed/dc9-source-layout.json](reconstructed/dc9-source-layout.json) | `9d97f53044474e542b8738e5c6918bc478106e2ad64956ee9264304061c2b1b9` |
| [dc9-module-validation.json](dc9-module-validation.json) | `56fe5d77b75c627b07cfe864c2c59f8a183c521cf774866ff0529e54839c813f` |
| [dc9-packet-entry.json](dc9-packet-entry.json) | `98e15f6194052aff467780ba8c25ae44ab7262a9fe65161bfb6480b9ffba2bed` |
| [black32-integrity-probe.json](black32-integrity-probe.json) | `d5252a89fa54e67aa592a8cc905c73733d4ed6d3cb8367b52bd5515454886e07` |
| [dc9-ingress-path.json](dc9-ingress-path.json) | `98a2daeffb8005d77c27c489e386bb2816a60d0d313a942524620e9eafb08dc2` |
| [dc9-register-map.json](dc9-register-map.json) | `244e4a9cc4702cde7ccd479572167d5f7e6975384f5647c3f28745ed894366f3` |
