# Firmware reconstruction

This directory contains the first reproducible reverse-engineering results.
**There is no complete, buildable replacement firmware yet.** The C files are
small, manually reconstructed routines with evidence and stated uncertainties.
Original vendor source names, comments, headers, and build systems have not
been recovered.

Start with the [raw files and community build guide](../firmware/README.md),
the [latest engine-control report](2026-10-26_reverse-dc9-engine-control-report.md),
the [consumer milestone report](2026-10-25_reverse-dc9-consumers-report.md),
the [historical metadata report covering configuration, apply, routing and service milestones](2026-10-24_reverse-dc9-metadata-report.md),
the [timer, callback and combined-validation report](2026-10-23_reverse-dc9-timer-report.md),
the [transfer-source and store-hypothesis report](2026-10-23_reverse-dc9-transfer-report.md),
the [receive-source reconstruction report](2026-10-23_reverse-dc9-receive-report.md),
the [workspace and register-source report](2026-10-23_reverse-dc9-workspace-report.md),
the [command-path reconstruction and execution report](2026-10-22_reverse-dc9-module-report.md),
the [source baseline and command-routing report](2026-10-21_reverse-dc9-source-report.md),
the [corrected checksum and helper integration report](2026-10-21_reverse-dc9-validation-report.md),
or the [initial cross-family report](2026-10-19_reverse-dough-report.md).

The [2026-10-20 report](2026-10-20_reverse-spectrum-one-report.md) is historical:
its recompression experiment fails the subsequently recovered main CRC16.
The corrected baseline and helper rewrite pass offline validation, but neither
has been booted on a monitor or constitutes a complete firmware source build.
The current source overlay contains 126 components, 5,627 instructions and
17,432 code bytes (about 0.72% of the expanded application), plus 11 tables /
867 bytes. This percentage is a coverage proxy, not engineering or product
completion. The 2026-10-26 engine-control gate passed 148 repository tests,
2,078 strict cases, and 384 conditional cases. Across bounded cases, all 602
newly recovered instruction addresses were visited; this is not exhaustive
input or path coverage. The full-apply prefix completes the six-record metadata
reset and stops at `0x220bc7`, before unrecovered service `0x22607c`. Disable-
control cases return for 13 mapped fixture indices in normal mode; enabled
control and full apply remain incomplete. Earlier layout-setup results remain
historical snapshots. The combined gate retains three
2,069,060-byte BINs with unchanged hashes (`0b5d8350`, `d88a1683`, `95a06b2f`)
and eleven unchanged resource spans. The previous consumer gate passed 132 repository tests,
2,646 strict consumer cases, 262 strict register cases, and 5,336 conditional
cases.
Metadata uses plain-byte memory and does not model hardware. Layout geometry
remains inferred and untested on a display. The standalone
rectangle experiment SHA256 is
`95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a`.

## Results to explore

| Area | Result | Evidence |
|---|---|---|
| Community development workspace | Raw DC9/EFE images, lossless DC9 components, expanded code/resources, editable source, separate USB hub/VL103R binaries; latest engine-control gate passed 148 tests | [Build guide](../firmware/README.md), [engine-control report](2026-10-26_reverse-dc9-engine-control-report.md), [workspace summary](community-engine-control-workspace.json), [latest validation](extracted/firmware-validation-engine-control-2026-10-26/validation.json), [latest workspace](extracted/firmware-validation-engine-control-2026-10-26/workspace/README.md) |
| DC9 partial source baseline | Current overlay: 126 components (17,432 code bytes; 5,627 instructions), 11 tables (867 bytes); byte-identical stock BIN retained | [Build evidence](dc9-source-baseline.json), [source layout](reconstructed/dc9-source-layout.json), [engine-control report](2026-10-26_reverse-dc9-engine-control-report.md), [current builds](extracted/firmware-validation-engine-control-2026-10-26/workspace/build/) |
| DC9 layout configuration | Historical configuration milestone: 98 repository tests; 542 strict and 492 conditional cases; six layouts; six expanded bytes changed in rectangle example | [Configuration section](2026-10-24_reverse-dc9-configuration-report.md), [historical validation](extracted/firmware-validation-configuration-2026-10-23/validation.json) |
| DC9 apply guards | 102 tests passed; 2,965 strict apply cases using explicitly supplied continuation states; full apply not executed | [Configuration and apply report](2026-10-24_reverse-dc9-configuration-report.md), [latest validation](extracted/firmware-validation-apply-2026-10-24/validation.json), [apply summary](community-apply-workspace.json) |
| DC9 metadata routing and masked-register paths | Historical 79-component gate passed 115 tests; 2,433 strict and 290 conditional metadata cases; 32 default masked-store rejections and 64 conditional cases across two policies | [Metadata report](2026-10-24_reverse-dc9-metadata-report.md), [validation](extracted/firmware-validation-metadata-2026-10-24/validation.json), [routing summary](community-metadata-routing-workspace.json) |
| DC9 metadata service | Historical 83-component gate passed 118 tests; 2,833 strict and 150 conditional cases. Both enable states stopped before service `0x20e76c`; publication tail was tested independently | [Metadata report](2026-10-24_reverse-dc9-metadata-report.md), [validation](extracted/firmware-validation-metadata-service-2026-10-24/validation.json), [service summary](community-metadata-workspace.json) |
| DC9 layout setup (historical snapshot) | Its gate passed 142 repository tests, 259 strict setup cases, and 46 conditional cases. Its full-apply prefix stopped at `0x220aa3`, before `0x21d3b1` | [Layout-setup report](2026-10-25_reverse-dc9-layout-setup-report.md), [validation](extracted/firmware-validation-layout-setup-2026-10-25/validation.json), [summary](community-layout-setup-workspace.json) |
| DC9 engine control | Latest gate: 148 repository tests, 2,078 strict cases, 384 conditional cases; 602 new instruction addresses visited in bounded cases. Full apply stops at `0x220bc7` before `0x22607c` | [Engine-control report](2026-10-26_reverse-dc9-engine-control-report.md), [validation](extracted/firmware-validation-engine-control-2026-10-26/validation.json), [validator results](dc9-engine-control-validation.json), [summary](community-engine-control-workspace.json) |
| DC9 metadata consumers | Historical gate passed 132 tests; 2,646 strict consumer cases, 262 strict register cases, and 5,336 conditional cases. Accumulation and six-record reset modeled under both store policies; full apply at that snapshot stopped at `0x23faf2` before `0x22dc46` | [Consumer report](2026-10-25_reverse-dc9-consumers-report.md), [validation](extracted/firmware-validation-metadata-consumers-2026-10-25/validation.json), [summary](community-metadata-consumers-workspace.json) |
| DC9 timer and callback paths | 424 strict timer cases, 3,760 conditional timer cases, 2,130 strict callback/dispatch cases; explicit partial paths and interleaving assumptions | [Timer validation](dc9-timer-validation.json), [callback validation](dc9-callback-validation.json), [timer trace](dc9-timer-path.json) |
| DC9 transfer dependencies | 1,832 cases rejecting ambiguous stores, 218 separate store-hypothesis experiments, including selected complete follow-up/transmit paths | [Transfer validation](dc9-transfer-validation.json) |
| DC9 receive/transmit service | Full handler and thirteen channel/state helpers reconstructed; 29,495 plain-memory cases including explicitly partial paths | [Receive validation](dc9-receive-validation.json), [control flow](dc9-receive-path.json) |
| DC9 register access | 266 plain-memory cases for byte/16-bit access, broadcast writes and slot selection; masked-update source recovered with unresolved store width | [Register validation](dc9-register-validation.json) |
| DC9 RAM command path | Command `0x32`, three-plane data operations, parent selector path, 218 helper comparisons through callers; explicit CALL hypothesis | [Bounded validation](dc9-module-validation.json), [packet entry](dc9-packet-entry.json) |
| DC9 receive/register path | Eight-slot consumer, receive count/length/state fields, static register base `0xa0000000` and five channel-offset cases | [Ingress](dc9-ingress-path.json), [register mapping](dc9-register-map.json) |
| DC9 command routing | Selector `0xcc`, three command groups, precedence and secondary switch map; CALL-model gap identified | [Routing evidence](dc9-command-routing.json) |
| Spectrum One D02/D03/DC9 | Raw DEFLATE program recovered from all 13 distinct images | [Segment maps](mstar-layouts.json), [AEON excerpts](aeon-excerpts.md) |
| Spectrum One containers | Main CRC16 and two CRC32s per image, 141 resource CRC16s, 13 byte-exact roundtrips | [Roundtrip results](mstar-roundtrips.json) |
| DC9 v101 corrected baseline | New DEFLATE stream with identical decoded program and all three checksums valid | [Corrected recompression](dc9-recompression-corrected.json), [independent audit](dc9-experiment-audit.json) |
| DC9 helper integration | 1,557 bounded comparisons; 29 changed bytes within one 39-byte routine; hardware untested | [Helper experiment](dc9-helper-experiment.json), [emulation](aeon-rewrite-validation.json) |
| Spectrum One USB packages | Releases 17/18/19 share the same hub image and have different VL103R images | [Installer inventory](installers.json) |
| Glossy Spectrum One DC9 | Startup mapping and a table-search routine reconstructed | [Partial C](reconstructed/spectrum_one_helpers.c) |
| DC9 helper code generation | 13 assembly instructions reproduce the original 39 bytes exactly | [Assembly source](reconstructed/spectrum_one_table_helper.aeon.s), [build evidence](aeon-helper-build.json) |
| Spectrum Black 32 E91/EFE | A model-value write routine found in eight images | [Decoded code](black32-code.json), [partial C](reconstructed/black32_model_value.c) |
| Black 32 v1.0.19 variants | Nine changed bytes across the entire 1,638,400-byte image | [Comparisons](comparisons.json) |
| Black 32 trailer constraints | 11 originals checked; simple whole-body sums/XOR and 512 CRC8 hypotheses do not explain the final byte across five variant pairs | [Integrity probe](black32-integrity-probe.json) |
| Black 27 E2D/E2F updater | Python entry recovered; start-flow checked against bytecode; communication module identified | [Flow analysis](reconstructed/black27-start-flow.md), [native metadata](updater.json) |
| All downloaded packages | 66 distinct archive members, including 35 raw images and five PE programs | [Inventory](inventory.json), [profiles](profiles.json) |

## Reproduce the analysis

Run the combined offline gates and build fresh firmware files:

```bash
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-validation
```

This requires the existing local extraction and decoder setup described below.
It writes only a new generated directory, preserving earlier reports and builds.
See the [build guide](../firmware/README.md#validate-and-build-everything-offline)
for outputs and validation limits.

Build the pinned stock baseline from recovered assembly plus the vendor remainder:

```bash
.venv/bin/python scripts/build_dc9_source_baseline.py --output analysis/extracted/rebuild/dc9-v101-source.baseline.bin
```

Existing outputs are never overwritten; use a fresh filename on repeat runs.
Baseline mode rejects changed source. For named same-size replacements, see the
[explicit experimental build command](2026-10-21_reverse-dc9-source-report.md#build-and-reproduce).
Neither mode certifies device compatibility or hardware operation.

For the transferred Ubuntu checkout, use `.venv/bin/python` from the repository
root. Python 3.12.15, pypcode 4.0.1 and zlib 1.3.2 were used for the latest
validation. The helper scripts prepend `.tools/python`, which in this checkout
links to the virtualenv's packages; the validation JSON records the resolved module
path, version and compiled SLEIGH hash. No dependency installation or network
access was needed. See the [latest report's commands](2026-10-21_reverse-dc9-validation-report.md#reproduce)
for the offline validation sequence and fresh experimental output names.

The following is the original setup and cross-family analysis procedure:

Run from the repository root with Python 3.12 and the ZIP files present
(`git lfs pull` if necessary). Python 3.12 was used for the results here;
the machine's older Python 3.8 had a Windows path-resolution failure.
Dependencies are installed into this checkout, without modifying global Python.

```text
python -m pip install --only-binary=:all: --target .tools/python -r scripts/analysis-requirements.txt
python scripts/analyze_firmware.py
python scripts/unpack_mstar.py
python scripts/compare_firmware.py
python scripts/inspect_black32.py
python scripts/inspect_updater.py
python scripts/prepare_aeon.py --download
python scripts/disassemble_samples.py
python scripts/test_analysis.py
python scripts/roundtrip_mstar.py verify-corpus
python scripts/inspect_mstar_boot.py
python scripts/build_aeon_helper.py
```

The first and seventh commands can access the network. Subsequent runs of
`prepare_aeon.py` use the local archive and may omit `--download`. The source
archive is pinned by commit and SHA256; an unexpected archive is rejected.
The compiler processes the SLEIGH processor definition only.

The analysis commands parse bytes. They do not load vendor DLLs, launch
updaters, execute recovered bytecode, or access a monitor.

On Windows, `python scripts/extract_installers.py --download` obtains the
pinned official innoextract 1.9 distribution if absent, checks its SHA256,
checks the extractor executable against that archive, and extracts four known
installers. Later runs can omit `--download`. This runs the extraction utility,
never the extracted vendor applications. On the analysis machine the 32-bit
utility needed execution outside the Windows application sandbox.

See the [reconstruction commands](2026-10-20_reverse-spectrum-one-report.md#reproduce-the-two-reconstruction-experiments)
for component export/reassembly and the explicitly experimental DC9 recompressor.

With a C compiler, check the reconstructed snippets without running them:

```text
gcc -std=c11 -Wall -Wextra -Werror -fsyntax-only analysis/reconstructed/spectrum_one_helpers.c analysis/reconstructed/black32_model_value.c
```

### Generated files

`analysis/extracted/<sha256>/` holds derived copies and is excluded from Git.
Each original member has provenance in `inventory.json`.

For Spectrum One, `expanded.aeon.bin` combines the `0x3800`-byte uncompressed
prefix with the recovered DEFLATE output. `expanded.strings.json` records
strings by expanded-image offset. This expanded image is an analysis view,
**not a flashable update**.

For the Black 27 updater, the `carchive/` directory contains:

- `main.recovered.py.txt`: complete decompiler output for the entry script,
  with known control-flow errors; keep it as evidence.
- `main.bytecode.txt`: independent Python 3.7 disassembly for checking that
  output.
- The selected native ISP tools, DLLs, configuration, and embedded image.

## Tool provenance

Python library versions are pinned in
[`analysis-requirements.txt`](../scripts/analysis-requirements.txt).
The AEON definition is
[shinyquagsire23/ghidra-aeon at de8a253](https://github.com/shinyquagsire23/ghidra-aeon/tree/de8a2539d474efa409ba458c565bc74f9e5e0b1d).
The local preparation script removes two invalid, unused `(4,2)` token
declarations so the definition compiles with the bundled SLEIGH compiler.
It checks that each declaration has no other references before changing it.
No instruction constructors are changed.

That AEON definition is incomplete and emits compiler warnings. Its output
must be checked before relying on instruction semantics. The MIPS16 decoder
comes from pypcode's bundled Ghidra definitions; it decodes the recovered
Black 32 routine but does not establish the exact Realtek CPU core or decode
all bytes in the image.

## Work toward maintainable source

1. **Spectrum One:** trace callers of recovered functions, identify OSD,
   input switching, backlight, USB policy, and display timing modules;
   attach names only when callers or data establish their meaning.
2. **Black 32:** establish runtime mapping and remaining instruction support;
   trace references to the model-value address and recover larger functions.
3. **Update formats:** normalized main CRC16, both CRC32s, resource CRC16s and
   untouched reconstruction now pass. Trace other validation consumers and
   hardware constraints before considering any release.
4. **USB hub firmware:** installers are extracted and hub/PD payloads separated;
   recover their code and update protocols with model-specific evidence.
5. **Buildability:** reconstruct dependencies, linker layout, startup,
   peripheral definitions, and reproducible compiler settings. A collection
   of C snippets is not sufficient to build working monitor firmware.

Contributions should include the exact input SHA256, address convention,
tool version, reproduction command, and evidence supporting each symbol name.
See the [report's limits](2026-10-19_reverse-dough-report.md#limits-and-next-validation)
before proposing hardware tests.

## Rights

The project's independently written analysis scripts and prose use the
repository license. Firmware-derived disassembly, extracted programs, data
tables, and reconstructed code remain subject to their respective rights
holders' rights; they are excluded from the project's MIT grant. Publishing
analysis does not turn the vendor firmware into original open-source code.
