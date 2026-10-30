"""Encoding and source-baseline rejection tests using the local pinned image."""
import copy
import json
from pathlib import Path
import tempfile
import unittest

from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, assemble_routines, assemble_tables, load_original
from trace_dc9_commands import direct_target


class SourceBuildTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.expanded, _ = load_original()
        cls.layout = json.loads(LAYOUT.read_text())

    def test_all_reconstructed_routines_match_archived_machine_code(self):
        result, records = assemble_routines(self.expanded, self.layout)
        self.assertEqual(result, self.expanded)
        self.assertEqual(sum(r["size"] for r in records), 27096)
        self.assertEqual(len(records), 160)

    def changed_source(self, source):
        with tempfile.TemporaryDirectory(dir=ROOT / "analysis/reconstructed") as folder:
            path = Path(folder) / "changed.aeon.s"
            path.write_text(source)
            layout = copy.deepcopy(self.layout)
            layout["routines"][0]["source"] = path.relative_to(ROOT).as_posix()
            with self.assertRaisesRegex(ValueError, "byte-exact original assembly"):
                assemble_routines(self.expanded, layout)

    def test_modified_source_cannot_be_labeled_stock_baseline(self):
        path = ROOT / self.layout["routines"][0]["source"]
        source = path.read_text()
        changed = source.replace("bg.movhi r7, 0x33", "bg.movhi r7, 0x34", 1)
        self.assertNotEqual(source, changed)
        self.changed_source(changed)

    def test_size_change_rejected(self):
        path = ROOT / self.layout["routines"][0]["source"]
        self.changed_source(path.read_text() + "bt.jr r9\n")

    def test_overlapping_routines_rejected(self):
        layout = copy.deepcopy(self.layout)
        layout["routines"].insert(1, copy.deepcopy(layout["routines"][0]))
        with self.assertRaisesRegex(ValueError, "Overlapping"):
            assemble_routines(self.expanded, layout)

    def test_wrong_routine_hash_rejected(self):
        layout = copy.deepcopy(self.layout)
        layout["routines"][0]["original_code_sha256"] = "0" * 64
        with self.assertRaisesRegex(ValueError, "identity mismatch"):
            assemble_routines(self.expanded, layout)

    def test_modified_command_table_cannot_be_labeled_stock_baseline(self):
        layout = copy.deepcopy(self.layout)
        layout["tables"][0]["values"][0] = "0x00"
        with self.assertRaisesRegex(ValueError, "byte-exact original table"):
            assemble_tables(self.expanded, layout)

    def test_table_cannot_overlap_source_code(self):
        layout = copy.deepcopy(self.layout)
        layout["tables"][0]["address"] = layout["routines"][0]["address"]
        with self.assertRaisesRegex(ValueError, "Overlapping source table"):
            assemble_tables(self.expanded, layout)

    def test_explicit_experiment_integrates_only_the_requested_helper(self):
        layout = copy.deepcopy(self.layout)
        routine = next(r for r in layout["routines"] if r["name"] == "command_group_secondary")
        routine["source"] = "analysis/reconstructed/spectrum_one_table_helper_rewrite.aeon.s"
        result, records = assemble_routines(self.expanded, layout, allow_changes=True)
        changes = [i for i, (a, b) in enumerate(zip(self.expanded, result)) if a != b]
        self.assertEqual(len(changes), 29)
        self.assertTrue(all(0x4059 <= i < 0x4080 for i in changes))
        self.assertEqual(sum(not r["matches_original"] for r in records), 1)

    def test_experimental_mode_still_rejects_growth(self):
        with tempfile.TemporaryDirectory(dir=ROOT / "analysis/reconstructed") as folder:
            layout = copy.deepcopy(self.layout)
            path = Path(folder) / "larger.aeon.s"
            path.write_text((ROOT / layout["routines"][0]["source"]).read_text() + "bt.jr r9\n")
            layout["routines"][0]["source"] = path.relative_to(ROOT).as_posix()
            with self.assertRaises(ValueError):
                assemble_routines(self.expanded, layout, allow_changes=True)

    def test_word_offsets_require_alignment_and_signed_byte_range(self):
        for offset in (-129, -127, -1, 1, 126, 128):
            for source in (f"bn.sw {offset}(r1),r9", f"bn.lwz r9,{offset}(r1)"):
                with self.subTest(source=source), self.assertRaises(ValueError):
                    assemble(source, 0x200000)
        for offset in (-128, 0, 124):
            self.assertEqual(len(assemble(f"bn.lwz r31,{offset}(r31)", 0x200000)[0]), 3)

    def test_branch_limits_and_bytewise_scan_at_end_of_buffer(self):
        base = 0x2000000
        for prefix, bits in (("bg.jal", 25), ("bn.bnf", 16),
                             ("bn.beqi r3,0,", 8), ("bn.blesi r3,-4,", 8)):
            for delta in (-(1 << (bits - 1)), -1, 0, (1 << (bits - 1)) - 1):
                target = base + delta
                code, _ = assemble(f"{prefix} {target:#x}", base)
                self.assertEqual(direct_target(code, 0, base), (target, len(code)))
                self.assertEqual(direct_target(b"\0" + code, 1, base - 1), (target, len(code)))
            for delta in (-(1 << (bits - 1)) - 1, 1 << (bits - 1)):
                with self.assertRaises(ValueError):
                    assemble(f"{prefix} {base + delta:#x}", base)

    def test_new_memory_forms_reject_offsets_that_change_opcode(self):
        for source in ('bn.sh_1 2(r3),r4', 'bn.sh_1 -4(r3),r4',
                       'bg.lwz r4,2(r3)', 'bg.sw_0 32768(r3),r4',
                       'bg.lhz r4,1(r3)', 'bg.sbz -32769(r3),r4'):
            with self.subTest(source=source), self.assertRaises(ValueError):
                assemble(source, 0x200000)

    def test_new_immediate_forms_reject_truncation(self):
        for source in ('bn.andi r3,r4,256', 'bn.addi r3,r4,128',
                       'bn.sfgtui r3,-1', 'bg.sfgti r3,65536',
                       'bn.srli r3,r4,32', 'bn.bgtui r3,8,0x200000'):
            with self.subTest(source=source), self.assertRaises(ValueError):
                assemble(source, 0x200000)

    def test_register_helper_forms_reject_truncation_and_opcode_overlap(self):
        for source in ('bn.movhi_2 r3,8192', 'bn.ori r3,r4,256',
                       'bn.sfeqi r3,256', 'bg.beqi r3,32,0x200000',
                       'bg.bnei r3,1,0x201000', 'bg.beqi r3,1,0x1fefff',
                       'bg.sw_1 2(r3),r4', 'bg.sw_1 32768(r3),r4'):
            with self.subTest(source=source), self.assertRaises(ValueError):
                assemble(source, 0x200000)

    def test_receive_forms_reject_ambiguous_offsets_and_overflow(self):
        for source in ('bn.lh r3,-2(r4)', 'bn.lh r3,1(r4)', 'bn.lh r3,128(r4)',
                       'bn.j 0x220000', 'bg.ble r3,r4,0x201000', 'bg.bgt r3,r4,0x1fefff'):
            with self.subTest(source=source), self.assertRaises(ValueError):
                assemble(source, 0x200000)

    def test_transfer_forms_reject_field_overflow_and_ambiguous_store_offsets(self):
        for source in ('bg.bleui r3,32,0x200000', 'bg.bgtui r3,-1,0x200000',
                       'bn.bleui r3,8,0x200000', 'bn.sfnei r3,256',
                       'bg.sh 2(r3),r4', 'bg.sh -32772(r3),r4'):
            with self.subTest(source=source), self.assertRaises(ValueError):
                assemble(source, 0x200000)


if __name__ == "__main__":
    unittest.main()
