"""Extract selected PyInstaller members and decompile the updater's Python entry.

Parsing only: never imports or executes the recovered bytecode or executables.
The CArchive cookie/TOC layout is defined by PyInstaller's archive format.
"""

import hashlib
import io
import json
from pathlib import Path
import struct
import sys
import zlib

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / ".tools/python"))
from uncompyle6.main import decompile_file
from xdis.disasm import disassemble_file
from analyze_firmware import profile_pe, safe_name, sha256
import pefile


def carchive_entries(data):
    magic = b"MEI\x0c\x0b\x0a\x0b\x0e"
    cookie_offset = data.rfind(magic)
    if cookie_offset < 0 or cookie_offset + 88 > len(data):
        raise ValueError("Missing or truncated PyInstaller cookie")
    _, package_size, toc_offset, toc_size, version, library = struct.unpack_from("!8sIIII64s", data, cookie_offset)
    base = cookie_offset + 88 - package_size
    cursor = base + toc_offset
    end = cursor + toc_size
    if not 0 <= base <= cursor <= end <= cookie_offset:
        raise ValueError("Invalid CArchive bounds")
    entries = []
    while cursor < end:
        if end - cursor < 18:
            raise ValueError("Truncated CArchive entry header")
        size, offset, compressed, uncompressed, flag, kind = struct.unpack_from("!iIIIBc", data, cursor)
        if size < 18 or cursor + size > end or base + offset + compressed > cookie_offset:
            raise ValueError("Invalid CArchive entry")
        name = data[cursor + 18:cursor + size].rstrip(b"\0").decode("utf-8")
        safe_name(name)
        entries.append({"name": name, "offset": base + offset, "compressed_size": compressed,
                        "uncompressed_size": uncompressed, "compressed": bool(flag), "kind": kind.decode()})
        cursor += size
    return {"cookie_offset": cookie_offset, "archive_offset": base,
            "python_version": version, "python_library": library.rstrip(b"\0").decode(), "entries": entries}


def unpack(data, entry):
    part = data[entry["offset"]:entry["offset"] + entry["compressed_size"]]
    if entry["uncompressed_size"] > 100 * 1024 * 1024:
        raise ValueError("Oversized member")
    if entry["compressed"]:
        decoder = zlib.decompressobj()
        part = decoder.decompress(part, entry["uncompressed_size"] + 1)
        if not decoder.eof:
            raise ValueError("Incomplete or oversized compressed member")
    if len(part) != entry["uncompressed_size"]:
        raise ValueError("Wrong expanded length")
    return part


def main():
    members = json.loads((ROOT / "analysis/inventory.json").read_text())["members"]
    entry = next(m for m in members if Path(m["local_path"]).name == "Dough Firmware Update tool v0.1.5.exe")
    data = (ROOT / entry["local_path"]).read_bytes()
    if sha256(data) != entry["sha256"]:
        raise ValueError("Updater hash changed")
    archive = carchive_entries(data)
    destination = ROOT / "analysis/extracted" / entry["sha256"] / "carchive"
    destination.mkdir(parents=True, exist_ok=True)
    pyz = next(e for e in archive["entries"] if e["kind"] == "z")
    pyz_data = unpack(data, pyz)
    magic = pyz_data[4:8]
    selected = []
    for member in archive["entries"]:
        if not (member["name"] == "main" or member["name"].startswith("OneKeyUSBISPTools")):
            continue
        raw = unpack(data, member)
        path = destination / member["name"].replace("\\", "/")
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(raw)
        member["sha256"] = sha256(raw)
        member["local_path"] = path.relative_to(ROOT).as_posix()
        if raw[:2] == b"MZ":
            member["pe"] = profile_pe(raw)
            # Match only the x86 "mov eax, imm32; ret" constant-return stub.
            # Parsing the export does not load or call the DLL.
            pe = pefile.PE(data=raw)
            for symbol in member["pe"]["exports"]:
                if symbol["name"] == "GetCommID":
                    offset = pe.get_offset_from_rva(int(symbol["rva"], 16))
                    stub = raw[offset:offset + 6]
                    if len(stub) == 6 and stub[0] == 0xb8 and stub[-1] == 0xc3:
                        member["comm_id_stub"] = {
                            "rva": symbol["rva"], "file_offset": hex(offset),
                            "bytes": stub.hex(" "), "returns": struct.unpack_from("<I", stub, 1)[0]}
        selected.append(member)
        if member["name"] == "main":
            if archive["python_version"] != 307:
                raise ValueError("Review bytecode header for a changed Python version")
            pyc = path.with_suffix(".pyc")
            pyc.write_bytes(magic + b"\0" * 12 + raw)
            source = io.StringIO()
            decompile_file(str(pyc), outstream=source)
            # Keep the recovered vendor program as inert text, not runnable source.
            (destination / "main.recovered.py.txt").write_text(source.getvalue(), encoding="utf-8")
            with (destination / "main.bytecode.txt").open("w", encoding="utf-8") as out:
                disassemble_file(str(pyc), outstream=out)
    (ROOT / "analysis/updater.json").write_text(json.dumps({
        "source_sha256": entry["sha256"], "cookie_offset": archive["cookie_offset"],
        "archive_offset": archive["archive_offset"], "python_version": archive["python_version"],
        "python_library": archive["python_library"], "archive_entry_count": len(archive["entries"]),
        "selected_entries": selected,
    }, indent=2) + "\n", encoding="utf-8")
    print(f"Parsed {len(archive['entries'])} CArchive entries; extracted {len(selected)} project/tool members")
    print("Recovered Python source:", destination / "main.recovered.py.txt")


if __name__ == "__main__":
    main()
