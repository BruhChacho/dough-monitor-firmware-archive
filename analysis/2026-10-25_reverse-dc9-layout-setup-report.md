# DC9 layout setup and register request reconstruction

Date: 2026-10-25 (America/Los_Angeles). Scope: [authorized offline firmware
development](scope.md). The owner also requested a repository update, current
READMEs and a percentage in progress reports.

## Result

Eight additional components reproduce 1,914 original bytes / 619 instructions.
The editable overlay now has **104 components, 5,025 instructions / 15,723 code
bytes**, plus nine tables / 795 bytes. Code-byte/application-byte coverage is
**0.648% (about 0.65%)** of 2,426,560 application bytes. This denominator includes
data; the percentage is a coverage proxy, not product readiness or effort.

The recovered setup routine initializes selected records among thirteen software
records. With control calls disabled, selected paths now return through the
existing mask-preparation chain under both explicit store policies. A separate
four-record auxiliary reset returns in the strict model. The enabled full-apply
path gets through the first record's range setup and stops at `0x220aa3`, before
the unrecovered service `0x21d3b1`. It has not configured all thirteen records.

The new validator passes **259 strict cases and 46 conditional cases**. It
checks template copying, selected-record preservation, low-to-high word writes,
range selection, request arguments and actual partial-write order. All memory
is plain Python-backed bytes: no peripheral, page-window or deferred-operation
implementation has been invented. Complete editable firmware and physical
monitor validation remain open goals.

Combined gate results, complete image hashes and source identities are in the
[workspace summary](community-layout-setup-workspace.json). The [build guide](../firmware/README.md)
identifies the newest local source workspace and BINs. Earlier workspaces remain
preserved. An initial snapshot retains all 219 pre-existing working files.

The combined gate passed **142 repository tests**, 45 archive hashes, 13 corpus
roundtrips and 141 resource checksums, plus all model stages and three BIN builds.
The complete stock/helper/layout files remain 2,069,060 bytes each, with valid
checksums and all eleven resource spans unchanged. Their SHA256 prefixes remain
`0b5d8350`, `d88a1683`, `95a06b2f`. All **171 artifact hashes and 200 source
identities** verify. The workspace has143 base artifacts plus two USB images;
ten earlier workspaces and25 earlier BINs also verify.

Three cheaper subagents supplied independent dependency analysis, leaf tests,
encoding implementation and README updates. Parent review checked original
bytes and corrected a five-bit immediate-width mistake before integration.

## Evidence and source spans

| ID | Evidence / reproduction | Result |
|---|---|---|
| E59 | [Recovery script](../scripts/reconstruct_dc9_layout_setup.py), [layout](reconstructed/dc9-source-layout.json) | Eight spans and the new eight-byte template reassemble identically; WI57 |
| E60 | [Setup validator](../scripts/validate_dc9_layout_setup.py), [validation](dc9-layout-setup-validation.json) | 259 strict / 46 conditional contracts; WI58 |
| E61 | [Leaf tests](../scripts/test_dc9_layout_setup.py), [encoding tests](../scripts/test_aeon_setup_encoding.py), [apply regression](../scripts/test_dc9_metadata.py) | Boundaries, state preservation, signed immediates and deeper apply dependency; WI59 |
| E62 | [Combined summary](community-layout-setup-workspace.json), [build guide](../firmware/README.md) | Archive/model/build gate and repository handoff; WI60 |

Use `.venv/bin/python` to run the scripts. The combined command requires a new
output directory and preserves existing reports and builds:

```bash
.venv/bin/python scripts/validate_firmware_repo.py --output analysis/extracted/my-next-validation
```

| Component | Start | Exclusive end | Bytes |
|---|---|---|---:|
| Engine records initialize | `0x22dc46` | `0x22dd9a` | 340 |
| Auxiliary records reset | `0x222fca` | `0x223027` | 93 |
| Engine range configure | `0x22d986` | `0x22dc46` | 704 |
| Engine control configure | `0x220a8b` | `0x220c76` | 491 |
| Direct register word write | `0x23e2b8` | `0x23e2fd` | 69 |
| Deferred register word write | `0x23e50c` | `0x23e58a` | 126 |
| Deferred register byte write | `0x23e5d1` | `0x23e5ed` | 28 |
| Deferred register bit update | `0x23e5ed` | `0x23e62c` | 63 |

Addresses and descriptive names are reconstructed; they are not recovered
vendor symbols. Exact assembly of a span does not mean every path is executed.

## Findings

### F63: setup uses two distinct record layouts

Evidence: E59–E61. Category: reverse_algo; severity: n/a_re. Status: validated
within stated model and prefix limits.

The thirteen-record routine uses pointer `0x47faa4 + index*124`, eight bytes
inside the existing engine record base. Selected entries clear a word at+0,
copy the eight-byte template to+0x18/+0x44/+0x34/+0x2c/+0x3c, store index at
+0x2a, clear bytes+0x21/+0x50/+0x4c/+0x4d and set byte+8 to4. The original
template at `0x2af620` is all zero; additional tests supply a clearly identified
synthetic nonzero template to check copying rather than only zero filling.

When the second argument is nonzero, each selected record calls `0x22d986`
with `(index,1)`, then `0x220a8b` with `(1,index)`. The routine ends by invoking
mask preparation with `(0,original_mask)`. Prefix tests cover every one of the
thirteen indices; conditional no-control returns cover six selected masks.
Neither record count is evidence of a physical engine count.

The auxiliary routine selects four 24-byte records at `0x47fa3c`. It clears
bytes+0/+0x15 and copies eight bytes from `0x2af628` to+0x0c. The archived
template is `00 00 00 00 06 06 00 00`. Tests check all sixteen low masks,
high-only masks, sentinels, r23–r29 scratch effects and retention of the first
three records' writes when the fourth is unmapped.

### F64: range configuration selects word values and direct/deferred paths

Evidence: E59, E60. Category: reverse_algo; severity: n/a_re. Status: complete
conditional direct paths and explicitly stopped deferred prefixes.

The engine's word+4 supplies a register-bank addition. For a zero second argument,
engine byte+0x78 selects channel word offsets+0x5c/+0x60/+0x64 and lengths twelve
bytes later. The start is `(word & 0x3fffffff) >> 5`; the end adds the length
to the masked word with uint32 wrap, then shifts right five. A nonzero second
argument supplies zero start/end and skips those channel-word reads.

Odd/even engine indices choose four register-word offsets under `0x0d800000`:
odd `80/84/c8/cc`, even `88/8c/d0/d4`. Values are start/end/start/end. Global
byte `0x455210` selects direct four-byte writes when zero or deferred requests
when nonzero. The control bit uses `0x3280000e` (odd) or `0x3280008e` (even),
with the bank addition. These arithmetic constants are not physical register
documentation.

The existing byte helpers reject inactive logical banks by returning without
bus access when `logical & 0x7fff00` is zero. Tests retain this behavior for
zero-bank range runs. With bank0x200 the direct path writes the expected bytes.
In plain memory, the even control byte aliases the third byte of the preceding
end word at offset0x8c; ordered trace assertions account for that alias. Actual
page-separated device behavior remains unmodeled.

### F65: deferred helpers supply requests, not proven hardware writes

Evidence: E59, E60. Category: reverse_algo; severity: n/a_re. Status: request
prefixes only; unresolved target `0x27b707`.

The word helper splits values into aligned masked halfword requests. The byte
helper shifts odd-address values left eight, uses mask0xff00, and uses mask0xff
for even addresses. It does not itself truncate arbitrary upper input bits;
the test checks the actual uint32 argument and mask rather than assuming a
final write. The read/modify helper first reads a byte and sets or clears its
selected bits, then follows the byte-request path. No request completion or
transaction ordering beyond the observed prefix is claimed.

### F66: deeper apply execution remains bounded at a real dependency

Evidence: E60, E61. Category: reverse_algo; severity: n/a_re. Status: partial
full-apply runs under both wide-store hypotheses.

Each integrated prefix executes the six metadata-reset calls, initializes the
first selected record and runs its direct range configuration. It reaches
`0x220aa3` with r3=0, the converted engine index for `0x21d3b1`. The second
control dependency is `0x21d8f7`; further control paths involve metadata gates,
register operations and waits. Full display application is still unfinished.

The new instruction forms are `bn.sfgtsi` (signed register versus signed8
immediate) and `bn.cmovsi_2` (flag-selected register or signed5 immediate).
The five-bit field occupies instruction bits3–7. All32 immediates and both
predicates are checked; no decoder-output normalization was needed. Existing
CALL, byte/halfword, endianness and wide-store assumptions remain explicit.

## Paths and next work

| Path | Evidence → finding → next action | Open uncertainty |
|---|---|---|
| P53: setup → range → control | E59/E60 → F63/F64/F66 → recover `0x21d3b1` and `0x21d8f7` | Full enabled setup and metadata gating |
| P54: register requests → deferred service | E59/E60 → F65 → recover `0x27b707` and real request state | Deferred completion and device effects |
| P55: source → repository update | E61/E62 → reproducible validation → publish reviewed source/evidence/docs | Complete source toolchain and hardware validation |

Most application source, the full compiler/linker, EFE/USB source builds and
physical boot/recovery remain unresolved. No updater, vendor DLL, device probe
or flash operation was performed. Original ZIPs and all earlier builds remain
preserved. Repository publication is separately authorized by the owner's
latest request; it does not authorize or establish device operation.

The repository update is published on branch
`codex/community-firmware-layout-setup-2026-10-25` in
[open draft PR #1](https://github.com/BruhChacho/dough-monitor-firmware-archive/pull/1).
GitHub CLI authentication resolved the earlier connector HTTP403/credential
blocker. The PR is not merged. Four validated working inputs (`MANIFEST.csv`,
`analysis/installers.json`, `analysis/inventory.json`, `scripts/test_analysis.py`)
have CRLF/LF-only normalization differences in the Git commit; the other 196
validated input identities match the committed bytes exactly.
