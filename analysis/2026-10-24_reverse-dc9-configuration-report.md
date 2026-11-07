# DC9 editable layouts and apply-path reconstruction

Date: 2026-10-24 (America/New_York; latest run completed October 25 UTC).
Scope: [offline community firmware development](scope.md).
This report covers the configuration run started on October 23 local time and
the subsequent apply-path recovery. The objective remains a fully editable
application; neither that objective nor physical monitor operation is complete.

## Result and progress measure

Twelve additional components assemble exactly from source, adding 2,504 code
bytes to the previous timer milestone. The current build contains **68 components,
3,388 instructions / 10,682 code bytes**, plus seven tables / 755 bytes.
Recovered code divided by the 2,426,560-byte application is **0.440%**, up from
0.337% at the timer milestone and 0.399% at the configuration milestone.

This ratio is an auditable coverage proxy, not a percentage of engineering work
or product readiness. The denominator includes application data, and unknown
code/data boundaries prevent a precise executable-code percentage. The stock
BIN can already be reproduced in full, while most of its application remains
precompiled vendor input. No experimental BIN has demonstrated boot, display
output, input switching, HDR/VRR, sleep/wake, USB-C behavior or recovery.

A structured JSON source now lets developers edit the six inferred rectangle
layouts and build an experimental BIN. The included mode-2 example changes the
inferred horizontal split from 1920/1920 to 1600/2240. It changes six expanded
application bytes, preserves all eleven resource spans and regenerates all
three container checksums. Its actual appearance on a display is untested.

The completed latest repository gate passed **102 tests**, all 45 archive hashes,
13 byte-exact corpus roundtrips and 141 resource checksums, plus every earlier
model gate. The workspace contains 107 base artifacts and two USB images.
Independent audits verified all 129 generated artifact hashes and all 143 source
identities from the run. The 62-component intermediate run and its 98-test result
remain preserved separately.

## Evidence

All evidence is local file/command evidence. Full content hashes, tool identities,
timestamps and immutable run paths are recorded in the two linked summaries.
Reproduction requires the pinned archive extraction, decoder and Python setup
documented in the [build guide](../firmware/README.md). No vendor executable or
hardware interface was used. IDA was unavailable; the existing pinned pypcode
decoder and strict local encoder/model were used instead.

| ID | Artifact and reproduction command | Observation / work item |
|---|---|---|
| E44 | [Recovery source](../scripts/reconstruct_dc9_configuration.py), [layout source](reconstructed/dc9-source-layout.json); `.venv/bin/python scripts/reconstruct_dc9_configuration.py` | Six exact configuration routines, three exact tables; WI43 |
| E45 | [Configuration validation](dc9-configuration-validation.json); `.venv/bin/python scripts/validate_dc9_configuration.py` | 542 strict and 492 conditional cases; construction stops before apply; WI43 |
| E46 | [Rectangle source](reconstructed/dc9-rectangles.json), [example](reconstructed/dc9-rectangles-asymmetric.example.json), [configuration run](community-configuration-workspace.json) | Explicit JSON-to-table-to-BIN build, six-byte experiment; WI44 |
| E47 | [Apply recovery](../scripts/reconstruct_dc9_apply.py), [apply validation](dc9-apply-validation.json); `.venv/bin/python scripts/validate_dc9_apply.py` | Six exact components and 2,965 strict cases, including supplied continuations; WI45 |
| E48 | [Latest run summary](community-apply-workspace.json); `.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-next-validation` | Archive, model, build and preservation results; WI46 |

The individual validator commands refresh their canonical JSON reports; use
the combined command with a fresh destination to retain an immutable run.
E44–E48 extend E40–E43 from the [timer report](2026-10-23_reverse-dc9-timer-report.md).
The older run directories and snapshots remain intact.

## Recovered components

Addresses are candidate application addresses; ends are exclusive.

| Component | Start | End | Bytes |
|---|---|---|---:|
| Six-layout configuration | `0x260824` | `0x260c02` | 990 |
| Channel record configuration | `0x23e7f6` | `0x23e8a2` | 172 |
| Selective record reset | `0x23e8a2` | `0x23e999` | 247 |
| Record byte +0x95 setter | `0x23e734` | `0x23e74a` | 22 |
| First size selector | `0x260459` | `0x26047c` | 35 |
| Second size selector | `0x26047c` | `0x26049f` | 35 |
| Layout apply orchestration | `0x23fad0` | `0x23fc0a` | 314 |
| Source-switch guard and orchestration | `0x23fc0a` | `0x23fd13` | 265 |
| Engine preparation guard | `0x204000` | `0x204059` | 89 |
| Channel update range | `0x22ac17` | `0x22aca0` | 137 |
| Channel metadata reset | `0x22aca0` | `0x22acf2` | 82 |
| Conditional polling wait | `0x2421d3` | `0x242247` | 116 |

New tables are the six-target dispatch at `0x328168` (24 bytes), rectangle
records at `0x3c5d10` (192 bytes), and reset template at `0x2af620` (8 bytes).
Names describe observed behavior rather than recovered vendor symbols.

## Findings

### F50: layout construction is editable and bounded by explicit apply stops

Evidence: E44, E45. Category: reverse_algo; severity: n/a_re. Status: validated
for the stated model contracts; confidence: high in exact bytes, conditional in
physical semantics. Location: `0x260824` and channel records at `0x4821ec`.

The routine resets four 168-byte records and dispatches layout IDs 0–5, with
active-record counts 1,2,2,2,3,4. Each rectangle comprises four little-endian
uint16 values, inferred as x/y/width/height from the constants and usage.
Configuration writes duplicate rectangle fields at offsets +0x18 and +0x20.
Record reset clears selected fields and preserves others; it is not memset.

Mode 0 constructs 0,0,3840,2160 directly and does not consume table group 0.
Mode 1's second record uses config-provided position and subtype-selected sizes
1344/756, 1536/864, 1728/972 or 1920/1080 for subtype 0–3; larger subtypes use
the table. Its x coordinate is aligned with `& 0xfffc`. Source IDs come from
configuration bytes, with a separate third source for mode 4; physical connector
names and GUI mode labels are not established.

All layout-construction runs stop before calls at `0x2608e5` or `0x260abe` to
`0x23fad0`. Two explicit wide-store policies agree on these final records because
the relevant ambiguous stores write zero. Default model execution still rejects
`bg.sw_1` and `bg.sh`. The added `bn.sh_2` encoder/model preserves the existing
low-halfword hypothesis; it is not an independent ISA reference.

### F51: structured geometry edits reach a complete experimental BIN

Evidence: E45, E46, E48. Category: reverse_algo; severity: n/a_re. Status:
validated offline; confidence: high. Location: table `0x3c5d10` and build tools.

`dc9-rectangles-v1` source requires six modes, four records per mode, and exactly
four uint16 fields per record. Wrong shapes, extra fields, booleans, strings,
floats and overflowing values are rejected. The workspace build requires both
`--experimental` and explicit `--rectangles`; merely editing the standalone
JSON does not implicitly replace the table in another build.

The example changes mode 2's first width to 1600, second x to 1600 and second
width to 2240. Only six expanded bytes change within `[0x1c5d50,0x1c5d60)`.
Conditional model comparisons cover all six layouts and confirm changed record
construction only for mode 2. The independent standalone and workspace builders
produce identical BINs. Their layout hashes differ because serialized layout
hashes include relocated source paths; that difference is expected.

No screen bounds or physical display constraints are certified by uint16 input
validation. The example is a development experiment, not an installable release.

### F52: apply has a separately testable record-copy continuation

Evidence: E47. Category: reverse_algo; severity: n/a_re. Status: validated for
isolated continuations; confidence: high for byte movement, unresolved for full
device behavior. Location: `0x23fad0..0x23fc0a`.

Apply first invokes metadata preparation, then multiple external services and
a four-engine loop. A later loop examines flag +0x81 of records 0–2, followed
by a mask at +0x2a for active records. This three-record loop is distinct from
the earlier four-engine preparation; their service effects remain unresolved.

For a selected mask bit, code copies eight bytes from channel record +0x18 to
`0x47fa9c + bit_index*124 + 0x20`, then calls `0x23d4fc`. Tests enter explicitly
after earlier external services, find the first set bit, verify exactly eight
ordered byte writes and stop before that call. Sixteen synthetic destinations
allow exercising uint16 masks; they do not imply sixteen physical engines.
An insufficiently mapped destination fails instead of silently discarding writes.

Full apply entry reaches the recovered metadata routine and then fails at
unrecovered service `0x23d3a0` if not explicitly stopped. No hardware service
is replaced with a successful stub. Return from a manually supplied empty-loop
continuation is not return from the complete apply routine.

### F53: guards and metadata operations provide additional contracts

Evidence: E47. Category: reverse_algo; severity: n/a_re. Status: validated under
model assumptions; confidence: high in isolated paths. Location: remaining five
new apply dependencies.

Source switching returns without external calls for selector >5 or zero record
masks; allowed cases stop before `0x22e68a`. Engine preparation similarly guards
indices >3. Configuration bit 0x20 or an inactive byte at `0x4551e8` bypasses the
polling routine. Otherwise tests stop before its ambiguous countdown store at
`0x2421fe`; no physical tick or poll-completion claim follows.

Update-range selector 4 denotes records 0–3; other tested selectors denote one
record. Its first action clears record byte +0x5b before calling `0x2271a9`.
Metadata reset selectively changes fields in six records of stride 176 at
`0x3b4950`, stopping at each isolated iteration's call to `0x20f1ef`.
Those tests supply the iteration state explicitly and do not simulate returns
from earlier services.

## Paths and next work

| Path | Type / start and goal | Evidence → finding → next step | Remaining uncertainty |
|---|---|---|---|
| P43 | callflow: config values → constructed channel records | E44/E45 → F50 → trace runtime configuration and source assignments | Reachability, connector identity, store semantics |
| P44 | solve: editable JSON → experimental BIN | E46/E48 → F51 → retain explicit input selection and checksum/resource checks for later edits | Actual display outcome and recovery |
| P45 | callflow: channel rectangle → downstream record | E47 → F52/F53 → recover `0x23d3a0`, `0x222804`, `0x21d1e5`, `0x21d2bf`, then consumer `0x23d4fc` | Earlier service state, remaining mask iterations, peripheral effects |

The next concrete source span is `0x23d3a0..0x23d4fc`: its observed mask loop
calls `0x222804`, reads metadata and dispatches to `0x21d1e5`/`0x21d2bf`.
Its instruction text was inspected, but it is not yet counted as reconstructed
source or behaviorally validated. Follow the dependencies rather than inventing
device responses to force complete apply execution.

CPU endianness/store semantics, a usable compiler/linker path, most application
functionality, EFE/USB source builds, backups/recovery and hardware validation
remain open. The percentage above does not estimate time to completion.

## Build identities and reproduction

All three current images are 2,069,060 bytes. The baseline is byte-identical;
the two experiments have different expanded application bytes and valid
container checksums, with eleven resource ranges preserved.

| Image | SHA256 |
|---|---|
| Stock baseline | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` |
| Helper experiment | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` |
| Layout experiment | `95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a` |

For a new workspace and layout build, from the repository root:

```bash
.venv/bin/python scripts/firmware_workspace.py prepare analysis/extracted/my-layout-workspace
.venv/bin/python scripts/firmware_workspace.py build analysis/extracted/my-layout-workspace --experimental --rectangles dc9/source/dc9-rectangles-asymmetric.example.json --output analysis/extracted/my-layout-workspace/build/layout.experimental.bin
```

Choose fresh paths; builders refuse overwrites. To reproduce all checks and
three builds together, use the E48 command with a new directory. Tool versions
are Python 3.12.15 and pypcode 4.0.1 with the previously pinned AEON SLEIGH;
compiled decoder and source hashes are included in validation reports.

Git remains `main` at `50dbabf`, without commits or publication. Configuration
work retained 137 starting files; apply work retained a further 150-file snapshot.
Six earlier workspaces and thirteen prior images were independently verified,
including the intermediate configuration workspace. Firmware-derived source/data remain excluded from the repository's
MIT grant. This report describes reproducible offline development progress,
not completion of the owner's firmware objective.
