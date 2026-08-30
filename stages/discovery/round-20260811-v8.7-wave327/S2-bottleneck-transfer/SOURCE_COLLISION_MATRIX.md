# Source and collision matrix — Wave327

| Family | Current primary/official source | Constraint on atomic action |
|---|---|---|
| Android APEX | [AOSP APEX file format](https://source.android.com/docs/core/ota/apex), [APK Signature v3.2](https://source.android.com/docs/security/features/apksigning/v3-2) | Entire package signing makes a byte/layout mutation non-neutral unless stock equivalence is proven. |
| TCG RIM/event logs | [TCG PC Client RIM](https://trustedcomputinggroup.org/resource/tcg-pc-client-reference-integrity-manifest-specification/), [canonical event log format](https://trustedcomputinggroup.org/wp-content/uploads/TCG_Canonical-Event-Log-Format_v1.1_pub.pdf) | Log order, measured digests, PCR/replay and reference data are attestation semantics. |
| Firmware measurements | [TCG firmware integrity measurement](https://trustedcomputinggroup.org/wp-content/uploads/TCG_PC_Client-FIM_v1r24_3feb20.pdf) | PCR must be reconstructed against logged digests and expected RIM. |
| IMA | Official Linux current source/docs required. | Raw only. |
| Secure Boot | Official UEFI current specification required. | Raw only. |
| OpenPGP | Current OpenPGP standard/source required. | Raw only. |
| Sigstore | Current Sigstore official source/spec required. | Raw only. |
| Wheel RECORD | Python packaging current source/spec required. | Raw only. |

## Collision conclusion

No direct paper collision or novelty clearance is asserted. For all deep lines, no stock-oracle-equivalent union-external atomic action was frozen; search is bounded open rather than a novelty claim.
