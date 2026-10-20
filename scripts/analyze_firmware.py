"""Offline, non-executing inventory of original firmware ZIP contents.

Requires pefile and py7zr (see analysis-requirements.txt). Derived binaries are
content-addressed under the gitignored analysis/extracted directory. No vendor
program is executed, and no device API is used.
"""

from collections import Counter
import csv
import hashlib
import io
import json
import math
from pathlib import Path, PurePosixPath
import re
import struct
import sys
import zipfile
import zlib

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / ".tools" / "python"))
import pefile
import py7zr

OUT = ROOT / "analysis"
EXTRACTED = OUT / "extracted"
MAX_MEMBER = 150 * 1024 * 1024


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def entropy(data):
    if not data:
        return 0
    return round(-sum((n / len(data)) * math.log2(n / len(data))
                      for n in Counter(data).values()), 5)


def save_json(name, data):
    (OUT / name).write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def safe_name(name):
    normalized = PurePosixPath(name.replace("\\", "/"))
    if normalized.is_absolute() or ".." in normalized.parts or ":" in name:
        raise ValueError("Unsafe archive member: " + name)
    return normalized.name


def add_member(items, data, name, source):
    filename = safe_name(name)
    if len(data) > MAX_MEMBER:
        raise ValueError("Oversized member: " + name)
    digest = sha256(data)
    if digest not in items:
        relative = Path("analysis/extracted") / digest / filename
        target = ROOT / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        if not target.exists() or sha256(target.read_bytes()) != digest:
            target.write_bytes(data)
        items[digest] = {"sha256": digest, "size_bytes": len(data),
                         "local_path": relative.as_posix(), "names": [], "sources": []}
    entry = items[digest]
    if name not in entry["names"]:
        entry["names"].append(name)
    if source not in entry["sources"]:
        entry["sources"].append(source)
    return entry


def scan_edids(data):
    results = []
    for m in re.finditer(b"\x00\xff\xff\xff\xff\xff\xff\x00", data):
        off = m.start()
        block = data[off:off + 128]
        if len(block) != 128 or sum(block) % 256:
            continue
        code = int.from_bytes(block[8:10], "big")
        maker = "".join(chr(64 + ((code >> shift) & 31)) for shift in (10, 5, 0))
        descriptors = []
        for start in (54, 72, 90, 108):
            desc = block[start:start + 18]
            if desc[:3] == b"\0\0\0" and desc[3] in (0xfc, 0xfe, 0xff):
                descriptors.append({"type": hex(desc[3]), "text": desc[5:18].decode("ascii", "replace").strip(" \n\0")})
        ext_count = block[126]
        ext_valid = [sum(data[off + 128 * n:off + 128 * (n + 1)]) % 256 == 0
                     and len(data[off + 128 * n:off + 128 * (n + 1)]) == 128
                     for n in range(1, ext_count + 1)]
        results.append({"offset": hex(off), "manufacturer": maker,
                        "product_id": hex(int.from_bytes(block[10:12], "little")),
                        "edid_version": f"{block[18]}.{block[19]}", "extension_count": ext_count,
                        "extension_checksums_valid": ext_valid, "descriptors": descriptors})
    return results


def profile_bin(data):
    markers = []
    pattern = re.compile(rb"MStar|MSTAR|MST9|Realtek|RTD\d|RLX|AEON|aeon|ES07|BOOT|boot|Boot|Version|version|CRC|checksum|ISP|RTOS|Linux|USB|\.bin|LZMA|LZSS")
    for m in re.finditer(rb"[ -~]{6,}", data):
        if pattern.search(m.group()):
            markers.append({"offset": hex(m.start()), "text": m.group().decode("ascii")[:200]})
    signatures = {}
    for name, value in {"elf": b"\x7fELF", "xz": b"\xfd7zXZ\x00", "gzip": b"\x1f\x8b\x08",
                        "zip": b"PK\x03\x04", "squashfs_le": b"hsqs", "7z": b"7z\xbc\xaf\x27\x1c",
                        "mstar_tail_marker": bytes.fromhex("55 aa ab cd"),
                        "beef_marker": bytes.fromhex("be ef")}.items():
        offsets = [hex(m.start()) for m in re.finditer(re.escape(value), data)]
        if offsets:
            signatures[name] = offsets[:100]
    return {"header_256_hex": data[:256].hex(), "tail_64_hex": data[-64:].hex(),
            "entropy": entropy(data), "sum8": sum(data) & 255,
            "crc32": f"{zlib.crc32(data):08x}", "signatures": signatures,
            "marker_strings": markers, "edid_candidates": scan_edids(data),
            "blocks_64k": [{"offset": hex(off), "size_bytes": len(data[off:off + 65536]),
                            "entropy": entropy(data[off:off + 65536]),
                            "sha256": sha256(data[off:off + 65536])}
                           for off in range(0, len(data), 65536)]}


def profile_pe(data):
    pe = pefile.PE(data=data)
    imports = []
    for library in getattr(pe, "DIRECTORY_ENTRY_IMPORT", []):
        imports.append({"dll": library.dll.decode("ascii", "replace"),
                        "functions": [i.name.decode("ascii", "replace") if i.name else f"ordinal:{i.ordinal}" for i in library.imports]})
    overlay = pe.get_overlay_data_start_offset()
    exports = [{"name": s.name.decode("ascii", "replace") if s.name else None,
                "ordinal": s.ordinal, "rva": hex(s.address)}
               for s in getattr(getattr(pe, "DIRECTORY_ENTRY_EXPORT", None), "symbols", [])]
    needles = [b"PyInstaller", b"MEI\x0c\x0b\x0a\x0b\x0e", b"UPX!", b"7z\xbc\xaf\x27\x1c", b"Inno Setup", b"Nullsoft"]
    return {"machine": hex(pe.FILE_HEADER.Machine), "image_base": hex(pe.OPTIONAL_HEADER.ImageBase),
            "entry_rva": hex(pe.OPTIONAL_HEADER.AddressOfEntryPoint),
            "clr_directory_size": pe.OPTIONAL_HEADER.DATA_DIRECTORY[14].Size,
            "imports": imports, "exports": exports, "overlay_offset": hex(overlay) if overlay else None,
            "overlay_size": len(data) - overlay if overlay else 0,
            "sections": [{"name": s.Name.rstrip(b"\0").decode("ascii", "replace"),
                          "rva": hex(s.VirtualAddress), "raw_offset": hex(s.PointerToRawData),
                          "raw_size": s.SizeOfRawData, "virtual_size": s.Misc_VirtualSize,
                          "entropy": round(s.get_entropy(), 5)} for s in pe.sections],
            "packaging_markers": {n.hex(): [hex(m.start()) for m in re.finditer(re.escape(n), data)][:12]
                                  for n in needles if n in data}}


def main():
    OUT.mkdir(exist_ok=True)
    rows = list(csv.DictReader((ROOT / "MANIFEST.csv").open(encoding="utf-8")))
    items = {}
    for row in rows:
        package = ROOT / row["local_path"]
        if sha256(package.read_bytes()) != row["sha256"]:
            raise ValueError("Package differs from manifest: " + row["local_path"])
        with zipfile.ZipFile(package) as archive:
            for info in archive.infolist():
                if info.is_dir():
                    continue
                if info.file_size > MAX_MEMBER:
                    raise ValueError("Oversized ZIP member: " + info.filename)
                add_member(items, archive.read(info), info.filename,
                           {"package": row["local_path"], "member": info.filename,
                            "models": row["models"].split("|"), "version": row["version"], "component": row["component"]})
    # Exactly one level of nested 7z extraction, with size and path validation.
    for entry in list(items.values()):
        if not entry["local_path"].lower().endswith(".7z"):
            continue
        source_path = ROOT / entry["local_path"]
        destination = source_path.parent / "unpacked"
        with py7zr.SevenZipFile(source_path, "r") as archive:
            members = archive.list()
            for member in members:
                safe_name(member.filename)
                if getattr(member, "is_symlink", False) or member.uncompressed > MAX_MEMBER:
                    raise ValueError("Unsafe 7z member: " + member.filename)
            if sum(m.uncompressed for m in members) > MAX_MEMBER:
                raise ValueError("Oversized nested archive")
            archive.extractall(path=destination)
        for member in members:
            if member.is_directory:
                continue
            data = (destination / member.filename).read_bytes()
            for source in entry["sources"]:
                add_member(items, data, member.filename, {**source, "nested_member": member.filename})

    profiles = {}
    for digest, entry in sorted(items.items()):
        path = ROOT / entry["local_path"]
        suffix = path.suffix.lower()
        if suffix in (".bin", ".exe", ".dll"):
            data = path.read_bytes()
            profiles[digest] = {"name": path.name, "size_bytes": len(data),
                                "kind": "PE" if data[:2] == b"MZ" else "raw firmware"}
            if data[:2] == b"MZ":
                profiles[digest]["pe"] = profile_pe(data)
            else:
                profiles[digest].update(profile_bin(data))
    save_json("inventory.json", {"package_count": len(rows), "unique_members": len(items), "members": list(items.values())})
    save_json("profiles.json", profiles)
    print(f"Verified {len(rows)} packages; inventoried {len(items)} distinct members; profiled {len(profiles)} binaries")
    print(Counter(p["kind"] for p in profiles.values()))


if __name__ == "__main__":
    main()
