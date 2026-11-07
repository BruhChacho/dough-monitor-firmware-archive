# DC9 active-path source batch

This batch adds twelve editable routines, **821 instructions / 2,388 code
bytes**, and two tables / 292 bytes. The overlay reaches **182 components,
10,338 instructions / 31,697 code bytes**, plus **14 tables / 1,203 bytes**:
**1.306% (about 1.31%)** of the 2,426,560-byte expanded application. This is
code-byte coverage, not a product-readiness estimate. Hardware remains untested.

Work continues from published `e295a65` under the existing [offline scope](scope.md).
The user requested larger coding batches and fewer redundant checks. Lower-cost
agents recovered source and dependencies; parent review corrected routine
boundaries and descriptions, reviewed the two new ISA forms, and integrated the
arithmetic and storage checks. No device operation or vendor executable ran.

## Editable source

Addresses are hex; ends are exclusive. All new routines pass complete local
control-flow checks and byte-exact assembly against the pinned DC9 image.

| Span | Instructions / bytes | Behavior |
|---|---:|---|
| `21be27..21be98` | 40 /113 | Read engine selector bits 2–6; invalid indices return 31 |
| `21dcee..21dd76` | 48 /136 | Select byte-write destination from metadata key |
| `21be98..21bece` | 17 /54 | Engine-parity field update, mask 02 |
| `21bece..21bf19` | 24 /75 | Engine-parity field update, mask 01 |
| `21bf19..21bf85` | 35 /108 | Engine-parity field update, mask 30 |
| `21bf85..21bfca` | 22 /69 | Engine-parity field update, mask 18 |
| `2aacb9..2aad0b` | 29 /82 | Product modulo 2^64 |
| `2aad0b..2aad27` | 10 /28 | Signed 64-bit comparison: less/equal/greater =>0/1/2 |
| `2ab331..2ab6d2` | 318 /929 | Unsigned 64-bit quotient |
| `21fb61..21fe2c` | 249 /715 | Active engine configuration |
| `21fb2b..21fb61` | 19 /54 | Default engine value and mode5 branch |
| `2402ab..2402c4` | 10 /25 | Highest set-bit index; zero returns zero |

The nine-pointer table at `2af5b8..2af5dc` contains all metadata-dispatch targets.
Its hash is `2d298797c026ce4e84ebefd43de1e37f6bcb2438d627275f1aac8be22dfb2dfa`.
The 256-byte table at `33b628..33b728` exactly equals the bit length of each byte
values 0–255. Existing 170 routine records and 12 tables are preserved. The source
is recovered assembly; external floating-point dependencies remain unresolved.

`bn.srl` adds bounded logical variable shifts, rejecting counts >=32. `bg.blesi`
adds signed-register <= signed-five-bit-immediate branching. Encoding derives
from pinned SLEIGH fields and archived examples. Focused checks distinguish
signed/logical behavior and check range rejection. This is not independent
physical ISA verification.

## Behavior gained

Selector checks cover engine indices0–255 and `ffffffff`, all nine table keys
and out-of-range fallbacks, with explicit page/data traces. Four parity helpers
pass 192 conditional cases across both store-width hypotheses, preserving
unmasked bits and returning the lock/counter to zero. Their register locations
are plain mapped bytes; their physical function remains unverified.

Actual recovered timer-prefix instructions run on completion-flag polls. The
active configuration fixture completes two metadata-key writes (values 1 then 0)
under both store policies, with four literal-store ticks or eight lane-store
ticks. These are scheduled instruction interleavings, not elapsed hardware time.

The wide helpers agree with Python integer arithmetic for **1,908 cases**:
641 multiply,626 divide,641 signed comparison. Division by zero remains an
explicit rejection. Visits cover 29/29 multiply, 290/318 divide and 10/10 compare
instructions; this is a bounded sample, not an exhaustive proof.

The existing storage routine now **returns for a single positive-area active
channel** in 36 cases: every channel position, three dimension pairs and three
masks. Both banks receive the full 420-unit allocation, the six expected active
fields change, inactive fields clear, and the remaining bytes and saved
registers are preserved. The actual multiply and divide helpers each execute
twice. Multiple active channels and complete display operation remain unfinished.

## Active-engine integration and store-width divergence

The active-engine checks cover 44 strict guard/bit-index cases and two integrated
store-policy cases. With an explicit read-only input byte `5a` at `454824` and the
bit-length table mapped, full apply under literal stores returns r3=1 after 49,389
main instructions and four recovered ticks. However, literal stores changed
the dimension word to `ef080000`, clearing the adjacent dimension and causing
an early engine return. This result does not establish complete active setup.

The lane hypothesis preserves `ef08a013` and reaches `21fcc9`, before the call
to unrecovered `2aae3d`, after 64,013 main instructions and eight ticks. It has
executed the new engine/default-value routines, multiply and signed comparison;
r3/r4=[0,405] is the exact product 90 * 0x480000000. No conversion result was
invented. The new input is synthetic fixture data, not measured device state.

## Evidence and remaining work

| Evidence | Files | Finding / limitation |
|---|---|---|
| E100 | Three reconstruction generators and twelve assembly files | F97: additional byte-exact editable source; external calls are not assumed to return |
| E101 | `validate_dc9_dispatch_selection.py`, `validate_dc9_dispatch_leaves.py` | F98: selectors and scheduled dispatch advance active configuration; plain bus only |
| E102 | `validate_dc9_wide_arithmetic.py` | F99: arithmetic contracts and positive-area storage return under the model |
| E103 | Active-engine validation and publication summary | Engine entry is editable; later services and physical operation remain incomplete |

P76 follows the active call path through routing, scheduled delays, metadata
writes and engine configuration. Continue with the first missing engine inputs
and floating-point helpers using explicit fixtures; do not supply invented
service results. Also expand multi-channel storage and flagged finalization.
The complete compiler/linker path, most application code and hardware validation
remain outstanding. The first conversion candidate `2aae3d..2aaee6` and its dependency cluster
need carry/borrow research (`bn.subb`, `bn.addc`) and additional encodings.
Do not treat decoder names such as `bg.addci_maybe` as established semantics.
The initial publication run passed its tests and builds but omitted the four
new validators from the central stage list. The runner was corrected and the
complete gate repeated in a fresh directory; the initial workspace remains
preserved. Final results are recorded below after completion.


## Completed publication gate

The complete offline gate finished **2026-11-07 02:11:39 UTC** (user date
2026-11-06 in America/Los_Angeles). All 39 stages passed; **231 tests passed,
with zero failures, errors, or skips**. The run verified 271 run-artifact hashes
and 329 source identities, including 221 base-workspace artifacts and two USB
images. Preservation verified all 425 saved snapshot files, retained 20 prior
workspaces, and preserved 55 BIN files. All three BIN hashes are unchanged. The
completed workspace is
[active-path workspace](extracted/firmware-validation-active-path-2026-11-06-complete/workspace/);
the summary is [community-active-path-workspace.json](community-active-path-workspace.json).

Reproduce with a fresh output directory:

```sh
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-active-path-validation
```

The first publication run omitted four validators from the central stage list.
After correcting the runner, the full gate passed in a fresh directory; the
initial integration run remains preserved. The gate validates offline models and
source fidelity, not physical monitor operation. The active-engine limits above
remain: literal stores clear a dimension and take an early engine return; lane
stores reach unrecovered conversion code.
