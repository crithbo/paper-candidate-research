# S6-EGRAPH-LIVEEXTRACT Stage A Revision 1 Report

- Lane id: `MIGRATION_ONEOFF_CANDIDATE_OWNER`
- Assignment id: `S6-EGRAPH-LIVEEXTRACT-STAGEA-REVISION1-20260809`
- Input freeze SHA-256: `da677333b52750b7dab196b867ca6754550ab1a6fd1f40610028676c571cdc89`
- Cross-assignment contamination declaration: false; no other candidate was read or written for this execution.
- Decision: `STOP_RECOMMENDED`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: exact exhaustive negative result on one pinned natural compiler e-graph with target-operation proxy costs and type-valid output sizes.
- Novelty route tested: `N2`
- Stage semantics: real Stage A revision on the highest-risk premise; no Stage B work was performed or authorized.

## Frozen contract

The revision contract was frozen before artifact materialization, implementation, or execution. It fixes the pinned source commit/path/blob/SHA-256, root 7, deterministic SCC-based acyclic projection, e-class semantics, 4-byte scalar and 16-byte four-lane vector outputs, artifact-cost scaling, allocation convention, complete `B=4..136` sweep, two exact sequential controls, the exact joint oracle, strict witness rule, absorption STOP rule, and double replay.

The initial Stage A package was not overwritten. All revision writes are confined to `stages/stageA/S6-EGRAPH-LIVEEXTRACT/revision1/`.

## Headroom or theoretical gap

The initial controlled witness suggested that joint representative selection and recomputation-aware scheduling can dominate both orderings. The unresolved risk was whether this residual survives on a public compiler-generated multi-alternative e-graph with non-synthetic type/cost mapping.

It did not survive on the frozen Diospyros object. Exact enumeration yields a complete absorption partition: the memory-first control is joint-optimal at `B=24..44`, while the runtime-first control is joint-optimal at `B>=48`. Below 24 bytes no extraction is feasible.

## Minimal mechanism and strongest baselines

- Mechanism: exact joint representative selection, materialization/deletion/recomputation, and legal scheduling.
- `RUNTIME_FIRST_THEN_EXACT_SCHEDULE`: unique globally minimum static-cost extraction, followed by exact scheduling under the same B.
- `MEMORY_FIRST_THEN_EXACT_SCHEDULE`: unique minimum one-shot-peak extraction with frozen cost tie-break, followed by exact scheduling under the same B.
- `JOINT_EXACT_ORACLE`: exhaustive ceiling over all 9 natural exact extractions and 34 budgets.

All methods share object, root, closure, information, mapping, action space, B, and exact tie handling.

## Natural workload and mechanism-specific prediction

The workload is Diospyros `simple_vec_add_root_7`, a public compiler-generated equality-saturation artifact for four-lane DSP vectorization. The preregistered prediction was that an intermediate extraction might accept a modest static cost to lower recomputation under a tight B, producing a point unavailable to either order.

Observed: both optimal traces have zero recomputations. Root input simultaneity creates hard 24/48-byte feasibility thresholds, so the two sequential controls already span the exact optimum.

## Highest-risk probe result

- Risk-bearing premise: a bounded same-object residual remains after exact runtime-first and memory-first controls.
- Probe scope: 16 reachable e-classes, 24 retained e-nodes, 9 exact extractions, 34 budgets, and 306 exact schedule queries.
- Result: 0 strict witnesses; every one of 29 feasible joint optima is absorbed by a sequential control.
- Negative-result meaning: the only authorized natural validation falsifies the necessary residual for this candidate's current paper shape.
- Positive-result ceiling: not applicable; result is `NEGATIVE_KILL`, never `MAIN_CLAIM_ESTABLISHED`.

## Directional increment

- Performance/quality/Pareto/complexity effect: no new joint Pareto point. The natural frontier contains the memory-first `(peak=24,cost=2100)` point and runtime-first `(peak=48,cost=1200)` point.
- Why it is not ordinary tuning or a weak-baseline artifact: all three solvers are exact; the negative result is structural on the frozen object and does not depend on optimizer maturity.
- Why it does not qualify as a PASS structural increment: the frozen gate states that sequential absorption is a STOP condition. This object-specific partition does not leave a bounded residual or establish a new general theorem.

## Performance evidence chain

- Algorithm/data-structure change: joint extraction and exact state-space scheduling.
- Intermediate mechanism metric: recomputation count remained zero on both frontier optima.
- End-to-end effect: none beyond the two sequential frontier points.
- Full-cost result: no joint advantage under artifact operation costs; solver time, RSS, projection, and output costs are recorded separately.
- Generality region: exactly this pinned natural acyclic projection and mapping.
- No-gain region: every feasible B in `24..136`; infeasible region `4..20`.

## Current critical-cost analysis

The memory-first extraction builds two scalar 4-byte temporaries and a 16-byte root, giving a 24-byte lower bound and cost 2100. The runtime-first extraction requires two 16-byte vector operands at root emission, giving a 48-byte lower bound and cost 1200. No deletion or recomputation can reduce either root's simultaneous operand/output lower bound. Other source alternatives cost 1300–2400 and require 48 or 64 bytes, so none can open an intermediate strict point.

The cost model is valid only as the pinned Diospyros/extraction-gym target-operation proxy. Measured latency, register spills, caches, and energy remain unavailable, but this limitation cannot rescue a positive claim from the exact negative result.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE`
- Measured ai_core_fraction: `1.00` for the revision's probe-critical planning, parser/oracle implementation, execution, replay, and reporting artifacts; upstream topic selection and user authorization excluded from the denominator.
- Reproducible artifacts: frozen contract, raw source, locked projection, five Python files, two runs, validation JSON, and hash manifest.
- Human-only items: independent Stage A gate judgment and any final archival/status update by mainline.

## Mechanism pivot

None. The exact object, objective, metrics, and sequential controls were unchanged.

## Literature collision update

Cutoff: 2026-08-09. Classification remains `SEARCH_BOUNDED_OPEN`; the negative probe removes any need to assert global novelty.

- FastOpt (OOPSLA 2024, DOI `10.1145/3689801`) is the exact sparse-egraph extraction anchor.
- SmoothE (ASPLOS 2025, DOI `10.1145/3669940.3707262`) and e-boost (ICCAD 2025, DOI `10.1109/ICCAD66269.2025.11240719`) are current scalable extraction baselines.
- Equality Saturation for Optimizing High-Level Julia IR (TACO 2026, DOI `10.1145/3795883`) includes ILP extraction with code reuse and is the closest current compiler-level DAG-cost neighbor.
- Checkmate (MLSys 2020) is the fixed-DAG rematerialization/scheduling anchor.
- Exact Pattern-Aware Extraction (Algorithms 2026, DOI `10.3390/a19050377`) is a latest adjacent extraction objective; Persistent Compiler Abstraction (`arXiv:2602.16707`) and Optimism in Equality Saturation (`arXiv:2511.20782`, PLDI 2026 artifact) affect representation/analysis rather than the tested joint peak-live object.

No checked work supplied a natural strict witness for this exact object. This is not a global absence claim.

## Stage B minimal prototype

Not applicable. The revision terminates the candidate. No Stage B plan, project directory, formal experiment, or device reservation was created.

## Q1/Q2 evidence-gap review

- Comparator file: `REVISION_Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_NOT_PLAUSIBLE`
- Evidence already comparable: pinned natural artifact, exact fair controls, full bounded negative region, double replay.
- Executable Stage B gaps: none authorized; the core contribution residual is absent on the required natural object.
- Human/resource-dependent gaps: none that can reverse the frozen same-object result without changing the object or claim.

## Non-relaxable quality audit

- Same-object: PASS.
- Latest collision: `SEARCH_BOUNDED_OPEN`, honestly bounded.
- Strong fair baselines: PASS, both exact.
- Natural input/evidence: PASS for one public compiler e-graph with 9 exact extractions.
- Full-cost: PASS for the abstract target-operation probe; machine-level claims explicitly excluded.
- Reproducibility: PASS, canonical hash exact and 81/81 schedule replays.
- Evidence/claim honesty: PASS; negative result reported as candidate kill.

## Supported and unsupported claims

Supported: the frozen natural object has a two-region exact absorption boundary and no joint strict witness.

Unsupported: universal sequential optimality, any natural-workload joint benefit, backend speedup, reduced measured memory, Q2/Q1 viability, or paper main claim.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not yet performed; owner recommends STOP.
- User-facing evidence packet: `REVISION_USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: null
- Stage B authorized: false

## Human research reserve

Not applicable. This is a scientific negative result on the authorized object, not an acquisition or authorization failure.

