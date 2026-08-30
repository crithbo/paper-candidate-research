# Source and collision matrix — Wave334

| Line | Official/primary source | Immutable current union / falsifier | Result |
|---|---|---|---|
| APEX | [AOSP APEX format](https://source.android.com/docs/core/ota/apex), [APK Signature Scheme v3.2](https://source.android.com/docs/security/features/apksigning/v3-2) | APEX signing binds package representation; stock verification/mount is the same-object oracle. Repack/re-sign/verifier replacement changes contract. | NOT_ADMITTED_UNFROZEN. |
| TCG event log | [TCG RIM](https://trustedcomputinggroup.org/resource/tcg-pc-client-reference-integrity-manifest-specification/), [TCG canonical event log](https://trustedcomputinggroup.org/wp-content/uploads/TCG_Canonical-Event-Log-Format_v1.1_pub.pdf), [TCG FIM](https://trustedcomputinggroup.org/wp-content/uploads/TCG_PC_Client-FIM_v1r24_3feb20.pdf) | Ordered events/digests, PCR extension and verifier replay/RIM comparison are attestation semantics. | NOT_ADMITTED_UNFROZEN. |
| Falsification control | [Oracle jarsigner](https://docs.oracle.com/en/java/javase/26/docs/specs/man/jarsigner.html) | Whole-manifest hash is an already documented verification optimization. | Excluded: existing union action, not a candidate. |

## Collision conclusion

No direct paper collision or novelty clearance is claimed. The two retained lines fail before collision clearance because no union-external stock-equivalent atomic action is frozen; current source enumeration remains a finite follow-up route.
