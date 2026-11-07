"""Byte-exact archived encodings and bounded semantics for six DC9 forms."""
from collections import Counter
import unittest

from aeon_helper_emulator import context
from aeon_module_model import Memory, ModuleModel
from aeon_subset_assembler import assemble, encode
from build_dc9_source_baseline import load_original


BASE = 0x200000
START, END = 0x2213d0, 0x222634
WANTED = {'bg.bgts': 1, 'bn.cmovi': 17, 'bn.sfgtu': 1,
          'bn.sfleu': 3, 'bn.srai': 3, 'bn.subb': 1}


def model_for(source):
    code, _ = assemble(source, BASE)
    return ModuleModel([(BASE, code)], call_policy='fallthrough-hypothesis')


def run(source, values=()):
    registers = [0] * 32
    for index, value in values:
        registers[index] = value
    return model_for(source).run(BASE, Memory([]), registers)


class ModeIsaTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.expanded, _ = load_original()
        cls.decoder = context()

    def test_every_archived_instance_in_candidate_span(self):
        code = self.expanded[START - BASE:END - BASE]
        rows = self.decoder.disassemble(code, base_address=START).instructions
        self.assertEqual(sum(row.length for row in rows), len(code))
        counts = Counter()
        for row in rows:
            if row.mnem not in WANTED:
                continue
            counts[row.mnem] += 1
            args = [part.strip() for part in row.body.rstrip(',').split(',')]
            original = self.expanded[row.addr.offset - BASE:row.addr.offset - BASE + row.length]
            with self.subTest(address=hex(row.addr.offset), op=row.mnem):
                self.assertEqual(encode(row.mnem, args, row.addr.offset, {}), original)
        self.assertEqual(counts, WANTED)

    def test_signed_immediate_edges_and_decoder(self):
        for first, second in ((-16, 15), (15, -16), (0, -1)):
            with self.subTest(first=first, second=second):
                code = encode('bn.cmovi', ['r7', str(first), str(second)], BASE, {})
                row = self.decoder.disassemble(code, base_address=BASE).instructions[0]
                self.assertEqual(row.mnem, 'bn.cmovi')
                self.assertEqual([int(part.strip(), 0) for part in row.body.split(',')[1:]],
                                 [first, second])
        for source in ('bn.cmovi r3,-17,0', 'bn.cmovi r3,16,0',
                       'bn.cmovi r3,0,-17', 'bn.cmovi r3,0,16',
                       'bn.srai r3,r4,-1', 'bn.srai r3,r4,32'):
            with self.subTest(source=source), self.assertRaisesRegex(ValueError, 'range'):
                assemble(source, BASE)

    def test_cmovi_flag_polarity_and_uninitialized_flag(self):
        source = 'bn.sfleu r4,r5\nbn.cmovi r3,-16,15\nbt.jr r9'
        self.assertEqual(run(source, [(4, 1), (5, 2)])['registers'][3], 0xfffffff0)
        self.assertEqual(run(source, [(4, 3), (5, 2)])['registers'][3], 15)
        with self.assertRaisesRegex(ValueError, 'uninitialized flag'):
            run('bn.cmovi r3,1,2\nbt.jr r9')

    def test_unsigned_register_flags_with_negative_bit_patterns(self):
        for op, left, right, expected in (
            ('bn.sfgtu', 0xffffffff, 1, True),
            ('bn.sfgtu', 1, 0xffffffff, False),
            ('bn.sfleu', 0xffffffff, 1, False),
            ('bn.sfleu', 0xffffffff, 0xffffffff, True),
        ):
            with self.subTest(op=op, left=left, right=right):
                result = run(f'{op} r4,r5\nbt.jr r9', [(4, left), (5, right)])
                self.assertEqual(result['flag'], expected)

    def test_arithmetic_shift_and_alias(self):
        for source, values, expected in (
            ('bn.srai r3,r4,31', [(4, 0x80000000)], 0xffffffff),
            ('bn.srai r4,r4,4', [(4, 0x80000000)], 0xf8000000),
            ('bn.srai r3,r4,0', [(4, 0x80000000)], 0x80000000),
        ):
            with self.subTest(source=source):
                destination = 4 if source.startswith('bn.srai r4') else 3
                self.assertEqual(run(source + '\nbt.jr r9', values)['registers'][destination],
                                 expected)

    def test_signed_branch_and_borrow_rejection(self):
        branch = ('bg.bgts r3,r4,taken\nbt.movi r5,1\nbt.jr r9\n'
                  'taken:\nbt.movi r5,2\nbt.jr r9')
        self.assertEqual(run(branch, [(3, 0xffffffff), (4, 1)])['registers'][5], 1)
        self.assertEqual(run(branch, [(3, 1), (4, 0xffffffff)])['registers'][5], 2)
        self.assertEqual(run(branch, [(3, 1), (4, 1)])['registers'][5], 1)
        with self.assertRaisesRegex(ValueError, 'unresolved borrow semantics'):
            run('bn.subb r3,r4,r5\nbt.jr r9', [(4, 10), (5, 3)])


if __name__ == '__main__':
    unittest.main()
