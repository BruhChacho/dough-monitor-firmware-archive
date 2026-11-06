# DC9 routing and dispatch delay boundary

Three additional byte-exact routines bring the editable overlay to **170
components, 9,517 instructions / 29,309 code bytes**, plus **12 tables / 911
bytes**. Coverage is **1.208% (about 1.21%)** of the 2,426,560-byte expanded
application. This code-byte ratio includes data in its denominator and does not
measure product readiness or engineering effort. The active fixture now passes
routing and engine control, enters dispatch apply and arms its real delay.
Completion of that wait and active full apply remain unproven.

This 2026-11-04 continuation starts from published `7df2236` under the existing
[offline scope](scope.md). Lower-cost agents contributed source, validation and
documentation with parent review. No monitor access, vendor executable, flash or
physical timer experiment occurred. This is ordinary firmware reconstruction.

## Source and boundary checks

| Span (hex, end exclusive) | Instructions / bytes | Observed role |
|---|---:|---|
| `21ddcf..21de65` | 52 / 150 | Metadata key routing |
| `21bfca..21c024` | 29 / 90 | Engine-indexed selector field write |
| `226bb5..226cd6` | 97 / 289 | Low/high flag dispatch apply |

The [generator](../scripts/reconstruct_dc9_channel_dispatch.py) adds **178
instructions / 529 bytes**, checks complete decoding and local CFG reachability,
allows only listed external terminal tails and reassembles every byte before
emission. Matching sources/records are preserved, while conflicts and overlaps
reject. The previous 167 routines and twelve tables are unchanged. No new ISA
form or table was needed.

Parent review corrected an overlong candidate that included the distinct
routine starting at `226cd6`. The accepted 289-byte span has its own 20-byte
frame, return at `226bef`, and terminal tail at `226cd2` to `23dfb6`. All 97
instructions are statically reachable within that span when calls are treated
as fallthrough. Static reachability is not a proof that external calls return.

The raw application has no conventional PE/ELF import table. Direct calls and
external tails recorded in the layout provide the applicable dependency map.
Routing calls the new selector and tails to existing `23ddb9`. Selector tails
to existing `23dfe1`. Apply calls the recovered delay and register/metadata
helpers, with `21be27` and `21dcee` still unresolved, and tails to `23dfb6`.

## Routing and selector behavior

Route takes metadata index r3 and engine index r4. It reads the full metadata
key word at `3b4950 + index*176`, maps keys 0–4 to low8(key+3), keys 5–7 to
low8(key-5), and larger keys to low8(key). It calls the real selector with that
mapped byte. Engine indices 0–3 then write the mapped byte to logical addresses
`fff02e03`, `fff02e02`, `fff02e05`, `fff02e04`, respectively. Other tested indices
return after the selector without bus writes; the metadata read still occurs.

Selector takes a value in r3 and engine index in r4. Engine zero is a valid
path. Indices 0–3 select logical `fff01f8e`, `fff01f8d`, `fff01f90`, `fff01f8f`,
respectively. It passes `(value << 2)&fc` with mask `7c` to the real masked-byte
helper. The helper therefore changes only bits covered by `7c`, preserving
other bits in the existing byte. Other tested engine indices return without
memory access. CALL, store, unsigned-width and plain-bus assumptions remain
explicit; the logical registers' physical purpose is not established.

## Apply flags and timer boundary

Apply separates the low byte of r3 and the next byte, ignoring the upper
sixteen bits. Both bytes zero return through the restored frame. With only the
second byte nonzero, it writes that value as a 16-bit value to logical
`fff0250e`, then writes zero through the same real helper. Low-byte flags first
call delay `24209d` with argument two. That routine writes the wait count at
`455204`, sets completion flag `455206` to one and polls it. Ordinary mapped
memory does not make the flag clear by itself.

Later decoded apply code would write the low flag byte through the engine's
bank, wait again, read `21be27`, toggle selector fields, and consult metadata
and `21dcee`. Those later active paths are not established by stopping at the
first delay. No service result or timer completion is fabricated.

## Isolated validation

The isolated gate records **five strict cases**, including one expected default
store rejection, and **86 conditional cases** across both policies. Conditional
paths visit 47/52 route, 28/29 selector and 35/97 apply instructions; strict
out-of-range cases exercise additional guard paths. These are bounded visits,
not exhaustive inputs or paths. Six focused regressions cover guards, strict
store rejection, key boundaries and ordered bus writes, first-byte retention
when the second 16-bit-write byte is missing, and exact missing-timer faults
followed by real delay arming with explicit memory.

## Integrated full-apply prefix

The prior assignment fixture lacks the new route bus bytes and faults at
`a0e03e00+1`, preserving earlier writes. The new fixture explicitly adds the
plain-byte locations for logical `fff01f8d` and `fff02e02`, including page
selectors. Full apply then reaches its real delay call; without a timer region,
the count store faults at `455204` with the selected store width.

Adding a four-byte writable region at `455204`, initialized to `a5 5a c3 3c`,
allows execution through delay arming. For one active channel at each of four
positions under both policies, all **eight conditional cases** stop at
`2420b2`, before the first completion-flag read. Instruction counts are
35,459 / 35,468 / 35,477 / 35,486 by channel position. Each run calls route,
selector and delay once. No tick or clock advance is supplied.

The new route's complete ordered bus trace is checked: page `a0e03e00=ff`
twice, data `a0e03f19=81`, page `a0e05c00=ff`, data `a0e05c04=0`. Counter and
lock return to zero. Delay's count store is four bytes under literal SLEIGH
stores and two under the lane hypothesis; the following one-byte flag write
produces **`02 00 01 00`** or **`02 00 01 3c`**, respectively. The adjacent
sentinel keeps the unresolved width difference visible.

Fault regressions preserve assignment writes before missing bus access and
route writes before missing timer memory. The current result is progress to a
real polling boundary, not a returned active configuration or working display.

## Completed gate and preservation

The combined gate completed 2026-11-05 UTC and preservation review completed
2026-11-06. All **229 tests** passed with no failures, errors or skips; archive
hashes (45), exact corpus roundtrips (13), resource checksums (141), model stages
and three complete BIN builds passed. The [versioned summary](community-channel-dispatch-workspace.json)
records 255 artifact hashes,310 input identities,209 base workspace artifacts
plus two USB references. All414 saved files,18 prior workspaces and49 earlier
BINs remain intact. No already-passed full suite was repeated during finalization.

Each BIN is2,069,060 bytes with11 unchanged resources. SHA256 values:

- Baseline: `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`
- Helper experiment: `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad`
- Layout experiment: `95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a`

## Evidence and continuation

| Evidence | Source |
|---|---|
| E96 | Three assembly files, source layout and generator: 178 instructions / 529 exact bytes |
| E97 | Isolated dispatch contracts and regression tests |
| E98 | Integrated dispatch-apply validator and missing-bus/timer regressions |
| E99 | Combined validation and preservation summary |

Local observations are dated 2026-11-04. Validation artifacts retain source,
decoder and tool hashes. Reproduce with prepared dependencies and extracted
pinned firmware, choosing a fresh destination:

```bash
.venv/bin/python scripts/reconstruct_dc9_channel_dispatch.py
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-channel-dispatch-validation
```

| Finding | Evidence | Limit |
|---|---|---|
| F94: Three additional routines are editable and reproduce the archived bytes | E96, E99 | Recovered assembly, not vendor source |
| F95: Key routing and selector writes execute through real register helpers | E97, E98 | Bounded inputs and plain mapped bus bytes |
| F96: Active full apply arms a real delay and reaches its first poll | E98 | No completion or physical timing proof |

**P75 — callflow:** active apply executes assignment, route, selector and engine
control, then dispatch apply enters delay and arms count/flag (E97/E98, F95/F96).
Next, reuse the existing explicit `TickOnPoll` experiment only with documented
extra memory mappings and actual recovered tick execution; do not replace the
flag read with forced success. Recover `21be27` and `21dcee` for later apply
calls. Most application source, active storage arithmetic, final services,
toolchain and device validation remain outstanding.
