"""Unpack four known Inno installers without running vendor applications.

Uses the official innoextract 1.9 Windows binary installed in .tools.
Derived files remain in the ignored analysis/extracted tree.
"""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import argparse
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / ".tools/python"))
from analyze_firmware import profile_pe, profile_bin

ARCHIVE_SHA = "6989342c9b026a00a72a38f23b62a8e6a22cc5de69805cf47d68ac2fec993065"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--download", action="store_true", help="Fetch the pinned official innoextract archive if absent")
    args = parser.parse_args()
    archive = ROOT / ".tools/innoextract/innoextract-1.9-windows.zip"
    if not archive.exists():
        if not args.download:
            parser.error("Missing innoextract archive; use --download to fetch it")
        archive.parent.mkdir(parents=True, exist_ok=True)
        with urllib.request.urlopen("https://constexpr.org/innoextract/files/innoextract-1.9-windows.zip", timeout=60) as response:
            content = response.read(10 * 1024 * 1024 + 1)
        if len(content) > 10 * 1024 * 1024 or hashlib.sha256(content).hexdigest() != ARCHIVE_SHA:
            raise ValueError("Unexpected innoextract download")
        archive.write_bytes(content)
    if hashlib.sha256(archive.read_bytes()).hexdigest() != ARCHIVE_SHA:
        raise ValueError("Unexpected innoextract distribution")
    tool = ROOT / ".tools/innoextract/bin/innoextract.exe"
    with zipfile.ZipFile(archive) as package:
        executable = package.read("innoextract.exe")
    if not tool.exists():
        tool.parent.mkdir(parents=True, exist_ok=True)
        tool.write_bytes(executable)
    if tool.read_bytes() != executable:
        raise ValueError("innoextract executable differs from the verified distribution")
    members = json.loads((ROOT / "analysis/inventory.json").read_text())["members"]
    results = []
    for member in members:
        if not member["local_path"].endswith(".exe") or "Dough Firmware" in member["local_path"]:
            continue
        source = ROOT / member["local_path"]
        if hashlib.sha256(source.read_bytes()).hexdigest() != member["sha256"]:
            raise ValueError("Installer hash changed")
        dest = source.parent / "inno"
        subprocess.run([str(tool), "--extract", "--color=0", "--progress=0",
                        "--output-dir", str(dest), str(source)], check=True)
        extracted = []
        for path in sorted(dest.rglob("*")):
            if not path.is_file():
                continue
            data = path.read_bytes()
            item = {"name": path.relative_to(dest).as_posix(),
                    "local_path": path.relative_to(ROOT).as_posix(),
                    "size_bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()}
            if path.suffix.lower() == ".bin":
                item["profile"] = profile_bin(data)
            elif path.suffix.lower() in [".exe", ".dll"] and item["name"].startswith("app/"):
                item["pe"] = profile_pe(data)
            extracted.append(item)
        results.append({"installer_sha256": member["sha256"], "source_path": member["local_path"],
                        "sources": member["sources"], "members": extracted})
    (ROOT / "analysis/installers.json").write_text(json.dumps(results, indent=2) + "\n")
    print("Inventoried", len(results), "Inno installers")


if __name__ == "__main__":
    main()
