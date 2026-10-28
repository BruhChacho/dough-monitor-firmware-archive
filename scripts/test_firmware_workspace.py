"""Exercise raw-input preservation and editable-source workspace builds."""
import json
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch

from firmware_workspace import prepare, verify, build, inside, export_usb
from recompress_dc9 import SOURCE_SHA
from unpack_mstar import unpack


class WorkspaceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.shared = tempfile.TemporaryDirectory()
        cls.base = Path(cls.shared.name) / 'export'
        prepare(cls.base)

    @classmethod
    def tearDownClass(cls):
        cls.shared.cleanup()

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.workspace = Path(self.temp.name) / 'workspace'
        shutil.copytree(self.base, self.workspace)
        self.addCleanup(self.temp.cleanup)

    def test_build_uses_exported_inputs_without_loading_archive(self):
        with patch('firmware_workspace.load_original', side_effect=AssertionError('Archive read')):
            output, report = build(self.workspace)
        self.assertEqual(output, (self.workspace / 'dc9/original.bin').read_bytes())
        self.assertEqual(report['output_sha256'], SOURCE_SHA)
        self.assertEqual(report['assembled_code_bytes'], 19539)

    def test_structured_rectangle_edit_requires_selection_and_experimental_mode(self):
        rectangle_path = 'dc9/source/dc9-rectangles-asymmetric.example.json'
        with self.assertRaisesRegex(ValueError, 'experimental mode'):
            build(self.workspace, rectangles=rectangle_path)
        with patch('firmware_workspace.load_original', side_effect=AssertionError('Archive read')):
            output, report = build(self.workspace, experimental=True, rectangles=rectangle_path)
        before, _ = unpack((self.workspace/'dc9/original.bin').read_bytes())
        after, _ = unpack(output)
        changes = [i for i in range(0x3800,len(before)) if before[i] != after[i]]
        self.assertEqual(len(changes), 6)
        self.assertTrue(all(0x1c5d50 <= i < 0x1c5d60 for i in changes))
        self.assertEqual(report['rectangle_source'], rectangle_path)
        baseline, _ = build(self.workspace)
        self.assertEqual(baseline, (self.workspace/'dc9/original.bin').read_bytes())

    def test_source_edit_requires_experiment_and_changes_only_helper(self):
        layout = json.loads((self.workspace / 'dc9/source/layout.json').read_text())
        routine = next(x for x in layout['routines'] if x['name'] == 'command_group_secondary')
        changed = self.workspace / routine['source']
        changed.write_bytes((self.workspace / 'dc9/source/alternatives/secondary-helper-rewrite.aeon.s').read_bytes())
        self.assertEqual(verify(self.workspace)['changed_sources'], [routine['source']])
        with self.assertRaisesRegex(ValueError, 'byte-exact original assembly'):
            build(self.workspace)
        output, report = build(self.workspace, experimental=True)
        before, _ = unpack((self.workspace / 'dc9/original.bin').read_bytes())
        after, _ = unpack(output)
        differences = [i for i in range(0x3800, len(before)) if before[i] != after[i]]
        self.assertEqual(len(differences), 29)
        self.assertTrue(all(0x4059 <= i < 0x4080 for i in differences))
        self.assertEqual(report['changed_program_bytes'], 29)

    def test_raw_reference_changes_are_rejected_instead_of_ignored(self):
        path = self.workspace / 'dc9/raw/application.bin'
        data = bytearray(path.read_bytes()); data[0] ^= 1; path.write_bytes(data)
        with self.assertRaisesRegex(ValueError, 'Changed immutable'):
            build(self.workspace, experimental=True)

    def test_component_changes_cannot_be_labeled_original(self):
        path = self.workspace / 'dc9/components/00-boot-and-header.bin'
        data = bytearray(path.read_bytes()); data[0] ^= 1; path.write_bytes(data)
        with self.assertRaisesRegex(ValueError, 'Changed immutable'):
            verify(self.workspace)

    def test_source_overrides_cannot_escape_source_directory(self):
        with self.assertRaisesRegex(ValueError, 'outside reconstructed directory'):
            build(self.workspace, experimental=True,
                  overrides=['command_group_secondary=efe/original.bin'])
        for name in ('../outside', '/absolute', 'a/../../outside', 'a\\outside'):
            with self.assertRaises(ValueError):
                inside(self.workspace, name)

    def test_prepare_refuses_existing_directory(self):
        marker = self.workspace / 'keep.txt'; marker.write_text('preserve')
        with self.assertRaises(FileExistsError):
            prepare(self.workspace)
        self.assertEqual(marker.read_text(), 'preserve')

    def test_optional_usb_export_is_pinned_and_never_overwritten(self):
        result = export_usb(self.workspace)
        self.assertEqual(result['verified_raw_images'], 2)
        self.assertEqual(verify(self.workspace)['usb'], result)
        with self.assertRaises(FileExistsError):
            export_usb(self.workspace)
        path = self.workspace / 'usb/vl822-hub-06a4.bin'
        data = bytearray(path.read_bytes()); data[-1] ^= 1; path.write_bytes(data)
        with self.assertRaisesRegex(ValueError, 'USB raw image identity mismatch'):
            verify(self.workspace)


if __name__ == '__main__':
    unittest.main()
