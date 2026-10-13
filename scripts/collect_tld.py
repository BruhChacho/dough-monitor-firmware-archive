"""Recover older official packages indexed by TousLesDrivers."""

from datetime import datetime, timezone
import json
import re
from urllib.request import Request, urlopen

from collect_official import ROOT, download


ITEMS = [
    ("69501", "ES07D03", "scaler", "102"),
    ("71599", "ES07D03", "usb", "06A4/0A.89.18.02"),
]


def main():
    entries = []
    for code, model, component, version in ITEMS:
        page = f"https://www.touslesdrivers.com/index.php?v_code={code}&v_langue=en&v_page=23"
        popup = f"https://www.touslesdrivers.com/php/constructeurs/telechargement.php?v_code={code}&v_langue=en"
        with urlopen(popup, timeout=20) as response:
            body = response.read().decode("utf-8", "replace")
        mirror = re.search(r'https://fichiers\.touslesdrivers\.com/\d+/([^"<>]+\.zip)', body)
        if not mirror:
            raise RuntimeError("Mirror link missing from " + popup)
        filename = mirror.group(1)
        redirector = f"https://www.touslesdrivers.com/php/constructeurs/redirection.php?v_code={code}"
        with urlopen(Request(redirector, method="HEAD"), timeout=20) as response:
            direct = response.url
        entry = {
            "model": model,
            "component": component,
            "version": version,
            "source_page": page,
            "source_url": direct,
            "mirror_url": mirror.group(0),
            "local_path": "downloads/tld/" + filename,
        }
        try:
            entry.update(download(direct, entry["local_path"]))
            entry["status"] = "downloaded"
            print("OK", entry["local_path"], entry["size_bytes"])
        except Exception as exc:
            entry["status"] = "error"
            entry["error"] = str(exc)
            print("ERROR", entry["local_path"], str(exc))
        entries.append(entry)
    (ROOT / "tld-catalog.json").write_text(json.dumps({
        "discovered_at_utc": datetime.now(timezone.utc).isoformat(),
        "entries": entries,
    }, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
