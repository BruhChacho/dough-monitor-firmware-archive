# Contributing firmware and evidence

Open an issue with the exact model ID, component (scaler or USB), version, original source URL or archived page, and any release notes. A SHA256 hash and ZIP member listing help identify duplicates. If you have a file but no public source, explain how you received it and whether you have permission to share it. Avoid posting serial numbers, account information, private support correspondence, or other personal data.

For a package addition, keep the vendor ZIP intact. Add it under `downloads/` with a descriptive source directory, add its provenance to a source catalog, and run `python scripts/build_index.py`. The index script checks sizes, SHA256, ZIP CRCs, and vendor hashes where available. If a vendor checksum differs, report the discrepancy rather than silently changing it. Document model compatibility only when the source supports it; a matching filename by itself is insufficient.

Issue reports about failed updates should include the exact model ID, starting firmware version, attempted package name and hash, updater platform, and observed behavior. Do not upload dumps containing personal data without checking them first. No one should test an unknown package on a monitor they cannot afford to lose.
