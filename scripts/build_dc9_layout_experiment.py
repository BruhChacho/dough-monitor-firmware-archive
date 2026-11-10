"""Build fixed-size rectangle data edits into a checksum-valid DC9 experiment.

Coordinates are an inferred record interpretation. No hardware compatibility,
displayed result, or firmware safety is established by this builder.
"""
import struct

from recompress_dc9 import SOURCE_SHA


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
