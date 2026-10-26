# Community firmware development

The development workspace contains raw firmware inputs, decompressed DC9 code
and resources, editable reconstructed assembly, and an offline source-to-BIN
build. The current source overlay contains 126 components (5,627 instructions;
17,432 code bytes) and 11 tables (867 bytes), retaining the rest of the
archived vendor image. The 2026-10-26 combined gate passed 148 tests, 2,078
strict cases, and 384 conditional cases. The 0.718% code-bytes/application-bytes
ratio is a coverage proxy, not a measure of engineering or product completion.
Fully editable firmware and a hardware-tested community release remain open
goals.

## Open the files

The latest prepared workspace is [firmware-validation-engine-control-2026-10-26/workspace](../analysis/extracted/firmware-validation-engine-control-2026-10-26/workspace/README.md).
Its combined gate passed. Workspace files are generated locally and
ignored by Git. Earlier layout-setup, consumer, configuration, apply,
metadata-routing, community, receive, transfer, timer, and combined validation
workspaces remain intact as historical snapshots.

| File or directory inside the workspace | Purpose |
|---|---|
| `dc9/original.bin` | Complete DC9 v101 rev1148 scaler image |
| `dc9/components/` | Lossless boot/header, compressed application, resources, padding and checksum components |
| `dc9/raw/application.bin` | Decompressed application, 2,426,560 bytes; candidate address `0x203800` |
| `dc9/raw/ap-prefix.bin` | Separate 14,336-byte AP prefix |
| `dc9/raw/resources/` | Eleven decoded or raw resource payloads; filenames identify padding retained where length is unknown |
| `dc9/source/*.aeon.s` | Editable reconstructed assembly |
| `dc9/source/layout.json` | Routine addresses, lengths, original hashes and editable table values |
| `dc9/source/dc9-rectangles.json`, `dc9/source/dc9-rectangles-asymmetric.example.json` | Structured stock rectangles and an editable example, selected explicitly with `--rectangles` |
| `dc9/source/alternatives/secondary-helper-rewrite.aeon.s` | Existing table-helper rewrite for a reproducible source-edit experiment |
| `efe/original.bin` | Complete ES07EFE v1.0.19 image, 1,638,400 bytes; raw reference only |
| `usb/vl822-hub-06a4.bin` | Raw 42,556-byte USB hub image from the separately archived USB package |
| `usb/vl103r-0a.89.19.02.bin` | Raw 32,768-byte VL103R image from that package |
| `manifest.json`, `usb/manifest.json` | SHA256 identities, roles and provenance |

These exports are firmware code/data and container components. A Linux root
filesystem or the original vendor source tree has not been identified here.
The USB files are separate build targets; the scaler build does not rebuild them.
The EFE integrity field, EFE repacking, and USB source builds remain unresolved.

## Validate and build everything offline

With the existing local archive extraction, Python environment and pinned AEON
decoder prepared, run this from the repository root:

```bash
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-validation
```

Choose a new output directory for each run. The command checks all package
hashes, the Spectrum One checksum/reconstruction corpus, repository tests,
command/register/receive/transfer/timer/callback/configuration/apply/metadata,
metadata-consumer, layout-setup and engine-control contracts, and helper
rewrite equivalence. The latest engine-control gate passed 148 repository
tests, 2,078 strict cases, and 384 conditional cases. The previous consumer
milestone passed 132 repository tests, 2,646 strict consumer cases,
262 strict register cases, and 5,336 conditional cases. The historical
metadata-service milestone passed 118 tests and contains 2,833 strict plus 150
conditional service cases. Its 79-component metadata-routing
predecessor passed 115 tests, 2,433 strict and 290 conditional metadata cases,
and 32 default masked-store rejections plus 64 conditional cases. Earlier apply
validation passed 102 tests and 2,965 strict cases; configuration passed 98
tests, 542 strict cases and 492 conditional cases. The command then exports a
raw development workspace and builds the stock baseline, helper experiment and
layout experiment.
Each stage writes a JSON report; `tests.log`
contains the test results, and `validation.json` records the final outcome,
source identities and generated artifact hashes. A failure leaves a failed
record and returns nonzero. Python `-O` is rejected because it disables contract
assertions. Existing outputs are never reused or overwritten.

The command uses local files and performs no downloads or device operations.
For initial archive extraction and decoder preparation, see
[analysis setup](../analysis/README.md#reproduce-the-analysis).
An offline pass does not establish a complete source build or monitor operation;
both fields remain explicitly false in the validation report.

## Build and edit

Run commands from the repository root using the existing `.venv/bin/python`.
For a new workspace, choose a directory that does not exist:

```bash
.venv/bin/python scripts/firmware_workspace.py prepare analysis/extracted/my-firmware
.venv/bin/python scripts/firmware_workspace.py export-usb analysis/extracted/my-firmware
.venv/bin/python scripts/firmware_workspace.py verify analysis/extracted/my-firmware
.venv/bin/python scripts/firmware_workspace.py build analysis/extracted/my-firmware --output analysis/extracted/my-firmware/build/stock.baseline.bin
```

Preparation uses the locally extracted archive inputs. USB export reads the
already extracted, pinned installer contents without executing the installer.
Subsequent builds use the workspace's own component files and source. Keep the
repository scripts and Python environment available; the workspace does not
bundle an independent compiler toolchain.

Edit the `.aeon.s` files or table values under `dc9/source/`. Preserve each
routine's original address and encoded length. Use an explicit experimental
build for changes:

```bash
.venv/bin/python scripts/firmware_workspace.py build analysis/extracted/my-firmware --experimental --output analysis/extracted/my-firmware/build/my-change.experimental.bin
```

To try the included helper rewrite without editing the active source file:

```bash
.venv/bin/python scripts/firmware_workspace.py build analysis/extracted/my-firmware --experimental --replace-source command_group_secondary=dc9/source/alternatives/secondary-helper-rewrite.aeon.s --output analysis/extracted/my-firmware/build/helper.experimental.bin
```

Structured rectangle JSON is included in the workspace but is not applied
automatically. Select it explicitly for an experimental build:

```bash
.venv/bin/python scripts/firmware_workspace.py build analysis/extracted/my-firmware --experimental --rectangles dc9/source/dc9-rectangles-asymmetric.example.json --output analysis/extracted/my-firmware/build/layout.experimental.bin
```

The rectangle coordinates and dimensions are inferred. This example changes
six expanded application bytes and changes mode 2 widths from 1920/1920 to
1600/2240. No display output was rendered and no hardware behavior was tested.

Each build writes a JSON sidecar containing hashes, instruction listings,
changed expanded offsets and checksum results. Existing BINs and sidecars are
never overwritten. Baseline mode requires exact original assembly and tables.
Experimental mode recompresses the program and regenerates all three checksums;
it rejects growth beyond the original allocation. Raw references and container
components are immutable inputs; editing them is rejected, not incorporated
as a source change.

The latest workspace contains
[`dc9-v101.baseline.bin`](../analysis/extracted/firmware-validation-engine-control-2026-10-26/workspace/build/dc9-v101.baseline.bin),
[`dc9-v101-helper.experimental.bin`](../analysis/extracted/firmware-validation-engine-control-2026-10-26/workspace/build/dc9-v101-helper.experimental.bin),
and [`dc9-v101-layout.experimental.bin`](../analysis/extracted/firmware-validation-engine-control-2026-10-26/workspace/build/dc9-v101-layout.experimental.bin).
Each file is 2,069,060 bytes; their SHA256 prefixes are `0b5d8350`, `d88a1683`,
and `95a06b2f`, respectively. All eleven resource spans are unchanged in each
build. No experimental output has been booted on a monitor.

The engine-control validator covers metadata-index guards and key dispatch,
register readers, selected masked writes, and a full-apply prefix. All 602 new
instruction addresses were visited in bounded cases, not exhaustively over all
inputs or paths. The prefix completes the six-record metadata reset, then stops
at `0x220bc7` before unrecovered service `0x22607c`. Disable-control cases
return for 13 mapped fixture indices in normal mode; enabled control and full
apply remain incomplete. The 2026-10-26 [report](../analysis/2026-10-26_reverse-dc9-engine-control-report.md),
[validation](../analysis/extracted/firmware-validation-engine-control-2026-10-26/validation.json),
and [workspace summary](../analysis/community-engine-control-workspace.json)
record the evidence. Layout-setup results below are historical snapshots.

The metadata validator maps an engine's metadata index through the observed key
and bank arithmetic to paged register addresses. Its bus fixture is ordinary
memory; it does not emulate page windows, hardware registers, timing, or
peripherals. The previous consumer validation modeled complete metadata
accumulation and the six-record reset under two ambiguous counter-store
hypotheses. The historical layout-setup prefix reached `0x220aa3` and stopped
before `0x21d3b1`; it does not complete the thirteen-record path. Selected setup paths
complete only under conditional store hypotheses.
Earlier validation stopped at `0x22acd1`, before external service `0x20f1ef`;
that is a historical prefix boundary.
The register-write tests preserve a successful low-byte write when the
following high-byte access fails, so these modeled writes are not transactional.
`r23` is observed clobbered by `register_write8`; tested stack and saved-register
checks pass under the model.

See the [layout-setup report](../analysis/2026-10-25_reverse-dc9-layout-setup-report.md)
and [workspace summary](../analysis/community-layout-setup-workspace.json).
The historical [consumer report](../analysis/2026-10-25_reverse-dc9-consumers-report.md)
and [summary](../analysis/community-metadata-consumers-workspace.json) remain available.
Historical detail is in the
[metadata report](../analysis/2026-10-24_reverse-dc9-metadata-report.md) and
[service workspace summary](../analysis/community-metadata-workspace.json).

## Grow the source build

The versioned source of record is
[`analysis/reconstructed/dc9-source-layout.json`](../analysis/reconstructed/dc9-source-layout.json)
and its assembly files. Workspace edits are local until deliberately copied
back to those files for review. New reconstruction should identify complete
instruction boundaries, preserve original code hashes, re-encode exactly, and
validate behavior under explicit assumptions before substituting code.

The configuration milestone added channel layout configuration, record
contracts and editable rectangle data; the apply milestone added six components
and bounded strict-guard coverage. The metadata-routing milestone added 11
components and four encoder forms. Its validator recorded 2,433 strict and 290
conditional cases, with complete mask preparation modeled from `0x23d3a0` under
two explicit counter-store policies. The historical 83-component metadata-service
milestone added four components (state accumulator, selector, shared publication
tail and trampoline) plus a 32-byte selector table. It passed 2,833 strict and
150 conditional service cases. Selector values map in this order:
`0x80, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40`; physical channel meaning is
unknown.

The historical consumer milestone models metadata accumulation through the
six-record reset under both explicit store policies. The historical
layout-setup snapshot extended the full-apply prefix to `0x220aa3`, before
`0x21d3b1`; its thirteen-record path was not complete. The mapped
register bus is plain memory, with no page-window, peripheral or timing
behavior. The observed metadata key/bank arithmetic and `r23` clobbering
through `register_write8` do not establish hardware register or connector
identities. Masked-register checks include 32 default rejections and 64
conditional cases across two store policies; a successful low-byte write
remains visible if the next byte access fails. No hardware behavior was tested.
See the [consumer report](../analysis/2026-10-25_reverse-dc9-consumers-report.md),
[consumer summary](../analysis/community-metadata-consumers-workspace.json),
[historical metadata report](../analysis/2026-10-24_reverse-dc9-metadata-report.md),
[historical metadata summary](../analysis/community-metadata-workspace.json),
[79-component routing summary](../analysis/community-metadata-routing-workspace.json),
[historical apply report](../analysis/2026-10-24_reverse-dc9-configuration-report.md)
and [historical apply summary](../analysis/community-apply-workspace.json).
The earlier rectangle geometry interpretation remains inferred and untested.
Earlier modules include timer countdowns, delay waits, callback initialization,
and timer registration/dispatch. Earlier modules cover indirect writers,
channel lookup, frame copying, response formatting and transmit preparation.
The model rejects ambiguous
`bg.sw_1` and `bg.sh` stores by default. Separate conditional experiments use
explicit store hypotheses to exercise selected response/transmit paths and
delay waits with scheduled execution of recovered timer prefixes. The countdown
and neighboring flag provide a stronger constraint on store width, while the
physical ISA and clock remain unverified. Register tests use plain mapped bytes,
without peripheral side effects. See the
[timer and callback report](../analysis/2026-10-23_reverse-dc9-timer-report.md)
for timer evidence and limitations. The current source overlay is about 0.72%
of the expanded application; this is a coverage proxy, not engineering or product
completion. Most functionality still resides in the pinned vendor remainder.

Original project tools/prose use the repository license. Firmware-derived
assembly, data and vendor binaries are excluded from the repository MIT grant.
