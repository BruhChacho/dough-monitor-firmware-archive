# DC9 receive-service source reconstruction

Continuation: the [transfer-source report](2026-10-23_reverse-dc9-transfer-report.md)
describes the later 43-component build and explicit store-policy experiments.
This report and `community-receive-workspace.json` retain the 35-component
milestone. Its source/tool/model versions are saved in
`analysis/scratch/transfer-before-2026-10-23/`; current canonical build and model
JSON has advanced. Ambiguous stores remain rejected by default.

Date: 2026-10-23. Scope: [authorized offline community firmware work](scope.md).

## Result

Fifteen additional components now assemble byte for byte from source: the
2,111-byte receive/transmit transfer service, the 175-byte indirect reader, and
thirteen channel/state helpers totaling 1,341 bytes. The source build contains
35 routines/fragments, 1,697 instructions / 5,377 code bytes, and four tables /
531 bytes. Recovered code is about 0.222% of the expanded application; most
firmware remains pinned vendor code.

The fresh [development workspace](../firmware/README.md) is
`analysis/extracted/community-receive-workspace/`. It contains 72 base artifacts
plus the two separately manifested USB images. The previous 20-component
workspace and every earlier generated BIN remain intact.

## Evidence to findings

| Evidence | Artifact | Finding |
|---|---|---|
| E34 | [Source layout](reconstructed/dc9-source-layout.json), [reconstruction script](../scripts/reconstruct_dc9_receive.py), [control-flow evidence](dc9-receive-path.json) | Complete fixed code spans, instruction boundaries, original hashes and direct call dependencies |
| E35 | [Receive validation](dc9-receive-validation.json), [validator](../scripts/validate_dc9_receive.py), [regressions](../scripts/test_dc9_receive.py) | Plain-memory helper contracts, completed service paths, partial decisions and strict failure boundaries |
| E36 | [Fresh workspace evidence](community-receive-workspace.json), build JSON sidecars | Byte-identical baseline, isolated helper experiment, unchanged resources and preserved inputs |

F34 — All fifteen components re-encode exactly. The assembler adds four
observed forms: `bn.lh`, `bn.j`, `bg.ble` and `bg.bgt`. The halfword load encoder
retains the observed low encoding bit, which the shared decoder hides, and
rejects unobserved negative or ambiguous offsets. The instruction model assumes
low-halfword results and read-before-destination-write behavior. These choices
are explicit hypotheses; encoding equality is not independent ISA validation.

F35 — The transfer service is broader than the earlier receive-only fragments.
It reads per-slot event status, returns for zero, handles a global error field,
and selects receive versus transmit with `event & 0x18`. Values `0x08` and
`0x10` enter the receive and transmit branches respectively. Other combinations
copy a slot data-register byte into its adjacent register and clear software
state/count. Physical interrupt, acknowledgement and transport semantics remain
unknown; tests use plain bytes rather than a peripheral implementation.

F36 — Ring address generation masks indices with `0x7f`. The continuation path
normalizes a current position by adding 128 until it exceeds the previous
position, then starts from `previous + 1`. Tests cover 245 combinations across
five slots, including equal positions and wraparound, with initial positions
restricted to 0–127. Equal positions on this particular path produce a full
128-position span. The event/state conditions deciding whether that represents
valid pending data are not modeled fully. This establishes address arithmetic,
not physical FIFO capacity or overrun safety.

F37 — The actual readiness decision is now executed in isolation. It requires
nonzero expected length, received count equal to length plus two, and zero from
the slot-specific frame-status helper. The two outcomes stop before uncertain
bookkeeping: the failure path at `0x20d630`, or the successful path at `0x20da60`.
The subsequent stores at `0x20d64d` / `0x20da6b` use unresolved `bg.sw_1` width
at candidate `0x4551ec`. They remain excluded from execution.

F38 — The copy body at `0x20d94c` writes to `slot_base + received_count`, then
increments the counter as an eight-bit value. There is no local `count < 128`
guard between the shown loop entry and store. An isolated count-127 test writes
the final slot byte; count 128 is rejected by the model's unmapped-memory check.
The XOR helper similarly rejects a 129-byte read from a mapped 128-byte slot.
These are local boundary probes. Upstream hardware/state constraints and the
relationship to command-specific lengths remain unresolved; no external
reachability or firmware vulnerability is established by these probes.

F39 — Indirect-buffer reading programs `uint16(argument - 0x4000)` through
logical `0x3c02`, sets software flag `0x453b9e`, and calls masked update to set
bit `0x02` at control register `0x3c06`. Busy polling checks bit `0x20`, and the
data byte comes from `0x3c01`. Both poll loops have counters initialized to
`0xffff`; exhaustion falls through rather than visibly returning an error.
The flag check after the data read can jump back to retrigger the operation.
Its interaction with asynchronous code is unknown. Tests execute setup up to
the masked-update dependency and verify that a fixed busy input exhausts the
execution budget instead of faking a successful read.

## Source coverage and validation

The thirteen new helpers cover control-bit OR operations, frame/control status,
event/data reads and writes, state initialization/clearing and packet XOR.
All 409 of their instructions were visited. The transfer service has 147/660
instructions visited; the indirect reader has 25/56. Another 57 previously
recovered instructions are reached through calls, for 638 visited instructions
in this validator. Source recovery is complete for the listed spans, but
execution coverage of the large routines is partial.

The receive validator passes **29,495 cases**:

| Group | Cases | Completion scope |
|---|---:|---|
| Status/data reads and control/event/data writes | 17,920 | Complete helper runs |
| Unsupported-slot no-ops | 50 | Complete helper runs |
| State initialization/clearing and packet XOR | 1,044 | Complete helper runs |
| No-event, other-event and global-error service paths | 50 | Complete service runs for those inputs |
| Readiness decisions | 10,180 | Stopped before bookkeeping |
| Ring normalization | 245 | Stopped before copying |
| Indirect-read setup | 6 | Stopped before masked update |

Thus 19,064 runs complete their selected helper/path, and 10,431 are explicitly
partial. The model reports `termination: breakpoint` and the stop address for
partial runs. Stops must be valid instruction boundaries. Unsupported stores,
unmapped memory and exhausted budgets still raise errors.

The full suite passes **70 tests**. The prior command-path validator and all
266 register cases were rerun successfully against the expanded source/model.
The existing CALL fallthrough hypothesis, aliased-load assumptions, unknown
store width and lack of device-side behavior still limit the conclusions.

## Builds and reproduction

Fresh workspace and canonical source builds produce the same two outputs:

| Image | SHA256 |
|---|---|
| Stock baseline | `0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9` |
| Helper-rewrite experiment | `d88a1683bed773e1444fa8b0023852b5c48f95a2a9481bfa360036097dc734ad` |

Both remain 2,069,060 bytes and pass normalized main CRC16 and both CRC32s.
All eleven physical resource ranges are unchanged. The helper experiment
still changes only 29 program bytes inside the original 39-byte routine.
The newly recovered receive code remains byte-identical to the vendor image.
No image was booted on a monitor.

The source reconstruction command refuses to replace differing existing source
or layout records. Fresh workspace/output names are required for build runs:

```bash
.venv/bin/python scripts/reconstruct_dc9_receive.py
.venv/bin/python scripts/trace_dc9_receive.py
.venv/bin/python scripts/validate_dc9_receive.py
.venv/bin/python scripts/validate_dc9_registers.py
.venv/bin/python scripts/validate_dc9_module.py
.venv/bin/python -m unittest discover -s scripts -p 'test_*.py'
.venv/bin/python scripts/firmware_workspace.py verify analysis/extracted/community-receive-workspace
```

Use the [build guide](../firmware/README.md) to create another workspace, edit
source, or build the included helper alternative. Tools remain local Python
and the pinned AEON decoder; no vendor executable, network access or device I/O
is involved. These raw images have no conventional PE/ELF import table; the
direct call records in E34 document the relevant local dependencies.

## Preservation and next work

Git remains on `main` at `50dbabfe6a8d8c9d1616616235ce570538270fde`, matching
the local `origin/main` reference. No fetch, commit or push was performed.
The 73 pre-existing changed/untracked files are preserved with hashes in
`analysis/scratch/receive-before-2026-10-23/`; original working paths remain.
Earlier workspace/report evidence is historical where it records older source
or tool hashes. The archive ZIPs remain unchanged.

P34 — Resolve the `bg.sw_1` stores at both nesting-counter and ready-flag sites
before claiming execution of the complete receive service. Find independent
ISA evidence or constrain width using additional adjacent-data usage; do not
pick a width merely because it lets a test pass.

P35 — Recover transmit-side indirect writer `0x20e3be`, channel-selection helper
`0x20c711`, and follow-up service `0x20d2b7`. Trace who changes `0x453b9e` and
the ring/state fields. The full direct-call map now identifies these remaining
dependencies. Then validate payload movement and receive-count bounds under a
clearly specified peripheral contract.

P36 — Continue meaningful source recovery toward display initialization,
input switching, sleep/wake and other monitor functions. EFE integrity/repacking
and USB source builds remain separate work. Raw files and a repeatable partial
source build are available; a complete hardware-proven community firmware is
still the long-term objective.
