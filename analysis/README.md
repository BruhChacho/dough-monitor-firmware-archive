# Firmware reconstruction

This directory contains the first reproducible reverse-engineering results.
**There is no complete, buildable replacement firmware yet.** The C files are
small, manually reconstructed routines with evidence and stated uncertainties.
Original vendor source names, comments, headers, and build systems have not
been recovered.

Start with the [latest format/build report](2026-10-20_reverse-spectrum-one-report.md)
or the [initial cross-family report](2026-10-19_reverse-dough-report.md).

## Results to explore

| Area | Result | Evidence |
|---|---|---|
| Spectrum One D02/D03/DC9 | Raw DEFLATE program recovered from all 13 distinct images | [Segment maps](mstar-layouts.json), [AEON excerpts](aeon-excerpts.md) |
| Spectrum One containers | Two CRC32s per image, 141 resource CRC16s, 13 byte-exact roundtrips | [Roundtrip results](mstar-roundtrips.json) |
| DC9 v101 build experiment | New DEFLATE stream with identical decoded program; hardware untested | [Recompression](dc9-recompression.json), [boot trace](mstar-boot-excerpts.md) |
| Spectrum One USB packages | Releases 17/18/19 share the same hub image and have different VL103R images | [Installer inventory](installers.json) |
| Glossy Spectrum One DC9 | Startup mapping and a table-search routine reconstructed | [Partial C](reconstructed/spectrum_one_helpers.c) |
| DC9 helper code generation | 13 assembly instructions reproduce the original 39 bytes exactly | [Assembly source](reconstructed/spectrum_one_table_helper.aeon.s), [build evidence](aeon-helper-build.json) |
| Spectrum Black 32 E91/EFE | A model-value write routine found in eight images | [Decoded code](black32-code.json), [partial C](reconstructed/black32_model_value.c) |
| Black 32 v1.0.19 variants | Nine changed bytes across the entire 1,638,400-byte image | [Comparisons](comparisons.json) |
| Black 27 E2D/E2F updater | Python entry recovered; start-flow checked against bytecode; communication module identified | [Flow analysis](reconstructed/black27-start-flow.md), [native metadata](updater.json) |
| All downloaded packages | 66 distinct archive members, including 35 raw images and five PE programs | [Inventory](inventory.json), [profiles](profiles.json) |

## Reproduce the analysis

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
3. **Update formats:** CRC32 and resource CRC16 validation and untouched
   reconstruction now pass. Resolve the main trailer's final two bytes and
   other validation consumers before treating recompressed images as releases.
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
