"""The combined gate must not overwrite evidence or claim a failed run passed."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

from build_dc9_source_baseline import ROOT
from validate_firmware_repo import fresh_destination, run


class RepositoryGateTests(unittest.TestCase):
    def test_existing_output_and_external_destination_are_rejected(self):
        with tempfile.TemporaryDirectory(dir=ROOT / 'analysis/extracted') as folder:
            path = Path(folder); sentinel = path / 'retained'; sentinel.write_text('keep')
            with self.assertRaisesRegex(ValueError, 'already exists'):
                fresh_destination(path)
            self.assertEqual(sentinel.read_text(), 'keep')
        with self.assertRaisesRegex(ValueError, 'under analysis/extracted'):
            fresh_destination(ROOT / 'should-not-be-created')

    def test_symlink_escape_cannot_write_outside_generated_area(self):
        with tempfile.TemporaryDirectory(dir=ROOT / 'analysis/extracted') as folder:
            link = Path(folder) / 'escape'; link.symlink_to(ROOT, target_is_directory=True)
            with self.assertRaisesRegex(ValueError, 'under analysis/extracted'):
                fresh_destination(link / 'should-not-be-created')

    def test_failed_stage_leaves_failure_record_and_no_builds(self):
        with tempfile.TemporaryDirectory(dir=ROOT / 'analysis/extracted') as folder:
            output = Path(folder) / 'failed'
            with patch('validate_firmware_repo.archive_gate', side_effect=ValueError('test identity mismatch')):
                with self.assertRaisesRegex(ValueError, 'test identity mismatch'):
                    run(output)
            report = json.loads((output / 'validation.json').read_text())
            self.assertFalse(report['offline_validation_passed'])
            self.assertFalse(report['hardware_tested'])
            self.assertFalse(report['complete_source'])
            self.assertIn('test identity mismatch', report['error'])
            self.assertEqual(report['stages'], [])
            self.assertFalse((output / 'workspace').exists())

    def test_optimized_python_cannot_silently_disable_contract_assertions(self):
        with tempfile.TemporaryDirectory(dir=ROOT / 'analysis/extracted') as folder:
            output = Path(folder) / 'optimized'
            result = subprocess.run([sys.executable, '-O', str(ROOT / 'scripts/validate_firmware_repo.py'),
                                     '--output', str(output)], capture_output=True, text=True, cwd=ROOT)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('requires Python assertions', result.stderr)
            self.assertFalse(output.exists())


if __name__ == '__main__':
    unittest.main()
