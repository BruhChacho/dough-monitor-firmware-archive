# Build and edit DC9 firmware

This partial source build supports Spectrum One ES07DC9 v101 rev1148. It contains
428 assembly components totaling 111,840 code bytes, plus 14 tables totaling
1,203 bytes. The assembly covers 4.609% of the 2,426,560-byte application;
the rest remains a pinned vendor binary. Builds are hardware-untested.

## Prepare a workspace

Use Python 3.9 or newer and run commands from the repository root. Fetch the
archive ZIPs with Git LFS first. Preparation reads firmware directly from the
included ZIPs and verifies its SHA256; no installer is executed.

Choose a new workspace directory:

```bash
python3 scripts/firmware_workspace.py prepare build/workspace
python3 scripts/firmware_workspace.py export-usb build/workspace
python3 scripts/firmware_workspace.py verify build/workspace
python3 scripts/firmware_workspace.py build build/workspace --output build/stock.baseline.bin
```

The baseline reproduces the complete 2,069,060-byte original DC9 image with SHA256
`0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9`.
USB export is optional. Once prepared, builds read the workspace's own components
and source files; they do not reopen the archive ZIPs.

| Workspace path | Contents |
| --- | --- |
| `dc9/original.bin` | Complete stock DC9 scaler image |
| `dc9/components/` | Lossless encoded container components and manifest |
| `dc9/raw/` | Decompressed application, AP prefix and resource references |
| `dc9/source/` | Editable assembly, layout and structured rectangle data |
| `efe/original.bin` | Complete ES07EFE v1.0.19 scaler image; reference only |
| `usb/` | Optional VL822 and VL103R raw reference images |
| `manifest.json` | Workspace file identities and editability declarations |

## Build a source change

Edit assembly under `build/workspace/dc9/source/` or table values in its
`layout.json`. Each routine must retain its original address and encoded size.
Baseline mode requires byte-exact original assembly and tables. To incorporate
edits, explicitly select experimental mode:

```bash
python3 scripts/firmware_workspace.py build build/workspace --experimental --output build/my-change.experimental.bin
```

The included alternative helper can be selected without editing the active file:

```bash
python3 scripts/firmware_workspace.py build build/workspace --experimental --replace-source command_group_secondary=dc9/source/alternatives/secondary-helper-rewrite.aeon.s --output build/helper.experimental.bin
```

Select structured rectangle data explicitly to apply the example:

```bash
python3 scripts/firmware_workspace.py build build/workspace --experimental --rectangles dc9/source/dc9-rectangles-asymmetric.example.json --output build/rectangles.experimental.bin
```

Rectangle fields are inferred x/y/width/height values; their displayed effect
has not been verified. The example changes six application bytes, changing
mode 2 widths from 1920/1920 to 1600/2240.

Experimental builds recompress the application, regenerate its checksums and
reject output that exceeds the original allocation. Each build writes a JSON
sidecar with file hashes, instruction listings, changed byte offsets and
checksum results. Existing outputs are never overwritten. Immutable raw files
and components are checked for changes.

The versioned assembly and table source is in [`source/`](source/). Workspace
edits remain local; copy intended changes back to these versioned files to keep
them. Raw EFE and USB references have no corresponding source build. No command
here installs firmware, establishes monitor compatibility or validates physical
CPU behavior. Firmware-derived code and data are excluded from the repository's
MIT grant.
