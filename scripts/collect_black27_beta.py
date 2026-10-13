"""Preserve the publicly linked Spectrum Black ES07E2D Beta 006 package."""

from datetime import datetime, timezone
import json

from collect_official import ROOT, download


SOURCE_PAGE = "https://www.reddit.com/r/doughcommunity/comments/15etlh9/firmware/"
SOURCE_URL = "https://evet1.sharepoint.com/:u:/s/DoughTeam/EdeynoUPKh5DsPnNeYlhxFwBlCvFi2VqFubNYyJCR5bpTA?download=1"
LOCAL_PATH = "downloads/sharepoint/spectrum_black_27_beta006.zip"


def main():
    entry = {
        "models": ["ES07E2D"],
        "component": "scaler",
        "version": "Beta 006",
        "source_page": SOURCE_PAGE,
        "source_url": SOURCE_URL,
        "local_path": LOCAL_PATH,
    }
    try:
        entry.update(download(SOURCE_URL, LOCAL_PATH))
        entry["status"] = "downloaded"
    except Exception as exc:
        entry["status"] = "error"
        entry["error"] = str(exc)
    (ROOT / "black27-beta-catalog.json").write_text(json.dumps({
        "discovered_at_utc": datetime.now(timezone.utc).isoformat(),
        "entries": [entry],
    }, indent=2) + "\n", encoding="utf-8")
    print(entry["status"].upper(), LOCAL_PATH)


if __name__ == "__main__":
    main()
