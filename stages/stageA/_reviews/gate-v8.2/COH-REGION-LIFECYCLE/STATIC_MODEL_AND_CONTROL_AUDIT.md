# Static Model and Control Audit

## Outcome

The 6,912 rows are a reproducible Cartesian sensitivity analysis over two source-locked program structures, but they do not yet constitute a faithful GH200 ATS/NUMA lifecycle probe. The decisive defect is not the absence of GH200 timing. It is an internal comparator identity: the implemented candidate chooses the minimum-cost B0–B3 action independently for every region, which is exactly the declared B4 region-wise union oracle, then adds planner cost.

## Code-level finding

`PROBE_SCRIPT.py::evaluate_program` computes:

1. `region_costs[r][a]` independently for each region and action;
2. `selected[r] = argmin_a region_costs[r][a]`;
3. `oracle_cost = sum_r min_a region_costs[r][a]`;
4. `candidate_cost = oracle_cost + planner_cost`.

There is no HBM-capacity constraint, region-phase DAG constraint, transfer-engine contention, transition coupling, alias constraint, or cross-region decision. Consequently, a same-information simple selector that evaluates the four closed-form costs and takes their per-region `argmin` reproduces every selected action exactly. The candidate has no demonstrated algorithmic residual over that selector; it is the selector/B4 action rule plus overhead.

This is narrower than the Stage 0 object, which explicitly included coupled representation, initializer, and phase materialization subject to capacity and transition constraints. It is repairable only if a Stage A revision restores a predeclared coupling or otherwise demonstrates a nonzero residual over the same-information simple selector.

## What the reported numbers do show

- The two canonical outputs are byte-identical.
- The frozen equations admit heterogeneous per-region minima relative to one uniform B0–B3 policy.
- Pathfinder: 1,032/3,456 positive rows (29.86%), 2,424/3,456 non-positive rows (70.14%), maximum residual 0.113%.
- BFS: 3,118/3,456 positive rows (90.22%), 338/3,456 non-positive rows (9.78%), maximum residual 57.834%.
- B4 absorbs the physical action set in every row by construction; candidate cost is B4 plus planner cost.

These are grid-coverage facts, not probabilities or speedups. They establish only model-internal heterogeneity against uniform policies.

## Why this is not yet same-object GH200 support

- The coefficient grid is not calibrated to the frozen GH200/CUDA/R550 tuple. The candidate itself marks the coefficients uncalibrated.
- `system_access_counter_delay_passes = 4` is applied to both programs and all regions, while the cited GH200 study observes a workload-specific migration evolution for SRAD; the package supplies no derivation that turns it into a universal four-pass law.
- The cost model uses byte counts plus fixed proxies and does not model measured PTE/fault replay, page amplification, overlap, allocator/context effects, measured C2C traffic, or actual migration behavior.
- The one-byte BFS continuation flag is represented as one byte for variable costs despite the frozen 64 KiB system-page object. Fixed overhead partially compensates, but no measured or source-bounded justification shows that the resulting large BFS residual is robust.

Therefore the positive set is partly constructed by freely varied coefficients and the mathematical inequality `sum(min) <= min(sum)`. It attacks a useful structural possibility, but not yet the highest-risk proposition that a nontrivial lifecycle optimizer retains a residual on the frozen GH200 object.

## Required atomic control

Revision gate: `SOURCE_BOUNDED_SAME_INFORMATION_SELECTOR_RESIDUAL`.

Using the same two frozen programs and no GH200 execution, freeze auditable provenance/units for the coefficient domain and add the strongest deployable same-information simple per-region selector. Demonstrate a candidate-only residual after full cost, or report absorption. If the current separable formulation makes the two identical, restore at most one already-declared Stage 0 coupling (for example capacity or phase-transition coupling) without changing object, function, workload, or action set. Absorption after this control is a STOP result.

