# DC9 metadata routing and register-update reconstruction

Date: 2026-10-24 (America/Los_Angeles). Scope: [authorized offline community
firmware development](scope.md). The owner requested continued source recovery
and cheaper subagents for parallel work, while retaining build quality.

## Result

Fifteen more components now assemble exactly from editable source. They connect
the earlier layout-apply routine to engine/channel metadata lookups and two
register-update helpers, then recover the next state-accumulation service and
its selector table. Source now covers **83 components, 4,151 instructions
and 13,041 code bytes**, with eight tables / 787 bytes. The code-byte/application-
byte ratio is **0.537%**, compared with 0.440% at the previous apply milestone.
It remains a coverage proxy, not a product-completion or effort percentage.

The mask-preparation routine now returns through real recovered dependencies
under two explicit store policies in the plain-memory model. The parent apply
entry runs through that preparation and reaches the next metadata service;
full apply remains incomplete. Both paths through the next service reach the
same further dependency, `0x20e76c`; neither completes the six-record reset loop.
No external call was stubbed to force success.
There is still no hardware-tested community release or fully editable application.

Three cheaper subagents independently checked dependency boundaries, instruction
encodings, test cases and final artifacts. The parent reviewed their changes,
integrated the source and ran the combined validation. All starting work was
preserved in a 164-file snapshot before editing. The intermediate 79-component
run passed 115 tests and remains in
[its own summary](community-metadata-routing-workspace.json); a further 184-file
snapshot preserves the state before extending that milestone.

The final run passed **118 tests**,45 archive hashes,13 byte-exact corpus
roundtrips and141 resource checksums, along with all earlier model gates. Its
workspace contains122 base artifacts and two USB images. All147 generated
artifact hashes and167 source identities match the run record. Eight older
workspaces and19 prior build images also verified successfully.

## Evidence

Evidence is local file/command evidence, with full hashes, tool versions and run
timestamps in [the latest summary](community-metadata-workspace.json) and its
referenced immutable validation directory. The existing pinned pypcode/SLEIGH
decoder and local encoder/model were used. IDA was unavailable and no vendor
executable, network request or hardware operation was needed.

| ID | Source / reproduction command | Observation and work item |
|---|---|---|
| E49 | [Recovery script](../scripts/reconstruct_dc9_metadata.py), [source layout](reconstructed/dc9-source-layout.json); `.venv/bin/python scripts/reconstruct_dc9_metadata.py` | Eleven complete source spans re-encode exactly; WI47 |
| E50 | [Metadata validation](dc9-metadata-validation.json); `.venv/bin/python scripts/validate_dc9_metadata.py` | 2,433 strict cases and 290 conditional cases; WI48 |
| E51 | [Masked-register validation](dc9-masked-validation.json), [regressions](../scripts/test_dc9_masked.py); `.venv/bin/python scripts/validate_dc9_masked.py` | 32 default-policy rejections and 64 conditional cases, partial-write evidence; WI49 |
| E52 | [Encoding regressions](../scripts/test_aeon_metadata_encoding.py), [metadata regressions](../scripts/test_dc9_metadata.py); `.venv/bin/python -m unittest discover -s scripts -p 'test_*metadata*.py'` | Signed operands, aliases, rejected large shifts and memory-boundary behavior; WI50 |
| E53 | [Latest workspace summary](community-metadata-workspace.json); `.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-next-validation` | Full archive/model/build gate and artifact hashes; WI51 |
| E54 | [Service recovery](../scripts/reconstruct_dc9_metadata_service.py), [service validation](dc9-metadata-service-validation.json); `.venv/bin/python scripts/validate_dc9_metadata_service.py` | Selector mapping, 2,833 strict prefix/selector cases and 150 conditional isolated publication cases; WI52 |

Individual validator commands refresh canonical JSONs. The combined command
requires a fresh destination and retains an immutable run. E49–E54 extend the
[configuration/apply report](2026-10-24_reverse-dc9-configuration-report.md).

## Exact recovered source

Addresses are candidate application addresses; ends are exclusive. Names are
descriptive reconstructions, not recovered vendor symbols.

| Component | Start | End | Bytes |
|---|---|---|---:|
| Channel source byte | `0x2227da` | `0x2227ef` | 21 |
| Engine channel byte | `0x2227ef` | `0x222804` | 21 |
| Engine metadata index | `0x222804` | `0x222819` | 21 |
| Metadata engine byte | `0x222819` | `0x22282e` | 21 |
| Metadata mask halfword | `0x22282e` | `0x222843` | 21 |
| Engine mask-register write | `0x21d1e5` | `0x21d2bf` | 218 |
| Engine mask-register update | `0x21d2bf` | `0x21d3b1` | 242 |
| Channel mask preparation | `0x23d3a0` | `0x23d4fc` | 348 |
| Engine geometry service | `0x23d4fc` | `0x23d71e` | 546 |
| Masked byte update | `0x23dfe1` | `0x23e0b6` | 213 |
| Masked halfword update | `0x23e152` | `0x23e18c` | 58 |
| Channel selector mask | `0x20e687` | `0x20e6c5` | 62 |
| Metadata state accumulation | `0x20f1ef` | `0x20f401` | 530 |
| Shared state publication | `0x20fe64` | `0x20fe85` | 33 |
| Publication trampoline | `0x20ff1b` | `0x20ff1f` | 4 |

The routing validator visits 394 of the first 564 new instructions, plus 93 older
instructions. The masked-register validator separately visits 67 byte-helper
instructions and all 20 halfword-helper instructions under each store policy.
These coverage counts overlap and must not be added. Full geometry-service
execution is not established by exact source assembly. The subsequent selector
dispatch table occupies 32 bytes at `0x2af120`; it contains eight little-endian
instruction addresses.

## Findings

### F54: engine metadata determines a register-bank calculation

Evidence: E49, E50. Category: reverse_algo; severity: n/a_re. Status: validated
for exact bytes and modeled address calculations. Confidence: high within those
bounds. Locations: `0x222804`, `0x21d1e5`, `0x21d2bf`.

An engine index selects a byte at `0x47fa9c + index*124 + 0x1d`. That byte
selects a 176-byte metadata record at `0x3b4950`. The metadata's first uint32
is transformed into an eight-bit bank index:

| Metadata key | Bank |
|---|---|
| 0–4 | low8(key + 3) |
| 5–7 | low8(key - 5) |
| Larger uint32 values | low8(key) |

The first helper writes a halfword at logical address `0xfff30382 + bank*512`.
The second updates a masked halfword at `0xfff30380 + bank*512`: original
argument zero supplies all-one value bits; a nonzero argument supplies zero.
These logical addresses pass through the existing register/page-selection
helpers. They do not identify physical connectors or establish real register
functions beyond the observed reads and writes.

The index >5 guard in these helpers occurs after reading the selected metadata
record. An unmapped metadata record therefore fails before that guard. Tests
distinguish an absent record from an explicitly mapped seventh record that
reaches the return path.

### F55: a complete mask-preparation path now runs under explicit assumptions

Evidence: E49, E50, E52. Category: reverse_algo; severity: n/a_re. Status:
validated in the bounded conditional model; physical semantics unresolved.
Location: `0x23d3a0..0x23d4fc`.

The routine iterates set mask bits, looks up metadata, writes `0x86` through
the first helper and uses `0x86` or `0x06` as the second helper's update mask.
Metadata byte +0x8a together with word +0x04 bit0x20 selects `0x06`; otherwise
the tested ordinary branch selects `0x86`. If either byte +0x8a/+0x8b is nonzero
and word +0x04 bit0x08 is set, the special branch reaches unresolved service
`0x20ece9`. Tests stop before that call rather than treating it as complete.

For each of two counter-store policies, 144 cases run the complete preparation
routine using masks0–15, three original arguments and three metadata states.
They compare the entire mapped register state and ordered data writes with
independently computed results. A separate case per policy enters the actual
parent apply routine and stops before `0x22acd1`, the call to `0x20f1ef`, after
all four selected preparations and the first metadata-reset iteration.

An integration check caught an overbroad preservation assumption: the older
register writer loads the broadcast mask into `r23` at `0x23ddca` without
saving it. Nonempty preparation leaves `r23=0` in this zero-broadcast fixture.
Tests now require that specific result and preservation of the other checked
high registers and stack pointer. This does not establish a complete CPU ABI.

### F56: masked updates are conditional and can leave partial writes

Evidence: E51, E52. Category: reverse_algo; severity: n/a_re. Status: validated
for plain-memory contracts; confidence: high within the model. Locations:
`0x23dfe1`, `0x23e152` and shared counter `0x4551a8`.

The byte operation computes `(old & ~mask) | (value & mask)` at byte width.
The halfword operation invokes that helper for the low and high bytes in order.
The validator covers both widths at direct and paged logical addresses, zero
and overflowing full masks, and counter values0/1/65534/65535. A regression
also checks mixed-mask preservation and adjacent mapped sentinels.

Default execution rejects ambiguous `bg.sw_1` counter stores before the masked
operation. Explicit `sleigh-store` writes four bytes and clears adjacent
counter sentinels; `halfword-lane-hypothesis` writes two and preserves them.
Both policies give the tested arithmetic results, but neither is physical
validation of the counter width, lock or page-window behavior.

If the high byte is unmapped, the low byte can already have changed. The larger
preparation routine can likewise write its first mask register before default
rejection at the later masked-update counter store. Tests verify these partial
effects. No rollback or atomic transaction is inferred.

### F57: geometry guards read memory before rejecting some inputs

Evidence: E49, E50, E52. Category: reverse_algo; severity: n/a_re. Status:
validated for the tested prefixes/returns; confidence: high. Location:
`0x23d4fc..0x23d58d`.

The geometry service reads engine byte +0x10 before rejecting an engine index
greater than3. Index4 with only four mapped records faults; an explicitly mapped
fifth record lets the routine reach its return-zero guard. This is an isolated
memory-access observation, not proof of externally reachable unsafe input.

For valid engine indices, metadata byte +0x20 bit0x20 returns zero immediately.
Otherwise, bits0x0c require channel-record byte +0x81 to be nonzero to proceed.
When bits0x0c are clear, that channel-flag read is skipped. Across all256 flag
bytes, two channel-flag states and four engines, 1,408 cases return and640 reach
the explicit stop before `0x2686dd`. The remainder of the geometry service is
assembled source with unresolved runtime dependencies.

## Instruction support and limits

The strict encoder/model adds `bt.movhi`, `bn.extbs`, `bn.sflesi` and `bn.sll`.
Concrete archived sites and signed immediate limits are checked. `bt.movhi`
sign-extends its five-bit immediate before shifting; `bn.sflesi` compares signed
32-bit input with a signed eight-bit immediate. Variable shifts accept counts
0–31 and explicitly reject larger counts because hardware behavior is unresolved.

`bn.extbs` follows the model's existing low-byte convention. Pinned SLEIGH uses
a high-byte register slice, so that convention remains a hypothesis rather
than an independent ISA result. Aliased operands and all256 byte values are
tested. Little-endian data, fallthrough CALL links and the two wide-store
policies retain their earlier limitations.

## F58: state accumulation converges on common services for both branches

Evidence: E54. Category: reverse_algo; severity: n/a_re. Status: validated for
prefixes and independent publication tails; confidence: high within the model.
Location: `0x20f1ef..0x20f401`, selector `0x20e687`, publication `0x20fe64`.

The selector table returns **80,01,02,04,08,10,20,40** in hexadecimal for
indices0–7, and zero for larger uint32 inputs. An initial subagent suggestion of
a descending shift was rejected against the actual table and replaced with
the literal mapping in source, contracts and tests. No physical channel names
are inferred.

When global byte `0x4543bc` is zero, argument flag bits accumulate the selector
mask into different global bytes. Flag1 sets `0x4543bd` to1. Flags2/4/8 map to
offsets3/6/4; flag0x400 maps to5; flags0x10/0x20 map to10/7; flags0x100/0x200
map to8/9; flag0x40000 maps to13; either bit0x6000 maps to11. Flag0x20000
affects offset20 only inside the flag0x400 branch. A nonzero global gate skips
that flag tree. Independently, the original first argument clears selector
bits from offset12 when zero, or ORs them in when nonzero.

Both branches then reach `0x20f28c`, which calls unrecovered `0x20e76c`.
The validator stops there after checking the complete global-byte fixture.
It does not infer that disabling a selector skips the shared service chain.
That distinction prevents falsely declaring the parent metadata-reset loop
complete.

The publication tail is tested independently under both store policies. It
stores two values and ORs flag `0x4543dd` with2. Literal `bg.sh` writes the high
halfword at `0x4543dc`, replacing the adjacent flag before the OR. The alternate
low-halfword policy writes at `0x4543de`, preserving the flag's other bits.
`bg.sw_1` writes at decoded address `0x4543e0` under both policies, using four
bytes or two respectively. These are explicit alternatives, not a new ISA
conclusion or proof that preceding services completed.

## Paths and next work

| Path | Type / objective | Evidence → finding → next action | Remaining uncertainty |
|---|---|---|---|
| P46 | callflow: engine index → logical register bank | E49/E50 → F54 → trace runtime writers of engine metadata and channel assignments | Physical connector meaning, page windows |
| P47 | callflow: apply entry → metadata service | E50/E51 → F55/F56 → recover `0x20f1ef` and its `0x20e687` dependency | Remaining service state and peripheral effects |
| P48 | callflow: geometry guards → geometry service | E50/E52 → F57 → recover `0x2686dd` and follow its configuration decisions | Mode selection, real geometry behavior |
| P49 | callflow: accumulated global state → common consumers | E54 → F58 → recover `0x20e76c` and tail helper `0x20e66d`, then `0x23417c`/`0x2341c8`/`0x2112a0` | All service effects and complete reset-loop execution |

Special preparation dependencies `0x20ece9` and `0x20e990` are also open.
Further source recovery must keep partial stops and default semantic rejection
explicit. The full compiler/linker path, most application functionality,
EFE/USB source builds, physical boot and recovery remain unfinished.

The previous apply/configuration workspaces and reports remain preserved. The
three full BINs retain the stock/helper/layout identities. Each remains
2,069,060 bytes with valid checksums and11 original resource spans unchanged.
The [completed run summary](community-metadata-workspace.json) records hashes
and reproduction paths; this milestone adds exact original source, not a new
firmware feature or hardware-tested release.
