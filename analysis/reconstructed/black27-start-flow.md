# Black 27 updater: reconstructed start flow

This is a manually checked description of `MainWindow.on_start_pressed` from
the Python 3.7 bytecode embedded in `Dough Firmware Update tool v0.1.5.exe`.
Its SHA256 is `568096e44bb205e96c0816af0b8a2b4c4c57590204accecad7da03957b83774d`.
This updater accompanies ES07E2D/E2F packages; applicability to Black 32 is
not established.

Run `python scripts/inspect_updater.py` to generate the decompiled text and
the independent `main.bytecode.txt` listing under the ignored extraction directory.
The complete decompiled entry point is about 350 lines. It is not a verified
replacement application: uncompyle6 misstructured at least one control flow.

## Checked control flow

Offsets here are **Python bytecode offsets inside `on_start_pressed`**, not
EXE offsets. The following is descriptive pseudocode, not an executable tool.

```text
0..22       Refresh device status; sleep 0.1 seconds.
24..44      If no matching device was detected, report error and return.
46..80      If selected path is empty, report error and return.
82..98      If configured for emulation, return.
100..208    Walk the bundled Windows ISP-tool directory and remove .bin files.
210..238    Report starting/copying status.
240..302    Read selected file size; max_bank = 32 + int(size / 65536).
304..338    On Windows, copy selected file to the bundled Windows-tool directory.
340..362    Otherwise, copy selected file to the bundled Mac-tool directory.
364 onward Signal the ISP worker thread.
```

Bytecode jump 64 -> 82 proves that valid file selection reaches the emulation
check. The decompiler incorrectly placed subsequent code inside an already
returned branch. Jump 312 -> 340 belongs to the operating-system selection;
it does not belong to the file-selection test.

`on_refresh_pressed` searches USB VID `0x0bda`, PID `0x5411`. This identifies
the updater's chosen USB match, not the scaler silicon ID. The worker launches
the bundled native ISP executable; the Python UI does not implement the flash
transport itself.

## Recovered native-tool parameters

The same parameters appear in `ISPThread.ispProcess` and `OneKeyUpdate.bat`:

| Parameter | Value observed | Interpretation |
|---|---|---|
| ISP mode | `--ispuser` | User-image update mode, per option name |
| File selection | `--searchfw auto` | Bundled tool locates a staged file |
| First bank | `--bank 32` | Consistent with a start at `0x200000` for 64 KiB banks |
| Flag address | `--flagaddr 0x34F8FE` | Supplied to native tool; write timing not traced |
| Flag data | `--flagdata 0xaa,0x55` | Supplied two-byte flag |
| Communication selector | `--comm 6` | Matches `GetCommID()` in `Comm_UsbHubI2C.dll` |

The released images are 21 banks (`0x150000` bytes). Mapping those bytes at
`0x200000` would end at `0x350000`, with the flag at relative `0x14f8fe`.
This mapping is an inference from the command and sizes, not a hardware dump.

Static inspection on 2026-10-19 resolved the matching communication module.
`Comm_UsbHubI2C.dll`, SHA256
`26d132888c13f8b733625386d292220d12423c3ec58fe8894d89e2339a622312`,
exports `GetCommID` at RVA `0x3cf0`. Its bytes are `b8 06 00 00 00 c3`,
or `mov eax,6; ret`. The other included modules return 1 (Aux), 3
(RealtekUSB), 12 (UsbHubHidI2C), and 14 (NewRealtekUSB). This is strong
static evidence that selector 6 chooses USB hub I2C; dispatcher execution
and USB packet formats have not been traced. The module exports `I2CRead`
and `I2CWrite`, among other operations. Export names alone do not establish
which operations have a working implementation.

The executable also embeds a distinct `QHD240_OLED_ES07E2D.bin`, SHA256
`3a2ae89dafdeb1762136240cd3787e1dc53ccdd77ba29ff886f36afa785f1ec3`.
It does not match the standalone v005, Beta006, or v008 images. Its release
identity is unknown. The Python start flow removes this staged image before
copying the user's selection.

No updater, recovered Python program, or native DLL was executed.
