# Archived ISP tools and update-path evidence

Checked 2026-10-29 against local archive metadata, extracted PDF text and the
existing static updater analysis. This comparison distinguishes the archived
update tools by firmware family. It does not establish a working recovery
procedure, hardware compatibility, or additional editable application source.
DC9 editable coverage remains **1.117%**. Scope: [offline analysis](scope.md).

| Evidence | Family / package | What the archive establishes |
|---|---|---|
| E84 | Spectrum One ES07DC9 V101 | The package includes `MStarISPTool_Setup_V0.0.0.5.exe`; its guide names MStar ISP Tool and a USB Type-B/Type-C connection with matching OSD hub selection. [Installer metadata](installers.json), [archived guide](extracted/93edba0b319fddec1e75d41ee4f42236a9cb4dc8811fc2e815d4d28077176800/instructions.pdf) |
| E85 | Spectrum One USB component packages | Separate releases for D03/DC9/E30 contain `HUBIspTool.exe` and separate hub/PD payloads. This is distinct from the scaler tool. [Installer metadata](installers.json) |
| E86 | Older Black 27 ES07E2D/E2F | Bundled Dough updater includes `OneKeyUSBISPTools/WinISPTool_V1.0.26.2/WinISPTool.exe`. The guide documents USB-C and OSD host override; static flow identifies USB VID/PID `0bda:5411`. [Guide](extracted/dad445c70abbc80be793313c929bf1e80f3a465bfdba4d21099ea72658820221/instructions.pdf), [recovered flow](reconstructed/black27-start-flow.md), [native metadata](updater.json) |
| E87 | Archived Black E91/EF5/EFB/EFE v1.0.19 packages | BIN plus shared instructions describing FAT32 USB storage, a root-directory BIN and the filename `update.bin`. HDMI appears in release notes, not as the documented update transport. [Inventory](inventory.json), [shared guide](extracted/ea2bfedaafeb8bf05d0cd963b407eb66a96abe0eb3f47c39f4c64adabbd78308/instructions.pdf) |

**Finding F87 (E84–E87):** the archived tools and transports differ by family.
An ISP-related filename is not enough to assign a tool to Black 27 v2, Black32,
or a particular owner's device. Native DLL exports such as
`CompleteIspFlowInISPBoard` and `CheckSnifferBoardCustomerId` are leads, but do
not prove that the archived updater invokes them or document board wiring.

**Next path P71 (F87):** obtain and inspect the actual model-specific HDMI/ISP
recovery procedure, identify its tool version and supported scaler/board, then
compare against archived package hashes and static call paths. The local guides
reviewed here do not establish an HDMI-to-HDMI converter or direct-board recovery
procedure. This absence does not rule out separate, unarchived vendor tools.

No vendor executable, DLL or hardware interface was run. Private correspondence
and sharing links are not part of this published evidence. The update procedures
above summarize archive contents; no recovery attempt or device test was made.

For reproduction, locate members through `inventory.json` and `installers.json`,
then use `pdftotext -layout <extracted-guide.pdf> -` to inspect the guide text.
The shared Black guide identity is SHA256
`ea2bfedaafeb8bf05d0cd963b407eb66a96abe0eb3f47c39f4c64adabbd78308`.
