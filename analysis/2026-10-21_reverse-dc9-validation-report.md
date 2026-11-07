# DC9: corrected checksums and offline helper integration

Date: 2026-10-21 (America/Los_Angeles). Scope: [offline firmware reconstruction](scope.md).

## Result

The corrected DC9 v101 baseline and rewritten-helper experiment now pass the
recovered container checks and an independent byte/checksum audit. All 13
archived Spectrum One images reconstruct byte-for-byte after regenerating the
main CRC16 and both CRC32s; all 141 resource CRC16s validate. The helper image
changes 29 decoded bytes within the intended 39-byte routine, with identical
resource bytes and offsets. **Neither experiment has been booted on hardware
or constitutes complete maintainable firmware source.** The next substantive
step is caller and entry-path tracing, followed by a larger module reconstruction.

This continuation used local files and installed tools only. No device was
accessed, no vendor executable was run, and nothing was committed or published.
ES07DC9/ES07EFE remain working mappings for the owner's retail descriptions;
exact hardware revisions and installed versions remain unconfirmed.

## Correction to the historical experiment

The [2026-10-20 report](2026-10-20_reverse-spectrum-one-report.md) and
[old recompression JSON](dc9-recompression.json) describe an earlier gate that
checked two CRC32s but did not know the main CRC16. The preserved old artifact,
SHA256 `1460a4608062167bcda589aad57567cd9528d00d6f3349f507b80dc2907d7873`,
has stored main CRC16 `ddf3`, while its covered bytes require `be5c`.
The current parser rejects it with `Main trailer CRC16 mismatch`; its two
CRC32s still pass. It is historical evidence, not a valid output of the current gate.

On this zlib 1.3.2 runtime the corrected baseline differs from that historical
artifact at exactly ten bytes, all inside the main CRC16, AP CRC32 and final
file CRC32 fields. Its compressed stream is identical to the historical stream.
The new baseline report is [dc9-recompression-corrected.json](dc9-recompression-corrected.json);
the old JSON and BIN were retained unchanged.

## Evidence and findings

All findings below have severity `n/a_re` and status `validated` within their
stated offline bounds. Confidence is high for byte/checksum observations; CPU
and monitor equivalence beyond the bounded model is unestablished.

| Evidence / source | Finding and location | Reproduction |
|---|---|---|
| E14: [layouts](mstar-layouts.json), [roundtrips](mstar-roundtrips.json) | F14: normalized main CRC16 matches all 13 images; all three regenerated checksums preserve each original SHA256; 141 resource CRC16s pass | `unpack_mstar.py`, then `roundtrip_mstar.py verify-corpus` |
| E15: [helper build](aeon-helper-build.json), [rewrite validation](aeon-rewrite-validation.json) | F15: original 39-byte assembly equality; 1,557 comparisons agree in result, all 32 general registers and ordered table reads at candidate VA `0x204059` | `build_aeon_helper.py`, then `validate_aeon_rewrite.py` |
| E16: [corrected baseline](dc9-recompression-corrected.json), [helper image](dc9-helper-experiment.json) | F16: same-size source-built helper integration with stock remainder; unchanged program outside expanded `[0x4059,0x4080)` | Both builders below |
| E17: [independent audit](dc9-experiment-audit.json) | F17: independent bitwise CRCs pass for both outputs; raw changes confined to allowed spans; all 11 DC9 resources remain identical | `audit_dc9_experiments.py` below |
| E18: [parser regression](../scripts/test_analysis.py), [checksum implementation](../scripts/mstar_checksums.py) | F18: missing one or two trailer bytes must be rejected; an all-zero input previously let a short or empty trailer verify as zero | `test_analysis.py`, 24 tests; `test_aeon_emulator.py`, six tests |

E14–E17 source artifact hashes appear below. E18 is command evidence (content
hash n/a); the reproducible regression is
`ParserTests.test_main_crc_missing_trailer_rejected`. Existing suites first
passed 23 + 6, then the final suites passed 24 + 6 after that regression was added.
The parser already constrained container bounds, so this correction hardens the
standalone CRC16 API rather than demonstrating that malformed firmware passed
`unpack()`. Checksum regeneration still requires callers to validate AP bounds
and separation from the final file CRC32; the parser and pinned packer do so.

Triage/imports anchor: these inputs are raw Spectrum One containers with a
DEFLATE application and candidate AEON load base `0x200000`; they are not PE/ELF
programs with conventional import/export tables. The existing layout and boot
trace supply the entry/mapping evidence. No new native updater analysis or IDA
execution was needed. The installed skill's referenced `tool-index.md` was
absent, so tool availability was established directly from local Python imports
and successful executions; no bootstrap or toolchain installation was attempted.

## CRC16 and byte boundaries

Let `E` be the exclusive AP end stored little-endian at file offset `0x1000c`.
Compute CRC16 over `[0x10000,E-2)` after zeroing the four-byte words at absolute
file offsets `0x10014`, `0x10060` and `0x10064`. Parameters: polynomial `0x8005`,
initial zero, no reflection and no final XOR. Store the result big-endian at
`[E-2,E)`. The vector `123456789` gives `fee8`.

Regenerate in this order: main CRC16, AP CRC32, whole-file CRC32. The two CRC32s
use polynomial `0x04c11db7`, initial zero, no reflection and no final XOR.
The normalization matches all sampled images. The explanation that the
manufacturer writes the three normalized words later remains a hypothesis;
the semantics of `0x10060` and `0x10064` are still unresolved.

The independent auditor imports no packer or firmware parser code. It directly
decodes the framing, checks bit-at-a-time CRCs and compares every byte outside
these allowed raw-file spans (end-exclusive):

- `[0x10008,0x10010)`: AP extent/end metadata.
- `[0x10014,0x10018)`: AP CRC32.
- `[0x311ca,0x311ce)`: length metadata within the AP prefix.
- `[0x33880,0x125adb)`: original compressed-program/trailer allocation.
- `[0x1f9240,0x1f9244)`: whole-file CRC32.

Only prefix-relative bytes `0x114a` and `0x114b` actually differ in each prefix.
The remainder of the prefix, boot code, resource directory, resource offsets,
payload bytes, and trailing data remain identical. Freed AP space is zeroed.
Direct DEFLATE decoding still uses zlib, so this is an independent audit of
checksums, framing and byte boundaries, not an independent decompressor.

## Output identities

Pinned original SHA256:
`0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`.
Both generated images are 2,069,060 bytes and retain a 2,426,560-byte program.

| Property | Corrected baseline | Helper rewrite |
|---|---|---|
| File SHA256 | `5e79a74aef972941d232a601ae7a853546f87aaab6ee2f5097b0466a7f93ad68` | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` |
| Program SHA256 | `9844f058cf533e50eb994ff82f37d01da9084158dfe22cccc68c151061baaf21` | `9858c1ef4dc9b7583b68407b9082789b74b55ff1bbdf1787142395c0eaa9e28f` |
| Main CRC16 | `be5c` | `e09f` |
| AP CRC32 | `8bbabff1` | `119662e0` |
| File CRC32 | `e58450b5` | `e905a4b7` |
| DEFLATE bytes | 985,104 | 985,103 |
| AP end | `0x124096` | `0x124095` |
| Freed AP bytes | 6,725 | 6,726 |
| Changed decoded program bytes | 0 | 29, expanded `[0x4061,0x407e)` |

Generated BINs remain under ignored `analysis/extracted/rebuild/`. Compression
bytes and hashes can differ with another zlib runtime; the invariants must
still pass. A repeated helper build on this runtime exactly matched its saved BIN.

## Emulation and tool provenance

The runtime was Python 3.12.15 on Linux x86_64, zlib 1.3.2, pypcode 4.0.1.
The helper imports through `.tools/python`, which is a symlink to this checkout's
`.venv/lib/python3.12/site-packages`. The JSON records the resolved pypcode module
path and measures its version. The existing native extension worked on Linux.
The pinned SLEIGH archive
SHA256 was rechecked as
`25ee41c3e3dc4fe55d414128b89339980f745256be20defffbc463dc746cbef6`.
Commit: `de8a2539d474efa409ba458c565bc74f9e5e0b1d`.
Compiled `aeon.sla` SHA256:
`3ec06a3d4c38386aad7dd36b3810a93ff943742bf65973960c7c40880acf8ce2`.
The JSON also records the language descriptor and locally patched source hashes.

Original helper SHA256:
`5055f0197a3de495f1b4c4ff559c257aebb0839ef54624689361c11c61071b37`.
Replacement helper SHA256:
`d6d071ac2a33df38d030e70f34e2e1e9df5c6453fc062e25d8d6986b29c1bd64`.
The rewrite is 37 bytes plus two bytes of unreachable padding.

The 519 selected uint32 inputs and three register seeds yield 1,557 comparisons.
Maximum instruction counts are 251 for the original and 250 for the rewrite.
All 32 general registers and ordered table reads agree, and results match a
table-membership oracle. This is not all CPU state, exhaustive uint32 coverage,
or proof of every entry path into the region. Both executions share incomplete
SLEIGH semantics; interrupts, timing, MMIO and the whole monitor are unmodeled.
The helper's user-facing function remains unknown. No feature improvement is claimed.

## Reproduce

Run from the repository root with the transferred local inputs and installed
dependencies. The two image builders refuse to overwrite their BIN outputs;
choose fresh `.experimental.bin` names on later runs. JSON reports are refreshed,
so preserve evidence before rerunning. The baseline builder now writes
`dc9-recompression-corrected.json` and leaves the historical JSON intact.

```bash
.venv/bin/python scripts/test_analysis.py
.venv/bin/python scripts/test_aeon_emulator.py
.venv/bin/python scripts/unpack_mstar.py
.venv/bin/python scripts/roundtrip_mstar.py verify-corpus
.venv/bin/python scripts/build_aeon_helper.py
.venv/bin/python scripts/validate_aeon_rewrite.py
.venv/bin/python scripts/recompress_dc9.py --output analysis/extracted/rebuild/dc9-v101-crc16-corrected.experimental.bin
.venv/bin/python scripts/build_dc9_helper_experiment.py --output analysis/extracted/rebuild/dc9-v101-helper-rewrite.experimental.bin
.venv/bin/python scripts/audit_dc9_experiments.py --baseline analysis/extracted/rebuild/dc9-v101-crc16-corrected.experimental.bin --helper analysis/extracted/rebuild/dc9-v101-helper-rewrite.experimental.bin --historical analysis/extracted/rebuild/dc9-v101-recompressed.experimental.bin
git diff --check
```

The auditor's `--historical` argument is optional if that old ignored artifact
is unavailable. Omitting it removes only the historical comparison from the audit.
All current source files were already extracted locally; no LFS fetch or archive
recollection was needed. No processor-definition recompilation was needed.

## Evidence hashes

SHA256 values below identify raw report-file bytes for this continuation.

| Artifact | SHA256 |
|---|---|
| [mstar-layouts.json](mstar-layouts.json) | `344391930b386e11acdeda923feaec7a989b64823f676a26089cc202d0fe3f1c` |
| [mstar-roundtrips.json](mstar-roundtrips.json) | `0d78fb05d130d4e0bc84575cfb7ae8a0051addab80c11840ccf85f3a8ffbf424` |
| [aeon-rewrite-validation.json](aeon-rewrite-validation.json) | `471e1b3190b46171a2b9a97c4b21034925c4b47b14b5122903686f509f10d62a` |
| [dc9-recompression-corrected.json](dc9-recompression-corrected.json) | `0bfc86b9260f351af17126d796560bc5d2c8223aeaca55113940cea080756d58` |
| [dc9-helper-experiment.json](dc9-helper-experiment.json) | `49d10f01cd5409195251f28a8c87f02c29b9835373c9ab833d94021947f689be` |
| [dc9-experiment-audit.json](dc9-experiment-audit.json) | `c041375d4589ebfa535602987da1a14d68f259e44280ba2a0a797ad382a2e349` |

## Path, timeline and remaining work

P03 (`path_type=solve`): pinned original and existing changes → E18/F18 tool
regression checks → E14/F14 corpus reconstruction → E15/F15 bounded helper
validation → E16/F16 assembly-to-image build → E17/F17 independent offline audit.
Hardware acceptance and complete source reconstruction remain outside this path's
completed portion.

Timeline for 2026-10-21 (America/Los_Angeles):

1. Read the entire handoff, scope and prior report. Verified `main` at
   `50dbabfe6a8d8c9d1616616235ce570538270fde`, equal to the local `origin/main`
   reference, with five modified scripts and seven untracked files. No remote
   fetch was performed, so this is not a statement about current server state.
2. Preserved 29 existing files in ignored
   `analysis/scratch/offline-validation-before-2026-10-21/` with a SHA256 manifest.
   The backup includes the starting handoff, modified/untracked sources, reports
   and existing rebuild files. Original ZIPs were untouched.
3. Reproduced and fixed the standalone CRC16 bounds defect; measured decoder
   provenance and replaced the overly broad register-state report label.
4. Completed the corpus, helper and two image builds. Verified the old artifact's
   failure and the new outputs' byte/checksum invariants.
5. Updated the evidence, README, scope and historical report notice. Preserved
   the existing changes and left all continuation work uncommitted.

The immediate validation milestone is complete. Next, trace direct and indirect
callers and possible interior entries of candidate VA `0x204059`, identify its
larger module from callers/data, and extend checked instruction support as
needed. A complete AEON R2 compiler/ABI/linker path, peripheral models and monitor
functionality remain unreconstructed. Black 32 runtime mapping and its final
integrity byte are separate outstanding work. Exact device identification,
backups and a verified restore path remain prerequisites for any hardware plan;
this continuation authorizes no hardware probing or flashing.

Firmware-derived assembly/data remain excluded from the repository's MIT grant.
