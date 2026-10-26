"""Recover downstream metadata consumers at fixed, byte-verified boundaries."""
from reconstruct_dc9_receive import recover

SPANS = [
    ('metadata_state_store', 0x20e66d, 0x20e687,
     'Store low bytes of three arguments at globals 0x454160..162.'),
    ('metadata_state_combine', 0x20e76c, 0x20e79d,
     'Combine accumulated metadata bytes and tail-call the three-byte state store.'),
    ('channel_state_configure', 0x2340cd, 0x23417c,
     'Publish six argument bytes and write four per-channel state words selected by low mask bits.'),
    ('channel_state_configure_jump', 0x23417c, 0x234180,
     'Tail jump to channel state configuration.'),
    ('channel_enable_dispatch', 0x234180, 0x2341c8,
     'Dispatch each of four low mask bits to the channel enable register helper.'),
    ('channel_enable_dispatch_jump', 0x2341c8, 0x2341cc,
     'Tail jump to four-channel enable dispatch.'),
    ('metadata_register_apply', 0x21125a, 0x2112a0,
     'Conditionally publish two bytes, then update selected register bits through two helpers.'),
    ('metadata_register_apply_jump', 0x2112a0, 0x2112a4,
     'Tail jump to metadata register application.'),
    ('channel_state_notify_return', 0x2118d2, 0x2118d4,
     'Archived single return instruction called from channel state configuration; no additional effects.'),
]

if __name__ == '__main__':
    recover(SPANS)
