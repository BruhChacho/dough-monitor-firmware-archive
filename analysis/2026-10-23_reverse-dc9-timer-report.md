# DC9 timer, callback and repository validation

Date: 2026-10-23. Scope: [authorized offline community firmware work](scope.md).

## Result

Thirteen additional components assemble exactly from recovered source: the
timer handler, delay helpers, callback setup, and timer registration/dispatch.
The build now contains **56 components, 2,576 instructions / 8,178 code bytes**,
plus four tables / 531 bytes. This is approximately 0.337% of the 2,426,560-byte
expanded application. Most application code remains pinned vendor input.

A new [combined verification command](../scripts/validate_firmware_repo.py)
checks the local archive, corpus, tests and behavioral contracts, then exports
raw files and builds both complete DC9 images. The latest run passed all offline
gates and 92 tests. The baseline is byte-identical to the original; the helper
experiment changes the same 29 application bytes as before. Neither a complete
editable firmware source tree nor hardware operation has been established.

## Evidence

| Evidence | Artifact | Supported finding |
|---|---|---|
| E40 | [Timer recovery](../scripts/reconstruct_dc9_timer.py), [timer trace](dc9-timer-path.json), [source layout](reconstructed/dc9-source-layout.json) | Exact code, counter/flag adjacency, paired halfword store/load |
| E41 | [Timer validation](dc9-timer-validation.json), [validator](../scripts/validate_dc9_timer.py), [regressions](../scripts/test_dc9_timer.py) | Countdown behavior under two store policies, explicit interleaving, failure boundaries |
| E42 | [Callback recovery](../scripts/reconstruct_dc9_callbacks.py), [validation](dc9-callback-validation.json), [regressions](../scripts/test_dc9_callbacks.py) | Initial callback values, registration arguments, dispatch continuation |
| E43 | [Workspace evidence](community-timer-workspace.json), [combined gate](../scripts/validate_firmware_repo.py), [gate regressions](../scripts/test_firmware_repo.py) | Archive integrity, complete outputs, repeatable validation and preservation |

This is raw scaler firmware, with no conventional executable import table.
Direct calls, external tail calls and callback pointer slots are the applicable
dependency evidence. Analysis used the existing Python/pypcode/SLEIGH setup;
IDA was unavailable and was not invoked. The original SLEIGH was not modified.

## Recovered source

| Component | Candidate start | Bytes |
|---|---|---:|
| Timer handler | `0x2417f1` | 807 |
| Nop/return | `0x242099` | 4 |
| Delay wait | `0x24209d` | 30 |
| Delay wait with optional callback | `0x2420bb` | 74 |
| Timer initialization | `0x242105` | 22 |
| Repeated nop helper | `0x24211b` | 47 |
| Callback setter | `0x23e62c` | 18 |
| Callback table clear | `0x23e63e` | 35 |
| Channel record byte setter | `0x23e709` | 21 |
| Callback initialization | `0x2614a9` | 165 |
| Timer registration | `0x27081c` | 26 |
| Timer dispatch | `0x270836` | 145 |
| Timer creation wrapper | `0x279e04` | 76 |

The strict encoder/model adds `bt.jalr`, `bt.nop`, `bn.divu`, and `bn.sfleui`.
Indirect calls read the destination before replacing r9 and must target a known
instruction boundary. Division by zero is rejected. Only observed `bt.nop 0`
execution is modeled. Tests include aliased indirect-call targets, unsigned
arithmetic, invalid callback pointers and instruction-boundary rejection.

## Findings

### F44: counter/flag ownership constrains the store width

The delay helpers store the requested count at `0x455204`, set byte `0x455206`
to one, and poll that byte. The timer handler reads a halfword count, decrements
it at `0x241ac7`, reloads it, and clears the flag once the count reaches zero.

Under `sleigh-store`, the four-byte store at `0x455204` also clears the adjacent
flag. A requested count of three therefore completes after one scheduled timer
prefix, leaving count two. Under `halfword-lane-hypothesis`, it completes after
three prefixes with count zero. This is stronger evidence than an arbitrary
neighbor sentinel because the adjacent byte has a demonstrated role.

This remains firmware consistency evidence, not independent ISA validation.
Both models use little-endian data and fallthrough CALL links; pinned SLEIGH
declares big endian. Default execution still rejects `bg.sw_1` and `bg.sh`.
The new 140-entry displacement scan records candidates, including possible
data/mid-instruction matches. It establishes no new ownership for neighboring
bytes at the earlier `0x4551a8` and `0x4551ec` counters.

### F45: a timer decrement independently repeats the address-lane pattern

At `0x241a8b`, code loads halfword `0x4551f6`, subtracts one, and issues a
`bg.sh` whose decoded address is `0x4551f4` at `0x241a94`. It then reloads
`0x4551f6` and clears a flag at `0x4551e7` when zero. A low-halfword store at
decoded address plus two fits this sequence; the literal pinned SLEIGH store
does not update the loaded field. This repeats the earlier response-setting
constraint at `0x3cb30a` in a separate function.

### F46: recovered timer instructions can advance a bounded wait experiment

`TickOnPoll` runs the actual recovered timer prefix whenever a delay reads the
completion flag. It uses a separate synthetic stack, stops before `0x241841`,
and records every prefix. It does not implement CPU interrupts or physical time.
Without that stimulus the wait exhausts the instruction budget; it is never
silently declared complete. Exceeding the scheduled-tick budget is also failure.

Other tests cover nine indexed counters, reload at 1000, and periodic divisors
10/30/50/100/500. Timer runs stop at `0x241841`, `0x2418db`, or `0x2419cf` before
unrecovered service calls. State-six slot waits call delay(1) up to twenty times;
selected cases add an explicitly separate slot-clear stimulus. No physical tick
duration is assigned to any numeric constant.

### F47: initialization leaves timer and delay callbacks null

The setter writes `0x48248c + uint32(index << 2)`, without a local index bound.
The clear routine writes ten zero pointers. The initialization tail installs:

| Index | Value after the recovered setup path |
|---:|---|
| 0 | `0x2621f0` |
| 1 | `0x2623d2` |
| 2 | `0x261abd` |
| 3 | `0x261560` |
| 4 | `0x26062f` |
| 5 | `0x26154e` |
| 6, 7, 8 | zero |
| 9 | `0x260673` |

It sets callback gate `0x4551e1` to one and clears record byte `+0x34` for four
records of stride 168 at `0x4821ec`. Thus timer callback slot `0x4824a4` (index 6)
and delay slot `0x4824ac` (index 8) are null after this setup path. Runtime
mutation or indirect writers remain possible; this is not a lifetime invariant.

The configuration call at `0x2614bf` to `0x260824` remains unrecovered. Prefix
tests check its arguments from configuration bytes `+0x59` and `+0x60`. Separate
tail tests begin after that call with an explicit saved caller frame. Their
successful return does not establish complete initialization.

### F48: the timer has a registration path and additional counters

Routine `0x27081c` passes callback `0x270836`, arguments 0/1/1, and string
`Check timer` to wrapper `0x279e04`. The wrapper calls `0x2a9646`, `0x2a94d3`,
`0x2a94c4`, and `0x2a9488`; those dependencies remain unexecuted.

The dispatch wrapper calls `0x2417f1`, then increments word `0x453d00`, advances
a byte counter at `0x453d18` with a threshold of 100, conditionally increments
`0x453cfc` at multiples of 1000, and decrements two nonzero word countdowns.
Tests cover every byte-counter input and selected 32-bit wrap boundaries.
These tests enter after timer_tick and explicitly supply its saved caller frame.
They do not validate the full dispatch call or establish milliseconds.

### F49: one command produces a checked development workspace

The combined gate rejects existing output directories and paths outside
`analysis/extracted`, including symlink escapes. It rejects optimized Python,
requires tests to run without failure or skips, and records failures without a
successful status. It hashes input scripts/source before and after validation
to reject concurrent source changes. It never overwrites earlier reports.

The latest directory is
`analysis/extracted/firmware-validation-timers-2026-10-23/`. Its `workspace/`
contains 93 manifested base artifacts and two USB images. `validation.json`
contains input and generated-artifact identities; `tests.log` records 92 passing
tests. Individual stage reports preserve the model assumptions and partial-path
boundaries. The 49-component intermediate run remains in
`analysis/extracted/firmware-validation-2026-10-23/`.

| Gate | Latest result |
|---|---:|
| Archive SHA256 identities | 45 |
| Byte-exact Spectrum One corpus reconstructions | 13 |
| Resource CRC16 checks in corpus | 141 |
| Repository tests | 92 |
| Existing helper rewrite comparisons | 1,557 |
| Existing register cases | 266 |
| Existing receive cases, including stopped prefixes | 29,495 |
| Existing transfer cases | 1,832 strict + 218 conditional |
| New timer cases | 424 strict + 3,760 conditional |
| New callback/dispatch cases, including continuations | 2,130 strict |

The previous command-path case counts also pass. Counts above mix full helper
runs, explicit prefixes and continuations; they are not hardware regression
coverage and must not be reported as complete firmware executions.

Both new images are 2,069,060 bytes. All three container checksums validate,
and all eleven resource ranges retain their exact physical bytes.

- Baseline SHA256: `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`.
- Helper experiment SHA256: `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad`.

EFE and VL822/VL103R are verified raw reference exports. This work adds no EFE
repacker or USB source build.

## Reproduce

From the prepared repository environment, choose a fresh output directory:

```bash
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-next-validation
```

To reproduce the fixed source recovery and targeted reports independently:

```bash
.venv/bin/python scripts/reconstruct_dc9_timer.py
.venv/bin/python scripts/reconstruct_dc9_callbacks.py
.venv/bin/python scripts/trace_dc9_timer.py
.venv/bin/python scripts/validate_dc9_timer.py
.venv/bin/python scripts/validate_dc9_callbacks.py
```

Recovery refuses differing existing source/layout entries. The targeted report
commands replace their corresponding analysis JSON; preserve any version you
need to retain first. The combined command writes its reports only under the
new output directory. Python/pypcode/SLEIGH identities are in each model report.

## Preservation and next paths

Git remains `main`, HEAD/local `origin/main`
`50dbabfe6a8d8c9d1616616235ce570538270fde`. The 110 starting changed/untracked
files were copied to `analysis/scratch/timer-before-2026-10-23/`; saved hashes
and original paths were verified. Older workspaces and images remain intact.
No fetch, commit, push, vendor execution or device access occurred.

- **P40 (E40–E41 → F44–F46):** obtain independent store/data-endianness evidence;
  keep conditional policies separate until resolved. Continue identifying other
  counter neighbors and actual interrupt/timer scheduling.
- **P41 (E42 → F47–F48):** trace timer creation dependencies and callback runtime
  writes; recover configuration function `0x260824` and its channel setup calls.
  This function contains observed `0x0f00`/`0x0870` constants and a dispatch table
  at `0x328168`, a concrete route toward display configuration. The constants'
  meaning is not yet established by behavior.
- **P42 (E43 → F49):** use the combined gate as the integration check for future
  source recovery. Full compiler/linker/relocation support, most application
  functionality, EFE/USB builds, recovery procedure and hardware testing remain
  unfinished. Passing the gate must not mark those milestones complete.
