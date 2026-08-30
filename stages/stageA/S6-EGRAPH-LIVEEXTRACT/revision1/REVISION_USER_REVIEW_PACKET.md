# S6-EGRAPH-LIVEEXTRACT Revision 1 User Review Packet

## Owner recommendation

`STOP_RECOMMENDED`

This was the only authorized revision. It used a pinned public Diospyros compiler e-graph with 9 exact reachable extractions, target-operation costs from the artifact, four-lane output sizes, and identical B/information/action space for both sequential controls and the joint oracle.

## Decisive result

| B region | Exact joint optimum | Consequence |
|---|---|---|
| 4–20 B | infeasible | no valid extraction |
| 24–44 B | identical to memory-first, cost 2100 / peak 24 | absorbed |
| 48–136 B | identical to runtime-first, cost 1200 / peak 48 | absorbed |

- Natural exact extractions: 9
- Feasible budget points: 29
- Strict non-dominated witnesses: 0
- Feasible joint points absorbed by a sequential control: 29/29
- Recomputations in both frontier traces: 0
- Double-replay canonical SHA-256: `90adbdefb2ede0797366f125e839e0cacc7b3ee5b670fa417ab8ae90aa37c82c`
- Schedule replay checks: 81/81, zero violations

The controlled witness from the initial Stage A package is not promoted: the required natural object does not reproduce its residual. Trying another object or changing the size mapping after seeing this outcome would violate the one-revision frozen gate.

## Claim honesty

The supported claim is only that this pinned natural object is exactly absorbed by the two sequential controls over the complete frozen B sweep. It does not prove universal absorption.

The candidate no longer has a defensible Q2 paper shape under the non-relaxable natural-evidence and same-object rules. This is a scientific STOP, not a resource reserve.

## Authorization state

- Independent gate: not yet performed
- `PENDING_USER_STAGEB_REVIEW`: no
- `stageb_user_approval_id`: null
- Stage B authorized: false
- Stage B work performed: none

## Files to inspect

- `REVISION_STAGEA_REPORT.md`: complete decision and quality audit
- `REVISION_RESULTS.md`: exact regions, costs, traces, and full-cost ledger
- `REVISION_EXPERIMENT_CONTRACT.yaml`: preregistered atomic gate
- `results/validation.json`: machine-readable replay and reproducibility audit
- `HASH_MANIFEST.sha256`: byte-integrity manifest

