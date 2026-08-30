# Independent Stage A Gate Report — O4-DYNCACHE-PGM

## Decision

- decision: `REVISE_ONCE`
- structural quality tier: `TIER_A_Q1_POTENTIAL` (conditional; not a readiness verdict)
- current Stage A evidence readiness: `REPRODUCIBLE_BUT_NONDISCRIMINATING_LEAF_PROBE`
- evidence ceiling: exactness and deterministic replay are supported for the frozen leaf-local COW model; the PDEC-specific highest-risk premise remains `UNRESOLVED`
- confidence: `0.92`
- Stage B recommendation now: `NOT_ELIGIBLE`
- `stageb_user_approval_id`: `null`

## Executive finding

The frozen package is coherent, hash-complete and reproducible at the artifact level. Its exhaustive and natural runs support a narrow claim: this particular leaf-local implementation returns exact predecessor/range results on the enumerated states and locked OSM insert/upsert stream, and its output can be reproduced byte-for-byte.

That is not yet a risk-bearing test of the submitted paper mechanism. With page capacity four and `epsilon=1`, every page of at most three keys is automatically feasible; an insertion creates at most five keys, which always admits a `3+2` split. The auxiliary-page, rebuild-slot and page-touch caps then follow directly from the implementation's partition and accounting definitions. No minimal plain COW B+tree leaf or `B+tree + affine hint` control shows that PDEC changes a transition, guarantee, or fully priced metric. The current positive result therefore cannot distinguish a PDEC seed from an ordinary wrapper.

This is suitable for one atomic Stage A revision. It is not a reason to declare that the scalable directory/fence/deferred-credit research program has failed, and it is not a reason to reserve the topic for humans.

## Claim, novelty and same-object audit

The research object is stable across discovery, Stage 0 and the frozen Stage A contract: an exact dynamic ordered index serving predecessor and output-sensitive range queries under updates. The probe honestly narrows the implementation to a single in-memory leaf microkernel and one logical route charge. There is no object drift.

The structural paper hypothesis remains potentially strong: a page-aware error-certified decomposition plus a scalable directory and real deferred rebuild-credit schedule could form a new mechanism, and the proposed Stage B tests are capable of killing it. But the submitted leaf transition is presently observationally compatible with a COW B+tree split policy plus an affine hint. FITing-Tree further shows that deterministic bounded-error piecewise-linear leaf ideas are established prior art. The structural tier can remain conditionally Tier A; the current evidence cannot receive Stage A PASS.

## Decisive evidence and reproducibility

| Check | Finding | Gate effect |
|---|---|---|
| Frozen identity | Mainline-delivered hashes match; candidate manifest is `17/17`. | Pass |
| Determinism | Candidate records a byte-exact rerun and validator output. | Supports artifact reproducibility |
| Exhaustive scope | `1,740` states, `27,840` transitions, `17,400` predecessor and `62,640` range queries, zero reported failures. | Exactness evidence for the frozen local model |
| Natural stream | 651 OSM diff events; 639 effective insert/upserts; 10 deletes are absent-state no-ops. | Natural insert/upsert witness only |
| Cap falsifiability | Under frozen capacity/epsilon/counting, the `4/2/5` caps are implied by construction. | Fails to test mechanism-specific risk |
| Baseline residual | ESA/PGM/ALEX/TLX are source-locked but not run; no minimal COW B+tree leaf absorption control exists. | Atomic Stage A defect |

The reviewer did not rerun the program because the task forbids new research experiments. Static inspection was sufficient to identify the non-discriminating state space; the candidate's own hash and replay records are accepted only for the narrow artifact claim.

## Answers to the requested gate questions

1. **Does the leaf-local transition genuinely attack the highest-risk premise?** Not yet. It checks exact local behavior, but its advertised caps are implied by the frozen small-page construction and it does not rule out a routine COW B+tree wrapper.
2. **May scalable directory/fence/deferred credit remain absent at Stage A?** Yes, as bounded Stage B work, provided Stage A first establishes a non-vacuous mechanism-specific leaf seed. Their absence is not itself the revision trigger.
3. **May effective delete coverage remain absent?** Yes, as an explicit Stage B gap. The natural insert/upsert evidence is real; the ten delete records are correctly disclosed as no-ops and must not be advertised as delete validation. A snapshot-backed effective-delete stream remains a hard precondition for later update/delete claims.
4. **Do unexecuted ESA/PGM/ALEX/B+tree baselines force revision or reserve?** Full-system execution is a Stage B hard gate because Stage A claims no performance win. It does not itself require reserve. However, a minimal same-semantics plain COW B+tree leaf and `B+tree + affine hint` absorption control is required now because mechanism-specificity is the very premise being probed.
5. **Is the remaining route finite and reproducible?** Yes. It has named artifacts, public CPU-compatible implementation steps, explicit failure conditions, full-cost requirements and executable workloads. That preserves conditional structural potential and rules out `HUMAN_RESEARCH_RESERVE` at present.

## Baseline and full-cost audit

Version locks for ESA 2025, PGM-index, ALEX and TLX establish provenance, not fairness or a comparative result. There is no current Pareto, throughput, latency, memory or cache claim, so their non-execution should not be retroactively treated as a failed performance comparison. Before any such claim, Stage B must run them under the same exact object, update/query mix, hardware, build settings and complete resource ledger.

The current `1 logical route` charge is a placeholder, not full cost. Directory traversal, fence maintenance, allocator/reclamation, cache/TLB effects, concurrency/recovery, model rebuild work and real deferred credit are outside the probe. These omissions define the claim ceiling; they do not invalidate the exact leaf-local results.

## Natural evidence and negative region

The locked OSM minute diff is a legitimate natural source for inserts/upserts, but it contains no effective delete because no prior snapshot was loaded. The result therefore supplies no natural delete evidence. Stage B must add a snapshot-backed delete-capable stream and at least one independent natural stream before making robust update/delete claims.

The exhaustive domain is a useful local negative search but not a meaningful cap stress test under the current constants. A revised Stage A probe must make absorption or non-absorption falsifiable; the eventual Stage B evaluation must also expose where directory, credit, cache or update cost loses.

## Q1/equivalent comparator calibration

The candidate's conditional `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP` assessment is defensible only as a structural forecast. ESA 2025, PGM-index, ALEX and HIRE identify a demanding comparator neighborhood, while FITing-Tree and recent learned-index evaluation papers narrow what can count as a new leaf-level contribution. Current evidence readiness is below PASS because none of those gaps is closed by a PDEC-specific local residual. This separation avoids both overpromotion and the incorrect conclusion that unfinished Stage B claims require STOP.

## Non-relaxable hard-gate audit

| Hard gate | Status after frozen Stage A | Required disposition |
|---|---|---|
| Same object and exact semantics | `CLOSED_LOCAL_SCOPE` | Preserve |
| Natural positive evidence | `PARTIAL_INSERT_UPSERT_ONLY` | Effective delete may remain Stage B gap |
| Mechanism-specific residual over fair minimum control | `OPEN_ATOMIC` | Close in Stage A revision |
| Full fair systems baselines | `OPEN` | Stage B hard gate |
| Scalable directory/fence and real deferred credit | `OPEN` | Stage B hard gate unless a bounded piece is needed for non-vacuity |
| Full-cost ledger | `OPEN` | Stage B hard gate |
| Negative region | `OPEN_BEYOND_LOCAL_EXACTNESS` | Revision plus Stage B |
| Latest collision/comparator audit | `BOUNDED_OPEN` | Continue through Stage B |
| Reproducibility | `CLOSED_FOR_FROZEN_LOCAL_ARTIFACT` | Extend with every later component |
| AI executability | `SUPPORTED_CONDITIONAL` | No reserve trigger |

## Single permitted revision gate

`LEAF_LOCAL_NONVACUITY_AND_BTREE_ABSORPTION_GATE`

Under the unchanged exact predecessor/range object and frozen leaf semantics, add a minimal plain COW B+tree leaf and `B+tree + affine hint` control using the same information, capacity, atomic publication semantics and local cost ledger. Statically or exhaustively determine whether they generate the same transitions and caps. Predeclare and exhibit at least one reachable or natural case in which the PDEC certificate changes an admissible state/transition and yields a guarantee or fully priced metric not inherited by either control.

- If such a residual is reproduced, the revision may return for one gate re-review.
- If the controls absorb all current behavior and no bounded same-object residual exists, recommend `STOP`.
- A small two-level fence/credit state is allowed only when needed to make this same atomic non-absorption question meaningful; it must not become an unreviewed full Stage B campaign or a renamed object.
- Do not require all ESA/PGM/ALEX/TLX systems to be built merely to close this revision.

## Finite Stage B route retained, but not authorized

If and only if the atomic Stage A revision passes, the retained Stage B route is: implement scalable directory/fence and real deferred credit/delta state; add snapshot-backed OSM deletes and a second natural stream; execute ESA/PGM/ALEX/TLX controls; account for build, update, query, memory, cache/TLB, allocator/reclamation and rebuild costs; run ablations and formal/proof audit; and publish negative regions. Each item has a named failure mode and can be reproduced on public CPU resources.

This report does **not** recommend `PENDING_USER_STAGEB_REVIEW` yet. No Stage B work is authorized. Even a future independent PASS may only recommend that mainline register `PENDING_USER_STAGEB_REVIEW`; Stage B remains forbidden until the user reviews the per-topic packet and supplies an explicit non-null `stageb_user_approval_id`.
