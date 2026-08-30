# WEBGRAPH-REFERENCE-FOREST Stage A Report

- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `STAGEA-L1-20260810-WEBGRAPH-REFERENCE-FOREST-INITIAL-V8.7`
- Input freeze SHA-256: decisive report `E99137221AB044BAFFF26F634EAF2CA9E787B44FD6CB0BB60E1890693619989D`; handoff `64D0E33509CC22DBAD67276CFA193B212934BCFFB6D5DC8EE8F66F5B33FB399C`; manifest self `AA9C965999B885FEAF95367C2B20C10C05934061F6ECBDCC341EBDECBF22314B`
- Cross-assignment contamination declaration: `false`
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` conditionally retained
- Evidence ceiling: `PRELIMINARY_NATIVE_SIZE_SUPPORT__NO_FULL_COST_DOMINANCE__RANDOM_ACCESS_REGRESSION__TWO_NATURAL_GRAPHS_ONLY`
- Novelty route: `N2`
- Stage semantics: a bounded real pilot of the highest-risk premise; no paper main claim is established.

## Pre-claim contract fidelity gate

- Gate status: `PASS`
- Frozen atomic action mapping: `BvCompZ::push` supplies every root/nonempty in-window predecessor and exact native `reference_costs`; candidate `select_exact_complete_references` enumerates those actions with depth-frontier state.
- Comparator audit: released final `BvCompZ` best-parent forest → bounded-depth DP → greedy refill is executed before candidate selection on the same action table; a separately built baseline tree executes its unchanged writer.
- Native parity: released `Compressor`, estimator, encoder, offsets/properties writer, BE codes, sequential reader and random reader remain identical. The only shared portability edit changes an invalid Windows macro doc comment into an ordinary comment.
- Metric parity: both tracks use exact `u64` graph-stream bits, common output bytes, end-to-end process time/CPU/RSS and the same reader workloads.
- Full-cost collection: audit tables record states/transitions/actions; process wrappers record elapsed/CPU/peak RSS; filesystem inventory records graph/offset/property/EF bytes; repeated reader bench records p50/p90.
- Small witness: 38,372-forest independent exhaustive equality, native writer assertions and all readers passed.
- Non-claim-bearing failures retained: sandbox transport failures, compile-only portability/import corrections and the missing-EF preclaim attempt.
- Claim-bearing run started only after PASS: `true`.

## Frozen contract

Exact input is the fixed ordered successor-list graph. Output is native BE BVGraph stream/offsets/properties with Gamma/Unary/Gamma/Gamma/Zeta(3), interval threshold 4, `W=4`, `D=3`, chunk 128. A legal action is root or any nonempty in-window predecessor that keeps chain depth at most three. Cost is the released native estimator's exact graph-stream bit delta; the candidate exactly minimizes their additive sum. No vertex reorder, new format, timing oracle, parameter scan, controller or reader change is allowed.

## Headroom and algorithmic gap

Released `BvCompZ` restricts its bounded-depth DP to one strict local-best parent per list, then greedily refills from all legal edges. It states no complete-action optimality guarantee. The candidate's depth frontier is sufficient because future nodes can reference only the last `W` lists, and prior choices affect future legality only through their depths. The exact recurrence runs in `O(n(W+1)(D+1)^W)` time for fixed `W,D` and returns the complete legal-action optimum.

Stage A closes the previous empirical unknown: complete-action headroom is not merely abstract. It occurs in 531/2,048 frozen native structural cases and most chunks of both frozen natural graphs.

## Minimal mechanism and strongest baseline

The mechanism is a direct exact frontier DP, not an oracle wrapper. The strongest equal-information baseline is the complete final released WebGraph 0.6.2 `BvCompZ` pipeline, not `BvComp`, a prefix, or an envelope. Exhaustive enumeration appears only on the nine-node correctness witness. Candidate and baseline receive the same lists, codes, costs, `W/D/chunk`, writer and readers.

## Natural workload and prediction

The frozen prediction was that alternative parents discarded by the best-parent forest can avoid later depth conflicts, producing strict native stream and persisted payload savings. LAW cnr-2000 uses published native vertex order; SNAP Wiki-Vote uses ascending published integer IDs with exact duplicate removal and preserved self-loops (the source contains neither duplicates nor self-loops after parsing).

The decisive text mentioned GIST, but GIST is a vector corpus rather than a published ordered web graph. Constructing a k-NN graph from it would introduce an unfrozen graph-construction object. Stage A therefore did not silently change the object and used the two preregistered natural graph carriers.

## Highest-risk probe result

- Risk-bearing premise: final `BvCompZ` leaves strict, native-realizable, useful complete-action headroom.
- Scope: full 2,048-case nonadaptive structural domain followed by exactly two frozen natural graphs.
- Negative-result meaning: no non-tie divergence, no persisted natural residual, or complete full-cost absorption would falsify the narrow mechanism.
- Result: structural and persistent size premises pass; the frozen no-regression full-cost premise fails.
- Positive-result ceiling: `PRELIMINARY_SUPPORT` for native size only; overall Stage A disposition is `NOT_FALSIFIED / REVISE_ONCE`, never `MAIN_CLAIM_ESTABLISHED`.

## Directional increment

The candidate saves 555,755 bits and 72,793 persisted native payload bytes on cnr-2000, and 948 bits / 135 bytes on Wiki-Vote. It is not ordinary tuning: settings and cost tables are identical, selected actions differ, exhaustive exactness is checked, and final BvCompZ is the comparator.

The increment is not a full-cost win. Candidate process elapsed is 104.67×/13.04× baseline and peak RSS is higher. Ten post-warmup reader repeats show random-list p50 regression of 9.37% and 4.21%, with equal semantics/checksums.

## Performance evidence chain

- Algorithm change: complete legal-edge depth-frontier DP.
- Intermediate mechanism metric: 531 structural divergences; 2,053/2,544 and 54/56 strict natural chunks.
- End-to-end effect: 4.897% and 0.114% native payload reductions.
- Full-cost result: mixed/failed under the preregistered no-worse-other-dimensions rule.
- Generality region: one natural web crawl and one independent directed social network under one small fixed `W,D` setting.
- Regression region: planning implementation clones vectors through a `BTreeMap`; construction and random access regress on both graphs.

## Current critical-cost analysis

The mathematical state bound is small at `W=4,D=3`, but the audit implementation retains full reference vectors in every ordered-map state. On cnr-2000 it executes 59,904,395 states and 227,321,923 transitions and spends 46.86 CPU-s versus 0.47 CPU-s for BvCompZ. This is an implementation-level opportunity that can be tested without changing the optimum: dense base-4 state IDs, rolling arrays and compact backpointers.

Random-access regression is not automatically an implementation artifact: the exact size optimum can choose different/deeper references. A legitimate revision may alter only the secondary tie-break among equal-bit optima; it cannot hide the tradeoff, change the primary objective or train on reader timings.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE_WITH_PUBLIC_CPU_ARTIFACTS`.
- Measured ai_core_fraction: `0.95` for this Stage A package; source acquisition, implementation, experiment, validation and reporting are reproducible without manual scientific intervention.
- Reproducible artifacts: frozen crate/tool/data hashes, portable toolchain, baseline/candidate source copies, harnesses, generators, raw audits, outputs, scripts and manifests.
- Human-only items: editorial judgment on whether the size/build/access tradeoff warrants the one scientific revision and later Stage B resources.

## Mechanism pivot

Not used. Scientific `REVISE_ONCE` remains unconsumed.

## Literature collision update

Current upstream reality is pinned to WebGraph/WebGraph CLI 0.6.2/0.4.2 packaged VCS SHA `6b230673fd8f09ee31e81f09b921671678804de2`. Source paths inspected include `bvcompz.rs`, `flags.rs`, compressor/writer and reader modules. The broad “global forest” claim remains directly absorbed by BvCompZ/Zuckerli. The narrow residual survives: released source has no complete-action optimum guarantee, and Stage A now exhibits native output differences. Latest paper collision remains `SEARCH_BOUNDED_OPEN`; this pilot did not promote it to a complete novelty search.

## Stage B minimal prototype

Stage B is not requested or authorized. If and only if a revision and independent gate later pass, a minimal prototype would use a dense/compact exact DP, a larger preregistered family of published ordered graphs, matched W/D strata, full native writers/readers, robust access statistics and an updated primary-paper collision search. Candidate venue family remains compressed data structures/graph systems.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: WebGraph (WWW 2004), Zuckerli (IEEE Access 2020), Laconic (PVLDB 2024), current Rust WebGraph (WebConf Companion 2024).
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`.
- Evidence comparable now: same-object native implementation, strongest current baseline, exact small oracle, two natural graphs, writer/reader integrity and full cost.
- Executable gap: same-optimum dense implementation, exact-optimal access-aware tie-break, more natural graph breadth and robust statistics.
- Human/resource gap: none for the one bounded revision; user approval is still mandatory for Stage B.

## Non-relaxable quality audit

- Same-object: PASS.
- Latest collision: `SEARCH_BOUNDED_OPEN`; narrow current-source residual checked, full literature closure pending.
- Strong fair baseline: PASS.
- Natural input/evidence: PASS for limited Stage A breadth.
- Full-cost: measured and honest; acceptance FAIL due build/RSS/access regressions.
- Reproducibility: PASS for this pilot.
- Evidence/claim honesty: PASS; size support is separated from optimizer speed/full-cost claims.

## Supported and unsupported claims

Supported: the frozen complete-action DP exactly solves the native graph-stream objective; final BvCompZ is not complete-action optimal on many native fixtures/chunks; both natural graphs have persisted size residual under fixed settings; native semantics remain exact.

Unsupported: optimizer speedup, memory improvement, access nonregression, full-cost dominance, default-W/D practicality, broad corpus generality, complete novelty, Q1 readiness, paper main claim or Stage B readiness.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: pending; request gate review of this `REVISE_ONCE` recommendation.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B user approval id/time: `null`.
- Stage B authorized: `false`.

## User-action blocker

Not applicable. The frozen official LAW/SNAP resources closed after in-scope transport corrections. Exact transport errors and accepted bytes are in `RESOURCE_AND_COST_LEDGER.md`.
