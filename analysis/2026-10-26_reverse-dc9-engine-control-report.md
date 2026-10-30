# DC9 engine-control source reconstruction

This milestone recovers 22 related engine-control helpers and two dispatch
tables. The source overlay now contains **126 components, 5,627 instructions
and 17,432 code bytes**, plus **11 tables / 867 bytes**. The editable-code
coverage proxy is **0.718% (about 0.72%)** of the 2,426,560-byte application.
This is not a product-readiness percentage. Most application bytes remain
precompiled vendor input, and physical boot, display operation and recovery
remain untested. The goal remains a fully editable application.

Scope: authorized offline reconstruction of the pinned DC9 sample, with
repository publication authorized by the owner. See [scope](scope.md).
No vendor executable, device probe or flashing operation was used. Three
lower-cost agents helped recover source, review behavior and prepare boundary
tests/documentation; parent review corrected index/key confusion, an incorrect
test address, source descriptions and preservation behavior in the generator.

## Evidence and reproducibility

| Evidence | Artifact and contract |
|---|---|
| E63 | [Recovery script](../scripts/reconstruct_dc9_engine_control.py) and [source layout](reconstructed/dc9-source-layout.json): 22 contiguous routines at `0x21d3b1..0x21da5e`, 1,709 bytes / 602 instructions. Two nine-entry tables at `0x2af554` and `0x2af578`, 36 bytes each. Every table target is a recovered instruction boundary; all source and tables reassemble to the original bytes. |
| E64 | [Engine-control validation](dc9-engine-control-validation.json): exact selectors, read ordering, complete helper returns, logical write arguments, conditional ordered data writes and an explicit full-apply breakpoint. The default model still rejects ambiguous wide stores. |
| E65 | [Boundary tests](../scripts/test_dc9_engine_control.py): unmapped engine reads, metadata index/key guards, a malformed indirect target, the unguarded metadata-index path and ambiguous-store rejection without data changes. |
| E66 | [Combined workspace summary](community-engine-control-workspace.json) and [run](extracted/firmware-validation-engine-control-2026-10-26/validation.json): complete test/build results, artifact/input hashes and preservation audit. |

Reproduce from the prepared environment using a fresh output directory:

```bash
.venv/bin/python scripts/reconstruct_dc9_engine_control.py
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-engine-control-validation
```

The recovery script rejects differing existing source/table records. The
combined gate refuses to overwrite an existing output directory. Generated raw
files and binaries remain ignored local outputs; the [build guide](../firmware/README.md)
describes their prerequisites. Original ZIPs and previous workspaces remain
preserved. The starting tracked source/evidence/docs were copied to
`analysis/scratch/engine-control-before-2026-10-26/` with a hash manifest.

## Findings

**F67 — Engine index, metadata index and key are separate (E63–E65).**
`0x21d3b1` reads the metadata-index byte at engine base `0x47fa9c`, stride124,
offset`0x1d`. Metadata index >5 returns zero without reading metadata or the
dispatch table. Otherwise it loads the uint32 key at `0x3b4950 + index*176`.
Keys >8 return zero; key0 dispatches to the zero-return block. An invalid engine
argument can fault on its record read before either guard.

| Metadata key | Returned logical register base |
|---|---|
| 0 | `0` |
| 1 | `0xfff30a00` |
| 2 | `0xfff30c00` |
| 3 | `0xfff30e00` |
| 4 | `0xfff31000` |
| 5 | `0xfff30200` |
| 6 | `0xfff30400` |
| 7 | `0xfff30600` |
| 8 | `0xfff31200` |

These bases differ from the older mask-register helper's address mapping.
Names describe inferred software roles, not physical connectors or peripherals.

**F68 — Register readers and scaled-size arithmetic return in the model (E63/E64).**
Ten read wrappers consume bytes or two-byte values relative to the selected
base. Halfword reads visit the high byte before the low byte. Key0 produces
zero through the existing inactive-bank guard. Tests also assert the page-byte
writes made by readers. `0x21d814` has separate parity branches, but both return
bit7 of register `base+0x41` under the existing signed-byte/predicate semantics.
`0x21d8f7` reads a byte at `base+4`.

For `0x21d913`, let `u` be the register halfword at `base+0x50`, and `a`/`b`
the metadata bytes at offsets `0x88`/`0x89`. Its result is:

```text
(((u & 0x1fff) + 1) * (a + 1) * b - 1) & 0xffff
```

A zero `b` gives `0xffff`; this observed wrap is preserved. No physical size
unit or display geometry is established by the arithmetic alone.

**F69 — Selected writes preserve register masks and ordered updates (E63–E65).**
Six helpers iterate set bits and set/clear masks `20`, `10`, `08`, `01`, `40`
at base+`90`, or mask`04` at base+`05` (all hex). The mask08 helper adds
`0x02800090` for even engine indices and `0x90` for odd indices, with uint32
wrap. A seventh helper writes `(value & 3) << 1` with mask6 at base+`90`.
Logical argument prefixes check the high address bits before the existing
register helpers, since plain-memory page aliases can hide those differences.

Metadata mode1/2/4 controls mask`80` updates at base+`0f`/`11`; other tested
modes leave those data bytes unchanged. Another helper updates mask`80` at
base+`07`. These are masked writes, not full-byte replacements.

The second dispatch table, used by `0x21d977`, maps keys1..7 to masks
`10,20,40,80,01,02,04` at `0xfff01f83`, and key8 to mask1 at `0xfff01f84`.
Key0 and keys>8 return without data updates. Unlike `0x21d3b1`, this dispatcher
has no metadata-index >5 guard before its metadata read. The boundary tests
preserve that distinction; no upstream reachability or vulnerability is claimed.

Conditional writer cases check both existing store policies. Their data-write
order includes repeated physical aliases from synthetic metadata mappings.
The bus is ordinary memory, without hardware page windows, effects or timing;
logical argument checks and the older register-access validator provide separate
address-routing evidence. Default execution still rejects ambiguous counter
stores before changing register data.

**F70 — Full apply advances to the next real dependency (E64/E66).**
The full entry `0x23fad0` completes the six-record metadata reset and enters
first-engine setup/range/control under both store hypotheses. The newly
recovered base selector and byte reader execute, then the run stops at
`0x220bc7`, immediately before the call to **`0x22607c`**, with r3/r4=`1,1`.
No unknown service is replaced with a stub. Separate disable-control runs
return for all 13 mapped fixture indices with normal mode bytes. This does not
complete enabled control, all 13 enabled setup records, or full display apply.

## Validation and preservation

The combined gate passed **148 repository tests**, **2,078 strict engine-control
cases**, and **384 conditional cases**. All 45 archive hashes, 13 byte-exact corpus
roundtrips and 141 resource checksums pass. The three 2,069,060-byte builds retain
stock/helper/layout hashes `0b5d8350` / `d88a1683` / `95a06b2f`, with all 11
resource spans unchanged. The audit verified 194 run-artifact hashes and 225
working source/input identities; the workspace contains 165 base artifacts plus
two USB images. All 267 saved starting files, 11 prior workspaces and 28 previous
BINs were checked and retained. E66 records the full identities. All 602 new instruction addresses are visited across the bounded cases;
this is not exhaustive input/state/path coverage or independent CPU validation.
No encoder/model instruction implementation changed in this milestone.
The existing little-endian data, CALL, byte/halfword and wide-store assumptions
remain unresolved on physical hardware.

The previously published update remains in
[draft PR #1](https://github.com/BruhChacho/dough-monitor-firmware-archive/pull/1).
GitHub CLI authentication is configured; the earlier connector403 publication
blocker was resolved. The PR is not merged. The prior layout-setup report and
its run remain historical evidence, with its publication status corrected.

## Next work

| Path | Evidence → finding → next action | Remaining boundary |
|---|---|---|
| P56: apply → engine enable | E64/E66 → F70 → recover `0x22607c` and its actual dependencies | Enabled control/setup is incomplete |
| P57: metadata → control | E63/E64 → F67–F69 → trace special modes and remaining consumers `0x23ee2c`, `0x23ea03`, `0x23e13b`, `0x21bd1e`, `0x220995` | Hardware semantics and full paths remain open |
| P58: deferred request → service | Prior layout evidence → recover `0x27b707` | Queued requests still stop before unknown service |

Continue geometry `0x2686dd`, special handlers `0x20ece9`/`0x20e990` and
independent ISA/CALL/store evidence as separate dependencies. A complete
compiler/linker, most application source, EFE/USB source builds and physical
recovery/validation are still missing.
