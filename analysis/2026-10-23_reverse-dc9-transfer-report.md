# DC9 transfer dependencies and explicit store hypotheses

Date: 2026-10-23. Scope: [authorized offline community firmware work](scope.md).

Continuation: the [timer and callback report](2026-10-23_reverse-dc9-timer-report.md)
adds thirteen source components and a combined offline verification/build command.
This report retains its 43-component milestone; current build evidence uses the
expanded layout, and the old workspace remains preserved.

## Result

Eight additional components now assemble byte for byte from source. They cover
channel lookup, forward memory copying, response formatting, transmit
preparation, indirect writes and the follow-up service connecting them. The
source build contains **43 components, 2,123 instructions / 6,708 code bytes**,
plus four tables / 531 bytes. Recovered code is approximately 0.276% of the
expanded application; the remaining application is preserved vendor input.

The new [development workspace](../firmware/README.md) is
`analysis/extracted/community-transfer-workspace/`: 80 base artifacts plus
two separately manifested USB images. Both previous workspaces remain intact.
No recovered source was substituted with a guessed hardware implementation.

## Evidence and findings

| Evidence | Artifact | Finding supported |
|---|---|---|
| E37 | [Reconstruction script](../scripts/reconstruct_dc9_transfer.py), [source layout](reconstructed/dc9-source-layout.json), [baseline](dc9-source-baseline.json) | Eight exact source spans and their original byte identities |
| E38 | [Transfer validation](dc9-transfer-validation.json), [validator](../scripts/validate_dc9_transfer.py), [regressions](../scripts/test_dc9_transfer.py) | Strict helper contracts, separate conditional experiments and store/load evidence |
| E39 | [Workspace evidence](community-transfer-workspace.json), generated build sidecars | Exact complete BIN reconstruction, unchanged resources and preservation checks |

| New component | Candidate start | Bytes | Instructions |
|---|---|---:|---:|
| `slot_lookup_channel` | `0x20c711` | 42 | 14 |
| `slot_followup` | `0x20d2b7` | 133 | 43 |
| `indirect_buffer_write8` | `0x20e3be` | 124 | 40 |
| `indirect_buffer_write32_reverse` | `0x20e43a` | 68 | 21 |
| `memory_copy` | `0x2aab1e` | 89 | 32 |
| `slot_response_format` | `0x26bdd1` | 337 | 101 |
| `slot_transmit_prepare` | `0x20cd94` | 464 | 150 |
| `slot_wait_and_clear` | `0x20cd4a` | 74 | 25 |

F37 — The follow-up service returns early for zero received count or zero
low-seven-bit header length. Otherwise it copies `length + 2` bytes from the
128-byte slot into a shadow area, formats a response, prepares transmission,
and writes the final marker through the slot data-write helper. A length-127
header requests 129 bytes; strict mapping rejects the copy beyond the slot.
That establishes a local boundary condition, not its external reachability.

F38 — The copy routine uses 16-byte batches for aligned pointers, then words
and remaining bytes. Misaligned pointers use byte copying. It is a forward
copy, without memmove-style overlap handling. Tests cover all combinations of
four source/destination alignments and lengths spanning its dispatch thresholds.

F39 — Channel lookup examines six records at `0x3b4950`, stride 176, returning
the first whose initial byte equals `slot + 1`; absent keys return sentinel 6.
Archived keys are `[5, 6, 4, 2, 1, 3]`. These are initial image data, not proof of
runtime physical channel assignments. Tests also cover duplicate/zero keys,
first-match behavior and uint32 wraparound in `slot + 1`.

F40 — The writer sends the low byte through logical `0x3c00`, after programming
`uint16(argument - 0x4000)` at `0x3c02`, then triggers control bit 0 via masked
update. The 32-bit wrapper sends bytes least-significant first to descending
indirect addresses `0x4fff` through `0x4ffc`. Busy polling remains dependent on
real peripheral behavior; plain-memory completion is not bus validation.

## Store evidence and model boundary

Ambiguous `bg.sw_1` and `bg.sh` instructions remain rejected by default.
The model now accepts explicit policies solely for comparing hypotheses:

| Policy | `bg.sw_1` | `bg.sh` |
|---|---|---|
| `reject` | Raise an error | Raise an error |
| `sleigh-store` | Write 32 bits at decoded address | Write source bits 16–31 as a halfword at decoded address |
| `halfword-lane-hypothesis` | Write low 16 bits at decoded address | Write low 16 bits two bytes beyond decoded address |

The `sleigh-store` policy uses literal store shapes from the SLEIGH source within
the existing model. Both policies retain little-endian data and fallthrough
CALL assumptions. They do not execute full SLEIGH P-code; the decoder itself
declares big endian. Independent physical ISA/data-endianness evidence is still
needed. Results always include the selected policy, and neither policy is
automatically enabled by the source builder or ordinary validators.

F41 — For selector 3 / command `0x12`, stores at `0x26bedf` and `0x26beec` decode
as `bg.sh` at candidate `0x3cb308`. The corresponding selector-1 getter loads a
byte from `0x3cb30a` at `0x26bf15`. The lane hypothesis makes tested setter/getter
pairs internally consistent: inputs 0–24 read back as 25, inputs 25–100 read
back unchanged, and inputs above 100 leave the prior setting untouched. The
literal store-shape policy leaves the getter's byte unchanged for these inputs.

E38 records original instruction bytes, P-code, store-source varnode widths
and all fourteen policy/input observations. This is evidence favoring the lane
interpretation for this code path, not proof of actual store width or exclusion
of every alternative interpretation. No user-facing setting name is assigned.

F42 — Both policies satisfy the low-byte bit-update contract in the selected
masked-update tests, but differ on neighboring counter bytes. A four-byte
store clears the initialized `a5 a5` neighbor; a two-byte store preserves it.
The counter's actual neighboring data usage remains to be traced. This result
does not establish which behavior the hardware implements.

F43 — A limited whole-application scan finds only the already recovered direct
wide-byte accesses with displacement `0x3b9e`: flag set at `0x20e4cd`, read at
`0x20e507`, and clear at `0x20e512`. Computed addresses and aliases are not ruled
out. A conditional scripted-read test supplies data `0x11`, then flag zero,
followed by data `0x22` and flag one. The indirect reader retries and returns
`0x22`, clearing the flag before return. The test exercises the retry branch;
it neither identifies an interrupt writer nor simulates an actual interruption.

## Validation and builds

**1,832 strict cases** pass with ambiguous stores rejected: 624 memory-copy,
1,032 channel-lookup, 40 wait/clear, 40 follow-up early-return and 96 response
formatting cases. The wait tests exclude state 6, whose delay call at `0x2420bb`
is still unresolved.

**218 conditional cases** pass across the two explicit store policies. Each
policy contributes 40 masked updates, 18 byte writes, four 32-bit writes,
twelve byte reads, one scripted retry, fourteen setter/getter runs and twenty
complete follow-up pipeline runs. These are separate from the strict results.

The selected complete pipeline runs check the shadow copy before response
mutation, formatted header/checksum, ordered indirect payload writes, transmit
pointer/count/control state, final marker, stack balance and saved registers.
Tests include the 127-byte initial-queue boundary, retaining the remaining-byte
position for later service. Plain register bytes do not model FIFO advancement,
acknowledgement, timing or asynchronous state changes.

The full suite passes **76 tests**. Previous receive validation (29,495 cases),
register validation (266 cases) and command-path validation were rerun and pass
under the default rejection policy. Regression tests ensure that unknown policy
names fail, default execution rejects both ambiguous stores, and narrow memory
maps cannot conceal a four-byte write or a 129-byte slot read.

Workspace and canonical builds both reproduce:

| Image | SHA256 |
|---|---|
| Baseline | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` |
| Helper experiment | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` |

Both complete BINs remain 2,069,060 bytes, pass all three checksums and preserve
eleven resource ranges. The experiment retains its original 29-byte program
change within one helper; newly recovered transfer code is byte-identical to
the archive. No firmware was flashed or booted.

Reproduce from the repository root with the existing local environment:

```bash
.venv/bin/python scripts/reconstruct_dc9_transfer.py
.venv/bin/python scripts/validate_dc9_transfer.py
.venv/bin/python scripts/validate_dc9_receive.py
.venv/bin/python scripts/validate_dc9_registers.py
.venv/bin/python scripts/validate_dc9_module.py
.venv/bin/python -m unittest discover -s scripts -p 'test_*.py'
.venv/bin/python scripts/firmware_workspace.py verify analysis/extracted/community-transfer-workspace
```

Use fresh output names for builds, as shown in the [guide](../firmware/README.md).
Original firmware remains a raw image without a conventional PE/ELF import
table; local direct calls and the exact reconstructed source provide dependency
evidence. No vendor executable or network service was used.

## Preservation and next work

Git remains `main` at `50dbabfe6a8d8c9d1616616235ce570538270fde`, matching local
`origin/main`. No fetch, commit or push occurred. The 96 starting changed/
untracked files are preserved under `analysis/scratch/transfer-before-2026-10-23/`
with a hash manifest. Older workspace evidence refers to the corresponding
historical source/tool versions in that snapshot. Original ZIPs and prior BINs
remain unchanged.

P37 — Seek independent ISA/endianness evidence or additional paired stores and
loads to distinguish width, lane and value-bit semantics. Keep default rejection
until that evidence justifies a change. Trace neighbors of `0x4551a8` and
`0x4551ec` before treating the counter result as a width proof.

P38 — Trace computed references and asynchronous users of the retry flag and
channel metadata. Establish a peripheral contract for FIFO/poll/acknowledgement
behavior, then expand selected conditional paths toward full service validation.
Investigate the 128-byte slot versus length-plus-two boundary before any patch.

P39 — Recover the scheduler/delay dependency and follow the settings into actual
display behavior. General source linking/relocation, complete source recovery,
EFE/USB source builds and hardware validation remain unfinished.
