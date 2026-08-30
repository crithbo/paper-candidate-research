# Discovery log — Wave357 fresh cross-layer bottleneck-shift guarantee breadth

## Freeze

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE357-FRESH-CROSS-LAYER-BOTTLENECK-SHIFT-GUARANTEE-BREADTH.
- Cutoff 2026-08-11; v8.7+R5-P0; DISCOVERY_QUALITY_MODE=OFF.
- Frozen controls: plan 7A02236720D3ECCCA344408A7DC9B60109F95DD8CA52E9B680FC29700DC225F3; registry 926AEFED57FE83EE1E20274927D51E4F60453B8A2299462401987344E3046DAF; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.

## Six fresh cross-layer families

| Family | Fixed object / stock oracle | Witness-first outcome |
|---|---|---|
| Linux kTLS sendfile/offload | Fixed TLS records, peer authentication/integrity and stock receiver result. | Existing kTLS/zerocopy flags; no non-generic joint action. |
| dm-verity block verification | Fixed data blocks/hash tree/root hash and read acceptance/failure. | Verification/layout constraints; no two native constructor actions. |
| io_uring ZC Rx | Fixed received byte stream and completion semantics. | Buffer chunk size/registration are existing configuration. |
| ublk zero-copy backend | Fixed block-device read result and trusted server contract. | Registration/segment parameters are existing modes. |
| in-kernel TLS handshake | Fixed peer/authenticated TLS session and data record semantics. | User handshake agent is an external controller boundary. |
| TLS NIC offload | Fixed TLS record output and integrity. | Software/hardware offload and queue behavior are current modes. |

## Admission result

All six show an old-to-new cost shift, but none passes the stronger pre-deep gate. kTLS sendfile and NIC offload expose flags/modes, not a union-external whole action; changing bytes during zero-copy can cause receiver authentication failure. dm-verity fixes data/hash/root-hash semantics and on-demand verification. io_uring ZC Rx and ublk expose registered buffers, chunk/segment values and trusted-server obligations. The kernel handshake path explicitly uses an external user agent, which is controller/wrapper territory. No line freezes two stock-native complete actions with a target-specific exact/FPT/certified guarantee.

## Required future fidelity closure

Any rescreen must pin current kernel/OpenSSL sources and demonstrate two same-object stock-oracle-equivalent complete actions, not merely flags. Natural CPU carrier may be public kernel selftests and versioned TLS/verity/block fixtures, 20–50 cases. Full cost must include setup/registration, copy/crypto/verification CPU-RSS, bytes, queueing and cold/warm endpoint latency. The 72h killer fails if a claimed action is a mode/configuration/selector, changes TLS/verity guarantee, changes reader/peer output, uses an external wrapper, or cannot state a target-specific guarantee.

## Decision

COMPLETE_ZERO_PROPOSALS. All entries remain raw/NOT_ADMITTED_UNFROZEN; none was rejected due to implementation, result, resource or AI-readiness absence. No terminal STOP or novelty clearance is claimed.
