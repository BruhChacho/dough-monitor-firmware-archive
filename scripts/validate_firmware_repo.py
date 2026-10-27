"""Run the offline firmware gates and build fresh, reviewable development files.

No network, device access, vendor execution, or writes to prior reports/builds.
Passing means the stated offline contracts pass, not that firmware boots.
"""
import argparse
import csv
from datetime import datetime, timezone
import json
from pathlib import Path
import subprocess
import sys
import unittest

from build_dc9_source_baseline import ROOT, LAYOUT, load_original, sha
from firmware_workspace import prepare, export_usb, verify, build
from roundtrip_mstar import split, assemble
from unpack_mstar import unpack


def fresh_destination(path):
    path = Path(path).resolve()
    allowed = (ROOT / 'analysis/extracted').resolve()
    if not path.is_relative_to(allowed) or path == allowed:
        raise ValueError('Choose a new directory under analysis/extracted')
    if path.exists():
        raise ValueError('Output directory already exists; choose a fresh path')
    return path


def source_identities():
    paths = set((ROOT / 'scripts').glob('*.py'))
    paths.update((ROOT / 'analysis/reconstructed').glob('*.aeon.s'))
    paths.update((ROOT / 'analysis/reconstructed').glob('*.json'))
    paths.update(ROOT / p for p in ('MANIFEST.csv', 'analysis/inventory.json',
                                  'analysis/installers.json', 'analysis/mstar-layouts.json',
                                  'scripts/analysis-requirements.txt'))
    paths.add(LAYOUT)
    return {p.relative_to(ROOT).as_posix(): sha(p.read_bytes()) for p in sorted(paths)}


def archive_gate():
    records = []
    with (ROOT / 'MANIFEST.csv').open(newline='') as handle:
        for row in csv.DictReader(handle):
            path = ROOT / row['local_path']
            data = path.read_bytes()
            if len(data) != int(row['size_bytes']) or sha(data) != row['sha256']:
                raise ValueError(f"Archive identity mismatch: {row['local_path']}")
            records.append({'path': row['local_path'], 'size': len(data), 'sha256': sha(data)})
    if not records:
        raise ValueError('Empty archive manifest')
    return {'verified_packages': len(records), 'packages': records}


def corpus_gate():
    results = []
    for layout in json.loads((ROOT / 'analysis/mstar-layouts.json').read_text()):
        raw = (ROOT / layout['source_path']).read_bytes()
        if sha(raw) != layout['source_sha256']:
            raise ValueError('Corpus input identity mismatch')
        components, parts = split(raw)
        rebuilt = assemble(components, parts)
        if rebuilt != raw:
            raise ValueError('Corpus roundtrip differs from original')
        _, info = unpack(rebuilt)
        results.append({'sha256': sha(rebuilt), 'byte_exact': True,
                        'resource_count': len(components['resources']), 'checksums': info['checksums']})
    if not results:
        raise ValueError('Empty firmware corpus')
    return {'images': results, 'byte_exact_roundtrips': len(results),
            'verified_resource_checksums': sum(r['resource_count'] for r in results)}


def write_json(path, data):
    with path.open('x') as handle:
        json.dump(data, handle, indent=2)
        handle.write('\n')


def run(destination):
    if sys.flags.optimize:
        raise ValueError('Validation requires Python assertions; do not use -O or PYTHONOPTIMIZE')
    destination = fresh_destination(destination)
    identities = source_identities()
    destination.mkdir(parents=True, exist_ok=False)
    report = {'format': 'offline-firmware-validation-v1',
              'started_utc': datetime.now(timezone.utc).isoformat(),
              'git_head': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
              'offline_validation_passed': False, 'complete_source': False, 'hardware_tested': False,
              'source_identities': identities, 'stages': [],
              'limitations': ['Most DC9 application bytes remain pinned vendor input.',
                              'CPU, store, CALL and interleaving assumptions are explicit in individual reports.',
                              'EFE and USB exports are raw references, not community source builds.',
                              'No boot, recovery or physical monitor functionality has been validated.']}

    def stage(name, function):
        print(f'Checking {name}...', flush=True)
        result = function()
        write_json(destination / f'{name}.json', result)
        report['stages'].append(name)
        return result

    try:
        stage('archive', archive_gate)
        stage('corpus', corpus_gate)
        print('Running repository tests...', flush=True)
        suite = unittest.defaultTestLoader.discover(str(ROOT / 'scripts'), pattern='test_*.py')
        with (destination / 'tests.log').open('x') as log:
            result = unittest.TextTestRunner(stream=log, verbosity=2).run(suite)
        report['unit_tests'] = {'run': result.testsRun, 'failures': len(result.failures),
                                'errors': len(result.errors), 'skipped': len(result.skipped)}
        if not result.wasSuccessful() or result.testsRun == 0 or result.skipped:
            raise ValueError('Repository tests failed, were skipped, or did not run; see tests.log')

        from validate_aeon_rewrite import validate as validate_rewrite
        from validate_dc9_module import validate as validate_commands
        from validate_dc9_registers import validate as validate_registers
        from validate_dc9_receive import validate as validate_receive
        from validate_dc9_transfer import validate as validate_transfer
        from validate_dc9_timer import validate as validate_timer
        from validate_dc9_callbacks import validate as validate_callbacks
        from validate_dc9_configuration import validate as validate_configuration
        from validate_dc9_apply import validate as validate_apply
        from validate_dc9_metadata import validate as validate_metadata
        from validate_dc9_masked import validate as validate_masked
        from validate_dc9_metadata_service import validate as validate_metadata_service
        from validate_dc9_metadata_consumers import validate as validate_metadata_consumers
        from validate_dc9_metadata_registers import validate as validate_metadata_registers
        from validate_dc9_layout_setup import validate as validate_layout_setup
        from validate_dc9_engine_control import validate as validate_engine_control
        from validate_dc9_engine_enable import validate as validate_engine_enable
        from validate_dc9_enable_leaf import validate as validate_enable_leaf
        from validate_dc9_reference_count import validate as validate_reference_count
        original, _, _ = load_original()
        stage('helper-rewrite', lambda: validate_rewrite(original)[1])
        for name, validator in (('commands', validate_commands), ('registers', validate_registers),
                                ('receive', validate_receive), ('transfer', validate_transfer), ('timer', validate_timer),
                                ('callbacks', validate_callbacks), ('configuration', validate_configuration),
                                ('apply', validate_apply), ('masked-registers', validate_masked),
                                ('metadata', validate_metadata), ('metadata-service', validate_metadata_service),
                                ('metadata-consumers', validate_metadata_consumers), ('metadata-registers', validate_metadata_registers),
                                ('layout-setup', validate_layout_setup), ('engine-control', validate_engine_control),
                                ('enable-leaf', validate_enable_leaf), ('reference-count', validate_reference_count),
                                ('engine-enable', validate_engine_enable)):
            stage(name, validator)

        print('Preparing raw files and building baseline, helper and layout images...', flush=True)
        workspace = destination / 'workspace'
        manifest = prepare(workspace)
        export_usb(workspace)
        report['workspace'] = verify(workspace)
        output_dir = workspace / 'build'; output_dir.mkdir()
        builds = {}
        for name, experimental, overrides, rectangles in (
            ('dc9-v101.baseline', False, (), None),
            ('dc9-v101-helper.experimental', True,
             ('command_group_secondary=dc9/source/alternatives/secondary-helper-rewrite.aeon.s',), None),
            ('dc9-v101-layout.experimental', True, (), 'dc9/source/dc9-rectangles-asymmetric.example.json')):
            output, evidence = build(workspace, experimental=experimental, overrides=overrides, rectangles=rectangles)
            output_path = output_dir / (name + '.bin')
            with output_path.open('xb') as handle:
                handle.write(output)
            evidence['output_path'] = output_path.relative_to(ROOT).as_posix()
            write_json(output_path.with_suffix('.json'), evidence)
            # Compare resource bytes at their original physical spans, in addition
            # to the format/checksum checks already required by the source builder.
            components, _ = split(original)
            for resource in components['resources']:
                start, end = int(resource['start'], 16), int(resource['end_exclusive'], 16)
                if output[start:end] != original[start:end]:
                    raise ValueError('Build changed a pinned resource range')
            if overrides and (evidence['changed_program_bytes'] != 29 or
                                 any(not 0x4059 <= int(x, 16) < 0x4080 for x in evidence['changed_expanded_offsets'])):
                raise ValueError('Helper build changed unexpected application bytes')
            if rectangles and (evidence['changed_program_bytes'] != 6 or
                               any(not 0x1c5d50 <= int(x,16) < 0x1c5d60 for x in evidence['changed_expanded_offsets'])):
                raise ValueError('Rectangle build changed unexpected application bytes')
            builds[name] = {'sha256': sha(output), 'size': len(output),
                            'resource_ranges_unchanged': len(components['resources']),
                            'changed_program_bytes': evidence['changed_program_bytes']}
        report['builds'] = builds
        report['source_components'] = manifest['source_component_count']
        report['assembled_code_bytes'] = evidence['assembled_code_bytes']
        report['assembled_instructions'] = evidence['assembled_instructions']
        report['assembled_table_bytes'] = evidence['assembled_table_bytes']
        if source_identities() != identities:
            raise ValueError('Repository inputs changed during validation; repeat with stable sources')
        report['artifacts'] = {p.relative_to(destination).as_posix(): sha(p.read_bytes())
                               for p in sorted(destination.rglob('*')) if p.is_file()}
        report['offline_validation_passed'] = True
    except Exception as error:
        report['error'] = f'{type(error).__name__}: {error}'
        raise
    finally:
        report['finished_utc'] = datetime.now(timezone.utc).isoformat()
        write_json(destination / 'validation.json', report)
    print(f"Passed offline gates; {report['source_components']} source components. Hardware remains untested.", flush=True)
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True, type=Path, help='new directory under analysis/extracted')
    args = parser.parse_args()
    try:
        run(args.output)
    except (ValueError, OSError) as error:
        parser.exit(1, f'{error}\n')


if __name__ == '__main__':
    main()
