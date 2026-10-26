# DC9: reproducible stock baseline and recovered command routing

Date: 2026-10-21 (America/Los_Angeles). Scope: [offline firmware reconstruction](scope.md).

Continuation: the [2026-10-22 module report](2026-10-22_reverse-dc9-module-report.md)
expands source coverage and records bounded execution and packet ingress.
The six-component counts and JSON hashes below describe this earlier milestone;
those JSON versions are preserved in the continuation's scratch snapshot.

## Build outcome

There is now one command to assemble six recovered routines and their three
command tables into a complete, byte-identical stock DC9 v101 image. The source
covers 97 instructions / 285 code bytes and 95 table bytes; the remainder is
still pinned vendor firmware. Baseline mode preserves the original DEFLATE
representation after proving that assembled program bytes are identical, then
reconstructs the container and regenerates all three known checksums. This is
an auditable starting point for incremental source reconstruction, not a complete
open-source firmware or a hardware-tested release.

The baseline output SHA256 is the original source SHA256:
`0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`.
Its 2,069,060 bytes are exactly equal to the archived image. Its main CRC16 is
`ddf3`, AP CRC32 `68ea7417`, and whole-file CRC32 `df78e833`.

Experimental mode accepts named, same-size assembly replacements, preserves
other program bytes and resources, and recompresses with regenerated checksums.
Using the existing helper rewrite through this general source build produces
SHA256 `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad`,
byte-for-byte equal to the previously [independently audited experiment](dc9-experiment-audit.json).
The general builder does not establish semantic equivalence of arbitrary edits.

The fully working community-firmware goal remains open: most executable code,
peripheral behavior and the hardware validation/recovery path remain outstanding.
No device access, flashing, vendor executable execution, commit or publication
occurred during this continuation.

## Build and reproduce

Run from the repository root using the existing local inputs and dependencies.
Output directories must be under ignored `analysis/extracted/rebuild/`; output
BINs are opened exclusively and will not be overwritten. Use fresh names when
repeating a build. JSON evidence is refreshed, so preserve prior evidence first.

```bash
.venv/bin/python scripts/trace_dc9_commands.py
.venv/bin/python scripts/test_dc9_source.py
.venv/bin/python scripts/test_analysis.py
.venv/bin/python scripts/test_aeon_emulator.py
.venv/bin/python scripts/build_dc9_source_baseline.py --output analysis/extracted/rebuild/dc9-v101-source.baseline.bin
.venv/bin/python scripts/build_dc9_source_baseline.py --experimental --replace-source command_group_secondary=analysis/reconstructed/spectrum_one_table_helper_rewrite.aeon.s --output analysis/extracted/rebuild/dc9-v101-module-source.experimental.bin
git diff --check
```

The [source layout](reconstructed/dc9-source-layout.json) records routine
addresses, footprints, original hashes, assembly paths and table values.
The assembler now supports 23 mnemonics. The router assembly has named local
branch labels and annotated external call targets. To develop a replacement,
copy a routine to a new assembly file under `analysis/reconstructed/`, preserve
its footprint, and pass `--experimental --replace-source NAME=PATH`.
The flag permits an offline experiment, not a safe-to-flash claim. Baseline mode
rejects any source/table change; both modes reject growth, overlapping components,
wrong original identities and assembly files outside the reconstruction directory.

| Recovered routine | Candidate address | Bytes | Source |
|---|---|---:|---|
| Primary command-group membership | `0x26e0a4` | 39 | [Assembly](reconstructed/spectrum_one_command_group_primary.aeon.s) |
| Secondary command-group membership | `0x204059` | 39 | [Assembly](reconstructed/spectrum_one_command_group_secondary.aeon.s) |
| Fallback command-group membership | `0x23520b` | 37 | [Assembly](reconstructed/spectrum_one_command_group_fallback.aeon.s) |
| Fallback handler stub | `0x235207` | 4 | [Assembly](reconstructed/spectrum_one_command_fallback_stub.aeon.s) |
| Selector/command router | `0x26f043` | 140 | [Assembly](reconstructed/spectrum_one_command_router.aeon.s) |
| XOR byte accumulator | `0x204080` | 26 | [Assembly](reconstructed/spectrum_one_xor_bytes.aeon.s) |

The XOR routine returns zero for nonpositive signed lengths, otherwise XORs the
specified bytes. It has callers in adjacent table/data preparation routines.
Its inclusion establishes another exact source encoding; those larger routines
are not yet reconstructed or emulated.

## Recovered routing behavior

Addresses below are candidate runtime addresses: expanded-file offset plus
`0x200000`. The router receives a slot index in `r3` and a selector in `r4`.
The observed instruction flow rejects selectors other than the full value
`0xcc`; for that selector it reads byte 2 of the slot at
`0x47eb80 + (slot << 7)`. The router itself has no recovered slot bounds check.
The memory's physical transport and individual command meanings remain unknown.

The inferred decision order is:

1. Test membership at `0x26e0a4`, using 42 bytes at `[0x328610,0x32863a)`.
   On a match, call handler `0x26e335` with the slot index.
2. Otherwise test `0x204059`, using 41 bytes at `[0x2aed7c,0x2aeda5)`.
   On a match, call handler `0x205bd8` with the slot and `0x453ce0`.
3. Otherwise test `0x23520b`, using 12 bytes at `[0x2af71c,0x2af728)`.
   On a match, call `0x235207` with the slot, `0x453ce0` and `0x453cde`.
   That handler is a four-byte return-zero stub in this image.
4. Reject unmatched commands with zero. Each selected handler's result flows
   back through the router's saved-register epilogue.

There are 40 primary, 40 secondary, 12 fallback and 164 rejected byte values.
The primary table contains duplicate `0xfa` and `0xff` entries. Command `0x90`
is present in both primary and secondary tables and takes the primary route.
Membership in the secondary helper is therefore not a one-to-one list of
commands that execute secondary functionality.

The secondary handler subtracts `0x32`, bounds the result to `0x6c`, and reads
a 109-entry little-endian jump table at `0x2aeb78`. Of the commands reaching this
handler through the router, 15 go directly to default target `0x205c39`:
`50 51 60 71 80 86 91 92 93 94 95 96 97 98 99` (hexadecimal).
The JSON maps every byte value and all selected secondary switch targets.
No OSD, DDC, calibration or other feature name is assigned without further evidence.

## Entry paths and decoder limitation

A bytewise scan across the entire expanded AP covers the direct branch forms
represented by the current SLEIGH definition, including 16-, 24- and 32-bit
encodings. Each candidate target is checked against decoded operands.
The results contain three branches internal to the original helper, one
external call from `0x26f084` to `0x204059`, and a parent call from `0x26c155`
to router entry `0x26f043`. No direct external branch into the helper interior
was found by this scan. This is static candidate evidence, not executed reachability.

A scan for both-endian four-byte literals matching any address inside the helper
found six candidates. Their expanded offsets are `0x153db2`, `0x18318a`,
`0x186c83`, `0x188c49`, `0x1b09dc` and `0x1b198e`. Context bytes are retained
in the JSON. They are unclassified data, not proven pointers, and they have not
been dismissed. Resources with unknown runtime mappings, computed addresses,
indirect transfers and unknown instruction forms are outside this scan's proof.

The pinned SLEIGH model translates the call at `0x26f084` as setting `r9` to
`0x26f088 + 4 = 0x26f08c`. That address is inside the decoded instruction at
`0x26f08b`, rather than on a router instruction boundary. The next instruction
is a conditional branch at `0x26f088`. This concrete inconsistency prevents
using the current CALL semantics to claim multi-function equivalence.
We did not silently alter the decoder or substitute a presumed hardware ABI.
The previous leaf-helper comparison never executes CALL and retains its stated
scope; neither comparison proves physical CPU behavior.

## Evidence, validation and next work

| Evidence | Finding | Confidence/status | Reproduction |
|---|---|---|---|
| E19: [routing evidence](dc9-command-routing.json) | F19: the helper participates in selector-gated command routing at `0x26f043`; precedence and switch targets are recorded | Static reconstruction; medium confidence in runtime interpretation | `trace_dc9_commands.py` |
| E20: [baseline evidence](dc9-source-baseline.json) and [layout](reconstructed/dc9-source-layout.json) | F20: six source routines and three tables reproduce original bytes; complete reconstructed image equals the pinned vendor input | High confidence; validated byte equality | Baseline build above |
| E21: [source experiment](dc9-source-experiment.json) | F21: named source replacement produces exactly the already audited helper image | High confidence; validated byte equality, no hardware claim | Experimental build above |
| E22: [tests](../scripts/test_dc9_source.py) | F22: edited source cannot pass as stock; growth, overlap, bad identity, unaligned word offsets and out-of-range branches are rejected | High confidence for tested tool behavior | 11 source tests; existing 24 parser and six emulator tests |
| E23: E19 call P-code and instruction boundaries | F23: current SLEIGH CALL link calculation is inconsistent with this router's decoded instruction boundaries | High confidence in model inconsistency; hardware semantics unresolved | `trace_dc9_commands.py` |

Findings are reverse-engineering results (`severity=n/a_re`), not vulnerability
claims. Triage/imports anchor: pinned raw firmware container and expanded AEON
application, with no conventional PE/ELF import/export directory. No new native
updater survey was performed. All observations use the same Python 3.12.15,
pypcode 4.0.1 and pinned SLEIGH identity recorded in E19. Source data and tool
availability were established locally; no network access or installation was needed.

P04 (`path_type=solve`): pinned expanded image → E19/F19 direct caller and data
reconstruction → E20/F20 exact source assembly and stock image → E21/F21 explicit
source replacement. E23/F23 limits the next multi-function emulation step.

Timeline, 2026-10-21 (America/Los_Angeles): verified unchanged `main` HEAD
`50dbabf`, preserved 24 starting working files in ignored
`analysis/scratch/caller-reconstruction-before-2026-10-21/` with a SHA256
manifest, traced callers and switch data, expanded the encoder, assembled and
built the two outputs, then ran the source rejection and existing tool suites.
Earlier experiments and evidence were retained. All new work is uncommitted.

Next, resolve call/return semantics against independent architectural evidence
or additional unambiguous firmware patterns, trace the parent dispatcher's input
validation and transport, and reconstruct selected secondary handler bodies
using the recovered switch map. The six literal candidates need data-region and
reference classification before any stronger substitution claim. Full compiler,
linker, peripheral and monitor-feature reconstruction remains incomplete.
A hardware plan still requires exact model/revision/version identification and
a verified backup/restore path. This continuation does not authorize device access.

### Evidence hashes

E22 is command/test evidence (content hash n/a). The raw artifact hashes for
E19–E21 and the layout are:

| Artifact | SHA256 |
|---|---|
| [dc9-command-routing.json](dc9-command-routing.json) | `66d107379b0b5001bc3f7579856bce9e51a143056ae4ebc07d38dba204626882` |
| [dc9-source-baseline.json](dc9-source-baseline.json) | `151ed1524651429fd8708e41d1ad093b1e52ef7e67338d137e2b4319ac8550c2` |
| [dc9-source-experiment.json](dc9-source-experiment.json) | `bedd1326cbe5ebef762545ef38d6ceee65f4e434b1da7148051f32216c38d9f4` |
| [reconstructed/dc9-source-layout.json](reconstructed/dc9-source-layout.json) | `2fb39cc8b036005cdbfd65e2a3db6f7d073e7888fb65eade7586c1906fc27100` |

Firmware-derived assembly and table data remain excluded from the repository's
MIT grant. The analysis/build tooling does not turn the vendor remainder into
original community source.
