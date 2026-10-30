"""Adversarial checks on the restricted interpreter; requires prepared SLEIGH."""
import unittest
from aeon_helper_emulator import HelperEmulator, BASE
from aeon_subset_assembler import assemble


def machine(source):
    code, _ = assemble(source, BASE)
    return HelperEmulator(code, b"\x40")


class EmulatorTests(unittest.TestCase):
    def test_zero_extending_byte_load_and_register_aliases(self):
        emulator = machine("bg.movhi r7, 0x2b\nbg.addi r7, r7, -0x1284\nbn.lbz r6, 0(r7)\nbt.jr r9")
        result = emulator.run(0, seed=0xffffffff)
        self.assertEqual(result["registers"][6], 0x40)
        self.assertEqual(result["reads"], [(0x2aed7c, 1)])

    def test_out_of_range_load_rejected(self):
        with self.assertRaisesRegex(ValueError, "outside allowed table"):
            machine("bn.lbz r6, 0(r3)\nbt.jr r9").run(0)

    def test_loop_budget(self):
        with self.assertRaisesRegex(ValueError, "budget"):
            machine("again:\nbt.j again").run(0, max_steps=5)

    def test_branch_into_instruction_rejected(self):
        with self.assertRaisesRegex(ValueError, "instruction boundaries"):
            machine(f"bt.j {BASE + 1:#x}").run(0)

    def test_unexpected_return_rejected(self):
        with self.assertRaisesRegex(ValueError, "return address"):
            machine("bt.movi r9, 0\nbt.jr r9").run(0)

    def test_uint32_and_wrapping_arithmetic(self):
        emulator = machine("bt.addi r3, 1\nbt.jr r9")
        self.assertEqual(emulator.run(0xffffffff)["registers"][3], 0)
        for value in (-1, 0x100000000):
            with self.assertRaisesRegex(ValueError, "uint32"):
                emulator.run(value)


if __name__ == "__main__":
    unittest.main()
