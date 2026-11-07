"""Recover the delay service and the timer routine that advances its counter."""
from reconstruct_dc9_receive import recover

SPANS = [
    ('timer_tick', 0x2417f1, 0x241b18,
     'Decrement counters, set periodic flags, and dispatch channel callbacks; tick period and interrupt source unknown.'),
    ('nop_return', 0x242099, 0x24209d, 'Observed nop and return; no calibrated delay established.'),
    ('delay_wait', 0x24209d, 0x2420bb,
     'Arm a halfword-load counter and poll adjacent completion flag; store width unresolved.'),
    ('delay_wait_with_callback', 0x2420bb, 0x242105,
     'Optionally call pointer at 0x4824ac before arming the shared delay counter and waiting.'),
    ('timer_initialize', 0x242105, 0x24211b,
     'Clear periodic flag and initialize reload counter to 1000; physical units unknown.'),
    ('nop_repeat', 0x24211b, 0x24214a,
     'Call nop-return low-byte(argument) times, preserving r10; not a calibrated delay.'),
]

if __name__ == '__main__':
    recover(SPANS)
