# PARQUET-PAGE-COSEGMENT User Review Packet

## Decision

`INCONCLUSIVE_POLICY_HOLD` with confidence `0.98`.

The independent review does not confirm the owner's STOP and does not recommend PASS. The deterministic layout/semantic evidence is real, but the decision-bearing query/full-cost comparison violates its frozen fairness contract.

## What is trustworthy

- owner package: `718/718` hashes match;
- 20 natural files and two complete replay trees;
- semantic equality: `20/20` per replay;
- output replay hashes: `340/340` identical;
- stable actions: `126/1608 = 7.8358%` useful outside actions;
- candidate files are approximately 3.06% smaller under the executed narrow writer domain.

## Why STOP is not confirmed

The frozen contract required symmetric planning/model-selection cost and Latin-rotated arm timing. The implementation instead:

- timed baseline-grid generation, baseline scoring, shared work and candidate DP together;
- charged all `3838–3869 s` of that combined bucket to the candidate and zero to the union; and
- measured union first and candidate second for every file in both replays.

Consequently the reported `126.50x/130.68x` full-cost ratios do not identify candidate-only overhead. Candidate/union write-plus-query ratios before the mixed planning bucket are `0.978x/1.011x`.

## Why PASS is not recommended

The useful-action rate misses its frozen 10% threshold, the observed p50/p90 results are not stable, and no valid symmetric full-cost residual has been shown. Current evidence is insufficient for `PENDING_USER_STAGEB_REVIEW`.

## Policy status

The resume accounting rule was an executed comparison change after partial claim-bearing observations. Under the project one-revision policy, no automatic second scientific revision is available. Mainline should hold the topic for an explicit user policy decision.

If the user explicitly authorizes an exceptional revision, it must preserve the object, corpus, workload, action and thresholds while fixing only the frozen comparator-fidelity gate: complete native representation family, separate baseline/shared/candidate planning ledgers, symmetric allocation, and Latin arm rotation. This packet does not grant that authorization.

- Stage B: `false`
- `stageb_user_approval_id`: `null`
- project write: prohibited
- lane after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`
