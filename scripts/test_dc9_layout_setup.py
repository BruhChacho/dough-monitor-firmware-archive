"""Regression coverage for the recovered four-record auxiliary reset routine."""
from pathlib import Path
import unittest

from aeon_module_model import Memory, ModuleModel, Region
from aeon_subset_assembler import assemble
from validate_dc9_module import initial_registers

ROOT = Path(__file__).resolve().parents[1]
ENTRY = 0x222FCA
RECORDS = 0x47FA3C
TEMPLATE = 0x2AF628
STRIDE = 24
TEMPLATE_BYTES = bytes((0, 0, 0, 0, 6, 6, 0, 0))
SOURCE = ROOT / 'analysis/reconstructed/spectrum_one_auxiliary_records_reset.aeon.s'


def model():
    code, _ = assemble(SOURCE.read_text(), ENTRY)
    return ModuleModel([(ENTRY, code)], call_policy='fallthrough-hypothesis')


def fixture(record_bytes=None, *, writable=True):
    if record_bytes is None:
        record_bytes = bytearray((i * 29 + 0x51) & 0xff for i in range(4 * STRIDE))
    records = Region('records', RECORDS, bytearray(record_bytes), writable)
    template = Region('template', TEMPLATE, bytearray(TEMPLATE_BYTES), False)
    return Memory([records, template]), records, template


def registers(mask, seed=0x13579bdf):
    values = initial_registers(seed)
    values[3] = mask
    return values


class LayoutSetupTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.model = model()

    def test_all_low_masks_clear_only_selected_records_and_preserve_neighbors(self):
        for mask in range(16):
            with self.subTest(mask=mask):
                memory, records, template = fixture()
                before = bytes(records.data)
                template_before = bytes(template.data)
                result = self.model.run(ENTRY, memory, registers(mask))
                expected = bytearray(before)
                for index in range(4):
                    if mask & (1 << index):
                        start = index * STRIDE
                        expected[start] = 0
                        expected[start + 12:start + 20] = TEMPLATE_BYTES
                        expected[start + 21] = 0
                self.assertEqual(records.data, expected)
                self.assertEqual(template.data, template_before)
                self.assertEqual([write[1] for write in memory.writes], [
                    address
                    for index in range(4) if mask & (1 << index)
                    for address in (RECORDS + index * STRIDE,
                                    *(RECORDS + index * STRIDE + offset for offset in range(12, 20)),
                                    RECORDS + index * STRIDE + 21)
                ])
                self.assertEqual(result['registers'][1], registers(mask)[1])
                self.assertEqual(result['registers'][23:30], list(TEMPLATE_BYTES[:7][::-1]))
                self.assertEqual(result['termination'], 'return')

    def test_high_bits_do_not_select_records_and_all_ones_selects_all_four(self):
        for mask, selected in ((0x10, 0), (0x80000000, 0),
                               (0x7ffffff0, 0), (0xffffffff, 0xf)):
            with self.subTest(mask=hex(mask)):
                memory, records, _ = fixture()
                before = bytes(records.data)
                self.model.run(ENTRY, memory, registers(mask))
                expected = bytearray(before)
                for index in range(4):
                    if selected & (1 << index):
                        start = index * STRIDE
                        expected[start] = 0
                        expected[start + 12:start + 20] = TEMPLATE_BYTES
                        expected[start + 21] = 0
                self.assertEqual(records.data, expected)

    def test_unmapped_fourth_record_fails_after_retaining_prior_selected_writes(self):
        initial = bytearray((i * 17 + 0x23) & 0xff for i in range(3 * STRIDE))
        memory, records, template = fixture(initial)
        # Leave the fourth record unmapped while keeping the same immutable template.
        memory.regions[0].data = initial
        before = bytes(initial)
        regs = registers(0xf)
        with self.assertRaisesRegex(ValueError, r'Unmapped memory access: 0x47fa84\+1'):
            self.model.run(ENTRY, memory, regs)
        expected = bytearray(before)
        for index in range(3):
            start = index * STRIDE
            expected[start] = 0
            expected[start + 12:start + 20] = TEMPLATE_BYTES
            expected[start + 21] = 0
        self.assertEqual(records.data, expected)
        self.assertEqual(len(memory.writes), 30)
        self.assertEqual(bytes(template.data), TEMPLATE_BYTES)

    def test_input_template_must_be_read_only(self):
        memory, _, template = fixture()
        self.assertFalse(template.writable)
        self.model.run(ENTRY, memory, registers(0xf))
        self.assertEqual(bytes(template.data), TEMPLATE_BYTES)
        self.assertFalse(any(name == 'template' for name, *_ in memory.writes))


if __name__ == '__main__':
    unittest.main()
