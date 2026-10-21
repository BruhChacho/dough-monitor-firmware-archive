# Spectrum One: validated containers and a recompression experiment

Date: 2026-10-20. Scope: [offline firmware reconstruction](scope.md).

## Status

We can validate and reconstruct all 13 archived Spectrum One images without
changing a byte. We also built an experimental DC9 v101 image with a newly
compressed program, updated length fields and regenerated CRC32s. Its decoded
program is identical to the original. **It has not been booted on a monitor,
and this is not a firmware build from source.**

The objective remains maintainable firmware that works on the owner's glossy
27-inch and Gorilla Glass 32-inch monitors. This milestone advances Spectrum
One packaging and boot analysis. Black 32 still needs separate work on its
format, instruction set and runtime mapping.

## Evidence and findings

| Evidence | Finding | Validation |
|---|---|---|
| E08: [MStar layouts](mstar-layouts.json) | F08: two CRC32 fields and their exact spans | Both match all 13 images; corruption tests reject changes |
| E09: [roundtrip and resource results](mstar-roundtrips.json) | F09: appended-resource directory, CRC16s and compressed-resource framing | 13 byte-exact reconstructions; 141 CRC16s match |
| E10: [bootloader excerpts](mstar-boot-excerpts.md) | F10: update-slot check, relocated loader, application CRC and DEFLATE path | Static instruction decoding of DC9 v101, with explicit file/runtime mapping |
| E11: [recompression result](dc9-recompression.json) | F11: a different compressed stream can preserve the decoded program and resources | Reparse, CRC validation and byte comparisons pass; hardware untested |
| E12: [installer inventory](installers.json) | F12: USB releases 17/18/19 contain identical VL822 payloads and different VL103R payloads | Extracted payload SHA256 comparisons |
| E13: [helper build](aeon-helper-build.json) | F13: recovered assembly can reproduce one original routine | 13 instructions, 39 bytes, exact match with archived code |

These are reverse-engineering findings, not vulnerability claims. Confidence
in F08/F09 is high for the sampled files. F10 is a static interpretation using
an incomplete processor definition. F11 establishes host-side consistency,
not device acceptance.

## CRC32 and main application layout

Both checks use width 32, polynomial `0x04c11db7`, initial value zero, no
input/output reflection, and no final XOR. The implementation is in
[`mstar_checksums.py`](../scripts/mstar_checksums.py). Its optimized calculation
is checked against an independent bit-at-a-time implementation.

All offsets below are file offsets. Multi-byte header words are little-endian.
Let `S` be the word at `0x10000`, `B` at `0x10004`, and `E` at `0x1000c`.

| Location | Observed role |
|---|---|
| `0x10000` | AP start `S = 0x30080` |
| `0x10004` | AP load base `B = 0x200000` |
| `0x10008` | `B + E - S`; compressed segment extent, not expanded end |
| `0x1000c` | AP end `E`, exclusive |
| `0x10014` | CRC32 of `[S, E)`, stored little-endian |
| `0x10020` | File length minus four |
| `S + 0x1147` | Compression marker bytes `be ad de` |
| `S + 0x114a` | AP segment length `E - S` |
| `[S, S + 0x3800)` | Uncompressed AP prefix |
| `[S + 0x3800, E - 6)` | Raw DEFLATE stream |
| `[E - 6, E - 2)` | Expanded program length, little-endian |
| `[E - 2, E)` | Two unexplained bytes, preserved by current tools |
| Last four bytes | CRC32 of every preceding byte, stored big-endian |

For DC9 v101, the original segment CRC is `68ea7417` and file CRC is
`df78e833`. The full input identity is recorded in E08 and E11.

We tried common CRC16 variants over plausible main-program spans and several
historical header states. None established the meaning of the final two main
trailer bytes. They must not be presented as a solved checksum. The recovered
DEFLATE call reads the preceding four-byte length; the traced path does not
establish a separate check of those two bytes. Other consumers remain possible.

## Appended resources

The directory starts at `0x32080`. The observed 12-byte prefix is
`54 45 4c 09 58 33 69 00 00 7b 00 00`; the last four bytes of this prefix
also participate in a capacity field read by the loader. A big-endian 16-bit
record count follows. Each record is 11 bytes:

| Field | Encoding |
|---|---|
| ID | Big-endian uint16 |
| File offset | Big-endian uint32 |
| Stored size, including padding and CRC | Big-endian uint32 |
| Encoding flags | uint8; observed `0` or `4` |

The next record ID after the declared count is `f000`. Payloads are aligned to
eight bytes and each ends in a big-endian CRC16. The algorithm uses polynomial
`0x8005`, initial zero, no reflection and no final XOR, over the payload and
padding preceding the checksum. All **141** records validate.

Flag `4` payloads contain raw DEFLATE followed by a four-byte little-endian
expanded length, bytes `be ef`, zero padding and the CRC16. The parser checks
the stream end, expanded length, marker, padding, bounds and checksum. The
length of uncompressed flag `0` content before its zero padding is not encoded
separately by this recovered directory, so current tools preserve it whole.

The records include additional executable-looking regions as well as data.
The resource IDs have not all been assigned reliable functional names.

## Bootloader trace

For the DC9 v101 source hash in E10:

1. Raw `0x2000` selects the candidate update slot at `0x400000`. The call at
   `0x2042` receives the slot start, header length plus four, polynomial
   `0x04c11db7` and initial zero. A nonzero result clears the selected base;
   the corresponding pass/fail strings corroborate this interpretation.
2. Raw `0x2322`–`0x2364` supplies source `0x724d`, destination `0x01000100`
   and length `0x4eb8` to the copy routine, then transfers control.
3. In that relocated stage, the compressed path tests `be ad de`, configures
   the CRC hardware with polynomial halves `1db7`/`04c1` and zero state,
   and compares the result with the selected header CRC. The code also has
   header fallback paths; the excerpts retain them for inspection.
4. It copies the `0x3800`-byte prefix, stages compressed data at `0x01100000`,
   assembles the expanded length from the four bytes preceding the last two
   trailer bytes, and calls a raw-DEFLATE wrapper. The wrapper passes window
   bits `-15` and flush mode `4`, matching the offline decoder.
5. The handoff routine jumps to application address `0x00200100`.

These observations do not emulate the CRC engine, DMA, memory aliases or
peripherals. They also do not certify fallback recovery on the owner's device.
The sample's loader appears to supply more input bytes than the exact DEFLATE
stream needs; the offline parser instead locates the actual stream end.

## Reproduce the two reconstruction experiments

Prerequisites are in [the analysis README](README.md). The first commands use
the Python standard library; boot disassembly additionally needs the prepared
AEON definition and pypcode. No command accesses a monitor.

```text
python scripts/unpack_mstar.py
python scripts/roundtrip_mstar.py verify-corpus
python scripts/test_analysis.py
python scripts/inspect_mstar_boot.py
python scripts/recompress_dc9.py --output analysis/extracted/rebuild/dc9-v101-recompressed.experimental.bin
```

The last command refuses to overwrite an existing output. Use a new output
name when repeating it. Its input is pinned to DC9 v101 by SHA256. It performs
no code patch: only DEFLATE encoding and associated container metadata change.
Resource offsets and bytes, expanded program length, boot code and the
unexplained trailer bytes are retained. Growth beyond the original AP extent
is rejected. Generated binaries remain in the ignored extraction tree.

With zlib 1.3.2, the original stream is 991,829 bytes and the recompressed stream
is 985,104 bytes. The experimental file SHA256 is
`1460a4608062167bcda589aad57567cd9528d00d6f3349f507b80dc2907d7873`.
Other zlib releases may encode differently; successful validation depends on
decoded bytes and container checks, not this output hash alone.

For a disk-based lossless bundle, `roundtrip_mstar.py export SOURCE.bin NEW_DIR`
exports checksummed parts. `rebuild NEW_DIR NEW_OUTPUT.bin` verifies each part,
reassembles the image, regenerates both CRC32s and requires the original SHA256.
It rejects changed parts; it is intentionally not a modification interface.

Twenty automated tests cover CRC reference calculations, corruption,
inconsistent metadata, overlap, malformed resource trailers, bounded inflate,
component changes, gaps, disk reconstruction, overwrite refusal and invalid
assembler inputs.

## First assembly source build

[`spectrum_one_table_helper.aeon.s`](reconstructed/spectrum_one_table_helper.aeon.s)
is readable assembly for the previously reconstructed table-membership helper.
The independently written [`aeon_subset_assembler.py`](../scripts/aeon_subset_assembler.py)
supports its nine mnemonics, register/immediate bounds and local branch labels.
It contains no copied machine-code blob for this function.

```text
python scripts/build_aeon_helper.py
```

This produces 13 instructions totaling 39 bytes and requires exact equality
with expanded offsets `0x4059`–`0x407f` of the pinned DC9 image. E13 records
the source hash, listing and result. This is a source-to-machine-code check
for one routine. It does not supply a full assembler, C compiler, linker,
device emulator or an independently implemented monitor application.

The inspected historical [SDK Makefile](https://github.com/Toysoft/mstar/blob/master/Chakra3_017a0d6_20170731/Makefile)
names `r2-elf-` or `aeon-` compiler prefixes and AEON R2 build flags. A usable
compiler distribution was not located in the searches performed. That lead
has not been substituted with a generic OpenRISC compiler: compatibility with
the observed variable-length instruction encoding is unestablished.

## USB installer findings

Four Inno installers were unpacked with official innoextract 1.9. Vendor
executables and DLLs were inspected as bytes and were not executed. Tool and
installer hashes are checked by [`extract_installers.py`](../scripts/extract_installers.py).

The three USB installers contain the same 42,556-byte VL822 hub payload:
`ec6699214c621671449ec941ab4ccd8c413cb79b6e369d99a654c12beb3a3356`.
Their 32,768-byte VL103R payloads differ:

| USB release | VL103R payload SHA256 |
|---|---|
| 17 | `3e3c4c2224c676b1e4971280f5678f65b37ddb8609c3afdfa1df6f72e14b44b1` |
| 18 | `f76ac7e65e4e3094e84b0513f6aaa8d030166fca742e7819bfc563af6fd4bf99` |
| 19 | `62879652a96b8098cb240c4a4290828304afc6709b3948066ccb0d1de49e0fe1` |

Their hub updater executable and API DLL are also identical. Thus these three
packages must not be described as three different VL822 firmware binaries.
The MStar installer separately exposes the native scaler updater for future
transport analysis. Exact payload names, provenance and PE metadata are in E12.

## Path toward working firmware

P02, analysis/build path: archived source identity → E08/F08 checksum validation
→ E09/F09 resource preservation → E10/F10 boot requirements → E11/F11 experimental
recompression. The final hardware and source-build steps remain open.

| Gate | Current state | Completion criterion |
|---|---|---|
| Untouched container reconstruction | Passed for 13 images | Byte equality and regenerated checksums |
| Changed compressed representation | Offline pass for DC9 v101 | Same decoded program; valid format and known checksums |
| Complete update-validation model | Partial | Explain remaining fields and validate every relevant consumer |
| Code generation | Partial: one recovered assembly routine matches | General compiler/assembler, linker layout and checked integration of a change |
| Recovery and exact model mapping | Pending | Device label/revision, verified backup and usable restore procedure |
| Hardware operation | Untested | Boot, inputs, resolutions/refresh rates, HDR/VRR, OSD, sleep/wake, hub and USB-C regressions |
| Maintainable firmware source | Partial small routines only | Recovered/reimplemented modules with reproducible build and tests |

The next offline priority is to establish the remaining validation behavior and
a usable AEON code-generation path, then integrate one bounded, reviewable code
change. A repackaged stock program alone does not meet the final objective.

## References and timeline

- 2026-10-19–20: CRC32 recovery, installer extraction, resource-directory and
  CRC16 validation, lossless reconstruction, boot trace, recompression and
  the first exact assembly reconstruction.
- A historical [MStar packaging script](https://github.com/Toysoft/mstar/blob/master/Chakra3_017a0d6_20170731/scripts/BinIDPackFiles_Compress.py)
  corroborates related CRC algorithms and resource framing. It is for a
  different layout and was neither executed nor copied into this project.
- [niklas389/dough-monitor-tools](https://github.com/niklas389/dough-monitor-tools)
  is relevant community work on the D03 USB/I2C transport. Its `specflash.c`
  explicitly describes itself as hardware-unverified. We have not run it,
  imported its code, or generalized its hardware claims to DC9.
- [innoextract official distribution](https://constexpr.org/innoextract/),
  version 1.9 Windows archive SHA256:
  `6989342c9b026a00a72a38f23b62a8e6a22cc5de69805cf47d68ac2fec993065`.

Firmware-derived excerpts remain excluded from the repository's MIT grant.
