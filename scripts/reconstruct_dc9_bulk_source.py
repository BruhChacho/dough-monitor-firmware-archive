"""Validate and optionally install the reviewed DC9 bulk source inventory.

Dry run by default. --apply writes only new, byte-exact assembly and appends
matching layout records after all source, CFG, identity, and conflict checks.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path

from aeon_helper_emulator import context, decoder_identity
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha
from discover_dc9_source_batch import (BASE, LIMIT, existing_calls, inspect,
                                       overlaps, write_new_or_identical)
from recompress_dc9 import SOURCE_SHA


INVENTORY = ROOT / "analysis/reconstructed/dc9-bulk-source-batch.json"
SOURCE_DIR = ROOT / "analysis/scratch/dc9-source-batch-assembly"
RECONSTRUCTED = ROOT / "analysis/reconstructed"
RESERVED = ((0x2ac756, 0x2ac837), (0x2ad165, 0x2ad1b7),
            (0x2ac268, 0x2ac288), (0x2aba8f, 0x2abba0))
PURPOSE = "Byte-exact recovered source; semantics not yet validated"


def identity_of(data):
    return hashlib.sha256(data).hexdigest()


def candidate_name(address):
    return f"routine_{address:x}"


def selected_candidates(inventory):
    selected = []
    for candidate in inventory["candidates"]:
        start, end = int(candidate["address"], 16), int(candidate["end_exclusive"], 16)
        if any(start < b and a < end for a, b in RESERVED):
            continue
        selected.append(candidate)
    return selected


def planned_record(candidate, source, inventory_sha):
    address = int(candidate["address"], 16)
    relative = Path("analysis/reconstructed") / f"spectrum_one_{candidate_name(address)}.aeon.s"
    return {
        "name": candidate_name(address), "address": hex(address),
        "size": candidate["size"], "source": relative.as_posix(),
        "original_code_sha256": candidate["original_code_sha256"],
        "purpose": PURPOSE, "component_kind": "routine",
        "external_call_targets": candidate["external_call_targets"],
        "external_tail_targets": candidate["external_tail_targets"],
        "source_normalized_utf8_sha256": identity_of(source.encode()),
        "candidate_inventory_sha256": inventory_sha,
    }


def original_prefix(current, routine_count, table_count):
    """Recover the published prebatch prefix, preserving any later additions."""
    base = json.loads(json.dumps(current))
    base["routines"] = base["routines"][:routine_count]
    base["tables"] = base["tables"][:table_count]
    base["limitations"][0] = (f"{len(base['routines'])} reconstructed routines/fragments only; "
                              "remaining firmware is a pinned vendor input")
    return (json.dumps(base, indent=2) + "\n").encode()


def validate(inventory_path=INVENTORY, source_dir=SOURCE_DIR):
    inventory_path, source_dir = inventory_path.resolve(), source_dir.resolve()
    if not inventory_path.is_relative_to(RECONSTRUCTED.resolve()):
        raise ValueError("accepted manifest must be under analysis/reconstructed")
    if not source_dir.is_relative_to((ROOT / "analysis/scratch").resolve()):
        raise ValueError("candidate source must be under analysis/scratch")
    inventory_bytes = inventory_path.read_bytes()
    inventory = json.loads(inventory_bytes)
    if (inventory.get("format") != "dc9-bulk-source-candidate-inventory-v1"
            or inventory.get("source_firmware_sha256") != SOURCE_SHA
            or inventory.get("candidate_load_base") != hex(BASE)
            or inventory.get("max_candidate_bytes") != LIMIT):
        raise ValueError("unsupported or different candidate inventory")
    actual_decoder = decoder_identity()
    for key in ("pypcode_version", "sleigh_files_sha256"):
        if inventory.get("decoder", {}).get(key) != actual_decoder[key]:
            raise ValueError(f"candidate decoder identity differs: {key}")
    _, expanded, _ = load_original()
    if sha(expanded) != inventory["expanded_sha256"]:
        raise ValueError("expanded vendor program identity differs")
    selected = selected_candidates(inventory)
    all_candidates = inventory["candidates"]
    if (inventory["summary"]["accepted"] != len(all_candidates)
            or inventory["summary"]["code_bytes"] != sum(c["size"] for c in all_candidates)
            or len({c["address"] for c in all_candidates}) != len(all_candidates)):
        raise ValueError("inventory summary or addresses inconsistent")
    layout_bytes = LAYOUT.read_bytes()
    current = json.loads(layout_bytes)
    old_routines = list(current["routines"])
    selected_names = {candidate_name(int(c["address"], 16)) for c in selected}
    if len(selected_names) != len(selected):
        raise ValueError("duplicate planned routine name")
    prefix_count = inventory.get("baseline_routine_count")
    table_count = inventory.get("baseline_table_count")
    if not isinstance(prefix_count, int) or prefix_count < 1 or len(old_routines) < prefix_count:
        raise ValueError("missing or invalid baseline routine count")
    if not isinstance(table_count, int) or table_count < 0 or len(current["tables"]) < table_count:
        raise ValueError("missing or invalid baseline table count")
    reconstructed = original_prefix(current, prefix_count, table_count)
    if identity_of(reconstructed) != inventory["layout_sha256"]:
        raise ValueError("published prebatch layout prefix differs from manifest")
    if (current["format"] != "dc9-source-baseline-v1"
            or current["source_firmware_sha256"] != SOURCE_SHA
            or int(current["candidate_load_base"], 16) != BASE):
        raise ValueError("baseline layout identity differs")
    inventory_sha = identity_of(inventory_bytes)
    ownership = {candidate_name(int(c["address"], 16)): c for c in selected}
    installed = []
    for row in old_routines[prefix_count:]:
        if row["name"] in ownership:
            candidate = ownership[row["name"]]
            if (row.get("candidate_inventory_sha256") != inventory_sha
                    or row.get("address") != candidate["address"]
                    or row.get("size") != candidate["size"]
                    or row.get("original_code_sha256") != candidate["original_code_sha256"]):
                raise ValueError(f"conflicting record with planned name: {row['name']}")
            installed.append(row)
    if installed and len(installed) != len(selected):
        raise ValueError("partial bulk batch already installed")
    stage = "already_applied" if installed else "fresh"
    owned_ids = {id(row) for row in installed}
    other_routines = [row for row in old_routines if id(row) not in owned_ids]
    existing_spans = sorted((int(row["address"], 16),
                             int(row["address"], 16) + row["size"], row["name"])
                            for row in other_routines + current["tables"])
    existing_entries = {int(row["address"], 16) for row in other_routines}
    ctx = context()
    call_layout = dict(current)
    call_layout["routines"] = other_routines
    sites = existing_calls(ctx, expanded, call_layout)
    call_entries = set(sites)
    for candidate in all_candidates:
        call_entries.update(int(x, 16) for x in candidate["external_call_targets"])
    entries = existing_entries | call_entries | {int(c["address"], 16) for c in all_candidates}
    provenance_spans = [
        (int(row["address"], 16), int(row["address"], 16) + row["size"], row["name"])
        for row in old_routines[:prefix_count]
    ] + [
        (int(row["address"], 16), int(row["end_exclusive"], 16), candidate_name(int(row["address"], 16)))
        for row in all_candidates
    ]
    for candidate in selected:
        address = int(candidate["address"], 16)
        provenance = candidate.get("provenance_call_sites")
        if not isinstance(provenance, list) or not provenance:
            raise ValueError(f"missing direct-call provenance at {address:#x}")
        for value in provenance:
            call_pc = int(value, 16)
            containing = [span for span in provenance_spans if span[0] <= call_pc < span[1]]
            if len(containing) != 1:
                raise ValueError(f"callsite not in published/accepted code at {call_pc:#x}")
            decoded = ctx.disassemble(expanded[call_pc - BASE:call_pc - BASE + 4],
                                      base_address=call_pc, max_instructions=1).instructions
            if (len(decoded) != 1 or decoded[0].mnem != "bg.jal"
                    or int(decoded[0].body, 0) != address
                    or call_pc + decoded[0].length > containing[0][1]):
                raise ValueError(f"unverified direct-call provenance at {call_pc:#x}")
    pending_files, additions = [], []
    selected_spans = []
    for candidate in selected:
        address = int(candidate["address"], 16)
        end = int(candidate["end_exclusive"], 16)
        if candidate["size"] != end - address or not 0 < candidate["size"] <= LIMIT:
            raise ValueError(f"invalid candidate size at {address:#x}")
        if overlaps(address, end, existing_spans + selected_spans):
            raise ValueError(f"candidate overlaps source or another candidate at {address:#x}")
        selected_spans.append((address, end, candidate_name(address)))
        verified, source, _ = inspect(address, ctx=ctx, expanded=expanded,
                                      protected=existing_spans, entries=entries,
                                      call_entries=call_entries)
        for key in ("address", "end_exclusive", "size", "instructions",
                    "original_code_sha256", "assembly_sha256",
                    "external_call_targets", "external_tail_targets", "return_sites"):
            if verified[key] != candidate[key]:
                raise ValueError(f"fresh CFG differs from inventory at {address:#x}: {key}")
        scratch_source = source_dir / f"candidate_{address:x}.aeon.s"
        if scratch_source.exists() and scratch_source.read_text() != source:
            raise ValueError(f"candidate scratch assembly differs from verified CFG at {address:#x}")
        if identity_of(source.encode()) != candidate["assembly_sha256"]:
            raise ValueError(f"candidate assembly hash differs at {address:#x}")
        code = expanded[address - BASE:end - BASE]
        encoded, listing = assemble(source, address)
        if encoded != code or len(listing) != candidate["instructions"]:
            raise ValueError(f"candidate reassembly differs at {address:#x}")
        record = planned_record(candidate, source, inventory_sha)
        target = ROOT / record["source"]
        if not target.resolve().is_relative_to(RECONSTRUCTED.resolve()):
            raise ValueError("planned source path outside reconstruction directory")
        if target.exists() and target.read_text() != source:
            raise ValueError(f"conflicting existing source: {target}")
        pending_files.append((target, source))
        additions.append(record)
    expected = json.loads(json.dumps(current))
    if stage == "fresh":
        prior_names = {row["name"] for row in old_routines}
        if selected_names & prior_names:
            raise ValueError("planned name already exists in baseline layout")
        expected["routines"].extend(additions)
        expected["limitations"][0] = (f"{len(expected['routines'])} reconstructed routines/fragments only; "
                                     "remaining firmware is a pinned vendor input")
    else:
        actual = {row["name"]: row for row in installed}
        if len(actual) != len(installed) or any(actual.get(row["name"]) != row for row in additions):
            raise ValueError("installed batch records differ from exact planned records")
    return stage, layout_bytes, expected, pending_files, additions


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inventory", type=Path, default=INVENTORY)
    parser.add_argument("--source-dir", type=Path, default=SOURCE_DIR)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    stage, old_bytes, expected, pending_files, additions = validate(
        args.inventory, args.source_dir)
    count = len(additions)
    code_bytes = sum(record["size"] for record in additions)
    if args.apply and stage == "fresh":
        if LAYOUT.read_bytes() != old_bytes:
            raise ValueError("layout changed during validation")
        for path, source in pending_files:
            write_new_or_identical(path, source)
        if LAYOUT.read_bytes() != old_bytes:
            raise ValueError("layout changed before publication")
        staged = LAYOUT.with_name(LAYOUT.name + ".bulk-new")
        if staged.exists():
            raise ValueError(f"refusing existing temporary layout: {staged}")
        with staged.open("x") as stream:
            stream.write(json.dumps(expected, indent=2) + "\n")
        os.replace(staged, LAYOUT)
        print(f"applied {count} routines / {code_bytes} byte-exact code bytes")
    else:
        print(f"{stage}: {count} routines / {code_bytes} byte-exact code bytes; "
              f"{'already installed' if stage == 'already_applied' else 'dry run only'}")


if __name__ == "__main__":
    main()
