# Dough firmware reconstruction: first milestone

Analysis began 2026-10-13; continuation and report dated 2026-10-19.
Scope: [offline archive analysis](scope.md).

Historical milestone: see the [2026-10-20 continuation](2026-10-20_reverse-spectrum-one-report.md)
for subsequently recovered checksums, resource framing and reconstruction work.

## Summary

All 45 archived ZIPs were verified against the preservation manifest and
inventoried. We recovered the compressed program from every one of the 13
distinct Spectrum One images, established a plausible AEON memory layout,
and reconstructed a small helper in C. For Spectrum Black 32, we decoded a
model-value write routine in eight images and measured exactly nine differing
bytes between the matte and Gorilla Glass v1.0.19 images. For the older Black
27 updater, we recovered its Python entry script, checked the start flow
against bytecode, and identified the matching native communication module.
These are initial source-reconstruction artifacts; a complete firmware source
tree, build, and hardware validation remain outstanding.

The owner's descriptions are consistent with glossy Spectrum One and Gorilla
Glass Spectrum Black 32. ES07DC9 and ES07EFE are the working priorities.
The physical labels have not been checked, so this is not a declaration of
the owner's exact hardware revisions.

## Corpus and platform evidence

| Family | Raw images in corpus | Observed platform evidence | Current interpretation |
|---|---:|---|---|
| Spectrum One D02/D03/DC9 | 13 | `MST9U4` at raw `0xff00`; coherent 8051 and AEON regions; DEFLATE program | MStar target with multiple code regions |
| Black 27 E2D/E2F | 3 | 8051 reset/interrupt vectors; repeated bank metadata | Banked 8051 firmware; exact chip unconfirmed |
| Black 32 E91/EFE | 11 | `RTD2739LUF-M32E` in latest identity blocks; MIPS16-compatible code | Realtek target; exact core and full memory map unresolved |
| Black 27 480 Hz EF5/EFB | 8 | Realtek-family identity metadata and similar image layout | Separate model family requiring its own validation |

There are 35 distinct raw images, five distinct PE programs and 26 other
distinct ZIP/7z members. The Black 27 updater contains an additional distinct
raw image, recorded separately as embedded content. Counts describe bytes
deduplicated by SHA256, not the number of retail releases.

PE import/export tables, section sizes, entropy, and overlays are recorded
in [profiles.json](profiles.json) and [updater.json](updater.json).
The firmware images have no PE/ELF import tables; identifying their internal
dependencies requires further code analysis. Recognizable strings and entropy
alone do not prove a processor architecture, compression, or encryption.

## Spectrum One program extraction

For all 13 images, the following relationships hold:

| Raw file location | Observed value or relationship |
|---|---|
| `0x10000`, little-endian u32 | Segment start `0x30080` |
| `0x10004` | Candidate load base `0x200000` |
| `0x10008` and `0x1000c` | Address-end minus base equals file-end minus segment start |
| `0x10014` | Unresolved 32-bit field; checksum role is unconfirmed |
| `0x10020` | File size minus four bytes |
| `0x30080..0x3387f` | `0x3800`-byte uncompressed prefix |
| `0x33880` | Start of a raw DEFLATE stream |
| Immediately after DEFLATE end | Four-byte little-endian expanded-stream size, then two unresolved bytes |

The parser validates segment bounds, DEFLATE end-of-stream, the six-byte
trailer, and agreement between actual and stored expanded length. All 13
images pass. This identifies compression through successful decoding and
consistent metadata, rather than guessing from entropy.

For **ES07DC9 v101 rev1148**:

- Raw SHA256:
  `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`.
- Compressed stream: `[0x33880, 0x125ad5)`, 991,829 bytes.
- Expanded stream: 2,426,560 bytes (`0x2506c0`).
- Prefix plus expanded stream: 2,440,896 bytes (`0x253ec0`).
- Expanded-image SHA256:
  `eb33d20fec6006b092ab951bf1d194109c8d88fa53785ce45af77118d84c29bc`.

Mapping that analysis image at `0x200000` puts its end at `0x453ec0`.
The startup excerpt initializes a zeroing loop beginning at precisely that
address, ending at `0x48e2c0`. This supports the proposed mapping and a BSS-like
region, but is not a runtime measurement. The original uncompressed prefix
contains startup at offset `0x100`; expanded program bytes begin at offset
`0x3800`.

The [AEON excerpts](aeon-excerpts.md) also identify a table membership routine
at candidate address `0x204059`, using 41 bytes at `0x2aed7c`.
The [reconstructed C](reconstructed/spectrum_one_helpers.c) preserves its
32-bit comparison argument and boolean result. Its application-level meaning
is unknown; no menu/DDC meaning is assigned to the table.

Version comparison is still preliminary. D03 v108 versus DC9 v101 differs
in 978,768 raw overlapping bytes. Compressed and shifted code makes a byte
count unsuitable as a count of logical changes. The expanded comparison is
also recorded for later function alignment.

## Spectrum Black 32 code and model differences

For v1.0.19, the two samples are:

| Model | SHA256 |
|---|---|
| ES07E91 | `c54e56344cf286648603514900ec63fdddad20409a931e5886f09e5b67fdcb5f` |
| ES07EFE | `e3eeedada1464cfb65b927ed2877ebbeffff0d59ba2d793f0c18ddf7cb8ebd40` |

Both are `0x190000` bytes. Exactly nine bytes differ:

| File offset | E91 → EFE | Interpretation |
|---|---|---|
| `0x33aa` | `01 → 00` | Immediate in a decoded model-value routine |
| `0xcf077` | `31 → 30` | ASCII `3201 → 3200` |
| `0xcf085`, `0xcf086` | `39 31 → 46 45` | ASCII model `ES07E91 → ES07EFE` |
| `0xcf311`, `0xcf312` | `39 31 → 46 45` | Second ASCII model instance |
| `0x10d734`, `0x10d735` | `14 0c → 1e 1d` | Candidate glyph-coded model label |
| `0x18ffff` | `42 → fc` | Final-byte integrity-field candidate; algorithm unconfirmed |

The routine at file offset `0x33a4` decodes as:

```text
lui v0, 0xa010
li  v1, 0x3200       ; EFE; E91 uses 0x3201
sh  v1, 0x2eda(v0)
jr  ra
nop
```

The resulting store address is `0xa0102eda`. This exact routine is present at
the same offset in v1.0.14, v1.0.16, v1.0.17 and v1.0.19 of both models.
The signature was not found in v1.0.6/.13; this does not establish that those
versions lack equivalent functionality. The destination might be a
memory-mapped register or a memory region; its role has not been proved.

The candidate glyph-coded name at `0x10d72f` is seven bytes long. Interpreting
digits with base `0x0b` and uppercase letters with base `0x19` yields
`ES07E91` and `ES07EFE`. This is a consistent candidate character mapping,
not a recovered general OSD text renderer.

[black32-code.json](black32-code.json) records the bytes and decoder output;
[the C reconstruction](reconstructed/black32_model_value.c) expresses the
store. Coherent MIPS16 decoding of this routine does not resolve unsupported
encodings elsewhere or identify the precise CPU model. At raw offset zero,
the stock decoder rejects the first halfword; skipping it produces some
coherent instructions, but arbitrary skipping is not a validated disassembly
method.

The images' similarity is useful for shared analysis. It does **not**
establish safe interchangeability. No cross-flashing recommendation follows
from this result.

## Black 27 updater and transport

The x64 Windows launcher is a PyInstaller package containing Python 3.7
bytecode, a Qt UI, and native x86 ISP utilities. The parser found 1,668
CArchive entries and selected 25 project/tool members. It never imported
or executed their code.

The recovered Python entry is useful, but uncompyle6 placed part of
`on_start_pressed` inside an unreachable branch. Independent xdis output
resolves the actual flow: device and filename checks, emulation check,
remove staged BINs, copy selection, calculate bank count, and signal the
worker. Details and bytecode offsets are in the
[start-flow analysis](reconstructed/black27-start-flow.md).

The UI matches USB VID/PID `0x0bda:0x5411`. Its worker passes start bank 32,
flag address `0x34f8fe`, flag bytes `aa 55`, and communication selector 6 to
the native tool. In `Comm_UsbHubI2C.dll`, `GetCommID` at RVA `0x3cf0` is
`mov eax,6; ret`. The other communication modules return different IDs.
This strongly identifies the intended module as USB hub I2C. Dispatcher
execution, the USB requests, I2C transactions, and flash validation are not
yet reconstructed.

An embedded image has SHA256
`3a2ae89dafdeb1762136240cd3787e1dc53ccdd77ba29ff886f36afa785f1ec3`,
different from standalone v005/Beta006/v008. Its version remains unknown;
it is not added to the public firmware-selection index as a named release.

The USB-hub upgrade installers and the MStar ISP installer expose Inno Setup
markers. Extracting their inner programs/payloads remains outstanding.

## Evidence and findings

All rows were observed during the 2026-10-13/19 analysis. Machine-readable
artifacts retain complete sample SHA256 hashes and provenance. Commands below
are run from the repository root after the
[dependency setup](README.md#reproduce-the-analysis).

| Evidence ID | Source/artifact | Reproduction command |
|---|---|---|
| E01 | Manifest-verified ZIP members → [inventory](inventory.json), [profiles](profiles.json) | `python scripts/analyze_firmware.py` |
| E02 | 13 hashed raw images → [segment maps](mstar-layouts.json) | `python scripts/unpack_mstar.py` |
| E03 | Hashed DC9 expanded image → [instruction excerpts](aeon-excerpts.md) | `python scripts/disassemble_samples.py` |
| E04 | Hashed model/version pairs → [comparisons](comparisons.json) | `python scripts/compare_firmware.py` |
| E05 | 11 hashed Black 32 images → [routine/identity evidence](black32-code.json) | `python scripts/inspect_black32.py` |
| E06 | Hashed updater → [CArchive/PE/export evidence](updater.json), local bytecode listing | `python scripts/inspect_updater.py` |

| Finding | Evidence | Location | Status / confidence |
|---|---|---|---|
| F01: Spectrum One raw-DEFLATE container layout | E01, E02 | Header `0x10000`, stream `0x33880` | Validated on corpus / high |
| F02: Expanded AEON base and BSS-like interval | E02, E03 | Base `0x200000`, startup `0x200100` | Candidate runtime interpretation / medium |
| F03: Table membership helper semantics | E03 | Candidate VA `0x204059` | Static reconstruction / medium |
| F04: Nine-byte Black 32 variant delta | E04 | E91/EFE v1.0.19 images | Validated byte comparison / high |
| F05: Variant-specific halfword store | E05 | File `0x33a4`, address `0xa0102eda` | Static reconstruction / high for decoded operation; purpose unconfirmed |
| F06: Black 27 UI delegates flashing to native USB-hub I2C module | E06 | Worker options and DLL export | Static evidence / high for constants, medium for dispatch inference |

These are reverse-engineering findings (`severity: n/a_re`), not vulnerability
claims. Full-source recovery and a working replacement firmware are not
validated findings.

### P01: Reconstructing Spectrum One code

Path type: analysis/solve.

1. Verify original ZIP hash and extract member → E01 / F01.
2. Read segment bounds and expand raw DEFLATE → E02 / F01.
3. Combine prefix and program; compare header base with startup constants
   → E02, E03 / F02.
4. Decode a bounded function and its referenced table → E03 / F03.
5. Express the checked operations as annotated C; leave unknown names
   descriptive rather than assigning unproved functionality → E03 / F03.

Residual uncertainties: incomplete AEON definition, runtime address aliases,
unidentified checksum fields, full call graph and hardware behavior.

### Timeline

- 2026-10-13: Established offline scope; verified and inventoried 45 ZIPs.
- 2026-10-13: Recovered PyInstaller entry and native update configuration.
- 2026-10-13: Identified raw DEFLATE in all 13 Spectrum One images.
- 2026-10-13: Produced AEON excerpts and the first small C reconstruction.
- 2026-10-19: Rechecked derived outputs, decoded the Black 32 variant routine
  across eight images, and resolved the Black 27 communication module ID.
- 2026-10-19: Recorded reproduction commands, parser tests and known limits.

## Limits and next validation

The work has not recovered a complete source tree, a linker/compiler setup
that reproduces vendor firmware, all peripheral definitions, or a verified
repacking procedure. Checksums and possible authentication fields remain
unresolved. Raw DEFLATE decoding is not evidence that every update-validation
step is understood.

Verification completed: hashes for 45 source packages; 13 successful
DEFLATE/trailer-length checks; deterministic byte comparisons; five parser
tests covering valid and malformed inputs; C syntax checks with
`-std=c11 -Wall -Wextra -Werror -fsyntax-only`. Syntax checks do not validate
the snippets' hardware behavior. No emulator, updater, or physical-device
test was performed.

The next useful work is to trace the Black 32 model-value address, improve
ISA coverage, align Spectrum One functions across releases, and identify
update checksums. Before any hardware write, a validated restore path and
precise model/revision mapping are required. The current outputs are for
analysis and community source reconstruction.

## References and provenance

- Original package sources and model mappings: [manifest](../MANIFEST.csv)
  and [archive research log](../RESEARCH.md).
- AEON decoding:
  [pinned ghidra-aeon processor definition](https://github.com/shinyquagsire23/ghidra-aeon/tree/de8a2539d474efa409ba458c565bc74f9e5e0b1d).
- MIPS16 implementation reference:
  [Ghidra processor definitions](https://github.com/NationalSecurityAgency/ghidra/blob/master/Ghidra/Processors/MIPS/data/languages/mips16.sinc).
- Research on newer MIPS16 encodings:
  [GNU binutils MIPS16e2 support patch](https://sourceware.org/pipermail/binutils/2017-May/098081.html).
  This reference does not establish that Dough's target implements MIPS16e2.

Firmware-derived snippets and tables are not covered by the project's MIT
license. See [rights](README.md#rights).
