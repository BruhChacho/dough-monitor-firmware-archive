/* Manually reconstructed from ES07DC9 v101 rev1148.
 * Input SHA256:
 * 0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9
 * Evidence: ../aeon-excerpts.md, function at candidate VA 0x204059.
 * Names are analyst-assigned. This is a partial semantic reconstruction,
 * not original vendor source, a complete firmware, or hardware-tested code.
 * Calling convention inferred: r3 argument/result, r9 return address.
 * Table meaning is unknown; do not label these bytes as menu or DDC codes
 * until callers are traced. Vendor-derived code/data is excluded from the
 * repository's MIT grant.
 */
#include <stddef.h>
#include <stdint.h>

/* Candidate VA 0x2aed7c, 41 bytes, in the expanded image. */
static const uint8_t table_2aed7c[] = {
    0x40, 0x32, 0x33, 0x39, 0x42, 0x44, 0x50, 0x51,
    0x60, 0x71, 0x80, 0x84, 0x86, 0x98, 0x99, 0x41,
    0x52, 0x53, 0x9a, 0x9b, 0x9c, 0x5a, 0x5b, 0x5c,
    0x5d, 0x5e, 0x5f, 0x59, 0x57, 0x58, 0x9d, 0x9e,
    0x94, 0x95, 0x96, 0x97, 0x90, 0x91, 0x92, 0x93, 0x56
};

uint32_t spectrum_one_sub_204059(uint32_t value)
{
    /* Keep a 32-bit argument: the assembly does not truncate r3 to a byte. */
    for (size_t i = 0; i < sizeof(table_2aed7c); ++i) {
        if (value == table_2aed7c[i])
            return 1;
    }
    return 0;
}
