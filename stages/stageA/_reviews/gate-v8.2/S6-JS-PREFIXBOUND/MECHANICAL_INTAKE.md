# Mechanical Intake — S6-JS-PREFIXBOUND

## Frozen identity

| Item | Mainline-delivered SHA256 | Reviewer recomputation | Result |
|---|---|---|---|
| `handoff.yaml` | `7E5F1C6B76714F3817DD348B1C57A70D6EFFCF9E9EC795E5D6F242E3FE7404F8` | same | MATCH |
| `STAGEA_REPORT.md` | `A749F827226B0AEEC98D4A6440FF6AE2E817794052DEA387FEB582EE2D174586` | same | MATCH |
| `USER_REVIEW_PACKET.md` | `501133E294EFE1124A6F377E2CF650A5BEFBA78D63AE32674F8F87C345384EFD` | same | MATCH |

- Candidate manifest recomputation: `13/13 MATCH`.
- Frozen topic identity: `S6-JS-PREFIXBOUND` throughout the handoff.
- Candidate authority: `STAGEA_COMPLETE__STAGEB_FORBIDDEN_PENDING_INDEPENDENT_GATE_AND_EXPLICIT_USER_APPROVAL`.
- Candidate `pending_user_stageb_review`: `false`.
- Candidate `stageb_user_approval_id`: `null`.
- Mechanical intake: `ACCEPTED_FOR_SUBSTANTIVE_REVIEW`.

## Review activity boundary

The reviewer read only this frozen package and its minimal S6 discovery/Stage 0 lineage. The review performed hash recomputation, static code/result inspection, and independent bibliographic/source checks. It did not execute the probe, modify candidate/upstream/mainline files, inspect another pending candidate, or start Stage B.

## Reproducibility classification

`HASH_AND_STRUCTURE_VERIFIED`.

The owner-provided primary and controlled replay JSONs match after the supplied validator's normalization. Reviewer replay was not authorized. The validator removes the entire `full_cost` object rather than only the three listed volatile timing/allocation fields, so the stronger label `VERIFIED_REPLAY` is not assigned by this gate.
