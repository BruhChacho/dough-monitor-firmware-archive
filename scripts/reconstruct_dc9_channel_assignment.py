"""Recover three byte-exact DC9 channel-assignment routines."""
import json
from pathlib import Path

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha

SPANS = [
    ("channel_assignment", 0x22701c, 0x227145,
     "Assign a channel from metadata and ENGINE records; helper and dispatch behavior remains unresolved.", {0x220c76}),
    ("channel_assignment_state", 0x222ce8, 0x222d32,
     "Map metadata state values 2 and 4 to ENGINE state values 5 and 2, otherwise 1.", set()),
    ("channel_assignment_dispatch", 0x220c76, 0x220cb4,
     "Prepare dispatch arguments, call helpers, then tail-dispatch to 0x226bb5.", {0x226bb5}),
]
UNCOND = {"bt.j", "bn.j", "bg.j"}
RET = {"bt.jr"}

def target(row):
    return int(row.body.rstrip(",").split(",")[-1].strip(), 0)

def is_branch(op):
    return op in UNCOND or op.startswith(("bg.b", "bn.b"))

def check_cfg(name, start, end, rows, external_tails):
    bounds = {r.addr.offset for r in rows}
    succ, returns, tails = {}, [], []
    for i, r in enumerate(rows):
        pc, nxt, op = r.addr.offset, r.addr.offset + r.length, r.mnem
        edges = []
        if op in RET:
            returns.append(pc)
        elif op in UNCOND:
            dest = target(r)
            if dest in external_tails:
                tails.append((pc, dest))
            elif start <= dest < end and dest in bounds:
                edges.append(dest)
            else:
                raise ValueError(f"{name}: invalid unconditional branch target {dest:#x}")
        elif is_branch(op):
            dest = target(r)
            if not start <= dest < end or dest not in bounds:
                raise ValueError(f"{name}: invalid conditional branch target {dest:#x}")
            edges.append(dest)
            if nxt < end: edges.append(nxt)
        elif nxt < end:
            edges.append(nxt)
        succ[pc] = edges
    if set(dest for _, dest in tails) != external_tails:
        raise ValueError(f"{name}: external tail target set differs: {tails}")
    if not returns and not tails:
        raise ValueError(f"{name}: no terminal return or listed external tail")
    reached, todo = set(), [start]
    while todo:
        pc = todo.pop()
        if pc in reached: continue
        if pc not in bounds: raise ValueError(f"{name}: non-boundary CFG node {pc:#x}")
        reached.add(pc); todo.extend(succ[pc])
    if reached != bounds:
        raise ValueError(f"{name}: unreachable instructions {sorted(bounds-reached)[:8]}")
    if any(r.addr.offset+r.length == end and r.mnem not in UNCOND|RET for r in rows):
        raise ValueError(f"{name}: final instruction falls through span")
    return returns, tails

def recover():
    _, expanded, _ = load_original()
    ctx = context()
    layout = json.loads(LAYOUT.read_text())
    prior_bytes = LAYOUT.read_bytes()
    prior_routines, prior_tables = list(layout["routines"]), list(layout["tables"])
    by_name = {r["name"]: r for r in prior_routines}
    if len(by_name) != len(prior_routines): raise ValueError("duplicate existing routine name")
    decoded, records, outputs = {}, [], []
    own = {x[0] for x in SPANS}
    for index, (name, start, end, _, tails_ok) in enumerate(SPANS):
        if start >= end or any(start <= dest < end for dest in tails_ok):
            raise ValueError(f"invalid span or non-external tail: {name}")
        for other, a, b, *_ in SPANS[index + 1:]:
            if start < b and a < end:
                raise ValueError(f"requested spans overlap: {name} and {other}")
    for name, start, end, purpose, tails_ok in SPANS:
        for collection in (prior_routines, prior_tables):
            for rec in collection:
                a = int(rec["address"], 16); b = a + rec["size"]
                if rec.get("name") == name and a == start and b == end and collection is prior_routines: continue
                if start < b and a < end: raise ValueError(f"{name} overlaps {rec['name']}")
        code = expanded[start-0x200000:end-0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if not code or sum(r.length for r in rows) != len(code) or rows[0].addr.offset != start or rows[-1].addr.offset+rows[-1].length != end:
            raise ValueError(f"incomplete decode/boundary: {name}")
        returns, tails = check_cfg(name,start,end,rows,tails_ok)
        internal = {target(r) for r in rows if is_branch(r.mnem) and target(r) in {x.addr.offset for x in rows}}
        lines=["# Firmware-derived reconstruction; excluded from the repository MIT grant.",f"# DC9 v101 candidate [{start:#x},{end:#x}); {purpose}","# Fixed original addresses; not hardware-validated."]
        for r in rows:
            if r.addr.offset in internal: lines.append(f"loc_{r.addr.offset:x}:")
            args=[v.strip() for v in r.body.rstrip(",").split(",")]
            if is_branch(r.mnem) and target(r) in internal: args[-1]=f"loc_{target(r):x}"
            lines.append("    "+r.mnem+" "+", ".join(args))
        source="\n".join(lines)+"\n"
        encoded, listing=assemble(source,start)
        if encoded != code: raise ValueError(f"reassembly differs: {name}")
        path=Path("analysis/reconstructed")/f"spectrum_one_{name}.aeon.s"
        rec={"name":name,"address":hex(start),"size":len(code),"source":path.as_posix(),"original_code_sha256":sha(code),"purpose":purpose,"component_kind":"routine",
             "external_call_targets":[hex(x) for x in sorted({int(r.body,0) for r in rows if r.mnem=="bg.jal"})],"external_tail_targets":[hex(x) for x in sorted({d for _,d in tails})]}
        if name in by_name and by_name[name] != rec: raise ValueError(f"existing record differs: {name}")
        out=ROOT/path
        if out.exists() and out.read_text()!=source: raise ValueError(f"existing source differs: {path}")
        outputs.append((out,source,len(listing))); records.append(rec); decoded[name]=(returns,tails)
    missing=[r for r in records if r["name"] not in by_name]
    layout["routines"].extend(missing)
    if layout["tables"] != prior_tables: raise ValueError("existing tables changed")
    if [r for r in layout["routines"] if r["name"] not in own] != [r for r in prior_routines if r["name"] not in own]: raise ValueError("unrelated routine records changed")
    layout["limitations"][0]=f"{len(layout['routines'])} reconstructed routines/fragments only; remaining firmware is a pinned vendor input"
    new_layout=(json.dumps(layout,indent=2)+"\n").encode()
    for out, source, _ in outputs:
        if not out.exists():
            with out.open("x") as f: f.write(source)
    if new_layout != prior_bytes: LAYOUT.write_bytes(new_layout)
    print(f"Validated {len(records)} routines, {sum(x[2] for x in outputs)} instructions, {sum(r['size'] for r in records)} code bytes; added {len(missing)} records")
    for name, *_ in SPANS: print(f"{name}: returns={len(decoded[name][0])}, external_tail_targets={[hex(x) for _,x in decoded[name][1]]}")

if __name__ == "__main__": recover()
