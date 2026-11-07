"""Recover callback initialization and the registered timer dispatch wrapper."""
from reconstruct_dc9_receive import recover

SPANS = [
    ('callback_set', 0x23e62c, 0x23e63e,
     'Store r4 at callback_table + uint32(r3<<2), with no local index bound.'),
    ('callback_clear', 0x23e63e, 0x23e661, 'Clear ten callback table entries.'),
    ('channel_record_set34', 0x23e709, 0x23e71e,
     'Write low byte r4 at 0x4821ec + uint32(r3*168) + 0x34; physical meaning unknown.'),
    ('callback_initialize', 0x2614a9, 0x26154e,
     'Call external configuration helper, clear callbacks, install seven entries and enable callback gating.'),
    ('timer_register', 0x27081c, 0x270836,
     'Pass timer_dispatch and Check timer string to timer_create_wrapper with arguments 0,1,1.'),
    ('timer_dispatch', 0x270836, 0x2708c7,
     'Call timer_tick then maintain word counters, divide-by-100 byte counter, and divide-by-1000 counter.'),
    ('timer_create_wrapper', 0x279e04, 0x279e50,
     'Create candidate timer handle and configure it through four external functions; timing units unknown.'),
]

if __name__ == '__main__':
    recover(SPANS)
