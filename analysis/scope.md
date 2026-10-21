# Firmware analysis scope

User authorization: "Now please begin the reverse engineering" (2026-10-13), following collection of the public Dough monitor firmware archive.

Targets are the 45 packages named in `MANIFEST.csv` and their embedded files. This phase performs offline extraction, format and architecture identification, static updater analysis, and comparisons between versions. Derived files stay under `analysis/`; original ZIPs remain intact. Public technical references may be consulted to interpret findings. No connected monitor is selected for testing or flashing.

The first milestone is a reproducible inventory and an evidence-based map of the firmware families, with a deeper look at at least one update format. A firmware modification or hardware compatibility claim requires later validation.

Owner priorities: glossy 27-inch monitor with USB-C hub and Gorilla Glass
32-inch OLED. The stated goal is community source reconstruction rather than
a specific bug fix. ES07DC9 and ES07EFE are working family assumptions pending
physical-label confirmation. The user requested continuation on 2026-10-19.

On 2026-10-19–20 the user reiterated that the end goal is fully working
firmware and requested continued implementation. Current work includes offline
container reconstruction and a DC9 recompression experiment. Hardware validation
and a complete source build remain required; there is no selected device for
flashing in this phase.

On 2026-10-20 the owner reaffirmed the retail descriptions (32-inch Gorilla
Glass 4K OLED and 27-inch glossy Spectrum with USB-C hub). Exact label IDs,
hardware revisions and installed firmware versions remain unconfirmed.
