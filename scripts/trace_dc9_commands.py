"""Record static command routing and direct-entry evidence from pinned DC9.

Bytewise branch scans produce candidates, not proof of executable reachability.
No indirect-call recovery or hardware execution is claimed.
"""
import json
from pathlib import Path
import struct

from aeon_helper_emulator import context, decoder_identity
from build_dc9_source_baseline import load_original, sha
from recompress_dc9 import SOURCE_SHA

ROOT = Path(__file__).resolve().parents[1]
BASE = 0x200000
ROUTER = (0x26f043, 0x26f0cf)
HELPER = (0x204059, 0x204080)


def signed(value, bits):
    return value - (1 << bits) if value & (1 << (bits - 1)) else value


def direct_target(data, offset, base=BASE):
    """All direct branch forms in the current SLEIGH subset, at any byte."""
    opcode = data[offset] >> 2
    pc = base + offset
    if opcode in (0x34, 0x35, 0x39) and offset + 4 <= len(data):
        word = int.from_bytes(data[offset:offset + 4], "big")
        bits, shift = (25, 1) if opcode == 0x39 else (13, 3)
        return pc + signed((word >> shift) & ((1 << bits) - 1), bits), 4
    if opcode in (8, 9, 10, 11) and offset + 3 <= len(data):
        word = int.from_bytes(data[offset:offset + 3], "big")
        if opcode in (10, 11):
            bits, shift = 18, 0
        else:
            bits, shift = (16 if opcode == 8 and word & 1 else 8), 2
        return pc + signed((word >> shift) & ((1 << bits) - 1), bits), 3
    if opcode == 0x24 and offset + 2 <= len(data):
        word = int.from_bytes(data[offset:offset + 2], "big")
        return pc + signed(word & 0x3ff, 10), 2
    return None


def disassemble(ctx, expanded, begin, end):
    data = expanded[begin - BASE:end - BASE]
    instructions = list(ctx.disassemble(data, base_address=begin).instructions)
    if sum(x.length for x in instructions) != len(data):
        raise ValueError("Incomplete bounded disassembly")
    return [{"address": hex(x.addr.offset), "size": x.length,
             "bytes": expanded[x.addr.offset - BASE:x.addr.offset - BASE + x.length].hex(),
             "mnemonic": x.mnem, "operands": x.body} for x in instructions]


def main():
    _, expanded, _ = load_original()
    ctx = context()
    direct, pointers = [], []
    for offset in range(len(expanded)):
        target = direct_target(expanded, offset)
        if target and (HELPER[0] <= target[0] < HELPER[1] or target[0] == ROUTER[0]):
            address, size = target
            listing = disassemble(ctx, expanded, BASE + offset, BASE + offset + size)[0]
            # Validate arithmetic against the decoder's printed direct target.
            if int(listing["operands"].split(",")[-1], 16) != address:
                raise ValueError("Direct target disagrees with decoder")
            direct.append({**listing, "target": hex(address),
                           "origin_inside_helper": HELPER[0] <= BASE + offset < HELPER[1]})
        if offset + 4 <= len(expanded):
            for endian in ("little", "big"):
                value = int.from_bytes(expanded[offset:offset + 4], endian)
                if HELPER[0] <= value < HELPER[1]:
                    pointers.append({"expanded_offset": hex(offset), "endian": endian,
                                     "candidate_target": hex(value),
                                     "surrounding_bytes": expanded[max(0, offset - 12):offset + 16].hex(),
                                     "status": "unclassified literal; may be data, not proven to be a pointer"})
    table_specs = [("primary", 0x328610, 42), ("secondary", 0x2aed7c, 41),
                   ("fallback", 0x2af71c, 12)]
    tables = {name: expanded[address - BASE:address - BASE + size]
              for name, address, size in table_specs}
    routes = []
    for code in range(256):
        groups = [name for name, table in tables.items() if code in table]
        route = groups[0] if groups else "reject"
        item = {"command": hex(code), "matching_groups": groups, "selected_group": route}
        if route == "secondary":
            target = struct.unpack_from("<I", expanded, 0x2aeb78 - BASE + (code - 0x32) * 4)[0]
            item["secondary_switch_target"] = hex(target)
        routes.append(item)
    router = disassemble(ctx, expanded, *ROUTER)
    call = ctx.translate(expanded[0x6f084:0x6f088], base_address=0x26f084, max_instructions=1)
    boundaries = {int(x["address"], 16) for x in router}
    report = {
        "source_sha256": SOURCE_SHA, "expanded_sha256": sha(expanded),
        **decoder_identity(), "candidate_load_base": hex(BASE),
        "scan_span": [hex(BASE), hex(BASE + len(expanded))],
        "direct_branch_candidates": direct, "literal_helper_pointer_candidates": pointers,
        "router": {"entry": hex(ROUTER[0]), "end_exclusive": hex(ROUTER[1]),
                   "slot_base": "0x47eb80", "slot_stride": 128, "command_offset": 2,
                   "required_selector": "0xcc", "listing": router},
        "tables": [{"name": name, "address": hex(address), "size": size,
                    "bytes": tables[name].hex(), "sha256": sha(tables[name])}
                   for name, address, size in table_specs],
        "routes_for_selector_cc": routes,
        "route_counts": {name: sum(x["selected_group"] == name for x in routes)
                         for name in ("primary", "secondary", "fallback", "reject")},
        "secondary_switch": {"table": "0x2aeb78", "minimum_command": "0x32",
                             "entries": 109, "default_target": "0x205c39"},
        "fallback_handler": {"address": "0x235207", "listing": disassemble(ctx, expanded, 0x235207, 0x23520b)},
        "call_semantics_gap": {"address": "0x26f084", "pcode": [str(x) for x in call.ops],
                               "sleigh_link_value": "0x26f08c",
                               "link_is_instruction_boundary": 0x26f08c in boundaries,
                               "fallthrough_instruction": "0x26f088",
                               "status": "Do not use this SLEIGH CALL model for multi-function equivalence"},
        "limitations": ["Static candidates, not executed control flow",
                        "Only the expanded AP is scanned; resource runtime mappings remain unknown",
                        "No proof against computed/indirect entry or unknown instruction forms",
                        "Command meanings and physical transport are not established",
                        "Handler bodies and device side effects are not emulated"],
    }
    (ROOT / "analysis/dc9-command-routing.json").write_text(json.dumps(report, indent=2) + "\n")
    print(f"Direct candidates: {len(direct)}; literal helper pointers: {len(pointers)}")
    print("Route counts:", report["route_counts"])
    print("Call semantics gap: SLEIGH link 0x26f08c is not a router instruction boundary")


if __name__ == "__main__":
    main()
