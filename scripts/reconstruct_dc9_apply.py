"""Recover layout-apply control flow and six directly related source spans."""
from reconstruct_dc9_receive import recover

SPANS = [
    ('channel_layout_apply', 0x23fad0, 0x23fc0a,
     'Apply orchestration: external setup, four engine calls, then three record flags and mask-selected rectangle copies; hardware dependencies unexecuted.'),
    ('channel_source_switch', 0x23fc0a, 0x23fd13,
     'Guard source selector <=5 and nonzero record masks before switching through external services.'),
    ('engine_prepare', 0x204000, 0x204059,
     'Reject engine indices >3; otherwise external setup and conditional state handling.'),
    ('channel_update_range', 0x22ac17, 0x22aca0,
     'Selector4 chooses record range0..3, otherwise one record; clear byte0x5b and combine external service results.'),
    ('channel_metadata_reset', 0x22aca0, 0x22acf2,
     'External preparation then selective reset of six 176-byte metadata records with per-record external calls.'),
    ('configuration_poll_wait', 0x2421d3, 0x242247,
     'Conditional two-phase poll using countdown0x455208; configuration bit0x20 or inactive flag bypasses polling.'),
]

if __name__ == '__main__':
    recover(SPANS)
