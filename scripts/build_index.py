"""Verify preserved ZIPs and build a searchable archive index and CSV manifest."""

import csv
import hashlib
import json
from pathlib import Path
import zipfile


ROOT = Path(__file__).resolve().parents[1]
CATALOGS = {
    "catalog.json": "Dough product page",
    "legacy-catalog.json": "Dough 2023 archive",
    "reddit-catalog.json": "Dough community post",
    "sharepoint-catalog.json": "Dough SharePoint",
    "tld-catalog.json": "TousLesDrivers index",
    "black27-beta-catalog.json": "Dough beta post",
}
FIELDS = ["models", "component", "version", "local_path", "size_bytes", "sha256",
          "vendor_sha256", "vendor_hash_match", "source_page", "source_url", "source_group"]


def digest(path):
    sha = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            sha.update(block)
    return sha.hexdigest()


def main():
    packages = {}
    for filename, group in CATALOGS.items():
        catalog = json.loads((ROOT / filename).read_text(encoding="utf-8"))
        for entry in catalog["entries"]:
            relative = entry.get("local_path")
            if not relative:
                continue  # The live page lists these; sharepoint-catalog holds downloaded copies.
            if entry["status"] != "downloaded":
                raise ValueError(f"Unverified catalog entry: {filename}: {relative}: {entry['status']}")
            path = ROOT / relative
            if not path.is_file() or path.stat().st_size != entry["size_bytes"]:
                raise ValueError(f"Missing or wrong-size package: {relative}")
            actual = digest(path)
            if actual != entry["sha256"]:
                raise ValueError(f"SHA256 mismatch: {relative}")
            if entry.get("vendor_sha256") and actual != entry["vendor_sha256"]:
                raise ValueError(f"Vendor SHA256 mismatch: {relative}")
            with zipfile.ZipFile(path) as archive:
                bad_member = archive.testzip()
                if bad_member:
                    raise ValueError(f"ZIP CRC failure: {relative}: {bad_member}")
            models = entry.get("models") or [entry["model"]]
            if relative in packages:
                old = packages[relative]
                if old["sha256"] != actual or old["component"] != entry["component"]:
                    raise ValueError(f"Conflicting metadata: {relative}")
                old["models"].update(models)
            else:
                packages[relative] = {
                    "models": set(models),
                    "component": entry["component"],
                    "version": entry["version"],
                    "local_path": relative,
                    "size_bytes": entry["size_bytes"],
                    "sha256": actual,
                    "vendor_sha256": entry.get("vendor_sha256") or "",
                    "vendor_hash_match": "yes" if entry.get("vendor_sha256") else "unpublished",
                    "source_page": entry["source_page"],
                    "source_url": entry["source_url"],
                    "source_group": group,
                }
    rows = sorted(packages.values(), key=lambda r: (sorted(r["models"])[0], r["component"], r["version"], r["local_path"]))
    with (ROOT / "MANIFEST.csv").open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(stream, fieldnames=FIELDS)
        writer.writeheader()
        for row in rows:
            writer.writerow({**row, "models": "|".join(sorted(row["models"]))})

    unique_hashes = len({row["sha256"] for row in rows})
    lines = [
        "# Firmware index", "",
        f"{len(rows)} downloaded ZIP files, {unique_hashes} distinct SHA256 hashes. "
        "Multiple files can contain identical bytes; the source copies are retained for provenance.", "",
        "Every file in this index passed SHA256 verification against the manifest and a full ZIP CRC check. "
        "A vendor checksum was compared when published. These checks establish file integrity, "
        "not that a firmware version is safe or suitable for a particular monitor.", "",
        "See [README](README.md) for scope and use notes. Full hashes and original URLs are in [MANIFEST.csv](MANIFEST.csv).", "",
    ]
    all_models = sorted({model for row in rows for model in row["models"]})
    for model in all_models:
        lines += [f"## {model}", "", "| Component | Version | Package | Source |", "| --- | --- | --- | --- |"]
        for row in rows:
            if model not in row["models"]:
                continue
            label = Path(row["local_path"]).name
            lines.append(f"| {row['component']} | {row['version']} | [{label}]({row['local_path']}) | "
                         f"[{row['source_group']}]({row['source_page']}) |")
        lines.append("")
    (ROOT / "INDEX.md").write_text("\n".join(lines), encoding="utf-8")
    print(f"Verified {len(rows)} ZIPs ({unique_hashes} distinct hashes) for {len(all_models)} model IDs")


if __name__ == "__main__":
    main()
