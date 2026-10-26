# Dough firmware reverse engineering: continuation handoff

Prepared 2026-10-21 (America/Los_Angeles). This file is intended to let a new
Codex chat continue without the previous conversation.

## Latest continuation: layout setup and repository publication

Publication status: the validated update is prepared on local branch
`codex/community-firmware-layout-setup-2026-10-25`. The GitHub connector resolves
the repository to `BruhChacho/dough-monitor-firmware-archive`, but creating a Git
tree failed with HTTP403 "Resource not accessible by integration". HTTPS Git
has no configured credentials, and no configured SSH identity or agent is
available. No remote branch or pull request was created. Resume publication
after write access is configured; do not treat this as a validation failure.

Updated 2026-10-25 (America/Los_Angeles). Read
`analysis/2026-10-25_reverse-dc9-layout-setup-report.md`,
`analysis/community-layout-setup-workspace.json`, and `firmware/README.md`.
The owner explicitly requested repository publication and current READMEs after
validation. **Always report the current source-coverage percentage**; do not
present it as an overall product-readiness percentage. Three lower-cost agents
helped with encoding, independent audit, leaf tests, and README updates.

- Current source: **104 components, 5,025 instructions / 15,723 code bytes**,
  and nine tables / 795 bytes. Coverage is **0.648% (about 0.65%)** of
  2,426,560 application bytes. The full editable application and physical
  operation remain unfinished.
- All 219 starting working files are preserved in
  `analysis/scratch/layout-setup-before-2026-10-25/`, with verified hashes and
  original paths. Validation ran from `HEAD` `50dbabf`. Publication branch:
  `codex/community-firmware-layout-setup-2026-10-25`. Check current Git and
  remote state before continuing; the owner now authorizes repository updates,
  superseding earlier offline-only publication descriptions. Device work has
  not been performed.
- Recovery script `reconstruct_dc9_layout_setup.py` adds 8 components,
  1,914 bytes, and 619 instructions:
  `22dc46..22dd9a` engine-record setup; `222fca..223027` auxiliary reset;
  `22d986..22dc46` range configuration; `220a8b..220c76` control
  configuration; `23e2b8..23e2fd` direct word write; `23e50c..23e58a`
  deferred word; `23e5d1..23e5ed` deferred byte; and `23e5ed..23e62c`
  deferred bit update. The new template at `2af628` is
  `0000000006060000`. All addresses are hex and ends are exclusive.
- Engine setup iterates 13 records of stride 124 from pointer `47faa4`
  (`base 47fa9c + 8`). Selected records clear word `+0`, copy 8 bytes from
  template `2af620` to `+18`, `+44`, `+34`, `+2c`, and `+3c`, store the index
  at `+2a`, clear bytes `+21`, `+50`, `+4c`, and `+4d`, and set `+8` to 4.
  The original template is zero; synthetic nonzero-template cases are explicit.
  Flag 1 calls `22d986(index, 1)`, then `220a8b(1, index)`; flag 0 skips those
  calls. The tail calls `23d3a0(0, original_mask)`.
- Auxiliary reset handles 4 records of stride 24 from `47fa3c`. For selected
  low four mask bits it clears `+0` and `+15`, then copies `2af628` to `+c`.
  High bits are ignored; `r23..r29` are clobbered. An unmapped fourth record
  leaves the first three writes. No physical engine count is inferred.
- Range configuration reads engine word `+4` for the bank, byte `+10` for the
  channel, and byte `+78` for the subtype. Flag 0 uses channel-word offsets
  `5c/60/64` and lengths `68/6c/70`; start is
  `(word & 3fffffff) >> 5`, and end is `uint32(masked_word + length) >> 5`.
  Flag 1 uses zeros without channel-word reads. Parity selects word offsets
  odd `80/84/c8/cc` or even `88/8c/d0/d4` under `0d800000 + bank`. Global
  `455210` zero means direct word; nonzero means deferred requests. Control
  addresses are `3280000e/8e + bank`.
- The existing active-bank guard, logical `& 7fff00 == 0`, produces no bus
  accesses; this was checked with zero bank. Active bank `200` tests show that
  even control `8e` aliases end word `8c + 2` in plain memory; the ordered trace
  accounts for this. No hardware page isolation is modeled.
- Deferred-write requests stop before `27b707`. A word splits into aligned
  halfword requests. For bytes, odd shifts `r4` left 8 but does not truncate all
  upper bits; even passes `r4` unchanged. Masks are `ff00` and `ff`,
  respectively. Do not infer completed queued or hardware writes.
- The encoder adds `bn.sfgtsi` and `bn.cmovsi_2`. The `cmovsi_2` immediate is
  **signed five bits** (field bits 3..7), not three. The parent caught and
  corrected the initial wrong-width interpretation. All 32 immediate values
  were tested with both predicates; there is no decoder quirk.
- `validate_dc9_layout_setup.py`: **259 strict, 46 conditional**. Complete
  no-control setup returns selected masks; direct range returns both policies;
  all 13 enabled-record cases stop before `22dd50`. Full apply enters the real
  first-record range/control and stops at **220aa3**, before **21d3b1**, with
  converted index `r3=0`. This includes all six metadata-reset calls. The
  enabled 13-record setup remains incomplete.
- Successful gate: `analysis/extracted/firmware-validation-layout-setup-2026-10-25/`.
  **142 tests**, 45 archive hashes, 13 corpus roundtrips / 141 resource
  checksums, all model stages, and 3 BINs pass. Stock/helper/layout hashes are
  unchanged (`0b5d8350` / `d88a1683` / `95a06b2f`); each BIN is 2,069,060 bytes
  with 11 unchanged resources. Canonical evidence describes the latest gate.
  Original ZIPs, 10 previous workspaces, and 25 prior BINs are preserved and
  verified. The latest audit verified **171 artifact hashes**, **200 source
  identities**, and **143 workspace base artifacts plus 2 USB artifacts**.

Next source steps: recover `21d3b1` and `21d8f7`, called by `220a8b`; separately
recover request service `27b707`. Downstream control includes `22607c`,
`23ee2c`, `23ea03`, `23e13b`, `21bd1e`, `220995`, and the existing `2421d3`
wait. Keep unknown calls unexecuted rather than stubbed. Continue geometry
`2686dd`, special handlers `20ece9` / `20e990`, and independent ISA, CALL, and
store evidence. Most of the application, a full compiler/linker, EFE/USB source
builds, and physical boot/recovery remain open.

## Previous continuation: metadata consumers and complete reset

Updated 2026-10-25 (America/New_York). Read
`analysis/2026-10-25_reverse-dc9-consumers-report.md`,
`analysis/community-metadata-consumers-workspace.json`, and `firmware/README.md`.
The owner requested continued work and multiple cheaper agents. Three
`gpt-6-luna` agents contributed encoding, initial validation, review and docs;
parent corrected draft/address mistakes, implemented integration and ran gates.

Git remains `main`, HEAD/local `origin/main` at `50dbabf`; no commit/push/fetch,
vendor execution, hardware access or flashing. An early 195-file snapshot is
`analysis/scratch/metadata-consumers-before-2026-10-25/`. It includes initial
bn.sra edits; exact pre-sra assembler/model versions remain in the prior
`metadata-service-before-2026-10-24` snapshot and match the 83-component run's
input hashes. All saved hashes/original paths verified. Preserve every snapshot.

- Current source: **96 components, 4,406 instructions / 13,809 code bytes**,
  eight tables / 787 bytes. Coverage proxy **0.569%** of 2,426,560 application
  bytes. This is not product completion. Hardware remains untested.
- `reconstruct_dc9_metadata_consumers.py` adds nine components / 406 bytes /
  131 instructions: state store `20e66d..20e687`, combine `20e76c..20e79d`,
  configuration `2340cd..23417c` and jump `23417c..234180`, dispatch
  `234180..2341c8` and jump `2341c8..2341cc`, register apply
  `21125a..2112a0` and jump `2112a0..2112a4`, actual archived two-byte return
  `2118d2..2118d4`. Addresses are hex and ends exclusive.
- `reconstruct_dc9_metadata_registers.py` adds four / 362 bytes / 124 instructions:
  bank offset `211855..211874`, channel registers `213b64..213bbb`, bit40
  selection `212d95..212e18`, bit01 accumulation `212e18..212e89`.
- New encoder/model forms bn.sra, bn.ff1, bn.cmov_1 match archived encodings and
  pinned SLEIGH semantics. Arithmetic shifts >=32 reject; FF1 returns lowest
  set bit position1..32 or0; CMOV1 chooses A if flag else B. Still no physical
  ISA proof. Default ambiguous wide-store rejection remains intact.
- Consumer validation **2,646 strict cases**: 1,284 aggregate/store returns,
  1,290 channel-state returns, 72 prefixes stopping before `20f2ae`.
  Combine writes low bytes to454160..162, clobbersr23/r24. Channel-state word
  address is **4800fc + index*132**, NOT480110. Six argument-byte addresses:
  453bd6,453bd5,453bcd,453bce,453bcc,453bd4. Real2118d2 is just `bt.jr r9`.
- Register-chain validation **262 strict + 5,336 conditional cases**. Each
  policy includes1,840 COMPLETE accumulation returns, one COMPLETE six-record
  reset and one apply prefix after reset. No service stubs. Strict includes
  four expected ambiguous-store rejections after software-byte publication.
- Correct software enable store: **453ba4+index**, NOT4543a4 and not+bankoffset.
  Bank offsets0/300/800/b00 map indices0..3; logical registersfff71074/fff71075.
  Under pinnedCMOV1 semantics boolean1 clears mask4; arbitrary value4 sets it.
  Preserve this surprising result, don't silently fix. Second low2bits=1 for
  zero input,0 for nonzero. Tests check untouched banks and ordered writes.
- Register apply reads45446c bit0; if clear publishes originalr3/r4 at454468/
  45446d. Helper212e18 sets bit0 in selected11c4/12c4/13c4 and ORs low3bits
  through pointer45446a. Helper212d95 clears bit40 in all three then sets selected
  bits. Selection uses input bits4..6. Bus is plain memory, no page windows.
- Complete reset22aca0 changes all six176-byte records: +10 byte4, +12 halfword0,
  +0c word0,+70 byte0; other bytes preserved. Full apply now stops **23faf2**
  before **22dc46**, with arguments1fff,1. Earlier20e76c and first-reset stops
  remain historical/focused prefix tests, no longer the deepest completed path.
- Successful combined gate:
  `analysis/extracted/firmware-validation-metadata-consumers-2026-10-25/`.
  **132 tests**,45 archive hashes,13 corpus roundtrips/141 resource checksums,
  every model gate and all three BIN builds pass. Stock/helper/layout hashes
  unchanged0b5d8350.../d88a1683.../95a06b2f...; each2,069,060 bytes with11
  unchanged resource spans. Canonical validation/build JSONs describe this run.
  All162 artifact hashes/188source identities verified; workspace135 base+2USB.
  Nine prior workspaces/22prior BINs verify. New255instructions all visited by
  conditional register validation; not exhaustive state or physical coverage.
  The83-component run/summary remain preserved historical evidence.

Next offline task: recover **22dc46..22dd9a** (340 bytes), then
**222fca..223027** (93 bytes). Continuous disassembly inspected these, but they
are not yet source/counts. First iterates13 software records ofstride124,
starts pointer47faa4 (recordbase47fa9c+8), uses existingtemplate2af620,
optionally calls22d986 at22dd50 and220a8b at22dd58, then tailcalls23d3a0.
Second handles4 records ofstride24 at47fa3c, copies8bytes from2af628 to+0c,
clears+0/+15; clobbers high scratchregisters23..29. Don't assume physical
engine counts or register ABI. Recover/add template2af628 and trace dependent
calls with real state. Other open paths: geometry2686dd,special20ece9/20e990,
independent ISA/ABI, full toolchain, most source,EFE/USB builds, hardware/recovery.

## Previous continuation: metadata routing and state accumulation

Updated 2026-10-24 (America/Los_Angeles). Read
`analysis/2026-10-24_reverse-dc9-metadata-report.md`,
`analysis/community-metadata-workspace.json`, and `firmware/README.md`.
The owner reiterated100% editable application and multiple cheaper subagents.
Three `gpt-6-luna` agents handled dependency/encoding reviews, bounded tests,
docs and artifact audits. Parent review remains necessary: proposed selector
and store-offset formulas were corrected against real bytes/model execution.

Git remains `main`, HEAD/local `origin/main` at `50dbabf`; no fetch/commit/push,
vendor execution, device access or flashing. Starting164 files are preserved in
`analysis/scratch/metadata-before-2026-10-24/`; an intermediate184-file snapshot
is `analysis/scratch/metadata-service-before-2026-10-24/`. All saved hashes and
original paths verified. Eight previous workspaces and19 prior BINs also verify.

- Current source: **83 components,4,151 instructions/13,041 code bytes**;
  eight tables/787 bytes. Code/application-byte coverage proxy is **0.537%**
  (13,041/2,426,560), up from0.440% at apply and0.512% at intermediate routing.
  The denominator includes data; this is not product completion or effort.
- `reconstruct_dc9_metadata.py` adds11 components/1,730 bytes: five accessors
  at `0x2227da..0x222843`, two engine register helpers at
  `0x21d1e5..0x21d3b1`, mask preparation `0x23d3a0..0x23d4fc`, geometry service
  `0x23d4fc..0x23d71e`, masked byte `0x23dfe1..0x23e0b6` and halfword update
  `0x23e152..0x23e18c`. Full span table is in the report.
- Engine byte+0x1d (base0x47fa9c/stride124) selects metadata at0x3b4950/stride176.
  Its uint32 key maps bank:<=4 ->low8(key+3),5..7 ->low8(key-5),else low8(key).
  Logical register helpers use0xfff30382/0xfff30380 +bank*512. No connector names.
- Metadata validation: **2,433 strict+290 conditional cases**,394/564 new
  instructions visited plus93 old. Per store policy144 complete mask-preparation
  runs and one apply prefix stop at0x22acd1. Special branch stops before0x20ece9;
  geometry stops before0x2686dd (640 prefixes/1408 returns). Geometry reads
  engine+0x10 before its >3 guard; metadata bit0x20 rejects, bits0x0c require
  channel+0x81 nonzero. Full geometry operation remains unexecuted.
- Masked-register validation: **32 default rejections+64 conditional cases**.
  Direct/paged byte/halfword accesses, masks and four counter edges checked.
  Default rejects ambiguous stores. Counter-neighbor differences remain explicit.
  Missing second-byte mapping can leave the first byte changed; outer preparation
  can also write its first mask before later default rejection. No atomicity or
  physical page/lock/peripheral model is implied.
- Integrated preparation really clobbers r23: register writer at0x23ddca loads
  broadcast mask without saving r23. Tests require zero in the zero-mask fixture,
  preserving other checked high registers and stack. Complete ABI unresolved.
- Encoder/model adds bt.movhi, bn.extbs, bn.sflesi, bn.sll with archived-byte
  checks. Signed bounds/aliases tested; variable shifts>=32 reject. extbs uses
  existing low-byte hypothesis unlike pinned SLEIGH high-byte slice. Physical
  ISA, little-endian data, CALL links and wide stores remain hypotheses.
- `reconstruct_dc9_metadata_service.py` adds4 components/629 bytes: selector
  `0x20e687..0x20e6c5`, accumulation `0x20f1ef..0x20f401`, publication
  `0x20fe64..0x20fe85`, trampoline `0x20ff1b..0x20ff1f`;32-byte table0x2af120.
  Selector0..7 returns hex**80,01,02,04,08,10,20,40**,larger inputs0.
  It is NOT a descending bit shift.
- Service validation: **2,833 strict+150 conditional cases**,174/199 instructions
  visited. Global gate0x4543bc controls the flag tree; enable/disable changes
  membership byte+12. BOTH branches call common service0x20e76c at0x20f28c.
  Tests stop there; six-record metadata reset has NOT completed. Full apply
  regression with supplied mappings/globals now reaches this next dependency.
  Publication tails are tested separately: literal bg.sh overwrites flag43dd
  before OR2; alternate lane writes low16 at43de. bg.sw_1 writes at43e0 under
  both policies (four or two bytes), NOT43e2. Isolated tail return is not service
  chain completion.
- Latest successful gate:
  `analysis/extracted/firmware-validation-metadata-service-2026-10-24/`.
  **118 tests**,45 archives,13 corpus roundtrips/141 resource checksums and all
  model gates pass. Workspace122 base artifacts+2 USB;147 generated hashes and
  167 source identities verified. Canonical model/build JSONs describe this run.
  Stock/helper/layout hashes remain0b5d8350.../d88a1683.../95a06b2f...; all are
  2,069,060 bytes with eleven unchanged resource spans and valid checksums.
  Hardware remains untested; no complete-source or product-working claim.
- Intermediate79-component/115-test run remains at
  `analysis/extracted/firmware-validation-metadata-2026-10-24/`, summarized by
  `analysis/community-metadata-routing-workspace.json`. Preserve both runs.

Next offline source step: recover common helper `0x20e76c..0x20e79d` (49 bytes)
and tail `0x20e66d..0x20e687` (26 bytes), then consumers
`0x23417c ->0x2340cd`, `0x2341c8 ->0x234180`, `0x2112a0 ->0x21125a`.
First helper derives r3=byte(+7)|(byte(+1)?0x80:0),
r4=byte(+7)|byte(+3)|byte(+6)|byte(+4),r5=byte(+7),from0x4543bc;
tail writes low bytes to0x454160..162. These two spans were inspected but are
not counted/reconstructed. r4 includes byte+7, NOT byte+1. Downstream consumers
use unsupported bn.sra; recover it conservatively. Also trace geometry0x2686dd
and special0x20ece9/0x20e990. Most source, compiler/linker, EFE/USB builds,
real recovery and physical validation remain open. Don't repeat label questions.

## Previous continuation: editable layouts and downstream apply paths

Updated 2026-10-24. Read
`analysis/2026-10-24_reverse-dc9-configuration-report.md`,
`analysis/community-apply-workspace.json`, and `firmware/README.md`.
The owner explicitly wants **100% editable application**, asked for percentage
status, and authorized cheaper-model subagents for repetitive independent work.
Two `gpt-6-luna` subagents handled read-only audits and documentation here.
The overall objective remains unfinished; continue substantive source recovery.

Git remains `main`, HEAD/local `origin/main` at `50dbabf`. No fetch, commit,
push, vendor executable, device operation or flashing occurred. Configuration
work preserved 137 starting files in
`analysis/scratch/configuration-before-2026-10-23/`; subsequent apply work
preserved 150 files in `analysis/scratch/apply-before-2026-10-24/`. Saved hashes
and original-path presence verified. Six previous workspaces and thirteen prior
BINs verify, including the intermediate configuration workspace. Preserve them.

- Current source: **68 components, 3,388 instructions / 10,682 code bytes**,
  seven tables / 755 bytes. Code-byte/application-byte ratio is **0.440%**
  (application 2,426,560 bytes), up from 0.337% timer and 0.399% configuration.
  The denominator includes data; this is a coverage proxy, not engineering effort
  or product completion. Full stock BIN reproduction works; physical boot,
  display operation and recovery remain untested. No defensible overall
  product-completion percentage is available.
- `reconstruct_dc9_configuration.py` adds six exact components: layout setup
  `0x260824..0x260c02`, record configure `0x23e7f6..0x23e8a2`, selective reset
  `0x23e8a2..0x23e999`, flag setter `0x23e734..0x23e74a`, and size selectors
  `0x260459..0x26047c` / `0x26047c..0x26049f`. Added dispatch `0x328168`/24B,
  rectangle table `0x3c5d10`/192B, reset template `0x2af620`/8B.
- `validate_dc9_configuration.py`: **542 strict + 492 conditional cases**.
  Layout IDs0..5 construct 1,2,2,2,3,4 active records of stride168 at `0x4821ec`.
  Mode0 uses immediate rectangle; mode1 second record has subtype/config
  overrides and x alignment. All configuration runs stop before calls at
  `0x2608e5` / `0x260abe`; no completed display application claim.
- Encoder/model adds `bn.sh_2`, with the same explicit low-halfword hypothesis
  as `bn.sh_1`. Offset includes its lane (2 mod4); no extra +2 is applied.
  Wide `bg.sw_1`/`bg.sh` still reject by default. Conditional zero stores yield
  the same tested record bytes under both policies; no physical ISA proof.
- `dc9-rectangles.json` and `dc9-rectangles-asymmetric.example.json` are structured
  editable sources under `analysis/reconstructed/`. Six modes x four records x
  four uint16 fields. x/y/width/height interpretation is inferred, not verified
  on screen. Example mode2 changes widths1920/1920 to1600/2240 and second x1600.
  Only six application bytes change within expanded `[0x1c5d50,0x1c5d60)`.
- Workspace builds explicitly select JSON using `--experimental --rectangles
  dc9/source/dc9-rectangles-asymmetric.example.json`; default builds do not
  implicitly consume edited standalone JSON. Both JSONs are exported. Input
  schema rejects booleans, truncation, wrong shapes and extra fields. No screen
  bounds or physical display safety is implied by uint16 validation.
- `reconstruct_dc9_apply.py` adds six exact components: apply orchestration
  `0x23fad0..0x23fc0a`, source switch `0x23fc0a..0x23fd13`, engine preparation
  `0x204000..0x204059`, update range `0x22ac17..0x22aca0`, metadata reset
  `0x22aca0..0x22acf2`, conditional wait `0x2421d3..0x242247`.
- `validate_dc9_apply.py`: **2,965 strict cases**, visiting159 of339 new
  instructions. Full apply is unexecuted. Entry reaches metadata reset then
  unrecovered service `0x23d3a0`; no external calls are replaced with stubs.
  Explicit continuations cover the three-record flag+0x81 loop after setup,
  first mask-selected rectangle copy, selective metadata reset iterations and
  guards. Continuation returns must never be called full routine success.
- Apply has a four-engine preparation loop, then a distinct three-record loop.
  Mask+0x2a selects downstream destinations; eight bytes from record+0x18 copy
  to `0x47fa9c + bit_index*124 + 0x20`, stopping before `0x23d4fc`. Sixteen
  synthetic fixture destinations exercise uint16 masks, not physical engine count.
  Source switch guards selector>5 / zero masks; engine helper guards index>3.
  Config bit0x20 or inactive `0x4551e8` bypasses polling. Other poll cases stop
  before ambiguous store `0x2421fe` to countdown `0x455208`.
- Latest successful run:
  `analysis/extracted/firmware-validation-apply-2026-10-24/`. **102 tests** pass,
  45 archives, 13 byte-exact corpus roundtrips / 141 resource checksums, all prior
  model gates plus configuration/apply. Its workspace has107 base artifacts +2
  USB images and three builds. All129 generated hashes and143 source identities
  independently checked. Canonical validation/build JSONs now describe this run.
- Latest three complete BINs are in that run's `workspace/build/`. Baseline
  SHA `0b5d8350...`, helper `d88a1683...`, layout
  `95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a`.
  All2,069,060 bytes; all eleven resource spans unchanged; checksums valid.
  Standalone layout output `analysis/extracted/rebuild/dc9-v101-asymmetric-layout.experimental.bin`
  matches the workspace output. Sidecar layout hashes differ intentionally with
  relocated source paths. No image has been booted or offered for installation.
- Intermediate successful62-component/98-test run is retained at
  `analysis/extracted/firmware-validation-configuration-2026-10-23/`, summarized
  by `analysis/community-configuration-workspace.json`. Do not overwrite it.

Next concrete offline task: recover `0x23d3a0..0x23d4fc` and dependency
`0x222804`, then trace `0x21d1e5`/`0x21d2bf`, metadata service `0x20f1ef`, and
downstream geometry consumer `0x23d4fc`. The first span was inspected but is not
yet reconstructed or included in source coverage. Trace actual state changes
across these calls rather than inventing service responses. Continue independent
ISA evidence, remaining receive bounds and timer scheduling in parallel when
useful. Full compiler/linker support, most functionality, EFE/USB source builds
and hardware/recovery validation remain open. No need to repeat the label question.

## Previous continuation: timers, callbacks and one offline repository gate

Updated 2026-10-23. Read `analysis/2026-10-23_reverse-dc9-timer-report.md` and
`firmware/README.md`. The owner requested sustained work toward a fully working
community firmware repository. The objective is still unfinished: the source
build is partial and no device has been selected or tested. Continue substantive
recovery; do not equate a byte-identical BIN or passing models with full source.

Git remains `main`, HEAD/local `origin/main` at `50dbabf`. The 110 starting
changed/untracked files are preserved in `analysis/scratch/timer-before-2026-10-23/`
with a verified hash manifest. No fetch/commit/push, vendor execution, device
access or flashing. All older workspaces and outputs remain intact.

- Added thirteen exact components through `reconstruct_dc9_timer.py` and
  `reconstruct_dc9_callbacks.py`: full timer routine `0x2417f1`, nop/return,
  delay helpers `0x24209d`/`0x2420bb`, timer init/repeat; callback setter/clear,
  channel record byte setter, callback initialization `0x2614a9`, timer
  registration `0x27081c`, dispatch `0x270836`, creation wrapper `0x279e04`.
  Source: **56 components, 2,576 instructions / 8,178 bytes**, four tables /
  531 bytes. Code coverage by recovered bytes is about 0.337% of application.
- Encoder/model adds `bt.jalr`, `bt.nop`, `bn.divu`, `bn.sfleui`. Indirect
  destinations must be known instruction boundaries and are read before r9 is
  overwritten. Division by zero and nonzero-nop execution are rejected.
- Timer validation: 424 strict cases and 3,760 conditional cases. Actual timer
  prefixes run on delay-flag reads with a separate synthetic stack; this is an
  explicit interleaving, not CPU interrupts or a physical clock. Prefix stops
  at `0x241841`, `0x2418db`, `0x2419cf` remain explicit. No-stimulus waits and
  exceeded budgets fail. All timer-function execution is partial.
- Stronger store constraint: delay count `0x455204` is adjacent to completion
  flag `0x455206`. Timer decrement `0x241ac7` using a literal four-byte store
  clears the flag early (count3 exits after one prefix with count2). Halfword
  store permits three prefixes/count0. Another decrement loads `0x4551f6` but
  `bg.sh` decodes store address `0x4551f4`, supporting the +2 lane hypothesis.
  Default still rejects `bg.sw_1`/`bg.sh`. No independent ISA validation; data
  remains modeled little endian while SLEIGH declares big endian.
- Callback/dispatch validation: 2,130 strict cases, explicitly including
  continuations. Table `0x48248c` has ten entries. Initialization clears all,
  installs indices0–5 and9, enables `0x4551e1`, leaving tick slot6 (`0x4824a4`)
  and delay slot8 (`0x4824ac`) zero. Runtime mutation remains untraced.
  Configuration call `0x260824` is not executed: tests cover prefix arguments
  and a separate tail with a supplied saved caller frame.
- Registration passes `0x270836`, arguments0/1/1, string `Check timer` at
  `0x33cb9d` to `0x279e04`. Dependencies `0x2a9646`, `0x2a94d3`, `0x2a94c4`,
  `0x2a9488` remain unexecuted. Dispatch continuation maintains word/byte
  counters and divisors100/1000. No milliseconds/tick period claim.
- `scripts/validate_firmware_repo.py --output NEW_DIRECTORY` runs archive,
  corpus, tests, helper/command/register/receive/transfer/timer/callback gates,
  exports raw files and builds both images. Output must be fresh under
  `analysis/extracted`; failures are recorded and return nonzero; `-O` rejected.
  Inputs are hashed before/after; existing analysis reports are not overwritten.
- Latest successful run: `analysis/extracted/firmware-validation-timers-2026-10-23/`.
  `workspace/` contains 93 base artifacts + two USB images and both build BINs.
  Baseline/helper hashes unchanged (`0b5d8350...`/`d88a1683...`); all checksums
  and eleven original resource spans pass. **92 tests**, 45 package hashes,
  13 corpus roundtrips / 141 resource checksums, all previous model gates pass.
  Versioned summary: `analysis/community-timer-workspace.json`.
  Canonical validation/build JSONs now describe this 56-component run.
  The preceding 49-component run is retained at
  `analysis/extracted/firmware-validation-2026-10-23/`.

Next concrete offline tasks: recover `0x260824` and channel configuration calls
(`0x23e8a2`, `0x23e7f6`, `0x23fad0`), using its dispatch table `0x328168` and
observed constants `0x0f00`/`0x0870` as evidence, without assuming their meaning.
Trace timer creation dependencies and actual scheduling/tick period. Continue
independent ISA/store evidence, actual peripheral contracts, and full receive
payload bounds. The old counter neighbors `0x4551a8`/`0x4551ec` remain unresolved.
Full compiler/linker support, most functionality, EFE/USB builds, recovery and
hardware validation remain open. No need to repeat the owner's label question.

## Previous continuation: transfer dependencies and store hypotheses

Updated 2026-10-23. Read `analysis/2026-10-23_reverse-dc9-transfer-report.md`.
Git remains `main`, HEAD/local `origin/main` at `50dbabf`; no fetch/commit/push,
vendor execution or device access. Starting work is preserved in
`analysis/scratch/transfer-before-2026-10-23/` (96-file hash manifest).

- Added eight exact components: channel lookup `0x20c711`, follow-up service
  `0x20d2b7`, indirect byte writer `0x20e3be`, reverse-address word writer
  `0x20e43a`, forward copy `0x2aab1e`, response formatter `0x26bdd1`, transmit
  preparation `0x20cd94`, wait/clear helper `0x20cd4a`. Source is now 43
  components, 2,123 instructions / 6,708 bytes, four tables / 531 bytes.
- `scripts/reconstruct_dc9_transfer.py` uses the generalized existing recovery
  helper, still refusing to replace differing source/layout entries. The copy
  routine is forward memcpy-like, not memmove. Lookup checks six records at
  `0x3b4950`, stride 176; archived keys `[5,6,4,2,1,3]` map slot+1 to an index
  with sentinel 6. Runtime channel assignments remain unverified.
- New `analysis/extracted/community-transfer-workspace/`: 80 base artifacts and
  two USB images. Baseline/helper BIN hashes remain `0b5d8350...`/`d88a1683...`.
  Canonical outputs are `dc9-v101-transfer-source.{baseline,experimental}.bin`
  under `analysis/extracted/rebuild/`. Earlier workspaces and BINs are intact.
- `scripts/validate_dc9_transfer.py` / `analysis/dc9-transfer-validation.json`
  pass 1,832 strict cases and 218 explicitly conditional cases. Strict cases
  reject ambiguous stores. Conditional cases compare two hypotheses, including
  twenty complete follow-up/copy/format/checksum/transmit runs per policy.
- `ModuleModel(..., store_policy='reject')` remains the default. Optional
  `sleigh-store` uses literal store shapes (sw_1=32 bits at decoded address;
  sh=source bits16..31 at decoded address). `halfword-lane-hypothesis` uses low
  16 bits, at decoded address for sw_1 and address+2 for sh. Neither is physical
  ISA validation; both retain the model's little-endian data/fallthrough CALL
  assumptions. The decoder declares big endian; these modes do not run full
  SLEIGH P-code. Execution results include the selected store policy.
- Concrete evidence: selector3/command0x12 stores at `0x26bedf`/`0x26beec`
  decode to `0x3cb308`, but selector1 getter `0x26bf15` reads `0x3cb30a`.
  Lane hypothesis makes tested setter/getter pairs consistent (<=24 clamps to
  25, 25..100 preserved, >100 ignored). Literal store shapes leave the getter
  byte unchanged. This supports a hypothesis; do not claim resolved ISA/width.
- Masked-update tests distinguish adjacent-byte effects: 32-bit store clears
  counter-neighbor sentinels, 16-bit store preserves them. Neighbor ownership
  is unknown. Full follow-up remains rejected by default at ambiguous sw_1.
- Direct wide-byte displacement scan for 0x3b9e finds only set/read/clear in
  the known indirect reader. Computed pointers/aliases remain unsearched.
  Scripted data 0x11, flag0, data0x22, flag1 makes the conditional reader retry
  and return 0x22. This is an explicit read stimulus, not an interrupt model.
- Full suite: 76 tests pass. Earlier 29,495 receive cases, 266 register cases
  and command-path validation still pass under default rejection. Fresh
  evidence is `analysis/community-transfer-workspace.json`. Hardware untested.

Next tasks: obtain independent ISA/endianness evidence or more paired-store/load
constraints; trace neighbors of `0x4551a8`/`0x4551ec`; investigate computed retry
flag references, runtime channel metadata and scheduler/delay helper `0x2420bb`.
Expand peripheral-contract testing and trace settings toward display functions.
Keep 128-byte slot versus length+2 boundaries explicit; no external reachability
or fix is established. Complete editable firmware and hardware validation remain
the objective; source recovery is still only a small fraction of the application.

## Previous continuation: receive-service source and validation

Updated 2026-10-23. Read `analysis/2026-10-23_reverse-dc9-receive-report.md`.
The owner requested continued community-source progress. Git remains `main`,
HEAD/local `origin/main` at `50dbabf`; no fetch/commit/push or hardware access.
The 73 starting changed/untracked files are preserved in
`analysis/scratch/receive-before-2026-10-23/` with a hash manifest.

- Added 15 byte-exact components: thirteen channel/state helpers in
  `[0x20c80d,0x20cd4a)`, full receive/transmit service `[0x20d33c,0x20db7b)`,
  and indirect reader `[0x20e47e,0x20e52d)`. Source is now 35 components,
  1,697 instructions / 5,377 bytes, plus unchanged four tables / 531 bytes.
  `scripts/reconstruct_dc9_receive.py` checks the pinned decode/encoding and
  refuses to replace differing existing sources/layout entries.
- Fresh `analysis/extracted/community-receive-workspace/` has 72 base artifacts
  plus two USB images. Its baseline and helper experiment retain SHA prefixes
  `0b5d8350...` and `d88a1683...`, with all checksums and eleven resource ranges
  valid. Canonical outputs are `dc9-v101-receive-source.{baseline,experimental}.bin`
  under `analysis/extracted/rebuild/`. Old workspaces/BINs remain intact.
- `scripts/trace_dc9_receive.py` records full source spans, direct dependencies,
  event branches, ring normalization and readiness logic in
  `analysis/dc9-receive-path.json`. Event mask `0x18`: `0x08` receive, `0x10`
  transmit. Ring indices use `0x7f`; continuation adds 128 while current <=
  previous. Equal positions become a full span on that path, not proof of
  hardware FIFO capacity or overrun behavior.
- `scripts/validate_dc9_receive.py` passes 29,495 cases: 19,064 complete
  helper/path runs and 10,431 explicitly stopped readiness/ring/indirect-read
  prefixes. All 409 instructions in the thirteen small helpers are visited;
  transfer service 147/660 and indirect reader 25/56 are partial. Total 638
  visited instructions includes 57 previously recovered instructions.
- `ModuleModel.run(..., stop_before=...)` accepts only instruction boundaries
  and reports `termination: breakpoint`; a partial result is not normal return.
  New encoder/model forms are `bn.lh`, `bn.j`, `bg.ble`, `bg.bgt`. Halfword
  semantics remain an explicit low-halfword/read-before-write hypothesis.
- Ready decision: nonzero length, count == length + 2, frame status zero.
  Tests stop before `0x20d630` / `0x20da60`. `bg.sw_1` at `0x20d64d` and
  `0x20da6b` touches candidate `0x4551ec` with unresolved width, as in the
  earlier masked-update counter. Do not silently execute an assumed width.
- The copy store at `0x20d94c` has no local count<128 guard. Isolated count 127
  writes the final slot byte; count 128 fails strict memory mapping. XOR length
  129 likewise fails a 128-byte slot. Upstream reachability remains unresolved;
  these tests are not an external vulnerability claim or a firmware fix.
- Indirect read programs uint16(argument-0x4000), sets flag `0x453b9e`, and
  reaches masked-update trigger bit 2 on logical `0x3c06`. Busy bit is 0x20;
  data register is 0x3c01. Finite polling falls through on exhaustion and an
  outer flag-driven retry remains unmodeled. Tests never fake its completion.
- Full suite: 70 tests pass. Command-path validation and 266 register cases
  still pass with the expanded model. Latest workspace evidence is
  `analysis/community-receive-workspace.json`; previous workspace evidence is
  historical and its then-current files are in the 73-file snapshot.

Next offline tasks: resolve store width/CPU semantics; recover indirect writer
`0x20e3be`, channel selector `0x20c711`, follow-up service `0x20d2b7`; trace
writers of `0x453b9e` and validate payload movement/state/count bounds with an
explicit peripheral contract. Continue source recovery for actual display
features; EFE/USB builds remain separate. No experimental firmware is yet
hardware-proven and most application code remains a pinned vendor remainder.

## Previous continuation: raw community workspace and register source

Updated 2026-10-23. The owner explicitly reaffirmed the community source-build
goal and requested the raw files to build on. Read
`firmware/README.md` and `analysis/2026-10-23_reverse-dc9-workspace-report.md`.

- Prepared `analysis/extracted/community-workspace/`: pinned DC9/EFE originals,
  all lossless DC9 container parts, expanded application/resources, editable
  assembly and layout, plus separate VL822/VL103R USB images. Base manifest:
  57 artifacts; optional USB manifest: two raw images. These are ignored local
  outputs. `scripts/firmware_workspace.py` provides `prepare`, `export-usb`,
  `verify`, and `build`; builds use workspace components/source without archive
  extraction paths. Repository scripts and Python environment remain required.
- Added seven byte-exact routines: read8 `0x23dd44`, write8 `0x23ddb9`, masked
  update `0x23dead`, read16 `0x23df85`, write16 `0x23dfb6`, slot buffer offset
  `0x20c7a8`, and slot ring position `0x20c73b`. The canonical layout now has
  20 components, 572 instructions / 1,750 code bytes, four tables / 531 bytes.
  About 0.072% of expanded program bytes are recovered assembly; the remainder
  is still pinned vendor input. This is a partial source build.
- Workspace outputs `build/dc9-v101.baseline.bin` and
  `build/dc9-v101-helper.experimental.bin` match original SHA `0b5d8350...`
  and audited helper SHA `d88a1683...`. Canonical builds in
  `analysis/extracted/rebuild/dc9-v101-register-source.{baseline,experimental}.bin`
  match them. All checksums and all eleven resource ranges validate. Earlier
  BINs remain intact. Current `dc9-source-{baseline,experiment}.json` describe
  the 20-component canonical builds.
- `scripts/validate_dc9_registers.py` passes 266 plain-memory cases, covering
  all 218 instructions in the six new executable routines. It checks address
  mapping, page/data aliasing, grouped broadcast selection, byte/16-bit access
  ordering, slot mappings and register/stack preservation. Fake bus addresses
  contain only Python bytearrays, without hardware side effects.
- Masked-update source assembles exactly but is excluded from execution.
  `bg.sw_1` at `0x23ded2` / `0x23df3a` uses a four-byte STORE in pinned SLEIGH
  where surrounding code loads a halfword counter at `0x4551a8`. Width remains
  unresolved; the model rejects this instruction. P-code evidence is in
  `analysis/dc9-register-validation.json`. Existing CALL and aliased-load
  hypotheses remain unresolved too.
- The command model still passes the previous case counts, including 5,084
  command cases and 218 caller comparisons. Its coverage is now 273/572 because
  the layout includes register code tested separately. Full suite passes 63
  tests. See `analysis/community-workspace.json` for hashes and output evidence.
- Verified all 45 archive ZIP hashes. Starting changes were preserved in
  `analysis/scratch/community-workspace-before-2026-10-22/` (58-file manifest);
  all saved hashes and original working paths remain intact. `main`, HEAD and
  local `origin/main` remain `50dbabf`; no commit, push, fetch or hardware access.

Next offline tasks: reconstruct receive-state transitions at `0x20d33c`, status
helper `0x20c9fa`, and polling/flag behavior in `0x20e47e` using the newly recovered
register functions; determine ring capacity and command-count constraints.
Resolve store-width/CPU-semantic gaps before executing masked update in a model.
EFE integrity/repacking and USB source builds remain separate unresolved tasks.
Raw bytes and exact stock reconstruction are available; full editable source
and a hardware-proven community image are not yet complete.

## Previous continuation: command-path source and bounded execution

Updated 2026-10-22 (America/Los_Angeles). Read
`analysis/2026-10-22_reverse-dc9-module-report.md` for the latest completed work.
The owner requested continued offline progress and asked whether a 1:1 BIN
means we have all source files. Answer: the complete vendor binary supplies all
bytes for reproduction, but the original full source/SDK/toolchain are absent.

- Source layout now has 13 routines/fragments, 282 instructions / 871 code
  bytes, and four tables / 531 bytes. New code includes command `0x32`, guarded
  three-plane byte writing, copy/XOR, record offsets, dispatcher frame and
  parent selector fragments. About 0.036% of the expanded program is recovered
  code; most of the firmware remains pinned vendor input.
- Latest complete outputs: `analysis/extracted/rebuild/dc9-v101-command-path.baseline.bin`
  (original SHA `0b5d8350...`) and `dc9-v101-command-path.experimental.bin`
  (same audited rewrite SHA `d88a1683...`). Earlier BINs remain intact. Current
  `dc9-source-{baseline,experiment}.json` describe these new builds.
- `scripts/aeon_module_model.py` is a bounded RAM-only instruction model with
  an explicit CALL policy, not a hardware emulator. Eight of nine observed
  CALL links from the unchanged SLEIGH are outside modeled instruction
  boundaries. Fallthrough links fit tested paths but physical ABI is unresolved.
  P-code for aliased `bg.lhz r7,0(r7)` also zeroes r7 before address calculation;
  this model explicitly assumes read-before-write behavior.
- `scripts/validate_dc9_module.py` passed 5,084 command cases, 81 parent cases,
  196 other router cases, 294 setter cases, four copy cases, 36 offset cases,
  and 218 original/rewrite comparisons through callers. It visits 273/282
  modeled instructions. See `analysis/dc9-module-validation.json` for assumptions.
- Parent entry `0x26bf26` reads selector from slot byte 1. Call at `0x26c155`
  invokes router `0x26f043`. One direct upstream call at `0x20cfea` belongs to
  candidate routine `0x20cf64`. Its shown path checks `slot[0] & 0x7f` and a
  marker byte, but not command-0x32 count at byte 5. Counts 121/255 read beyond
  the 128-byte slot in the bounded model. Earlier receive constraints and
  transport remain unknown; do not claim external reachability or patch this
  without tracing ingress. Evidence: `analysis/dc9-packet-entry.json`.
- Further trace: `scripts/trace_dc9_ingress.py` / `analysis/dc9-ingress-path.json`
  recover consumer `0x20d130`, iterating slots 0–7 and calling `0x20cf64` at
  `0x20d248` only for state 5 at `0x453b94 + slot`. In producer `0x20d33c`,
  `0x45414c + slot` is a received-byte counter (correcting the earlier ready-flag
  working name), and `0x454154 + slot` holds expected frame length. The listed
  readiness path requires nonzero length, receive_count == length + 2, and zero
  from status helper `0x20c9fa`. It does not establish a relation to command-0x32
  count at slot[5]. Producer coverage is partial and physical transport unknown.
- `scripts/trace_dc9_register_map.py` / `analysis/dc9-register-map.json` trace
  initialization of `*(uint32*)0x453cf0` to `0xa0000000` via request 0x12c,
  class 1 and setter `0x271c6a`. Byte-register helper `0x23dd44` uses
  base + 2*(logical & 0x7fffff) - (logical & 1), with a possible page-selection
  write when logical bit 23 is set. Indirect buffer helper `0x20e47e` programs
  logical 0x3c02, polls control 0x3c06 and reads 0x3c01. No device execution.
  Offset/position helper mappings for slots 0,1,2,3,7 are recorded; physical
  connector/transport assignment is unknown. These helpers are outside the
  bounded RAM execution model.
- Black 32: `scripts/probe_black32_integrity.py` rejects stated whole-body
  sum/XOR and 512 CRC8 hypotheses across 11 images / five variant pairs.
  Trailer meaning/coverage remain unresolved; no repacker was added.
- Latest suite: `.venv/bin/python -m unittest discover -s scripts -p 'test_*.py'`
  passes 54 tests. Original changes are preserved in ignored
  `analysis/scratch/table-module-before-2026-10-22/` (37-file manifest).
  HEAD is still `50dbabf`, on `main`; nothing committed or published.

Next concrete tasks: finish receive-state transitions in `0x20d33c`; trace
register write/masked-write helpers `0x23ddb9` and `0x23dead`, and the polling /
software-flag interaction in `0x20e47e`; establish ring capacity/overrun behavior,
physical channel assignment and whether upstream code bounds command-specific
counts. Continue functional source recovery. Separately trace Black 32
loader/updater integrity coverage instead of assuming a whole-file CRC8.
No image has been tested on the owner's monitor; boot, recovery and actual
monitor functionality remain unverified. Keep all work offline at this stage.

## Previous continuation: source baseline and command routing

The owner reiterated the goal of fully working firmware to build upon and asked
to continue. See `analysis/2026-10-21_reverse-dc9-source-report.md` for the newest
result; the validation milestone and original handoff below are retained history.

- `scripts/build_dc9_source_baseline.py` assembles six routines (97 instructions,
  285 bytes) and three command tables (95 bytes). Its complete stock baseline
  is byte-identical to pinned DC9 v101, SHA256
  `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`.
- Source layout: `analysis/reconstructed/dc9-source-layout.json`. Baseline mode
  rejects changed sources. Explicit `--experimental --replace-source NAME=PATH`
  supports same-size routine edits and checksum-correct repacking. See the report
  for the exact command; the existing helper rewrite reproduced the previously
  audited `d88a1683...` image through this general source-build path.
- `scripts/trace_dc9_commands.py` generates `analysis/dc9-command-routing.json`.
  Helper `0x204059` is called at `0x26f084` within router `0x26f043`. Selector
  `0xcc` routes byte 2 of 128-byte slots through three membership groups.
  Primary/secondary overlap `0x90` goes primary; 15 secondary commands hit the
  next dispatcher's default branch. Individual command meanings/transport remain
  unknown. Six interior-address literal candidates remain unclassified.
- Important decoder gap: SLEIGH's call at `0x26f084` writes link `0x26f08c`,
  inside an instruction. Do not claim multi-function equivalence with its current
  CALL semantics. The earlier leaf-helper emulation never executes CALL.
- Tests pass: 11 source/encoding tests, 24 parser tests, six emulator tests.
  Starting files were preserved under ignored
  `analysis/scratch/caller-reconstruction-before-2026-10-21/` (24-file manifest).
  HEAD remains `50dbabf` on `main`; all work is uncommitted.

Next offline work: resolve call/return semantics, trace parent dispatch/transport
and slot bounds, reconstruct selected handler bodies from the switch map, and
classify possible interior-address data. The byte-identical baseline is useful
for development but most firmware remains vendor code. Hardware operation,
exact device identity and recovery remain unverified; no device access or flash
is authorized by this continuation.

## Earlier continuation result, 2026-10-21 (America/Los_Angeles)

The offline validation milestone below has now been run on Ubuntu. See
`analysis/2026-10-21_reverse-dc9-validation-report.md` for commands, hashes,
limitations and the evidence map. All earlier work was preserved; the original
handoff text below describes the starting state and pending gates at that time.

- Git started at `50dbabfe6a8d8c9d1616616235ce570538270fde` on `main`, with
  the five modified and seven untracked files listed below. No commit or push.
- Existing suites passed 23 + 6; a focused missing-CRC-trailer regression now
  makes the counts 24 + 6. The checksum API bound was tightened.
- 13 originals and 13 byte-exact reconstructions pass main CRC16 and both
  CRC32 checks; all 141 resource CRC16s pass.
- Original helper assembly matches 39 bytes; 1,557 rewrite comparisons pass.
  Evidence now measures runtime pypcode and hashes the compiled SLEIGH.
- Corrected baseline SHA256:
  `5e79a74aef972941d232a601ae7a853546f87aaab6ee2f5097b0466a7f93ad68`.
- Helper experiment SHA256:
  `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad`.
  Exactly 29 decoded bytes change within expanded `[0x4059,0x4080)`.
- `analysis/dc9-recompression.json` and its old BIN remain historical and
  invalid under the main CRC16 check. Corrected evidence is in
  `analysis/dc9-recompression-corrected.json`, `analysis/dc9-helper-experiment.json`
  and `analysis/dc9-experiment-audit.json`. The independent audit uses direct
  parsing and bit-at-a-time CRCs; resources, sizes and raw change bounds pass.
- Pre-run working files/reports and existing generated rebuild files were
  copied to ignored `analysis/scratch/offline-validation-before-2026-10-21/`
  with a SHA256 manifest. Original ZIPs were untouched.

The next substantive offline step is caller and entry-path tracing around
candidate VA `0x204059`, followed by reconstruction of a larger module named
from evidence. The integration experiment remains hardware-untested, contains
mostly precompiled vendor code and has no intended user-visible feature change.
No flashing or device access is authorized. Re-read the current Git diff;
the working tree now includes the completed validation and documentation.

## Start here

Target machine: the owner's Ubuntu Lenovo, displayed as
**lucas-ThinkCentre-M920q**. SSH alias: **homelab**.

Repository: `/home/lucas/projects/dough-monitor-firmware-archive`

Public repository: <https://github.com/Lucasizq/dough-monitor-firmware-archive>

Use **`.venv/bin/python`** for Python commands from the Ubuntu repository root.
The virtual environment and skill directory exist on the remote machine.
The owner reported that the transferred setup passed the 23 parser tests and
six emulator tests. Those suites also passed in the originating Windows chat.

Before changing anything:

```bash
cd /home/lucas/projects/dough-monitor-firmware-archive
git status --short
git diff --stat
git diff
git ls-files --others --exclude-standard
```

Read this entire handoff, `analysis/README.md`, `analysis/scope.md`, and
`analysis/2026-10-20_reverse-spectrum-one-report.md`. Then inspect the untracked
AEON rewrite sources listed below. **Preserve all existing changes.** Do not
reset, clean, overwrite the checkout, or assume untracked files are disposable.

The reverse engineering skills are installed at
`/home/lucas/.codex/skills/reverse-skill-router` (a symlink to
`/home/lucas/.codex/reverse-skill/skills`). Read the relevant skill instructions
and project scope. The earlier work used reverse-engineering, firmware-pentest,
ida-reverse guidance, and docs-generator. IDA itself was not available; actual
analysis used Python, pypcode/SLEIGH, and static binary inspection. Skill
availability is not evidence that its named tools are installed. Do not run
bootstrap scripts or install a large toolchain without first establishing need.

## Goal and owner priorities

The owner requested a public archive of all findable Dough/former Eve monitor
firmware, followed by reverse engineering toward **fully working, maintainable
community firmware and source**. They do not have a particular bug to fix;
they want a foundation from which the community can choose improvements.
Preservation and reports are useful intermediate results, not the final goal.

The owner directly confirmed these retail descriptions:

- Glossy 27-inch Spectrum with USB-C hub.
- 32-inch 4K OLED with Gorilla Glass.

**Working hypotheses:** these correspond to ES07DC9 and ES07EFE respectively.
Exact printed model IDs, hardware revisions, and installed OSD firmware versions
have not been confirmed. The owner was already asked for labels/version screens
and repeated the retail descriptions. Continue independent offline work without
repeatedly asking the same question. Exact mapping will be required before any
hardware plan.

The owner's claim that vendor support was abandoned motivated the project;
do not present that claim as independently established. Collection did find
download links in product pages even though the old downloads page was gone.

## Critical update: published report and experiment are now historical

**Verified after the last commit:** the main application's last two trailer
bytes are reproducible as a normalized CRC16. The formula matches **all 13
archived Spectrum One images**. The previous report still calls them unknown;
it has not yet been updated.

The old recompression experiment preserved those bytes while changing their
covered data. During handoff preparation we explicitly checked the existing
Windows artifact:

- SHA256: `1460a4608062167bcda589aad57567cd9528d00d6f3349f507b80dc2907d7873`
- Stored main CRC16: `ddf3`.
- Required main CRC16 for that artifact: `be5c`.
- The current parser rejects it with `Main trailer CRC16 mismatch`.

This artifact passed the two CRC32 checks known at the previous milestone, but
**fails the newly recovered CRC16 check**. Preserve it as historical evidence,
not as a valid release. `analysis/dc9-recompression.json` still describes this
old experiment. Its hash must not be reused as the expected corrected build.
The newer builder code regenerates the CRC16, but an end-to-end run of that
corrected builder was still pending when work switched to this handoff.

## Repository state at handoff

Both local and remote checkouts were inspected over SSH and were on commit:

`50dbabfe6a8d8c9d1616616235ce570538270fde` (`main`)

Commit subject: `Recover Spectrum One checksums and reproducible firmware reconstruction`.
It was pushed to the public repository. The preceding analysis commit was
`165cb1f96dbeffaf51c7811fa94ca6c61ea942df`.

Both checkouts reported the same following work in progress before adding this
handoff. Matching status lists are not a byte-for-byte comparison of those files.

### Modified tracked files

| File | Change in progress |
|---|---|
| `scripts/mstar_checksums.py` | Adds normalized main CRC16 calculation/verification and checksum regeneration in dependency order |
| `scripts/unpack_mstar.py` | Enforces main CRC16 and identifies the trailer field |
| `scripts/recompress_dc9.py` | Adds `repack_program`, permits same-size replacement program, regenerates main CRC16 before CRC32s |
| `scripts/roundtrip_mstar.py` | Regenerates main CRC16 as well as both CRC32s |
| `scripts/test_analysis.py` | Updates synthetic images and adds three main-CRC16 regression tests; total 23 |

### Untracked work to retain and review

| File | Purpose/status |
|---|---|
| `analysis/reconstructed/spectrum_one_table_helper_rewrite.aeon.s` | Changed assembly loop, same 39-byte footprint including unreachable padding |
| `scripts/aeon_helper_emulator.py` | Restricted interpreter of SLEIGH-generated P-code for the helper |
| `scripts/validate_aeon_rewrite.py` | Assembles and compares original/replacement helper execution |
| `analysis/aeon-rewrite-validation.json` | Recorded 1,557 passing comparisons; generated before main-CRC integration |
| `scripts/test_aeon_emulator.py` | Six interpreter tests |
| `scripts/build_dc9_helper_experiment.py` | New source-to-image experiment; written but not yet run end to end |

`analysis/dc9-helper-experiment.json` did **not** exist in the originating checkout
when this handoff was prepared. Do not imply that integration has already passed.
`CONTINUE.md` itself is a new untracked file. This handoff task changes/copies only
this file; it does not commit, push, or transfer the other working files.

## Verified archive and format findings

“Verified” below means demonstrated by the specified offline evidence, with the
stated sample limits. It does not mean hardware compatibility was certified.

### Archive

- 45 ZIP files, 38 distinct package SHA256 hashes, covering 10 model IDs.
- 66 distinct extracted members: 35 raw firmware BINs and five top-level PE
  programs among them. ZIPs use Git LFS; pointer files are not firmware data.
- Package hashes, ZIP CRCs, and available vendor hashes were checked during
  collection. Original packages remain intact.
- Known missing releases and source leads are in `RESEARCH.md`, including
  reported D03 v103 and some older/beta and Black 27 480 Hz releases. Do not
  describe the archive as exhaustive.

### Spectrum One D02/D03/DC9 container

All offsets in this subsection are raw file offsets; ranges are end-exclusive.
Header words are little-endian unless stated otherwise.

| Field/span | Verified interpretation |
|---|---|
| `0x10000` | AP start S = `0x30080` |
| `0x10004` | Candidate AP load base B = `0x200000` |
| `0x10008` | B + E - S, compressed segment extent |
| `0x1000c` | AP end E, exclusive |
| `0x10014` | Little-endian CRC32 of `[S,E)` |
| `0x10020` | File length minus four |
| `S+0x1147` | Compression marker `be ad de` |
| `S+0x114a` | Little-endian segment length E-S |
| `[S,S+0x3800)` | Uncompressed prefix |
| `[S+0x3800,E-6)` | Raw DEFLATE program |
| `[E-6,E-2)` | Little-endian expanded program length |
| `[E-2,E)` | Big-endian normalized main CRC16, newly recovered |
| Final four bytes | Big-endian CRC32 of all preceding file bytes |

CRC32: polynomial `0x04c11db7`, initial zero, no reflection, final XOR zero.
CRC16: polynomial `0x8005`, initial zero, no reflection, final XOR zero.
Check vectors for `123456789`: CRC32 `89a1897f`, CRC16 `fee8`.

**New main CRC16 formula:** copy `[0x10000,E-2)`, treat the four-byte words at
absolute offsets `0x10014`, `0x10060`, and `0x10064` as zero, then compute CRC16.
The observed match is verified; the hypothesis that all three words are written
later in the manufacturer's packaging process is not fully traced. Semantics
of the words at `0x10060` and `0x10064` remain unconfirmed.

Required regeneration order: **main CRC16 -> AP CRC32 -> whole-file CRC32**.
Resource CRCs must also be regenerated if resource payloads change; the current
experiment preserves all resources.

Direct checks produced these matches (full hashes are in `mstar-layouts.json`):

```text
source SHA256 prefix   main CRC16
5f0a7bf92119            1d8c
e319da9490df            29f6
d0fecef0580f            9aaf
62027f7e2b1f            9fe9
536d94f761d8            9300
199bb51c3d31            223c
ccf83898548c            6dc8
136d982c65f8            6124
d9be1e1c7aad            be15
bf394e15b209            e4f2
ac2299e193b0            2e46
435b473e32b2            b076
0b5d8350af99            ddf3
```

The resource directory at `0x32080` has a 12-byte prefix, a big-endian uint16
count, and 11-byte records: uint16 ID, uint32 offset, uint32 stored size, uint8
flags. The next ID is `f000`. Offsets/sizes are eight-byte aligned. Resource
CRC16 covers payload plus padding, excluding its final two-byte big-endian CRC.
Flag 4 is raw DEFLATE + LE expanded length + `be ef` + zero padding + CRC16;
flag 0 is raw data with padding/CRC. All **141 resource checksums** matched.
The unpadded length of flag-0 content and many resource functions remain unknown.

Before the latest CRC16 changes, all 13 images passed byte-exact split/reassemble
roundtrips with regenerated CRC32s. Repeat that corpus gate with the new code to
record regeneration of all three checksums. This stronger gate is still pending.

### Pinned DC9 v101 rev1148 sample

Source SHA256:
`0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`

Locate its extracted path through `analysis/mstar-layouts.json`; do not guess a
download filename. S=`0x30080`, DEFLATE start=`0x33880`, original E=`0x125adb`.
Expanded program after the prefix: 2,426,560 bytes. Original CRC32s:
AP=`68ea7417`, file=`df78e833`; main CRC16=`ddf3`.

Program-only SHA256:
`9844f058cf533e50eb994ff82f37d01da9084158dfe22cccc68c151061baaf21`

The old recompression shortened DEFLATE from 991,829 to 985,104 bytes using
zlib 1.3.2. Those sizes are historical observations, not cross-platform output
requirements. Another zlib version may produce different valid bytes.

### Recovered helper and bounded emulation

- Candidate VA `0x204059`; expanded-image offsets `[0x4059,0x4080)`; 39 bytes.
- Searches a 41-byte table at candidate VA `[0x2aed7c,0x2aeda5)`.
- Inferred calling convention: r3 uint32 argument/result, r9 return address.
  The input is not truncated to a byte; values above 255 do not match.
- Original readable assembly builds 13 instructions exactly matching the
  archived 39 bytes. `aeon_subset_assembler.py` supports nine mnemonics only.
- The rewrite rearranges the loop into 37 bytes plus a two-byte unreachable
  return for the same footprint. It intends no user-visible feature change.
- 519 selected uint32 arguments x three initial-register seeds = **1,557**
  passing comparisons: same result, all 32 general-register values, and ordered
  table reads. Maximum executed instructions: original 251, rewrite 250.
- Original code SHA256:
  `5055f0197a3de495f1b4c4ff559c257aebb0839ef54624689361c11c61071b37`
- Replacement code SHA256:
  `d6d071ac2a33df38d030e70f34e2e1e9df5c6453fc062e25d8d6986b29c1bd64`

The interpreter handles a small P-code whitelist, byte-addressed register
aliases, table-only loads, instruction-boundary branches, a return sentinel,
and a 512-instruction budget. Unknown operations, out-of-bounds loads, invalid
returns, and budget exhaustion fail. It does not model devices, interrupts,
timing, MMIO, or the whole monitor. Both versions use the same incomplete SLEIGH
semantics, so agreement is not independent ISA validation. Inputs are not an
exhaustive uint32 enumeration. The helper's role in monitor features is unknown.

### Other firmware families and USB

- Black 32: E91/EFE v1.0.19 images differ in nine bytes across 1,638,400 bytes.
  A decoded MIPS16 routine at raw `0x33a4` writes 3201 for matte or 3200 for
  Gorilla Glass to `0xa0102eda`; the pattern was checked in eight images across
  versions 1.0.14, 1.0.16, 1.0.17 and 1.0.19. Its wider role is inferred, not
  established by hardware execution. The final-byte difference at `0x18ffff`
  remains unexplained; there is no Black 32 repacker yet. RTD2739LUF-M32E is an
  identity string, not proof of a complete CPU/peripheral model.
- Black 27: PyInstaller/Python 3.7 updater entry was recovered and checked
  against bytecode. Some decompiler output has control-flow errors; consult
  `black27-start-flow.md`. VID/PID `0bda:5411`, communication module
  `Comm_UsbHubI2C.dll`, bank 32, flag address `0x34f8fe`, flag bytes `aa55` are
  static findings. Vendor code was not run against a device.
- USB packages 17/18/19 contain the same 42,556-byte VL822 hub payload (SHA256
  `ec6699214c621671449ec941ab4ccd8c413cb79b6e369d99a654c12beb3a3356`), but
  different 32,768-byte VL103R PD payloads. They share updater/API DLL bytes.
  Four Inno installers were extracted with verified innoextract 1.9; no vendor
  executable/DLL was executed. These controllers require separate analysis.

## Evidence map

| Location | Contents / caveat |
|---|---|
| `README.md`, `INDEX.md`, `MANIFEST.csv` | Archive usage, packages, provenance and hashes |
| `RESEARCH.md`, root `*-catalog.json`, `catalog.json` | Search leads, gaps, source metadata |
| `analysis/scope.md` | Offline authorization and owner priorities; needs latest emulation update |
| `analysis/2026-10-19_reverse-dough-report.md` | Initial cross-family findings |
| `analysis/2026-10-20_reverse-spectrum-one-report.md` | Published E08-E13 milestone; trailer/recompression discussion now historical |
| `analysis/inventory.json`, `profiles.json`, `comparisons.json` | Extracted identities, profiles and version comparisons |
| `analysis/mstar-layouts.json`, `mstar-roundtrips.json` | 13-image and 141-resource evidence; not regenerated after new CRC16 code |
| `analysis/mstar-boot-excerpts.md` | Static boot trace with raw and candidate runtime addresses |
| `analysis/dc9-recompression.json` | OLD experiment with stale main CRC16; must be superseded explicitly |
| `analysis/aeon-excerpts.md`, `aeon-helper-build.json` | Initial helper reconstruction and byte-exact assembly build |
| `analysis/aeon-rewrite-validation.json` | Untracked bounded emulation evidence |
| `analysis/installers.json`, `updater.json` | Installer payloads, PE and updater metadata |
| `analysis/black32-code.json`, `analysis/reconstructed/` | Black 32 evidence and small C/assembly reconstructions |
| `analysis/extracted/`, `analysis/scratch/`, `.tools/` | Ignored generated binaries, scratch evidence and local dependencies; may differ between machines |

Static boot interpretation: raw `0x2000` selects/checks slot `0x400000`;
raw `0x2322..0x2364` copies `0x4eb8` bytes from raw `0x724d` to `0x01000100`.
Relocated code checks application CRC, copies a `0x3800` prefix, stages compressed
data at `0x01100000`, inflates with raw-DEFLATE parameters, and hands off to
`0x200100`. Full fallback behavior, DMA, CRC hardware and aliases are not modeled.

## Tool provenance and external leads

Pinned dependencies are in `scripts/analysis-requirements.txt`: pefile 2024.8.26,
py7zr 1.1.4, pypcode 4.0.1, uncompyle6 3.9.3, xdis 6.1.8.

AEON SLEIGH source:
<https://github.com/shinyquagsire23/ghidra-aeon/tree/de8a2539d474efa409ba458c565bc74f9e5e0b1d>

Pinned archive SHA256:
`25ee41c3e3dc4fe55d414128b89339980f745256be20defffbc463dc746cbef6`

`prepare_aeon.py` verifies the archive and removes two invalid unused `(4,2)`
token declarations before compiling. No instruction constructors were changed.
The definition remains incomplete and compiler warnings were observed. Prepare
it for Linux if necessary; do not copy/run Windows extension modules on Ubuntu.
Scripts prepend `.tools/python` if present, so check that this directory does
not shadow the Ubuntu virtual environment with incompatible packages.

Historical reference leads, read as data only:

- <https://github.com/Toysoft/mstar/blob/master/Chakra3_017a0d6_20170731/scripts/BinIDPackFiles_Compress.py>
  corroborates related framing and checksum ordering, but its layout differs.
- The same repository's `scripts/util/mscompress` was statically inspected as
  an ELF32 i386 file with symbols, never executed. SHA256:
  `376f24d88a18abf40dc3d9cfaf03db55b61566c83f254c69aeebc139f9ed9f1e`.
  Its mixed-mode path supplies a length/marker; packaging can replace marker
  bytes. It is not a compiler and its presence does not validate our device.
- Its Makefile names `r2-elf-` / `aeon-` toolchains and AEON R2 flags. A usable
  C compiler distribution was not found in the searches performed. Generic
  OpenRISC compatibility must not be assumed for this variable-length ISA.
- <https://github.com/niklas389/dough-monitor-tools> is relevant D03 transport
  work. `specflash.c` explicitly says hardware-unverified. It was not run or
  copied; even ostensibly read-only ISP operations may change device state.

No vendor SDK source or reference utility code was copied into our original
analysis implementation. Repository MIT terms exclude firmware-derived
snippets/data; see `LICENSE` and existing rights notes. Recovered assembly is
not original vendor source and does not make the whole firmware open source.

## Tests and next concrete offline steps

Do these in sequence after review. Preserve existing reports before deliberately
regenerating them; commands that write tracked JSON should produce reviewable
diffs. Do not claim a pending gate passed merely because its script exists.

### 1. Review and run existing tests on Ubuntu

```bash
.venv/bin/python --version
.venv/bin/python scripts/test_analysis.py
.venv/bin/python scripts/test_aeon_emulator.py
```

Expected current counts: **23 + 6**. The three new parser tests cover stale
main CRC rejection despite valid CRC32s, normalized versus covered header words,
and CRC range bounds. The six emulator tests cover byte-load zero extension,
out-of-range reads, looping, branch boundaries, return validation, and uint32
arithmetic/input limits. These are tool tests, not monitor regression tests.

Review points: `validate_aeon_rewrite.py` currently writes a literal pypcode
version string rather than measuring/enforcing the runtime version. Record the
actual runtime and compiled SLEIGH identity for reproducibility. Review checksum
API bounds, program-size restrictions, and whether emulation comparisons cover
all relevant machine state before extending their claims.

### 2. Record the stronger corpus checksum/reconstruction gate

```bash
.venv/bin/python scripts/unpack_mstar.py
.venv/bin/python scripts/roundtrip_mstar.py verify-corpus
```

These read extracted sources referenced by the inventory. If missing, first
inspect Git LFS and run `scripts/analyze_firmware.py` to regenerate extraction
from local original ZIPs. Fetch LFS objects only if absent; do not recollect the
web archive unnecessarily. After the new checks, expect 13 original images,
13 byte-exact roundtrips, and 141 resource CRC16s. Inspect the generated diff
for the new normalized main-CRC evidence rather than merely trusting the count.

### 3. Repeat helper validation with the strengthened parser

```bash
.venv/bin/python scripts/build_aeon_helper.py
.venv/bin/python scripts/validate_aeon_rewrite.py
```

Expect original 39-byte equality and 1,557 comparisons. If SLEIGH is missing,
inspect `scripts/prepare_aeon.py` and run `.venv/bin/python scripts/prepare_aeon.py`
using the pinned local archive; use `--download` only if needed. Do not run a
vendor application. Keep shared-decoder limitations explicit.

### 4. Build corrected baseline and one rewritten-helper experiment

These runs are **pending**. Use fresh output names; both refuse overwrites:

```bash
.venv/bin/python scripts/recompress_dc9.py --output analysis/extracted/rebuild/dc9-v101-crc16-corrected.experimental.bin
.venv/bin/python scripts/build_dc9_helper_experiment.py --output analysis/extracted/rebuild/dc9-v101-helper-rewrite.experimental.bin
```

Required review: pinned original SHA; normalized main CRC16 and both CRC32s;
exact expanded-program equality for the baseline; only the intended 39-byte
window differs for the helper experiment; prefix changes limited to documented
length metadata; all resource bytes/offsets remain identical; unchanged file
size and no allocation growth. Inspect `analysis/dc9-helper-experiment.json` when
actually generated. The code checks many of these invariants; independently
review the resulting differences. Add focused regression coverage for a concrete
remaining risk, not a broad redundant test campaign.

The rebuilt image will still contain almost entirely precompiled vendor code.
It is an assembly-to-image integration experiment, not a complete source build,
user-facing fix, boot result, or installable firmware release.

### 5. Update evidence and continue substantive reconstruction

Write a dated follow-up report with evidence/findings, current test results,
hashes, and explicit correction of the obsolete experiment. Update
`analysis/README.md`, scope, and the old report's continuation notice. Preserve
historical findings while making the current validity status unmistakable.
Review `git diff --check` and the full diff before any publication.

Then trace the helper's callers and recover a larger, named-by-evidence module;
expand checked instruction encoding or establish an actual AEON R2 compiler,
ABI and linker path. Separately advance Black 32 runtime mapping/instruction
support and its unresolved integrity field. Do not let the 39-byte example
become a substitute for reconstruction of the monitor's real functionality.

## Remaining uncertainties and hard boundaries

- No experimental image has been booted or tested on a monitor. No flashing is
  authorized by this handoff. Do not run updaters, vendor DLLs, USB/I2C/ISP writes,
  or hardware probes as part of the next offline step.
- Passing format/checksum tests is not proof that a loader accepts an image or
  that the monitor works. Other validators and update constraints may exist.
- No verified recovery/restore procedure or device backup exists in this work.
  Exact owner model/revision/version mapping is pending.
- Complete firmware source, full AEON compiler/linker setup, peripheral models,
  display initialization, HDR/VRR, sleep/wake, input switching, and USB-C/hub
  behavior remain largely unreconstructed. Black 32 is a separate architecture.
- No proof covers interrupts, cycle timing, all CPU state, all uint32 inputs,
  or all entry paths into the rewritten region. Trace callers/interior targets
  before any stronger claim about substituting that routine.
- Keep original ZIPs untouched and experimental BINs in ignored generated
  directories. Do not upload an experimental image as safe to install.
- Preserve work from other chats and the owner. This handoff transfer copies
  only `CONTINUE.md`; it does not synchronize ignored dependencies/binaries or
  override any later remote edits. Re-read remote status before continuing.

The immediate achievable milestone is a reviewed offline source-to-image
experiment with corrected checksums and honest evidence. The long-term goal
remains fully working, maintainable firmware for both monitors.
