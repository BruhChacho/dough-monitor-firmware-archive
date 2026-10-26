"""Prepare raw firmware inputs and editable DC9 source for community development.

Builds use the workspace's lossless binary components and source files, without
reading the archive again. Raw inputs are immutable; source edits require an
explicit experimental build. No flashing or device access is implemented.
"""
import argparse
import copy
import json
from pathlib import Path, PurePosixPath
import zlib

from build_dc9_source_baseline import ROOT, LAYOUT, load_original, build as build_source, sha
from recompress_dc9 import SOURCE_SHA
from roundtrip_mstar import split, assemble as assemble_image
from build_dc9_layout_experiment import encode_rectangles

EFE_SHA = 'e3eeedada1464cfb65b927ed2877ebbeffff0d59ba2d793f0c18ddf7cb8ebd40'
USB_INSTALLER_SHA = '123035bc7afe8c8a9755b0e53448b926380c1fad3955c3d52e422a62bdc3bd55'
USB_IMAGES = {
    'vl822-hub-06a4.bin': 'ec6699214c621671449ec941ab4ccd8c413cb79b6e369d99a654c12beb3a3356',
    'vl103r-0a.89.19.02.bin': '62879652a96b8098cb240c4a4290828304afc6709b3948066ccb0d1de49e0fe1',
}


def inside(root, name):
    if not isinstance(name, str) or '\\' in name or ':' in name:
        raise ValueError('Invalid workspace path')
    parts = PurePosixPath(name)
    if parts.is_absolute() or '..' in parts.parts or not parts.parts:
        raise ValueError('Invalid workspace path')
    path = root / name
    if not path.resolve().is_relative_to(root.resolve()):
        raise ValueError('Workspace path escapes root')
    return path


def prepare(destination):
    raw, expanded, info = load_original()
    inventory = json.loads((ROOT / 'analysis/inventory.json').read_text())['members']
    efe = next(x for x in inventory if x['sha256'] == EFE_SHA)
    efe_raw = (ROOT / efe['local_path']).read_bytes()
    if sha(efe_raw) != EFE_SHA:
        raise ValueError('EFE source identity mismatch')
    components, parts = split(raw)
    layout = copy.deepcopy(json.loads(LAYOUT.read_text()))
    files = {}

    def add(name, data, role):
        if name in files:
            raise ValueError('Duplicate exported path')
        files[name] = (data, role)

    add('dc9/original.bin', raw, 'pinned original complete DC9 container')
    add('efe/original.bin', efe_raw, 'pinned original complete EFE image; repacker unresolved')
    add('dc9/raw/expanded-ap.bin', expanded, 'expanded AP including 0x3800-byte prefix')
    add('dc9/raw/application.bin', expanded[0x3800:], 'expanded application at candidate address 0x203800')
    add('dc9/raw/ap-prefix.bin', expanded[:0x3800], 'expanded AP prefix at candidate address 0x200000')
    add('dc9/components/manifest.json', (json.dumps(components, indent=2) + '\n').encode(), 'lossless component layout')
    for name, data in parts.items():
        add('dc9/components/' + name, data, 'encoded container component; immutable build input')
    for resource in components['resources']:
        begin, end = int(resource['start'], 16), int(resource['end_exclusive'], 16)
        if resource['flags'] == 4:
            data = zlib.decompress(raw[begin:begin + resource['deflate_size']], -15)
            if sha(data) != resource['expanded_sha256']:
                raise ValueError('Decoded resource identity mismatch')
            suffix, role = 'expanded.bin', 'decoded resource payload; original length known'
        else:
            data = raw[begin:end - 2]
            suffix, role = 'payload-with-padding.bin', 'raw resource payload including padding; unpadded length unknown'
        add(f"dc9/raw/resources/{resource['id']}.{suffix}", data, role)
    for routine in layout['routines']:
        original = ROOT / routine['source']
        name = 'dc9/source/' + original.name
        add(name, original.read_bytes(), 'editable reconstructed AEON assembly')
        routine['source'] = name
    add('dc9/source/alternatives/secondary-helper-rewrite.aeon.s',
        (ROOT / 'analysis/reconstructed/spectrum_one_table_helper_rewrite.aeon.s').read_bytes(),
        'editable alternative helper; unchanged behavior intended')
    for name in ('dc9-rectangles.json', 'dc9-rectangles-asymmetric.example.json'):
        add('dc9/source/' + name, (ROOT/'analysis/reconstructed'/name).read_bytes(),
            'editable structured rectangle data; use explicit --rectangles in experimental mode')
    add('dc9/source/layout.json', (json.dumps(layout, indent=2) + '\n').encode(),
        'editable source layout and reconstructed table values')
    readme = """# Community firmware development workspace

`dc9/original.bin` and `efe/original.bin` are complete archived firmware images.
`dc9/components/` contains every encoded DC9 container byte in contiguous parts,
including boot/header, application, resources, padding and checksums.
`dc9/raw/` contains the decompressed application and resource payloads for analysis.
Those raw exports are reference inputs; modify assembly under `dc9/source/` to
change the build. Tables are editable in `dc9/source/layout.json`.

Use the repository's `.venv/bin/python scripts/firmware_workspace.py` commands:
`verify WORKSPACE`, or `build WORKSPACE --output OUTPUT.baseline.bin`.
After editing source, use `build WORKSPACE --experimental --output OUTPUT.experimental.bin`.
For the included alternative, also pass
`--replace-source command_group_secondary=dc9/source/alternatives/secondary-helper-rewrite.aeon.s`.
Use fresh output paths. Source edits must preserve each routine's size/address.
Use `--rectangles dc9/source/dc9-rectangles-asymmetric.example.json` with an
experimental build to apply the included rectangle-data example. Structured
rectangle JSON is incorporated only when explicitly selected with this option.

The source build still retains a pinned vendor remainder. Original full source,
SDK and a general target compiler are not supplied. EFE is raw input only;
its integrity format and repacking remain unresolved. Nothing here flashes a
monitor or establishes that an experimental image works on hardware.
Firmware-derived assembly and binaries are excluded from the repository MIT grant.
"""
    add('README.md', readme.encode(), 'workspace usage')
    manifest = {
        'format': 'community-firmware-workspace-v1',
        'sources': {'dc9': {'sha256': SOURCE_SHA, 'version': 'v101 rev1148'},
                    'efe': {'sha256': EFE_SHA, 'version': 'v1.0.19', 'archive_sources': efe['sources']}},
        'dc9_source_layout': 'dc9/source/layout.json',
        'dc9_expanded_program_size': info['program_size'],
        'source_component_count': len(layout['routines']),
        'artifacts': [{'path': name, 'size': len(data), 'sha256': sha(data), 'role': role,
                       'editable_source': name.startswith('dc9/source/')}
                      for name, (data, role) in files.items()],
    }
    destination.mkdir(parents=True, exist_ok=False)
    for name, (data, _) in files.items():
        path = inside(destination, name)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
    (destination / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    verify(destination)
    return manifest


def verify(workspace):
    manifest = json.loads((workspace / 'manifest.json').read_text())
    if (manifest.get('format') != 'community-firmware-workspace-v1'
            or manifest['sources']['dc9']['sha256'] != SOURCE_SHA
            or manifest['sources']['efe']['sha256'] != EFE_SHA
            or manifest['dc9_source_layout'] != 'dc9/source/layout.json'):
        raise ValueError('Unexpected workspace identity')
    names = set()
    changed_sources = []
    for record in manifest['artifacts']:
        name = record['path']
        if name in names:
            raise ValueError('Duplicate workspace artifact')
        names.add(name)
        data = inside(workspace, name).read_bytes()
        changed = len(data) != record['size'] or sha(data) != record['sha256']
        editable = name.startswith('dc9/source/')
        if editable != record['editable_source']:
            raise ValueError('Invalid editability declaration')
        if changed and not editable:
            raise ValueError(f'Changed immutable workspace artifact: {name}')
        if changed:
            changed_sources.append(name)
    raw = inside(workspace, 'dc9/original.bin').read_bytes()
    if sha(raw) != SOURCE_SHA or sha(inside(workspace, 'efe/original.bin').read_bytes()) != EFE_SHA:
        raise ValueError('Pinned raw firmware identity mismatch')
    components = json.loads(inside(workspace, 'dc9/components/manifest.json').read_text())
    parts = {record['name']: inside(workspace / 'dc9/components', record['name']).read_bytes()
             for record in components['parts']}
    if assemble_image(components, parts) != raw:
        raise ValueError('Workspace components do not reproduce original firmware')
    usb = verify_usb(workspace) if (workspace / 'usb').exists() else None
    return {'verified_artifacts': len(names), 'changed_sources': changed_sources, 'usb': usb,
            'dc9_byte_exact_component_roundtrip': True, 'dc9_sha256': SOURCE_SHA, 'efe_sha256': EFE_SHA}


def verify_usb(workspace):
    manifest = json.loads(inside(workspace, 'usb/manifest.json').read_text())
    if (manifest.get('format') != 'community-usb-raw-v1'
            or manifest['installer_sha256'] != USB_INSTALLER_SHA
            or {r['path']: r['sha256'] for r in manifest['images']} != USB_IMAGES
            or len(manifest['images']) != len(USB_IMAGES)):
        raise ValueError('Unexpected USB export identity')
    for record in manifest['images']:
        data = inside(workspace, 'usb/' + record['path']).read_bytes()
        if len(data) != record['size_bytes'] or sha(data) != record['sha256']:
            raise ValueError('USB raw image identity mismatch')
    return {'verified_raw_images': len(USB_IMAGES), 'installer_sha256': USB_INSTALLER_SHA}


def export_usb(workspace):
    """Copy already extracted, pinned USB images; never execute the installer."""
    verify(workspace)
    installers = json.loads((ROOT / 'analysis/installers.json').read_text())
    installer = next(x for x in installers if x['installer_sha256'] == USB_INSTALLER_SHA)
    if sha((ROOT / installer['source_path']).read_bytes()) != USB_INSTALLER_SHA:
        raise ValueError('USB installer identity mismatch')
    files, records = {}, []
    for name, expected in USB_IMAGES.items():
        record = next(x for x in installer['members'] if x['sha256'] == expected)
        data = (ROOT / record['local_path']).read_bytes()
        if sha(data) != expected or len(data) != record['size_bytes']:
            raise ValueError('USB extracted input identity mismatch')
        files[name] = data
        records.append({'path': name, 'size_bytes': len(data), 'sha256': expected,
                        'installer_member': record['name']})
    manifest = {'format': 'community-usb-raw-v1', 'installer_sha256': USB_INSTALLER_SHA,
                'archive_sources': installer['sources'], 'images': records,
                'status': 'raw reference inputs only; source build and device compatibility unverified'}
    destination = workspace / 'usb'
    destination.mkdir(exist_ok=False)
    for name, data in files.items():
        (destination / name).write_bytes(data)
    (destination / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    return verify_usb(workspace)


def build(workspace, *, experimental=False, overrides=(), rectangles=None):
    verification = verify(workspace)
    if (overrides or rectangles is not None) and not experimental:
        raise ValueError('Source overrides require experimental mode')
    # Reconstruct from the exported components, rather than depending on an
    # extraction path or silently using the original.bin convenience copy.
    components = json.loads((workspace / 'dc9/components/manifest.json').read_text())
    parts = {r['name']: inside(workspace / 'dc9/components', r['name']).read_bytes() for r in components['parts']}
    raw = assemble_image(components, parts)
    layout = json.loads(inside(workspace, 'dc9/source/layout.json').read_text())
    rectangle_hash = None
    if rectangles is not None:
        path = inside(workspace, rectangles)
        if not path.resolve().is_relative_to((workspace/'dc9/source').resolve()):
            raise ValueError('Rectangle source must be within dc9/source')
        source = path.read_bytes(); data = encode_rectangles(json.loads(source)); rectangle_hash = sha(source)
        table = next(t for t in layout['tables'] if t['name'] == 'channel_layout_rectangles')
        if int(table['address'], 16) != 0x3c5d10 or table['size'] != len(data):
            raise ValueError('Unexpected rectangle table location or size')
        table['values'] = [hex(x) for x in data]
    routines = {r['name']: r for r in layout['routines']}
    overridden = set()
    for override in overrides:
        name, separator, path = override.partition('=')
        if not separator or name not in routines or name in overridden:
            raise ValueError('Expected a unique known routine NAME=PATH')
        inside(workspace, path)
        routines[name]['source'] = path
        overridden.add(name)
    output, evidence = build_source(raw, layout, experimental, source_root=workspace,
                                    source_directory=workspace / 'dc9/source')
    evidence['workspace_verification'] = verification
    evidence['source_overrides'] = list(overrides)
    if rectangles is not None:
        evidence['rectangle_source'] = rectangles
        evidence['rectangle_source_sha256'] = rectangle_hash
    return output, evidence


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest='command', required=True)
    for name in ('prepare', 'verify', 'build', 'export-usb'):
        command = sub.add_parser(name)
        command.add_argument('workspace', type=Path)
        if name == 'build':
            command.add_argument('--output', type=Path, required=True)
            command.add_argument('--experimental', action='store_true')
            command.add_argument('--replace-source', action='append', default=[])
            command.add_argument('--rectangles', help='structured rectangle JSON within workspace dc9/source; experimental only')
    args = parser.parse_args()
    if args.command == 'prepare':
        manifest = prepare(args.workspace)
        print(f"Prepared {len(manifest['artifacts'])} artifacts and {manifest['source_component_count']} source components")
    elif args.command == 'verify':
        print(json.dumps(verify(args.workspace), indent=2))
    elif args.command == 'export-usb':
        print(json.dumps(export_usb(args.workspace), indent=2))
    else:
        suffix = '.experimental.bin' if args.experimental else '.baseline.bin'
        if not args.output.name.endswith(suffix):
            parser.error(f'Output must end with {suffix}')
        report = args.output.with_suffix('.json')
        if args.output.exists() or report.exists():
            parser.error('Output or evidence already exists; choose fresh filenames')
        output, evidence = build(args.workspace, experimental=args.experimental, overrides=args.replace_source,
                                 rectangles=args.rectangles)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with args.output.open('xb') as handle:
            handle.write(output)
        evidence['output_path'] = str(args.output)
        with report.open('x') as handle:
            handle.write(json.dumps(evidence, indent=2) + '\n')
        print(evidence['status'])
        print(evidence['output_sha256'])


if __name__ == '__main__':
    main()
