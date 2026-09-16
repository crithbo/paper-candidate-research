# PB-DELETE-SCHEDULE — Independent Stage 0 Confirmation

- Assignment: `STAGE0-C1-20260809-PB-DELETE-SCHEDULE-CONFIRM-V8.4`
- Role/mode: `STAGE0-CONFIRMATION-SENTRY`
- Review cutoff: 2026-08-09
- Scope: frozen Discovery and PRIMARY materials plus verification of their already-cited first-party sources. No trace collection, schedule construction, proof generation, benchmarking, download, Stage A/B, or mechanism/object change was performed.

## Input integrity

- Discovery manifest: **4/4** artifacts independently recomputed and matched.
- PRIMARY manifest: **4/4** artifacts independently recomputed and matched.
- Provenance/file conflict: none observed.

## Verdict

**`CONFIRM`** — PRIMARY's `PASS_RECOMMENDED / TIER_B_Q2_VIABLE` is confirmed as a conditional Stage 0 paper-potential decision.

- Structural potential if the stated hypothesis succeeds: `TIER_B_Q2_VIABLE`.
- Current evidence readiness: `MODERATE_FINITE_CPU_ROUTE`.
- Contribution route: `N2_NEW_ALGORITHM_OR_OPTIMIZATION`.
- AI route: `AI_CORE_EXECUTABLE` for extractor, dependency index, proof replay, and full-cost accounting; independent formal review remains required for any later invariant claim.
- `DIRECT_FATAL`: not established.
- Stage A/B, experiment, revision, or mainline-status authorization: **none**.

This is not a result PASS. It establishes neither the occurrence of 30 qualifying traces nor a legal-choice rate, schedule, theorem, checker result, or cost improvement.

## Fixed exact object

The object is reproducibly closed at the required Stage 0 level: a fixed natural MaxPre-style WCNF preprocessing trace; its existing checked core deletions and rederivation obligations; a fixed transformed output WCNF and objective; and the unchanged VeriPB/CakePB equioptimality contract. The permitted output is only a legal ordered partition and proof plan for the **same deletion set**. Input/output WCNF, objective, transform trace, and certificate guarantee cannot change.

This is not generic proof compression, a checker/UI wrapper, a new deletion rule, an arbitrary VeriPB scheduling claim, or unchecked deletion. A candidate implementation must compare canonical input/output/objective representations and independent checker acceptance, not merely compare emitted text.

## N2 residual versus rule/checker prior work

The original IJCAR paper establishes end-to-end certified MaxSAT preprocessing and explains that core deletion requires rederivation from the remaining core. The current VeriPB format specifies the checked-deletion rule and, crucially, specifies ordered semantics for multiple deletions: for `C, D`, it checks `C` against `C \ {C}` and then `D` against `C \ {C,D}`. This confirms that deletion order is semantic and that `delc` already provides syntax for a list of deletions.

That source does **not** provide a constructor that, on a fixed preprocessor trace, maintains live rederivation dependencies, selects a low-cost legal next deletion, or solves an order/partition problem under an executable cost objective. The candidate can therefore retain a narrow N2 only as:

> a dependency-frontier algorithm that constructs a lower-cost legal **ordered** partition of existing checked-deletion obligations, while retaining the exact certificate contract.

“Batch” must never be described as simultaneous deletion or new VeriPB semantics. Each batch is serialized in its emitted order and is legal only if every member's existing checked-deletion obligation is valid against the core resulting from its predecessors. If the implementation only permutes logged lines without this live-core dependency/cost algorithm and schedule invariant, it is an emitter wrapper and the N2 claim fails.

## Fair same-information baselines

The PRIMARY baseline set is confirmed, with these necessary meanings:

1. **Trace order:** unmodified MaxPre proof emission and current VeriPB/CakePB checking.
2. **Stable legal order:** among currently legal existing deletions, choose a fixed trace/constraint-ID tie-break; no cost-aware scheduling objective.
3. **Greedy legal order:** among the same current legal frontier and same causally available data, apply a declared simple earliest-ready rule; it must not be strengthened by the candidate's retained-witness/cost optimizer.
4. **Exact small-trace search:** a time-unbounded ceiling only, with its solve time reported separately.
5. **Unchecked deletion:** explicitly weaker-guarantee reference only. PB25 confirms that unchecked mode can be faster, but it does not preserve the checked-mode contract without additional final substantiation; it cannot be treated as an equal-quality winner.

The trace/stable/greedy comparisons preserve the same trace, deletion set, output/objective, rule set, checker version, and online information. They are finite implementations, not a hypothetical union. Every comparison must include dependency-index construction/maintenance, witness discovery and elaboration, proof bytes, checker CPU, preprocessing CPU, peak RSS, disk I/O, timeouts, and fallback behavior.

## Finite and honest Stage A killer

`FREEZE_AT_LEAST_30_NATURAL_TRACES_WITH_AT_LEAST_2_CHECKED_DELETIONS__STOP_IF_LEGAL_CHOICE_RATE_LT_20_PERCENT_OR_EQUIVALENCE_FAILS_OR_P50_P90_FULL_COST_HAS_NO_PARETO_ADVANTAGE` is a finite, discriminating CPU probe.

Its execution contract must freeze: MaxPre/VeriPB/CakePB commits; natural source/WCNF/output/proof hashes; canonical trace extraction; the same-deletion-set mapping; and a concrete p50/p90 full-cost dominance predicate. It must first replay the baseline unchanged, then produce legal candidates and checker-verify them. The pre-registered failure conditions are scientific: fewer than 20% legal choice opportunity, any output/objective/checker mismatch, or no p50/p90 end-to-end Pareto residual after proof-byte/RSS/index costs.

A non-falsifying result is only `NOT_FALSIFIED / PRELIMINARY_SUPPORT`; it does not prove the paper's core contribution. Failure to obtain the public artifacts later would be a `BLOCKED_USER_ACTION_REQUIRED` evidence problem, not a scientific STOP and not a license to use synthetic dependency graphs as natural evidence.

## Source-verification record

The following primary/upstream sources were checked for the scope stated above:

- [Certified MaxSAT Preprocessing, IJCAR 2024](https://link.springer.com/chapter/10.1007/978-3-031-63498-7_24): formal end-to-end proof checking for equioptimal MaxSAT preprocessing; core deletion requires rederivation from the remaining core.
- [VeriPB proof-format overview](https://gitlab.com/MIAOresearch/software/VeriPB/-/raw/HEAD/proof_format_overview.md): checked deletion guarantees the strong output contracts, and a multi-deletion list is checked in its stated order; it supplies a rule/checker, not a schedule constructor.
- [PB Competition 2025 official rules](https://www.cril.univ-artois.fr/PB25/): unchecked deletion can improve speed but weakens the directly checked contract; confirmed as a different-guarantee reference.

The collision classification remains `SEARCH_BOUNDED_OPEN_WITH_DIRECT_RULE_AND_CHECKER_SUBTRACTORS`: no reviewed first-party source jointly covers the fixed-trace order/partition constructor, same contract, full-cost result, and principal claim. This is not a global novelty assertion.

## Handoff boundary

No atomic revision is needed: the conditional object, N2 boundary, finite natural evidence route, and strong baselines are already specified. Stage A must enforce the ordered—not parallel—meaning of batching and independently review the schedule invariant. The sentry now returns to `IDLE_REUSABLE_AWAITING_MAINLINE`.