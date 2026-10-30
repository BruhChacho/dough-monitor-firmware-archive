# DC9 metadata consumers and complete reset path

Date: 2026-10-25 (America/New_York). Scope: [offline community firmware
development](scope.md). This follows the [metadata-service milestone](2026-10-24_reverse-dc9-metadata-report.md).

## Result

Thirteen additional components reassemble exactly: 255 instructions / 768 bytes.
The source overlay now contains **96 components, 4,406 instructions and 13,809
code bytes**, plus eight tables / 787 bytes. The code-byte/application-byte
ratio is **0.569%** (13,809 / 2,426,560). The denominator includes data; this is
a coverage proxy, not product completion or engineering effort.

The accumulated-state service at `0x20f1ef` now returns through its real recovered
callees under both explicit store policies. The enclosing six-record metadata
reset at `0x22aca0` also returns. Full layout application still stops at
`0x23faf2`, before the unrecovered call to `0x22dc46`. No external response or
replacement stub was introduced to make these paths return. A real archived
two-byte return routine at `0x2118d2` is included as source.

The new consumer validator passes 2,646 strict cases. The new register-chain
validator checks 262 strict cases (including four expected default rejections)
and 5,336 conditional cases. Each store policy includes 1,840 complete
accumulation runs, one complete six-record reset and one full-apply prefix after
that reset. Physical behavior and a complete editable firmware remain unverified.

The combined gate passed **132 repository tests**, 45 archive hashes, 13
byte-exact corpus roundtrips and 141 resource checksums, along with every model
stage. All three complete BINs remain 2,069,060 bytes with eleven resource spans
unchanged and valid checksums. The stock/helper/layout SHA256 prefixes remain
`0b5d8350`, `d88a1683`, `95a06b2f`. Full identities and build results are in the
[consumer workspace summary](community-metadata-consumers-workspace.json).
The [build guide](../firmware/README.md) identifies the latest generated files.
All 162 generated artifact hashes and 188 source identities match the completed
run. Its workspace contains 135 base artifacts plus two USB images. Nine earlier
workspaces and 22 prior BINs also verify. The register-chain validation visits
all 255 newly reconstructed instructions; instruction coverage is not exhaustive
state coverage or physical verification.

Three cheaper subagents contributed encoding implementation, initial validation
drafts, dependency review and documentation. Parent review corrected address and
fixture mistakes against continuous original disassembly, completed integration
contracts and retained default rejection of ambiguous stores. An early snapshot
preserves 195 working files, including the initial shift-encoding edits. The
exact preceding assembler/model versions remain in the prior snapshot, verified
against the 83-component run's input hashes. No earlier changes were discarded.

## Evidence and exact spans

| ID | Reproduction / artifact | Observation |
|---|---|---|
| E55 | [Consumer recovery](../scripts/reconstruct_dc9_metadata_consumers.py), [register recovery](../scripts/reconstruct_dc9_metadata_registers.py), [source layout](reconstructed/dc9-source-layout.json) | Thirteen original-byte source spans; WI53 |
| E56 | [Consumer validation](dc9-metadata-consumers-validation.json), [validator](../scripts/validate_dc9_metadata_consumers.py) | Strict aggregate/store, channel-state and accumulation-prefix contracts; WI54 |
| E57 | [Register validation](dc9-metadata-registers-validation.json), [validator](../scripts/validate_dc9_metadata_registers.py) | Complete conditional service/reset returns, register traces, state/sentinel checks; WI55 |
| E58 | [Shift tests](../scripts/test_aeon_sra_encoding.py), [FF1/CMOV tests](../scripts/test_aeon_consumer_encoding.py), [register regressions](../scripts/test_dc9_metadata_registers.py), [combined summary](community-metadata-consumers-workspace.json) | Archived instruction identities, semantic boundaries, partial-write behavior and source-to-BIN integration; WI56 |

Run the recovery scripts with `.venv/bin/python`; existing differing source entries
are rejected. Individual validators refresh canonical JSONs. The complete gate
requires a new directory:

```bash
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-next-validation
```

Candidate addresses below have exclusive ends; names describe observed behavior
and are not recovered vendor symbols.

| Component | Start | End | Bytes |
|---|---|---|---:|
| Three-byte state store | `0x20e66d` | `0x20e687` | 26 |
| State combination | `0x20e76c` | `0x20e79d` | 49 |
| Channel state configuration | `0x2340cd` | `0x23417c` | 175 |
| Configuration trampoline | `0x23417c` | `0x234180` | 4 |
| Four-channel enable dispatch | `0x234180` | `0x2341c8` | 72 |
| Enable trampoline | `0x2341c8` | `0x2341cc` | 4 |
| Metadata register application | `0x21125a` | `0x2112a0` | 70 |
| Application trampoline | `0x2112a0` | `0x2112a4` | 4 |
| Archived return callback | `0x2118d2` | `0x2118d4` | 2 |
| Register bank offset | `0x211855` | `0x211874` | 31 |
| Channel register update | `0x213b64` | `0x213bbb` | 87 |
| Register bit0x40 selection | `0x212d95` | `0x212e18` | 131 |
| Register bit0 accumulation | `0x212e18` | `0x212e89` | 113 |

## Findings

### F59: accumulated bytes drive two different sets of channel state

Evidence: E55–E57. Category: reverse_algo; severity: n/a_re. Status: validated
within the bounded model; physical meaning remains unknown.

At state base `0x4543bc`, the combination helper calculates three bytes:
`s[7] | (s[1] ? 0x80 : 0)`, `s[7] | s[3] | s[6] | s[4]`, and `s[7]`.
The tail stores them at `0x454160..0x454162`. It clobbers scratch registers
including r23 and r24; the validator checks these effects and surrounding bytes.

The next routine publishes the low bytes of r3..r8 at `0x453bd6`, `0x453bd5`,
`0x453bcd`, `0x453bce`, `0x453bcc`, `0x453bd4`. For each low bit of r8 it
writes word1 (set) or word4 (clear) at `0x4800fc + index*132`. When that bit is
also set in the low byte of the original r6, it calls the archived return
callback with the index. Higher mask bits do not select additional records.
These addresses are ordinary mapped memory in the model, not emulated hardware.

### F60: enable-byte storage differs from the masked-register fields

Evidence: E55, E57, E58. Category: reverse_algo; severity: n/a_re. Status:
conditional on the documented instruction and store semantics.

Dispatch calls the register helper four times with `(index, mask_bit)`. The
helper stores the low input byte at **`0x453ba4 + index`**. A separate bank
offset maps indices0/1/2/3 to `0/0x300/0x800/0xb00`, used with logical registers
`0xfff71074` and `0xfff71075`. These are separate address calculations.

Under current CMOV1 semantics, the first masked write uses the original input
with mask4. Boolean inputs0 and1 both clear that bit; arbitrary input4 sets it.
This surprising result is preserved and documented rather than changed to fit
the descriptive routine name. The second write replaces the low two bits with
1 for zero input or0 for any nonzero uint32 input. Tests cover zero, boolean,
non-boolean and high-bit values, all four banks, unselected bytes and write order.

Default execution still rejects the ambiguous counter store after the software
enable byte has changed. A missing second register leaves the first register
updated and the counter at1. No rollback or transaction guarantee is inferred.

### F61: the full reset loop now completes under explicit store policies

Evidence: E56, E57. Category: reverse_algo; severity: n/a_re. Status: complete
conditional model executions; no physical validation.

The third accumulated-state consumer conditionally publishes two bytes according
to bit0 at `0x45446c`. It sets bit0 in the registers selected by input bits4–6
at logical `0x11c4/0x12c4/0x13c4` and accumulates bits0–2 through its supplied
byte pointer. Its tail clears bit0x40 in all three registers, then sets selected
ones. Ordered write checks distinguish the clear pass from the set pass.

Combined accumulation tests vary the global gate, initial state fill, enable
argument, selector and flags. They check publication bytes, channel state,
register results, counter/lock cleanup, stack and saved registers. Literal
`bg.sh` and alternate lane stores still produce different adjacent-byte effects;
each run is checked against its selected policy.

The reset loop calls that complete chain six times. Each 176-byte metadata record
has byte+0x10 set to4, halfword+0x12 cleared, word+0x0c cleared and byte+0x70
cleared. Whole-record comparisons retain distinctive neighboring sentinels.
The layout-apply prefix now passes this reset and supplies `(0x1fff,1)` to the
next unexecuted service at `0x22dc46`. It is still a partial apply run.

### F62: instruction support expands without resolving the physical ISA

Evidence: E58. Category: reverse_algo; severity: n/a_re. Status: checked against
archived bytes and the pinned SLEIGH definition; not independent ISA validation.

`bn.sra` performs signed32 right shift for counts0–31, reading aliased operands
before writing the destination; larger variable counts reject. `bn.ff1` returns
the one-based position of the least-significant set bit, or0 for zero. `bn.cmov_1`
uses operand A for a true flag and B for false, matching the pinned definition.
Known physical CALL, endianness, byte/halfword and wide-store uncertainties
remain explicit. No complete compiler/linker or device emulator is claimed.

## Paths and next work

| Path | Evidence → finding → next action | Remaining uncertainty |
|---|---|---|
| P50: state → channel globals/registers | E55/E56 → F59/F60 → trace runtime writers and independent CMOV/store evidence | Physical channel roles and register meaning |
| P51: apply → complete reset → next setup | E57 → F61 → recover `0x22dc46`, then `0x222fca` and following apply dependencies | Full configuration and display operation |
| P52: instruction source → model | E58 → F62 → obtain independent ISA/ABI evidence | Wide-store lanes, CALL links, data endianness |

The remaining geometry service `0x2686dd` and special preparation services
`0x20ece9/0x20e990` are separate open paths. Most application source, an AEON
compiler/linker, EFE/USB source builds, real recovery and physical monitor
validation remain unfinished. Original ZIPs and earlier workspaces are preserved;
no device access, flashing, commit or publication was performed.

The next setup spans were inspected continuously but are not reconstructed or
counted yet: `0x22dc46..0x22dd9a` iterates thirteen 124-byte records, uses the
existing eight-byte template at `0x2af620`, optionally calls `0x22d986` and
`0x220a8b`, then tail-calls `0x23d3a0`. `0x222fca..0x223027` selects four
24-byte records and copies an eight-byte template at `0x2af628`. They provide
the next bounded offline recovery task; thirteen software records do not prove
thirteen physical engines.
