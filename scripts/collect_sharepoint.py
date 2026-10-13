"""Download Dough's public Spectrum Black 27 SharePoint releases."""

from datetime import datetime, timezone
import json

from collect_official import ROOT, download


FILENAMES = {
    "v.005": "spectrum_black_27_scaler_fw_005.zip",
    "v.008": "spectrum_black_27_scaler_fw_008.zip",
}


def main():
    official = json.loads((ROOT / "catalog.json").read_text(encoding="utf-8"))
    entries = []
    seen = set()
    for source in official["entries"]:
        if source["status"] != "external_link" or source["source_url"] in seen:
            continue
        seen.add(source["source_url"])
        version = source["version"]
        entry = {
            "models": sorted(x["model"] for x in official["entries"] if x["source_url"] == source["source_url"]),
            "component": "scaler",
            "version": version,
            "source_page": source["source_page"],
            "source_url": source["source_url"],
            "download_url": source["source_url"].split("?")[0] + "?download=1",
            "vendor_sha256": source["vendor_sha256"],
            "local_path": "downloads/sharepoint/" + FILENAMES[version],
        }
        try:
            entry.update(download(entry["download_url"], entry["local_path"]))
            entry["vendor_hash_match"] = entry["sha256"] == entry["vendor_sha256"]
            entry["status"] = "downloaded" if entry["vendor_hash_match"] else "hash_mismatch"
            print(entry["status"].upper(), entry["local_path"], entry["size_bytes"], flush=True)
        except Exception as exc:
            entry["status"] = "error"
            entry["error"] = str(exc)
            print("ERROR", entry["local_path"], str(exc), flush=True)
        entries.append(entry)
    (ROOT / "sharepoint-catalog.json").write_text(json.dumps({
        "discovered_at_utc": datetime.now(timezone.utc).isoformat(),
        "entries": entries,
    }, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
