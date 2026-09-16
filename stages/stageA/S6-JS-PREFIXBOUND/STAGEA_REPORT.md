# S6-JS-PREFIXBOUND Stage A Report

- Decision: `PASS_RECOMMENDED`
- Quality tier: `TIER_A_Q1_POTENTIAL`
- Evidence ceiling: `FINITE_ENUMERATION_AND_NATURAL_STRUCTURE_PRELIMINARY_SUPPORT`
- Novelty route: `N2`
- Stage semantics: real pilot research on the highest-risk premise; PASS is not completion of the paper main claim.

## Frozen contract

`EXPERIMENT_CONTRACT.yaml` was written before input retrieval, implementation, or probe execution. It freezes the DPomega-level merge-join JS object, connected bushy trees without Cartesian products, legal merge-key permutations, partial-sort segment cost, final `Omega`, exact baseline, metrics, full-cost fields, commands, deterministic enumeration, and STOP conditions. Stage B remains unauthorized.

## Headroom or theoretical gap

DPomega restores optimal substructure through Ω-valid edge cuts but does not expose the candidate's future-demand-indexed quotient. The finite exact baseline contained 404,450 order states; the candidate quotient contained 389,750, a 3.63% aggregate reduction. JOB 4a's natural join structure reduced 29 states to 24 (17.24%). This is state headroom only, not an optimizer speedup.

## Minimal mechanism and strongest baselines

The minimal mechanism is `Sigma_S(o)`, a vector of longest common prefixes and corresponding partial-sort costs against every legal first future merge demand. Equality of this vector makes the first transition cost identical; the chosen demand then overwrites the old output order. The candidate quotient keeps the minimum `g` per signature.

Baselines are: (1) independently executed exact order-state DP under identical information/cost; (2) DPomega's authoritative paper definition as mandatory same-object baseline, without claiming source reproduction; (3) a naive final-`Omega` prefix quotient as ablation; and (4) the order-free exact completion relaxation used in the bound.

## Natural workload and mechanism-specific prediction

Pinned JOB 4a supplies a five-relation natural SQL join graph and equivalence classes. Prediction: when distinct current orders are indistinguishable to all cross-boundary merge demands, signature classes reduce states without changing the exact optimum. Result: 29→24 states, 44→41 transitions, identical proxy-cost optimum. Cardinalities/NDVs are proxies, so this is not natural performance evidence.

## Highest-risk probe result

- Risk-bearing premise: a prefix signature can preserve every legal future continuation, and `max(join relaxation, unavoidable-sort relaxation)` is admissible.
- Probe/counterexample-search scope: all 19,440 connected labeled 3–4 relation/two-attribute instances plus pinned JOB 4a structure; 404,479 reachable-state bound checks; exact vs independent quotient DP.
- Negative-result meaning: the naive `lcp(o,Omega)` signature is decisively false (69,920 formal and 6 JOB-structure witnesses). A viable signature must index all legal next demands.
- Positive-result ceiling: `PRELIMINARY_SUPPORT`; never `MAIN_CLAIM_ESTABLISHED`.

The future-demand signature had zero enumerated counterexamples, zero exact-optimum mismatches, and zero bound overestimates. Deterministic scientific fields matched on replay.

## Directional increment

- Performance/quality/Pareto/complexity effect: 3.63% aggregate state reduction, 0.38% transition reduction, and 17.24% state reduction on JOB 4a structure at identical finite optimum.
- Why it is not ordinary tuning or a weak-baseline artifact: the action changes the exact state equivalence relation; the executable comparator is a complete same-model exact order-state DP, not a heuristic or parameter variant.

## Performance evidence chain, if applicable

- Algorithm/data-structure change: order states → future-demand prefix/cost signature classes.
- Intermediate mechanism metric: exact states/classes and exact/quotient transitions.
- End-to-end effect: no optimizer runtime or query runtime effect claimed.
- Full-cost result: primary 224.914 s / 221.922 CPU s / 2.19 MB tracked Python allocations; controlled replay 274.631 s / 270.703 CPU s / identical peak. Signature construction and exact bound-oracle cost are included.
- Generality region: instances where multiple produced orders induce identical costs for every legal future demand; observed in 9,404/19,440 formal instances and JOB 4a.
- No-gain or regression region: 10,036/19,440 formal instances had no state reduction; transition reduction was only 0.38%, so overhead can dominate.

## Current critical-cost analysis

The signature is presently a full demand-cost fingerprint. Constructing it can scale with the number/permutations of cross-cut key sets, while state savings are modest in this scope. The tested `h_join` is an exact relaxed completion oracle and therefore verifies admissibility but is not yet a cheap online heuristic. A paper requires a compact representation or amortized precomputation whose full cost remains below saved DP/A* work.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE`
- Measured ai_core_fraction: `0.818` (9 of 11 preregistered Stage A work units: formalization, exact DP, quotient DP, generator, signature counterexample search, bound oracle, JOB parser, execution, replay/validation; two remaining human/independent units are proof audit and DPomega fidelity audit).
- Reproducible commands/artifacts: `run_probe.py`, `validate_results.py`, frozen contract, pinned input, both JSON results, replay validation, command log, hash manifest.
- Human-only items: independent theorem review; confirmation that an implementation matches all DPomega paper/code details; any later PostgreSQL engineering/ownership decision.

## Mechanism pivot, if used

No `MECHANISM_PIVOT` was used. The upstream had not fixed a concrete signature. Formalization selected the strongest natural candidate consistent with “order-prefix future-equivalence” and separately falsified the weaker final-`Omega` interpretation.

## Literature collision update

- [DPomega](https://doi.org/10.1007/s00778-025-00906-y): `DIRECT_SUBTRACT` and mandatory same-object baseline; it owns Ω-condition exact JS DP and already reports optimizer time/memory.
- [Haffner–Dittrich](https://doi.org/10.1145/3588927): `DIRECT_SUBTRACT` for plain-join shortest-path/A*, not Ω join+sort.
- [DPconv](https://doi.org/10.1145/3698809): `DIRECT_SUBTRACT` for plain-join subset convolution and bounded cost functions, not order-property state.
- [Luo et al. ICDT 2026](https://doi.org/10.4230/LIPIcs.ICDT.2026.17): `METHODOLOGICAL_ADJACENT`; it optimizes Yannakakis-style acyclic join trees, a different execution object.

Search cutoff is 2026-08-09. No direct fatal same-object prefix quotient/bound was found within the bounded search; status remains `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`, not a global novelty claim.

## Stage B minimal prototype

- Primary workload: DPomega-compatible JOB/TPC-DS query set with frozen real cardinality/statistics and an algorithm-level DPomega reconstruction.
- Required orthogonal validation: symbolic proof/model-check cross-validation plus controlled SYN/SYN-S topology sweep; report state/time/RAM, signature/bound precompute/cache, priority queue, and all no-gain cases.
- Candidate Q1 venue family: SIGMOD/PACMMOD, VLDB/PVLDB, ICDE; PODS only with sufficient theorem depth.

This is a plan only. No Stage B execution is authorized.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: DPomega (2025), Haffner–Dittrich (2023), DPconv (2024), Luo et al. (ICDT 2026).
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Evidence already comparable: exact-object formulation, executable exact ceiling, algorithmic quotient, explicit counterexample search, deterministic artifact, failure/no-gain reporting.
- Executable Stage B gaps: full theorem; compact signature; cheap bound; DPomega fidelity; natural full-cost workload suite; ablations and scale.
- Human/resource-dependent gaps: independent proof/fidelity review and any later DBMS integration authorization.

## Non-relaxable quality audit

- Same-object: merge-join JS core, bushy connected plan space, costs, legal orders and optimum were held fixed within the formal model; natural probe changes only input structure, not function.
- Latest collision: bounded update through 2026-08-09; remains open and must close before any main claim.
- Strong fair baselines: exact same-model DP executed; DPomega remains mandatory but only authoritatively checked, not falsely claimed reproduced.
- Natural input/evidence: JOB 4a structure is natural; cost evidence is proxy and labeled as such.
- Full-cost: runtime, CPU, tracked allocations, transitions, states, signature constructions, bound checks, input retrieval, and failed replay attempt are reported.
- Reproducibility: frozen contract, pinned commit/hash, deterministic primary/replay exact scientific-field match.
- Evidence/claim honesty: finite non-falsification is not a theorem; no speedup, DBMS, natural-cardinality, or main-claim language is used.

## Supported and unsupported claims

Supported: naive final-`Omega` prefixing is unsafe; the future-demand fingerprint was not falsified in scope; finite optimum preservation and admissibility checks passed; state reduction exists with broad no-gain regions.

Unsupported: unbounded theorem, signature minimality/cheapness, asymptotic improvement, DPomega code parity, optimizer time/RAM advantage, query runtime, natural-cardinality performance, and global novelty.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: pending; owner cannot decide it.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no (mainline may set only after independent Stage A gate PASS)
- Stage B user approval id/time: null until explicit approval
- Stage B authorized: false

## Human research reserve, if applicable

Not recommended at this stage. The decisive Stage A core was AI-executable; independent proof and fidelity review remain mandatory later checks.

