"""Build fixed-size rectangle data edits into a checksum-valid DC9 experiment.

Coordinates are an inferred record interpretation. No hardware compatibility,
displayed result, or firmware safety is established by this builder.
"""
import argparse
import copy
import json
from pathlib import Path
import struct

from build_dc9_source_baseline import ROOT, LAYOUT, load_original, build, sha
from recompress_dc9 import SOURCE_SHA

DEFAULT_SOURCE = ROOT / 'analysis/reconstructed/dc9-rectangles.json'
EXAMPLE_SOURCE = ROOT / 'analysis/reconstructed/dc9-rectangles-asymmetric.example.json'


def encode_rectangles(source):
    if source.get('format') != 'dc9-rectangles-v1' or source.get('source_firmware_sha256') != SOURCE_SHA:
        raise ValueError('Unexpected rectangle source identity')
    modes = source.get('modes')
    if not isinstance(modes, list) or len(modes) != 6:
        raise ValueError('Expected six layout modes')
    out = bytearray()
    for mode in modes:
        if not isinstance(mode, list) or len(mode) != 4:
            raise ValueError('Expected four records per layout mode')
        for record in mode:
            if not isinstance(record, dict) or set(record) != {'x', 'y', 'width', 'height'}:
                raise ValueError('Expected x/y/width/height record')
            values = [record[k] for k in ('x','y','width','height')]
            if any(type(value) is not int or not 0 <= value <= 65535 for value in values):
                raise ValueError('Rectangle fields must be uint16 integers')
            out.extend(struct.pack('<4H', *values))
    return bytes(out)


def build_rectangles(source_path):
    source_bytes = Path(source_path).read_bytes()
    table_data = encode_rectangles(json.loads(source_bytes))
    original, _, _ = load_original()
    layout = copy.deepcopy(json.loads(LAYOUT.read_text()))
    table = next(t for t in layout['tables'] if t['name'] == 'channel_layout_rectangles')
    if int(table['address'], 16) != 0x3c5d10 or table['size'] != len(table_data):
        raise ValueError('Unexpected rectangle table location or size')
    table['values'] = [hex(x) for x in table_data]
    output, report = build(original, layout, experimental=True)
    if any(not 0x1c5d10 <= int(x,16) < 0x1c5dd0 for x in report['changed_expanded_offsets']):
        raise ValueError('Rectangle experiment changed unrelated application bytes')
    report['rectangle_source_sha256'] = sha(source_bytes)
    report['rectangle_data_sha256'] = sha(table_data)
    report['rectangle_format'] = 'six modes of four x/y/width/height uint16-le records; interpretation inferred'
    report['hardware_tested'] = False
    return output, report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rectangles', type=Path, default=DEFAULT_SOURCE)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if not args.output.resolve().is_relative_to((ROOT/'analysis/extracted').resolve()):
        parser.error('Output must be under analysis/extracted')
    if not args.output.name.endswith('.experimental.bin'):
        parser.error('Output must end with .experimental.bin')
    if args.output.exists() or args.output.with_suffix('.json').exists():
        parser.error('Output or evidence exists; choose fresh paths')
    output, report = build_rectangles(args.rectangles)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open('xb') as handle: handle.write(output)
    report['output_path'] = str(args.output)
    with args.output.with_suffix('.json').open('x') as handle: json.dump(report, handle, indent=2); handle.write('\n')
    print(f"Built rectangle experiment: {report['changed_program_bytes']} changed application bytes; {report['output_sha256']}")


if __name__ == '__main__':
    main()
