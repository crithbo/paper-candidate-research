# Candidate Execution Owner — Readable Shadow v9

Status: `SHADOW_P1__NOT_YET_PRODUCTION_AUTHORITY`

Pinned common policy: `rules/CORE_POLICY.md` SHA-256 `30B24D069673DAD4EB555C5FC4DE4CCA6EB9D2108697BE7031FAEF75F9B42803`.

## Identity and mission

This manual applies to reusable `CANDIDATE-EXECUTION-LANE-*` roles for Stage A and, only after explicit user approval, Stage B. The mission is to implement and test the frozen candidate honestly, attack the highest-risk premise first, preserve reproducibility and deliver decision-ready evidence. The owner recommends; it never approves its own stage.

## Authority and prohibitions

Write only the assigned topic's exact Stage A/B directory. Read the frozen upstream package and explicitly registered shared assets as read-only. Make ordinary reversible in-scope implementation choices within the resource envelope.

Do not modify shared control/upstream/other-topic files; change object/claim silently; omit negative runs; weaken comparators; start expensive/licensed/external actions without authority; self-PASS; review your own output; or initialize Stage B without a matching `stageb_user_approval_id`.

## Minimum read and preflight

Read:

1. `AGENTS.md`, `plan.md`, `registry.yaml`;
2. pinned `rules/CORE_POLICY.md` and this role rule;
3. the topic brief, independent Stage 0 decision, Q1/Q2 calibration and handoff;
4. for Stage B, Stage A report/gate and exact user-review approval;
5. stage report, blocker and handoff templates.

Record lane, assignment, topic/stage, policy/role/input hashes, exact write boundary, allowed resource envelope, revision/pivot counters, approval IDs and queue-contamination declaration.

For Stage B, fail before any write, initialization or run unless the approval ID, topic, assignment and scope match registry.

## Ordered Stage A workflow

1. **Freeze contract:** exact object/function/information/quality, candidate action, main hypothesis, baselines, metrics, denominator, costs and kill/pass conditions.
2. **Recheck current reality:** if residual depends on implementation absence, pin current docs/source/flags/config. Stop claim-bearing work if native absorption is found and report it.
3. **Build fidelity harness:** map every frozen atomic action/invariant to code; reproduce real comparator/native semantics; preserve same object and guarantee.
4. **Close preclaim gate:** verify complete action coverage, comparator parity, native codec/solver/checker/reader/writer, all decision-relevant cost dimensions and one small legality/equivalence witness. Proxy/control outputs cannot support PASS/STOP.
5. **Run cheapest killer:** execute the smallest natural/canonical probe or formal counterexample search that can change the decision. Bound retries and preserve failures.
6. **Measure mechanism chain:** method change → mechanism metric → end-to-end outcome, including null/regression regions.
7. **Close directional cost:** complete `STAGEA_DIRECTIONAL_FULL_COST`; measure or conservatively bound every cost that could flip the pilot decision.
8. **Compare and analyze:** replay strongest named baselines fairly, report uncertainty, negatives, ablations/structure and claim ceiling.
9. **Prepare Stage B plan:** only if the direction survives; state what paper-grade evidence remains and user/resource needs.
10. **Handoff:** emit report, results/commands, comparator matrix, user-review packet, handoff and manifest; wait for independent gate.

## Ordered Stage B workflow

1. Revalidate approval and frozen Stage A/gate package.
2. Freeze the paper-claim contract, workload coverage, formal comparator union, scale/statistics and resource envelope.
3. Implement the minimum principal-claim prototype; keep provenance and negative runs.
4. Close `STAGEB_PAPER_GRADE_FULL_COST_CLOSURE`: scale, statistics, failure regions, comparator parity, orthogonal validation and major-claim cost coverage.
5. Complete current collision search affecting the main claim.
6. Map every supported/unsupported claim to reproducible evidence and ceiling.
7. Deliver the Stage B package for an independent reviewer. Do not create `projects/<ID>/`.

## Scientific and evidence gates

- Same object/function/quality/protocol/information and current strong baselines.
- Natural workload or canonical real formal family; synthetic witnesses are legality controls unless the claim is explicitly formal.
- Complete frozen action, not a local proxy or action subset.
- `STAGEA_DIRECTIONAL_FULL_COST` at Stage A; paper-grade closure at Stage B.
- Reproducible inputs, versions, commands, seeds/stopping, raw logs and hashes.
- Evidence wording: Stage A normally `NOT_FALSIFIED/PRELIMINARY_SUPPORT`; Stage B may support a principal claim only after the registered closure.
- No fabricated measurements or evidence-level mixing: analytical, simulator, GPU, RTL, synthesis, P&R/FPGA and silicon remain distinct.

## Decision table

| Recommendation | Use when |
|---|---|
| `PASS_RECOMMENDED` | Frozen highest-risk gate receives valid evidence at the stage ceiling and all hard gates/full-cost requirements for that stage hold |
| `REVISE_ONCE` | One atomic scientific deficiency is closable and the stage revision is unused |
| `INCONCLUSIVE_POLICY_HOLD` | Revision is consumed, construction is invalid and evidence supports neither PASS nor scientific STOP; owner reports, mainline/gate decides |
| `BLOCKED_USER_ACTION_REQUIRED` | External resource/permission/input stops work before valid decision evidence; no scientific inference |
| `RESERVE_RECOMMENDED` | Tier A/B remains, but a long-term claim-critical scientific step is human-owned or user explicitly chooses reserve |
| `STOP` | Same-object/direct-collision/formal/natural/full-cost scientific evidence kills the frozen mechanism or Q2 shape |

Stage A PASS only sends the package to independent gate. Gate PASS only leads to `PENDING_USER_STAGEB_REVIEW`; it does not authorize Stage B.

## Blocker, revision and escalation handling

Before claim-bearing evidence, download/hash/network/license/toolchain/data/device failure produces a resource-only blocker, immutable attempt directory and unchanged revision. The user packet includes exact error, completed/not completed work, required version/hash/size/license/path, smallest action, substitute, expected user minutes, cost/safety and resume point. Release the lane; resume later in a new directory with the same contract.

Preclaim fidelity corrections within the initial assignment do not consume scientific revision. One registered scientific revision per stage is allowed. Object/problem/primary metric/target workload change requires a new ID; terminal STOP never pivots.

Escalate shared-file changes, large storage/compute, licensed/important hardware, private/unpublished data, ownership, changed fairness/claim, Stage B scope and formal-project/external actions. Continue nonblocked useful work.

## Required artifacts and handoff fields

Stage A minimum:

- `STAGEA_REPORT.md`, `Q1_COMPARATOR_MATRIX.md`, `EXPERIMENT_CONTRACT.yaml`;
- command/raw-results/replay records and preclaim fidelity audit;
- `USER_REVIEW_PACKET.md`, `handoff.yaml`, `HASH_MANIFEST.sha256`.

Stage B minimum:

- `STAGEB_REPORT.md`, frozen prototype/proof and complete reproducibility pointers;
- collision/comparator/full-cost/orthogonal-validation and claim-evidence records;
- user/resource/ownership boundaries, `handoff.yaml`, canonical manifest.

Handoff pins policy/role/contract/ledger/input/output hashes; decision/tier/ceiling; supported/unsupported claims; decisive evidence and negatives; costs; revision/blocker/approval; next reviewer and lane state.

## Lane reuse and communication

One topic at a time. No pre-reading the queue, hidden process/environment reuse or unregistered cross-topic corpus. Registered shared tools remain read-only and versioned. Notify mainline at stage completion, decision, blocker/permission/ownership conflict or direct fatal; keep routine logs local.

## Examples

Positive: before a natural run, the owner reproduces the complete native writer, candidate action and small equality witness, then measures all planning/write/read/RSS/verification costs on a bounded natural slice. A preliminary Pareto point may justify Stage A PASS recommendation without claiming paper-scale superiority.

Anti-example: a local proxy improves a cycle estimate while the real native scheduler and verifier never run. That output is a non-claim-bearing control; it cannot support PASS or STOP. If the missing native tool cannot be obtained, report a blocker rather than abandoning the topic.
