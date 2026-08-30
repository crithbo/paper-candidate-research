# User approval — bounded V8.8-R3R1 calibration

## Verbatim approval

> 批准这一次 bounded R3R1，同时继续并行开展改善后的选题discover，审查和推进工作，还是要求到出现三个stageA通过的选题

## Frozen mainline interpretation

- Approval ID: `V8_8-R3R1-BOUNDED-CALIBRATION-20260810`.
- The approved scope is exactly the bounded option in `RULE_CHANGE_PROPOSAL.md`: contract/schema/key alignment plus one new ten-case blind holdout.
- Limits: exactly 10 new target families; 30–34 complete primary artifacts; public-source network acquisition at most 50 MiB; temporary plus sealed storage at most 100 MiB; 20 executor case-runs; no candidate or native experiment; no system installation or global-environment mutation.
- Reuse the existing long-lived PACKER, EXECUTOR and AUDITOR lanes in strict serial order. No role combination and no per-backtest one-off task.
- Old C01–C18 remain immutable development/diagnostic evidence and are excluded from the R3R1 executor input, scoring and PASS denominator.
- Any primary-threshold failure, contamination unknown, scoreability mismatch, hash/boundary failure, or failure to assemble ten qualified independent cases after bounded selection ends this v8.8 lineage. No automatic R3R2, repack, replay, shadow or production cutover.
- A pre-seal resource-only acquisition failure remains a recoverable blocker with no scientific inference and does not authorize weaker substitute sources.
- Even if R3R1 passes, production rule changes still require the separately frozen downstream gate and exact-patch approval path; this approval alone does not activate v8.8 or R7 production behavior.
- In parallel, the standing scientific goal remains three total independent Stage A PASS results. Existing long-lived Discovery, Stage0, candidate and gate lanes continue under their currently authoritative frozen rules; Stage B still requires per-topic user review.

## Safety invariants

Q2 minimum, Q1 priority, same-object, latest collision, fair current strong baseline, natural evidence, full-cost, reproducibility, evidence honesty, STOP non-revival, blocker semantics and every user Stage B/formal-project gate remain unchanged.
