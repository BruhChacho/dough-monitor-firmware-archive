"""Check the sparse CRC inference against direct bit-at-a-time computation."""
import random
import unittest

from probe_black32_integrity import crc_table, sparse_crc, zero_powers


def direct(data, poly, reflected, init=0):
    value = init
    for byte in data:
        value ^= byte
        for _ in range(8):
            if reflected:
                value = (value >> 1) ^ (poly if value & 1 else 0)
            else:
                value = ((value << 1) ^ (poly if value & 128 else 0)) & 255
    return value


class SparseCRCTests(unittest.TestCase):
    def test_sparse_composition_matches_direct_crc_for_every_polynomial(self):
        rng = random.Random(0x32)
        data = bytearray(513)
        for i in (0, 1, 7, 255, 256, 512):
            data[i] = rng.randrange(1, 256)
        differences = [(i, x) for i, x in enumerate(data) if x]
        for reflected in (False, True):
            for poly in (range(128, 256) if reflected else range(1, 256, 2)):
                table = crc_table(poly, reflected)
                actual = sparse_crc(differences, len(data), table, zero_powers(table, len(data)))
                self.assertEqual(actual, direct(data, poly, reflected))

    def test_equal_length_delta_cancels_common_initial_and_final_values(self):
        left, right = bytes(range(64)), bytes(63) + b'\xa5'
        delta = bytes(x ^ y for x, y in zip(left, right))
        for poly, reflected in ((7, False), (0x8c, True), (0x1d, False)):
            for init in (0, 0x5a, 255):
                actual = (direct(left, poly, reflected, init) ^ 0xa5) ^ (direct(right, poly, reflected, init) ^ 0xa5)
                self.assertEqual(actual, direct(delta, poly, reflected))


if __name__ == '__main__':
    unittest.main()
