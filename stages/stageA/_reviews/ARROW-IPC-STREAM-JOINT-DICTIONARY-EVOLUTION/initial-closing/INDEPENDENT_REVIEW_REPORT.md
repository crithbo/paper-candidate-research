# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION Stage A Independent Gate Review

- Review lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-INITIAL-CLOSING-V8.7`
- Owner assignment id: `STAGEA-L1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-INITIAL-V8.7`
- Review date: `2026-08-11`
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` (conditional structural potential; no Stage A support yet)
- Confidence: `0.99`
- Evidence ceiling: `IMPLEMENTATION_FIDELITY_FAILURE__NO_NATURAL_SUPPORT_OR_STOP_INFERENCE`
- Pre-claim contract fidelity gate disposition: `FAIL_CLOSED`
- Stage B authorized: `false`
- `stageb_user_approval_id`: `null`
- Cross-assignment contamination: `false`

## Executive judgment

The frozen implementation does not satisfy its own exactness contract. At natural window 12 (zero-based diagnostic `window_index=11`), the explicit product oracle and RP-FDP have the same Pareto cost frontier at every reported difference boundary and the same final optimum and final plan signature, but different deterministic intermediate backpointer signatures at boundaries 10, 13, 14, 15, and 16. The first difference at boundary 10 selects cuts `[0,4,10]` in the product oracle and `[0,9,10]` in RP-FDP at the same cost `(123,41,3)` for two current states.

That is a real fidelity failure because the frozen guarantee is not merely equality of final scalar cost. It requires equality of every-boundary finite frontier and deterministic backpointer reconstruction. Final-cost and final-signature agreement cannot be substituted for full backpointer exactness.

The failure does not establish that the proposed factorization is scientifically false. The diagnostic retains identical cost frontiers at every difference point and the same final optimum/signature, so it localizes a signature-sensitive pruning error rather than a mechanism-level negative result. The only defensible decision is one bounded scientific `REVISE_ONCE`: make component dominance/deduplication statewise signature-aware, pass two equal-cost cut-tie adversaries under both delta semantics, then rerun the unchanged preregistered 40-window/full-cost/replay2 killer. No revision is executed or authorized by this review.

## Input and independence audit

At assignment start, the frozen control inputs matched the supplied hashes:

| Input | Frozen SHA-256 |
|---|---|
| `plan.md` | `D9B86D52D296E69DE992F0389A25E77DD23F585EB48CD271F1CE93EA2C993290` |
| `registry.yaml` | `D618D58EFBC12C9AA274382ABC5CFDD5CC96BE2E26B6FEE119F4EBD1684A387D` |
| `rules/ROLE_STAGEA_REVIEW.md` | `7403DD87FD0091BA836F782EE215AFDFB231BB5AFBF37570571B09EC524E94A8` |
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` |
| `academic-research-suite/SKILL.md` | `A6C2F5A569EB005C24A841103CE32E602221F31AE42F10AF302EEC67B12D3F4F` |

Mainline shared control files advanced after the assignment freeze. Those later bytes were not treated as scientific authority for this closing review. The role rule remained hash-identical.

The owner manifest was independently parsed and recomputed before scientific review: `1090/1090` entries matched, `0` mismatches, covering `242,039,248` bytes. Manifest self SHA-256 was `0AFDCDC2CFC956D374E696575AE301050A01DB2DB54645C6051FF360308709A3`.

Key owner inputs also matched:

| Artifact | SHA-256 |
|---|---|
| `STAGEA_REPORT.md` | `5FE257D80C5571C07C9016545A7D649279417EE7F02FF5879326024A817011C3` |
| `RESULTS.md` | `5E147AE81537505A8EEC03CB2B461487D93DCF70496A09F7F14FC13AB39DF6B9` |
| `handoff.yaml` | `116DC6395F2E35C6119C7C1560BAB148528FED8693870EFABE29351D811D4D13` |
| `USER_REVIEW_PACKET.md` | `356CCE1012015317F93B6C4F861C1E5AB0407717DF99703EBCB459844C6CF908` |
| `EXPERIMENT_CONTRACT.yaml` | `EF1286412421F8AEE3E5FE6C0322DA1FE268D829B3B0C32CCD4D932F83E6A37C` |
| `PRE_CLAIM_CONTRACT_FIDELITY_GATE.md` | `429CA0B2D88FD60457759D39F54DB197183F4683D2A70727170FF57F7E3A5357` |

The reviewer did not participate in owner execution, did not read other candidates as evidence, did not modify owner/shared files, and did not run a new candidate experiment.

## Claim and object fidelity

The research object remains coherent: fixed ordered categorical rows and flat dictionary schema, standard Arrow IPC stream, pinned native writer/reader semantics, unchanged schema/row order/decoded values/nulls, complete native cut/dictionary actions, and both delta-disabled replacement and delta-enabled equality/prefix/replacement branches. The observed failure is within that same object; it is not caused by changing codec, reader, writer, denominator, or corpus.

The decisive claim is exact representation of the explicit product value function together with exact deterministic plan recovery. Stage 0 explicitly required comparison at every tiny boundary, current state, frontier point, and backpointer plan, not only the final optimum. Consequently:

- equal final bytes/cost is insufficient;
- equal final selected signature is insufficient;
- equal cost-only Pareto frontiers at intermediate boundaries are insufficient;
- an intermediate deterministic signature mismatch is a contract failure even if it later reconverges.

## Root-cause audit

Static inspection identifies a narrow implementation defect in `scripts/preclaim.py`:

1. `pareto()` retains the lexicographically smaller plan signature for equal label cost.
2. `Component.signature` contains cuts, alpha, and local maps.
3. `component_dominates()` materializes components but tests only whether another component supplies an equal or cost-dominating label; it ignores the corresponding deterministic plan signature.
4. `prune_components()` fingerprints each current state using only sorted costs and resolves equal fingerprints using the component-level signature.

Component-level signature order is not equivalent to statewise order of the fully materialized plan signature. The implementation can therefore discard the statewise lexicographically correct equal-cost history. This exactly explains the boundary-10 mismatch without requiring a failure of min-plus cost factorization.

## Decisive evidence audit

Independent read-only recomputation of the frozen 16-row diagnostic reproduced:

- difference boundaries: `[10,13,14,15,16]`;
- all reported difference-boundary cost frontiers equal: `true`;
- final static cost equal: `true`;
- final signature equal: `true`;
- final cost: `(96,53,2)`;
- explicit-product labels/transitions: `10,562/10,562`;
- RP-FDP maximum `R`: `3`;
- RP-FDP local transition evaluations: `16,211`;
- RP-FDP labels created: `19,871`;
- RP-FDP dominance checks: `559`;
- estimated backpointer bytes: `37,553`.

The owner stopped after 11 completed natural windows and before counting the twelfth. The completed partial results are descriptive only: 0/11 strict compression, 0/11 useful compression, provisional full-cost residual on 1/11, incomplete carrier coverage, and no independent replay2. They cannot satisfy the frozen natural or full-cost success rules and also cannot support a scientific STOP because the solver fidelity gate failed first.

## Baseline and full-cost audit

The frozen strongest union is appropriately demanding: current native caller/writer cut-dictionary grid under both delta arms, complete independent-field frontiers plus exact shared-cut reoptimization, explicit Cartesian product where feasible, and a generic exact-product control. The full-cost ledger includes stream framing/metadata/padding, construction/index remap, planner wall/CPU/RSS/temp/states/transitions/dominance/backpointers, writer, reader, validation, failed search, and fallback.

No comparison against this union is yet claim-ready. The partial 11-window ledger neither proves candidate residual nor absorption. Baseline fairness is therefore not the reason for revision; exactness is.

## Revision classification and budget

The earlier change that excluded batch grouping from a validation digest occurred before the first claim-bearing natural observation and was a non-scientific fidelity correction. The proposed dominance/deduplication change is different. Eleven natural windows had already been observed before the backpointer defect was discovered. Altering which equal-cost histories survive after those observations changes the claim-critical algorithm and may change its measured rank and cost. It is therefore a **scientific Stage A revision**, not another preclaim metadata/fidelity correction.

At this closing review, `scientific_revision_consumed=false` because no corrected solver has been frozen and executed. The revision is consumed at the first execution of the corrected signature-aware solver on any preclaim adversary or natural input. It may not later be relabelled as non-scientific.

## Frozen single revision gate

The only permitted revision is `STATEWISE_SIGNATURE_AWARE_COMPONENT_DOMINANCE_AND_DEDUP_EXACTNESS_GATE`, defined canonically in `REVISION_GATE.md`.

In short, only dominance/deduplication and its exactness tests may change. Fingerprints and dominance must preserve the complete statewise Pareto relation over `(cost, deterministic full plan signature)`. Two equal-cost cut-tie adversaries—one delta-disabled and one delta-enabled—must agree with the explicit product oracle at every boundary. After that gate, the exact original 40 windows, both delta arms, natural `R`, full-cost ledger, strongest union, and replay2 killer must run unchanged from scratch.

## Q1/Q2 sufficiency judgment

- Clear problem: yes.
- Non-trivial contribution: conditionally yes; exact output-sensitive factorization is not routine tuning.
- Credible current evidence: no Stage A support; fidelity failure only.
- Executable formal-experiment gap: yes, one finite atomic revision.
- Reviewer-recognizable narrative: conditional Tier B if exactness, natural compression, full-cost residual, and replay survive.
- Q1 parity: not currently plausible.

`BELOW_Q2_STOP` is not justified because there is no mechanism-level absorption or negative result. `CONFIRM_PASS` is not justified because exactness failed and the 40-window/full-cost/replay gates are incomplete. `BLOCKED_USER_ACTION_REQUIRED` is inapplicable because no resource failure prevents the bounded correction. `INCONCLUSIVE_POLICY_HOLD` is inapplicable because the Stage A scientific revision remains available and the correction is finite and atomic.

## Scope and authority boundary

This decision preserves only conditional structural Tier B potential for the frozen RP-FDP mechanism. It provides no natural-support claim, no performance claim, no general Arrow superiority claim, and no Stage B authorization. Mainline alone may freeze a revision assignment. Even a later gate PASS could only recommend `PENDING_USER_STAGEB_REVIEW`; `stageb_user_approval_id` remains `null`.

Lane post-handoff state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
