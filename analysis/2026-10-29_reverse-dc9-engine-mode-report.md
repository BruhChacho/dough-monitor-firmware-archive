# DC9 engine-mode configuration and reset source

Six additional byte-exact assembly routines and a 44-byte dispatch table bring
the editable DC9 overlay to **160 components, 8,775 instructions / 27,096 code
bytes**, plus **12 tables / 911 bytes**. Recovered code covers **1.117% (about
1.12%)** of the 2,426,560-byte expanded application. This denominator includes
data; the ratio measures neither product readiness nor engineering effort.
Most application bytes remain pinned vendor input. Hardware operation and
fully editable firmware remain unfinished.

This 2026-10-29 continuation follows [the offline scope](scope.md), starting
from published `ed5a783` on the existing review branch. Three cheaper agents
contributed source recovery, instruction support, tests and documentation;
parent review corrected store descriptions, repeat-generation behavior,
conditional case classification, and verified the complete ordered bus trace.
No vendor application, monitor access or flashing occurred. This is ordinary
firmware reconstruction, not a vulnerability or malware report.

## Source and boundaries

The [recovery script](../scripts/reconstruct_dc9_engine_mode.py) checks every
instruction encoding against the pinned DC9 bytes. It rejects overlaps,
differing sources and differing layout records before emission. Repeating
recovery preserves identical existing output bytes. All earlier 154 routine
records and eleven tables remain unchanged.

| Span (hex, end exclusive) | Instructions / bytes | Observed role |
|---|---:|---|
| `2213d0..222634` | 1,550 / 4,708 | Engine-mode configuration |
| `222634..222679` | 23 / 69 | Shared parameter stores, mode call, engine flag update |
| `23d349..23d36a` | 12 / 33 | Thirteen-index reset loop |
| `21bd00..21bd0a` | 3 / 10 | Ambiguous `bg.sh` global store |
| `21bd0a..21bd14` | 3 / 10 | Ambiguous `bg.sw_1` global store |
| `21bd14..21bd1e` | 3 / 10 | Halfword read at `343c16` |

The large candidate has one frame allocation (104 bytes), one explicit r9
return at `22164e`, and later continuation blocks branching back into its
body. All direct non-call branches remain inside the span; the next distinct
frame begins at `222634`. The early return does not mark the end of the source.
These are static boundary arguments, not recovered vendor symbols.

The 11-entry little-endian dispatch table at `2af5dc` is 44 bytes, SHA256
`3a0f14d879a83ae336746b37b7a60492ff36ca661f851ccaaa27872afaf43a33`.
All pointers land on instruction starts within the configuration span. Its
values are `22170c,221736,221787,22179b,221841,221868,2219b8,2219b8,221a04,221b29,221e25`.
The table is editable source data; most dispatched paths remain unexecuted.

Six encoder forms reproduce all 26 archived instances: `bg.bgts`, `bn.cmovi`,
`bn.sfgtu`, `bn.sfleu`, `bn.srai`, and `bn.subb`. The model implements signed
branch comparison, signed five-bit immediate selection, unsigned register
comparisons and arithmetic right shift. It rejects uninitialized predicates.
**`bn.subb` encoding is supported but execution is rejected**: the pinned
SLEIGH definition marks its semantics incomplete, and the model does not know
borrow state. Existing CALL, little-endian data and store assumptions remain
explicit; these checks do not independently validate physical ISA behavior.

## Bounded behavior

Configuration reads engine bank `+4`, metadata-index byte `+1d` through `222804`,
and previous mode byte `+0d` before checking index>3. Thus mapped indices4–12
return, but unmapped index13 faults at `4800ec+4`. Selected indices return for
state word `+8` equal to0 or7. Mode9 also returns when the previous mode is9.
Other tested active paths write low8(requested mode) to engine byte `+0d`;
indices0/2/3 repeat that store before publishing the broadcast mask.
Default store rejection retains these prior mode-byte writes.

For selected normal modes on indices0/2/3, conditional tests exercise real
register helpers with zero/nonzero banks and engine mode byte `+0c` equal to0
or1. They assert saved registers, exact engine bytes, unchanged channel and
metadata records, and all six ordered page/data writes for an active bank.
The first logical register `bank+10800021` sets bit80; the second
`bank+32800002` sets bit80 for engine mode0 and clears it otherwise.
Zero-bank guards produce no bus writes. Bus bytes have no physical page,
peripheral, lock or timing behavior.

Active engine1 with the selected zero-metadata fixture reaches `22169e`, before
calling unresolved `21fb61`; its mode-byte update remains. The core validator
covers **49 strict and 148 conditional cases**. Across the new main routine,
only **134 of 1,550 instruction addresses** are visited. That is not exhaustive
input, path, instruction or physical coverage.

The global-store leaves deliberately retain two interpretations. `bg.sh` stores
source high16 at `343c14` under literal SLEIGH semantics, or low16 at `343c16`
under the halfword-lane hypothesis. `bg.sw_1` stores four bytes at `343c14`, or
two low bytes at the same address, respectively. The getter reads exactly the
halfword at `343c16`. Nonzero 32-bit patterns and adjacent sentinels distinguish
these effects. The leaf validator has **3 strict and 12 conditional case
groups**, including four mapping/permission groups, each checking unmapped and
read-only failures. No width ambiguity is silently resolved.

## Integrated reset progress

Reset `222634` calls the two setters with `13a0` and `08ef`, calls configuration
with arguments `(0,index)`, then ORs engine byte `+0f` with1. Wrapper `23d349`
runs indices0–12 and restores its frame. The integrated fixture explicitly
extends the earlier two-byte read-only global to four writable bytes; missing
adjacent mapping still faults in the old fixture rather than being created
on demand.

Under both store policies and both existing wait-bypass inputs, full apply now
completes all four earlier engine preparations and all thirteen reset iterations,
then stops at **`23fb37`, immediately before `2250e8`**. Each reset makes one
call to each setter and the main configuration routine. All thirteen engine
state words are0 in this fixture, so the mode routine takes inactive returns;
this does not demonstrate complete active configuration. All thirteen flag
bytes become1. Final shared bytes are `ef080000` under literal stores and
`ef08a013` under the halfword-lane hypothesis. Full apply has not returned.

## Completed validation and preservation

The [combined run](extracted/firmware-validation-engine-mode-2026-10-29/validation.json)
passed **202 repository tests**, 45 archive hashes, 13 byte-exact corpus
roundtrips and 141 resource checksums, all existing model stages and both new
engine-mode stages. See the [versioned summary](community-engine-mode-workspace.json)
and [raw workspace](extracted/firmware-validation-engine-mode-2026-10-29/workspace/README.md).

All three BINs are 2,069,060 bytes and preserve eleven original resource spans.
Stock SHA256 is `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`;
helper SHA256 is `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad`;
layout SHA256 is `95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a`.
Expanded changes remain zero, 29 and six bytes respectively. The larger source
overlay replaces more original bytes with identical assembled output.

Final audit verified 239 run-artifact hashes, 287 input identities and 199 base
workspace artifacts plus two USB references. All 373 starting saved files match
their original hash manifest; fifteen prior workspaces and forty prior BINs also
verify. During review an agent overlaid a Git archive onto the saved snapshot;
the parent restored every differing saved file from hash-matching checkpoint
blobs or unchanged working bytes, then verified all 373 original hashes. No
original working source or archived firmware was lost. Canonical validation
and build JSONs now describe the successful run; older run directories remain.

## Evidence, findings and next work

| Evidence | Artifact |
|---|---|
| E80 | Six generated sources, dispatch table and recovery script |
| E81 | Six ISA regressions and pinned SLEIGH definitions |
| E82 | Engine-mode and leaf validators; five core and six leaf regressions |
| E83 | Combined gate, build identities and preservation summary |

This raw application has no conventional PE/ELF import table. Fixed direct
calls and table targets provide the applicable dependency map; no full SDK or
import-resolution claim is made.

| Finding | Evidence | Limit |
|---|---|---|
| F83: Six more components are editable and byte exact | E80, E81 | Recovered assembly, not original vendor source |
| F84: Selected mode paths and inactive reset loop return | E82 | Bounded plain-memory fixtures and explicit ISA assumptions |
| F85: Full apply advances to `2250e8` | E82 | Prior state is inactive; active engine1 still needs `21fb61` |
| F86: Store-width ambiguity changes adjacent dimensions | E81, E82 | Independent physical instruction evidence remains necessary |

| Next path | Finding | Action |
|---|---|---|
| P68 | F85 | Recover `2250e8` and its dependencies, then `226100` |
| P69 | F84 | Trace active configuration service `21fb61` and remaining dispatch dependencies |
| P70 | F83, F86 | Resolve ISA/borrow and store evidence; continue remaining application, toolchain, EFE/USB and later hardware validation |

Reproduce from the repository root using a fresh destination:

```bash
.venv/bin/python scripts/reconstruct_dc9_engine_mode.py
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-engine-mode-validation
```

The generator preserves matching files and rejects conflicting ones; validation
rejects reused destinations and disabled assertions. Earlier workspaces, source
snapshots and BINs remain historical evidence.
