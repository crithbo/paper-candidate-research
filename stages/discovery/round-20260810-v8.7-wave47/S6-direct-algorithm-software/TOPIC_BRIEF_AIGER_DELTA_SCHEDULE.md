# AIGER-DELTA-SCHEDULE — Topology-constrained delta-byte scheduling for binary AIGER

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O7`
- Domain tags: logic-synthesis artifacts; binary formats; graph scheduling; compression
- Contribution route: `N2`
- Discovery date: `2026-08-10`
- Discovery method revision: accepted `v2/v8.1` + v8.6 finite-fidelity admission + v8.7 current-upstream reality check

## Research question

For a fixed AND-inverter graph (AIG), fixed inputs/latches/outputs/bad-state properties, and standard binary AIGER reader semantics, can a global topological numbering/schedule of AND nodes reduce the **total variable-length delta bytes** versus current writer orders, without changing the decoded circuit or native validation result?

## Paper genealogy

- Anchor paper/specification: [Biere, *The AIGER And-Inverter Graph Format*](https://fmv.jku.at/papers/Biere-FMV-TR-11-2.pdf).
- Key predecessors: standard AIG construction, rewriting, and AIGER binary encoding.
- Competing artifacts: current [Yosys AIGER backend](https://github.com/YosysHQ/yosys/blob/main/backends/aiger/aiger.cc), current [ABC](https://github.com/berkeley-abc/abc), and the AIGER reference tools/specification.
- Counter-evidence: writers already establish topological validity and may derive a traversal order; they are mandatory same-object baselines.
- Natural carrier: public [Hardware Model Checking Competition](https://hwmcc.github.io/) AIGER benchmarks, plus ordinary synthesized hardware designs.
- Search boundary: original AIGER publication/specification and current official source through `2026-08-10`; direct paper collision for global delta-byte-optimal AIGER scheduling is `SEARCH_BOUNDED_OPEN` and must be independently closed at Stage 0.

## Topic-origin card

- Trigger: binary AIGER writes AND gates in topological order using delta-coded literal fields; changing a legal topological numbering changes byte lengths while the AIG semantics remain fixed.
- Structural cause: a conventional writer traversal makes locally available gate-number assignments, whereas byte cost couples a gate to predecessor labels across the entire DAG.
- Decision variable: a topological bijection from fixed AND nodes to legal AIGER variable IDs, together with a deterministic legal operand orientation when the format permits it.
- Candidate Q1 venue family: formal methods / logic synthesis / EDA; initially Tier B pending collision and natural-artifact evidence.

## Exact object

One fixed AIG with the identical primary input, latch, output, property and AND-node Boolean functions, serialized as a standard binary AIGER artifact that is accepted by native readers/checkers. No logic rewriting, rewriting of the AIG graph, changed I/O order, changed properties, or alternate circuit representation is permitted.

## Named fair baselines

- Deployment/default baseline: Yosys HEAD `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552` `write_aiger` binary output.
- Competitive current baseline: ABC HEAD `6c51a9238544bce6eb300b7b1c3e5bb4215bec84` AIGER writer/reference AIG flow.
- Strong configuration union: Yosys writer default and `-ascii`, `-symbols`, `-map`, and `-zinit` modes where they preserve the frozen binary/object contract; all source-side synthesis/traversal choices that do not alter the AIG are included.
- Optional small offline ceiling: exhaustive legal topological labeling of a bounded witness graph, charged only as a small-object ceiling.

## Mechanism hypothesis

Construct the fixed AIG's precedence DAG. Use an exact bounded-width dynamic program (and, for larger graphs, a specified deterministic approximation with an explicit byte-cost bound/diagnostic) to choose a legal topological schedule that minimizes the sum of encoded AIGER AND-delta byte lengths. Emit the unmodified AIG using that schedule through a native-compatible binary writer.

## Competing mechanisms

- Mechanism A: current writer traversal assigns `aig_map` IDs and creates gates through `mkgate` as the backend processes nodes.
- Mechanism B: full-DAG delta-cost-aware topological scheduling with a complete precedence constraint and byte-cost objective.
- Preferred mechanism and why: B changes the actual assignment/scheduling constructor. It is not a writer flag sweep, a postprocessor that parses/re-emits an already chosen order, nor a logic optimizer.

## Candidate paper claim

For fixed AIG semantics, a complete delta-cost-aware topological scheduling constructor can improve standard binary AIGER artifact size under full writer cost, with no loss of native reader/checker acceptance.

## Software/algorithm performance admissibility

- Same-function contract: identical decoded Boolean circuit interface and AIG graph functions; standard binary AIGER reader/checker acceptance.
- Algorithmic delta: a precedence-constrained byte-cost scheduling/assignment algorithm over the original graph.
- Full-cost ledger scope: graph extraction, schedule computation, native-format emission, output bytes, peak RAM, writer CPU, native parse/check CPU, and any failed schedule.
- Generality hypothesis: benefit requires nontrivial topological freedom and delta-length variation; it should transfer across AIGER hardware artifacts, not depend on one handcrafted graph.
- Why this is not routine tuning: no existing writer parameter represents a complete simultaneous assignment of all AND-node labels against the delta-byte objective.
- Expected no-gain region: chain-like AIGs with essentially unique topological order, or graphs where all legal labels produce the same encoded-length class.

## Nearest-prior facet matrix

| Facet | Candidate | Current writer union | Residual |
|---|---|---|---|
| Problem | Standard binary AIGER writing | Standard binary AIGER writing | Same problem |
| Object | Fixed AIG / I/O / properties | Fixed AIG / I/O / properties | Same object |
| Decision | Whole-DAG label schedule | Traversal-driven labels | Global byte-cost coupling |
| Information | Entire precedence DAG | Same input AIG | No extra oracle |
| Mechanism | Exact bounded DP / specified approximation | Native writer traversal | N2 constructor |
| Guarantee | Native reader/checker semantics | Native reader/checker semantics | No relaxed guarantee |
| Evidence | HWMCC AIGER artifacts | Same artifacts | Same full-cost ledger |

## Current collision classification

- DIRECT_FATAL: no source-level writer action found that exposes the complete global delta-byte scheduling interface; this is not a claim about all papers.
- DIRECT_SUBTRACT: AIGER binary specification, Yosys writer, ABC/reference AIG writer.
- METHODOLOGICAL_ADJACENT: AIG logic rewriting and generic DAG scheduling; rewriting changes the frozen graph, and generic scheduling is not a direct collision unless it optimizes this exact AIGER delta objective under the same constraints.
- DEPLOYMENT_BASELINE: Yosys/ABC current writer paths and the finite writer-option union above.
- SEARCH_BOUNDED_OPEN: independent Stage 0 paper search for AIGER-specific delta-cost scheduling.

## Decisive falsifier

Stop if a minimal AIGER witness fails byte-for-byte semantic/interface equivalence or native reader/checker acceptance; if the current writer/configuration union reproduces the same schedule/action; or if the completed constructor has no full-cost size Pareto point on a predeclared natural HWMCC stratum. A raw byte-count result that omits schedule CPU or native validation cannot support a claim.

## Executable evidence path

### Current upstream reality check, when the action gap depends on implementation absence

- Checked current upstream commit/tag and date: Yosys `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552`; ABC `6c51a9238544bce6eb300b7b1c3e5bb4215bec84`; checked `2026-08-10`.
- Official current documentation location: [Yosys `write_aiger` source](https://github.com/YosysHQ/yosys/blob/main/backends/aiger/aiger.cc), [ABC upstream](https://github.com/berkeley-abc/abc), and the AIGER specification.
- Actual source symbols/paths: Yosys `backends/aiger/aiger.cc`: `AigerWriter`, `aig_map`, and `mkgate`; the writer assigns gates through this native map/emission path.
- Default and non-default flags/thresholds/configurations checked: `-ascii`, `-symbols`, `-map`, and `-zinit`; these control representation/metadata/init handling, not a global binary delta-byte topological-scheduling interface.
- Evidence supporting the action distinction: the checked map/gate path assigns IDs during writer traversal; no checked flag requests a full-DAG precedence-constrained byte-cost optimization.
- Contrary evidence and disposition: current writers may choose traversal orders with incidental compression effects. They remain the strong union. The claim is only a finite source-level action hypothesis, subject to independent Stage 0 collision review.
- Why the residual is outside the current native mechanism and a fair finite configuration grid: the candidate accepts a complete DAG and returns a coupled label assignment; varying existing writer options does not expose that decision variable.

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Complete atomic action and action interface: input fixed AIG precedence DAG; output a legal topological AND-node labeling and operand orientation, minimizing/approximating an explicitly defined AIGER delta-byte objective; native-compatible binary emission follows.
- Real comparator and native reader/checker semantics: frozen Yosys and ABC writers; AIGER reference/native parser plus structural I/O/property comparison.
- Same-object/same-function/guarantee boundary: same AIG, interface/properties and binary AIGER reader semantics; no AIG rewriting, property simplification, output-order changes, alternate codec, or semantic approximation.
- Common denominator and full-cost dimensions: schedule/writer CPU, peak RAM, file bytes, native parse/check CPU, graph-extraction cost and failures.
- Small pre-corpus legality/equivalence witness: a six-AND fork/join AIG with two legal topological orders that produce different delta-length totals; enumerate legal orders, emit both, and verify identical reader-decoded interface/truth tables.
- Finite closure steps and required resources: implement a small DP over the witness; pin writer source/options; validate with native reader; then evaluate a predeclared HWMCC AIGER subset with a finite baseline grid.
- Structural failure condition: if native format requires a unique equivalent label order, current writer union emits the exact DP action, any decoded circuit/property differs, or no legal schedule meets the stated objective, STOP before a claim-bearing run.
- Reminder: this is a Stage A preflight plan, not evidence of a main result.

### 72-hour first evidence

First gate is the six-AND enumerated witness and native reader/checker. The limited natural gate is a frozen HWMCC AIGER subset compared with the current Yosys/ABC union, charging all construction/validation cost. Fail closed on any semantic mismatch, source-action replay, or no full-cost size Pareto point.

## Q1/Q2 sufficiency hypothesis

- Why this supports at least a complete Q2 paper: it is a same-format, same-semantics global N2 scheduling algorithm with a formally checkable reader contract, natural public artifact route, and finite falsifier.
- Why it remains Tier B: impact is restricted to AIGER artifacts until direct collision and multi-stratum benefit are shown.
- What Stage B would still require: independent paper collision closure, several natural design families, schedule-complexity/approximation analysis, writer-CPU/bytes/read-time accounting, and independently reproduced artifact validation.

## Non-relaxable quality audit

- Same-object: fixed AIG semantics and standard binary AIGER reader contract.
- Latest collision: `SEARCH_BOUNDED_OPEN`, explicitly passed to Stage 0.
- Strong fair baselines: current Yosys, current ABC/reference paths and writer-option union.
- Natural input/evidence: public HWMCC AIGER artifacts.
- Full-cost: scheduling, emitting, bytes, RAM and validation are common denominators.
- Reproducibility: commits, options, witness and corpus subset are frozen.
- Evidence/claim honesty: no implementation or measured result is claimed.
