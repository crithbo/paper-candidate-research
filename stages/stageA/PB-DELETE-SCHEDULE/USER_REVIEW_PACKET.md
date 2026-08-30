# User Review Packet: PB-DELETE-SCHEDULE

## Decision requested from mainline/user

Accept the candidate-owner recommendation `STOP_RECOMMENDED` for the frozen dependency-frontier checked-deletion scheduling mechanism. Do not authorize Stage B.

## What was actually tested

Thirty complete natural MaxPre-style WCNF traces, each with at least 153 existing checked deletions at minimum. The experiment changed only legal sequential ordering of those existing deletions. Input/output WCNF, objective, deletion set, checker contract, and emitter remained fixed.

## Why this is a scientific STOP

- Scheduling freedom is real: `24/30` traces admit a non-original order accepted by both forced-checked VeriPB and CakePB.
- The candidate is nevertheless slower after full costing:
  - p50 `260.117 ms` versus original `138.997 ms`;
  - p90 `813.385 ms` versus original `422.363 ms`.
- Candidate certificates are not smaller: p50 is 25 bytes larger; p90 is equal.
- No p50/p90 Pareto residual survives against original, stable legal, or greedy earliest-ready controls.
- `240/240` final rows preserve output/objective and pass both checkers; dual replay hashes close.

The result is therefore not a network, toolchain, hardware, license, or verifier failure. It is negative evidence against the frozen mechanism after fair controls and full cost.

## Claim boundary

Safe claim: on this frozen 30-trace natural corpus and this dependency-frontier sequential scheduling rule, scheduling/legality overhead absorbs the candidate and no required full-cost residual remains.

Unsafe claims:

- all checked-deletion scheduling is impossible;
- parallel deletion semantics are invalid;
- a new deletion rule/checker/emitter cannot help;
- unchecked deletion has equal guarantees;
- a paper-level result or Stage B study has been completed.

## Files to inspect

- `STAGEA_REPORT.md` — scientific narrative and scope.
- `RESULTS.md` — exact aggregates and result hashes.
- `CONTROL_MATRIX.md` — same-object and comparator fairness.
- `CORPUS_MANIFEST.json` — 30 complete trace/source/file hashes.
- `FULL_COST_MATRIX.csv` — all 240 replay rows.
- `LEGAL_CHOICE_RESULTS.json` and `FULL_COST_RESULTS.json` — machine-readable results.
- `REPRODUCIBILITY.md` — replay procedure.
- `HASH_MANIFEST.sha256` — delivery closure.

## Authorization state

- `stageb_authorized=false`
- `pending_user_stageb_review=false`
- `stageb_user_approval_id=null`
- no `projects/` write, no GPU, no exclusive device
- lane released as `IDLE_REUSABLE_AWAITING_MAINLINE`
