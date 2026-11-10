"""Lossless component export/reassembly for known Spectrum One containers.

This intentionally preserves the encoded program and unresolved fields.
It is a no-change roundtrip, not a compiler or custom-firmware packer.
No device I/O is implemented.
"""
import hashlib
import json

from mstar_checksums import update_checksums
from mstar_resources import resources
from unpack_mstar import unpack



def sha(data):
    return hashlib.sha256(data).hexdigest()


def split(data):
    _, layout = unpack(data)
    start = int(layout["segment_start"], 16)
    stream = int(layout["deflate_start"], 16)
    end = int(layout["segment_end_exclusive"], 16)
    directory = resources(data, end)
    spans = [(0, start, "boot-and-header"), (start, stream, "ap-prefix"),
             (stream, end - 6, "ap-deflate"), (end - 6, end, "ap-trailer")]
    cursor = end
    for entry in directory:
        begin, finish = int(entry["start"], 16), int(entry["end_exclusive"], 16)
        if begin > cursor:
            spans.append((cursor, begin, "padding"))
        spans.append((begin, finish, "resource-" + entry["id"]))
        cursor = finish
    spans.append((cursor, len(data), "file-crc32"))
    parts, records = {}, []
    for i, (begin, finish, label) in enumerate(spans):
        name = f"{i:02d}-{label}.bin"
        parts[name] = data[begin:finish]
        records.append({"name": name, "offset": begin, "size": finish - begin,
                        "sha256": sha(parts[name])})
    manifest = {"format": "spectrum-one-lossless-v1", "source_sha256": sha(data),
                "source_size": len(data), "parts": records, "resources": directory,
                "limitation": "No-change component reconstruction only; not hardware-validated"}
    return manifest, parts


def assemble(manifest, parts):
    if manifest.get("format") != "spectrum-one-lossless-v1":
        raise ValueError("Unsupported component manifest")
    records = manifest["parts"]
    if not records or len(records) > 150:
        raise ValueError("Invalid component count")
    result = bytearray()
    names = set()
    for record in records:
        name = record["name"]
        if name in names or record["offset"] != len(result):
            raise ValueError("Duplicate component or non-contiguous span")
        content = parts[name]
        if len(content) != record["size"] or sha(content) != record["sha256"]:
            raise ValueError(f"Changed component: {name}")
        result.extend(content)
        names.add(name)
    if len(result) != manifest["source_size"] or sha(result) != manifest["source_sha256"]:
        raise ValueError("Reassembled source identity mismatch")
    _, layout = unpack(result)
    start, end = int(layout["segment_start"], 16), int(layout["segment_end_exclusive"], 16)
    resources(result, end)
    # Recalculate the main CRC16 and both CRC32s in dependency order.
    rebuilt = update_checksums(result, start, end)
    if sha(rebuilt) != manifest["source_sha256"]:
        raise ValueError("Checksum regeneration changed source identity")
    return rebuilt


def export(source, destination):
    data = source.read_bytes()
    manifest, parts = split(data)
    destination.mkdir(parents=True, exist_ok=False)
    for name, content in parts.items():
        (destination / name).write_bytes(content)
    (destination / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    return manifest


def rebuild(source, destination):
    manifest = json.loads((source / "manifest.json").read_text())
    parts = {}
    for record in manifest["parts"]:
        name = record["name"]
        if not isinstance(name, str) or "/" in name or "\\" in name or ":" in name or name in (".", ".."):
            raise ValueError("Invalid component filename")
        path = source / name
        if path.resolve().parent != source.resolve():
            raise ValueError("Component escapes bundle directory")
        parts[name] = path.read_bytes()
    data = assemble(manifest, parts)
    with destination.open("xb") as handle:
        handle.write(data)
    return sha(data)
