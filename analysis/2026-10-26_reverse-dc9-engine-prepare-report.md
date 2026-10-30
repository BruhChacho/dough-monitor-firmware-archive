# DC9 engine preparation and deferred request source

Updated 2026-10-26 (America/Los_Angeles). Eight new routines add 849
instructions / 2,717 bytes of byte-exact editable assembly. The overlay now
contains **154 components, 7,181 instructions / 22,256 code bytes**, plus eleven
tables / 867 bytes: **0.917% (about 0.92%)** of the 2,426,560-byte expanded
application. This is recovered code-byte coverage with a data-bearing
denominator, not product readiness or a proportion of engineering effort.
Most application bytes remain pinned vendor input. Fully editable firmware,
physical boot, display operation and recovery remain unfinished.

This work follows [the offline scope](scope.md) and the owner's continued
request for cheaper coding agents with parent review. It began at published
commit `b26a71b`, after the channel-update checkpoint. The 340 starting tracked
files were saved in `scratch/engine-prepare-before-2026-10-26/`; earlier
workspaces and builds remain intact. No vendor program or hardware operation
ran. The report uses the ordinary reverse-engineering template, without a
malware or vulnerability classification.

## Source boundaries and instruction support

[reconstruct_dc9_engine_prepare.py](../scripts/reconstruct_dc9_engine_prepare.py)
checks proposed spans against each other, existing routines and tables; validates
branch boundaries; rejects differing existing sources; and reassembles exact
archived bytes before emission. The original 146 routine records and eleven
tables remain unchanged.

| Candidate span (hex, end exclusive) | Instructions / bytes | Observed role |
|---|---:|---|
| `21ffb3..22089f` | 707 / 2,284 | Selected engine preparation |
| `22089f..220995` | 78 / 246 | Pair register configuration |
| `21bd8d..21bd91` | 2 / 4 | Constant-one return |
| `23e49c..23e4a0` | 1 / 4 | Tail transfer to `27aa7f` |
| `23e4a0..23e4a6` | 2 / 6 | Set r3=1 and transfer to `27b4e2` |
| `23e4a6..23e4f4` | 27 / 78 | Deferred masked halfword request |
| `23e4f4..23e50c` | 8 / 24 | Deferred shifted byte request |
| `23e58a..23e5d1` | 24 / 71 | Deferred halfword request |

The initial candidate span included the adjacent pair routine. Parent review
identified its distinct prologue at `22089f` (16-byte frame versus 88-byte main
frame); the source now splits them. Main internal branches do not enter that
prologue. A contiguous successful decode alone is not a function-boundary proof.

The only new instruction form is `bn.divs`, checked against archived bytes
`40 e6 18` at `2201ef` and the pinned SLEIGH definition. The model uses integer
arithmetic with signed quotient truncation toward zero, reading both inputs
before a destination write. Division by zero and `INT_MIN / -1` reject explicitly;
physical exception/overflow behavior remains unresolved. A duplicated draft
handler was removed during parent review. Existing CALL, little-endian data,
low-byte/halfword and ambiguous-store policies remain explicit hypotheses.

## Bounded engine behavior

Main entry `21ffb3` saves r9–r22 and computes engine address
`47fa9c + index*124`. It reads bank word `+4`, owner byte `+10` through `2227ef`,
and the actual constant-one helper `21bd8d`. It reads halfwords `+4c/+68/+50/+6a`
before checking index>3. Therefore mapped indices 4–12 return, but an unmapped
index can fault before this guard; the routine is not a safe arbitrary-index
validator.

For indices 0–3, engine mode byte `+0c` selects setup arithmetic. Global
halfword `343c14` supplies a divisor/size. Mode zero executes signed division
at `2201ef`; a later calculation uses unsigned division. Zero divisors remain
errors. Engine owner selects channel records at `4821ec`, stride 168. The
model does not infer physical units or connector names from these fields.

The core validator checks initial call/read order, local index returns, both
mode prefixes, stack scratch values and exact first-helper arguments. Complete
mode-one paths return for indices 0–3 under both store hypotheses with explicit
zero or nonzero bank fixtures. Nonzero banks are `200 + index*100` (hex); direct
register paths assert ten ordered data-byte writes, including parity-dependent
addresses, and unchanged engine/channel records. Zero-bank inactive guards
produce no data-bus writes while preserving the real counter/lock paths.
These fixtures do not exercise every branch of the 707-instruction routine.

## Pair configuration and deferred requests

Pair routine `22089f` reads globals `455210/455211`. With both zero it writes
low/high bytes of the supplied low16 value to logical `10902f18` and `10902b18`.
Tests include 32-bit values, actual ordered page writes, and stack restoration.
Nonzero mode reaches the real deferred halfword helper; zero mode with secondary
flag set publishes mode=1 then reaches the dispatch trampoline. No queued service
is substituted or treated as completed.

At even addresses, `23e4a6` forwards full r4/r5 and r6=0 to `27b707` after
restoring its frame. At odd addresses, its first request uses `(r4<<8)&ff00`
and `(r5<<8)&ff00` while retaining the frame; the later second request is not
executed because the service is missing. `23e4f4` instead forwards complete
uint32 shifts `r4<<8` / `r5<<8` on odd addresses, without the ff00 truncation.
`23e58a` uses mask ffff on even addresses; odd first requests use shifted low
byte and mask ff00. Prefix assertions distinguish CALL frames from restored
frames before tail transfers. Unknown targets remain `27b707`, `27aa7f`, and
`27b4e2`.

## Integrated full-apply progress

The new [integrated validator](../scripts/validate_dc9_engine_apply.py) extends
the previous explicit wait-bypass fixture with a nonzero global halfword at
`343c14`, a fifth synthetic channel record, and plain bus bytes at the metadata
bank `+7` addresses used by `21d86d`. Enabled setup stored owner index4; mapping
that synthetic record is explicit test input, not evidence of a fifth physical
monitor input. Tests retain the failure when this record or the global size
is absent. No memory is automatically expanded on a fault.

Under both store policies, with sizes 1/1000/65535 and each existing wait-bypass
choice, full apply completes all four engine preparation calls and reaches
**`23fb33`, immediately before `23d349`**. It has made four calls each to
`204000`, `21ffb3`, and `21d86d`, seventeen each to `220a8b` and `22d986`, and
four channel updates. Selected bank+7 bytes become25 from a5 after bit80 clears.
The configuration inputs remain read-only; no timer completion is fabricated.
Full apply has **not** returned and no physical operation is established.

## Combined validation and preservation

The completed run is [firmware-validation-engine-prepare-2026-10-26](extracted/firmware-validation-engine-prepare-2026-10-26/validation.json),
with [a versioned summary](community-engine-prepare-workspace.json).
It passed **185 repository tests**, 45 archive hashes, 13 byte-exact corpus
roundtrips and 141 resource checksums, plus all prior model stages. New stages
passed 21 strict / 20 conditional core cases, 18 bounded leaf cases and 12
conditional integrated-apply cases. Six engine regressions, four leaf
regressions and four signed-division tests are included in the 185 tests.

All three 2,069,060-byte BINs preserve eleven original resource spans:

| Build | SHA256 | Changed expanded bytes |
|---|---|---:|
| Stock baseline | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` | 0 |
| Helper experiment | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` | 29 |
| Layout experiment | `95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a` | 6 |

The final audit verified 231 run-artifact hashes and 275 source identities,
193 workspace base artifacts plus two USB references, all 340 saved starting
files, fourteen previous workspaces and 37 previous BINs. Canonical validation
and build JSONs now describe this run; historical run directories remain intact.
No hardware operation or complete-source claim follows from these checks.

## Evidence and next work

| Evidence | Artifact / observation |
|---|---|
| E76 | Eight assembly spans, layout and recovery script; prior records preserved |
| E77 | `bn.divs` archived encoding, pinned constructor and focused tests |
| E78 | Core, prepare-leaf and integrated engine validator reports |
| E79 | Combined run, three BINs, input/artifact hashes and preservation summary |

This raw compiled application has no conventional PE/ELF import table. Fixed
addresses and direct/tail call targets provide the applicable dependency map;
no import-resolution or full SDK claim is made.

| Finding | Evidence | Limit |
|---|---|---|
| F79: Eight additional components are byte-exact editable source | E76, E77 | Recovered assembly, not original vendor SDK/source |
| F80: Selected direct preparation and pair paths return | E78 | Bounded fixtures and CPU/store hypotheses, not complete paths or hardware |
| F81: Full apply advances past four engine preparations | E78 | Stops before `23d349`, with explicit extra fixture inputs |
| F82: New builds preserve stock and experiment identities | E79 | No hardware-tested release |

| Next path | Finding / evidence | Action |
|---|---|---|
| P65 | F81 / E78 | Recover `23d349..23d36a`, a 13-index loop calling unrecovered `222634` |
| P66 | F80 / E78 | Continue deferred services `27aa7f`, `27b4e2`, `27b707`; preserve unexecuted requests |
| P67 | F79–F82 | Complete remaining application/toolchain, independent ISA evidence, EFE/USB builds and later hardware validation |

`23d349..23d36a` was inspected, not reconstructed or counted. Do not combine
it with the distinct routine beginning at `23d36a`. Later full-apply calls
`2250e8` and `226100`, active channel assignments `22701c`, geometry `2686dd`
and special paths remain unresolved.

Reproduce with a fresh output directory from the repository root:

```bash
.venv/bin/python scripts/reconstruct_dc9_engine_prepare.py
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-engine-prepare-validation
```

The source recovery rejects differing existing files and overlaps. The gate
rejects reused output directories and disabled assertions. Historical results
remain preserved separately.
