# Firmware analysis scope

User authorization: "Now please begin the reverse engineering" (2026-10-13), following collection of the public Dough monitor firmware archive.

Targets are the 45 packages named in `MANIFEST.csv` and their embedded files. This phase performs offline extraction, format and architecture identification, static updater analysis, and comparisons between versions. Derived files stay under `analysis/`; original ZIPs remain intact. Public technical references may be consulted to interpret findings. No connected monitor is selected for testing or flashing.

The first milestone is a reproducible inventory and an evidence-based map of the firmware families, with a deeper look at at least one update format. A firmware modification or hardware compatibility claim requires later validation.

Owner priorities: glossy 27-inch monitor with USB-C hub and Gorilla Glass
32-inch OLED. The stated goal is community source reconstruction rather than
a specific bug fix. ES07DC9 and ES07EFE are working family assumptions pending
physical-label confirmation. The user requested continuation on 2026-10-19.

On 2026-10-19–20 the user reiterated that the end goal is fully working
firmware and requested continued implementation. Current work includes offline
container reconstruction and a DC9 recompression experiment. Hardware validation
and a complete source build remain required; there is no selected device for
flashing in this phase.

On 2026-10-20 the owner reaffirmed the retail descriptions (32-inch Gorilla
Glass 4K OLED and 27-inch glossy Spectrum with USB-C hub). Exact label IDs,
hardware revisions and installed firmware versions remain unconfirmed.

On 2026-10-21 (America/Los_Angeles), the user requested reading `CONTINUE.md`,
verifying Git state and continuing the next offline validation step while
preserving existing changes. This includes bounded helper emulation, checksum
regeneration, corrected baseline and helper-rewrite image construction, and
independent byte/checksum audits. The 13-image corpus, 141 resources and two
generated experiments were checked; the results are in the
[follow-up report](2026-10-21_reverse-dc9-validation-report.md).
Network profile for this continuation: offline; local extracted inputs and
installed tools only. No vendor applications, device probes, USB/I2C/ISP access,
flashing, commits or publication were performed. Emulation models only the
small helper and its table; physical CPU behavior, interrupts, timing, MMIO,
all entry paths and whole-monitor operation remain unvalidated.

The owner then reiterated the goal of a fully working firmware image to build
upon and requested continuation. The resulting offline work traces the DC9
helper's callers, reconstructs its command router and tables, expands checked
assembly encoding, and builds a byte-identical stock baseline plus an explicit
source-replacement experiment. See the
[source-baseline report](2026-10-21_reverse-dc9-source-report.md).
The stock identity is verified at the file level; physical device operation and
complete source reconstruction remain open. No hardware access was performed.

On 2026-10-22 (America/Los_Angeles), the owner requested sustained continuation
and a status explanation, providing full workspace access. Offline work expanded
the source overlay to 13 routines/fragments, modeled the recovered RAM command
path under explicit CPU assumptions, traced the selector's parent, and tested
Black 32 trailer hypotheses. See the
[module report](2026-10-22_reverse-dc9-module-report.md). Complete binary bytes
permit a 1:1 DC9 reconstruction; they do not supply the original complete source,
SDK or compiler. No physical monitor was selected, accessed or flashed.

On the next continuation, the owner explicitly reaffirmed a community source
build and requested raw firmware files to build upon. The resulting workspace
exports complete DC9/EFE images, lossless DC9 components, expanded application
and resources, reconstructed source and separate Spectrum One USB images.
Seven additional assembly routines expand the DC9 source to 20 components;
266 plain-memory register-helper cases supplement the command-path model.
See the [workspace report](2026-10-23_reverse-dc9-workspace-report.md). The work
remains offline; immutable originals and earlier changes are preserved.

The owner's next continuation request advances source recovery through the
receive/transmit service and its channel/state helpers. Fifteen additional
components bring the DC9 source to 35 components / 5,377 bytes. Plain-memory
validation executes all thirteen small helpers, complete no-event/error paths,
and explicitly stopped readiness/ring/indirect-read prefixes. See the
[receive-source report](2026-10-23_reverse-dc9-receive-report.md). The previous
workspace is retained; fresh outputs are in `community-receive-workspace`.
The unresolved store width still prevents claiming complete service execution.

The next continuation recovers eight transfer dependencies and compares two
explicit store hypotheses while preserving default rejection of ambiguous
instructions. Tests exercise selected complete response/transmit paths only
under those hypotheses, using plain register memory and an explicit scripted
read perturbation for one retry case. These conditional experiments do not
validate physical ISA or peripheral behavior. The new 43-component workspace
is `community-transfer-workspace`; see the
[transfer-source report](2026-10-23_reverse-dc9-transfer-report.md). Original
archives, earlier source work and generated workspaces remain preserved.

The owner then requested sustained progress toward a fully working firmware
repository. Offline work recovered thirteen timer/callback components, added
explicit timer-prefix interleaving experiments, traced callback initialization,
and implemented one combined verification/build command. Source now covers
56 components / 8,178 bytes. See the
[timer and callback report](2026-10-23_reverse-dc9-timer-report.md).
No complete-source or hardware-working claim follows from these checks.
No original archive, previous workspace or user change was discarded.

The configuration milestone adds six layout-related source components and
three tables, bringing the partial DC9 source to 62 components / 9,679 code
bytes and seven tables / 755 bytes. Its offline validation passed 98 repository
tests plus 542 strict and 492 conditional configuration cases. Its
`firmware-validation-configuration-2026-10-23/workspace` remains preserved as
the configuration snapshot. Stock and helper image identities remain unchanged.
A separately built rectangle-data experiment changed six
expanded bytes (SHA256
`95a06b2fc44fa9e952e6dd901484936d8545ae9490061abb446e91debe02bb1a`). Its
x/y/width/height interpretation is inferred, and no hardware render or test
was performed. This 0.399% code-bytes/application-bytes ratio is only a coverage
proxy. The goal of fully editable firmware remains open. See the
[configuration report](2026-10-24_reverse-dc9-configuration-report.md) and
[community configuration summary](community-configuration-workspace.json).

The subsequent apply milestone passed combined offline validation on
2026-10-25 UTC. Six further exact components bring the reconstruction to 68
components / 3,388 instructions / 10,682 code bytes (0.440% of the expanded
application) and seven tables / 755 bytes. The 102-test suite passed, alongside
2,965 strict apply cases with explicitly supplied continuation states. The
latest workspace is `firmware-validation-apply-2026-10-24/workspace`, with 107
base artifacts and two USB images; prior workspaces remain retained. The stock,
helper and layout BIN identities, configuration JSON and source build are
unchanged.

The modeled three-record flag loop follows four-engine preparation. Eight
rectangle bytes copy into the mask-selected record at base `0x47fa9c`, stride
124 and offset `0x20`; only the first-copy prefix was validated. No hardware
functions were stubbed, and the full apply routine was not executed. These
results establish neither hardware behavior nor complete firmware source. See
the combined [configuration and apply report](2026-10-24_reverse-dc9-configuration-report.md)
and [latest apply workspace summary](community-apply-workspace.json).

On 2026-10-24 (America/Los_Angeles), the owner continued offline recovery
through metadata selection and masked register updates. The combined validation
finished at 2026-10-25T06:31Z and passed 115 tests. Eleven further components
bring the reconstruction to 79 components / 3,952 instructions / 12,412 code
bytes (0.5115% of the expanded application), with seven tables / 755 bytes.
This percentage remains a coverage proxy, not engineering or product
completion. The latest workspace is
`firmware-validation-metadata-2026-10-24/workspace` (118 base artifacts plus
two USB images); prior configuration and apply snapshots remain preserved. The
stock, helper and layout BIN hashes are unchanged. Full editable firmware and
hardware validation remain open goals.

Metadata validation covered 2,433 strict cases and 290 conditional cases.
Conditional cases exercise complete mask preparation from `0x23d3a0` under two
explicit counter-store policies, plus an apply prefix that stops at `0x22acd1`
before call `0x20f1ef`. Special metadata and geometry branches stop before
unresolved services. The separate masked-register validator covered 32 default
rejections and 64 conditional cases under the same two policies. Observed
address arithmetic maps engine metadata-index bytes through metadata keys and
bank selection to paged-register addresses; it does not establish physical
connector identity. The model records `r23` clobbering in `register_write8`,
checks stack/saved registers, and retains a completed low-byte write if the
subsequent high-byte access fails. Its bus is plain memory: no hardware page
windows, peripheral effects, concurrency or timing are modeled. The full apply
routine remains unexecuted. See the combined
[metadata report](2026-10-24_reverse-dc9-metadata-report.md) and
[latest metadata workspace summary](community-metadata-workspace.json).

The subsequent metadata-service milestone also falls on 2026-10-24 in
America/Los_Angeles; its combined validation finished at 2026-10-25T06:38Z and
passed 118 tests. Four further components and a 32-byte selector table bring
the reconstruction to 83 components / 4,151 instructions / 13,041 code bytes
(about 0.537% of the expanded application), with eight tables / 787 bytes. The
percentage remains a coverage proxy. The latest workspace is
`firmware-validation-metadata-service-2026-10-24/workspace` (122 base artifacts
plus two USB images). All three BIN hashes remain unchanged; the earlier
79-component snapshot remains available in
`firmware-validation-metadata-2026-10-24/workspace` and
[routing summary](community-metadata-routing-workspace.json).

The selector table maps indices in order to
`0x80, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40`; the physical channel meaning
is not established. The service validator passed 2,833 strict cases and 150
conditional cases. Both enabled and disabled accumulation paths stop before
`0x20f28c`, the call to unrecovered service `0x20e76c`. Publication-tail cases
were tested independently under two counter-store policies and do not prove
that the preceding common-service chain returns. The full apply path remains
incomplete: the six-record reset was not completed, and no hardware operation
was tested. See the combined
[metadata report](2026-10-24_reverse-dc9-metadata-report.md) and
[latest metadata workspace summary](community-metadata-workspace.json).

On 2026-10-25 (America/New_York), the consumer milestone passed its combined
offline gate. Thirteen additional components added 255 instructions and 768 code
bytes, bringing that historical snapshot to 96 components / 4,406 instructions /
13,809 code bytes and eight tables / 787 bytes (about 0.569% of the expanded
application). The gate passed 132 tests, 2,646 strict consumer cases, 262 strict
register cases, and 5,336 conditional cases. Its report and summary are
[`2026-10-25_reverse-dc9-consumers-report.md`](2026-10-25_reverse-dc9-consumers-report.md)
and [`community-metadata-consumers-workspace.json`](community-metadata-consumers-workspace.json),
with validation and latest workspace under
`analysis/extracted/firmware-validation-metadata-consumers-2026-10-25/`.

On 2026-10-25 (America/Los_Angeles), the layout-setup milestone added
eight components (619 instructions;
1,914 code bytes) and one eight-byte table, bringing the overlay to 104
components / 5,025 instructions / 15,723 code bytes and nine tables / 795 bytes
(about 0.648% of the expanded application). The combined gate passed 142 tests,
259 strict setup cases, and 46 conditional cases. The full-apply prefix was
exercised under both store policies and reaches `0x220aa3`, stopping before
`0x21d3b1`. The recovered first-record
setup/range path is exercised for direct mode 0, while the thirteen-record path
is not complete. Selected no-control setup paths complete only under explicit
conditional store hypotheses. See the
[layout-setup report](2026-10-25_reverse-dc9-layout-setup-report.md) and
[workspace summary](community-layout-setup-workspace.json); the previous
consumer milestone remains preserved as a historical snapshot. Three
2,069,060-byte BINs retain hashes `0b5d8350`, `d88a1683`, and `95a06b2f`, with
all eleven resource spans unchanged.

In the previous consumer snapshot, the model completed metadata accumulation
and the six-record reset under two explicit ambiguous-store policies. Its full
apply prefix stopped at `0x23faf2`, before `0x22dc46`. The historical
layout-setup snapshot extended through these consumers and reached `0x220aa3`,
stopping before
`0x21d3b1`; this still does not complete the thirteen-record path. Model memory
is plain bytes, and store policies are conditional software hypotheses. No
physical CPU, register, peripheral, timing, or display behavior was tested. The
baseline, helper-experiment, and layout-experiment BIN hashes remain
`0b5d8350`, `d88a1683`, and `95a06b2f`. The preceding 83- and 96-component
milestones remain preserved historical snapshots.

The historical engine-control milestone on 2026-10-26 (America/New_York)
added 22 routines (602 instructions / 1,709 bytes) and two dispatch tables (72
bytes). At that snapshot the overlay had 126 components (5,627 instructions /
17,432 code bytes) and 11 tables / 867 bytes, about 0.72% of the expanded
application. This ratio is a source-coverage proxy. Its combined offline gate passed 148 tests,
2,078 strict cases and 384 conditional cases. All 602 new instruction
addresses were visited across bounded cases; this does not establish exhaustive
input or path coverage. The full-apply prefix completes the six-record reset
and stops at `0x220bc7`, before unrecovered service `0x22607c`. Disable-control
cases return for 13 mapped fixture indices in normal mode, while enabled
control and full apply remain incomplete. Stock, helper-experiment and
layout-experiment BIN hashes and resource spans remain unchanged. The gate is
offline: physical CPU, page-window, peripheral, timing, display and recovery
behavior remain untested. See the [engine-control report](2026-10-26_reverse-dc9-engine-control-report.md),
[validation](extracted/firmware-validation-engine-control-2026-10-26/validation.json),
and [workspace summary](community-engine-control-workspace.json).

In a subsequent milestone dated 2026-10-26 (America/Los_Angeles), offline
recovery added 11 engine-enable and reference-count routines (292 instructions
/ 893 code bytes). The overlay now contains 137 components (5,919 instructions
/ 18,325 code bytes) and 11 tables / 867 bytes, about 0.755184% of the expanded
application (about 0.76%). This is a code-byte coverage proxy only. The
individual engine-enable validator reports 66 strict and 212 conditional cases;
the enable-leaf validator reports 71 strict cases, 2 conditional store-policy
cases and one expected strict rejection of ambiguous `bg.sw_1`; the reference-
count validator reports 74 cases, including one expected budget stop. The
combined gate passed 159 tests. Across the 292 new instructions, bounded cases
visited 256: ten routines were fully visited and register-pair configuration
reached 42 of 78 instructions. This is not exhaustive input or path coverage.
The [engine-enable report](2026-10-26_reverse-dc9-engine-enable-report.md),
[workspace summary](community-engine-enable-workspace.json), and run under
`extracted/firmware-validation-engine-enable-2026-10-26/` record the combined
evidence. The three preserved builds retain hash prefixes `0b5d8350`,
`d88a1683`, and `95a06b2f`; no encoder or model implementation changed.

The new bounded full-apply prefix completes the six metadata resets, modeled setup for
13 engine records and four auxiliary resets, then stops at `0x22ac52`
before unrecovered service `0x2271a9`. Engine-enable validation covers all 13
records under both store policies and selected special enabled modes 9 and 10
with a direct pair. The leaf validation confirms the zero predicate, state
selection, guarded metadata-byte readers, the channel-record byte `0x28` to
metadata word `0x6c` consumer, and the six-record halfword counter path; the
ambiguous counter store remains rejected by default and is separately run under
two explicit width hypotheses. The reference-count run includes an expected
budget-bounded path. These cases use a bounded instruction model and plain RAM;
they do not validate peripheral or physical CPU behavior. No encoder or model
implementation changed. The full firmware remains incomplete and hardware
untested. The preceding engine-control report remains a historical snapshot.

The historical 2026-10-26 channel-update milestone added nine
byte-exact routines (413 instructions / 1,214 code bytes), including channel
metadata updates, engine-pair availability checks, engine rectangle assignment,
engine-free-index scanning, and the channel range-update path. The source overlay
now contains 146 components / 6,332 instructions / 19,539 code bytes, plus 11
tables / 867 bytes: 0.805% (about 0.81%) of the 2,426,560-byte expanded
application at that milestone. This is source coverage only. The existing 137 source records and
tables remain unchanged. See the
[channel-update report](2026-10-26_reverse-dc9-channel-update-report.md).

That integrated apply fixture completed four channel updates after explicitly
bypassing the existing wait routine via configuration bit `+0x4c & 0x20` or
inactive byte `0x4551e8 == 0`, then stopped at `0x20401d` before unrecovered
`0x21ffb3` in first-engine preparation. It has not returned from full apply.
The active-wait countdown path remains stopped at unmapped state; no timer
completion was invented. Its combined gate passed 171 tests, with 475 channel
cases (two expected budget rejections), 21 leaf cases, and 15 strict plus four
conditional integration cases. Hardware boot, display, recovery and physical
CPU behavior remain untested. Subsequent work recovered `0x21ffb3` and
`0x21bd8d`, along with immediate deferred-request dependencies.

The 2026-10-26 engine-preparation milestone adds eight byte-exact
routines (849 instructions / 2,717 code bytes). The overlay now contains 154
components / 7,181 instructions / 22,256 code bytes, plus 11 tables / 867 bytes:
0.917% (about 0.92%) of the 2,426,560-byte expanded application. The source
coverage percentage is not a product-completion measure. The main routine spans
`0x21ffb3..0x22089f` (707 instructions / 2,284 bytes); adjacent
`0x22089f..0x220995` is a separate pair-configuration routine (78 / 246).

The integrated-apply fixture completes four main preparations, then stops at
`0x23fb33` before `0x23d349`; full apply has not returned. Its fixture includes
nonzero `0x343c14`, size values 1, 1000 and 65535, a fifth synthetic owner
record, and plain `BASES[KEYS]+7` bytes. On 2026-10-29, its combined gate passed
185 repository tests: 21 strict and 20 conditional core cases, 18 leaf cases,
four leaf regressions, and 12 conditional integrated-apply cases. Hardware boot,
display, recovery and physical CPU behavior remain untested. See the
[engine-preparation report](2026-10-26_reverse-dc9-engine-prepare-report.md),
[latest workspace](extracted/firmware-validation-engine-prepare-2026-10-26/workspace/),
and [summary](community-engine-prepare-workspace.json).
